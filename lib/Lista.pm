package Lista;
use Dancer2;
use Dancer2::Plugin::Database;
use WWW::Mechanize;

prefix '/lista';

get '/' => sub {
  template 'lista';
};

post '/cadastrar' => {
  my $nome = param->{nome} || '';
  my $email = param->{email} || '';
  my $senha = param->{senha} || '';
  my $confirme = param->{confirme} || '';
  
  my $mech = WWW::Mechanize->new(
      autocheck => 0
  );
  
  $mech->post(
      'http://mail.pm.org/mailman/subscribe/bh-pm',
      [
        email => $email,
        fullname => $nome,
        pw => $senha,
        'pw-conf' => $confirme,
        language => 'pt_BR',
        digest => 0,
        'email-button' => 'Inscrever'
      ]
  );
  
  return $mech->content;
};

1;
