        NAME    main
        
        PUBLIC  __iar_program_start
        
        SECTION .intvec : CODE (2)
        THUMB
        
__iar_program_start
        B       main

        
        SECTION .text : CODE (2)
        THUMB

main    NOP
        ADR R2, STRING  ; 레지스터 R2가 STRING 값을 가리킴
        LDR R1, [R2]  ; 레지스터 R2가 가리키고 있는 값을 R1에 저장
        MOV R3, #32  ; STRING에는 항상 32 bit의 숫자가 들어갈 것으로 가정하여
                     ; loop 영역이 32번 실행되도록 하기 위해 세팅함
        
loop
        CMP R3, #0
        BEQ end  ; 레지스터 R3의 값이 감소하다가 0이 되면 프로그램이 종료됨
        LSLS R1, R1, #1  ; 레지스터 R1의 값을 Logic Shift Left 함으로써 1의 갯수를 셀 수 있음
                         ; 뒤에 S를 붙여야 Carry가 발생했을 때 Carry Flag가 1로 세팅됨
        ADC R0, R0, #0  ; Carry Flag가 0이면 레지스터 R0에 변화가 없고, 1이면 R0가 1만큼 증가함
                        ; 레지스터 R0의 값을 Carry Flag의 값하고 더한다고 보아도 됨
        SUB R3, R3, #1
        B loop
        
        DATA
STRING DCD 0xFFFFFFFF  ; 32 bit의 숫자 세팅

end
        NOP
        END
