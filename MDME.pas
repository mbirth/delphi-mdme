unit MDME;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IniFiles, Registry, StdCtrls, ExtCtrls, Spin, Math;

type
  TForm1 = class(TForm)
    MainPageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Messages: TListBox;
    Fonts: TListBox;
    FontSelector: TListBox;
    Label1: TLabel;
    cbBold: TCheckBox;
    cbItal: TCheckBox;
    MessageExample: TLabel;
    GroupBox1: TGroupBox;
    SaveFont: TButton;
    DiscardFont: TButton;
    GroupBox2: TGroupBox;
    FColR: TTrackBar;
    FColG: TTrackBar;
    FColB: TTrackBar;
    FColorSample: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MessageText: TEdit;
    FontExample: TLabel;
    GroupBox3: TGroupBox;
    SaveMessage: TButton;
    DiscardMessage: TButton;
    Label18: TLabel;
    DelFont: TButton;
    DelMessage: TButton;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label2: TLabel;
    MFont: TListBox;
    cbFontOver: TCheckBox;
    MFontOver: TListBox;
    GroupBox4: TGroupBox;
    MColorSample: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label27: TLabel;
    MColR: TTrackBar;
    MColG: TTrackBar;
    MColB: TTrackBar;
    MVarR: TTrackBar;
    MVarG: TTrackBar;
    MVarB: TTrackBar;
    cbDefFont: TCheckBox;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    MFontSize: TTrackBar;
    cbBoldOverOn: TCheckBox;
    cbBoldOver: TCheckBox;
    cbItalOver: TCheckBox;
    cbItalOverOn: TCheckBox;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    MScreen: TImage;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    MPosX: TTrackBar;
    MPosY: TTrackBar;
    MRandX: TTrackBar;
    MRandY: TTrackBar;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    MTimeS: TSpinEdit;
    MTimeMS: TSpinEdit;
    MTimeFade: TTrackBar;
    TabSheet6: TTabSheet;
    Label33: TLabel;
    Label20: TLabel;
    MFontGrow: TTrackBar;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Button1: TButton;
    Label26: TLabel;
    Label35: TLabel;
    Memo1: TMemo;
    Label36: TLabel;
    GroupBox8: TGroupBox;
    Preview: TImage;
    PreviewButton: TButton;
    PreTimer: TTimer;
    AbortPreview: TButton;
    IniPath: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FontsClick(Sender: TObject);
    procedure FColRChange(Sender: TObject);
    procedure FColGChange(Sender: TObject);
    procedure FColBChange(Sender: TObject);
    procedure MessagesClick(Sender: TObject);
    procedure DiscardFontClick(Sender: TObject);
    procedure SaveFontClick(Sender: TObject);
    procedure cbBoldClick(Sender: TObject);
    procedure cbItalClick(Sender: TObject);
    procedure DiscardMessageClick(Sender: TObject);
    procedure SaveMessageClick(Sender: TObject);
    procedure MColRChange(Sender: TObject);
    procedure MColGChange(Sender: TObject);
    procedure MColBChange(Sender: TObject);
    procedure cbDefFontClick(Sender: TObject);
    procedure MFontSizeChange(Sender: TObject);
    procedure cbFontOverClick(Sender: TObject);
    procedure MessageTextChange(Sender: TObject);
    procedure MFontOverClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbBoldOverOnClick(Sender: TObject);
    procedure cbItalOverOnClick(Sender: TObject);
    procedure cbBoldOverClick(Sender: TObject);
    procedure cbItalOverClick(Sender: TObject);
    procedure MFontClick(Sender: TObject);
    procedure MTimeMSChange(Sender: TObject);
    procedure MPosYChange(Sender: TObject);
    procedure MPosXChange(Sender: TObject);
    procedure MRandXChange(Sender: TObject);
    procedure MRandYChange(Sender: TObject);
    procedure MScreenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DelFontClick(Sender: TObject);
    procedure DelMessageClick(Sender: TObject);
    procedure FontSelectorClick(Sender: TObject);
    procedure PreviewButtonClick(Sender: TObject);
    procedure PreTimerTimer(Sender: TObject);
    procedure AbortPreviewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  mf: TIniFile;
  ti,mxt,fti: integer; { For Preview: CurTime, MaxTime, FadeTime }
  nr,ng,nb: integer;  { For Preview: Random RGB }
  px,py,pfg,pfs: integer;     { For Preview: Random XY, FontGrowth, FontSize }
  ptxt: string;       { For Preview: Message }

