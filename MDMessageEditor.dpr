program MDMessageEditor;

uses
  Forms,
  MDME in 'MDME.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MDME - MilkDrop Message Editor';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
