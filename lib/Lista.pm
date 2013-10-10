package Lista;
use Dancer2;

prefix '/lista';

get '/' => sub {
  template 'lista';
};

1;
