<%@ Page Language="C#" MasterPageFile="~/Views/Shared/SiteTemplate.Master" Inherits="System.Web.Mvc.ViewPage<SupportViewData>"%>
<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

            GenerateScript();

            Page.Header.Title = "{0} - FAQ".FormatWith(Model.SiteTitle);
        }

        private void GenerateScript()
        {
            jQueryScriptManager scriptManager = jQueryScriptManager.Current;

            scriptManager.RegisterSource(Url.Asset("faq"));

            scriptManager.RegisterOnReady("Faq.init();");
            scriptManager.RegisterOnDispose("Faq.dispose();");
        }

    </script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <%= Html.PageHeader("Frequently Asked Questions")%>
    <ol id="faq">
        <li>
            <a class="q" href="javascript:void(0)">Kt�re artyku�y mog� publikowa�?</a>
            <div class="ans">Akceptujemy tylko artyku�y, kt�re dotycz� platformy .Net, je�li jednak znalaz�es/a� artyku�, kt�ry nie dotyczy bezpo�rednio .Net, a uwa�asz �e programi�ci pisz�cy w tej technologii mogliby na tym skorzysta�, r�wnie� mo�esz opublikowa� taki artyku�.</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">Jaka jest r�znica mi�dzy logowaniem OpenId, a kontem w tym portalu?</a>
            <div class="ans"><a href="http://openid.net/" target="_blank" rel="nofollow">OpenID</a> eliminuje potrzeb� posiadania kont w r�nych portalach. Wspieramy logowanie OpenId, co oznacza, �e je�li masz konto w <a href="http://openid.yahoo.com/" target="_blank" rel="nofollow">Yahoo</a>, <a href="http://openid.aol.com/" target="_blank" rel="nofollow">AOL</a>, <a href="http://wordpress.com/" target="_blank" rel="nofollow">Wordpress</a>, <a href="http://blogspot.com/" target="_blank" rel="nofollow">Blogger</a> lub <a href="https://www.myopenid.com/" target="_blank" rel="nofollow">myOpenID</a> (itp.) mo�esz zalogowa� si� bez rejestracji na dotnetomaniak.pl. Je�li nie masz �adnego loginu OpenID, mo�esz je utworzy� za darmo <a href="https://www.myopenid.com/signup?affiliate_id=22806&amp;openid.sreg.optional=email" target="_blank">tutaj</a>. U�ytkownik�w loguj�cych si� przez OpenID i bezpo�rednio poprzez konto w portalu traktujemy tak samo. Jednak niekt�re portale dostarczaj�ce logowanie OpenID nie podaj� adresu e-mail u�ytykownika, co uniemo�liwia korzystanie z niekt�rych funkcji portalu (n.p. powiadomienia o komenatrzach poprzez e-mail).</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">Co to jest ".Netomaniak"?</a>
            <div class="ans"><em>.Netomaniak</em> odnosci si� do przydatno�ci artyku�u. Pokazuje, jak spo�eczno�� dotnetomaniak.pl ocenia artyku� poprzez klikni�cie <em>Promuj</em>.</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">Co to jest liczba punkt�w u�ytkownika?  Jak jest obliczana?</a>
            <div class="ans">
                Liczba punkt�w u�ytkownika pokazuje jego zaanga�owanie w aktywne uczestnictwo w portalu. Wi�kszo�� dzia�a� na rzecz portalu ma przypisan� ilo�� punkt�w:
                <table>
                    <colgroup span="1" style="text-align:left"></colgroup>
                    <colgroup span="1" style="text-align:right"></colgroup>
                    <tbody>
                        <tr>
                            <th>Aktywno��</th>
                            <th>Punkty</th>
                        </tr>
                        <tr>
                            <td>Rejestracja/Przypisanie OpenID</td>
                            <td>05.00</td>
                        </tr>
                        <tr>
                            <td>Wys�anie artyku�u</td>
                            <td>10.00</td>
                        </tr>
                        <tr>
                            <td>Artyku� wy�wietlony na pierwszej stronie</td>
                            <td>05.00</td>
                        </tr>
                        <tr>
                            <td>Link klikni�ty<sup>*</sup></td>
                            <td>00.01</td>
                        </tr>
                        <tr>
                            <td>Nadchodz�cy artyku� wypromowany<sup>*</sup></td>
                            <td>03.00</td>
                        </tr>
                        <tr>
                            <td>Opublikowany artyku� wypromowany<sup>*</sup></td>
                            <td>02.00</td>
                        </tr>
                        <tr>
                            <td>Oznaczenie artyku�u jako spam<sup>*</sup></td>
                            <td>05.00</td>
                        </tr>
                        <tr>
                            <td>Napisanie komentarza<sup>*</sup></td>
                            <td>01.00</td>
                        </tr>
                        <tr>
                            <td>Tw�j komentarz oznaczono jako obra�liwy</td>
                            <td>-1.00</td>
                        </tr>
                        <tr>
                            <td>B��dne oznaczenie komentarza jako spam</td>
                            <td>-1.00</td>
                        </tr>
                        <tr>
                            <td>Tw�j artyku� oznaczono jako spam</td>
                            <td>-50.0</td>
                        </tr>
                        <tr>
                            <td>Tw�j komentarz oznaczono jako spam</td>
                            <td>-20.0</td>
                        </tr>
                    </tbody>
                </table>
                <sup>*</sup>Artyku� nie jest starszy ni� 10 dni.
                <br />
                (Powy�sze dane moga by� zmienione bez wcze�niejszego ostrze�enia)
                <br />
                Je�li punkty u�ytkownika spadn� poni�ej zera, konto mo�e zosta� usuni�te.
            </div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">Co to Top .Netomaniacy & Top dnia?</a>
            <div class="ans"><em>Top dnia</em> to lista u�ytkownik�w kt�rzy zarobili najwi�cej punkt�w w ci�gu ostatnich 24 godzin, a <em>Top .Netomaniacy</em> to u�ytkownicy posiadaj�cy najwi�cej punkt�w w klasyfikacji og�lnej.</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">W jaki spos�b artyku�y zostaj� opublikowane? Dlaczego m�j artyku� nigdy nie zosta� opublikowany?</a>
            <div class="ans">Artyku�y s� publikowane na podstawie .Netomaniak�w, komentarzy, aktualno�ci, wy�wietle�, punkt�w u�ytkownika (kt�ry g�osowa� na artyku�), �r�d�a artyku�u itd. Im lepsze s� wymienione podstawy do oceny, tym wi�ksza szansa na opublikowanie artyku�u. W momencie opublikowania 20 najlepszych artyku��w jest umieszczanych na stronie g��wnej. Publikacja nast�puje 4/5 razy dziennie, w zale�no�ci od ilo�ci artyku��w w kolejce do publikacji.</div>
        </li>
        <li>
            <a class="q" href="javascript:void(0)">Mam sw�j blog, czy mog� umie�ci� licznik <em>Promuj</em> na blogu?</a>
            <div class="ans">
                Naj�atwiej jest skopiowa� link <em>poka� kod licznika</em>, nastepnie wklej html na sw�j blog. Je�li taka forma nie jest wystarczaj�ca spr�buj:
                <ul>
                    <li><a href="http://download.live.com/writer" target="_blank" rel="nofollow">Live Writer</a> Plugin.</li>
                    <li><a href="http://www.dotnetblogengine.net/" target="_blank" rel="nofollow">BlogEngine.NET</a> Extension.</li>
                    <li><a href="http://graffiticms.com/" target="_blank" rel="nofollow">Graffiti Cms</a> Chalk.</li>
                    <li><a href="http://communityserver.com/" target="_blank" rel="nofollow">Community Server</a> ICSModule.</li>
                </ul>
                Wymienione komponenty maj� mo�liwo�� pe�nej zmiany ustawie� licznika <em>Promuj</em> i dostepny kod �r�d�owy. Aby �ci�gn�� wejd� na stron� <a href="http://www.codeplex.com/Kigg/Release/ProjectReleases.aspx" target="_blank">release'�w Kigg</a> i post�puj zgodnie z instrukcjami.
                <br />
            </div>
        </li>	
    </ol>
</asp:Content>
