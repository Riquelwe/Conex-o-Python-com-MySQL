# 🏦 Conexão Python com MySQL

Projeto de estudo que mostra como conectar o **Python** a um banco de dados **MySQL**. O exemplo usado é um sistema simples inspirado em um sistema bancário, com cadastro e login pelo terminal.

> ⚠️ Projeto em desenvolvimento, feito para fins de aprendizado.

---

## 📌 Funcionalidades

- Conexão com o MySQL usando `mysql-connector-python`
- Credenciais do banco guardadas em variáveis de ambiente (`.env`)
- Menu interativo no terminal
- Cadastro de usuário
- Login de usuário
- Banco de dados modelado para um sistema bancário (clientes, agências, contas e transações)

---

## 🛠️ Tecnologias

- [Python 3](https://www.python.org/)
- [MySQL](https://www.mysql.com/)
- [mysql-connector-python](https://pypi.org/project/mysql-connector-python/)
- [python-dotenv](https://pypi.org/project/python-dotenv/)

---

## 📁 Estrutura do projeto

```
Conex-o-Python-com-MySQL/
├── login.py              # Script principal (conexão, cadastro e login)
├── Sistema bancario.sql  # Script SQL com a criação do banco e das tabelas
├── .env.example          # Modelo das variáveis de ambiente
├── .gitignore            # Arquivos ignorados pelo Git (inclui o .env)
└── README.md
```

---

## ✅ Pré-requisitos

- Python 3.8 ou superior
- MySQL Server instalado e em execução
- Git (opcional, para clonar o repositório)

---

## 🚀 Como executar

### 1. Clone o repositório

```bash
git clone https://github.com/Riquelwe/Conex-o-Python-com-MySQL.git
cd Conex-o-Python-com-MySQL
```

### 2. (Opcional) Crie um ambiente virtual

```bash
python -m venv venv

# Windows
venv\Scripts\activate

# Linux / macOS
source venv/bin/activate
```

### 3. Instale as dependências

```bash
pip install mysql-connector-python python-dotenv
```

### 4. Crie o banco de dados

Abra o MySQL (Workbench ou terminal) e execute o conteúdo do arquivo `Sistema bancario.sql`.

### 5. Configure as variáveis de ambiente

Copie o arquivo de exemplo e preencha com os seus dados:

```bash
cp .env.example .env
```

Conteúdo do `.env`:

```env
DB_HOST=localhost
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_NAME=banco
```

> 🔒 **Nunca envie o arquivo `.env` para o GitHub.** Ele contém a senha do seu banco de dados.

### 6. Execute o programa

```bash
python login.py
```

---

## 🖥️ Como usar

Ao iniciar, o programa conecta ao banco e mostra um menu com as opções:

| Opção      | O que faz                                  |
| ---------- | ------------------------------------------ |
| `Cadastro` | Cria um novo usuário (nome, e-mail, senha) |
| `Login`    | Autentica um usuário já cadastrado         |
| `Sair`     | Encerra o programa                         |

---

## 🗄️ Modelo do banco de dados

O banco `banco` é composto por quatro tabelas:

| Tabela        | Descrição                                                    |
| ------------- | ------------------------------------------------------------ |
| `Clientes`    | Dados dos clientes (nome, CPF, e-mail, telefone, senha)      |
| `Agencias`    | Agências do banco                                            |
| `Contas`      | Contas dos clientes (tipo, saldo, limite, status)            |
| `Transacoes`  | Movimentações (depósito, saque, transferência, pagamento)    |

**Relacionamentos:**

- Um cliente pode ter várias contas
- Uma agência pode ter várias contas
- Uma conta pode ter várias transações (como origem ou destino)

---

## 🔐 Segurança

- As credenciais do banco ficam no `.env`, fora do código.
- As consultas usam parâmetros (`%s`), o que protege contra SQL Injection.
- O `.env` está listado no `.gitignore`.

---

## 🔮 Próximos passos

- [ ] Armazenar senhas com hash (`bcrypt`) em vez de texto puro
- [ ] Tratamento de erros com `try/except` e `rollback`
- [ ] Validação dos dados digitados (e-mail, CPF, senha)
- [ ] Limite de tentativas de login
- [ ] Separar o código em funções e módulos
- [ ] Depósito, saque e transferência com transações SQL
- [ ] Consulta de saldo e extrato

---

## 👨‍💻 Autor

**Riquelwe Rodrigues**

[![GitHub](https://img.shields.io/badge/GitHub-Riquelwe-181717?style=for-the-badge&logo=github)](https://github.com/Riquelwe)
