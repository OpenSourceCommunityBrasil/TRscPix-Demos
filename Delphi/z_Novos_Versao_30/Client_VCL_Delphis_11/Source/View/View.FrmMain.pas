unit View.FrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ShellAPI

  
  , IniFiles
  , TypInfo
  , RscPix
  , RscPixTipos
  , RscPixToken

  , client.Utils, DB, DBClient, Grids, DBGrids

  ;

type
  TFrmMain = class(TForm)
    PageControl1: TPageControl;
    TbsConfig: TTabSheet;
    tbsNovoToken: TTabSheet;
    Memo1: TMemo;
    Panel1: TPanel;
    btn_NovoToken: TButton;
    Panel2: TPanel;
    tbn_SalvarConfig: TButton;
    RscPix1: TRscPix;
    gpbx_ConfigTitular: TGroupBox;
    gpbx_ConfigCertificado: TGroupBox;
    gpbx_ConfigAutenticar: TGroupBox;
    gpbx_ConfigPSP: TGroupBox;
    cbbx_PSP: TComboBox;
    Label1: TLabel;
    cbbx_Ambiente: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_ConfigClientID: TEdit;
    edt_ConfigClientSecret: TEdit;
    edt_ConfigapplicationKey: TEdit;
    Label6: TLabel;
    edt_ConfigCert: TEdit;
    Label7: TLabel;
    edt_ConfigCertKey: TEdit;
    btn_Config_Cert: TButton;
    btn_Config_CertKey: TButton;
    Open_Dialog: TOpenDialog;
    cbbx_CongifTipoChave: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    edt_ConfigChave: TEdit;
    Label10: TLabel;
    edt_ConfigDuracao: TEdit;
    tbs_Cob: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    btn_Cob_GerarTXID: TButton;
    edt_cob_Txid: TEdit;
    Label12: TLabel;
    edt_cob_valor: TEdit;
    Label13: TLabel;
    edt_cob_mensagem: TEdit;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edt_cob_nomePagador: TEdit;
    edt_cob_cpfcnpjPagador: TEdit;
    edt_cob_mensagemPagador: TEdit;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    imgQRCODE: TImage;
    Label17: TLabel;
    mm_CobPayload: TMemo;
    Label18: TLabel;
    lbl_CobValorPago: TLabel;
    mm_Cob_Status: TMemo;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    edt_cob_Pix_endtoEndId: TEdit;
    edt_cob_Pix_Pago: TEdit;
    Panel9: TPanel;
    Label21: TLabel;
    lbl_Psp: TLabel;
    Label22: TLabel;
    lbl_ambiente: TLabel;
    Image1: TImage;
    Image2: TImage;
    lblCompVersao: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    btn_cob_CriarCob: TButton;
    btn_cob_ConsultarCob: TButton;
    btn_cob_CancelarCob: TButton;
    Panel12: TPanel;
    btn_Pix_Consultar: TButton;
    btn_Pix_Solicitar_Estorno: TButton;
    btn_Pix_Consultar_Estorno: TButton;
    GroupBox4: TGroupBox;
    Label23: TLabel;
    Button1: TButton;
    edt_Pix_TxIdDev: TEdit;
    tbs_ListaPixRecebidos: TTabSheet;
    Panel6: TPanel;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    btn_pix_ConsultarLista: TButton;
    dtp_Hora_Inicial: TDateTimePicker;
    dtp_Data_Inicial: TDateTimePicker;
    Label25: TLabel;
    Label26: TLabel;
    dtp_Data_Final: TDateTimePicker;
    Label27: TLabel;
    dtp_Hora_Final: TDateTimePicker;
    Label28: TLabel;
    edt_PagPixs: TEdit;
    Label29: TLabel;
    edt_QtdPagPixs: TEdit;
    edt_TotalItensPagPixs: TEdit;
    Label30: TLabel;
    edt_ItensPagPixs: TEdit;
    Label31: TLabel;
    dbg_ListaPixRecebidos: TDBGrid;
    ds_listaPixRecebidos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cbbx_PSPChange(Sender: TObject);
    procedure btn_NovoTokenClick(Sender: TObject);
    procedure btn_Config_CertClick(Sender: TObject);
    procedure btn_Config_CertKeyClick(Sender: TObject);
    procedure tbn_SalvarConfigClick(Sender: TObject);
    procedure RscPix1Token(Sender: TObject; const Token: TToken;
      Erro: String);
    procedure btn_Cob_GerarTXIDClick(Sender: TObject);
    procedure btn_cob_CriarCobClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RscPix1CobCriar(Sender: TObject;
      const RespCobPut: TRespCobPut; Erro: String);
    procedure RscPix1CobConsultar(Sender: TObject;
      const RespCobGet: TRespCobGet; Erro: String);
    procedure btn_cob_ConsultarCobClick(Sender: TObject);
    procedure RscPix1CobCancelar(Sender: TObject;
      const RespCobPatch: TRespCobPatch; Erro: String);
    procedure btn_cob_CancelarCobClick(Sender: TObject);
    procedure cbbx_AmbienteChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure btn_Pix_ConsultarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_Pix_Solicitar_EstornoClick(Sender: TObject);
    procedure RscPix1PixDevolucao(Sender: TObject;
      const RespPixPut: TRespPixPut; Erro: String);
    procedure btn_Pix_Consultar_EstornoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_pix_ConsultarListaClick(Sender: TObject);
    procedure RscPix1CobListar(Sender: TObject; const Response: TRespCobListar;
      Erro: string);
    procedure RscPix1CobTxId(Sender: TObject; const Response: TRespCobGet;
      Erro: string);
    procedure RscPix1LocationCriar(Sender: TObject;
      const Response: TRespLocPost; Erro: string);
    procedure RscPix1LocationDesvincularTxId(Sender: TObject;
      const Response: TRespLocDelete; Erro: string);
    procedure RscPix1LocationId(Sender: TObject; const Response: TRespLocGet;
      Erro: string);
    procedure RscPix1LocationIdtoQrCode(Sender: TObject;
      const Response: TRespLocGetIdQrcode; Erro: string);
    procedure RscPix1LocationListarCadastrados(Sender: TObject;
      const Response: TRespLocList; Erro: string);
    procedure RscPix1PixGetEndToEndId(Sender: TObject;
      const Response: TRespPixGetEndToEndId; Erro: string);
    procedure RscPix1PixListaRecebidos(Sender: TObject;
      const Response: TRespPixListaRecebidos; Erro: string);
    procedure RscPix1WebhookDelete(Sender: TObject;
      const Response: TRespWebhookPutDelete; Erro: string);
    procedure RscPix1WebhookGet(Sender: TObject;
      const Response: TRespWebhookGet; Erro: string);
    procedure RscPix1WebhookListar(Sender: TObject;
      const Response: TRespWebhookListar; Erro: string);
    procedure RscPix1WebhookPut(Sender: TObject;
      const Response: TRespWebhookPutDelete; Erro: string);
  private
    FPath : string;
    FDstListPixRecebidos: TClientDataSet;
    { Private declarations }

    procedure CreateFieldsDataSet;

    procedure LerIni;
    procedure GravarIni;

    procedure CarregarConfig;
    procedure LimparRespostas;

    procedure GerarNovoToken;

    {cob}
    procedure CriarCobranca;
    procedure ConsultarCobranca;
    procedure CancelarCobranca;

    {pix}
    procedure ConsultarPix;
    procedure SolicitarDevolucaoPix;
    procedure ConsultarDevolucaoPix;
    procedure ConsultarListaPixsRecebidos;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

