        NAME    main
        
        PUBLIC  __iar_program_start
        
        SECTION .intvec : CODE (2)
        THUMB
        
__iar_program_start
        B       main

        
        SECTION .text : CODE (2)
        THUMB

main    NOP
        ADR R2, STRING  ; �������� R2�� STRING ���� ����Ŵ
        LDR R1, [R2]  ; �������� R2�� ����Ű�� �ִ� ���� R1�� ����
        MOV R3, #32  ; STRING���� �׻� 32 bit�� ���ڰ� �� ������ �����Ͽ�
                     ; loop ������ 32�� ����ǵ��� �ϱ� ���� ������
        
loop
        CMP R3, #0
        BEQ end  ; �������� R3�� ���� �����ϴٰ� 0�� �Ǹ� ���α׷��� �����
        LSLS R1, R1, #1  ; �������� R1�� ���� Logic Shift Left �����ν� 1�� ������ �� �� ����
                         ; �ڿ� S�� �ٿ��� Carry�� �߻����� �� Carry Flag�� 1�� ���õ�
        ADC R0, R0, #0  ; Carry Flag�� 0�̸� �������� R0�� ��ȭ�� ����, 1�̸� R0�� 1��ŭ ������
                        ; �������� R0�� ���� Carry Flag�� ���ϰ� ���Ѵٰ� ���Ƶ� ��
        SUB R3, R3, #1
        B loop
        
        DATA
STRING DCD 0xFFFFFFFF  ; 32 bit�� ���� ����

end
        NOP
        END