function d2(x: integer): string;
var y: string;
begin
  Str(x:0,y);
  if x<10 then d2 := '0'+y else d2 := y;
end;

procedure ReadFromIni;
var i,ms,fs,mfs: integer;
    tmp: string;
begin
  ms := Form1.Messages.ItemIndex;
  fs := Form1.Fonts.ItemIndex;
  mfs := Form1.MFont.ItemIndex;
  Form1.Messages.Clear;
  Form1.Fonts.Clear;
  Form1.MFont.Clear;
  for i:=0 to 99 do begin
    if i<=15 then begin
      tmp := d2(i)+' (';
      if mf.ReadBool('font'+d2(i),'bold',false) then tmp := tmp + 'b' else tmp := tmp + '_';
      if mf.ReadBool('font'+d2(i),'ital',false) then tmp := tmp + 'i' else tmp := tmp + '_';
      tmp := tmp + ') '+mf.ReadString('font'+d2(i),'face','<not defined>');
      Form1.Fonts.Items.Add(tmp);
      Form1.MFont.Items.Add(tmp);
    end;
    Form1.Messages.Items.Add(d2(i)+' - '+mf.ReadString('message'+d2(i),'text','<empty>'));
  end;
  if ms<>-1 then Form1.Messages.Selected[ms] := true;
  if fs<>-1 then Form1.Fonts.Selected[fs] := true;
  if mfs<>-1 then Form1.MFont.Selected[mfs] := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
var rt: TRegistry;
    pa: string;
begin
  Randomize;
  DecimalSeparator := '.';
  rt := TRegistry.Create;
  rt.OpenKeyReadOnly('\Software\Winamp');
  pa := rt.ReadString('');
  if Length(pa)>0 then begin
    mf := TIniFile.Create(pa+'\Plugins\milk_msg.ini');
    IniPath.Caption := 'Path from Registry: '+mf.FileName;
  end else begin
    mf := TIniFile.Create('C:\Program Files\Winamp\Plugins\milk_msg.ini');
    IniPath.Caption := 'Default path: '+mf.FileName;
  end;
  ReadFromIni;
  FontSelector.Items := Screen.Fonts;
  MFontOver.Items := Screen.Fonts;
  with MScreen.Canvas do begin
    Brush.Style := bsSolid;
    Brush.Color := clBlack;
    FillRect(Rect(1,1,160,120));
  end;
  with Preview.Canvas do begin
    Brush.Style := bsSolid;
    Brush.Color := clBlack;
    Pen.Color := clRed;
    Pen.Style := psSolid;
    FillRect(Rect(1,1,160,120));
    MoveTo(1,1);
    LineTo(160,120);
    MoveTo(1,120);
    LineTo(160,1);
  end;
  Fonts.Selected[0] := true;
  Messages.Selected[0] := true;
  FontsClick(Sender);
  MessagesClick(Sender);
end;

procedure DoFontExample;
var at: TFontStyles;
begin
  at := [];
  Form1.FontExample.Font.Name := Form1.FontSelector.Items.Strings[Form1.FontSelector.ItemIndex];
  if Form1.cbBold.Checked then at := at + [fsBold];
  if Form1.cbItal.Checked then at := at + [fsItalic];
  Form1.FontExample.Font.Color := rgb(Form1.FColR.Position,Form1.FColG.Position,Form1.FColB.Position);
  Form1.FontExample.Font.Style := at;
