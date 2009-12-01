#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#define NEED_sv_2pv_flags
#include "ppport.h"

#define UTF8_DISALLOW_NONCHARACTERS 1

%%{
    machine SU8;
    include UTF8 "utf8.rl";

    action nonchar {
        if (flags & UTF8_DISALLOW_NONCHARACTERS)
            return 0;
    }

    main := ( UTF8_interchange
            | UTF8_nonchar @nonchar
            )*;

    write data;
}%%

static bool
su_is_utf8(const char *p, STRLEN len, UV flags) {
    const char *pe = p + len;
    int cs;

    %% write init;
    %% write exec;

    return (cs >= SU8_first_final);
}

MODULE = String::UTF8::XS   PACKAGE = String::UTF8::XS

PROTOTYPES: DISABLE

BOOT:
{
    HV *stash  = gv_stashpv("String::UTF8::XS", TRUE);
    newCONSTSUB(stash, "UTF8_DISALLOW_NONCHARACTERS", newSVuv(UTF8_DISALLOW_NONCHARACTERS));
}

void
is_utf8(string, flags=0)

  INPUT:
    SV *string
    UV flags

  INIT:
    STRLEN len;
    const char *str;

  CODE:
    SvGETMAGIC(string);

    if (!SvOK(string))
        XSRETURN_NO;

    str = SvPV_nomg_const(string, len);

    ST(0) = boolSV(su_is_utf8(str, len, flags));
    XSRETURN(1);

