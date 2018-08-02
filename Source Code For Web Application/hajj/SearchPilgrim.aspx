<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/hajj/MasterPage.master" AutoEventWireup="true" CodeFile="SearchPilgrim.aspx.cs" Inherits="hajj_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .txtcenter {
            text-align: center !important;
            font-size: 18px !important;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="box2">
                    <asp:Panel ID="PnlForm" runat="server">
                        <%-- بداية كود البحث --%>
                        <div class="row">
                            <div class="box4">إدارة بيانات الحجاج</div>
                            <br /><br />
                            <div class="col-lg-2"></div>
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <div class="col-lg-1">
                                        <label for="TbQRID" class="control-label">البحث</label>
                                    </div>
                                    <div class="col-lg-10">
                                        <asp:TextBox ID="TbQRID" runat="server" Enabled="true" CssClass="form-control text-center" Width="100%" placeholder="أدخل رقم الجواز أو ال QRID أو الإسم أو الجنسية أو فصيلة الدم أو العنوان"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-1">
                                        <asp:Button ID="BtnSearchPilgrim" runat="server" ValidationGroup="vg" CssClass="btn btn-primary center-block" Text="بحث" OnClick="BtnSearchPilgrim_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2"></div>

                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-8 text-center">
                                <div class="col-lg-1" ></div>
                                <div class="col-lg-5">
                                    <asp:Button ID="btnPrintCurrent" Width="75%" CssClass="btn btn-primary" runat="server" Text="طباعة البيانات الحالية" OnClick="PrintCurrentPage" />
                                </div>
                                <div class="col-lg-5">
                                    <asp:Button ID="btnExportPdf" Width="75%" Enabled="true" CssClass="btn btn-primary" runat="server" Text="PDF إنشاء كروت التعريف" OnClick="btnExportPdf_Click" />
                                </div>
                                <div class="col-lg-1" ></div>
                                <br /><br /><br /><asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" Text=""></asp:HyperLink>
                            </div>
                            <div class="col-lg-2">
                            </div>
                        </div>
                        <%-- نهاية كود البحث --%>
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="PnlGv" runat="server">
                        <ContentTemplate>
                        <%-- بداية كود الجريد --%>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView ID="GV1" Width="100%" AllowPaging="false" OnPageIndexChanging="OnPaging" OnRowCancelingEdit="GV1_RowCancelingEdit" OnRowUpdating="GV1_RowUpdating" OnRowEditing="GV1_RowEditing" OnRowDeleting="GV1_RowDeleting" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <%--  --%>
                                        <asp:TemplateField Visible="false" HeaderText="PID" HeaderStyle-CssClass="txtcenter">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPID" runat="server" Text='<%# Eval("PID") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TbPID" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("PID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <%--  --%>
                                        <asp:TemplateField Visible="true" HeaderText="QRID" HeaderStyle-CssClass="txtcenter">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQRID" runat="server" Text='<%# Eval("QRID") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TbQRIDD" Enabled="false" CssClass="form-control" runat="server" Text='<%# Eval("QRID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <%--  --%>
                                        <asp:TemplateField Visible="true" HeaderText="رقم الجواز" HeaderStyle-Width="" HeaderStyle-CssClass="txtcenter">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPASSPORTID" runat="server" Text='<%# Eval("PASSPORTID") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TbPASSPORTID" runat="server" CssClass="form-control" Text='<%# Eval("PASSPORTID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <%--  --%>
                                        <asp:TemplateField HeaderText="الإسم الكامل" HeaderStyle-Width="200px" HeaderStyle-CssClass="txtcenter">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFULLNAME" runat="server" Text='<%# Eval("FULLNAME") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TbFULLNAME" runat="server" CssClass="form-control" Text='<%# Eval("FULLNAME") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <%--  --%>
                                        <asp:TemplateField HeaderText="الجنسية" HeaderStyle-Width="30px" HeaderStyle-CssClass="txtcenter">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNATIONALITY" runat="server" Text='<%# Eval("NATIONALITY") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DdlNATIONALITY" AutoPostBack="true" Text='<%# Eval("NATIONALITY") %>' CssClass="form-control center-block text-center" runat="server">
                                                    <asp:ListItem Selected="True" Value="0">قم بإختيار الجنسية</asp:ListItem>
                                                    <asp:ListItem Value="afghan">Afghan</asp:ListItem>
                                                    <asp:ListItem Value="albanian">Albanian</asp:ListItem>
                                                    <asp:ListItem Value="algerian">Algerian</asp:ListItem>
                                                    <asp:ListItem Value="american">American</asp:ListItem>
                                                    <asp:ListItem Value="andorran">Andorran</asp:ListItem>
                                                    <asp:ListItem Value="angolan">Angolan</asp:ListItem>
                                                    <asp:ListItem Value="antiguans">Antiguans</asp:ListItem>
                                                    <asp:ListItem Value="argentinean">Argentinean</asp:ListItem>
                                                    <asp:ListItem Value="armenian">Armenian</asp:ListItem>
                                                    <asp:ListItem Value="australian">Australian</asp:ListItem>
                                                    <asp:ListItem Value="austrian">Austrian</asp:ListItem>
                                                    <asp:ListItem Value="azerbaijani">Azerbaijani</asp:ListItem>
                                                    <asp:ListItem Value="bahamian">Bahamian</asp:ListItem>
                                                    <asp:ListItem Value="bahraini">Bahraini</asp:ListItem>
                                                    <asp:ListItem Value="bangladeshi">Bangladeshi</asp:ListItem>
                                                    <asp:ListItem Value="barbadian">Barbadian</asp:ListItem>
                                                    <asp:ListItem Value="barbudans">Barbudans</asp:ListItem>
                                                    <asp:ListItem Value="batswana">Batswana</asp:ListItem>
                                                    <asp:ListItem Value="belarusian">Belarusian</asp:ListItem>
                                                    <asp:ListItem Value="belgian">Belgian</asp:ListItem>
                                                    <asp:ListItem Value="belizean">Belizean</asp:ListItem>
                                                    <asp:ListItem Value="beninese">Beninese</asp:ListItem>
                                                    <asp:ListItem Value="bhutanese">Bhutanese</asp:ListItem>
                                                    <asp:ListItem Value="bolivian">Bolivian</asp:ListItem>
                                                    <asp:ListItem Value="bosnian">Bosnian</asp:ListItem>
                                                    <asp:ListItem Value="brazilian">Brazilian</asp:ListItem>
                                                    <asp:ListItem Value="british">British</asp:ListItem>
                                                    <asp:ListItem Value="bruneian">Bruneian</asp:ListItem>
                                                    <asp:ListItem Value="bulgarian">Bulgarian</asp:ListItem>
                                                    <asp:ListItem Value="burkinabe">Burkinabe</asp:ListItem>
                                                    <asp:ListItem Value="burmese">Burmese</asp:ListItem>
                                                    <asp:ListItem Value="burundian">Burundian</asp:ListItem>
                                                    <asp:ListItem Value="cambodian">Cambodian</asp:ListItem>
                                                    <asp:ListItem Value="cameroonian">Cameroonian</asp:ListItem>
                                                    <asp:ListItem Value="canadian">Canadian</asp:ListItem>
                                                    <asp:ListItem Value="cape verdean">Cape Verdean</asp:ListItem>
                                                    <asp:ListItem Value="central african">Central African</asp:ListItem>
                                                    <asp:ListItem Value="chadian">Chadian</asp:ListItem>
                                                    <asp:ListItem Value="chilean">Chilean</asp:ListItem>
                                                    <asp:ListItem Value="chinese">Chinese</asp:ListItem>
                                                    <asp:ListItem Value="colombian">Colombian</asp:ListItem>
                                                    <asp:ListItem Value="comoran">Comoran</asp:ListItem>
                                                    <asp:ListItem Value="congolese">Congolese</asp:ListItem>
                                                    <asp:ListItem Value="costa rican">Costa Rican</asp:ListItem>
                                                    <asp:ListItem Value="croatian">Croatian</asp:ListItem>
                                                    <asp:ListItem Value="cuban">Cuban</asp:ListItem>
                                                    <asp:ListItem Value="cypriot">Cypriot</asp:ListItem>
                                                    <asp:ListItem Value="czech">Czech</asp:ListItem>
                                                    <asp:ListItem Value="danish">Danish</asp:ListItem>
                                                    <asp:ListItem Value="djibouti">Djibouti</asp:ListItem>
                                                    <asp:ListItem Value="dominican">Dominican</asp:ListItem>
                                                    <asp:ListItem Value="dutch">Dutch</asp:ListItem>
                                                    <asp:ListItem Value="east timorese">East Timorese</asp:ListItem>
                                                    <asp:ListItem Value="ecuadorean">Ecuadorean</asp:ListItem>
                                                    <asp:ListItem Value="egyptian">Egyptian</asp:ListItem>
                                                    <asp:ListItem Value="emirian">Emirian</asp:ListItem>
                                                    <asp:ListItem Value="equatorial guinean">Equatorial Guinean</asp:ListItem>
                                                    <asp:ListItem Value="eritrean">Eritrean</asp:ListItem>
                                                    <asp:ListItem Value="estonian">Estonian</asp:ListItem>
                                                    <asp:ListItem Value="ethiopian">Ethiopian</asp:ListItem>
                                                    <asp:ListItem Value="fijian">Fijian</asp:ListItem>
                                                    <asp:ListItem Value="filipino">Filipino</asp:ListItem>
                                                    <asp:ListItem Value="finnish">Finnish</asp:ListItem>
                                                    <asp:ListItem Value="french">French</asp:ListItem>
                                                    <asp:ListItem Value="gabonese">Gabonese</asp:ListItem>
                                                    <asp:ListItem Value="gambian">Gambian</asp:ListItem>
                                                    <asp:ListItem Value="georgian">Georgian</asp:ListItem>
                                                    <asp:ListItem Value="german">German</asp:ListItem>
                                                    <asp:ListItem Value="ghanaian">Ghanaian</asp:ListItem>
                                                    <asp:ListItem Value="greek">Greek</asp:ListItem>
                                                    <asp:ListItem Value="grenadian">Grenadian</asp:ListItem>
                                                    <asp:ListItem Value="guatemalan">Guatemalan</asp:ListItem>
                                                    <asp:ListItem Value="guinea-bissauan">Guinea-Bissauan</asp:ListItem>
                                                    <asp:ListItem Value="guinean">Guinean</asp:ListItem>
                                                    <asp:ListItem Value="guyanese">Guyanese</asp:ListItem>
                                                    <asp:ListItem Value="haitian">Haitian</asp:ListItem>
                                                    <asp:ListItem Value="herzegovinian">Herzegovinian</asp:ListItem>
                                                    <asp:ListItem Value="honduran">Honduran</asp:ListItem>
                                                    <asp:ListItem Value="hungarian">Hungarian</asp:ListItem>
                                                    <asp:ListItem Value="icelander">Icelander</asp:ListItem>
                                                    <asp:ListItem Value="indian">Indian</asp:ListItem>
                                                    <asp:ListItem Value="indonesian">Indonesian</asp:ListItem>
                                                    <asp:ListItem Value="iranian">Iranian</asp:ListItem>
                                                    <asp:ListItem Value="iraqi">Iraqi</asp:ListItem>
                                                    <asp:ListItem Value="irish">Irish</asp:ListItem>
                                                    <asp:ListItem Value="palestine">palestine</asp:ListItem>
                                                    <asp:ListItem Value="italian">Italian</asp:ListItem>
                                                    <asp:ListItem Value="ivorian">Ivorian</asp:ListItem>
                                                    <asp:ListItem Value="jamaican">Jamaican</asp:ListItem>
                                                    <asp:ListItem Value="japanese">Japanese</asp:ListItem>
                                                    <asp:ListItem Value="jordanian">Jordanian</asp:ListItem>
                                                    <asp:ListItem Value="kazakhstani">Kazakhstani</asp:ListItem>
                                                    <asp:ListItem Value="kenyan">Kenyan</asp:ListItem>
                                                    <asp:ListItem Value="kittian and nevisian">Kittian and Nevisian</asp:ListItem>
                                                    <asp:ListItem Value="kuwaiti">Kuwaiti</asp:ListItem>
                                                    <asp:ListItem Value="kyrgyz">Kyrgyz</asp:ListItem>
                                                    <asp:ListItem Value="laotian">Laotian</asp:ListItem>
                                                    <asp:ListItem Value="latvian">Latvian</asp:ListItem>
                                                    <asp:ListItem Value="lebanese">Lebanese</asp:ListItem>
                                                    <asp:ListItem Value="liberian">Liberian</asp:ListItem>
                                                    <asp:ListItem Value="libyan">Libyan</asp:ListItem>
                                                    <asp:ListItem Value="liechtensteiner">Liechtensteiner</asp:ListItem>
                                                    <asp:ListItem Value="lithuanian">Lithuanian</asp:ListItem>
                                                    <asp:ListItem Value="luxembourger">Luxembourger</asp:ListItem>
                                                    <asp:ListItem Value="macedonian">Macedonian</asp:ListItem>
                                                    <asp:ListItem Value="malagasy">Malagasy</asp:ListItem>
                                                    <asp:ListItem Value="malawian">Malawian</asp:ListItem>
                                                    <asp:ListItem Value="malaysian">Malaysian</asp:ListItem>
                                                    <asp:ListItem Value="maldivan">Maldivan</asp:ListItem>
                                                    <asp:ListItem Value="malian">Malian</asp:ListItem>
                                                    <asp:ListItem Value="maltese">Maltese</asp:ListItem>
                                                    <asp:ListItem Value="marshallese">Marshallese</asp:ListItem>
                                                    <asp:ListItem Value="mauritanian">Mauritanian</asp:ListItem>
                                                    <asp:ListItem Value="mauritian">Mauritian</asp:ListItem>
                                                    <asp:ListItem Value="mexican">Mexican</asp:ListItem>
                                                    <asp:ListItem Value="micronesian">Micronesian</asp:ListItem>
                                                    <asp:ListItem Value="moldovan">Moldovan</asp:ListItem>
                                                    <asp:ListItem Value="monacan">Monacan</asp:ListItem>
                                                    <asp:ListItem Value="mongolian">Mongolian</asp:ListItem>
                                                    <asp:ListItem Value="moroccan">Moroccan</asp:ListItem>
                                                    <asp:ListItem Value="mosotho">Mosotho</asp:ListItem>
                                                    <asp:ListItem Value="motswana">Motswana</asp:ListItem>
                                                    <asp:ListItem Value="mozambican">Mozambican</asp:ListItem>
                                                    <asp:ListItem Value="namibian">Namibian</asp:ListItem>
                                                    <asp:ListItem Value="nauruan">Nauruan</asp:ListItem>
                                                    <asp:ListItem Value="nepalese">Nepalese</asp:ListItem>
                                                    <asp:ListItem Value="new zealander">New Zealander</asp:ListItem>
                                                    <asp:ListItem Value="ni-vanuatu">Ni-Vanuatu</asp:ListItem>
                                                    <asp:ListItem Value="nicaraguan">Nicaraguan</asp:ListItem>
                                                    <asp:ListItem Value="nigerien">Nigerien</asp:ListItem>
                                                    <asp:ListItem Value="north korean">North Korean</asp:ListItem>
                                                    <asp:ListItem Value="northern irish">Northern Irish</asp:ListItem>
                                                    <asp:ListItem Value="norwegian">Norwegian</asp:ListItem>
                                                    <asp:ListItem Value="omani">Omani</asp:ListItem>
                                                    <asp:ListItem Value="pakistani">Pakistani</asp:ListItem>
                                                    <asp:ListItem Value="palauan">Palauan</asp:ListItem>
                                                    <asp:ListItem Value="panamanian">Panamanian</asp:ListItem>
                                                    <asp:ListItem Value="papua new guinean">Papua New Guinean</asp:ListItem>
                                                    <asp:ListItem Value="paraguayan">Paraguayan</asp:ListItem>
                                                    <asp:ListItem Value="peruvian">Peruvian</asp:ListItem>
                                                    <asp:ListItem Value="polish">Polish</asp:ListItem>
                                                    <asp:ListItem Value="portuguese">Portuguese</asp:ListItem>
                                                    <asp:ListItem Value="qatari">Qatari</asp:ListItem>
                                                    <asp:ListItem Value="romanian">Romanian</asp:ListItem>
                                                    <asp:ListItem Value="russian">Russian</asp:ListItem>
                                                    <asp:ListItem Value="rwandan">Rwandan</asp:ListItem>
                                                    <asp:ListItem Value="saint lucian">Saint Lucian</asp:ListItem>
                                                    <asp:ListItem Value="salvadoran">Salvadoran</asp:ListItem>
                                                    <asp:ListItem Value="samoan">Samoan</asp:ListItem>
                                                    <asp:ListItem Value="san marinese">San Marinese</asp:ListItem>
                                                    <asp:ListItem Value="sao tomean">Sao Tomean</asp:ListItem>
                                                    <asp:ListItem Value="saudi">Saudi</asp:ListItem>
                                                    <asp:ListItem Value="scottish">Scottish</asp:ListItem>
                                                    <asp:ListItem Value="senegalese">Senegalese</asp:ListItem>
                                                    <asp:ListItem Value="serbian">Serbian</asp:ListItem>
                                                    <asp:ListItem Value="seychellois">Seychellois</asp:ListItem>
                                                    <asp:ListItem Value="sierra leonean">Sierra Leonean</asp:ListItem>
                                                    <asp:ListItem Value="singaporean">Singaporean</asp:ListItem>
                                                    <asp:ListItem Value="slovakian">Slovakian</asp:ListItem>
                                                    <asp:ListItem Value="slovenian">Slovenian</asp:ListItem>
                                                    <asp:ListItem Value="solomon islander">Solomon Islander</asp:ListItem>
                                                    <asp:ListItem Value="somali">Somali</asp:ListItem>
                                                    <asp:ListItem Value="south african">South African</asp:ListItem>
                                                    <asp:ListItem Value="south korean">South Korean</asp:ListItem>
                                                    <asp:ListItem Value="spanish">Spanish</asp:ListItem>
                                                    <asp:ListItem Value="sri lankan">Sri Lankan</asp:ListItem>
                                                    <asp:ListItem Value="sudanese">Sudanese</asp:ListItem>
                                                    <asp:ListItem Value="surinamer">Surinamer</asp:ListItem>
                                                    <asp:ListItem Value="swazi">Swazi</asp:ListItem>
                                                    <asp:ListItem Value="swedish">Swedish</asp:ListItem>
                                                    <asp:ListItem Value="swiss">Swiss</asp:ListItem>
                                                    <asp:ListItem Value="syrian">Syrian</asp:ListItem>
                                                    <asp:ListItem Value="taiwanese">Taiwanese</asp:ListItem>
                                                    <asp:ListItem Value="tajik">Tajik</asp:ListItem>
                                                    <asp:ListItem Value="tanzanian">Tanzanian</asp:ListItem>
                                                    <asp:ListItem Value="thai">Thai</asp:ListItem>
                                                    <asp:ListItem Value="togolese">Togolese</asp:ListItem>
                                                    <asp:ListItem Value="tongan">Tongan</asp:ListItem>
                                                    <asp:ListItem Value="trinidadian or tobagonian">Trinidadian or Tobagonian</asp:ListItem>
                                                    <asp:ListItem Value="tunisian">Tunisian</asp:ListItem>
                                                    <asp:ListItem Value="turkish">Turkish</asp:ListItem>
                                                    <asp:ListItem Value="tuvaluan">Tuvaluan</asp:ListItem>
                                                    <asp:ListItem Value="ugandan">Ugandan</asp:ListItem>
                                                    <asp:ListItem Value="ukrainian">Ukrainian</asp:ListItem>
                                                    <asp:ListItem Value="uruguayan">Uruguayan</asp:ListItem>
                                                    <asp:ListItem Value="uzbekistani">Uzbekistani</asp:ListItem>
                                                    <asp:ListItem Value="venezuelan">Venezuelan</asp:ListItem>
                                                    <asp:ListItem Value="vietnamese">Vietnamese</asp:ListItem>
                                                    <asp:ListItem Value="welsh">Welsh</asp:ListItem>
                                                    <asp:ListItem Value="yemenite">Yemenite</asp:ListItem>
                                                    <asp:ListItem Value="zambian">Zambian</asp:ListItem>
                                                    <asp:ListItem Value="zimbabwean">Zimbabwean</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <%--  --%>
                                        <asp:TemplateField HeaderText="فصيلة الدم" HeaderStyle-CssClass="txtcenter">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBLOOD" runat="server" Text='<%# Eval("BLOOD") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DdlBLOOD" runat="server" Text='<%# Eval("BLOOD") %>' CssClass="form-control center-block text-center" runat="server">
                                                    <asp:ListItem Value="A+">فصيلة دم A+</asp:ListItem>
                                                    <asp:ListItem Value="B+">فصيلة دم B+</asp:ListItem>
                                                    <asp:ListItem Value="O+">فصيلة دم O+</asp:ListItem>
                                                    <asp:ListItem Value="AB+">فصيلة دم AB+</asp:ListItem>
                                                    <asp:ListItem Value="A-">فصيلة دم A-</asp:ListItem>
                                                    <asp:ListItem Value="B-">فصيلة دم B-</asp:ListItem>
                                                    <asp:ListItem Value="O-">فصيلة دم O-</asp:ListItem>
                                                    <asp:ListItem Value="AB-">فصيلة دم AB-</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <%--  --%>
                                        <asp:TemplateField HeaderText="العنوان" HeaderStyle-Width="200px" HeaderStyle-CssClass="txtcenter">
                                            <ItemTemplate>
                                                <asp:Label ID="lblADDRESS" runat="server" Text='<%# Eval("ADDRESS") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TbADDRESS" runat="server" CssClass="form-control" Text='<%# Eval("ADDRESS") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <%--  --%>
                                       

                                        <asp:TemplateField ItemStyle-Height="150" ItemStyle-Width="170">

                                            <ItemTemplate>

                                                <asp:Image ID="Image1" Width="100px" Height="100px" runat="server"
                                                    ImageUrl='<%# GetUrlQrCode(Eval("QRID").ToString())  %>' />
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                       
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ButtonEdit" runat="server" Text="تعديل" CommandName="Edit" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="ButtonUpdate" runat="server" Text="حفظ" CommandName="Update" OnClientClick="return confirm('هل أنت متأكد أنك تريد الحفظ ؟');" />
                                                <asp:LinkButton ID="ButtonCancel" runat="server" Text="إلغاء" CommandName="Cancel" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" ForeColor="Red" runat="server" CausesValidation="False" CommandName="Delete" Text="حذف" OnClientClick="return confirm('هل أنت متأكد أنك تريد الحذف ؟');"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                   
                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#00639C" HorizontalAlign="Center" CssClass="txtcenter" Font-Bold="True" ForeColor="#ffffff" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <RowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                </asp:GridView>
                            </div>
                        </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--  --%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

