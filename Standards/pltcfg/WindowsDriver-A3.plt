;----------------------------------------------------------------------
;
;  System printer configuration file
;  Use on Windows to print to system printer
;
;  Current Revision:
;  $RCSfile: pdf.plt,v $
;  $Revision: 7.13.2.1 $  $Date: 2012/08/08 14:13:53 $
;
;----------------------------------------------------------------------

;======================================================================
;
;   >>>>> WARNING  WARNING  WARNING  WARNING  WARNING  WARNING  <<<<<
;  
;  Plotter driver configuration files are now stored in two directories:
;
;    $(_USTN_WORKSPACEROOT)/System/plotdrv/
;    $(_USTN_WORKSPACEROOT)/Standards/plotdrv/
;
;  System/plotdrv/ should be reserved for .plt files delivered by
;  MicroStation and other Bentley products. Standards/plotdrv/ is
;  provided as a place for you to store customized .plt files. To
;  simplify plotter selection from the Plot dialog, you may also
;  elect to store frequently-used .plt files in Standards/plotdrv/
;  even if you do not customize them.
;
;  To minimize the risk of losing your changes during a product
;  reinstallation, do not edit the files in the System/plotdrv/
;  directory. Instead, copy the necessary files to Standards/plotdrv/
;  and edit them there. If the .plt file depends on other files, such
;  as PostScript prolog (*.pro) files, copy them to the same directory.
;
;======================================================================

;   You may produce non-halftoned monochrome output on a color
;   device by setting "num_pens=1".
;
;   When thin vector elements with highly saturated colors are half-toned,
;   they can be extraordinarily difficult to see.  You may wish to
;   assign such element colors to a specific pen.  That pen can in turn
;   be assigned an RGB value of your choice.
;
;   For example, to change element color 5 from a hard to see, highly
;   saturated white to an easier to see gray you could use the following
;   line:
;           pen(6)=(5)/rgb=(230, 230, 230)  ; gray
;
;num_pens   = 1                             ; required record
num_pens   = 255                           ; required record
model      = mdl

stroke_tolerance=10                         ; unitless num 0 < tol < 10

rotate=none
autocenter

; Remove this record if no border is desired.
; Refer to the documentation for available border qualifiers.
; border /filename /time /text_height=0.35


; METRIC resolution and SIZE records
;size=(1189,841)/num=0/off=(0,0)/name="ISO A0"
;size=(594,420)/num=0/off=(0,0)/name="ISO A2"
;size=(420,297)/num=0/off=(0,0)/name="ISO A3"
;size=(297,210)/num=0/off=(0,0)/name="ISO A4"
;size=(1000,707)/num=0/off=(18.5,5.0)/name="ISO B1"
;size=(841,594)/num=0/off=(0,0)/name="ISO A1"
;resolution(MM)=(0.04233333333333333333333,0.04233333333333333333333); 600DPI

;  The style records defines how the design file line codes (styles)
;  are to be plotted.  By default, values are in plotter units (resolutions).
;  Values determine pen down/up movements, where (14,42) for a dot
;  pattern leaves the pen down for 14 units and up for 42 units.  The
;  /nohardware switch causes software stroking with these values.
;  Valid units are MM, IN, or DOTS (the default)
;
;  If you are using Windows 95/3.x you will want to change 'hardware' to 
;  'nohardware' in the linestyle definitions below. Otherwise it will result
;  in the inability to plot lines that have both weight and style.  This is
;  due to a limitation in the Graphics Device Interface of Windows 95/3.x.
;  Note that making this change can result in less-compact printer output
;  from MicroStation.
;
style(1) = ( 0.35, 1.05)                            /nohardware/units=MM ; style = dot
style(2) = ( 1.75, 1.05)                            /nohardware/units=MM ; style = med dash
style(3) = ( 4.20, 1.40)                            /nohardware/units=MM ; style = long dash
style(4) = ( 2.80, 1.05, 0.70, 1.05)                /nohardware/units=MM ; style = dot-dash
style(5) = ( 1.05, 0.70)                            /nohardware/units=MM ; style = short dash
style(6) = ( 2.10, 0.70, 0.70, 0.70, 0.70, 0.70)    /nohardware/units=MM ; style = dash-dot-dot
style(7) = ( 2.80, 0.70, 1.40, 0.70)                /nohardware/units=MM ; style = long dash - short dash

;
; linecap, linejoin and miter_limit
; Note: these settings do not have an effect in Win95/3.x 
;       due to a limitation in the Graphics Device Interface
;
linecap     = 1                 ; 1=butt, 2=square, 4=round
linejoin    = 5                 ; 2=miter/bevel, 4=round, 5=beveled
miter_limit = 1.415     ; Larger values allow longer spikes w/linejoin=2

; Specify the mapping of MicroStation line weights to line thickness on paper.
; Units are MM, IN, or DOTS (the default)
weight_strokes(mm)=(0.04, 0.05, 0.075, 0.1, 0.125, 0.175, 0.2, 0.225,  \
                    1.00, 1.25, 1.50, 1.75, 2.00, \  
                    2.25, 2.50, 2.75, 3.00, 3.25, 3.50, 3.75, 4.00, \
                    4.25, 4.50, 4.75, 5.00, 5.25, 5.50, 5.75, 6.00, \
                    6.25, 6.50, 6.75, 7.00, 7.25, 7.50, 7.75, 8.00)


; Remove this if no border is desired
; available qualifiers 
;       /pen=n              specifies pen to use to draw border
;       /time               adds time and date to border
;       /filename           adds name of design file to border
;       /text_height=n      units are cm
;       /width=n            units are cm
;       /font="fontname"    e.g. "Arial"    
;                           font names can be found by looking at 
;                           StartMenu => Settings => ControlPanel => Fonts.
;                           Note: a truetype font, like Arial, will scale 
;                           better than a bitmap font like MS Sans Serif
;border /pen=1 /filename /time /text_height=0.25                                                      