const
  SECTION_AUTENTICAR  = 'AUTENTICAR';
  IDENT_APPLICATION_KEY = 'APPLICATION_KEY';
  IDENT_CLIENT_ID       = 'CLIENT_ID';
  IDENT_CLIENT_SECRET   = 'CLIENT_SECRET';

  SECTION_CERTIFICADO = 'CERTIFICADO';
  IDENT_CERT_FILE     = 'CERT_FILE';
  IDENT_CERT_KEY_FILE = 'CERT_KEY_FILE';

  SECTION_PSP     = 'PSP';
  IDENT_PSP       = 'PSP';
  IDENT_AMBIENTE  = 'AMBIENTE';

  SECTION_TITULAR       = 'TITULAR';
  IDENT_CHAVE           = 'CHAVE';
  IDENT_TIPO_CHAVE      = 'TIPO_CHAVE';
  IDENT_DURACAO_QRCODE  = 'DURACAO_QRCODE';

  SECTION_TOKEN = 'TOKEN';
  IDENT_TOKEN   = 'TOKEN';

  FILE_INI  = 'Config.ini';

  sLineBreak = #13#10;

implementation



{$R *.dfm}

{ TForm1 }

procedure TFrmMain.CreateFieldsDataSet;
begin
  if  FDstListPixRecebidos.Active then
    FDstListPixRecebidos.Close;
    
  FDstListPixRecebidos.FieldDefs.Clear;
  try
    with FDstListPixRecebidos.FieldDefs do
    begin
      Add('nomePagador', ftString, 20);
      Add('cpfcnpjpagador', ftString, 20);
      Add('inforpagador', ftString, 20);
      Add('endtoebdid', ftString, 60);
      Add('txid', ftString, 60);
      Add('valor', ftFloat);
      Add('horario', ftDate);
    end;
  finally
    FDstListPixRecebidos.CreateDataSet;
    FDstListPixRecebidos.Open;
  end;
end;

