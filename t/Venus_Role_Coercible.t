package main;

use 5.018;

use strict;
use warnings;

use lib 't/lib';

use Test::More;
use Test::Venus;

my $test = test(__FILE__);

=name

Venus::Role::Coercible

=cut

$test->for('name');

=tagline

Coercible Role

=cut

$test->for('tagline');

=abstract

Coercible Role for Perl 5

=cut

$test->for('abstract');

=includes

method: coerce
method: coercion

=cut

$test->for('includes');

=synopsis

  package Person;

  use Venus::Class;

  with 'Venus::Role::Coercible';

  has 'name';

  has 'father';
  has 'mother';
  has 'siblings';

  sub coerce {
    {
      father => 'Person',
      mother => 'Person',
      name => 'Venus/String',
      siblings => 'Person',
    }
  }

  sub coerce_name {
    my ($self, $code, @args) = @_;

    return $self->$code(@args);
  }

  sub coerce_siblings {
    my ($self, $code, $class, $value) = @_;

    return [map $self->$code($class, $_), @$value];
  }

  package main;

  my $person = Person->new(
    name => 'me',
    father => {name => 'father'},
    mother => {name => 'mother'},
    siblings => [{name => 'brother'}, {name => 'sister'}],
  );

  # $person
  # bless({...}, 'Person')

  # $person->name
  # bless({...}, 'Venus::String')

  # $person->father
  # bless({...}, 'Person')

  # $person->mother
  # bless({...}, 'Person')

  # $person->siblings
  # [bless({...}, 'Person'), bless({...}, 'Person'), ...]

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;

  # $person
  ok $result->isa('Person');
  ok $result->does('Venus::Role::Coercible');

  # $person->name
  ok $result->name->isa('Venus::String');

  # $person->father
  ok $result->father->isa('Person');
  ok $result->father->does('Venus::Role::Coercible');
  ok $result->father->name('Venus::String');

  # $person->mother
  ok $result->mother->isa('Person');
  ok $result->mother->does('Venus::Role::Coercible');
  ok $result->mother->name('Venus::String');

  # $person->siblings
  ok ref($result->siblings) eq 'ARRAY';
  ok $result->siblings->[0]->isa('Person');
  ok $result->siblings->[0]->does('Venus::Role::Coercible');
  ok $result->siblings->[0]->name('Venus::String');
  ok $result->siblings->[1]->isa('Person');
  ok $result->siblings->[1]->does('Venus::Role::Coercible');
  ok $result->siblings->[1]->name('Venus::String');

  $result
});

=description

This package modifies the consuming package and provides methods for hooking
into object construction and coercing arguments into objects and values.

=cut

$test->for('description');

=method coerce

The coerce method, if defined, is called during object construction, or by the
L</coercion> method, and returns key/value pairs where the keys map to class
attributes (or input parameters) and the values are L<Venus::Space> compatible
package names.

=signature coerce

  coerce() (HashRef)

=metadata coerce

{
  since => '0.01',
}

=example-1 coerce

  package main;

  my $person = Person->new(
    name => 'me',
  );

  my $coerce = $person->coerce;

  # {
  #   father   => "Person",
  #   mother   => "Person",
  #   name     => "Venus/String",
  #   siblings => "Person",
  # }

=cut

$test->for('example', 1, 'coerce', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, {
    father   => "Person",
    mother   => "Person",
    name     => "Venus/String",
    siblings => "Person",
  };

  $result
});

=method coercion

The coercion method is called automatically during object construction but can
be called manually as well, and is passed a hashref to coerce and return.

=signature coercion

  coercion(HashRef $data) (HashRef)

=metadata coercion

{
  since => '0.01',
}

=example-1 coercion

  package main;

  my $person = Person->new;

  my $coercion = $person->coercion({
    name => 'me',
  });

  # $coercion
  # {...}

  # $coercion->{name}
  # bless({...}, 'Venus::String')

  # $coercion->{father}
  # undef

  # $coercion->{mother}
  # undef

  # $coercion->{siblings}
  # undef

=cut

$test->for('example', 1, 'coercion', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;

  # $result
  ok ref($result) eq 'HASH';

  # $result->{name}
  ok $result->{name}->isa('Venus::String');

  # $result->{father}
  ok !defined $result->{father};

  # $result->{mother}
  ok !defined $result->{mother};

  # $result->{siblings}
  ok !defined $result->{siblings};

  $result
});

=example-2 coercion

  package main;

  my $person = Person->new;

  my $coercion = $person->coercion({
    name => 'me',
    mother => {name => 'mother'},
    siblings => [{name => 'brother'}, {name => 'sister'}],
  });

  # $coercion
  # {...}

  # $coercion->{name}
  # bless({...}, 'Venus::String')

  # $coercion->{father}
  # undef

  # $coercion->{mother}
  # bless({...}, 'Person')

  # $coercion->{siblings}
  # [bless({...}, 'Person'), bless({...}, 'Person'), ...]

=cut

$test->for('example', 2, 'coercion', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;

  # $result
  ok ref($result) eq 'HASH';

  # $result->{name}
  ok $result->{name}->isa('Venus::String');

  # $result->{father}
  ok !defined $result->{father};

  # $result->{mother}
  ok $result->{mother}->isa('Person');
  ok $result->{mother}->does('Venus::Role::Coercible');
  ok $result->{mother}->name('Venus::String');

  # $result->siblings
  ok ref($result->{siblings}) eq 'ARRAY';
  ok $result->{siblings}->[0]->isa('Person');
  ok $result->{siblings}->[0]->does('Venus::Role::Coercible');
  ok $result->{siblings}->[0]->name('Venus::String');
  ok $result->{siblings}->[1]->isa('Person');
  ok $result->{siblings}->[1]->does('Venus::Role::Coercible');
  ok $result->{siblings}->[1]->name('Venus::String');

  $result
});

=license

Copyright (C) 2021, Cpanery

Read the L<"license"|https://github.com/cpanery/venus/blob/master/LICENSE> file.

=cut

=authors

Cpanery, C<cpanery@cpan.org>

=cut

# END

$test->render('lib/Venus/Role/Coercible.pod') if $ENV{RENDER};

ok 1 and done_testing;
