#!/usr/local/bin/perl
# A utility to generate test data for pig test harness tests.
# 
# Author:  Alan F. Gates (gates@)
# $Header:$
#

use strict;
use charnames ();

our @firstName = ("alice", "bob", "calvin", "david", "ethan", "fred",
    "gabriella", "holly", "irene", "jessica", "katie", "luke", "mike", "nick",
    "oscar", "priscilla", "quinn", "rachel", "sarah", "tom", "ulysses", "victor",
    "wendy", "xavier", "yuri", "zach");

our @lastName = ("allen", "brown", "carson", "davidson", "ellison", "falkner",
    "garcia", "hernandez", "ichabod", "johnson", "king", "laertes", "miller",
    "nixon", "ovid", "polk", "quirinius", "robinson", "steinbeck", "thompson",
    "underhill", "van buren", "white", "xylophone", "young", "zipper");

sub randomName()
{
    return sprintf("%s %s", $firstName[int(rand(26))],
        $lastName[int(rand(26))]);
}

our @city = ("albuquerque", "bombay", "calcutta", "danville", "eugene",
    "frankfurt", "grenoble", "harrisburg", "indianapolis",
    "jerusalem", "kellogg", "lisbon", "marseilles",
    "nice", "oklohoma city", "paris", "queensville", "roswell",
    "san francisco", "twin falls", "umatilla", "vancouver", "wheaton",
    "xacky", "youngs town", "zippy");

sub randomCity()
{
    return $city[int(rand(26))];
}

our @state = ( "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", 
    "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
    "MA", "MI", "MN", "MS", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC",
    "ND", "OH", "OK", "OR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA",
    "WA", "WV", "WI", "WY");

sub randomState()
{
    return $state[int(rand(50))];
}

our @classname = ("american history", "biology", "chemistry", "debate",
    "education", "forestry", "geology", "history", "industrial engineering",
    "joggying", "kindergarten", "linguistics", "mathematics", "nap time",
    "opthamology", "philosophy", "quiet hour", "religion", "study skills",
    "topology", "undecided", "values clariffication", "wind surfing", 
    "xylophone band", "yard duty", "zync studies");

sub randomClass()
{
    return $classname[int(rand(26))];
}

our @grade = ("A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "D-",
    "F");

sub randomGrade()
{
    return $grade[int(rand(int(@grade)))];
}

our @registration = ("democrat", "green", "independent", "libertarian",
    "republican", "socialist");

sub randomRegistration()
{
    return $registration[int(rand(int(@registration)))];
}

sub randomAge()
{
    return (int(rand(60)) + 18);
}

sub randomGpa()
{
    return rand(4.0);
}

our @street = ("A", "B", "C", "D", "E", "F", "G", "H", "I",
    "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",
    "T", "U", "V", "W", "X", "Y", "Z");

sub randomStreet()
{
    return sprintf("%d %s st", int(rand(1000)), $street[int(rand(26))]);
}

sub randomZip()
{
    return int(rand(100000));
}

sub randomContribution()
{
    return sprintf("%.2f", rand(1000));
}

our @numLetter = ("1", "09", "09a");

sub randomNumLetter()
{
    return $numLetter[int(rand(int(@numLetter)))];
}

our @greekLetter = ( "alpha", "beta", "gamma", "delta", "epsilon", "zeta",
    "eta", "theta", "iota", "kappa", "lambda", "mu", "nu", "xi", "omicron",
    "pi", "rho", "sigma", "tau", "upsilon", "chi", "phi", "psi", "omega" );

sub randomGreekLetter()
{
    return $greekLetter[int(rand(int(@greekLetter)))];
}

our @textDoc = (
    "The cosmological proof, which we are now about to ex-",
    "amine, retains the connection of absolute necessity with the",
    "highest reality, but instead of reasoning, like the former proof,",
    "from the highest reality to necessity of existence, it reasons",
    "from the previously given unconditioned necessity of some",
    "being to the unlimited reality of that being. It thus enters upon",
    "a course of reasoning which, whether rational or only pseudo-",
    "rational, is at any rate natural, and the most convincing not",
    "only for common sense but even for speculative understand-",
    "ing. It also sketches the first outline of all the proofs in natural",
    "theology, an outline which has always been and always will",
    "be followed, however much embellished and disguised by",
    "superfluous additions. This proof, termed by Leibniz the proof",
    "a contingentia mundi, we shall now proceed to expound and",
    "examine.");

sub usage()
{
    warn "Usage: $0 filetype numrows tablename [nosql]\n";
    warn "\tValid filetypes [studenttab, studentcolon, studentusrdef,\n";
    warn "\t\tvotertab, reg1459894, textdoc, unicode]\n";
    die;
}

our @greekUnicode = ("\N{U+03b1}", "\N{U+03b2}", "\N{U+03b3}", "\N{U+03b4}",
    "\N{U+03b5}", "\N{U+03b6}", "\N{U+03b7}", "\N{U+03b8}", "\N{U+03b9}",
    "\N{U+03ba}", "\N{U+03bb}", "\N{U+03bc}", "\N{U+03bd}", "\N{U+03be}",
    "\N{U+03bf}", "\N{U+03c0}", "\N{U+03c1}", "\N{U+03c2}", "\N{U+03c3}",
    "\N{U+03c4}", "\N{U+03c5}", "\N{U+03c6}", "\N{U+03c7}", "\N{U+03c8}",
    "\N{U+03c9}");

sub randomUnicodeNonAscii()
{
    my $name = $firstName[int(rand(int(@firstName)))] .
         $greekUnicode[int(rand(int(@greekUnicode)))];
    return $name;
}