procedure TFrmMain.LerIni;
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(FPath + FILE_INI);
  try
    edt_ConfigapplicationKey.Text   :=  ArquivoINI.ReadString(SECTION_AUTENTICAR, IDENT_APPLICATION_KEY, '');
    edt_ConfigClientID.Text         :=  ArquivoINI.ReadString(SECTION_AUTENTICAR, IDENT_CLIENT_ID, '');
    edt_ConfigClientSecret.Text     :=  ArquivoINI.ReadString(SECTION_AUTENTICAR, IDENT_CLIENT_SECRET, '');

    edt_ConfigCert.Text             :=  ArquivoINI.ReadString(SECTION_CERTIFICADO, IDENT_CERT_FILE, '');
    edt_ConfigCertKey.Text          :=  ArquivoINI.ReadString(SECTION_CERTIFICADO, IDENT_CERT_KEY_FILE, '');

    cbbx_PSP.ItemIndex              :=  ArquivoINI.ReadInteger(SECTION_PSP, IDENT_PSP, 0);
    cbbx_Ambiente.ItemIndex         :=  ArquivoINI.ReadInteger(SECTION_PSP, IDENT_AMBIENTE, 0);

    edt_ConfigChave.Text            :=  ArquivoINI.ReadString(SECTION_TITULAR, IDENT_CHAVE, '');
    cbbx_CongifTipoChave.ItemIndex  :=  ArquivoINI.ReadInteger(SECTION_TITULAR, IDENT_TIPO_CHAVE, 0);
    edt_ConfigDuracao.Text          :=  IntToStr(ArquivoINI.ReadInteger(SECTION_TITULAR, IDENT_DURACAO_QRCODE, 60));

    RscPix1.Token.AccessToken       :=  ArquivoINI.ReadString(SECTION_TOKEN, IDENT_TOKEN, '');

    lbl_Psp.Caption       :=  cbbx_PSP.Text;
    lbl_ambiente.Caption  := cbbx_Ambiente.Text;

  finally
    ArquivoINI.Free;
  end;
end;

procedure TFrmMain.GravarIni;
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(FPath + FILE_INI);
  try
    ArquivoINI.WriteString(SECTION_AUTENTICAR, IDENT_APPLICATION_KEY, edt_ConfigapplicationKey.Text);
    ArquivoINI.WriteString(SECTION_AUTENTICAR, IDENT_CLIENT_ID, edt_ConfigClientID.Text);
    ArquivoINI.WriteString(SECTION_AUTENTICAR, IDENT_CLIENT_SECRET, edt_ConfigClientSecret.Text);

    ArquivoINI.WriteString(SECTION_CERTIFICADO, IDENT_CERT_FILE, edt_ConfigCert.Text);
    ArquivoINI.WriteString(SECTION_CERTIFICADO, IDENT_CERT_KEY_FILE, edt_ConfigCertKey.Text);

    ArquivoINI.WriteInteger(SECTION_PSP, IDENT_PSP, cbbx_PSP.ItemIndex);
    ArquivoINI.WriteInteger(SECTION_PSP, IDENT_AMBIENTE, cbbx_Ambiente.ItemIndex);

    ArquivoINI.WriteString(SECTION_TITULAR, IDENT_CHAVE, edt_ConfigChave.Text);
    ArquivoINI.WriteInteger(SECTION_TITULAR, IDENT_TIPO_CHAVE, cbbx_CongifTipoChave.ItemIndex);
    ArquivoINI.WriteInteger(SECTION_TITULAR, IDENT_DURACAO_QRCODE, StrToIntDef(edt_ConfigDuracao.Text, 60));

    ArquivoINI.WriteString(SECTION_TOKEN, IDENT_TOKEN, RscPix1.Token.AccessToken);

  finally
    ArquivoINI.Free;
  end;
end;

procedure TFrmMain.CarregarConfig;
begin
  RscPix1.Autenticar.Application_key  :=  edt_ConfigapplicationKey.Text;
  RscPix1.Autenticar.Client_ID        :=  edt_ConfigClientID.Text;
  RscPix1.Autenticar.Client_Secret    :=  edt_ConfigClientSecret.Text;

  RscPix1.Certificado.CertFile        :=  edt_ConfigCert.Text;
  RscPix1.Certificado.CertKeyFile     :=  edt_ConfigCertKey.Text;

  RscPix1.PSP.Psp                     :=  TTipoPSP(cbbx_PSP.ItemIndex);
  RscPix1.PSP.PspAmbiente             :=  TTipoAmbiente(cbbx_Ambiente.ItemIndex);

  RscPix1.Titular.ChavePix            :=  edt_ConfigChave.Text;
  RscPix1.Titular.TipoChavePix        :=  TTipoChavePIX(cbbx_CongifTipoChave.ItemIndex);
  RscPix1.Titular.DuracaoMinutos      :=  StrToIntDef(edt_ConfigDuracao.Text, 60);
end;

procedure TFrmMain.LimparRespostas;
begin
  if  FileExists(FPath + 'TRscPix_200x200.bmp') then
    imgQRCODE.Picture.LoadFromFile(FPath + 'TRscPix_200x200.bmp');

  mm_CobPayload.Text  :=  '';
  mm_Cob_Status.Text  :=  '';

  lbl_CobValorPago.Caption  :=  '';

  edt_cob_Pix_endtoEndId.Text   :=  '';
  edt_cob_Pix_Pago.Text         :=  '';
  edt_cob_nomePagador.Text      :=  '';
  edt_cob_cpfcnpjPagador.Text   :=  '';
  edt_cob_mensagemPagador.Text  :=  '';

