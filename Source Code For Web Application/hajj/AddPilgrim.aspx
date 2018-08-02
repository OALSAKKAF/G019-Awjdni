<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/MasterPage.master" AutoEventWireup="true" CodeFile="AddPilgrim.aspx.cs" Inherits="hajj_AddPilgrim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .text-red {
            color: #FF0000;
            font-weight: 700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="box2">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="box4">إضافة الحجاج</div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <br />
                                    <br />
                                    <div class="border">
                                        <p class="">1- المعلومات الشخصية</p>
                                            
                                            
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="TbQRID" class="control-label">QR كود</label>
                                                    <asp:TextBox ID="TbQRID" runat="server" Enabled="false" CssClass="form-control text-center" Width="100%" placeholder="QR NUMBER"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label for="TbPASSPORTID" class="control-label">رقم الجواز</label>
                                                    <asp:TextBox ID="TbPASSPORTID" AutoPostBack="false" runat="server" CssClass="form-control text-center" Width="100%" placeholder="رقم الجواز"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="يجب كتابة رقم الجواز" ControlToValidate="TbPASSPORTID" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                                </div>
                                                

                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="ImgQRID" class="control-label">QR كود</label>
                                                    <asp:Image ID="ImgQRID" BackColor="Black" BorderStyle="Solid" BorderWidth="1px" Enabled="false" CssClass="" Width="100%" Height="100%" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                                    <label for="TbNATIONALITY" class="control-label">الجنسية</label>
                                                    <asp:DropDownList ID="DdlNATIONALITY" AutoPostBack="false" placeholder="الجنسية" CssClass="form-control center-block text-center" runat="server">
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="يجب إختيار الجنسية" ControlToValidate="DdlNATIONALITY" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                                </div>
                                        <div class="form-group">
                                            <label for="TbFULLNAME" class="control-label">الإسم كاملاً حسب الجواز</label>
                                            <asp:TextBox ID="TbFULLNAME" runat="server" CssClass="form-control text-center" Width="100%" placeholder="الإسم كاملاً مطابق للجواز"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="يجب كتابة الإسم كاملاً" ControlToValidate="TbFULLNAME" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label for="TbADDRESS" class="control-label">عنوان السكن</label>
                                            <asp:TextBox ID="TbADDRESS" runat="server" CssClass="form-control  text-center" Width="100%" placeholder="عنوان السكن"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="يجب كتابة عنوان السكن الخاص بالحاج" ControlToValidate="TbADDRESS" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <br />
                                    <br />
                                    <div class="border">
                                        <p>2- المعلومات الصحية</p>

                                        <asp:CheckBoxList ID="CHKL1" CssClass="checkbox" runat="server">
                                            <asp:ListItem>سكري</asp:ListItem>
                                            <asp:ListItem>ضغط</asp:ListItem>
                                            <asp:ListItem>إلتهاب كبير</asp:ListItem>
                                            <asp:ListItem>أمراض تنفسية</asp:ListItem>
                                            <asp:ListItem>أعمى</asp:ListItem>
                                            <asp:ListItem>فاقد سمع</asp:ListItem>
                                            <asp:ListItem>مشلول</asp:ListItem>
                                            <asp:ListItem>أخرى</asp:ListItem>
                                        </asp:CheckBoxList>

                                        <div class="form-group">
                                            <label for="TbBLOOD" class="control-label">فصيلة الدم</label>
                                            <asp:DropDownList ID="DdlBLOOD" CssClass="form-control center-block text-center" runat="server">
                                                <asp:ListItem Value="A+">فصيلة دم A+</asp:ListItem>
                                                <asp:ListItem Value="B+">فصيلة دم B+</asp:ListItem>
                                                <asp:ListItem Value="O+">فصيلة دم O+</asp:ListItem>
                                                <asp:ListItem Value="AB+">فصيلة دم AB+</asp:ListItem>
                                                <asp:ListItem Value="A-">فصيلة دم A-</asp:ListItem>
                                                <asp:ListItem Value="B-">فصيلة دم B-</asp:ListItem>
                                                <asp:ListItem Value="O-">فصيلة دم O-</asp:ListItem>
                                                <asp:ListItem Value="AB-">فصيلة دم AB-</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="يجب إختيار فصيلة الدم" ControlToValidate="DdlBLOOD" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label for="FileUpload1" class="control-label">تحميل التقرير الطبي</label>
                                            <div class="row">
                                            <div class="col-lg-10"><asp:FileUpload ID="FileUpload1" CssClass="form-control pull-right" runat="server" /></div>
                                            <div class="col-lg-2"><asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary pull-right" Text="تحميل" OnClick="btnUpload_Click" /></div>
                                            </div>
                                            <br />
                                            <asp:Label ID="LblUpload" runat="server" Text="" style="font-weight: 700;"></asp:Label>
                                            <asp:Label ID="lbl" runat="server" Text="" style="font-weight: 700;"></asp:Label>
                                        </div>                                      
                                    </div>
                                    
                                </div>
                                <div class="col-lg-4">
                                    <br />
                                    <br />
                                    <div class="border">
                                        <p>معلومات المكتب</p>
                                        <div class="form-group">
                                            <label for="TbUID" class="control-label">رقم المستخدم</label>
                                            <asp:TextBox ID="TbUID" runat="server" Enabled="false" CssClass="form-control  text-center" Width="100%" placeholder="رقم  عضوية المستخدم"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TbOID" class="control-label">رقم المكتب</label>
                                            <asp:TextBox ID="TbOID" runat="server" Enabled="false" CssClass="form-control  text-center" Width="100%" placeholder="رقم عضوية المكتب"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TbNAME" class="control-label">إسم المكتب</label>
                                            <asp:TextBox ID="TbNAME" runat="server" Enabled="false" CssClass="form-control  text-center" Width="100%" placeholder="إسم المكتب"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TbADDRESSOff" class="control-label">عنوان المكتب</label>
                                            <asp:TextBox ID="TbADDRESSOff" runat="server" Enabled="false" CssClass="form-control  text-center" Width="100%" placeholder="عنوان المكتب"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TbPHONE" class="control-label">هاتف المكتب</label>
                                            <asp:TextBox ID="TbPHONE" runat="server" Enabled="false" CssClass="form-control  text-center" Width="100%" placeholder="هاتف المكتب"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="TbMOBILE" class="control-label">جوال المكتب</label>
                                            <asp:TextBox ID="TbMOBILE" runat="server" Enabled="false" CssClass="form-control  text-center" Width="100%" placeholder="جوال المكتب"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                            </div>
                         
                            <div class="form-group">
                                <br />
                                <asp:Button ID="BtnAddPilgrim" runat="server" Enabled="false" ValidationGroup="vg" CssClass="btn btn-primary center-block" Text="حفظ البيانات" OnClick="BtnAddPilgrim_Click" />
                                <br />
                                <asp:Label ID="LblError" runat="server" ForeColor="Red" CssClass="text-center center-block" Font-Bold="true" Text=""></asp:Label>
                            </div>
                             
                        </div>
                    </div>
                
               
        </div>
    </div>
</asp:Content>