end;

procedure DoMessagePosition;
var dx,dy,w,h,vx,vy: integer;
begin
  with Form1.MScreen.Canvas do begin
    Brush.Style := bsSolid;
    Brush.Color := clWhite;
    FillRect(Rect(0,0,161,121));
    Brush.Color := clBlack;
    FillRect(Rect(1,1,160,120));
    Pen.Color := clYellow;
    Font.Name := Form1.MessageExample.Font.Name;
    Font.Style := Form1.MessageExample.Font.Style;
    Font.Color := Form1.MessageExample.Font.Color;
    Font.Size := Round(Form1.MessageExample.Font.Size / 6);
    if Font.Size=0 then Font.Size := 1;
    TextFlags := ETO_OPAQUE;
    dx := Round(Form1.MPosX.Position * 160 / 10000);
    dy := Round(Form1.MPosY.Position * 120 / 10000);
    vx := Round(Form1.MRandX.Position * 160 / 10000);
    vy := Round(Form1.MRandY.Position * 120 / 10000);
    w := TextWidth(Form1.MessageExample.Caption);
    h := TextHeight(Form1.MessageExample.Caption);
    Rectangle(Round(dx-w/2-vx),Round(dy-h/2-vy),Round(dx+w/2+vx),Round(dy+h/2+vy));
    Brush.Style := bsClear;
    TextOut(Round(dx-w/2),Round(dy-h/2),Form1.MessageExample.Caption);
  end;
end;

procedure DoMessageExample;
var at: TFontStyles;
    fcap: string;
begin
  fcap := 'font'+d2(Form1.MFont.ItemIndex);
  Form1.MessageExample.Caption := Form1.MessageText.Text;
  at := [];
  if Form1.MFontSize.Position>0 then Form1.MessageExample.Font.Size := Form1.MFontSize.Position else Form1.MessageExample.Font.Size := 1;
  if Form1.cbFontOver.Checked then begin
    Form1.MessageExample.Font.Name := Form1.MFontOver.Items.Strings[Form1.MFontOver.ItemIndex];
  end else begin
    Form1.MessageExample.Font.Name := mf.ReadString(fcap,'face','Arial');
  end;
  if Form1.cbBoldOverOn.Checked then begin
    if Form1.cbBoldOver.Checked then at := at + [fsBold];
  end else begin
    if mf.ReadBool(fcap,'bold',false) then at := at + [fsBold];
  end;
  if Form1.cbItalOverOn.Checked then begin
    if Form1.cbItalOver.Checked then at := at + [fsItalic];
  end else begin
    if mf.ReadBool(fcap,'ital',false) then at := at + [fsItalic];
  end;
  if Form1.cbDefFont.Checked then begin
    Form1.MessageExample.Font.Color := rgb(Form1.MColR.Position,Form1.MColG.Position,Form1.MColB.Position);
  end else begin
    Form1.MessageExample.Font.Color := rgb(mf.ReadInteger(fcap,'r',255),mf.ReadInteger(fcap,'g',255),mf.ReadInteger(fcap,'b',255));
  end;
  Form1.MessageExample.Font.Style := at;
  DoMessagePosition;
end;

procedure TForm1.FontsClick(Sender: TObject);
var st,cap: string;
begin
  st := Fonts.Items.Strings[Fonts.ItemIndex];
  cap := 'font'+Copy(st,0,2);
  FontSelector.Selected[FontSelector.Items.IndexOf(mf.ReadString(cap,'face','Arial'))] := true;
  cbBold.Checked := mf.ReadBool(cap,'bold',false);
  cbItal.Checked := mf.ReadBool(cap,'ital',false);
  FColR.Position := mf.ReadInteger(cap,'r',255);
  FColG.Position := mf.ReadInteger(cap,'g',255);
  FColB.Position := mf.ReadInteger(cap,'b',255);
  DoFontExample;
