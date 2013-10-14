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
    $update = $1;
    
    $content =~ m{Perl News<\/a><\/li>(.*?)<\/ul>}s;
    $news = $1;
    
    
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