my $testvar = "\N{U+03b1}\N{U+03b3}\N{U+03b1}\N{U+03c0}\N{U+03b7}";


# main($)
{
    # explicitly call srand so we get the same data every time
    # we generate it.  However, we set it individually for each table type.
    # Otherwise we'd be generating the same data sets regardless of size,
    # and this would really skew our joins.

    my $filetype = shift;
    my $numRows = shift;
    my $tableName = shift;
    my $nosql = shift;

    if (!defined($filetype) || !defined($numRows)) { usage(); }

    if ($numRows <= 0) { usage(); }

    open(HDFS, "> $tableName") or die("Cannot open file $tableName, $!\n");
    #open(PSQL, "> $tableName.sql") or die("Cannot open file $tableName.sql, $!\n") unless defined $nosql;

    if ($filetype eq "studenttab") {
        srand(3.14159 + $numRows);
        #print PSQL "create table $tableName (id integer,name varchar(100), age integer, gpa float(3));\n" unless defined $nosql;
        #print PSQL "begin transaction;\n" unless defined $nosql;
        for (my $i = 0; $i < $numRows; $i++) {
            my $name = randomName();
            my $age = randomAge();
            my $gpa = randomGpa();
	    my $id = $i + 1;
            #printf PSQL "insert into $tableName (id,name, age, gpa) values('%s', %d, %.2f);\n",
                #$id, $name, $age, $gpa unless defined $nosql;
            printf HDFS "%d\t%s\t%d\t%.2f\n", $id, $name, $age, $gpa;
        }
    } elsif ($filetype eq "studentcolon") {
        srand(2.718281828459 + $numRows);
        #print PSQL "create table $tableName (name varchar(100), age integer, gpa float(3));\n" unless defined $nosql;
        #print PSQL "begin transaction;\n" unless defined $nosql;
        for (my $i = 0; $i < $numRows; $i++) {
            my $name = randomName();
            my $age = randomAge();
            my $gpa = randomGpa();
            #printf PSQL "insert into $tableName (name, age, gpa) values('%s', %d, %.2f);\n",
                #$name, $age, $gpa unless defined $nosql;
            printf HDFS "%s:%d:%.2f\n", $name, $age, $gpa;
=begin
    } elsif ($filetype eq "studentusrdef") {
        srand(6.62606896 + $numRows);
        for (my $i = 0; $i < $numRows; $i++) {
            # TODO need to add SQL info.
            printf("%s,%d,%.2f,", randomName(), randomAge(), randomGpa());
            printf("<%s,%s,%s,%d>,", randomStreet(), randomCity(), randomState(),
                randomZip());
            printf("[%s:<%s,%s>],", randomClass(), randomClass(), randomName());
            printf("{");
            my $elementsInBag = int(rand(100));
            for (my $j = 0; $j < $elementsInBag; $j++) {
                if ($j != 0) { printf(","); }
                printf("<%s,%s,%s>", randomClass(), randomName(), randomGrade());
            }
            printf("}\n");
        }
=cut
        }
    } elsif ($filetype eq "votertab") {
        srand(299792458 + $numRows);
        #print PSQL "create table $tableName (name varchar(100), age integer, registration varchar(20), contributions float);\n" unless defined $nosql;
        #print PSQL "begin transaction;\n" unless defined $nosql;
        for (my $i = 0; $i < $numRows; $i++) {
            my $name = randomName();
            my $age = randomAge();
            my $registration = randomRegistration();
            my $contribution = randomContribution();
            #printf PSQL "insert into $tableName (name, age, registration, contributions) values ('%s', %d, '%s', %.2f);\n",
                #$name, $age, $registration, $contribution unless defined $nosql;
            printf HDFS "%s\t%d\t%s\t%.2f\n", $name, $age,
                $registration, $contribution;
        }
    } elsif ($filetype eq "reg1459894") {
        srand(6.67428 + $numRows);
        #print PSQL "create table $tableName (first varchar(10), second varchar(10));\n" unless defined $nosql;
        #print PSQL "begin transaction;\n" unless defined $nosql;
        for (my $i = 0; $i < $numRows; $i++) {
            my $letter = randomNumLetter(); 
            my $gkLetter = randomGreekLetter(); 
            #printf PSQL "insert into $tableName (first, second) values('%s', '%s');\n",
                #$letter, $gkLetter unless defined $nosql;
            printf HDFS "%s\t%s\n", $letter, $gkLetter;
        }
    } elsif ($filetype eq "textdoc") {
        # This one ignores the number of lines.  It isn't random either.
        #print PSQL "create table $tableName (name varchar(255));\n" unless defined $nosql;
        #print PSQL "begin transaction;\n" unless defined $nosql;
        for (my $i = 0; $i < @textDoc; $i++) {
            my $sqlWords = $textDoc[$i];
            $sqlWords =~ s/([\w-]+)/$1,/g;
            #print PSQL  "insert into $tableName (name) values('($sqlWords)');\n" unless defined $nosql;
            print HDFS "$textDoc[$i]\n";
        }
    } elsif ($filetype eq "unicode") {
        srand(1.41421 + $numRows);
        #print PSQL "create table $tableName (name varchar(255));\n" unless defined $nosql;
        #print PSQL "begin transaction;\n" unless defined $nosql;
        for (my $i = 0; $i < $numRows; $i++) {
            my $name = randomUnicodeNonAscii(); 
            #printf PSQL "insert into $tableName (name) values('%s');\n",
                #$name unless defined $nosql;
            printf HDFS "%s\n", $name;
        }
    } else {
        warn "Unknown filetype $filetype\n";
        usage();
    }
    #print PSQL "commit;\n" unless defined $nosql;
}

