# db-gestao-universidade
Script de criação de um banco de dados para universidade.


-------------------- Sobre Banco de Dados --------------------

Victor Hugo B. S. Miranda

Síntese

Banco de dados e usuário de banco de dados

Elmasri. Sistema de banco de dados 6°ed.

Banco de dados é uma coleção de dados relacionados. Dados são fatos conhecidos que podem ser registrados e possuem significado implícito.
Propriedades implícitas de banco de dados são:

Um banco de dados representa algum aspecto do mundo real, às vezes é chamado de minimundo ou universo de discurso. As mudanças neste minimundo devem ser refletidas no banco de dados.
Um banco de dados é uma coleção logicamente coerente de dados com algum significado inerente.
Um banco de dados é projetado, construído e populado com dados para uma finalidade específica. Possui um grupo definido de usuários e algumas aplicações previamente concebidas nas quais esses usuários estão interessados.

Um banco de dados pode ser criado e mantido por um grupo de programas de aplicação escritos especificamente para essa tarefa ou por um sistema gerenciador de banco de dados.
Sistema gerenciador de banco de dados (SGBD) é uma coleção de programas que permite aos usuários criar e manter um banco de dados. SGBD é um sistema de uso geral que facilita o processo de definição, construção, manipulação e compartilhamento de banco de dados. Definir um banco de dados é especificar os tipos, estruturas e restrições dos dados a serem armazenados. A informação descritiva é armazenada pelo SGBD na forma de um catálogo ou dicionário chamado de metadados. A construção do banco de dados é o processo de armazenar os dados em algum meio controlado pelo SGBD. A manipulação de banco de dados inclui funções como consulta ao banco de dados para recuperar os dados específicos, atualização do banco de dados para refletir mudanças no minimundo e geração de relatórios com base nos dados.  O compartilhamento de um banco de dados permite que diversos usuários e programas possam acessá-lo simultaneamente.
Um programa de aplicação acessa o banco de dados após realizar solicitações ao SGBD. Uma transação pode fazer com que alguns dados sejam lidos e outros, gravados no banco de dados.
SGBD fornece segurança e manutenção ao banco de dados por um longo período. 

Características da abordagem de banco de dados
	Em banco de dados, um único repositório, mantém dados que são definidos uma única vez e depois acessados por vários usuários.
	Os programas que usam de SGBD para o acesso aos dados não possuem necessidades de alteração em todos os programas que acessam o SGBD quando há mudanças em sua estrutura. As estruturas dos arquivos de dados são armazenadas no catálogo do SGBD separadamente dos programas de acesso. 
	Em alguns tipos de sistemas de banco de dados, como orientados a objeto e objeto-     -relacional, os usuários podem definir operações como parte das definições do banco de dados. Uma operação é especificada em partes. Os programas de aplicação do usuário podem operar sobre os dados invocando essas operações por meio de seus nomes e argumentos, independentemente de como as operações são implementadas. Isso é chamado de independência da operação do programa.
	O SGBD oferece uma representação conceitual de dados que não incluem muitos dos detalhes de como os dados são armazenados ou como as operações são implementadas. De maneira informal, um modelo de dados é um tipo de abstração de dados usado para oferecer essa representação conceitual.
A estrutura detalhada e a organização de cada arquivo são armazenadas no catálogo. Os usuários do banco de dados e os programas de aplicação se referem à representação conceitual dos arquivos, e o SGBD extrai os detalhes do armazenamento do arquivo do catálogo quando estes são necessários para os módulos de acesso a arquivo do SGBD.
Nos bancos de dados orientados a objeto e objeto-relacional, o processo de abstração inclui não somente a estrutura de dados, mas também as operações sobre os dados. Essas operações oferecem uma abstração das atividades do minimundo comumente entendidas pelos usuários.
Um SGBD multiusuário, precisa permitir que diversos usuários possam utilizar o banco de dados ao mesmo tempo.
Uma transação é um programa em execução ou processo que inclui um ou mais acessos ao banco de dados, com a leitura ou atualização de seus registros.

Atores em cena
Pessoas envolvidas em um projeto de banco de dados:
Administradores de banco de dados: supervisionar e gerir recursos de uma determinada organização. Com principal finalidade de gestão do próprio banco de dados e em segundo plano o SGBD. 
Projetistas de banco de dados: identificar os dados a serem armazenados e escolher as estruturas apropriadas para representar e armazenar esses dados.
Usuários finais: são pessoas que exigem acesso ao banco de dados para consultas, atualizações e geração de relatórios. 

Analistas de sistemas identificam as necessidades dos usuários finais, definem as especificações das transações padrão que atendam a elas. Os programadores implementam essas especificações com programas; depois eles testam, depuram, documentam e mantêm essas transações programadas.

Vantagens de usar a abordagem do SGBD
É possível realizar a normalização de dados, garantindo consistência e economia de espaço de armazenamento. Um SGBD deve oferecer um subsistema de segurança e autorização, que o DBA utiliza para criar contas e especificar suas restrições. Os bancos de dados podem ser usados para oferecer armazenamento persistente para objetos e estruturas de dados do programa.
O SGBD precisa oferecer estruturas de dados e técnicas de pesquisa especializadas para agilizar a busca dos registros desejados no disco. O módulo de processamento e otimização de consulta do SGBD é responsável por escolher um plano de execução eficiente para cada consulta, com base nas estruturas de armazenamento existentes. 
	Um SGBD precisa oferecer recursos de Backup, onde deve recuperar de falhas como de hardware ou software.
	Um SGBD deve oferecer uma variedade de interfaces de usuário.
	É preciso ter capacidade de representar uma série de relacionamentos complexos entre dados por parte do SGBD, definir novos relacionamentos à medida que eles surgem e recuperar e atualizar dados relacionados de modo fácil e eficaz.

Quando não usar um SGBD
Para não haver redundância do uso de um SGBD deve-se aos seguintes fatores:
Alto investimento em hardware, software e treinamento.
A generalidade que um SGBD oferece para a definição e o processamento de dados.
Esforço adicional para oferecer funções de segurança, controle de concorrência, recuperação e integridade.

