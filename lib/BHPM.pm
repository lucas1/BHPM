package BHPM;
use Dancer2;
use WWW::Mechanize;
use Lista;

prefix undef;

get '/' => sub {
    my $mech = WWW::Mechanize->new;
    
    $mech->get('http://www.perl.org/');
    
    my $content = $mech->content;
    
    $content =~ m{CPAN<\/a><\/li>(.*?)<\/ul>}s;
    my $update = $1;
    $update =~ s/<a /<a target="_blank" /gs;
    
    $content =~ m{Perl News<\/a><\/li>(.*?)<\/ul>}s;
    my $news = $1;
    $news =~ s/<a /<a target="_blank" /gs;
    
    
    template 'index', {update => $update, news => $news};
};

get '/sobre' => sub {
    template 'sobre';
};

get '/contato' => sub {
    template 'contato';
};

get '/colaboradores' => sub {
    template 'colaboradores';
};

true;