end;

procedure TFrmMain.GerarNovoToken;
begin
  CarregarConfig;
  RscPix1.NovoToken;
end;

procedure TFrmMain.CriarCobranca;
begin
  LimparRespostas;
  CarregarConfig;
  RscPix1.CobCriar(StrToFloatDef(edt_cob_valor.Text, 0), edt_cob_Txid.Text, edt_cob_mensagem.Text);
end;

procedure TFrmMain.ConsultarCobranca;
begin
  LimparRespostas;
  CarregarConfig;
  RscPix1.CobTxId(edt_cob_Txid.Text);
end;

procedure TFrmMain.CancelarCobranca;
begin
  LimparRespostas;
  CarregarConfig;
  RscPix1.CobCancelar(edt_cob_Txid.Text);
end;

procedure TFrmMain.ConsultarPix;
var
  end2id: string;
begin
  end2id  :=  Trim(edt_cob_Pix_endtoEndId.Text);
  LimparRespostas;
  CarregarConfig;
  edt_cob_Pix_endtoEndId.Text :=  end2id;
  RscPix1.PixEndToEndId(edt_cob_Pix_endtoEndId.Text);
end;

procedure TFrmMain.SolicitarDevolucaoPix;
var
  end2id: string;
  txiddev: string;
  valor: Double;
begin
  if Trim(edt_cob_Pix_endtoEndId.Text) = ''  then
    begin
      MessageDlg('Digite o campo endToEndId' , mtError, [mbOK], 0);
      edt_cob_Pix_endtoEndId.SetFocus ;
      Exit;
    end;
  if Trim(edt_Pix_TxIdDev.Text) = ''  then
    begin
      MessageDlg('Digite o campo TxIdDev' , mtError, [mbOK], 0);
      edt_Pix_TxIdDev.SetFocus ;
      Exit;
    end;
  if Trim(edt_cob_Pix_Pago.Text) = ''  then
    begin
      MessageDlg('Digite o campo Valor' , mtError, [mbOK], 0);
      edt_cob_Pix_Pago.SetFocus ;
      Exit;
    end;

  end2id  :=  Trim(edt_cob_Pix_endtoEndId.Text);
  txiddev  :=  Trim(edt_Pix_TxIdDev.Text);
  valor  :=  StrToFloat(Trim(edt_cob_Pix_Pago.Text));
  LimparRespostas;
  CarregarConfig;
  edt_cob_Pix_endtoEndId.Text :=  end2id;
  edt_Pix_TxIdDev.Text :=  txiddev;
  edt_cob_Pix_Pago.Text :=  FloatToStr(valor);
  RscPix1.PixDevolucaoSolicitar(edt_cob_Pix_endtoEndId.Text, edt_Pix_TxIdDev.Text, StrToFloat(edt_cob_Pix_Pago.Text));
end;

procedure TFrmMain.ConsultarDevolucaoPix;
var
  end2id: string;
  txiddev: string;
begin
  if Trim(edt_cob_Pix_endtoEndId.Text) = ''  then
    begin
      MessageDlg('Digite o campo endToEndId' , mtError, [mbOK], 0);
      edt_cob_Pix_endtoEndId.SetFocus ;
      Exit;
    end;
  if Trim(edt_Pix_TxIdDev.Text) = ''  then
    begin
      MessageDlg('Digite o campo TxIdDev' , mtError, [mbOK], 0);
      edt_Pix_TxIdDev.SetFocus ;
      Exit;
    end;

  end2id  :=  Trim(edt_cob_Pix_endtoEndId.Text);
  txiddev  :=  Trim(edt_Pix_TxIdDev.Text);
  LimparRespostas;
  CarregarConfig;
  edt_cob_Pix_endtoEndId.Text :=  end2id;
  edt_Pix_TxIdDev.Text :=  txiddev;
  RscPix1.PixDevolucaoConsultar(edt_cob_Pix_endtoEndId.Text, edt_Pix_TxIdDev.Text);
end;

procedure TFrmMain.ConsultarListaPixsRecebidos;
begin
  CarregarConfig;
  RscPix1.PixListar(
    StrToDateTime(DateToStr(dtp_Data_Inicial.Date) + TimeToStr(dtp_Hora_Inicial.Time)),
    StrToDateTime(DateToStr(dtp_Data_Final.Date) + TimeToStr(dtp_Hora_Final.Time)),
    '',
    False,
    False,
    '',
    '',
    StrToIntDef(edt_PagPixs.Text, 0),
    StrToIntDef(edt_ItensPagPixs.Text, 0)
    );
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  aPsp: TTipoPSP;
  aAmbiente : TTipoAmbiente;
  aTpChave : TTipoChavePIX;
