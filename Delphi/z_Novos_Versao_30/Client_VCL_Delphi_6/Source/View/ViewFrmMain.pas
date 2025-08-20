unit ViewFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ShellAPI

  
  , IniFiles
  , TypInfo
  , RscPix
  , RscPixTipos
  , RscPixToken

  , clientUtils

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
    Panel6: TPanel;
    btn_cob_CriarCob: TButton;
    btn_cob_ConsultarCob: TButton;
    btn_cob_CancelarCob: TButton;
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
    Button1: TButton;
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
    procedure RscPix1CobTxId(Sender: TObject; const Response: TRespCobGet;
      Erro: String);
  private
    FPath : string;
    { Private declarations }
    procedure LerIni;
    procedure GravarIni;

    procedure CarregarConfig;
    procedure LimparRespostas;

    procedure GerarNovoToken;
    procedure CriarCobranca;
    procedure ConsultarCobranca;
    procedure CancelarCobranca;

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

implementation

{$R *.dfm}

{ TForm1 }

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

procedure TFrmMain.FormCreate(Sender: TObject);
var
  aPsp: TTipoPSP;
  aAmbiente : TTipoAmbiente;
  aTpChave : TTipoChavePIX;
begin
  FPath :=  ExtractFilePath(ParamStr(0));
  Self.Caption  :=  Application.Title;

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

procedure TFrmMain.tbn_SalvarConfigClick(Sender: TObject);
begin
  GravarIni;
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

procedure TFrmMain.btn_Cob_GerarTXIDClick(Sender: TObject);
begin
  edt_cob_Txid.Text  :=  'COB'
                  + FormatDateTime('ddmmyyyyhhnnsszzz', Now)
                  + 'RSC' + IntToStr(random(9999));
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
  Self.Width  :=  850;
  imgQRCODE.Repaint;
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
                  if RespCobGet.pixCopiaECola <> '' then
                    begin
                      mm_CobPayload.Text  :=  RespCobGet.pixCopiaECola;
                      QRCodeWin(imgQRCODE, RespCobGet.pixCopiaECola);
                    end
                  else
                    begin
                      mm_CobPayload.Text  :=  RespCobGet.location;
                      QRCodeWin(imgQRCODE, RespCobGet.location);
                    end;
            end;               

        end;
    end
  else
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Consultar Cobrança' + #13 + Erro, mtError, [mbOK], 0);
    end;
end;

procedure TFrmMain.btn_cob_ConsultarCobClick(Sender: TObject);
begin
  ConsultarCobranca;
end;

procedure TFrmMain.CancelarCobranca;
begin
  LimparRespostas;
  CarregarConfig;
  RscPix1.CobCancelar(edt_cob_Txid.Text);
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

procedure TFrmMain.btn_cob_CancelarCobClick(Sender: TObject);
begin
  CancelarCobranca;
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


procedure TFrmMain.RscPix1CobTxId(Sender: TObject;
  const Response: TRespCobGet; Erro: String);
var
  cValor : String ;
begin
  if (Erro = '') then
    begin
      mm_Cob_Status.Text := 'Situação: ' +  Response.Status;
      Response.ToJson;
      if (Response.Status <> 'NAO_CRIADO') then
        begin
          cValor := StringReplace(Response.valor.original, '.', ',', [rfReplaceAll]);
          lbl_CobValorPago.caption := 'Valor á Pagar: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));

          if (Response.Status = 'CONCLUIDA') then
            begin
              edt_cob_Pix_endtoEndId.Text :=  Response.pix[0].endToEndId;
              edt_cob_Pix_Pago.Text       :=  FloatToStr(Response.pix[0].valor);

              if Response.pix[0].pagador <> nil then
                begin
                  edt_cob_nomePagador.Text  :=  Response.pix[0].pagador.nome;

                  if Response.pix[0].Pagador.cpf <> '' then
                    edt_cob_cpfcnpjPagador.Text   :=  Response.pix[0].Pagador.cpf
                  else
                    edt_cob_cpfcnpjPagador.Text   :=  Response.pix[0].Pagador.cnpj;
                end
              else
                begin
                  if Response.devedor <> nil then
                    begin
                      edt_cob_nomePagador.Text  :=  Response.devedor.nome;

                      if Response.devedor.cpf <> '' then
                        edt_cob_cpfcnpjPagador.Text   :=  Response.devedor.cpf
                      else
                        edt_cob_cpfcnpjPagador.Text   :=  Response.devedor.cnpj;
                    end;
                end;

              edt_cob_mensagemPagador.Text    :=  Response.pix[0].infoPagador;
              cValor := FloatToStr(Response.pix[0].valor);
              lbl_CobValorPago.caption := 'Valor Pago: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));
            end;

            edt_cob_valor.Text    :=  StringReplace(Response.valor.original, '.', ',', [rfReplaceAll]);
            edt_cob_mensagem.Text :=  Response.solicitacaopagador;


          if Response.status = 'ATIVA' then
            begin
              if Response.pixCopiaECola <> '' then
                begin
                  mm_CobPayload.Text  :=  Response.pixCopiaECola;
                  QRCodeWin(imgQRCODE, Response.pixCopiaECola);
                end
              else
                begin
                  mm_CobPayload.Text  :=  Response.location;
                  QRCodeWin(imgQRCODE, Response.location);
                end;
            end;

        end;
    end
  else
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Consultar Cobrança' + #13 + Erro, mtError, [mbOK], 0);
    end;
end;

end.
