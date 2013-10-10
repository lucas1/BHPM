package Lista;
use Dancer2;
use Dancer2::Plugin::Database;
use WWW::Mechanize;

prefix '/lista';

get '/' => sub {
  template 'lista';
};

post '/cadastrar' => {
  my $usu_nome = param 'nome' || '';
  my $usu_email = param 'email' || '';
  my $usu_senha = param 'senha' || '';
  my $usu_confirme = param 'confirme' || '';
  
  my $mech = WWW::Mechanize->new(
      autocheck => 0
  );
  
  $mech->post(
      'http://mail.pm.org/mailman/subscribe/bh-pm',
      [
        email => $usu_email,
        fullname => $usu_nome,
        pw => $usu_senha,
        'pw-conf' => $usu_confirme,
        language => 'pt_BR',
        digest => 0,
        'email-button' => 'Inscrever'
      ]
  );
  
  return $mech->content;
};

1;
