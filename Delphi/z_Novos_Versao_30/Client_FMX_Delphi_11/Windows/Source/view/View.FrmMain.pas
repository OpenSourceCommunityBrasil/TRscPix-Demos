unit View.FrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ListBox, FMX.TabControl

  , System.TypInfo
  , System.IniFiles

  , Winapi.ShellAPI
  , Winapi.Windows

  , RscPix
  , RscPixTipos
  , RscPixToken

  , ClientFMX.Utils
  , FMX.Edit
  , FMX.Memo.Types
  , FMX.ScrollBox
  , FMX.Memo
  , FMX.DateTimeCtrls
  , System.Rtti
  , FMX.Grid.Style
  , FMX.Grid

  , FMX.DialogService

  ;

type
  AryFields = array of string;

type
  TFrnMain = class(TForm)
    Label1: TLabel;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    tbc_Main: TTabControl;
    tbi_Configuracoes: TTabItem;
    gpbx_ConfigPSP: TGroupBox;
    cbbx_PSP: TComboBox;
    Label2: TLabel;
    cbbx_Ambiente: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ambiente: TLabel;
    lbl_Psp: TLabel;
    lblCompVersao: TLabel;
    Img_Site: TImage;
    Img_GitHub: TImage;
    tbi_NovoToken: TTabItem;
    gpbx_ConfigAutenticar: TGroupBox;
    Label6: TLabel;
    edt_ConfigClientID: TEdit;
    Label7: TLabel;
    edt_ConfigClientSecret: TEdit;
    Label8: TLabel;
    edt_ConfigapplicationKey: TEdit;
    gpbx_ConfigCertificado: TGroupBox;
    Label9: TLabel;
    edt_ConfigCert: TEdit;
    Label10: TLabel;
    edt_ConfigCertKey: TEdit;
    btn_Config_Cert: TSpeedButton;
    btn_Config_CertKey: TSpeedButton;
    GroupBox1: TGroupBox;
    cbbx_CongifTipoChave: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    edt_ConfigChave: TEdit;
    Label13: TLabel;
    edt_ConfigDuracao: TEdit;
    tbi_Cob: TTabItem;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    Image1: TImage;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    lyt_Btn_NovoToken: TLayout;
    Image2: TImage;
    Label5: TLabel;
    mm_Token: TMemo;
    Layout5: TLayout;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    edt_cob_Txid: TEdit;
    btn_Cob_GerarTXID: TButton;
    edt_cob_valor: TEdit;
    Label15: TLabel;
    edt_cob_mensagem: TEdit;
    Label16: TLabel;
    GroupBox3: TGroupBox;
    edt_cob_nomePagador: TEdit;
    Label19: TLabel;
    edt_cob_cpfcnpjPagador: TEdit;
    Label17: TLabel;
    edt_cob_mensagemPagador: TEdit;
    Label18: TLabel;
    GroupBox4: TGroupBox;
    edt_cob_Pix_endtoEndId: TEdit;
    Label20: TLabel;
    edt_cob_Pix_Pago: TEdit;
    Label21: TLabel;
    GroupBox5: TGroupBox;
    Layout6: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout7: TLayout;
    Layout10: TLayout;
    Label23: TLabel;
    imgQRCODE: TImage;
    GroupBox6: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label24: TLabel;
    mm_CobPayload: TMemo;
    lbl_CobValorPago: TLabel;
    mm_Cob_Status: TMemo;
    tbi_ListaPixRecebidos: TTabItem;
    GroupBox8: TGroupBox;
    Label25: TLabel;
    edt_PagPixs: TEdit;
    btn_pix_ConsultarLista: TButton;
    dtp_Data_Inicial: TDateEdit;
    dtp_Hora_Inicial: TTimeEdit;
    Label26: TLabel;
    Label27: TLabel;
    dtp_Data_Final: TDateEdit;
    Label28: TLabel;
    dtp_Hora_Final: TTimeEdit;
    Label29: TLabel;
    edt_ItensPagPixs: TEdit;
    Label30: TLabel;
    edt_QtdPagPixs: TEdit;
    Label31: TLabel;
    edt_TotalItensPagPixs: TEdit;
    Label32: TLabel;
    strgrd_ListaPixRecebidos: TStringGrid;
    StringColumn1: TStringColumn;
    tbi_ListaLocCadastrados: TTabItem;
    GroupBox9: TGroupBox;
    Label33: TLabel;
    edt_PagLoc: TEdit;
    btn_Loc_ConsultarLista: TButton;
    dtp_LocData_Inicial: TDateEdit;
    dtp_LocHora_Inicial: TTimeEdit;
    Label34: TLabel;
    Label35: TLabel;
    dtp_LocData_Final: TDateEdit;
    Label36: TLabel;
    dtp_LocHora_Final: TTimeEdit;
    Label37: TLabel;
    edt_ItensPagLoc: TEdit;
    Label38: TLabel;
    edt_QtdPagLoc: TEdit;
    Label39: TLabel;
    edt_TotalItensPagLoc: TEdit;
    Label40: TLabel;
    strgrd_ListaLocations: TStringGrid;
    StringColumn2: TStringColumn;
    cbbx_LocTipoCob: TComboBox;
    Label41: TLabel;
    chkbx_Loc_txIdPresente: TCheckBox;
    tbi_Locations: TTabItem;
    Layout11: TLayout;
    Layout12: TLayout;
    Label42: TLabel;
    mm_LocPayload: TMemo;
    Label43: TLabel;
    mm_Loc_Status: TMemo;
    Layout13: TLayout;
    Layout14: TLayout;
    GroupBox10: TGroupBox;
    btn_Loc_Criar: TButton;
    btn_Loc_deletar: TButton;
    btn_Loc_Consultar: TButton;
    Layout15: TLayout;
    Label44: TLabel;
    imgQRCODE_Location: TImage;
    Layout16: TLayout;
    GroupBox11: TGroupBox;
    Label45: TLabel;
    cbbx_LocTipoCobCriar: TComboBox;
    edt_loc_id: TEdit;
    Label46: TLabel;
    Label47: TLabel;
    edt_loc_Location: TEdit;
    edt_loc_criacao: TEdit;
    Label48: TLabel;
    Label49: TLabel;
    edt_loc_txid: TEdit;
    btn_Loc_ConsultarQrCode: TButton;
    tbi_Webhooks: TTabItem;
    GroupBox12: TGroupBox;
    Label50: TLabel;
    edt_PagWebhook: TEdit;
    btn_webhook_ListarCadastrados: TButton;
    dtp_WebhookData_Inicial: TDateEdit;
    dtp_WebhookHora_Inicial: TTimeEdit;
    Label51: TLabel;
    Label52: TLabel;
    dtp_WebhookData_Final: TDateEdit;
    Label53: TLabel;
    dtp_WebhookHora_Final: TTimeEdit;
    Label54: TLabel;
    edt_ItensPagWebhook: TEdit;
    Label55: TLabel;
    edt_QtdPagWebhook: TEdit;
    Label56: TLabel;
    edt_TotalItensPagWebhook: TEdit;
    Label57: TLabel;
    strgrd_Listawebhooks: TStringGrid;
    StringColumn3: TStringColumn;
    Layout17: TLayout;
    Layout18: TLayout;
    GroupBox13: TGroupBox;
    Label60: TLabel;
    edt_webhook_url: TEdit;
    edt_webhook_chave: TEdit;
    Label61: TLabel;
    Label62: TLabel;
    edt_webhook_criacao: TEdit;
    GroupBox14: TGroupBox;
    btn_webhook_configurar: TButton;
    btn_webhook_consultar: TButton;
    btn_webhook_desvincular: TButton;
    tbi_CobV: TTabItem;
    Layout19: TLayout;
    GroupBox15: TGroupBox;
    Label58: TLabel;
    edt_cobV_Txid: TEdit;
    btn_CobV_GerarTXID: TButton;
    edt_cobV_valor: TEdit;
    Label59: TLabel;
    edt_cobV_mensagem: TEdit;
    Label63: TLabel;
    GroupBox16: TGroupBox;
    edt_cobV_nomePagador: TEdit;
    Label64: TLabel;
    edt_cobV_cpfcnpjPagador: TEdit;
    Label65: TLabel;
    edt_cobV_mensagemPagador: TEdit;
    Label66: TLabel;
    GroupBox17: TGroupBox;
    edt_cobV_Pix_endtoEndId: TEdit;
    Label67: TLabel;
    edt_cobV_Pix_Pago: TEdit;
    Label68: TLabel;
    Layout20: TLayout;
    Layout21: TLayout;
    Label70: TLabel;
    mm_CobvPayload: TMemo;
    lbl_CobVValorPago: TLabel;
    mm_CobV_Status: TMemo;
    Layout22: TLayout;
    Layout23: TLayout;
    GroupBox19: TGroupBox;
    btn_CobV_Criar: TButton;
    btn_CobV_Cancelar: TButton;
    btn_CobV_Consultar: TButton;
    Layout24: TLayout;
    Label72: TLabel;
    imgQRCODECobV: TImage;
    tbi_ListarCobs: TTabItem;
    GroupBox18: TGroupBox;
    Label69: TLabel;
    edt_PagCob: TEdit;
    btn_Cob_ConsultarLista: TButton;
    dtp_CobData_Inicial: TDateEdit;
    dtp_CobHora_Inicial: TTimeEdit;
    Label71: TLabel;
    Label73: TLabel;
    dtp_CobData_Final: TDateEdit;
    Label74: TLabel;
    dtp_CobHora_Final: TTimeEdit;
    Label75: TLabel;
    edt_ItensPagCob: TEdit;
    Label76: TLabel;
    edt_QtdPagCob: TEdit;
    Label77: TLabel;
    edt_TotalItensPagCob: TEdit;
    Label78: TLabel;
    strgrd_ListaCobs: TStringGrid;
    StringColumn4: TStringColumn;
    Label79: TLabel;
    cbbx_Cob_Doc: TComboBox;
    Edt_Cob_Doc: TEdit;
    Label80: TLabel;
    cbbx_Cob_Status: TComboBox;
    cbbx_Cob_LocationPresente: TComboBox;
    Label81: TLabel;
    tbi_CobVListar: TTabItem;
    GroupBox20: TGroupBox;
    Label82: TLabel;
    Edit1: TEdit;
    Button4: TButton;
    DateEdit1: TDateEdit;
    TimeEdit1: TTimeEdit;
    Label83: TLabel;
    Label84: TLabel;
    DateEdit2: TDateEdit;
    Label85: TLabel;
    TimeEdit2: TTimeEdit;
    Label86: TLabel;
    Edit2: TEdit;
    Label87: TLabel;
    Edit3: TEdit;
    Label88: TLabel;
    Edit4: TEdit;
    Label89: TLabel;
    Label90: TLabel;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    Label91: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label92: TLabel;
    StringGrid1: TStringGrid;
    StringColumn5: TStringColumn;
    tbi_Pix: TTabItem;
    Layout25: TLayout;
    GroupBox22: TGroupBox;
    edt_Pix_NomePagador: TEdit;
    Label96: TLabel;
    edt_Pix_Pagador_doc: TEdit;
    Label97: TLabel;
    edt_Pix_Pagador_info: TEdit;
    Label98: TLabel;
    GroupBox23: TGroupBox;
    edt_Pix_endToEndId: TEdit;
    Label99: TLabel;
    edt_Pix_ValorPago: TEdit;
    Label100: TLabel;
    Layout26: TLayout;
    Layout28: TLayout;
    Layout29: TLayout;
    Label93: TLabel;
    edt_Pix_TxId: TEdit;
    Layout30: TLayout;
    GroupBox21: TGroupBox;
    GroupBox24: TGroupBox;
    Label94: TLabel;
    edt_pix_dev_id: TEdit;
    Label102: TLabel;
    edt_pix_dev_rtrId: TEdit;
    lblpixvalor: TLabel;
    edt_pix_dev_valor: TEdit;
    lblPixnaturaza: TLabel;
    edt_pix_dev_hrsSoli: TEdit;
    Label106: TLabel;
    edt_pix_dev_status: TEdit;
    lblpixdescricao: TLabel;
    edt_pix_dev_natureza: TEdit;
    edt_pix_dev_motivo: TEdit;
    Label108: TLabel;
    edt_pix_dev_hrsLiq: TEdit;
    Label109: TLabel;
    edt_pix_dev_descricao: TEdit;
    lblpixhrssolic: TLabel;
    Label103: TLabel;
    edt_Pix_horario: TEdit;
    Label104: TLabel;
    edt_Pix_chave: TEdit;
    btn_Pix_Consultar: TButton;
    btn_Pix_Solicitar_Estorno: TButton;
    btn_Pix_Consultar_Estorno: TButton;
    mm_Pix_status: TMemo;
    Label22: TLabel;
    edt_Pix_TxIdDev: TEdit;
    btn_Cob_GerarTXIDDEV: TButton;
    Label101: TLabel;
    edt_cob_pix_TxIdDev: TEdit;
    RscPix1: TRscPix;
    procedure FormCreate(Sender: TObject);
    procedure Img_SiteClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Img_GitHubClick(Sender: TObject);
    procedure lyt_Btn_NovoTokenClick(Sender: TObject);
    procedure btn_Config_CertClick(Sender: TObject);
    procedure btn_Config_CertKeyClick(Sender: TObject);
    procedure btn_Cob_GerarTXIDClick(Sender: TObject);
    procedure btn_Cob_GerarTXIDDEVClick(Sender: TObject);

    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cbbx_PSPChange(Sender: TObject);
    procedure cbbx_AmbienteChange(Sender: TObject);

    procedure btn_Pix_Consultar_EstornoClick(Sender: TObject);
    procedure btn_Pix_Solicitar_EstornoClick(Sender: TObject);
    procedure btn_Pix_ConsultarClick(Sender: TObject);
    procedure btn_pix_ConsultarListaClick(Sender: TObject);
    procedure btn_Loc_ConsultarListaClick(Sender: TObject);
    procedure btn_Loc_CriarClick(Sender: TObject);
    procedure btn_Loc_ConsultarClick(Sender: TObject);
    procedure btn_Loc_deletarClick(Sender: TObject);
    procedure btn_Loc_ConsultarQrCodeClick(Sender: TObject);
    procedure btn_webhook_ListarCadastradosClick(Sender: TObject);
    procedure btn_webhook_configurarClick(Sender: TObject);
    procedure btn_webhook_consultarClick(Sender: TObject);
    procedure btn_webhook_desvincularClick(Sender: TObject);
    procedure btn_CobV_GerarTXIDClick(Sender: TObject);
    procedure btn_Cob_ConsultarListaClick(Sender: TObject);
  private
    FPath : string;
    NomeIniFile: string;
    RscPix2: TRscPix;

    procedure RscPix1Token(Sender: TObject; const Token: TToken; Erro: string);

    procedure RscPix1CobCancelar(Sender: TObject; const RespCobPatch: TRespCobPatch; Erro: string);
    procedure RscPix1CobConsultar(Sender: TObject; const Response: TRespCobGet; Erro: string);
    procedure RscPix1CobCriar(Sender: TObject; const RespCobPut: TRespCobPut; Erro: string);
    procedure RscPix1CobListar(Sender : TObject; Const Response: TRespCobListar; Erro: String);

    procedure RscPix1PixGetEndToEndId(Sender : TObject; Const Response: TRespPixGetEndToEndId; Erro: String);
