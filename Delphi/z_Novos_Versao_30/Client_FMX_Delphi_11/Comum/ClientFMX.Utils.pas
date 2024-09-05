unit ClientFMX.Utils;

interface

uses
  FMX.Objects
  , System.UITypes
  , System.Types
  , System.DateUtils
  , System.SysUtils

  , FMX.Graphics
  , DelphiZXingQRCode

  ;

  procedure QRCodeWin(imgQRCode: TImage; texto: string);

  function ISO8601ToDateTime(const ISO8601String: string): TDateTime;

implementation

procedure QRCodeWin(imgQRCode: TImage; texto: string);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  PixelSize: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := texto;
    QRCode.Encoding := qrUTF8BOM;
    QRCode.QuietZone := 4;

    PixelSize := 6; // Defina o tamanho do pixel conforme necessário

    // Configurar o tamanho da imagem
    imgQRCode.Bitmap.Width := QRCode.Columns * PixelSize;
    imgQRCode.Bitmap.Height := QRCode.Rows * PixelSize;

    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if QRCode.IsBlack[Row, Column] then
        begin
          // Pintar o bloco preto
          imgQRCode.Bitmap.Canvas.Fill.Kind :=  TBrushKind.Solid;
          imgQRCode.Bitmap.Canvas.Fill.Color := TAlphaColors.Black;
        end
        else
        begin
          // Pintar o bloco branco
          imgQRCode.Bitmap.Canvas.Fill.Kind :=  TBrushKind.Solid;
          imgQRCode.Bitmap.Canvas.Fill.Color := TAlphaColors.White;
        end;

        // Desenhar o bloco
        imgQRCode.Bitmap.Canvas.BeginScene;
        try
          imgQRCode.Bitmap.Canvas.FillRect(RectF(Column * PixelSize, Row * PixelSize, (Column + 1) * PixelSize, (Row + 1) * PixelSize), 1);
        finally
          imgQRCode.Bitmap.Canvas.EndScene
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
end;

function ISO8601ToDateTime(const ISO8601String: string): TDateTime;
var
  Year, Month, Day, Hour, Minute, Second, MilliSecond: Word;
  DatePart, TimePart, TimeZonePart: string;
  TimeZoneHour, TimeZoneMinute: Integer;
  TimeZoneOffset: TDateTime;
begin
  // Extrai a data e a hora da string ISO 8601
  DatePart := Copy(ISO8601String, 1, 10);
  TimePart := Copy(ISO8601String, 12, 8);

  // Extrai os componentes da data
  Year := StrToInt(Copy(DatePart, 1, 4));
  Month := StrToInt(Copy(DatePart, 6, 2));
  Day := StrToInt(Copy(DatePart, 9, 2));

  // Extrai os componentes do tempo
  Hour := StrToInt(Copy(TimePart, 1, 2));
  Minute := StrToInt(Copy(TimePart, 4, 2));
  Second := StrToInt(Copy(TimePart, 7, 2));

  // Extrai milissegundos, se disponíveis
  MilliSecond := 0;
  if Length(ISO8601String) > 19 then
    MilliSecond := StrToInt(Copy(ISO8601String, 21, 2));

  // Cria o valor TDateTime
  Result := EncodeDateTime(Year, Month, Day, Hour, Minute, Second, MilliSecond);

  // Extrai e aplica o fuso horário
  if Length(ISO8601String) > 25 then
  begin
    TimeZonePart := Copy(ISO8601String, 23, 6);
    TimeZoneHour := StrToInt(Copy(TimeZonePart, 2, 2));
    TimeZoneMinute := StrToInt(Copy(TimeZonePart, 5, 2));
    TimeZoneOffset := EncodeTime(TimeZoneHour, TimeZoneMinute, 0, 0);
    if TimeZonePart[1] = '-' then
      Result := Result - TimeZoneOffset
    else if TimeZonePart[1] = '+' then
      Result := Result + TimeZoneOffset;
  end;
end;

end.
