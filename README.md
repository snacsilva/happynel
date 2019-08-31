HappyNel
==

Dashboard de enquete de satisfação

## Requerimentos

1. Rails 5
2. Git - Ceder acesso ao repositório. Pode ser no Bitbucket, Github, Gitlab...
3. Faça o deploy da aplicação em algum serviço externo, como Heroku, Digital Ocean ou outro de sua preferência.

## Problema

Preciso medir o nível de satisfação dos membros da minha equipe, porém é importante que eles sintam-se confortáveis em atribuirem uma nota baixa.

## Proposta

Deve existir uma área de administração com: 

1. cadastro de membros(nome e email);
2. ação para Enviar uma Pesquisa;
 - Os membros cadastrados devem receber um email com um link para responder a pesquisa. {importante: "a resposta deve ser secreta"}
3. listagem com todas as pesquisas criadas e sua Nota Média;

### Importante

1. O membro da equipe não precisa logar-se para responder a pesquisa, atribuindo assim uma nota de 0 a 10; 
2. Quando todos os membros responderem uma pesquisa, um email deve ser enviado para TODOS com a Nota Média;