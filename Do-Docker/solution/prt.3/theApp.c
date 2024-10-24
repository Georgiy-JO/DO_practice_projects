// #include <stdio.h>
#include <fcgi_stdio.h>  //fast CGI

/*
client->web_server(nginx)->theprogram->web_server(nginx)->client
*/

int main() {
  while (FCGI_Accept() >= 0) {
    printf("Content-type: text/html\r\n\r\nHello World!\r\n\r\n");
  }
  return 0;
}

//* 'FCGI_Accept()' gets fastCGI request from web server and returns negative
// result if an error took place.
//* 'Content-type: text/html' is a header, that specifies the response format as
// HTML format and incoming information as text (not binary).
//*  '\r' moves coursor to the beginign of the line without messing up the text
// (usually used with '\n' to input spare lines).