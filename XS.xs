
#line 1 "dev/XS.rl"
#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#define NEED_sv_2pv_flags
#include "ppport.h"

#define UTF8_DISALLOW_NONCHARACTERS 1


#line 14 "XS.xs"
static const int SU8_start = 12;
static const int SU8_first_final = 12;
static const int SU8_error = 0;

static const int SU8_en_main = 12;


#line 24 "dev/XS.rl"


static bool
su_is_utf8(const char *p, STRLEN len, UV flags) {
    const char *pe = p + len;
    int cs;

    
#line 31 "XS.xs"
	{
	cs = SU8_start;
	}

#line 32 "dev/XS.rl"
    
#line 38 "XS.xs"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
tr5:
#line 14 "dev/XS.rl"
	{
        if (flags & UTF8_DISALLOW_NONCHARACTERS)
            return 0;
    }
	goto st12;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
#line 55 "XS.xs"
	switch( (*p) ) {
		case -32: goto st2;
		case -19: goto st4;
		case -17: goto st5;
		case -16: goto st8;
		case -12: goto st11;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st1;
		} else
			goto st0;
	} else if ( (*p) > -18 ) {
		if ( (*p) > -13 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto st0;
		} else if ( (*p) >= -15 )
			goto st10;
	} else
		goto st3;
	goto st12;
st0:
cs = 0;
	goto _out;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
	if ( (*p) <= -65 )
		goto st12;
	goto st0;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st1;
	goto st0;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
	if ( (*p) <= -65 )
		goto st1;
	goto st0;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	if ( (*p) <= -97 )
		goto st1;
	goto st0;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
	switch( (*p) ) {
		case -73: goto st6;
		case -65: goto st7;
	}
	if ( (*p) <= -66 )
		goto st1;
	goto st0;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	if ( (*p) < -112 ) {
		if ( (*p) <= -113 )
			goto st12;
	} else if ( (*p) > -81 ) {
		if ( -80 <= (*p) && (*p) <= -65 )
			goto st12;
	} else
		goto tr5;
	goto st0;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	if ( (*p) > -67 ) {
		if ( -66 <= (*p) && (*p) <= -65 )
			goto tr5;
	} else
		goto st12;
	goto st0;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	switch( (*p) ) {
		case -97: goto st9;
		case -81: goto st9;
		case -65: goto st9;
	}
	if ( -112 <= (*p) && (*p) <= -66 )
		goto st3;
	goto st0;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
	if ( (*p) == -65 )
		goto st7;
	if ( (*p) <= -66 )
		goto st1;
	goto st0;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
	switch( (*p) ) {
		case -113: goto st9;
		case -97: goto st9;
		case -81: goto st9;
		case -65: goto st9;
	}
	if ( (*p) <= -66 )
		goto st3;
	goto st0;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	if ( (*p) == -113 )
		goto st9;
	if ( (*p) <= -114 )
		goto st3;
	goto st0;
	}
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 

	_test_eof: {}
	_out: {}
	}

#line 33 "dev/XS.rl"

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