end;

procedure TForm1.FColRChange(Sender: TObject);
begin
  FColorSample.Color := RGB(FColR.Position,FColG.Position,FColB.Position);
  DoFontExample;
end;

procedure TForm1.FColGChange(Sender: TObject);
begin
  FColorSample.Color := RGB(FColR.Position,FColG.Position,FColB.Position);
  DoFontExample;
end;

procedure TForm1.FColBChange(Sender: TObject);
begin
  FColorSample.Color := RGB(FColR.Position,FColG.Position,FColB.Position);
  DoFontExample;
end;

procedure TForm1.MessagesClick(Sender: TObject);
var st,cap,fcap: string;
begin
  st := Messages.Items.Strings[Messages.ItemIndex];
  cap := 'message'+Copy(st,0,2);
  fcap := 'font'+d2(mf.ReadInteger(cap,'font',0));
  MFont.Selected[mf.ReadInteger(cap,'font',0)] := true;
  if mf.ValueExists(cap,'face') then begin
    MFontOver.Enabled := true;
    MFontOver.Selected[MFontOver.Items.IndexOf(mf.ReadString(cap,'face','Arial'))] := true;
    cbFontOver.Checked := true;
  end else begin
    cbFontOver.Checked := false;
    MFontOver.Enabled := false;
    MFontOver.ClearSelection;
  end;
  if mf.ValueExists(cap,'bold') then begin
    cbBoldOverOn.Checked := true;
    cbBoldOver.Checked := mf.ReadBool(cap,'bold',false);
  end else begin
    cbBoldOverOn.Checked := false;
    cbBoldOver.Checked := false;
  end;
  if mf.ValueExists(cap,'ital') then begin
    cbItalOverOn.Checked := true;
    cbItalOver.Checked := mf.ReadBool(cap,'ital',false);
  end else begin
    cbItalOverOn.Checked := false;
    cbItalOver.Checked := false;
  end;
  MFontSize.Position := mf.ReadInteger(cap,'size',0);
  MessageText.Text := mf.ReadString(cap,'text','');
  cbDefFont.Checked := true;
  if mf.ReadInteger(cap,'r',-1)=-1 then cbDefFont.Checked := false;
  if mf.ReadInteger(cap,'g',-1)=-1 then cbDefFont.Checked := false;
  if mf.ReadInteger(cap,'b',-1)=-1 then cbDefFont.Checked := false;
  cbDefFontClick(Sender);
  if NOT cbDefFont.Checked then begin
    MColR.Position := mf.ReadInteger(fcap,'r',255);
    MColG.Position := mf.ReadInteger(fcap,'g',255);
    MColB.Position := mf.ReadInteger(fcap,'b',255);
  end else begin
    MColR.Position := mf.ReadInteger(cap,'r',255);
    MColG.Position := mf.ReadInteger(cap,'g',255);
    MColB.Position := mf.ReadInteger(cap,'b',255);
  end;
  MVarR.Position := mf.ReadInteger(cap,'randr',0);
  MVarG.Position := mf.ReadInteger(cap,'randg',0);
  MVarB.Position := mf.ReadInteger(cap,'randb',0);
  MFontGrow.Position := Round(mf.ReadFloat(cap,'growth',1)*100);
  MTimeS.Value := Floor(mf.ReadFloat(cap,'time',1));
  MTimeMS.Value := Floor(Frac(mf.ReadFloat(cap,'time',1))*1000);
  MTimeFade.Position := Round(mf.ReadFloat(cap,'fade',0.3)*10000);
  MPosX.Position := Round(mf.ReadFloat(cap,'x',0.5)*10000);
  MPosY.Position := Round(mf.ReadFloat(cap,'y',0.5)*10000);
  MRandX.Position := Round(mf.ReadFloat(cap,'randx',0)*10000);
  MRandY.Position := Round(mf.ReadFloat(cap,'randy',0)*10000);
  DoMessageExample;
