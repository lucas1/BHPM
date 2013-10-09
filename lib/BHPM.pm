package BHPM;
use Dancer2;

our $VERSION = '0.1';

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