begin
  FPath :=  ExtractFilePath(ParamStr(0));
  Self.Caption  :=  Application.Title;

  FDstListPixRecebidos  :=  TClientDataSet.Create(nil);
  CreateFieldsDataSet;
  ds_listaPixRecebidos.DataSet  :=  FDstListPixRecebidos;
  

  cbbx_PSP.Clear;
  for aPsp := Low(TTipoPSP) to High(TTipoPSP) do
    cbbx_PSP.Items.Add(GetEnumName(TypeInfo(TTipoPSP), Ord(aPsp)));
  cbbx_PSP.ItemIndex  :=  0;
  cbbx_PSPChange(cbbx_PSP);

  cbbx_Ambiente.Clear;
  for aAmbiente := Low(TTipoAmbiente) to High(TTipoAmbiente) do
    cbbx_Ambiente.Items.Add(GetEnumName(TypeInfo(TTipoAmbiente), Ord(aAmbiente)));
  cbbx_Ambiente.ItemIndex  :=  0;

  cbbx_CongifTipoChave.Clear;
  for aTpChave := Low(TTipoChavePIX) to High(TTipoChavePIX) do
    cbbx_CongifTipoChave.Items.Add(GetEnumName(TypeInfo(TTipoChavePIX), Ord(aTpChave)));
  cbbx_CongifTipoChave.ItemIndex  :=  0;

  edt_ConfigCert.Text         :=  '';
  edt_ConfigCertKey.Text      :=  '';
  edt_ConfigClientID.Text     :=  '';
  edt_ConfigClientSecret.Text :=  '';
  edt_ConfigChave.Text        :=  '';
  edt_ConfigDuracao.Text      :=  '60';

  LerIni;

  lblCompVersao.Caption :=  'Versão Componente: ' + RscPix1.Versao  + '  ';

  PageControl1.ActivePage :=  TbsConfig;

end;

procedure TFrmMain.cbbx_PSPChange(Sender: TObject);
begin
  if  TTipoPSP(cbbx_PSP.ItemIndex) = pspBancoDoBrasil  then
    begin
      gpbx_ConfigAutenticar.height  :=  96;
    end
  else
    begin
      gpbx_ConfigAutenticar.height  :=  48;
    end;

  lbl_Psp.Caption       :=  cbbx_PSP.Text;
end;

procedure TFrmMain.btn_NovoTokenClick(Sender: TObject);
begin
  GerarNovoToken;
end;

procedure TFrmMain.btn_Config_CertClick(Sender: TObject);
begin
  Open_Dialog.DefaultExt := '*.pem' ;
  Open_Dialog.Filter := 'Arquivos pem|*.pem|Arquivos cer|*.cer' ;
  if Open_Dialog.Execute then
     begin
      edt_ConfigCert.Text := Open_Dialog.FileName ;
     end;
end;

procedure TFrmMain.btn_Config_CertKeyClick(Sender: TObject);
begin
  Open_Dialog.DefaultExt := '*.key' ;
  Open_Dialog.Filter := 'Arquivos key|*.key' ;
  if Open_Dialog.Execute then
     begin
      edt_ConfigCertKey.Text := Open_Dialog.FileName ;
     end;
end;

procedure TFrmMain.tbn_SalvarConfigClick(Sender: TObject);
begin
  GravarIni;
end;

procedure TFrmMain.btn_Cob_GerarTXIDClick(Sender: TObject);
begin
  edt_cob_Txid.Text  :=  'COB'
                  + FormatDateTime('ddmmyyyyhhnnsszzz', Now)
                  + 'RSC' + FormatFloat('0000000', random(9999999));
end;

procedure TFrmMain.btn_cob_CriarCobClick(Sender: TObject);
begin
  CriarCobranca;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  if  FileExists(FPath + 'TRscPix_200x200.bmp') then
    imgQRCODE.Picture.LoadFromFile(FPath + 'TRscPix_200x200.bmp')
  else
    begin
      imgQRCODE.Picture.SaveToFile(FPath + 'TRscPix_200x200.bmp');
    end;
  Self.Width  :=  1000;
  imgQRCODE.Repaint;
end;

procedure TFrmMain.btn_cob_ConsultarCobClick(Sender: TObject);
begin
  ConsultarCobranca;
end;

procedure TFrmMain.btn_cob_CancelarCobClick(Sender: TObject);
begin
  CancelarCobranca;
end;

procedure TFrmMain.cbbx_AmbienteChange(Sender: TObject);
begin
  lbl_ambiente.Caption  := cbbx_Ambiente.Text;
end;

