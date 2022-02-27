package main;

use 5.018;

use strict;
use warnings;

use lib 't/lib';

use Test::More;
use Test::Venus;

my $test = test(__FILE__);

=name

Venus::Hash

=cut

$test->for('name');

=tagline

Hash Class

=cut

$test->for('tagline');

=abstract

Hash Class for Perl 5

=cut

$test->for('abstract');

=includes

method: all
method: any
method: count
method: default
method: delete
method: each
method: empty
method: eq
method: exists
method: find
method: ge
method: gele
method: grep
method: gt
method: gtlt
method: iterator
method: keys
method: le
method: length
method: list
method: lt
method: map
method: merge
method: ne
method: none
method: one
method: pairs
method: path
method: random
method: reset
method: reverse
method: slice
method: tv

=cut

$test->for('includes');

=synopsis

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({1..8});

  # $hash->random;

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Venus::Hash');

  $result
});

=description

This package provides methods for manipulating hash data.

=cut

$test->for('description');

=inherits

Venus::Kind::Value

=cut

$test->for('inherits');

=integrates

Venus::Role::Mappable

=cut

$test->for('integrates');

=method all

The all method returns true if the callback returns true for all of the
elements.

=signature all

  all(CodeRef $code) (Bool)

=metadata all

{
  since => '0.01',
}

=example-1 all

  # given: synopsis;

  my $all = $hash->all(sub {
    $_ > 1
  });

  # 1

=cut

$test->for('example', 1, 'all', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 1;

  $result
});

=example-2 all

  # given: synopsis;

  my $all = $hash->all(sub {
    my ($key, $value) = @_;

    $value > 1
  });

  # 1

=cut

$test->for('example', 2, 'all', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 1;

  $result
});

=method any

The any method returns true if the callback returns true for any of the
elements.

=signature any

  any(CodeRef $code) (Bool)

=metadata any

{
  since => '0.01',
}

=example-1 any

  # given: synopsis;

  my $any = $hash->any(sub {
    $_ < 1
  });

  # 0

=cut

$test->for('example', 1, 'any', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  ok $result == 0;

  !$result
});

=example-2 any

  # given: synopsis;

  my $any = $hash->any(sub {
    my ($key, $value) = @_;

    $value < 1
  });

  # 0

=cut

$test->for('example', 2, 'any', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  ok $result == 0;

  !$result
});

=method count

The count method returns the total number of keys defined.

=signature count

  count() (Int)

=metadata count

{
  since => '0.01',
}

=example-1 count

  # given: synopsis;

  my $count = $hash->count;

  # 4

=cut

$test->for('example', 1, 'count', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 4;

  $result
});

=method default

The default method returns the default value, i.e. C<{}>.

=signature default

  default() (HashRef)

=metadata default

{
  since => '0.01',
}

=example-1 default

  # given: synopsis;

  my $default = $hash->default;

  # {}

=cut

$test->for('example', 1, 'default', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, {};

  $result
});

=method delete

The delete method returns the value matching the key specified in the argument
and returns the value.

=signature delete

  delete(Str $key) (Any)

=metadata delete

{
  since => '0.01',
}

=example-1 delete

  # given: synopsis;

  my $delete = $hash->delete(1);

  # 2

=cut

$test->for('example', 1, 'delete', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 2;

  $result
});

=method each

The each method executes callback for each element in the hash passing the
routine the key and value at the current position in the loop. This method can
return a list of values in list-context.

=signature each

  each(CodeRef $code) (ArrayRef)

=metadata each

{
  since => '0.01',
}

=example-1 each

  # given: synopsis;

  my $each = $hash->each(sub {
    [$_]
  });

  # [[2], [4], [6], [8]]

=cut

$test->for('example', 1, 'each', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [[2], [4], [6], [8]];

  $result
});

