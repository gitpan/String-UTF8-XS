
/*
 * UTF8_1
 *   U+00000000 <00>          - U+0000007F <7F>
 *
 * UTF8_2
 *   U+00000080 <C2 80>       - U+000007FF <DF BF>
 *
 * UTF8_3
 *   U+00000800 <E0 A0 80>    - U+00000FFF <E0 BF BF>
 *   U+00001000 <E1 80 80>    - U+0000CFFF <EC BF BF>
 *   U+0000D000 <ED 80 80>    - U+0000D7FF <ED 9F BF>
 *   U+0000E000 <EE 80 80>    - U+0000FFFF <EF BF BF>
 *
 * UTF8_3_nonchar
 *   U+0000FDD0 <EF B7 90>    - U+0000FDEF <EF B7 AF>
 *   U+0000FFFE <EF BF BE>    - U+0000FFFF <EF BF BF>
 *
 * UTF8_3_interchange
 *   U+00000800 <E0 A0 80>    - U+00000FFF <E0 BF BF>
 *   U+00001000 <E1 80 80>    - U+0000CFFF <EC BF BF>
 *   U+0000D000 <ED 80 80>    - U+0000D7FF <ED 9F BF>
 *   U+0000E000 <EE 80 80>    - U+0000FDCF <EF B7 8F>
 *   U+0000FDF0 <EF B7 B0>    - U+0000FFFD <EF BF BD>
 *
 * UTF8_4
 *   U+00010000 <F0 90 80 80> - U+0003FFFF <F0 BF BF BF>
 *   U+00040000 <F1 80 80 80> - U+000FFFFF <F3 BF BF BF>
 *   U+00100000 <F4 80 80 80> - U+0010FFFF <F4 8F BF BF>
 *
 * UTF8_4_nonchar
 *   U+0001FFFE <F0 9F BF BE> - U+0001FFFF <F0 9F BF BF>
 *   U+0002FFFE <F0 AF BF BE> - U+0002FFFF <F0 AF BF BF>
 *   U+0003FFFE <F0 BF BF BE> - U+0003FFFF <F0 BF BF BF>
 *   U+0004FFFE <F1 8F BF BE> - U+0004FFFF <F1 8F BF BF>
 *   U+0005FFFE <F1 9F BF BE> - U+0005FFFF <F1 9F BF BF>
 *   U+0006FFFE <F1 AF BF BE> - U+0006FFFF <F1 AF BF BF>
 *   U+0007FFFE <F1 BF BF BE> - U+0007FFFF <F1 BF BF BF>
 *   U+0008FFFE <F2 8F BF BE> - U+0008FFFF <F2 8F BF BF>
 *   U+0009FFFE <F2 9F BF BE> - U+0009FFFF <F2 9F BF BF>
 *   U+000AFFFE <F2 AF BF BE> - U+000AFFFF <F2 AF BF BF>
 *   U+000BFFFE <F2 BF BF BE> - U+000BFFFF <F2 BF BF BF>
 *   U+000CFFFE <F3 8F BF BE> - U+000CFFFF <F3 8F BF BF>
 *   U+000DFFFE <F3 9F BF BE> - U+000DFFFF <F3 9F BF BF>
 *   U+000EFFFE <F3 AF BF BE> - U+000EFFFF <F3 AF BF BF>
 *   U+000FFFFE <F3 BF BF BE> - U+000FFFFF <F3 BF BF BF>
 *   U+0010FFFE <F4 8F BF BE> - U+0010FFFF <F4 8F BF BF>
 *
 * UTF8_4_interchange
 *   U+00010000 <F0 90 80 80> - U+0001FFFD <F0 9F BF BD>
 *   U+00020000 <F0 A0 80 80> - U+0002FFFD <F0 AF BF BD>
 *   U+00030000 <F0 B0 80 80> - U+0003FFFD <F0 BF BF BD>
 *   U+00040000 <F1 80 80 80> - U+0004FFFD <F1 8F BF BD>
 *   U+00050000 <F1 90 80 80> - U+0005FFFD <F1 9F BF BD>
 *   U+00060000 <F1 A0 80 80> - U+0006FFFD <F1 AF BF BD>
 *   U+00070000 <F1 B0 80 80> - U+0007FFFD <F1 BF BF BD>
 *   U+00080000 <F2 80 80 80> - U+0008FFFD <F2 8F BF BD>
 *   U+00090000 <F2 90 80 80> - U+0009FFFD <F2 9F BF BD>
 *   U+000A0000 <F2 A0 80 80> - U+000AFFFD <F2 AF BF BD>
 *   U+000B0000 <F2 B0 80 80> - U+000BFFFD <F2 BF BF BD>
 *   U+000C0000 <F3 80 80 80> - U+000CFFFD <F3 8F BF BD>
 *   U+000D0000 <F3 90 80 80> - U+000DFFFD <F3 9F BF BD>
 *   U+000E0000 <F3 A0 80 80> - U+000EFFFD <F3 AF BF BD>
 *   U+000F0000 <F3 B0 80 80> - U+000FFFFD <F3 BF BF BD>
 *   U+00100000 <F4 80 80 80> - U+0010FFFD <F4 8F BF BD>
 */

