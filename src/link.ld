ENTRY(_start)

SECTIONS {
	PROVIDE(__ipl_start = 0x40008000);
	. = __ipl_start;
	.text : {
		*(.text*);
	}
	.data : {
		*(.data*);
		*(.rodata*);
	}
    . = . + 4;
    __payload_num = .;
    . = ALIGN(0x10);
    __ipl_end = .;
	.bss : {
		__bss_start = .;
		*(COMMON)
		*(.bss*)
		__bss_end = .;
	}
}
