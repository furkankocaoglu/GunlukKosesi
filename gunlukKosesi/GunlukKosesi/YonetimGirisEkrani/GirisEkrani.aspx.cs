using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace GunlukKosesi.YonetimGirisEkrani
{
    public partial class GirisEkrani : System.Web.UI.Page
    {
        VeriModel vm = new VeriModel();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_username.Text))
            {
                if (!string.IsNullOrEmpty(tb_password.Text))
                {
                    Yonetici y = vm.YoneticiGiris(tb_username.Text, tb_password.Text);
                    if (y != null)
                    {
                        Session["GirisYapanYonetici"] = y;

                        Response.Redirect("YoneticiDefault.aspx");
                    }
                    else
                    {
                        pnl_error.Visible = true;
                        lbl_errorMessage.Text = "E-posta, Kullanıcı Adı veya Şifre Hatası";
                    }

                }
                else
                {
                    pnl_error.Visible = true;
                    lbl_errorMessage.Text = "Şifre boş geçilemez";
                }
            }
            else
            {
                pnl_error.Visible = true;
                lbl_errorMessage.Text = "Mail boş geçilemez";
            }

        }

    }
    
}