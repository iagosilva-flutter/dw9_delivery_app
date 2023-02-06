# Vakinha Burger.

App feito na imersão dart week. 

<img src="https://user-images.githubusercontent.com/105370573/217072788-2233ca81-6a5c-4de7-964b-1181421116a1.jpg" width="150" height="300"> <img src="https://user-images.githubusercontent.com/105370573/217072816-dd204f66-6598-4532-84b6-e548f7e2ce94.jpg" width="150" height="300"> <img src="https://user-images.githubusercontent.com/105370573/217072812-ed269b31-61dc-47a8-b7b4-3143f29144c4.jpg" width="150" height="300"> <img src="https://user-images.githubusercontent.com/105370573/217072795-a727ddea-d05b-4c32-b2c9-d28c8f118cdd.jpg" width="150" height="300"> <img src="https://user-images.githubusercontent.com/105370573/217072804-e0483be9-dda9-407e-8bc2-30add22a9e49.jpg" width="150" height="300"> <img src="https://user-images.githubusercontent.com/105370573/217072810-4fb201c1-f164-4e19-808d-06c565cc7148.jpg" width="150" height="300">

# Funcionalidades do projeto

- Autenticação: Tela de login e criação de conta. Autenticação por token que expira em algumas horas e funcionalidade de refresh token que permite a reautenticação automática do usuário em até 7 dias sem usar o app. A autenticação só é solicitada quando necessaria, ou seja, na hora de finalizar o pedido. Padrão que tem sido pedido recentimente pela Apple que está exigindo que os apps não solicitem login logo de início fazendo que o usuário possa ver e mexer no app antes de passar seus dados.
- Home page: tela apenas com a listagem dos produtos
- Detalhe do produto: tela onde tem uma imagem maior, descrição do produto e botão para incluir produto na sacola de pedido.
- Sacola de pedido: tela com a listagem de produtos inclusos no pedido, com possibilidade de alterar a quantidade do produto e também excluir um produto da sacola. Botão pra limpar a sacola. Formulario com validação para passar endereço, documento e forma de pagamento. Botão para finalizar pedido.

Principais packages usados no projeto.
  - Bloc: para gerenciamento de estado. (foi usado o subconjunto Cubit)
  - Provider: para a injeção das dependências.
  - Dio: cliente http para acessar api do backend
  - Shared Preferences: para manter dados do token de autenticação de usuário

<h4> Minha dificuldade no projeto foi o entendimento da estrutura e fluxo do Bloc e a funcionalidade do base state. Agora vou repassar o projeto pra entender mais detalhadamente tudo o que foi passado. Colocar novas funcionalidades. Passar o backend para o Firebase. Fazer o parte do dona da loja de delivery, onde os pedidos são recebidos. O painel para o CRUD dos produtos. </h4>





