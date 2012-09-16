<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteTemplate.Master"
    Inherits="System.Web.Mvc.ViewPage<PromoteSiteViewData>" %>

<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Page.Header.Title = "{0} - Promocja".FormatWith(Model.SiteTitle);
    }        
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2>
        Promuj dotnetomaniaka</h2>
    <span>Je�li chcia�by� promowa� dotnetomaniaka, na swojej stronie czy blogu, tutaj znajdziesz
        niezb�d� do tego celu narz�dzia. Je�li masz jakie� pytania odno�nie promocji lub
        brakuje Ci tu czego� -
        <%= Html.ActionLink("napisz nam wiadomo��", "Contact", "Support")%></span>
    <div id="promotion">
        <ul style="list-style: none">
            <%
                foreach (var item in Model.Items)
                {
            %>
            <li>
                <h2>
                    <%= item.Text %></h2>
                <a href="<%= item.Url %>">
                    <%= Html.Image(item.Url) %></a> </li>
            <%
                } %>
        </ul>
        <p>
            Je�li masz sw�j blog, lub stron� mo�esz umo�liwi� swoim czytelnikom wypromowanie
            mojego artyku�u na dotnetomaniak.pl. Naj�atwiej b�dzie Ci skorzysta� z <a href="http://www.feedburner.com/fb/a/publishers/feedflare">
                FeedFlare</a>. Niezb�dny plik znajduje si� tu: <a href="http://static.dotnetomaniak.pl/feedflare-v2.0.0.2.xml">
                    http://static.dotnetomaniak.pl/feedflare-v2.0.0.2.xml</a>. Je�li nie mo�esz
            skorzysta� z tego pliku skontaktuj si� z nami po wi�cej informacji.</p>
        <p>
            Je�li masz ochot� mo�esz r�wnie� nas reklamowa� w realnym �wiecie. <a href="http://dotnetomaniak.cupsell.pl">
                Odwied� nasz sklep</a> i wybierz co� dla siebie. Dzi�ki temu b�dziesz mia� fajny
            gad�et a nam pomo�esz w rozwoju i utrzymaniu strony.</p>
    </div>
</asp:Content>
