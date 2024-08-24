Introdução

sudo gem install cocoapods ou brew install cocoapods -> pod instal.

Este projeto utiliza a Clean Architecture como base para a sua estrutura. A escolha dessa arquitetura se deu por diversos motivos, sendo o principal deles a busca por um código mais manutenível e testável a longo prazo. Embora o MVVM pudesse ser uma opção válida para um projeto desse tamanho, a Clean Architecture, com seus princípios SOLID, oferece uma maior separação de responsabilidades e flexibilidade.

Justificativa das Escolhas Técnicas

Clean Architecture:

Por quê: Permite uma clara separação entre as camadas do sistema, facilitando a compreensão e a manutenção do código.
Benefícios: Maior testabilidade, menor acoplamento entre as partes e maior facilidade para realizar mudanças futuras.
SwiftLint:

Por quê: Garante a consistência do estilo de código, evitando erros comuns e melhorando a legibilidade.
Benefícios: Código mais limpo e padronizado, facilitando a colaboração em equipe.
SDWebImage:

Por quê: Simplifica o carregamento de imagens, oferecendo funcionalidades como cache, placeholder e animações.
Benefícios: Melhora a performance e a experiência do usuário, especialmente ao lidar com um grande número de imagens.
SCLAlertView:

Por quê: Permite a criação de alertas personalizados de forma rápida e eficiente.
Benefícios: Agrega valor visual ao aplicativo, tornando-o mais agradável ao usuário.
Restrições de Tempo

Devido ao curto prazo para o desenvolvimento (2 noites), algumas decisões técnicas foram tomadas visando agilizar o processo, como a utilização de bibliotecas externas para tarefas comuns. No entanto, mesmo com essas restrições, a Clean Architecture proporcionou uma base sólida para o projeto, permitindo que o desenvolvimento fosse realizado de forma organizada e eficiente.
