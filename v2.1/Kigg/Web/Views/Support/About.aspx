﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/SiteTemplate.Master" Inherits="System.Web.Mvc.ViewPage<SupportViewData>"%>
<script runat="server">

    protected override void OnInit(EventArgs e)
    {
            base.OnInit(e);
            Page.Header.Title = "{0} - O Nas".FormatWith(Model.SiteTitle);
        }

    </script>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%= Html.PageHeader("O nas")%>
    <h2>Kim jesteśmy</h2>
    <div id="aboutUs">
    <p>Jesteśmy pasjonatami, chcącymi rozwijać społeczność .NET w Polsce. Poprzez portale takie jak ten
    zbliżać wszystkich, którym technologia .NET nie jest obojętna a dzięki umieszczaniu i wymianie artykułów, rozwijać i poszerzać swoją wiedzę.</p>
    <p>Jeśli technologia .NET nie jest Ci obojętna - przyłącz się do nas i zamieszczaj artykuły.</p>
    <p>Obecnie w rozwoju pomagają</p>
    <ul>
	<li><a href="http://pawlos.blogspot.com">Paweł Łukasik</a></li>
	<li><a href="http://geekswithblogs.net/jakubmal/Default.aspx">Jakub Malinowski</a></li>
	<li><a href="#">Michał Laskowski</a></li>
	<li>Michał Jałbrzykowski (grafika)</li>
	<li>Łukasz Wawrzyniak</li>
    </ul>
    <p>Chcesz nam pomóc? Napisz do <a href="<%= Url.RouteUrl("Contact") %>">nas</a>.
    </div>
</asp:Content>