%%{
    machine UTF8;

    UTF8_1              = 0x00..0x7F;
    UTF8_2              = 0xC2..0xDF 0x80..0xBF;
    UTF8_3              = 0xE0       0xA0..0xBF 0x80..0xBF
                        | 0xE1..0xEC 0x80..0xBF 0x80..0xBF
                        | 0xED       0x80..0x9F 0x80..0xBF
                        | 0xEE..0xEF 0x80..0xBF 0x80..0xBF;
    UTF8_4              = 0xF0       0x90..0xBF 0x80..0xBF 0x80..0xBF
                        | 0xF1..0xF3 0x80..0xBF 0x80..0xBF 0x80..0xBF
                        | 0xF4       0x80..0x8F 0x80..0xBF 0x80..0xBF;

    UTF8_1_control      = 0x00..0x1F | 0x7F;
    UTF8_2_control      = 0xC2 0x80..0x9F;

    UTF8_3_surrogate    = 0xED 0xA0..0xBF 0x80..0xBF;

    UTF8_3_nonchar      = 0xEF 0xB7 0x90..0xAF
                        | 0xEF 0xBF 0xBE..0xBF;

    UTF8_4_nonchar      = 0xF0       (       0x9F | 0xAF | 0xBF) 0xBF 0xBE..0xBF
                        | 0xF1..0xF3 (0x8F | 0x9F | 0xAF | 0xBF) 0xBF 0xBE..0xBF
                        | 0xF4       (0x8F                     ) 0xBF 0xBE..0xBF;

    UTF8_3_private      = 0xEE 0x80..0xBF 0x80..0xBF
                        | 0xEF 0x80..0xA3 0x80..0xBF;

    UTF8_4_private      = 0xF3 0xB0..0xBF (0x80..0xBE 0x80..0xBF | 0xBF 0x80..0xBD)
                        | 0xF4 0x80..0x8F (0x80..0xBE 0x80..0xBF | 0xBF 0x80..0xBD);

    UTF8_3_interchange  = UTF8_3 - UTF8_3_nonchar;
    UTF8_4_interchange  = UTF8_4 - UTF8_4_nonchar;

    UTF8                = UTF8_1 | UTF8_2 | UTF8_3 | UTF8_4;
    UTF8_interchange    = UTF8_1 | UTF8_2 | UTF8_3_interchange | UTF8_4_interchange;
    UTF8_control        = UTF8_1_control | UTF8_2_control;
    UTF8_nonchar        = UTF8_3_nonchar | UTF8_4_nonchar;
    UTF8_private        = UTF8_3_private | UTF8_4_private;
    UTF8_BOM            = 0xEF 0xBB 0xBF;
}%%