end;

procedure TForm1.DiscardFontClick(Sender: TObject);
begin
  FontsClick(Sender);
end;

procedure TForm1.SaveFontClick(Sender: TObject);
var st,cap: string;
begin
  st := Fonts.Items.Strings[Fonts.ItemIndex];
  cap := 'font'+Copy(st,0,2);
  mf.EraseSection(cap);
  mf.WriteString(cap,'face',FontSelector.Items.Strings[FontSelector.ItemIndex]);
  mf.WriteBool(cap,'bold',cbBold.Checked);
  mf.WriteBool(cap,'ital',cbItal.Checked);
  if (FColR.Position<>255) OR (FColG.Position<>255) OR (FColB.Position<>255) then begin
    mf.WriteInteger(cap,'r',FColR.Position);
    mf.WriteInteger(cap,'g',FColG.Position);
    mf.WriteInteger(cap,'b',FColB.Position);
  end;
  ReadFromIni;
end;

procedure TForm1.cbBoldClick(Sender: TObject);
begin
  DoFontExample;
end;

procedure TForm1.cbItalClick(Sender: TObject);
begin
  DoFontExample;
end;

procedure TForm1.DiscardMessageClick(Sender: TObject);
begin
  MessagesClick(Sender);
end;

procedure TForm1.SaveMessageClick(Sender: TObject);
var st,cap: string;
begin
  st := Messages.Items.Strings[Messages.ItemIndex];
  cap := 'message'+Copy(st,0,2);
  mf.EraseSection(cap);
  mf.WriteString(cap,'text',MessageText.Text);
  mf.WriteInteger(cap,'font',MFont.ItemIndex);
  mf.WriteInteger(cap,'size',MFontSize.Position);
  if MFontGrow.Position<>100 then mf.WriteFloat(cap,'growth',MFontGrow.Position / 100);
  mf.WriteFloat(cap,'x',MPosX.Position / 10000);
  mf.WriteFloat(cap,'y',MPosY.Position / 10000);
  if MRandX.Position<>0 then mf.WriteFloat(cap,'randx',MRandX.Position / 10000);
  if MRandY.Position<>0 then mf.WriteFloat(cap,'randy',MRandY.Position / 10000);
  mf.WriteFloat(cap,'time',MTimeS.Value + MTimeMS.Value/1000);
  if MTimeFade.Position<>0 then mf.WriteFloat(cap,'fade',MTimeFade.Position / 10000);
  if cbFontOver.Checked then mf.WriteString(cap,'face',MFontOver.Items.Strings[MFontOver.ItemIndex]);
  if cbItalOverOn.Checked then mf.WriteBool(cap,'ital',cbItalOver.Checked);
  if cbBoldOverOn.Checked then mf.WriteBool(cap,'bold',cbBoldOver.Checked);
  if cbDefFont.Checked then begin
    mf.WriteInteger(cap,'r',MColR.Position);
    mf.WriteInteger(cap,'g',MColG.Position);
    mf.WriteInteger(cap,'b',MColB.Position);
  end;
  if (MVarR.Position<>0) OR (MVarG.Position<>0) OR (MVarB.Position<>0) then begin
    mf.WriteInteger(cap,'randr',MVarR.Position);
    mf.WriteInteger(cap,'randg',MVarG.Position);
    mf.WriteInteger(cap,'randb',MVarB.Position);
  end;
  ReadFromIni;
end;

procedure TForm1.MColRChange(Sender: TObject);
begin
  MColorSample.Color := rgb(MColR.Position,MColG.Position,MColB.Position);
  DoMessageExample;
end;

procedure TForm1.MColGChange(Sender: TObject);
begin
  MColorSample.Color := rgb(MColR.Position,MColG.Position,MColB.Position);
  DoMessageExample;
