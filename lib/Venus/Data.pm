package Venus::Data;

use 5.018;

use strict;
use warnings;

use Moo;

extends 'Venus::Path';

# ATTRIBUTES

has from => (
  is => 'rw',
);

has stag => (
  is => 'rw',
);

has etag => (
  is => 'rw',
);

# BUILDERS

sub build_self {
  my ($self, $data) = @_;

  return $self->docs;
};

# METHODS

sub count {
  my ($self, $data) = @_;

  my @result = ($self->search($data));

  return scalar @result;
}

sub data {
  my ($self) = @_;

  my $data = $self->read;

  $data = (split(/^__END__/m, (split(/^__DATA__/m, $data))[1] || ''))[0] || '';

  $data =~ s/^\s+|\s+$//g;

  return $data;
}

sub docs {
  my ($self) = @_;

  $self->stag('=');
  $self->etag('=cut');
  $self->from('read');

  return $self;
}

sub explode {
  my ($self) = @_;

  my $from = $self->from;
  my $data = $self->$from;
  my $stag = $self->stag;
  my $etag = $self->etag;

  my @chunks = split /^(?:\@$stag|$stag)\s*(.+?)\s*\r?\n/m, ($data . "\n");

  shift @chunks;

  my $items = [];

  while (my ($meta, $data) = splice @chunks, 0, 2) {
    next unless $meta && $data;
    next unless $meta ne $etag;

    my @info = split /\s/, $meta, 2;
    my ($list, $name) = @info == 2 ? @info : (undef, @info);

    $data =~ s/(\r?\n)\+$stag/$1$stag/g; # auto-escape nested syntax
    $data = [split /\r?\n\r?\n/, $data];

    my $item = {name => $name, data => $data, index => @$items + 1, list => $list};

    push @$items, $item;
  }

  return $items;
}

sub find {
  my ($self, $list, $name) = @_;

  return $self->search({list => $list, name => $name});
}

sub search {
  my ($self, $data) = @_;

  $data //= {};

  my $exploded = $self->explode;

  return wantarray ? (@$exploded) : $exploded if !keys %$data;

  my @result;

  my $sought = {map +($_, 1), keys %$data};

  for my $item (sort {$a->{index} <=> $b->{index}} @$exploded) {
    my $found = {};

    my $text;
    if ($text = $data->{data}) {
      $text = ref($text) eq 'Regexp' ? $text : qr/^$text$/;
      $found->{data} = 1 if "@{$item->{data}}" =~ $text;
    }

    my $index;
    if ($index = $data->{index}) {
      $index = ref($index) eq 'Regexp' ? $index : qr/^$index$/;
      $found->{index} = 1 if $item->{index} =~ $index;
    }

    my $list;
    if ($list = $data->{list}) {
      $list = (ref($list) eq 'Regexp' ? $list : qr/^$list$/);
      $found->{list} = 1 if defined $item->{list} && $item->{list} =~ $list;
    }
    else {
      $found->{list} = 1 if (exists $data->{list} && !defined $data->{list})
        && !defined $item->{list};
    }

    my $name;
    if ($name = $data->{name}) {
      $name = ref($name) eq 'Regexp' ? $name : qr/^$name$/;
      $found->{name} = 1 if $item->{name} =~ $name;
    }

    if (not(grep(not(defined($found->{$_})), keys(%$sought)))) {
      push @result, $item;
    }
  }

  return wantarray ? (@result) : \@result;
}

sub text {
  my ($self) = @_;

  $self->stag('@@ ');
  $self->etag('@@ end');
  $self->from('data');

  return $self;
}

1;