procedure TFrmMain.Image1Click(Sender: TObject);
begin
  ShellExecute(Handle,
               'open',
               'https://github.com/OpenSourceCommunityBrasil/TRscPix',
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

procedure TFrmMain.Image2Click(Sender: TObject);
begin
  ShellExecute(Handle,
               'open',
               'https://trscpix.rscsistemas.com.br',
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

procedure TFrmMain.RscPix1Token(Sender: TObject; const Token: TToken;
  Erro: String);
begin
  if  Erro <> '' then
    begin
      Memo1.Text  :=  Erro;
    end
  else
    begin
      Memo1.Text  :=  Token.ToJson;
      GravarIni;
    end;
end;

procedure TFrmMain.RscPix1WebhookDelete(Sender: TObject;
  const Response: TRespWebhookPutDelete; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1WebhookGet(Sender: TObject;
  const Response: TRespWebhookGet; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1WebhookListar(Sender: TObject;
  const Response: TRespWebhookListar; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1WebhookPut(Sender: TObject;
  const Response: TRespWebhookPutDelete; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1CobCancelar(Sender: TObject;
  const RespCobPatch: TRespCobPatch; Erro: String);
begin
  if (Erro = '') then
    begin
      mm_Cob_Status.Text := 'Situação: ' +  RespCobPatch.Status;
    end
  else
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Revisar Cobrança' + #13 + Erro, mtError, [mbOK], 0);
    end;
end;

procedure TFrmMain.RscPix1CobCriar(Sender: TObject;
  const RespCobPut: TRespCobPut; Erro: String);
var
  cValor : String ;
begin
  if (Erro = '') then
    begin
      mm_Cob_Status.text := 'Situação: ' +  RespCobPut.Status;
      if (RespCobPut.Status <> 'NAO_CRIADO') then
        begin
          cValor := StringReplace(RespCobPut.valor.original, '.', ',', [rfReplaceAll]);
          lbl_CobValorPago.Caption := 'Valor á Pagar: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));

          if RespCobPut.pixCopiaECola <> '' then
            begin
              mm_CobPayload.Text  :=  RespCobPut.pixCopiaECola;
              QRCodeWin(imgQRCODE, RespCobPut.pixCopiaECola);
            end
          else
            begin
              mm_CobPayload.Text  :=  RespCobPut.location;
              QRCodeWin(imgQRCODE, RespCobPut.location);
            end;
        end;
    end
  else
    begin
      mm_Cob_Status.text  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Criar Cobrança' + #13 + Erro, mtError, [mbOK], 0);
    end;
end;

procedure TFrmMain.RscPix1CobListar(Sender: TObject;
  const Response: TRespCobListar; Erro: string);
var
  I:  integer;
begin
//  if (Erro = '') then
//    begin
//      if (Response.Status = 'DEVOLVIDO') then
//        begin
//          mm_Cob_Status.Text := 'Situação: ' + Response.Status  + sLineBreak
//                              + ' - motivo: '  + Trim(Response.pix[0].devolucoes[0].motivo)  + sLineBreak
//                              + ' - rtrId: ' + Trim(Response.pix[0].devolucoes[0].rtrId) + sLineBreak
//                              + ' - valor: '  + FormatFloat('#0.00', Response.pix[0].valor);
//        end
//      else
//        begin
//          mm_Cob_Status.Text := 'Situação: ' +  Response.status;
//
//          if  Response.pix.Count = 0 then
//            begin
//              edt_cob_Txid.Text             :=  Response.txid;
//              edt_cob_valor.Text            :=  FloatToStr(Response.pix[0].valor);
//              edt_cob_mensagemPagador.Text  :=  Response.pix[0].infoPagador;
//
//              if Response.pix[0].pagador <> nil then
//                begin
//                  edt_cob_nomePagador.Text  :=  Response.pix[0].pagador.nome;
//
//                  if Response.pix[0].Pagador.cpf <> '' then
//                    edt_cob_cpfcnpjPagador.Text   :=  Response.pix[0].Pagador.cpf
//                  else
//                    edt_cob_cpfcnpjPagador.Text   :=  Response.pix[0].Pagador.cnpj;
//                end;
//
//            end
//          else
//            begin
//              edt_PagPixs.Text            :=  IntToStr(Response.parametros.paginacao.paginaAtual);
//              edt_QtdPagPixs.Text         :=  IntToStr(Response.parametros.paginacao.quantidadeDePaginas);
//              edt_ItensPagPixs.Text       :=  IntToStr(Response.parametros.paginacao.itensPorPagina);
//              edt_TotalItensPagPixs.Text  :=  IntToStr(Response.parametros.paginacao.quantidadeTotalDeItens);
//
//              CreateFieldsDataSet;
//              for i := 0 to Response.pix.Count - 1 do
//                begin
//                  FDstListPixRecebidos.Append;
//
//                  if Response.pix[i].pagador <> nil then
//                    begin
//                      if Response.pix[i].pagador.cpf = EmptyStr then
//                        FDstListPixRecebidos.FieldByName('cpfcnpjpagador').AsString  :=  Response.pix[i].pagador.cnpj
//                      else
//                        FDstListPixRecebidos.FieldByName('cpfcnpjpagador').AsString  :=  Response.pix[i].pagador.cpf;
//
//                      FDstListPixRecebidos.FieldByName('nomePagador').AsString    :=  Response.pix[i].pagador.nome;
//                    end;
//
//
//                  FDstListPixRecebidos.FieldByName('inforpagador').AsString   :=  Response.pix[i].infoPagador;
//                  FDstListPixRecebidos.FieldByName('endtoebdid').AsString     :=  Response.pix[i].endToEndId;
//                  FDstListPixRecebidos.FieldByName('txid').AsString           :=  Response.pix[i].TxId;
//                  FDstListPixRecebidos.FieldByName('valor').AsFloat           :=  Response.pix[i].valor;
////                  FDstListPixRecebidos.FieldByName('horario').AsString        :=  Response.pix[i].horario;
//                  FDstListPixRecebidos.Post;
//                end;
//            end;
//        end;
//    end
//  else
//    begin
//      mm_Cob_Status.Text  := 'Situação: '  + Erro;
//      MessageDlg('Erro ao Consultar PIX' + #13 + Erro, mtError, [mbOK], 0);
//    end;
end;

procedure TFrmMain.RscPix1CobTxId(Sender: TObject; const Response: TRespCobGet;
  Erro: string);
var
  I:  integer;
begin
  if (Erro = '') then
    begin
      if (Response.Status = 'DEVOLVIDO') then
        begin
          mm_Cob_Status.Text := 'Situação: ' + Response.Status  + sLineBreak
                              + ' - motivo: '  + Trim(Response.pix[0].devolucoes[0].motivo)  + sLineBreak
                              + ' - rtrId: ' + Trim(Response.pix[0].devolucoes[0].rtrId) + sLineBreak
                              + ' - valor: '  + FormatFloat('#0.00', Response.pix[0].valor);
        end
      else
        begin
          mm_Cob_Status.Text := 'Situação: ' +  Response.status;

          if  Response.pix.Count = 0 then
            begin
              edt_cob_Txid.Text             :=  Response.txid;
              edt_cob_valor.Text            :=  FloatToStr(Response.pix[0].valor);
              edt_cob_mensagemPagador.Text  :=  Response.pix[0].infoPagador;

              if Response.pix[0].pagador <> nil then
                begin
                  edt_cob_nomePagador.Text  :=  Response.pix[0].pagador.nome;

                  if Response.pix[0].Pagador.cpf <> '' then
                    edt_cob_cpfcnpjPagador.Text   :=  Response.pix[0].Pagador.cpf
                  else
                    edt_cob_cpfcnpjPagador.Text   :=  Response.pix[0].Pagador.cnpj;
                end;

            end
          else
            begin
//              edt_PagPixs.Text            :=  IntToStr(Response.parametros.paginacao.paginaAtual);
//              edt_QtdPagPixs.Text         :=  IntToStr(Response.parametros.paginacao.quantidadeDePaginas);
//              edt_ItensPagPixs.Text       :=  IntToStr(Response.parametros.paginacao.itensPorPagina);
//              edt_TotalItensPagPixs.Text  :=  IntToStr(Response.parametros.paginacao.quantidadeTotalDeItens);
//
//              CreateFieldsDataSet;
//              for i := 0 to Response.pix.Count - 1 do
//                begin
//                  FDstListPixRecebidos.Append;
//
//                  if Response.pix[i].pagador <> nil then
//                    begin
//                      if Response.pix[i].pagador.cpf = EmptyStr then
//                        FDstListPixRecebidos.FieldByName('cpfcnpjpagador').AsString  :=  Response.pix[i].pagador.cnpj
//                      else
//                        FDstListPixRecebidos.FieldByName('cpfcnpjpagador').AsString  :=  Response.pix[i].pagador.cpf;
//
//                      FDstListPixRecebidos.FieldByName('nomePagador').AsString    :=  Response.pix[i].pagador.nome;
//                    end;
//
//
//                  FDstListPixRecebidos.FieldByName('inforpagador').AsString   :=  Response.pix[i].infoPagador;
//                  FDstListPixRecebidos.FieldByName('endtoebdid').AsString     :=  Response.pix[i].endToEndId;
//                  FDstListPixRecebidos.FieldByName('txid').AsString           :=  Response.pix[i].TxId;
//                  FDstListPixRecebidos.FieldByName('valor').AsFloat           :=  Response.pix[i].valor;
////                  FDstListPixRecebidos.FieldByName('horario').AsString        :=  Response.pix[i].horario;
//                  FDstListPixRecebidos.Post;
//                end;
            end;
        end;
    end
  else
    begin
//      mm_Cob_Status.Text  := 'Situação: '  + Erro;
//      MessageDlg('Erro ao Consultar PIX' + #13 + Erro, mtError, [mbOK], 0);
    end;
end;

procedure TFrmMain.RscPix1LocationCriar(Sender: TObject;
  const Response: TRespLocPost; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1LocationDesvincularTxId(Sender: TObject;
  const Response: TRespLocDelete; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1LocationId(Sender: TObject;
  const Response: TRespLocGet; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1LocationIdtoQrCode(Sender: TObject;
  const Response: TRespLocGetIdQrcode; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1LocationListarCadastrados(Sender: TObject;
  const Response: TRespLocList; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1CobConsultar(Sender: TObject;
  const RespCobGet: TRespCobGet; Erro: String);
var
  cValor : String ;
begin
  if (Erro = '') then
    begin
      mm_Cob_Status.Text := 'Situação: ' +  RespCobGet.Status;
      RespCobGet.ToJson;
      if (RespCobGet.Status <> 'NAO_CRIADO') then
        begin
          cValor := StringReplace(RespCobGet.valor.original, '.', ',', [rfReplaceAll]);
          lbl_CobValorPago.Caption := 'Valor á Pagar: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));

          if (RespCobGet.Status = 'CONCLUIDA') then
            begin
              edt_cob_Pix_endtoEndId.Text :=  RespCobGet.pix[0].endToEndId;
              edt_cob_Pix_Pago.Text       :=  FloatToStr(RespCobGet.pix[0].valor);

              if RespCobGet.pix[0].pagador <> nil then
                begin
                  edt_cob_nomePagador.Text  :=  RespCobGet.pix[0].pagador.nome;

                  if RespCobGet.pix[0].Pagador.cpf <> '' then
                    edt_cob_cpfcnpjPagador.Text   :=  RespCobGet.pix[0].Pagador.cpf
                  else
                    edt_cob_cpfcnpjPagador.Text   :=  RespCobGet.pix[0].Pagador.cnpj;
                end
              else
                begin
                  if RespCobGet.devedor <> nil then
                    begin
                      edt_cob_nomePagador.Text  :=  RespCobGet.devedor.nome;

                      if RespCobGet.devedor.cpf <> '' then
                        edt_cob_cpfcnpjPagador.Text   :=  RespCobGet.devedor.cpf
                      else
                        edt_cob_cpfcnpjPagador.Text   :=  RespCobGet.devedor.cnpj;
                    end
                end;

              edt_cob_mensagemPagador.Text    :=  RespCobGet.pix[0].infoPagador;
              cValor := FloatToStr(RespCobGet.pix[0].valor);
              lbl_CobValorPago.Caption := 'Valor Pago: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));
            end;

            edt_cob_valor.Text    :=  StringReplace(RespCobGet.valor.original, '.', ',', [rfReplaceAll]);
            edt_cob_mensagem.Text :=  RespCobGet.solicitacaopagador;


          if RespCobGet.status = 'ATIVA' then
            begin
//              if RespCobGet.textoImagemQRcode <> '' then
//                begin
//                  mm_CobPayload.Text  :=  RespCobGet.textoImagemQRcode;
//                  QRCodeWin(imgQRCODE, RespCobGet.textoImagemQRcode);
//                end
//              else
//                begin
//                  if RespCobGet.pixCopiaECola <> '' then
//                    begin
//                      mm_CobPayload.Text  :=  RespCobGet.pixCopiaECola;
//                      QRCodeWin(imgQRCODE, RespCobGet.pixCopiaECola);
//                    end
//                  else
//                    begin
//                      mm_CobPayload.Text  :=  RespCobGet.location;
//                      QRCodeWin(imgQRCODE, RespCobGet.location);
//                    end;
//                end;
            end;

        end;
    end
  else
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Consultar Cobrança' + #13 + Erro, mtError, [mbOK], 0);
    end;
end;

procedure TFrmMain.btn_Pix_ConsultarClick(Sender: TObject);
begin
  ConsultarPix;
end;

procedure TFrmMain.RscPix1PixDevolucao(Sender: TObject;
  const RespPixPut: TRespPixPut; Erro: String);
begin
  if Erro <> '' then
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Solcitar Devolução!' +  #13 +Erro, mtError, [mbOK], 0);
    end
  else
    begin
//      mm_Cob_Status.Text  := 'Situação: '  + RespPixPut.status;
//      if (RespPixPut.Status = 'DEVOLVIDO') then
//        begin
//          mm_Cob_Status.Text := 'Situação: ' + RespPixPut.Status + sLineBreak
//                              + ' - motivo: '  + Trim(RespPixPut.motivo) + sLineBreak
//                              + ' - rtrId: ' + Trim(RespPixPut.rtrId) + sLineBreak
//                              + ' - valor: '  + FormatFloat('#0.00', RespPixPut.valor);
//        end
//      else
//        begin
//          mm_Cob_Status.Text := 'Situação: ' + RespPixPut.Status;
//        end;
    end;
end;


procedure TFrmMain.RscPix1PixGetEndToEndId(Sender: TObject;
  const Response: TRespPixGetEndToEndId; Erro: string);
begin
//novo
end;

procedure TFrmMain.RscPix1PixListaRecebidos(Sender: TObject;
  const Response: TRespPixListaRecebidos; Erro: string);
begin
//novo
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  edt_Pix_TxIdDev.Text  :=
    'DEV'
    + FormatDateTime('ddmmyyyyhhnnsszzz', Now)
    + 'RSC' + FormatFloat('0000000', random(9999999));
end;

procedure TFrmMain.btn_Pix_Solicitar_EstornoClick(Sender: TObject);
begin
  SolicitarDevolucaoPix;
end;

procedure TFrmMain.btn_Pix_Consultar_EstornoClick(Sender: TObject);
begin
  ConsultarDevolucaoPix;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FDstListPixRecebidos.Free;
end;





procedure TFrmMain.btn_pix_ConsultarListaClick(Sender: TObject);
begin
  ConsultarListaPixsRecebidos;
end;

end.
