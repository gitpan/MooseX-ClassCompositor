
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "a factory that builds classes from roles",
  "AUTHOR" => "Ricardo Signes <rjbs\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Moose::Role" => 0,
    "MooseX::Role::Parameterized" => "0.23",
    "Test::More" => "0.96",
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-ClassCompositor",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::ClassCompositor",
  "PREREQ_PM" => {
    "Moose" => 0,
    "Moose::Util" => 0,
    "Moose::Util::MetaRole" => 0,
    "MooseX::StrictConstructor::Trait::Class" => 0,
    "MooseX::Types::Perl" => 0,
    "Scalar::Util" => 0,
    "String::RewritePrefix" => 0,
    "namespace::autoclean" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



