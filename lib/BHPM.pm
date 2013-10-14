package BHPM;
use Dancer2;
use WWW::Mechanize;
use Lista;

prefix undef;

get '/' => sub {
    my $mech = WWW::Mechanize->new;
    
    $mech->get('');
    
    my $content = $mech->content;
    
    $content =~ m{Perl News<\/a><\/li>(.*?)<\/ul>}s;
    
    template 'index', {news => $1};
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
