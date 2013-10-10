package Lista;
use Dancer2;

prefix '/lista';

get '/' => sub {
  return 'ok';
};

1;
