# app_receitas

Integrantes do Projeto
- Gustavo Vicente Ozorio
- Matheus Jose Vieira dos Santos

## Atividades Gerais
- Gustavo Vicente Ozorio
  - Criação de tela perfil
  - Criação de tela de cadastro
  - Navegação entre telas
    Entrega 2 :
    - Estrutura de banco firebase
    - Configuração AuthCheck
    - Autenticação Login
    - Registro de novo usuario
 
- Matheus Jose Vieira dos Santos
    - Criação tela de receitas
    - Criação de home page
    - Criação de login
      Entrega 2 :
      - Estrutura de banco firebase
      - Configuração AuthCheck
      - Autenticação Login
      - Registro de novo usuario
      - 
## Usuario para teste
Usuarios para login:
login: teste@gmail.com
senha: 12345



# App de Receitas

- Foi realizado crição de um app para visualização de receitas culinarias. 
- O usuario pode adicionar receitas favoritas ao seu perfil por meio do icone de "coração".
- Pode marcar os ingredientes já usados em sua receita escolida
- Pesquisar por receitas especificas

## Pré-requisitos

Certifique-se de que seu ambiente de desenvolvimento está configurado para rodar projetos Flutter:

1. **Flutter SDK**: Instale a versão mais recente do Flutter seguindo a [documentação oficial](https://flutter.dev/docs/get-started/install).
2. **Editor de Código**: Recomendamos o [Visual Studio Code](https://code.visualstudio.com/) ou o [Android Studio](https://developer.android.com/studio).
3. **Dispositivo**: Tenha um dispositivo físico ou emulador configurado para rodar o aplicativo.

## Passos para Configuração

1. **Clone o repositório**:

    ```bash
   https://github.com/jvsmatheus/app_receitas.git
    ```

2. **Navegue até o diretório do projeto**:

    ```bash
    cd app_receitas
    ```

3. **Instale as dependências**:

    O Flutter irá buscar automaticamente todas as dependências necessárias definidas no `pubspec.yaml`.

    ```bash
    flutter pub get
    ```

## Executando o Projeto

1. **Conecte um dispositivo** ou inicie um emulador:
    - Para Android, abra um emulador no Android Studio.
      
2. **Execute o aplicativo**:

    ```bash
    flutter run
    ```

    O comando acima compilará e rodará o aplicativo no dispositivo ou emulador conectado.

## Estrutura do Projeto

Aqui estão os principais diretórios e arquivos do projeto:

- **lib/**: Contém o código principal do aplicativo.
  - **models/**: Modelos de dados, como `User` e `Recipe`.
  - **pages/**: Páginas da interface, como `LoginPage`, `RegistrationPage` e `Profile`.
  - **providers/**: Gerenciadores de estado, como `UserProvider`.
  - **widgets/**: Componentes reutilizáveis, como `FavoriteButton` e `MenuBarCustom`.
  - Usando firbase de banco de dados

- **pubspec.yaml**: Arquivo de configuração do projeto onde estão listadas todas as dependências.

## Dependências Utilizadas

- **Provider**: Para gerenciamento de estado.

## Notas

- Certifique-se de que seu emulador ou dispositivo físico está funcionando corretamente antes de executar o aplicativo.
- Consulte a [documentação do Flutter](https://flutter.dev/docs) para obter ajuda adicional sobre o desenvolvimento de aplicativos Flutter.

---
## Funcionalidades Faltantes/problemas
- Registro de novo usuario
    - Como os usuarios estão mockados, enfrentamos problemas na criação e armazenamento de um novo usuario
- Avatar do usuario
    - Não conseguimos fazer o flutter reconhecer as imagens, algumas funcionam e outras não. Não conseguimos identificar o problema
- Get Usuario para exibir nome na tela de perfil não está funcionando

## Problemas Conhecidos/Bugs

Caso ocorra algum problema com permissões ou configurações de ambiente, tente executar:

Entrega 2:
  - Bug identificado ao dar get no nome de usuario
  - Bug ao mostrar nome de usuario
```bash
flutter doctor

