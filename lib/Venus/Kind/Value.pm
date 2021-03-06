package Venus::Kind::Value;

use 5.018;

use strict;
use warnings;

use Moo;

extends 'Venus::Kind';

with 'Venus::Role::Buildable';
with 'Venus::Role::Accessible';
with 'Venus::Role::Explainable';
with 'Venus::Role::Pluggable';
with 'Venus::Role::Valuable';

# METHODS

sub cast {
  my ($self, @args) = @_;

  require Venus::Type;

  my $value = $self->can('value') ? $self->value : $self;

  return Venus::Type->new(value => $value)->cast(@args);
}

sub defined {
  my ($self) = @_;

  return int(CORE::defined($self->get));
}

sub explain {
  my ($self) = @_;

  return $self->get;
}

sub TO_JSON {
  my ($self) = @_;

  return $self->get;
}

1;
