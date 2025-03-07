## Assignment

This problem requires some kind of input. You are free to implement any mechanism for feeding the input into your solution. You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

### Input

#### Input 1:
```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

#### Input 2:
```
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
```

#### Input 3:
```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```

### Output

#### Output 1:
```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

#### Output 2:
```
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```

#### Output 3:
```
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```

----

## Requirements

- [X] Use either Ruby or Javascript;
- [X] Do not use any external libraries or frameworks, such as Rails, to solve this problem;
- [X] Include detailed instructions on how to run the application and an explanation of assumptions you make;
- [X] Please limit the amount of time you spend on the problem to 4 hours;
- [X] Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt;
- [X] Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions;
- [X] When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax;

## Setup Ruby (only if you have not installed)

This project uses [asdf](https://asdf-vm.com/guide/getting-started.html). \
Follow the installation [instructions](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf)

After installation you need to follow these steps:

```bash
# Add ruby plugin on asdf
$ asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

# Install ruby plugin
$ asdf install ruby 3.3.1
```

## Setup Project

```bash
# install bundler
$ gem install bundler

# run bundle to install gems
$ bundle
```

## Available Tasks

```bash
# run all tests of the project
$ bundle exec rspec

# run linter
$ bundle exec rubocop
```

# How to use

Example of how to run the project with sample file (you can use any text file you want, just change the file path):

```bash
$ ruby ruby lib/main.rb spec/fixtures/input.txt
```

## Decisions

Create a base class to load and process data regardless of the file type. Then I implemented a specialization of it that knows how to process text files. If the need arises to process a file in a different format, all you need to do is implement the adapter that knows how to read that type of file.

Based on the samples given, to know if an item is imported just check if it has the word 'imported' in the name

Based on the samples given, to find out if an item is not taxed, just check if it does not have the words 'chocolate', 'pills' and 'book' in the name

For the print receipt part, I implemented an interface that defines the contract that the printer must follow. That way, if we need to extend the code by printing in HTML for example, we just need to implement a new class specialized for that.

I decided to separate the normal items from the invoice items. It seems to me that they are different things. The invoice items need to add up the total taxes.

I created separate calculators for different types of calculations. If you have a new rule, just add the rule in the invoice item builder and the rest will continue to work without needing to be modified.
