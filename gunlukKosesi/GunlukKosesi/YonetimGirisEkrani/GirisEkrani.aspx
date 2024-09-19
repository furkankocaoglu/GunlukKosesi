<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GirisEkrani.aspx.cs" Inherits="GunlukKosesi.YonetimGirisEkrani.GirisEkrani" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <br />
    <div class="tasiyici" style="margin: 0 auto">
        <div class="girisekrani">
            <h1>Yönetici Giriş</h1>
            <br />
            <asp:Panel ID="pnl_error" runat="server" CssClass="errorpanel" Visible="false">
                <asp:Label ID="lbl_errorMessage" runat="server">E-posta veya Kullanıcı Adı Hatası!!!</asp:Label>
            </asp:Panel>
            <div class="satir">
                <label>E-posta veya Kullanıcı Adı</label><br />
                <asp:TextBox ID="tb_username" runat="server" CssClass="mailsifrekutu" placeholder="email@gmail.com" />
            </div>
            <div class="satir">
                <label>Şifre</label><br />
                <asp:TextBox ID="tb_password" runat="server" CssClass="mailsifrekutu" TextMode="Password" placeholder="••••••••" />
            </div>
            <asp:Button ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Giriş yap" CssClass="loginbutton" />
            <br />
            <br />
            <div class="satir">
                <asp:CheckBox ID="cb_oturumAcikTut" runat="server" />
                <asp:Label ID="lbl_oturumAcikTut" runat="server">Hatırla</asp:Label>
                <br />
                <br />
            </div>
            <div class="satir">
                <a href="#" class="lgn">Giriş yapamıyor musun?</a><br />
                <a href="#" class="hsp">Hesap oluştur</a>
            </div>
        </div>
    </div>
</form>
</body>
</html>
