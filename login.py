import os
from dotenv import load_dotenv
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
import mysql.connector

load_dotenv()

conexao = mysql.connector.connect( 
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)

if conexao.is_connected():
    print("Conexao bem sucedida!")
    cursor = conexao.cursor()
else:
    raise SystemExit("Nao foi possivel conectar ao banco de dados.")

while True:
    acao = input('Oque deseja fazer?\n Opções:\n Cadastro:\n Login:\n digite uma opção:')

    if acao == "Cadastro":
        nome = input('Informe seu nome Completo:')
        email = input('Informe seu email:')
        senha = input('Informe sua senha:')

        sql = """
        INSERT INTO cadastro (nome, email, senha)
        VALUES (%s, %s, %s)
        """

        cursor.execute(sql, (nome, email, senha))
        conexao.commit()

        print("Seu cadastro foi realizado com sucesso!\n vc sera direcionado para o login->")

    elif acao == "Login":

        email = input("Informe seu email: ")
        senha = input("Informe sua senha: ")

        sql = """
            SELECT nome FROM cadastro
            WHERE email = %s AND senha = %s
            """
        cursor.execute(sql, (email, senha))

        usuario = cursor.fetchone()

        if usuario:
            print(f"\n Login realizado com sucesso! Bem vindo, {usuario[0]}")

        else:
            print('Email ou senhas incorretos.')

    elif acao == "Sair":

        print("Sitema encerrado.")
        break

    else:
            print("Opção invalida. tente novamente.")
