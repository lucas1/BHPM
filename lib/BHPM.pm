package BHPM;
use Dancer2;
use Lista;

prefix undef;

get '/' => sub {
    template 'index';
};

get '/sobre' => sub {
    template 'sobre';
};

get '/contato' => sub {
    template 'contato';
};

true;