end;

procedure TForm1.MColBChange(Sender: TObject);
begin
  MColorSample.Color := rgb(MColR.Position,MColG.Position,MColB.Position);
  DoMessageExample;
end;

procedure TForm1.cbDefFontClick(Sender: TObject);
begin
  if cbDefFont.Checked then begin
    MColR.Enabled := true;
    MColG.Enabled := true;
    MColB.Enabled := true;
  end else begin
    MColR.Enabled := false;
    MColG.Enabled := false;
    MColB.Enabled := false;
  end;
  DoMessageExample;
end;

procedure TForm1.MFontSizeChange(Sender: TObject);
begin
  DoMessageExample;
end;

procedure TForm1.cbFontOverClick(Sender: TObject);
begin
  if cbFontOver.Checked then begin
    MFontOver.Enabled := true;
  end else begin
    MFontOver.Enabled := false;
  end;
  if MFontOver.ItemIndex=-1 then MFontOver.Selected[0] := true;
  DoMessageExample;
end;

procedure TForm1.MessageTextChange(Sender: TObject);
begin
  DoMessageExample;
end;

procedure TForm1.MFontOverClick(Sender: TObject);
begin
  DoMessageExample;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MFontGrow.Position := 100;
end;

procedure TForm1.cbBoldOverOnClick(Sender: TObject);
begin
  if cbBoldOverOn.Checked then begin
    cbBoldOver.Enabled := true;
  end else begin
    cbBoldOver.Enabled := false;
  end;
  DoMessageExample;
end;

procedure TForm1.cbItalOverOnClick(Sender: TObject);
begin
  if cbItalOverOn.Checked then begin
    cbItalOver.Enabled := true;
  end else begin
    cbItalOver.Enabled := false;
  end;
  DoMessageExample;
end;

procedure TForm1.cbBoldOverClick(Sender: TObject);
begin
  DoMessageExample;
end;

procedure TForm1.cbItalOverClick(Sender: TObject);
begin
  DoMessageExample;
end;

procedure TForm1.MFontClick(Sender: TObject);
begin
  DoMessageExample;
end;

procedure TForm1.MTimeMSChange(Sender: TObject);
begin
  if MTimeMS.Value < 0 then begin
    if MTimeS.Value>0 then begin
      MTimeS.Value := MTimeS.Value - 1;
      MTimeMS.Value := 1000 - MTimeMS.Value;
    end else MTimeMS.Value := 0;
  end;
  if MTimeMS.Value > 999 then begin
    if MTimeS.Value<999 then begin
      MTimeS.Value := MTimeS.Value + 1;
      MTimeMS.Value := 1000 - MTimeMS.Value;
    end else MTimeMS.Value := 999;
  end;
end;

procedure TForm1.MPosYChange(Sender: TObject);
begin
  DoMessagePosition;
end;

procedure TForm1.MPosXChange(Sender: TObject);
begin
  DoMessagePosition;
end;

procedure TForm1.MRandXChange(Sender: TObject);
begin
  DoMessagePosition;
end;

procedure TForm1.MRandYChange(Sender: TObject);
begin
  DoMessagePosition;
end;

procedure TForm1.MScreenMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MPosX.Position := Round(x*10000/160);
  MPosY.Position := Round(y*10000/120);
end;

procedure TForm1.DelFontClick(Sender: TObject);
var st,cap: string;
begin
  st := Fonts.Items.Strings[Fonts.ItemIndex];
  cap := 'font'+Copy(st,0,2);
  mf.EraseSection(cap);
  ReadFromIni;
end;

procedure TForm1.DelMessageClick(Sender: TObject);
var st,cap: string;
begin
  st := Messages.Items.Strings[Messages.ItemIndex];
  cap := 'message'+Copy(st,0,2);
  mf.EraseSection(cap);
  ReadFromIni;
end;

