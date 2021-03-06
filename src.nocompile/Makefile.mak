
ifeq "$(BuildConfiguration)" ""
BuildConfiguration:=Debug
endif

SLN:= rsqlserver.net.sln
RSQLSERVER_BINDIR:=./rsqlserver.net/bin/$(BuildConfiguration)
INSTDIR:= ../inst
RSQLSERVER_BINs:= $(RSQLSERVER_BINDIR)/*.dll $(RSQLSERVER_BINDIR)/*.pdb
MSB := C:/WINDOWS/Microsoft.NET/Framework/v4.0.30319/MSBuild.exe
MODE:=Build
SLNPROPERTIES:=/p:Configuration=$(BuildConfiguration)

all: instdir SQLSERVER_RLib 

RSQLSERVER_LibComp:
	$(MSB) $(SLN) /t:$(MODE) $(SLNPROPERTIES)

SQLSERVER_RLib: RSQLSERVER_LibComp
	-cp -u -p $(RSQLSERVER_BINs) $(INSTDIR)/libs

instdir:
	-@rm -rf $(INSTDIR)/libs
	# the following two lines are required, even if empty folder, 
  # otherwise R complains at package load time.
	-@mkdir -p $(INSTDIR)/libs/i386
	-@mkdir -p $(INSTDIR)/libs/x64
	-@mkdir -p $(INSTDIR)/libs 2>/dev/null

.PHONY: all

