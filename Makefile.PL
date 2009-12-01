use inc::Module::Install;

all_from        'lib/String/UTF8/XS.pm';
perl_version    '5.006';
bugtracker      'http://rt.cpan.org/Public/Dist/Display.html?Name=String-UTF8-XS';
test_requires   'Test::More' => '0.86';
test_requires   'Test::Exception' => '0';
test_requires   'String::UTF8' => '0';
makemaker_args  INC => '-I.';

requires_external_cc;

WriteAll;