; Remove this if no fence outline is desired
fence_outline/pen=1

; specifies Resolution on Mac and Units on Mac and OS/2
;resolution(IN)=(0.0,0.0)
;resolution(mm)=(25.4,25.4)

; Substitute the name of a pentable file to be loaded when this driver is selected
;pentable=\dir\file.tbl
pentable=$(_BHP_INCLUDEPATH)plotdriver\BHPBIO_PDF.tbl


; *** For Windows Platform Only ***
; Uncomment this line to designate a specific system printer, form, orientation,
; and offset.  These options can be used alone or in combination.
;
; format is:
;               sysprinter  /name="printer-name" 
;                           /form=f
;                           /orientation=o
;                           /offset=(h,v)
;
;   /name
;           Notes on specifying the printer name: To obtain a valid printer name, first open
;           the StartMenu => Settings => Printers folder. Next to the icon for each printer is
;           the printer name. The name will take one of two forms: 1) A local printer name
;           like "HP LaserJet 4 Plus", or 2) a network printer name like "hp755cm on printserver"
;           which specifies a network computer and a printer share name.
;
;           For case 1, the printer name used, in the sysprinter line below, is just the local
;           name exactly as seen in the Printers folder. e.g. /name="HP LaserJet 4 Plus".
;
;           For case 2, the printer name used, in the sysprinter line below, is specified as
;           \\computer\share. e.g. /name="\\printserver\hp755cm"
;
;           If the printer is shared on the network by the machine MicroStation is running on,
;           then the printer name shown (in the Printers folder) will be a type 1 (local) name.
;           In this case, you may specify either format. The computer name needed for the type 2
;           format can be found by looking at StartMenu => Settings => ControlPanel => Network.
;
;           If the printer name contains spaces or '/', it should be enclosed in "" or ''.
;           e.g. /name="HP LaserJet 4 Plus"
;
;           The /name qualifier is optional.  If omitted, the Windows default printer will be used. 
;
;   /form
;           This value can be any valid form name for that printer, e.g. letter, legal, etc.
;           The list of all standard form names is contained in MicroStation documentation.
;           In addition, each printer manufacturer may provide a list of form names which 
;           are valid for their particular printer. These names may also be used for that printer.
;           
;           The easiest way to determine valid form names is to open the Print Setup dialog
;           from MicroStation (or other application) pick the appropriate printer/plotter 
;           and look in the Paper Size list box to see the valid names.
;           
;           Note: Some manufacturers have used form names which contain characters outside
;           the normal ASCII printable range. Example: for a form name like 8 1/2 x 11,  
;           instead of specifying 3 characters 1, /, and 2, they have put in the code for a 
;           special one-half symbol which only takes up one character position.
;           To handle this case, the user can enter "ANSI 8?x11" and MicroStation will match 
;           the actual name. 
;           
;           If the form name contains spaces or '/', it should be enclosed in "" or ''.
;           If the form name contains " to indicate inches, the single quote pair should
;           be used,  e.g. /form='letter 8 1/2" x 11"'
;
;           The /form qualifier is optional.  If omitted, the Windows default setting for the 
;           named printer will be used. 
;
;   /orientation
;           This value is either portrait or landscape.  The /orientation qualifier is optional.
;           If omitted, the Windows default setting for the named printer will be used. 
;
;   /offset 
;           leave horizontal and vertical space for the border text - a setting of (0.00, 0.25) 
;           will leave a 1/4 inch space at the bottom of the plot so border text may be drawn; 
;           Units are inches if your measurement systems is set to US. Units are MM if your 
;           measurement systems is set to Metric. Measurement setting can be found by looking at 
;           StartMenu => Settings => ControlPanel => Regional Settings.
;           The /offset qualifier is optional.  If omitted, no space will be left.
;
sysprinter /form=A3 /orientation=LANDSCAPE /offset=(8,5) /fullsheet



; This keyword controls the size (diameter) of points. Units are cm. 
; A value of 0, disables point drawing.
; Note that with some system printer drivers, setting this value 
; too small, may result in no point being drawn.
;point_size = 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; The following options control raster plotting of images by ImageManager.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MDLCOMMAND	    = implot	    ; For Image Manager
;MDLCOMMAND	    = dcplot	    ; For Descartes
;MDLCOMMAND	    = replot	    ; For ReproGraphics
ISV_RASTER	    = 1 	    ; Plots the raster image,  1=On 0=Off  Default=1
; Note: ImageManager uses the smaller of the resolution values
; specified by PIXEL_RESOLUTION and HARDWARE_RASTER/RESOLUTION.
PIXEL_RESOLUTION = 80 ; Resolution of pixels on output (dpi) Default=75
CONTRAST = 50 ; Contrast in percent, between 0-100   Default=50
BRIGHTNESS = 50 ; Brightness in percent, between 0-100 Default=50
RASTER_FENCE = 1 ; Clip the raster to fence, 1=On 0=Off Default=0
GRAYSCALE = 1 ; Plot in gray scale,  1=On 0=Off	   Default=0
NO_DGNRASTER	    = 0 	    ; MS plot of 87/88, 1=Don't plot 0=Plot Default=0
NO_RASTERREF	    = 0 	    ; MS plot of 90's,	1=Don't plot 0=Plot Default=0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ENABLE_8BIT = 1
EPS_DEFAULT_SCREEN = 1
EPS_FREQUENCY = 55
EPS_ANGLE = 45
