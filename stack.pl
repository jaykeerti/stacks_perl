#!/usr/bin/perl

use strict;
use warnings;

my $stack_size;
my @stack;

sub push_onto_stack {
    my ($item) = @_;
    die "\nOverflow. Stack is full \n" if @stack > $stack_size;
    if ( grep( /^$item$/, @stack ) ) {
        print "\nStack already contains the item\n";
    }
    else {
        push @stack, $item;
        print("\nItem added to stack\n");
    }
}

sub pop_from_stack {
    die "\nStack empty\n" if !@stack;
    print( "\nItem at  the top of the stack -> " . $stack[-1] . "\n" );
}

print("\nEnter the size of the stack ?\n");
$stack_size = <STDIN>;
chomp($stack_size);

while (1) {

    print(
"\nwhich operation do you want to perform\n1.push \n2.pop\n3.Number of elements in stack\n4.exit\n"
    );
    my $option = <STDIN>;

    if ( $option == 1 ) {
        print("\nEnter the element that you want to add to stack ?\n");
        my $item = <STDIN>;
        chomp($item);
        push_onto_stack($item);

    }
    elsif ( $option == 2 ) {
        pop_from_stack();

    }
    elsif ( $option == 3 ) {
        print( "\nThe number of elements in stack " . scalar @stack . "\n" );
        print "\nStack Elements -> " . join( " ", @stack ) . "\n";
    }
    else {
        exit();
    }

}
