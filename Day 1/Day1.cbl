      ******************************************************************
      * Author: M00sk
      * Date: 2017-12-04
      * Purpose: 4 glory of kek
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 inp-field.
           05 inp-field-1                                pic x(255).
           05 inp-field-2                                pic x(255).
           05 inp-field-3                                pic x(255).
           05 inp-field-4                                pic x(255).
           05 inp-field-5                                pic x(255).
           05 inp-field-6                                pic x(255).
           05 inp-field-7                                pic x(255).
           05 inp-field-8                                pic x(255).
           05 inp-field-9                                pic x(255).
           05 inp-field-10                               pic x(255).
           05 inp-field-11                               pic x(255).
           05 inp-field-12                               pic x(255).
           05 inp-field-13                               pic x(255).
           05 inp-field-14                               pic x(255).
           05 inp-field-15                               pic x(255).

       01 sz-x2                                          pic x(2).
       01 sz-x2-2                                        pic x(2).
       01 sz-92                                          pic 9(2).
       01 sz-9                                           pic 9.
       01 sz-x                                           pic x.
       01 sz-x-1                                         pic x.
       01 sz-x-2                                         pic x.
       01 i                                              pic 9999.
       01 ans                                            pic 9(8).
       01 ans-x                                          pic x(68).



       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      *-----------------------------------------------------------------
       MAIN section.
         DISPLAY 'Show me what you got: '
         perform GET-INPUT
         perform DECODE-CAPTCHA
         perform DISPLAY-ANSWER
       exit.
      *-----------------------------------------------------------------
       GET-INPUT section.
         move spaces to inp-field
         accept inp-field
       exit.
      *-----------------------------------------------------------------
       DECODE-CAPTCHA section.
         move inp-field(1:2) to sz-x2
         move 1 to i
         perform until (sz-x2 = spaces) OR (i = 3000)
             move sz-x2(1:1)      to sz-x-1
             move sz-x2(2:1)      to sz-x-2
             if sz-x-2 = space
               move inp-field(1:1) to sz-x-2
             end-if

             if sz-x-1 = sz-x-2
               move sz-x-1            to sz-9

               compute ans = ans + sz-9
             end-if
           add 1 to i
           move inp-field(i:2)        to sz-x2
         end-perform
       exit.
      *-----------------------------------------------------------------
       DISPLAY-ANSWER section.
        string "AND THE ANSWER IS...  "
               ans delimited by size into ans-x
        display ans-x
        stop run
       exit.
      *-----------------------------------------------------------------
       END PROGRAM DAY1.
