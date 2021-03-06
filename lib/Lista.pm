package Lista;
use Dancer2;
use Dancer2::Plugin::Database;
use WWW::Mechanize;

prefix '/lista';

get '/' => sub {
  template 'lista';
};

post '/cadastrar' => sub {
  my $usu_nome = param 'nome';
  my $usu_email = param 'email';
  my $usu_senha = param 'senha';
  my $usu_confirme = param 'confirme';
  my $usu_digest = param 'digest';
  
  my $mech = WWW::Mechanize->new(
      autocheck => 0
  );
  
  $mech->post(
      'http://mail.pm.org/mailman/subscribe/bh-pm',
      [
        'email' => $usu_email,
        'fullname' => $usu_nome,
        'pw' => $usu_senha,
        'pw-conf' => $usu_confirme,
        'language' => 'pt_BR',
        'digest' => $usu_digest,
        'email-button' => 'Inscrever'
      ]
  );
  
  my $resultado = $mech->content;
  $resultado =~ m{<\/h1>\n(.*?)\n<hr>}s;
  
  my $mensagem = $1;
  
  if($mensagem =~ /Sua requisição de inscrição foi recebida e será agilizada logo/){
    my $sth = database->prepare(
        'INSERT INTO usuario (usu_nome, usu_email, usu_data) VALUES (?, ?, NOW())'
    );
    $sth->execute($usu_nome, $usu_email);
  }
  
  template 'cadastrar', {mensagem => $mensagem};
};

1;
