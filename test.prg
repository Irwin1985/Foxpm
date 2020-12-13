Cd c:\desarrollo\mygarbage\vfp\foxpm
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
?HTTPSGet("https://github.com/Irwin1985/FoxFaker/blob/master/FoxFaker.prg", "c:\desarrollo\mygarbage\vfp\foxpm\src\FoxFaker.prg", "MyProgress()", "MyTrace()")
***********************
FUNCTION MyProgress() && Callback from the FLL - can be used to track operation progress
***********************
    *!* You can create your own function, procedure or method to handle this and name it whatever you want.
    *!* The nConnectTotalBytes and nConnectBytesSoFar are private variables created on-the-fly by the FLL
    ?m.nConnectTotalBytes
    ?m.nConnectBytesSoFar
ENDFUNC

***********************
FUNCTION MyTrace() && Callback from the FLL - used to provide a detailed trace of the operation
***********************
    *!* You can create your own function, procedure or method to handle this and name it whatever you want.
    *!* The nTraceDataType and cTraceData are private variables created on-the-fly by the FLL
#DEFINE TYPE_TEXT 0
#DEFINE TYPE_HEADER_IN 1
#DEFINE TYPE_HEADER_OUT 2
#DEFINE TYPE_DATA_IN 3
#DEFINE TYPE_DATA_OUT 4
#DEFINE TYPE_SSL_DATA_IN 5
#DEFINE TYPE_SSL_DATA_OUT 6
#DEFINE TYPE_END 7
    ?ICASE(m.nTraceDataType = TYPE_TEXT, "STATUS:", ;
     m.nTraceDataType = TYPE_HEADER_IN, "<RECV HEADER: ", ;
     m.nTraceDataType = TYPE_HEADER_OUT, ">SEND HEADER: ", ;
     m.nTraceDataType = TYPE_DATA_IN, "<RECV DATA: ", ;
     m.nTraceDataType = TYPE_DATA_OUT, ">SEND DATA: ", ;
     m.nTraceDataType = TYPE_SSL_DATA_IN, "<RECV SSL DATA: ", ;
     m.nTraceDataType = TYPE_SSL_DATA_OUT, ">SEND SSL DATA: ", ;
     m.nTraceDataType = TYPE_END, "END: ", "UNKNOWN: ")
    ??m.cTraceData
ENDFUNC