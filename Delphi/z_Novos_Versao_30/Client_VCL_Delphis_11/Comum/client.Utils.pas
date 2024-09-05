unit client.Utils;

interface
  uses
    ExtCtrls
    , Graphics
    , Types
    , DelphiZXingQRCode;



  procedure QRCodeWin(imgQRCode: TImage; texto: string);

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
    imgQRCode.Picture.Bitmap.Width := QRCode.Columns * PixelSize;
    imgQRCode.Picture.Bitmap.Height := QRCode.Rows * PixelSize;
    
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if QRCode.IsBlack[Row, Column] then
        begin
          // Pintar o bloco preto
          imgQRCode.Picture.Bitmap.Canvas.Brush.Color := clBlack;
        end
        else
        begin
          // Pintar o bloco branco
          imgQRCode.Picture.Bitmap.Canvas.Brush.Color := clWhite;
        end;

        // Desenhar o bloco
        imgQRCode.Picture.Bitmap.Canvas.FillRect(
          Rect(Column * PixelSize, Row * PixelSize,
               (Column + 1) * PixelSize, (Row + 1) * PixelSize));
      end;
    end;
  finally
    QRCode.Free;
  end;
end;


end.