=example-2 each

  # given: synopsis;

  my $each = $hash->each(sub {
    my ($key, $value) = @_;

    [$key, $value]
  });

  # [[1, 2], [3, 4], [5, 6], [7, 8]]

=cut

$test->for('example', 2, 'each', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [[1, 2], [3, 4], [5, 6], [7, 8]];

  $result
});

=method empty

The empty method drops all elements from the hash.

=signature empty

  empty() (HashRef)

=metadata empty

{
  since => '0.01',
}

=example-1 empty

  # given: synopsis;

  my $empty = $hash->empty;

  # {}

=cut

$test->for('example', 1, 'empty', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, {};

  $result
});

=method eq

The eq method performs an I<"equals"> operation using the argument provided.

=signature eq

  eq(Any $arg) (Bool)

=metadata eq

{
  since => '0.08',
}

=example-1 eq

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->eq($rvalue);

  # 0

=cut

$test->for('example', 1, 'eq', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-2 eq

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->eq($rvalue);

  # 0

=cut

$test->for('example', 2, 'eq', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-3 eq

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->eq($rvalue);

  # 0

=cut

$test->for('example', 3, 'eq', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-4 eq

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->eq($rvalue);

  # 1

=cut

$test->for('example', 4, 'eq', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-5 eq

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->eq($rvalue);

  # 0

=cut

$test->for('example', 5, 'eq', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-6 eq

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->eq($rvalue);

  # 0

=cut

$test->for('example', 6, 'eq', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-7 eq

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->eq($rvalue);

  # 0

=cut

$test->for('example', 7, 'eq', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-8 eq

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->eq($rvalue);

  # 0

=cut

$test->for('example', 8, 'eq', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-9 eq

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->eq($rvalue);

  # 0

=cut

$test->for('example', 9, 'eq', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=method exists

The exists method returns true if the value matching the key specified in the
argument exists, otherwise returns false.

=signature exists

  exists(Str $key) (Bool)

=metadata exists

{
  since => '0.01',
}

=example-1 exists

  # given: synopsis;

  my $exists = $hash->exists(1);

  # 1

=cut

$test->for('example', 1, 'exists', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 1;

  $result
});

=example-2 exists

  # given: synopsis;

  my $exists = $hash->exists(0);

  # 0

=cut

$test->for('example', 2, 'exists', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  ok $result == 0;

  !$result
});

=method find

The find method traverses the data structure using the keys and indices
provided, returning the value found or undef. In list-context, this method
returns a tuple, i.e. the value found and boolean representing whether the
match was successful.

=signature find

  find(Str @data) (Any)

=metadata find

{
  since => '0.01',
}

=example-1 find

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({'foo' => {'bar' => 'baz'},'bar' => ['baz']});

  my $find = $hash->find('foo', 'bar');

  # "baz"

=cut

$test->for('example', 1, 'find', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result eq 'baz';

  $result
});

=example-2 find

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({'foo' => {'bar' => 'baz'},'bar' => ['baz']});

  my $find = $hash->find('bar', 0);

  # "baz"

=cut

$test->for('example', 2, 'find', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result eq 'baz';

  $result
});

=example-3 find

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({'foo' => {'bar' => 'baz'},'bar' => ['baz']});

  my $find = $hash->find('bar');

  # ["baz"]

=cut

$test->for('example', 3, 'find', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, ["baz"];

  $result
});

=example-4 find

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({'foo' => {'bar' => 'baz'},'bar' => ['baz']});

  my ($find, $exists) = $hash->find('baz');

  # (undef, 0)

=cut

$test->for('example', 4, 'find', sub {
  my ($tryable) = @_;
  ok my @result = $tryable->result;
  ok @result == 2;
  ok !defined $result[0];
  ok $result[1] == 0;

  @result
});

=method ge

The ge method performs a I<"greater-than-or-equal-to"> operation using the
argument provided.

=signature ge

  ge(Any $arg) (Bool)

=metadata ge

{
  since => '0.08',
}

=example-1 ge

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->ge($rvalue);

  # 0

=cut

$test->for('example', 1, 'ge', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-2 ge

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->ge($rvalue);

  # 0

=cut

$test->for('example', 2, 'ge', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-3 ge

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->ge($rvalue);

  # 1

=cut

$test->for('example', 3, 'ge', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-4 ge

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->ge($rvalue);

  # 1

=cut

$test->for('example', 4, 'ge', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-5 ge

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->ge($rvalue);

  # 1

=cut

$test->for('example', 5, 'ge', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-6 ge

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->ge($rvalue);

  # 0

=cut

$test->for('example', 6, 'ge', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-7 ge

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->ge($rvalue);

  # 0

=cut

$test->for('example', 7, 'ge', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-8 ge

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->ge($rvalue);

  # 1

=cut

$test->for('example', 8, 'ge', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-9 ge

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->ge($rvalue);

  # 1

=cut

$test->for('example', 9, 'ge', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=method gele

The gele method performs a I<"greater-than-or-equal-to"> operation on the 1st
argument, and I<"lesser-than-or-equal-to"> operation on the 2nd argument.

=signature gele

  gele(Any $arg1, Any $arg2) (Bool)

=metadata gele

{
  since => '0.08',
}

=example-1 gele

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 1, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-2 gele

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 2, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-3 gele

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 3, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-4 gele

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 4, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-5 gele

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 5, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-6 gele

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 6, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-7 gele

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 7, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-8 gele

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 8, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-9 gele

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->gele($rvalue);

  # 0

=cut

$test->for('example', 9, 'gele', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=method grep

The grep method executes callback for each key/value pair in the hash passing
the routine the key and value at the current position in the loop and returning
a new hash reference containing the elements for which the argument evaluated
true. This method can return a list of values in list-context.

=signature grep

  grep(CodeRef $code) (ArrayRef)

=metadata grep

{
  since => '0.01',
}

=example-1 grep

  # given: synopsis;

  my $grep = $hash->grep(sub {
    $_ >= 3
  });

  # [3..8]

=cut

$test->for('example', 1, 'grep', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [3..8];

  $result
});

=example-2 grep

  # given: synopsis;

  my $grep = $hash->grep(sub {
    my ($key, $value) = @_;

    $value >= 3
  });

  # [3..8]

=cut

$test->for('example', 2, 'grep', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [3..8];

  $result
});

=method gt

The gt method performs a I<"greater-than"> operation using the argument provided.

=signature gt

  gt(Any $arg) (Bool)

=metadata gt

{
  since => '0.08',
}

=example-1 gt

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->gt($rvalue);

  # 0

=cut

$test->for('example', 1, 'gt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-2 gt

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->gt($rvalue);

  # 0

=cut

$test->for('example', 2, 'gt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-3 gt

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->gt($rvalue);

  # 1

=cut

$test->for('example', 3, 'gt', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-4 gt

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->gt($rvalue);

  # 0

=cut

$test->for('example', 4, 'gt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-5 gt

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->gt($rvalue);

  # 1

=cut

$test->for('example', 5, 'gt', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-6 gt

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->gt($rvalue);

  # 0

=cut

$test->for('example', 6, 'gt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-7 gt

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->gt($rvalue);

  # 0

=cut

$test->for('example', 7, 'gt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-8 gt

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->gt($rvalue);

  # 1

=cut

$test->for('example', 8, 'gt', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-9 gt

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->gt($rvalue);

  # 1

=cut

$test->for('example', 9, 'gt', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=method gtlt

The gtlt method performs a I<"greater-than"> operation on the 1st argument, and
I<"lesser-than"> operation on the 2nd argument.

=signature gtlt

  gtlt(Any $arg1, Any $arg2) (Bool)

=metadata gtlt

{
  since => '0.08',
}

=example-1 gtlt

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 1, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-2 gtlt

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 2, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-3 gtlt

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 3, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-4 gtlt

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 4, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-5 gtlt

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 5, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-6 gtlt

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 6, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-7 gtlt

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 7, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-8 gtlt

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 8, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-9 gtlt

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->gtlt($rvalue);

  # 0

=cut

$test->for('example', 9, 'gtlt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=method iterator

The iterator method returns a code reference which can be used to iterate over
the hash. Each time the iterator is executed it will return the values of the
next element in the hash until all elements have been seen, at which point the
iterator will return an undefined value. This method can return a tuple with
the key and value in list-context.

=signature iterator

  iterator() (CodeRef)

=metadata iterator

{
  since => '0.01',
}

=example-1 iterator

  # given: synopsis;

  my $iterator = $hash->iterator;

  # sub { ... }

  # while (my $value = $iterator->()) {
  #   say $value; # 1
  # }

=cut

$test->for('example', 1, 'iterator', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  while (my $value = $result->()) {
    ok $value =~ m{\d};
  }

  $result
});

=example-2 iterator

  # given: synopsis;

  my $iterator = $hash->iterator;

  # sub { ... }

  # while (grep defined, my ($key, $value) = $iterator->()) {
  #   say $value; # 1
  # }

=cut

$test->for('example', 2, 'iterator', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  while (grep defined, my ($key, $value) = $result->()) {
    ok $key =~ m{\d};
    ok $value =~ m{\d};
  }

  $result
});

=method keys

The keys method returns an array reference consisting of all the keys in the
hash.

=signature keys

  keys() (ArrayRef)

=metadata keys

{
  since => '0.01',
}

=example-1 keys

  # given: synopsis;

  my $keys = $hash->keys;

  # [1, 3, 5, 7]

=cut

$test->for('example', 1, 'keys', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [1, 3, 5, 7];

  $result
});

=method le

The le method performs a I<"lesser-than-or-equal-to"> operation using the
argument provided.

=signature le

  le(Any $arg) (Bool)

=metadata le

{
  since => '0.08',
}

=example-1 le

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->le($rvalue);

  # 0

=cut

$test->for('example', 1, 'le', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-2 le

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->le($rvalue);

  # 1

=cut

$test->for('example', 2, 'le', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-3 le

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->le($rvalue);

  # 0

=cut

$test->for('example', 3, 'le', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-4 le

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->le($rvalue);

  # 1

=cut

$test->for('example', 4, 'le', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-5 le

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->le($rvalue);

  # 0

=cut

$test->for('example', 5, 'le', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-6 le

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->le($rvalue);

  # 1

=cut

$test->for('example', 6, 'le', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-7 le

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->le($rvalue);

  # 0

=cut

$test->for('example', 7, 'le', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-8 le

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->le($rvalue);

  # 0

=cut

$test->for('example', 8, 'le', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-9 le

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->le($rvalue);

  # 0

=cut

$test->for('example', 9, 'le', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=method length

The length method returns the total number of keys defined, and is an alias for
the L</count> method.

=signature length

  length() (Int)

=metadata length

{
  since => '0.08',
}

=example-1 length

  # given: synopsis;

  my $length = $hash->length;

  # 4

=cut

$test->for('example', 1, 'length', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 4;

  $result
});

=method list

The list method returns a shallow copy of the underlying hash reference as an
array reference.

=signature list

  list() (Any)

=metadata list

{
  since => '0.01',
}

=example-1 list

  # given: synopsis;

  my $list = $hash->list;

  # 4

=cut

$test->for('example', 1, 'list', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 4;

  $result
});

=example-2 list

  # given: synopsis;

  my @list = $hash->list;

  # (1..8)

=cut

$test->for('example', 2, 'list', sub {
  my ($tryable) = @_;
  ok my @result = $tryable->result;
  is_deeply [sort @result], [1..8];

  @result
});

=method lt

The lt method performs a I<"lesser-than"> operation using the argument provided.

=signature lt

  lt(Any $arg) (Bool)

=metadata lt

{
  since => '0.08',
}

=example-1 lt

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->lt($rvalue);

  # 0

=cut

$test->for('example', 1, 'lt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-2 lt

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->lt($rvalue);

  # 1

=cut

$test->for('example', 2, 'lt', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-3 lt

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->lt($rvalue);

  # 0

=cut

$test->for('example', 3, 'lt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-4 lt

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->lt($rvalue);

  # 0

=cut

$test->for('example', 4, 'lt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-5 lt

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->lt($rvalue);

  # 0

=cut

$test->for('example', 5, 'lt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-6 lt

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->lt($rvalue);

  # 1

=cut

$test->for('example', 6, 'lt', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-7 lt

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->lt($rvalue);

  # 0

=cut

$test->for('example', 7, 'lt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-8 lt

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->lt($rvalue);

  # 0

=cut

$test->for('example', 8, 'lt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-9 lt

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->lt($rvalue);

  # 0

=cut

$test->for('example', 9, 'lt', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=method map

The map method executes callback for each key/value in the hash passing the
routine the value at the current position in the loop and returning a new hash
reference containing the elements for which the argument returns a value or
non-empty list. This method can return a list of values in list-context.

=signature map

  map(CodeRef $code) (ArrayRef)

=metadata map

{
  since => '0.01',
}

=example-1 map

  # given: synopsis;

  my $map = $hash->map(sub {
    $_ * 2
  });

  # [4, 8, 12, 16]

=cut

$test->for('example', 1, 'map', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [4, 8, 12, 16];

  $result
});

=example-2 map

  # given: synopsis;

  my $map = $hash->map(sub {
    my ($key, $value) = @_;

    [$key, ($value * 2)]
  });

  # [[1, 4], [3, 8], [5, 12], [7, 16]]

=cut

$test->for('example', 2, 'map', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [[1, 4], [3, 8], [5, 12], [7, 16]];

  $result
});

=method merge

The merge method returns a hash reference where the elements in the hash and
the elements in the argument(s) are merged. This operation performs a deep
merge and clones the datasets to ensure no side-effects. The merge behavior
merges hash references only, all other data types are assigned with precendence
given to the value being merged.

=signature merge

  merge(HashRef @data) (HashRef)

=metadata merge

{
  since => '0.01',
}

=example-1 merge

  # given: synopsis;

  my $merge = $hash->merge({1 => 'a'});

  # { 1 => "a", 3 => 4, 5 => 6, 7 => 8 }

=cut

$test->for('example', 1, 'merge', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, { 1 => "a", 3 => 4, 5 => 6, 7 => 8 };

  $result
});

=example-2 merge

  # given: synopsis;

  my $merge = $hash->merge({1 => 'a'}, {5 => 'b'});

  # { 1 => "a", 3 => 4, 5 => "b", 7 => 8 }

=cut

$test->for('example', 2, 'merge', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, { 1 => "a", 3 => 4, 5 => "b", 7 => 8 };

  $result
});

=method ne

The ne method performs a I<"not-equal-to"> operation using the argument provided.

=signature ne

  ne(Any $arg) (Bool)

=metadata ne

{
  since => '0.08',
}

=example-1 ne

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->ne($rvalue);

  # 1

=cut

$test->for('example', 1, 'ne', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-2 ne

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->ne($rvalue);

  # 1

=cut

$test->for('example', 2, 'ne', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-3 ne

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->ne($rvalue);

  # 1

=cut

$test->for('example', 3, 'ne', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-4 ne

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->ne($rvalue);

  # 0

=cut

$test->for('example', 4, 'ne', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-5 ne

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->ne($rvalue);

  # 1

=cut

$test->for('example', 5, 'ne', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-6 ne

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->ne($rvalue);

  # 1

=cut

$test->for('example', 6, 'ne', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-7 ne

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->ne($rvalue);

  # 1

=cut

$test->for('example', 7, 'ne', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-8 ne

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->ne($rvalue);

  # 1

=cut

$test->for('example', 8, 'ne', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-9 ne

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->ne($rvalue);

  # 1

=cut

$test->for('example', 9, 'ne', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=method none

The none method returns true if none of the elements in the array meet the
criteria set by the operand and rvalue.

=signature none

  none(CodeRef $code) (Bool)

=metadata none

{
  since => '0.01',
}

=example-1 none

  # given: synopsis;

  my $none = $hash->none(sub {
    $_ < 1
  });

  # 1

=cut

$test->for('example', 1, 'none', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 1;

  $result
});

=example-2 none

  # given: synopsis;

  my $none = $hash->none(sub {
    my ($key, $value) = @_;

    $value < 1
  });

  # 1

=cut

$test->for('example', 2, 'none', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 1;

  $result
});

=method one

The one method returns true if only one of the elements in the array meet the
criteria set by the operand and rvalue.

=signature one

  one(CodeRef $code) (Bool)

=metadata one

{
  since => '0.01',
}

=example-1 one

  # given: synopsis;

  my $one = $hash->one(sub {
    $_ == 2
  });

  # 1

=cut

$test->for('example', 1, 'one', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 1;

  $result
});

=example-2 one

  # given: synopsis;

  my $one = $hash->one(sub {
    my ($key, $value) = @_;

    $value == 2
  });

  # 1

=cut

$test->for('example', 2, 'one', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result == 1;

  $result
});

=method pairs

The pairs method is an alias to the pairs_array method. This method can return
a list of values in list-context.

=signature pairs

  pairs() (ArrayRef)

=metadata pairs

{
  since => '0.01',
}

=example-1 pairs

  # given: synopsis;

  my $pairs = $hash->pairs;

  # [[1, 2], [3, 4], [5, 6], [7, 8]]

=cut

$test->for('example', 1, 'pairs', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [[1, 2], [3, 4], [5, 6], [7, 8]];

  $result
});

=method path

The path method traverses the data structure using the path expr provided,
returning the value found or undef. In list-context, this method returns a
tuple, i.e. the value found and boolean representing whether the match was
successful.

=signature path

  path(Str $expr) (Any)

=metadata path

{
  since => '0.01',
}

=example-1 path

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({'foo' => {'bar' => 'baz'},'bar' => ['baz']});

  my $path = $hash->path('/foo/bar');

  # "baz"

=cut

$test->for('example', 1, 'path', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result eq "baz";

  $result
});

=example-2 path

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({'foo' => {'bar' => 'baz'},'bar' => ['baz']});

  my $path = $hash->path('/bar/0');

  # "baz"

=cut

$test->for('example', 2, 'path', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result eq "baz";

  $result
});

=example-3 path

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({'foo' => {'bar' => 'baz'},'bar' => ['baz']});

  my $path = $hash->path('/bar');

  # ["baz"]

=cut

$test->for('example', 3, 'path', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, ["baz"];

  $result
});

=example-4 path

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({'foo' => {'bar' => 'baz'},'bar' => ['baz']});

  my ($path, $exists) = $hash->path('/baz');

  # (undef, 0)

=cut

$test->for('example', 4, 'path', sub {
  my ($tryable) = @_;
  ok my @result = $tryable->result;
  ok @result == 2;
  ok !defined $result[0];
  ok $result[1] == 0;

  @result
});

=method random

The random method returns a random element from the array.

=signature random

  random() (Any)

=metadata random

{
  since => '0.01',
}

=example-1 random

  # given: synopsis;

  my $random = $hash->random;

  # 6

  # my $random = $hash->random;

  # 4

=cut

$test->for('example', 1, 'random', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;

  $result
});

=method reset

The reset method returns nullifies the value of each element in the hash.

=signature reset

  reset() (ArrayRef)

=metadata reset

{
  since => '0.01',
}

=example-1 reset

  # given: synopsis;

  my $reset = $hash->reset;

  # { 1 => undef, 3 => undef, 5 => undef, 7 => undef }

=cut

$test->for('example', 1, 'reset', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, { 1 => undef, 3 => undef, 5 => undef, 7 => undef };

  $result
});

=method reverse

The reverse method returns a hash reference consisting of the hash's keys and
values inverted. Note, keys with undefined values will be dropped.

=signature reverse

  reverse() (HashRef)

=metadata reverse

{
  since => '0.01',
}

=example-1 reverse

  # given: synopsis;

  my $reverse = $hash->reverse;

  # { 2 => 1, 4 => 3, 6 => 5, 8 => 7 }

=cut

$test->for('example', 1, 'reverse', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, { 2 => 1, 4 => 3, 6 => 5, 8 => 7 };

  $result
});

=method slice

The slice method returns an array reference of the values that correspond to
the key(s) specified in the arguments.

=signature slice

  slice(Str @keys) (ArrayRef)

=metadata slice

{
  since => '0.01',
}

=example-1 slice

  # given: synopsis;

  my $slice = $hash->slice(1, 3);

  # [2, 4]

=cut

$test->for('example', 1, 'slice', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is_deeply $result, [2, 4];

  $result
});

=method tv

The tv method performs a I<"type-and-value-equal-to"> operation using argument
provided.

=signature tv

  tv(Any $arg) (Bool)

=metadata tv

{
  since => '0.08',
}

=example-1 tv

  package main;

  use Venus::Array;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Array->new;

  my $result = $lvalue->tv($rvalue);

  # 0

=cut

$test->for('example', 1, 'tv', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-2 tv

  package main;

  use Venus::Code;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Code->new;

  my $result = $lvalue->tv($rvalue);

  # 0

=cut

$test->for('example', 2, 'tv', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-3 tv

  package main;

  use Venus::Float;
  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Float->new;

  my $result = $lvalue->tv($rvalue);

  # 0

=cut

$test->for('example', 3, 'tv', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-4 tv

  package main;

  use Venus::Hash;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Hash->new;

  my $result = $lvalue->tv($rvalue);

  # 1

=cut

$test->for('example', 4, 'tv', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  is $result, 1;

  $result
});

=example-5 tv

  package main;

  use Venus::Hash;
  use Venus::Number;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Number->new;

  my $result = $lvalue->tv($rvalue);

  # 0

=cut

$test->for('example', 5, 'tv', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-6 tv

  package main;

  use Venus::Hash;
  use Venus::Regexp;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Regexp->new;

  my $result = $lvalue->tv($rvalue);

  # 0

=cut

$test->for('example', 6, 'tv', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-7 tv

  package main;

  use Venus::Hash;
  use Venus::Scalar;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Scalar->new;

  my $result = $lvalue->tv($rvalue);

  # 0

=cut

$test->for('example', 7, 'tv', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-8 tv

  package main;

  use Venus::Hash;
  use Venus::String;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::String->new;

  my $result = $lvalue->tv($rvalue);

  # 0

=cut

$test->for('example', 8, 'tv', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=example-9 tv

  package main;

  use Venus::Hash;
  use Venus::Undef;

  my $lvalue = Venus::Hash->new;
  my $rvalue = Venus::Undef->new;

  my $result = $lvalue->tv($rvalue);

  # 0

=cut

$test->for('example', 9, 'tv', sub {
  my ($tryable) = @_;
  ok !(my $result = $tryable->result);
  is $result, 0;

  !$result
});

=license

Copyright (C) 2021, Cpanery

Read the L<"license"|https://github.com/cpanery/venus/blob/master/LICENSE> file.

=cut

=authors

Cpanery, C<cpanery@cpan.org>

=cut

# END

$test->render('lib/Venus/Hash.pod') if $ENV{RENDER};

ok 1 and done_testing;