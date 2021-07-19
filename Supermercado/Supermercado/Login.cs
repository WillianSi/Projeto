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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void Login_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();// Fecha o programa
        }

        private void btnCadastro_Click(object sender, EventArgs e)
        {
            CadastroUsuario fromCadUser = new CadastroUsuario();
            fromCadUser.Show();// Vai para a tela de cadastro
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            ConectaBancoMercado con = new ConectaBancoMercado();
            
            // Chama a função consultaUsuario se for true vai para tela de sistema se não exibe uma mensagem
            if (con.consultaUsuario(txtUsuario.Text, txtSenha.Text) == true)
            {
                sistema formSistema = new sistema();
                formSistema.Show();
            }
            else
                MessageBox.Show("Usuario ou senha incorreta :(");

        }
    }
}