//    procedure RscPix1PixConsultarPix(Sender: TObject; const RespPixGet: TRespPixGet; Erro: string);
    procedure RscPix1PixDevolucao(Sender: TObject; const RespPixPut: TRespPixPutSD; Erro: string);
    procedure RscPix1PixListaRecebidos(Sender : TObject; Const Response: TRespPixListaRecebidos; Erro: String);

    procedure RscPix1LocCriar(Sender : TObject; Const Response: TRespLocPost; Erro: String);
    procedure RscPix1LocConsultarList(Sender : TObject; Const Response: TRespLocList; Erro: String);
    procedure RscPix1LocConsultarlocId(Sender : TObject; Const Response: TRespLocGet; Erro: String);
    procedure RscPix1LocConsultarlocIdQrCode(Sender : TObject; Const Response: TRespLocGetIdQrcode; Erro: String);
    procedure RscPix1LocDesvincularTxId(Sender : TObject; Const Response: TRespLocDelete; Erro: String);

    procedure RscPix1WebhookListar(Sender : TObject; Const Response: TRespWebhookListar; Erro: String);
    procedure RscPix1WebhookGet(Sender : TObject; Const Response: TRespWebhookGet; Erro: String);
    procedure RscPix1WebhookPut(Sender : TObject; Const Response: TRespWebhookPutDelete; Erro: String);
    procedure RscPix1WebhookDelete(Sender : TObject; Const Response: TRespWebhookPutDelete; Erro: String);

    { Private declarations }

    procedure OpenFileOrURL(const APath: string);

    procedure LerIni;
    procedure GravarIni;
    procedure refazerNomeIniFile;

    procedure CreateFieldsDataSet(vStringGrid: TStringGrid; vFields: AryFields = []);

    procedure CarregarConfig;
    procedure LimparRespostas;

    {TOKEN}
    procedure GerarNovoToken;

    {COB}
    procedure CriarCobranca;
    procedure ConsultarCobranca;
    procedure CancelarCobranca;
    procedure ConsultarListaCobs;

    {pix}
    procedure ConsultarPix;
    procedure SolicitarDevolucaoPix;
    procedure ConsultarDevolucaoPix;
    procedure ConsultarListaPixsRecebidos;

    {LOC}
    procedure ConsultarListaLocations;
    procedure ConsultarLocation;
    procedure ConsultarLocationQrCode;
    procedure CriarLocations;
    procedure DeletarLocation;

    {WEBHOOK}
    procedure WebHookListarcadastrados;
    procedure WebHookConsultar;
    procedure WebHookConfigurar;
    procedure WebHookDeletar;




  public
    { Public declarations }
  end;