procedure TForm1.FontSelectorClick(Sender: TObject);
begin
  DoFontExample;
end;

procedure TForm1.PreviewButtonClick(Sender: TObject);
var dx,dy,vx,vy: integer;
begin
  PreviewButton.Enabled := false;
  ti := 0;
  mxt := MTimeS.Value*1000+MTimeMS.Value;
  fti := Round(MTimeFade.Position*mxt/10000);
  nr := MColR.Position + (Random(2*MVarR.Position)-MVarR.Position);
  ng := MColG.Position + (Random(2*MVarG.Position)-MVarG.Position);
  nb := MColB.Position + (Random(2*MVarB.Position)-MVarB.Position);
  if nr<0 then nr := 0; if nr>255 then nr := 255;
  if ng<0 then ng := 0; if ng>255 then ng := 255;
  if nb<0 then nb := 0; if nb>255 then nb := 255;
  dx := Round(MPosX.Position * 160 / 10000);
  dy := Round(MPosY.Position * 120 / 10000);
  vx := Round(MRandX.Position * 160 / 10000);
  vy := Round(MRandY.Position * 120 / 10000);
  vx := Random(2*vx)-vx;
  vy := Random(2*vy)-vy;
  px := dx+vx;
  py := dy+vy;
  pfg := MFontGrow.Position;
  pfs := MFontSize.Position;
  ptxt := MessageExample.Caption;
  with Preview.Canvas do begin
    Font.Style := MessageExample.Font.Style;
    Pen.Color := clRed;
    Pen.Style := psSolid;
    Font.Name := MessageExample.Font.Name;
    Brush.Style := bsSolid;
    Brush.Color := clWhite;
    FillRect(Rect(0,0,161,121));
    Brush.Color := clBlack;
    FillRect(Rect(1,1,160,120));
  end;
  PreTimer.Enabled := true;
  AbortPreview.Enabled := true;
end;

procedure TForm1.PreTimerTimer(Sender: TObject);
var nsize: double;
var w,h: integer;
begin
  nsize := 1 + ti*(pfg-100)/(100*mxt);
  with Preview.Canvas do begin
    if ti<=fti then Font.Color := rgb(Round(ti*nr/fti),Round(ti*ng/fti),Round(ti*nb/fti)) else Font.Color := rgb(nr,ng,nb);
    Font.Size := Round(pfs*nsize/6);
    if Font.Size=0 then Font.Size := 1;
    w := TextWidth(ptxt);
    h := TextHeight(ptxt);
    FillRect(Rect(1,1,160,120));
    TextOut(Round(px-w/2),Round(py-h/2),ptxt);
  end;
  Inc(ti,50);
  if ti>mxt then begin
    AbortPreview.Enabled := false;
    PreTimer.Enabled := false;
    with Preview.Canvas do begin
      Brush.Style := bsSolid;
      Brush.Color := clWhite;
      FillRect(Rect(0,0,161,121));
      Brush.Color := clBlack;
      FillRect(Rect(1,1,160,120));
      Pen.Color := clRed;
      Pen.Style := psSolid;
      MoveTo(1,1);
      LineTo(160,120);
      MoveTo(1,120);
      LineTo(160,1);
    end;
    PreviewButton.Enabled := true;
  end;
end;

procedure TForm1.AbortPreviewClick(Sender: TObject);
begin
  AbortPreview.Enabled := false;
  PreTimer.Enabled := false;
  with Preview.Canvas do begin
    Brush.Style := bsSolid;
    Brush.Color := clWhite;
    FillRect(Rect(0,0,161,121));
    Brush.Color := clBlack;
    FillRect(Rect(1,1,160,120));
    Pen.Color := clRed;
    Pen.Style := psSolid;
    MoveTo(1,1);
    LineTo(160,120);
    MoveTo(1,120);
    LineTo(160,1);
  end;
  PreviewButton.Enabled := true;
end;

end.
