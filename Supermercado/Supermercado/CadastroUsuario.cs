using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Supermercado
{
    public partial class CadastroUsuario : Form
    {
        public CadastroUsuario()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();// Fecha todo o programa
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            Login fromlogUser = new Login();
            fromlogUser.Show();// Vai para a tela de login
            this.Close();// Fecha a tela de cadastro
        }

        private void btnCadastrar_Click(object sender, EventArgs e)
        {
            string nome = txtUsuario1 .Text;// Recebe o usuário
            string senha = txtSenha1.Text;// Recebe a senha

            ConectaBancoMercado con = new ConectaBancoMercado();
            bool res = con.insereUsuario(nome,senha);// Chama a função insereUsuario
            if (res == true) // se ela retornar true manda a mensagem
                MessageBox.Show("Usuário cadastrado com sucesso :)");
            else // se não ela retona erro
                MessageBox.Show("Erro ao cadastar usuário :(");
        }
    }
}