var
  FrnMain: TFrnMain;

const
  SECTION_AUTENTICAR    = 'AUTENTICAR';
  IDENT_APPLICATION_KEY = 'APPLICATION_KEY';
  IDENT_CLIENT_ID       = 'CLIENT_ID';
  IDENT_CLIENT_SECRET   = 'CLIENT_SECRET';

  SECTION_CERTIFICADO   = 'CERTIFICADO';
  IDENT_CERT_FILE       = 'CERT_FILE';
  IDENT_CERT_KEY_FILE   = 'CERT_KEY_FILE';

  SECTION_PSP           = 'PSP';
  IDENT_PSP             = 'PSP';
  IDENT_AMBIENTE        = 'AMBIENTE';

  SECTION_TITULAR       = 'TITULAR';
  IDENT_CHAVE           = 'CHAVE';
  IDENT_TIPO_CHAVE      = 'TIPO_CHAVE';
  IDENT_DURACAO_QRCODE  = 'DURACAO_QRCODE';

  SECTION_TOKEN         = 'TOKEN';
  IDENT_TOKEN           = 'TOKEN';

  FILE_INI              = 'Config.ini';

implementation

{$R *.fmx}


procedure TFrnMain.OpenFileOrURL(const APath: string);
begin
  ShellExecute(0, 'open', PChar(APath), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrnMain.refazerNomeIniFile;
begin
  if
    (cbbx_PSP.ItemIndex >= 0) and
    (cbbx_Ambiente.ItemIndex >= 0)
  then
    begin
      NomeIniFile :=  cbbx_PSP.Items[cbbx_PSP.ItemIndex] +  '_'  +  cbbx_Ambiente.Items[cbbx_Ambiente.ItemIndex]  + '_'+ FILE_INI;
      LerIni;
    end;
end;

procedure TFrnMain.RscPix1CobCancelar(Sender: TObject;
  const RespCobPatch: TRespCobPatch; Erro: string);
begin
  if (Erro = '') then
    begin
      mm_Cob_Status.Text := 'Situação: ' +  RespCobPatch.Status;
    end
  else
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao Revisar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end;
end;

procedure TFrnMain.RscPix1CobConsultar(Sender: TObject;
  const Response: TRespCobGet; Erro: string);
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
          lbl_CobValorPago.Text := 'Valor á Pagar: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));

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
              lbl_CobValorPago.Text := 'Valor Pago: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));
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
      TDialogService.MessageDialog('Erro ao Consultar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end;
end;

procedure TFrnMain.RscPix1CobCriar(Sender: TObject;
  const RespCobPut: TRespCobPut; Erro: string);
var
  cValor : String ;
begin
  if (Erro = '') then
    begin
      mm_Cob_Status.text := 'Situação: ' +  RespCobPut.Status;
      if (RespCobPut.Status <> 'NAO_CRIADO') then
        begin
          cValor := StringReplace(RespCobPut.valor.original, '.', ',', [rfReplaceAll]);
          lbl_CobValorPago.Text := 'Valor á Pagar: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));

//          if RespCobPut.textoImagemQRcode <> '' then
//            begin
//              mm_CobPayload.Text  :=  RespCobPut.textoImagemQRcode;
//              QRCodeWin(imgQRCODE, RespCobPut.textoImagemQRcode);
//            end
//          else
//            begin
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
//            end;
        end;
    end
  else
    begin
      mm_Cob_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao Criar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end;
end;

procedure TFrnMain.RscPix1CobListar(Sender: TObject;
  const Response: TRespCobListar; Erro: String);
var
  I:integer;
begin
  if Erro <> '' then
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao Consultar Lista de Cobranças' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      edt_PagCob.Text            :=  IntToStr(Response.parametros.paginacao.paginaAtual);
      edt_QtdPagCob.Text         :=  IntToStr(Response.parametros.paginacao.quantidadeDePaginas);
      edt_ItensPagCob.Text       :=  IntToStr(Response.parametros.paginacao.itensPorPagina);
      edt_TotalItensPagCob.Text  :=  IntToStr(Response.parametros.paginacao.quantidadeTotalDeItens);

      CreateFieldsDataSet(strgrd_ListaCobs,
      [
      'txid',
      'chave',
      'valor.original',
      'status',
      'location',
      'revisao',
      'calendario.expiracao',
      'calendario.criacao',
      'pixCopiaECola',
      'loc.id',
      'loc.location',
      'loc.tipoCob',
      'loc.criacao',
      'recebedor.cpf_cnpj',
      'recebedor.nome',
      'recebedor.logradouro',
      'recebedor.cidade',
      'recebedor.uf',
      'recebedor.cep'
      ]);

      strgrd_ListaCobs.RowCount :=  Response.cobs.Count;
      for i := 0 to Response.cobs.Count - 1 do
        begin
          strgrd_ListaCobs.Cells[0, I]  :=  Response.cobs[i].TxId;
          strgrd_ListaCobs.Cells[1, I]  :=  Response.cobs[i].chave;
          strgrd_ListaCobs.Cells[2, I]  :=  Response.cobs[i].valor.original;
          strgrd_ListaCobs.Cells[3, I]  :=  Response.cobs[i].status;
          strgrd_ListaCobs.Cells[4, I]  :=  Response.cobs[i].location;
          strgrd_ListaCobs.Cells[5, I]  :=  Response.cobs[i].revisao.ToString;
          strgrd_ListaCobs.Cells[6, I]  :=  Response.cobs[i].calendario.expiracao.ToString;
          strgrd_ListaCobs.Cells[7, I]  :=  Response.cobs[i].calendario.criacao;
          strgrd_ListaCobs.Cells[8, I]  :=  Response.cobs[i].pixCopiaECola;
          strgrd_ListaCobs.Cells[9, I]  :=  Response.cobs[i].loc.id.ToString;
          strgrd_ListaCobs.Cells[10, I]  :=  Response.cobs[i].loc.location;
          strgrd_ListaCobs.Cells[11, I]  :=  Response.cobs[i].loc.tipoCob;
          strgrd_ListaCobs.Cells[12, I]  :=  Response.cobs[i].loc.criacao;
          if Response.cobs[i].recebedor.cnpj = '' then
            strgrd_ListaCobs.Cells[13, I]  :=  Response.cobs[i].recebedor.cpf
          else
            strgrd_ListaCobs.Cells[13, I]  :=  Response.cobs[i].recebedor.cnpj;
          strgrd_ListaCobs.Cells[14, I]  :=  Response.cobs[i].recebedor.nome;
          strgrd_ListaCobs.Cells[15, I]  :=  Response.cobs[i].recebedor.logradouro;
          strgrd_ListaCobs.Cells[16, I]  :=  Response.cobs[i].recebedor.cidade;
          strgrd_ListaCobs.Cells[17, I]  :=  Response.cobs[i].recebedor.uf;
          strgrd_ListaCobs.Cells[18, I]  :=  Response.cobs[i].recebedor.cep;
        end;
    end;
end;

procedure TFrnMain.RscPix1LocCriar(Sender: TObject;
  const Response: TRespLocPost; Erro: String);
begin
  if Erro <> '' then
    begin
      mm_Cob_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao criar location' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      if Response.tipoCob = 'cob' then
        cbbx_LocTipoCobCriar.ItemIndex  :=  0
      else
        cbbx_LocTipoCobCriar.ItemIndex  :=  1;
      edt_loc_id.Text       :=  Response.id.ToString;
      edt_loc_Location.Text :=  Response.location;
      edt_loc_criacao.Text  :=  Response.criacao;
    end;
end;

procedure TFrnMain.RscPix1LocConsultarList(Sender: TObject;
  const Response: TRespLocList; Erro: String);
var
  I:integer;
begin
  if Erro <> '' then
    begin
      mm_Loc_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao consultar lista de locations' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      edt_PagLoc.Text            :=  IntToStr(Response.parametros.paginacao.paginaAtual);
      edt_QtdPagLoc.Text         :=  IntToStr(Response.parametros.paginacao.quantidadeDePaginas);
      edt_ItensPagLoc.Text       :=  IntToStr(Response.parametros.paginacao.itensPorPagina);
      edt_TotalItensPagLoc.Text  :=  IntToStr(Response.parametros.paginacao.quantidadeTotalDeItens);

      CreateFieldsDataSet(strgrd_ListaLocations,
      ['id',
      'location',
      'tipoCob',
      'criacao',
      'txid']);

      strgrd_ListaLocations.RowCount :=  Response.loc.Count;
      for I := 0 to Response.loc.Count - 1 do
        begin
          strgrd_ListaLocations.Cells[0, I]  :=  Response.loc[i].id.ToString;
          strgrd_ListaLocations.Cells[1, I]  :=  Response.loc[i].location;
          strgrd_ListaLocations.Cells[2, I]  :=  Response.loc[i].tipoCob;
          strgrd_ListaLocations.Cells[3, I]  :=  DateTimeToStr(ISO8601ToDateTime(Response.loc[i].criacao));
          strgrd_ListaLocations.Cells[4, I]  :=  Response.loc[i].txid;
        end;
    end;
end;

procedure TFrnMain.RscPix1LocConsultarlocId(Sender: TObject;
  const Response: TRespLocGet; Erro: String);
begin
  if Erro <> '' then
    begin
      mm_Loc_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao consultar location' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      if Response.tipoCob = 'cob' then
        cbbx_LocTipoCobCriar.ItemIndex  :=  0
      else
        cbbx_LocTipoCobCriar.ItemIndex  :=  1;
      edt_loc_id.Text       :=  Response.id.ToString;
      edt_loc_Location.Text :=  Response.location;
      edt_loc_criacao.Text  :=  Response.criacao;
      edt_loc_txid.Text     :=  Response.txid;
    end;
end;

procedure TFrnMain.RscPix1LocConsultarlocIdQrCode(Sender: TObject;
  const Response: TRespLocGetIdQrcode; Erro: String);
begin
  if Erro <> '' then
    begin
      mm_Loc_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao criar location' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      mm_LocPayload.Text := 'Payload: ' + Response.qrcode;
      mm_Loc_Status.Text := 'link Visualizacao: '  + Response.linkVisualizacao;
      QRCodeWin(imgQRCODE_Location, Response.qrcode);
    end;
end;

procedure TFrnMain.RscPix1LocDesvincularTxId(Sender: TObject;
  const Response: TRespLocDelete; Erro: String);
begin
  if Erro <> '' then
    begin
      mm_Cob_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao desvincular TxId do location' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      if Response.tipoCob = 'cob' then
        cbbx_LocTipoCobCriar.ItemIndex  :=  0
      else
        cbbx_LocTipoCobCriar.ItemIndex  :=  1;
      edt_loc_id.Text       :=  Response.id.ToString;
      edt_loc_Location.Text :=  Response.location;
      edt_loc_criacao.Text  :=  Response.criacao;
    end;
end;

procedure TFrnMain.RscPix1WebhookListar(Sender: TObject;
  const Response: TRespWebhookListar; Erro: String);
var
  I:integer;
begin
  if Erro <> '' then
    begin
      mm_Loc_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao consultar lista de locations' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      edt_PagWebhook.Text            :=  IntToStr(Response.parametros.paginacao.paginaAtual);
      edt_QtdPagWebhook.Text         :=  IntToStr(Response.parametros.paginacao.quantidadeDePaginas);
      edt_ItensPagWebhook.Text       :=  IntToStr(Response.parametros.paginacao.itensPorPagina);
      edt_TotalItensPagWebhook.Text  :=  IntToStr(Response.parametros.paginacao.quantidadeTotalDeItens);

      CreateFieldsDataSet(strgrd_Listawebhooks,
      ['webhookUrl',
      'chave',
      'criacao']);

      strgrd_Listawebhooks.RowCount :=  Response.webhooks.Count;
      for I := 0 to Response.webhooks.Count - 1 do
        begin
            strgrd_Listawebhooks.Cells[0, I]  :=  Response.webhooks[i].webhookUrl;

          strgrd_Listawebhooks.Cells[1, I]  :=  Response.webhooks[i].chave;
          strgrd_Listawebhooks.Cells[2, I]  :=  Response.webhooks[i].criacao;
        end;
    end;
end;

procedure TFrnMain.RscPix1WebhookGet(Sender: TObject;
  const Response: TRespWebhookGet; Erro: String);
begin
  if Erro <> '' then
    begin
      mm_Loc_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao consultar location' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      edt_webhook_url.Text      :=  Response.webhookUrl;
      edt_webhook_chave.Text    :=  Response.chave;
      edt_webhook_criacao.Text  :=  Response.criacao;
    end;
end;

procedure TFrnMain.RscPix1WebhookPut(Sender: TObject;
  const Response: TRespWebhookPutDelete; Erro: String);
begin
  if Erro <> '' then
    begin
      mm_Loc_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao configurar location' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      TDialogService.MessageDialog(Response.response, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end;
end;

procedure TFrnMain.RscPix1WebhookDelete(Sender: TObject;
  const Response: TRespWebhookPutDelete; Erro: String);
begin
  if Erro <> '' then
    begin
      mm_Loc_Status.text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao remover location' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      TDialogService.MessageDialog(Response.response, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end;
end;


procedure TFrnMain.RscPix1PixGetEndToEndId(Sender: TObject;
  const Response: TRespPixGetEndToEndId; Erro: String);
begin
  if (Erro = '') then
    begin
      mm_Pix_status.Text := Response.ToJson;

      edt_Pix_TxId.Text            :=  Response.txid;
      edt_Pix_ValorPago.Text  :=  FloatToStr(Response.valor);
      edt_Pix_horario.Text  :=  Response.horario;
      edt_Pix_chave.Text  :=  Response.chave;
      edt_Pix_Pagador_info.Text  :=  Response.infoPagador;

      if Response.pagador <> nil then
        begin
          edt_Pix_NomePagador.Text  :=  Response.pagador.nome;

          if Response.Pagador.cpf <> '' then
            edt_Pix_Pagador_doc.Text   :=  Response.Pagador.cpf
          else
            edt_Pix_Pagador_doc.Text   :=  Response.Pagador.cnpj;
        end
      else
        begin
  //                  if Response.devedor <> nil then
  //                    begin
  //                      edt_NomePagador.Text  :=  Response.devedor.nome;
  //
  //                      if Response.devedor.cpf <> '' then
  //                        edt_DocPagador.Text   :=  Response.devedor.cpf
  //                      else
  //                        edt_DocPagador.Text   :=  Response.devedor.cnpj;
  //                    end
        end;

      if Response.devolucoes <> nil then
        begin
          if Response.devolucoes.Count > 0 then
            begin
              edt_pix_dev_id.Text         :=  Response.devolucoes.Items[0].id;
              edt_pix_dev_rtrId.Text      :=  Response.devolucoes.Items[0].rtrId;
              edt_pix_dev_valor.Text      :=  Response.devolucoes.Items[0].valor;
              edt_pix_dev_natureza.Text   :=  Response.devolucoes.Items[0].natureza;
              edt_pix_dev_descricao.Text  :=  Response.devolucoes.Items[0].descricao;
              edt_pix_dev_status.Text     :=  Response.devolucoes.Items[0].status;
              edt_pix_dev_motivo.Text     :=  Response.devolucoes.Items[0].motivo;
              if Response.devolucoes.Items[0].horario <> nil then
                begin
                  edt_pix_dev_hrsLiq.Text     :=  Response.devolucoes.Items[0].horario.liquidacao;
                  edt_pix_dev_hrsSoli.Text    :=  Response.devolucoes.Items[0].horario.solicitacao;
                end;
            end;
        end;

    end
  else
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao Consultar PIX' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end;
end;

//procedure TFrnMain.RscPix1PixConsultarPix(Sender: TObject;
//  const RespPixGet: TRespPixGet; Erro: string);
//begin
//  if (Erro = '') then
//    begin
//      mm_Pix_status.Text := Response.ToJson;
//
//      edt_Pix_TxId.Text            :=  Response.txid;
//      edt_Pix_ValorPago.Text  :=  FloatToStr(Response.valor);
//      edt_Pix_horario.Text  :=  Response.horario;
//      edt_Pix_chave.Text  :=  Response.chave;
//      edt_Pix_Pagador_info.Text  :=  Response.infoPagador;
//
//      if Response.pagador <> nil then
//        begin
//          edt_Pix_NomePagador.Text  :=  Response.pagador.nome;
//
//          if Response.Pagador.cpf <> '' then
//            edt_Pix_Pagador_doc.Text   :=  Response.Pagador.cpf
//          else
//            edt_Pix_Pagador_doc.Text   :=  Response.Pagador.cnpj;
//        end
//      else
//        begin
//  //                  if Response.devedor <> nil then
//  //                    begin
//  //                      edt_NomePagador.Text  :=  Response.devedor.nome;
//  //
//  //                      if Response.devedor.cpf <> '' then
//  //                        edt_DocPagador.Text   :=  Response.devedor.cpf
//  //                      else
//  //                        edt_DocPagador.Text   :=  Response.devedor.cnpj;
//  //                    end
//        end;
//
//      if Response.devolucoes <> nil then
//        begin
//          if Response.devolucoes.Count > 0 then
//            begin
//              edt_pix_dev_id.Text         :=  Response.devolucoes.Items[0].id;
//              edt_pix_dev_rtrId.Text      :=  Response.devolucoes.Items[0].rtrId;
//              edt_pix_dev_valor.Text      :=  Response.devolucoes.Items[0].valor;
//              edt_pix_dev_natureza.Text   :=  Response.devolucoes.Items[0].natureza;
//              edt_pix_dev_descricao.Text  :=  Response.devolucoes.Items[0].descricao;
//              edt_pix_dev_status.Text     :=  Response.devolucoes.Items[0].status;
//              edt_pix_dev_motivo.Text     :=  Response.devolucoes.Items[0].motivo;
//              if Response.devolucoes.Items[0].horario <> nil then
//                begin
//                  edt_pix_dev_hrsLiq.Text     :=  Response.devolucoes.Items[0].horario.liquidacao;
//                  edt_pix_dev_hrsSoli.Text    :=  Response.devolucoes.Items[0].horario.solicitacao;
//                end;
//            end;
//        end;
//
//    end
//  else
//    begin
//      mm_Cob_Status.Text  := 'Situação: '  + Erro;
//      TDialogService.MessageDialog('Erro ao Consultar PIX' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
//    end;
//end;

procedure TFrnMain.RscPix1PixDevolucao(Sender: TObject;
  const RespPixPut: TRespPixPutSD; Erro: string);
begin
  if Erro <> '' then
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao Solicitar Devolução' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      mm_Cob_Status.Text := ' - status.............: ' + RespPixPut.Status + sLineBreak
                          + ' - id.................: '  + Trim(RespPixPut.id) + sLineBreak
                          + ' - rtrId..............: ' + Trim(RespPixPut.rtrId) + sLineBreak
                          + ' - valor..............: '  + RespPixPut.valor  + sLineBreak
                          + ' - natureza...........: '  + Trim(RespPixPut.natureza) +  sLineBreak
                          + ' - descricao..........: '  + Trim(RespPixPut.descricao) +  sLineBreak
                          + ' - horario.liquidacao.: '  + Trim(RespPixPut.horario.liquidacao) +  sLineBreak
                          + ' - horario.solicitacao: '  + Trim(RespPixPut.horario.solicitacao) +  sLineBreak
                          + ' - motivo.............: '  + Trim(RespPixPut.motivo)
                          ;
    end;
end;

procedure TFrnMain.RscPix1PixListaRecebidos(Sender: TObject;
  const Response: TRespPixListaRecebidos; Erro: String);
var
  I:integer;
begin
  if Erro <> '' then
    begin
      mm_Cob_Status.Text  := 'Situação: '  + Erro;
      TDialogService.MessageDialog('Erro ao Consultar Lista de PIX´s recebidos' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
      edt_PagPixs.Text            :=  IntToStr(Response.parametros.paginacao.paginaAtual);
      edt_QtdPagPixs.Text         :=  IntToStr(Response.parametros.paginacao.quantidadeDePaginas);
      edt_ItensPagPixs.Text       :=  IntToStr(Response.parametros.paginacao.itensPorPagina);
      edt_TotalItensPagPixs.Text  :=  IntToStr(Response.parametros.paginacao.quantidadeTotalDeItens);

      CreateFieldsDataSet(strgrd_ListaPixRecebidos,
      ['nomePagador',
      'cpfcnpjpagador',
      'inforpagador',
      'endtoebdid',
      'txid',
      'valor',
      'DataHora']);

      strgrd_ListaPixRecebidos.RowCount :=  Response.pix.Count;
      for i := 0 to Response.pix.Count - 1 do
        begin

          if Response.pix[i].pagador <> nil then
            begin
              strgrd_ListaPixRecebidos.Cells[0, I] :=  Response.pix[i].pagador.nome;

              if Response.pix[i].pagador.cpf = EmptyStr then
                strgrd_ListaPixRecebidos.Cells[1, I]  :=  Response.pix[i].pagador.cnpj
              else
                strgrd_ListaPixRecebidos.Cells[1, I] :=  Response.pix[i].pagador.cpf;
            end;

          strgrd_ListaPixRecebidos.Cells[2, I]  :=  Response.pix[i].infoPagador;
          strgrd_ListaPixRecebidos.Cells[3, I]  :=  Response.pix[i].endToEndId;
          strgrd_ListaPixRecebidos.Cells[4, I]  :=  Response.pix[i].TxId;
          strgrd_ListaPixRecebidos.Cells[5, I]  :=  Response.pix[i].valor.ToString;
          strgrd_ListaPixRecebidos.Cells[6, I]  :=  DateTimeToStr(ISO8601ToDateTime(Response.pix[i].horario));
        end;
    end;

end;

procedure TFrnMain.RscPix1Token(Sender: TObject; const Token: TToken;
  Erro: string);
begin
  if  Erro <> '' then
    begin
      mm_Token.Text  :=  Erro;
    end
  else
    begin
      mm_Token.Text  :=  Token.ToJson;
      GravarIni;
    end;
end;

procedure TFrnMain.lyt_Btn_NovoTokenClick(Sender: TObject);
begin
  GerarNovoToken;
end;

procedure TFrnMain.LerIni;
var
  ArquivoINI: TIniFile;
begin

  ArquivoINI := TIniFile.Create(FPath + NomeIniFile);
  try
    edt_ConfigapplicationKey.Text   :=  ArquivoINI.ReadString(SECTION_AUTENTICAR, IDENT_APPLICATION_KEY, '');
    edt_ConfigClientID.Text         :=  ArquivoINI.ReadString(SECTION_AUTENTICAR, IDENT_CLIENT_ID, '');
    edt_ConfigClientSecret.Text     :=  ArquivoINI.ReadString(SECTION_AUTENTICAR, IDENT_CLIENT_SECRET, '');

    edt_ConfigCert.Text             :=  ArquivoINI.ReadString(SECTION_CERTIFICADO, IDENT_CERT_FILE, '');
    edt_ConfigCertKey.Text          :=  ArquivoINI.ReadString(SECTION_CERTIFICADO, IDENT_CERT_KEY_FILE, '');

//    if FileExists(FPath + NomeIniFile) then
//      begin
//        cbbx_PSP.ItemIndex              :=  ArquivoINI.ReadInteger(SECTION_PSP, IDENT_PSP, 0);
//        cbbx_Ambiente.ItemIndex         :=  ArquivoINI.ReadInteger(SECTION_PSP, IDENT_AMBIENTE, 0);
//      end;

    edt_ConfigChave.Text            :=  ArquivoINI.ReadString(SECTION_TITULAR, IDENT_CHAVE, '');
    cbbx_CongifTipoChave.ItemIndex  :=  ArquivoINI.ReadInteger(SECTION_TITULAR, IDENT_TIPO_CHAVE, 0);
    edt_ConfigDuracao.Text          :=  IntToStr(ArquivoINI.ReadInteger(SECTION_TITULAR, IDENT_DURACAO_QRCODE, 60));

    RscPix2.Token.AccessToken       :=  ArquivoINI.ReadString(SECTION_TOKEN, IDENT_TOKEN, '');

  finally
    ArquivoINI.Free;
  end;
end;

procedure TFrnMain.GravarIni;
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(FPath + NomeIniFile);
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

    ArquivoINI.WriteString(SECTION_TOKEN, IDENT_TOKEN, RscPix2.Token.AccessToken);

  finally
    ArquivoINI.Free;
  end;
end;

procedure TFrnMain.btn_CobV_GerarTXIDClick(Sender: TObject);
begin
  edt_cobV_Txid.Text  :=
    'COBV'
    + FormatDateTime('ddmmyyyyhhnnsszzz', Now)
    + 'RSC' + FormatFloat('0000000', random(999999));
end;

procedure TFrnMain.btn_Cob_ConsultarListaClick(Sender: TObject);
begin
  ConsultarListaCobs;
end;

procedure TFrnMain.btn_Cob_GerarTXIDClick(Sender: TObject);
begin
  edt_cob_Txid.Text  :=
    'COB'
    + FormatDateTime('ddmmyyyyhhnnsszzz', Now)
    + 'RSC' + FormatFloat('0000000', random(9999999));
end;

procedure TFrnMain.btn_Cob_GerarTXIDDEVClick(Sender: TObject);
begin
  edt_Pix_TxIdDev.Text  :=
    'DEV'
    + FormatDateTime('ddmmyyyyhhnnsszzz', Now)
    + 'RSC' + FormatFloat('0000000', random(9999999));
end;

procedure TFrnMain.btn_Config_CertClick(Sender: TObject);
var
  Open_Dialog: TOpenDialog;
begin
  Open_Dialog :=  TOpenDialog.Create(nil);
  try
    Open_Dialog.DefaultExt := '*.pem' ;
    Open_Dialog.Filter := 'Arquivos pem|*.pem|Arquivos cer|*.cer' ;
    if Open_Dialog.Execute then
       begin
        edt_ConfigCert.Text := Open_Dialog.FileName ;
       end;
  finally
    Open_Dialog.Free;
  end;
end;

procedure TFrnMain.btn_Config_CertKeyClick(Sender: TObject);
var
  Open_Dialog: TOpenDialog;
begin
  Open_Dialog :=  TOpenDialog.Create(nil);
  try
    Open_Dialog.DefaultExt := '*.key' ;
    Open_Dialog.Filter := 'Arquivos key|*.key' ;
    if Open_Dialog.Execute then
       begin
        edt_ConfigCertKey.Text := Open_Dialog.FileName ;
       end;
  finally
    Open_Dialog.Free;
  end;
end;

procedure TFrnMain.btn_Loc_ConsultarClick(Sender: TObject);
begin
  ConsultarLocation;
end;

procedure TFrnMain.btn_Loc_ConsultarListaClick(Sender: TObject);
begin
  ConsultarListaLocations;
end;

procedure TFrnMain.btn_Loc_ConsultarQrCodeClick(Sender: TObject);
begin
  ConsultarLocationQrCode;
end;

procedure TFrnMain.btn_Loc_CriarClick(Sender: TObject);
begin
  CriarLocations;
end;

procedure TFrnMain.btn_Loc_deletarClick(Sender: TObject);
begin
  DeletarLocation;
end;

procedure TFrnMain.btn_Pix_ConsultarClick(Sender: TObject);
begin
  ConsultarPix;
end;

procedure TFrnMain.btn_pix_ConsultarListaClick(Sender: TObject);
begin
  ConsultarListaPixsRecebidos;
end;

procedure TFrnMain.btn_Pix_Consultar_EstornoClick(Sender: TObject);
begin
  ConsultarDevolucaoPix;
end;

procedure TFrnMain.btn_Pix_Solicitar_EstornoClick(Sender: TObject);
begin
  SolicitarDevolucaoPix;
end;

procedure TFrnMain.btn_webhook_configurarClick(Sender: TObject);
begin
  WebHookConfigurar;
end;

procedure TFrnMain.btn_webhook_consultarClick(Sender: TObject);
begin
  WebHookConsultar;
end;

procedure TFrnMain.btn_webhook_desvincularClick(Sender: TObject);
begin
  WebHookDeletar;
end;

procedure TFrnMain.btn_webhook_ListarCadastradosClick(Sender: TObject);
begin
  WebHookListarcadastrados;
end;

procedure TFrnMain.Button1Click(Sender: TObject);
begin
  CriarCobranca;
end;

procedure TFrnMain.Button2Click(Sender: TObject);
begin
  CancelarCobranca;
end;

procedure TFrnMain.Button3Click(Sender: TObject);
begin
  ConsultarCobranca;
end;

procedure TFrnMain.CarregarConfig;
begin
  RscPix2.Autenticar.Application_key  :=  edt_ConfigapplicationKey.Text;
  RscPix2.Autenticar.Client_ID        :=  edt_ConfigClientID.Text;
  RscPix2.Autenticar.Client_Secret    :=  edt_ConfigClientSecret.Text;

  RscPix2.Certificado.CertFile        :=  edt_ConfigCert.Text;
  RscPix2.Certificado.CertKeyFile     :=  edt_ConfigCertKey.Text;

  RscPix2.PSP.Psp                     :=  TTipoPSP(cbbx_PSP.ItemIndex);
  RscPix2.PSP.PspAmbiente             :=  TTipoAmbiente(cbbx_Ambiente.ItemIndex);

  RscPix2.Titular.ChavePix            :=  edt_ConfigChave.Text;
  RscPix2.Titular.TipoChavePix        :=  TTipoChavePIX(cbbx_CongifTipoChave.ItemIndex);
  RscPix2.Titular.DuracaoMinutos      :=  StrToIntDef(edt_ConfigDuracao.Text, 60);
end;

procedure TFrnMain.cbbx_AmbienteChange(Sender: TObject);
begin
  lbl_ambiente.Text  := cbbx_Ambiente.Items[cbbx_Ambiente.ItemIndex];
  refazerNomeIniFile;
end;

procedure TFrnMain.cbbx_PSPChange(Sender: TObject);
begin
  if  TTipoPSP(cbbx_PSP.ItemIndex) = pspBancoDoBrasil  then
    begin
      edt_ConfigapplicationKey.Visible  :=  True;
      Label8.Visible  :=  True;
    end
  else
    begin
      edt_ConfigapplicationKey.Visible  :=  False;
      Label8.Visible  :=  False;
    end;

  lbl_Psp.Text       :=  cbbx_PSP.Items[cbbx_PSP.ItemIndex];

  refazerNomeIniFile;
end;

procedure TFrnMain.LimparRespostas;
begin
  if  FileExists(FPath + 'TRscPix_200x200.png') then
    imgQRCODE.Bitmap.LoadFromFile(FPath + 'TRscPix_200x200.png');
  imgQRCODE.Repaint;

  mm_CobPayload.Text  :=  '';
  mm_Cob_Status.Text  :=  '';

  lbl_CobValorPago.Text  :=  '';

  edt_cob_Pix_endtoEndId.Text   :=  '';
  edt_cob_Pix_Pago.Text         :=  '';
  edt_cob_nomePagador.Text      :=  '';
  edt_cob_cpfcnpjPagador.Text   :=  '';
  edt_cob_mensagemPagador.Text  :=  '';
end;

procedure TFrnMain.GerarNovoToken;
begin
  CarregarConfig;
  RscPix2.NovoToken;
end;

procedure TFrnMain.CriarCobranca;
begin
  LimparRespostas;
  CarregarConfig;
  RscPix2.CobCriar(StrToFloatDef(edt_cob_valor.Text, 0), edt_cob_Txid.Text, edt_cob_mensagem.Text);
end;

procedure TFrnMain.ConsultarCobranca;
begin
  LimparRespostas;
  CarregarConfig;
  RscPix2.CobTxId(edt_cob_Txid.Text);
end;

procedure TFrnMain.CancelarCobranca;
begin
  LimparRespostas;
  CarregarConfig;
  RscPix2.CobCancelar(edt_cob_Txid.Text);
end;

procedure TFrnMain.ConsultarListaCobs;
var
  sDocF, sDocJ, sStuatus: string;
begin
  case cbbx_Cob_Doc.ItemIndex of
    0:
      begin
        sDocF  :=  Trim(Edt_Cob_Doc.Text);
        sDocJ  :=  '';
      end;
    1:
      begin
        sDocF  :=  '';
        sDocJ  :=  Trim(Edt_Cob_Doc.Text);
      end;
  else
    sDocF  :=  '';
    sDocJ  :=  '';
  end;

  if cbbx_Cob_Status.ItemIndex >= 0 then
    sStuatus  :=  cbbx_Cob_Status.Items[cbbx_Cob_Status.ItemIndex]
  else
    sStuatus  :=  '';

  CarregarConfig;
  RscPix2.CobListar(
    StrToDateTime(DateToStr(dtp_CobData_Inicial.Date) + TimeToStr(dtp_CobHora_Inicial.Time)) ,
    StrToDateTime(DateToStr(dtp_CobData_Final.Date) + TimeToStr(dtp_cobHora_Final.Time)),
    StrToIntDef(edt_PagCob.Text, 0),
    StrToIntDef(edt_ItensPagCob.Text, 0),
    sDocF, sDocJ, sStuatus,
    (cbbx_Cob_Status.ItemIndex = 0)
    );
end;

procedure TFrnMain.ConsultarPix;
var
  end2id: string;
begin
  end2id  :=  Trim(edt_Pix_endToEndId.Text);
  LimparRespostas;
  CarregarConfig;
  edt_Pix_endToEndId.Text :=  end2id;
  RscPix2.PixEndToEndId(edt_Pix_endToEndId.Text);
end;

procedure TFrnMain.SolicitarDevolucaoPix;
var
  end2id: string;
  txiddev: string;
  valor: Double;
begin
  if Trim(edt_Pix_endToEndId.Text) = ''  then
    begin
      TDialogService.MessageDialog('Digite o campo endToEndId', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
      edt_Pix_endToEndId.SetFocus ;
      Exit;
    end;
  if Trim(edt_Pix_TxIdDev.Text) = ''  then
    begin
      TDialogService.MessageDialog('Digite o campo TxIdDev', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
      edt_Pix_TxIdDev.SetFocus ;
      Exit;
    end;
  if Trim(edt_cob_Pix_Pago.Text) = ''  then
    begin
      TDialogService.MessageDialog('Digite o campo Valor', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
      edt_cob_Pix_Pago.SetFocus ;
      Exit;
    end;

  end2id  :=  Trim(edt_Pix_endToEndId.Text);
  txiddev  :=  Trim(edt_Pix_TxIdDev.Text);
  valor  :=  StrToFloat(Trim(edt_cob_Pix_Pago.Text));
  LimparRespostas;
  CarregarConfig;
  edt_Pix_endToEndId.Text :=  end2id;
  edt_Pix_TxIdDev.Text :=  txiddev;
  edt_cob_Pix_Pago.Text :=  FloatToStr(valor);
  RscPix2.PixDevolucaoSolicitar(edt_Pix_endToEndId.Text, edt_Pix_TxIdDev.Text, StrToFloat(edt_cob_Pix_Pago.Text));
end;

procedure TFrnMain.ConsultarDevolucaoPix;
var
  end2id: string;
  txiddev: string;
begin
  if Trim(edt_Pix_endToEndId.Text) = ''  then
    begin
      TDialogService.MessageDialog('Digite o campo endToEndId', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
      edt_Pix_endToEndId.SetFocus ;
      Exit;
    end;
  if Trim(edt_Pix_TxIdDev.Text) = ''  then
    begin
      TDialogService.MessageDialog('Digite o campo TxIdDev', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
      edt_Pix_TxIdDev.SetFocus ;
      Exit;
    end;

  end2id  :=  Trim(edt_Pix_endToEndId.Text);
  txiddev  :=  Trim(edt_Pix_TxIdDev.Text);
  LimparRespostas;
  CarregarConfig;
  edt_Pix_endToEndId.Text :=  end2id;
  edt_Pix_TxIdDev.Text :=  txiddev;
  RscPix2.PixDevolucaoConsultar(edt_Pix_endToEndId.Text, edt_Pix_TxIdDev.Text);
end;

procedure TFrnMain.ConsultarListaLocations;
begin
  CarregarConfig;
  RscPix2.LocationListarCadastrados(
    StrToDateTime(DateToStr(dtp_LocData_Inicial.Date) + TimeToStr(dtp_LocHora_Inicial.Time)) ,
    StrToDateTime(DateToStr(dtp_LocData_Final.Date) + TimeToStr(dtp_LocHora_Final.Time)),
    chkbx_Loc_txIdPresente.IsChecked,
    TTipoCobranca(cbbx_LocTipoCob.ItemIndex),
    StrToIntDef(edt_PagLoc.Text, 0),
    StrToIntDef(edt_TotalItensPagLoc.Text, 100));
end;

procedure TFrnMain.ConsultarListaPixsRecebidos;
begin
  CarregarConfig;
  RscPix2.PixListar(
                      StrToDateTime(DateToStr(dtp_Data_Inicial.Date) + TimeToStr(dtp_Hora_Inicial.Time)),
                      StrToDateTime(DateToStr(dtp_Data_Final.Date) + TimeToStr(dtp_Hora_Final.Time)),
                      '', //txid
                      False, //txidpresente
                      False, //devolução presente
                      '', //cpf
                      '', //cnpj
                      StrToIntDef(edt_PagPixs.Text, 0), //pagindex
                      0
                    );
end;

procedure TFrnMain.ConsultarLocation;
begin
  CarregarConfig;
  RscPix2.LocationId(StrToIntDef(edt_loc_id.Text, 0));
end;

procedure TFrnMain.ConsultarLocationQrCode;
begin
  CarregarConfig;
  RscPix2.LocationIdToQrCode(StrToIntDef(edt_loc_id.Text, 0));
end;

procedure TFrnMain.CriarLocations;
begin
  CarregarConfig;
  RscPix2.LocationCriar(TTipoCobranca(cbbx_LocTipoCobCriar.ItemIndex));
end;

procedure TFrnMain.DeletarLocation;
begin
  CarregarConfig;
  RscPix2.LocationDesvincularTxId(StrToIntDef(edt_loc_id.Text, 0));
end;

procedure TFrnMain.WebHookListarcadastrados;
begin
  CarregarConfig;
  RscPix2.WebhookListarCadastrados(
    StrToDateTime(DateToStr(dtp_LocData_Inicial.Date) + TimeToStr(dtp_LocHora_Inicial.Time)) ,
    StrToDateTime(DateToStr(dtp_LocData_Final.Date) + TimeToStr(dtp_LocHora_Final.Time)),
    StrToIntDef(edt_PagLoc.Text, 0),
    StrToIntDef(edt_TotalItensPagLoc.Text, 100));
end;

procedure TFrnMain.WebHookConsultar;
begin
  CarregarConfig;
  RscPix2.WebhookConsultar;
end;

procedure TFrnMain.WebHookConfigurar;
begin
  CarregarConfig;
  RscPix2.WebhookConfigurar(Trim(edt_webhook_url.Text));
end;

procedure TFrnMain.WebHookDeletar;
begin
  CarregarConfig;
  RscPix2.WebhookDesvincular;
end;

procedure TFrnMain.CreateFieldsDataSet(vStringGrid: TStringGrid; vFields: AryFields = []);
var
  F: Integer;
begin
  //removendo colunas
  vStringGrid.ClearColumns;

  for F := 0 to Length(vFields) - 1 do
    begin
      // Definindo novas colunas
      vStringGrid.Model.InsertColumn(F, TColumn.Create(vStringGrid));
      // Definindo os títulos das colunas
      vStringGrid.Columns[F].Header := vFields[F];
    end;
end;

procedure TFrnMain.FormCreate(Sender: TObject);
var
  aTipoCob: TTipoCobranca;
  aPsp: TTipoPSP;
  aAmbiente : TTipoAmbiente;
  aTpChave : TTipoChavePIX;
begin
  FPath :=  ExtractFilePath(ParamStr(0));
  Self.Caption  :=  Application.Title;

  RscPix2 :=  TRscPix.Create(Self);

  RscPix2.OnToken :=  RscPix1Token;

  RscPix2.OnCobCancelar :=  RscPix1CobCancelar;
  RscPix2.OnCobTxId :=  RscPix1CobConsultar;
  RscPix2.OnCobCriar :=  RscPix1CobCriar;
  RscPix2.OnCobListar :=  RscPix1CobListar;


  RscPix2.OnPixGetEndToEndId :=  RscPix1PixGetEndToEndId;
  RscPix2.OnPixDevolucao :=  RscPix1PixDevolucao;
  RscPix2.OnPixListaRecebidos :=  RscPix1PixListaRecebidos;

  RscPix2.OnLocationCriar :=  RscPix1LocCriar;
  RscPix2.OnLocationListarCadastrados :=  RscPix1LocConsultarList;
  RscPix2.OnLocationId :=  RscPix1LocConsultarlocId;
  RscPix2.OnLocationIdtoQrCode :=  RscPix1LocConsultarlocIdQrCode;
  RscPix2.OnLocationDesvincularTxId :=  RscPix1LocDesvincularTxId;

  RscPix2.OnWebhookListar :=  RscPix1WebhookListar;
  RscPix2.OnWebhookGet :=  RscPix1WebhookGet;
  RscPix2.OnWebhookPut :=  RscPix1WebhookPut;
  RscPix2.OnWebhookDelete :=  RscPix1WebhookDelete;


  if  FileExists(FPath + 'TRscPix_200x200.png') then
    imgQRCODE.Bitmap.LoadFromFile(FPath + 'TRscPix_200x200.png')
  else
    begin
      imgQRCODE.Bitmap.SaveToFile(FPath + 'TRscPix_200x200.png');
    end;
  Self.Width  :=  1000;

  cbbx_LocTipoCob.Clear;
  for aTipoCob := Low(TTipoCobranca) to High(TTipoCobranca) do
    cbbx_LocTipoCob.Items.Add(GetEnumName(TypeInfo(TTipoCobranca), Ord(aTipoCob)));
  cbbx_LocTipoCob.ItemIndex  :=  0;

  cbbx_LocTipoCobCriar.Clear;
  for aTipoCob := Low(TTipoCobranca) to High(TTipoCobranca) do
    cbbx_LocTipoCobCriar.Items.Add(GetEnumName(TypeInfo(TTipoCobranca), Ord(aTipoCob)));
  cbbx_LocTipoCobCriar.ItemIndex  :=  0;

  cbbx_CongifTipoChave.Clear;
  for aTpChave := Low(TTipoChavePIX) to High(TTipoChavePIX) do
    cbbx_CongifTipoChave.Items.Add(GetEnumName(TypeInfo(TTipoChavePIX), Ord(aTpChave)));
  cbbx_CongifTipoChave.ItemIndex  :=  0;

  cbbx_PSP.Clear;
  for aPsp := Low(TTipoPSP) to High(TTipoPSP) do
    cbbx_PSP.Items.Add(GetEnumName(TypeInfo(TTipoPSP), Ord(aPsp)));

  cbbx_Ambiente.Clear;
  for aAmbiente := Low(TTipoAmbiente) to High(TTipoAmbiente) do
    cbbx_Ambiente.Items.Add(GetEnumName(TypeInfo(TTipoAmbiente), Ord(aAmbiente)));

  edt_ConfigCert.Text         :=  '';
  edt_ConfigCertKey.Text      :=  '';
  edt_ConfigClientID.Text     :=  '';
  edt_ConfigClientSecret.Text :=  '';
  edt_ConfigChave.Text        :=  '';
  edt_ConfigDuracao.Text      :=  '60';

  dtp_Data_Inicial.Date :=  Now - 4;
  dtp_Hora_Inicial.Time :=  StrToTime('00:00:00');;
  dtp_Data_Final.Date   :=  Now;
  dtp_Hora_Final.Time   :=  StrToTime('23:59:59');

  dtp_LocData_Inicial.Date :=  Now - 30;
  dtp_LocHora_Inicial.Time :=  StrToTime('00:00:00');;
  dtp_LocData_Final.Date   :=  Now;
  dtp_LocHora_Final.Time   :=  StrToTime('23:59:59');

  dtp_WebhookData_Inicial.Date :=  Now - 30;
  dtp_WebhookHora_Inicial.Time :=  StrToTime('00:00:00');;
  dtp_WebhookData_Final.Date   :=  Now;
  dtp_WebhookHora_Final.Time   :=  StrToTime('23:59:59');

  dtp_CobData_Inicial.Date :=  Now - 30;
  dtp_CobHora_Inicial.Time :=  StrToTime('00:00:00');;
  dtp_CobData_Final.Date   :=  Now;
  dtp_CobHora_Final.Time   :=  StrToTime('23:59:59');

  lblCompVersao.Text :=  'Versão Componente: ' + RscPix2.Versao  + '  ';

  tbc_Main.ActiveTab  :=  tbi_Configuracoes;

  CreateFieldsDataSet(strgrd_ListaPixRecebidos,
  ['nomePagador',
  'cpfcnpjpagador',
  'inforpagador',
  'endtoebdid',
  'txid',
  'valor',
  'DataHora']);

  CreateFieldsDataSet(strgrd_ListaLocations,
  ['id',
  'location',
  'tipoCob',
  'criacao',
  'txid']);

  CreateFieldsDataSet(strgrd_Listawebhooks,
  ['webhookUrl',
  'chave',
  'criacao']);

  CreateFieldsDataSet(strgrd_ListaCobs,
  [
  'txid',
  'chave',
  'valor.original',
  'status',
  'location',
  'revisao',
  'calendario.expiracao',
  'calendario.criacao',
  'pixCopiaECola',
  'loc.id',
  'loc.location',
  'loc.tipoCob',
  'loc.criacao',
  'recebedor.cnpj',
  'recebedor.nome',
  'recebedor.logradouro',
  'recebedor.cidade',
  'recebedor.uf',
  'recebedor.cep'
  ]);

  cbbx_Ambiente.ItemIndex  :=  0;
  cbbx_PSP.ItemIndex  :=  0;
end;


procedure TFrnMain.Image1Click(Sender: TObject);
begin
  try
    GravarIni;
    TDialogService.MessageDialog('Dados Gravados com Sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
  except on E: Exception do
    begin
      TDialogService.MessageDialog('Erro ao gravar Dados!', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end;
  end;
end;

procedure TFrnMain.Img_GitHubClick(Sender: TObject);
begin
  OpenFileOrURL('https://github.com/OpenSourceCommunityBrasil/TRscPix');
end;

procedure TFrnMain.Img_SiteClick(Sender: TObject);
begin
  OpenFileOrURL('https://trscpix.rscsistemas.com.br');
end;



end.
