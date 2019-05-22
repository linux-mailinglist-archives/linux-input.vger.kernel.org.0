Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09A1925E36
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 08:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfEVGfw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 May 2019 02:35:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45860 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfEVGfv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 May 2019 02:35:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id b18so826233wrq.12;
        Tue, 21 May 2019 23:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Kx6N4jdhX8RY0QqPuMsZm0q9Xm7aAF1EKudqEUJtORI=;
        b=ZIt6g2hmUIjpy+82xcoEACtIUwjzQvJzU2d3XEXxAeXrFV/zsLHIvVWSj2FN+7+eGS
         kNI7u3mYtkZ+WSTR8MOQ3GmsmID0oxancyf+ZOVroNQVKAxYUTtlnjaq7l+s0g1gy21P
         ZUMI0GG9wJuYrFa/UXJSY0isliUAloELnOtyGIirSnaklFJxXZ51sBsIVfdS58q14A1U
         +atgoNX+RxXAqa6v7UA2P2tE5nWeOVFeMQm76Z7Y7MO/Hc3qICsQddmgDKmvceNubAfM
         7/jrHVaFLC2SL2L34TO9IBdfWtCPVwFSUWfHd+qtKxULmEDTQJo8GJ3B5sEvlcSVrpKz
         2I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kx6N4jdhX8RY0QqPuMsZm0q9Xm7aAF1EKudqEUJtORI=;
        b=mrLP1OBblMkU2T2YyVf8P5mfvWCduDjZjRk0pZ4vqx6Zz2WQK+qEw9qY/4Abvp4m7U
         fd6EEEtJW4HPGHrpTPNPUKy3g1psLFUm4pYzULQPVztcOE2xrR97DM+TWeaqCz05nIYv
         yTHjtcK0r64tm+foXyh5T/x28RDx7gEkGp9oIe70R+hhr1ulR4mD/d8TC5pNOoOKqhMH
         Rur2EkHdq8MG+opNyjqPRKh6r2+pr5T2cEwAzlIt+crqBsFTIjuMzlN36WZnUdlXFsRj
         3AxUgk97rPFnZJ4RtBlLB+sEBb5UEKGSs7Lc3rbl4qgoKcNJUwvhTzdwbwC/3Ti93Lz/
         RQFg==
X-Gm-Message-State: APjAAAW1zl9ueR7xkIAvIm7D7ovNAmDtZOlS5HNZEusVHYnXpswq+dVG
        so3OxmDJEBVpZiNLlgFTooA=
X-Google-Smtp-Source: APXvYqz3vJOXmPLTEMFvVU01ZGxevc53HSKCm/l6QrVwFOYPHei0vknX8yUXBWPwp3wgsqKPLZA6QA==
X-Received: by 2002:a5d:6a8c:: with SMTP id s12mr21229583wru.326.1558506949236;
        Tue, 21 May 2019 23:35:49 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id j82sm6010796wmj.40.2019.05.21.23.35.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 23:35:48 -0700 (PDT)
Date:   Wed, 22 May 2019 08:35:46 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
Cc:     Hui Wang <hui.wang@canonical.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRD?= =?utf-8?Q?H=5D_input?=
 =?utf-8?Q?=3A?= alps-fix the issue the special alps trackpoint do not work.
Message-ID: <20190522063546.kb74mxeprkauicul@pali>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
 <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
 <20190521094622.syeub6tcqhbyc7sg@pali>
 <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gm5ekay5c65hegb3"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--gm5ekay5c65hegb3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wednesday 22 May 2019 02:53:18 Xiaoxiao Liu wrote:
> Hi Pali,
>=20
> Why it does not report input data?
> --> The alps devices which detected to use the ALPS_PROTO_V8  contains AL=
PS touchpad and ALPS track point.=20
>      But the ALPS_PROTO_V8 do not support the track point device process.=
=20
>      When the track point was detected to use ALPS_PROTO_V8 ,the v8 proce=
ss_packet method  alps_process_packet_ss4_v2 will reject to report the data=
 because the v8 device is      not set the ALPS_DUALPOINT flag.=20
>      You can refer below code.

Ok, and cannot you set ALPS_DUALPOINT flag based on that
alps_check_is_trackpoint() result and then update
alps_process_packet_ss4_v3() code to supports also
V8 trackpoint packets?

> 	/* Report trackstick */
> 	if (alps_get_pkt_id_ss4_v2(packet) =3D=3D SS4_PACKET_ID_STICK) {
> 		if (!(priv->flags & ALPS_DUALPOINT)) {
> 			psmouse_warn(psmouse,
> 				     "Rejected trackstick packet from non DualPoint device");
> 			return;
> 		}
> 		...
> 		return;
> 	}
>=20
> why is for non-ALPS trackpoints used ALPS driver?
> --> the non-Alps track point is the ALPS touchpad, it is right to use the=
 ALPS driver for ALPS touchpad.

Ok, now I got it.

> The v8 protocol condition may modified  as below, it will be more easier =
to understand.
>=20
> 	 if (e7[0] =3D=3D 0x73 && e7[1] =3D=3D 0x03 && (e7[2] =3D=3D 0x14 || e7[=
2] =3D=3D 0x28) &&  (alps_check_is_trackpoint(psmouse) !=3D 0)  ) {
>  		protocol =3D &alps_v8_protocol_data;
> 	}

Yes, this would be more easier to understand.

Anyway, more information should be in commit message.

> Best Regards
> XiaoXiao Liu
> sliuuxiaonxiao@gmail.com
> xiaoxiao.liu-1@cn.alps.com
>=20
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Pali Roh=C3=A1r <pali.rohar@gmail.com>=20
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: Tuesday, May 21, 2019 5:46 PM
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Hui Wang <hui.wang@canonical.com>
> =E6=8A=84=E9=80=81: =E5=8A=89 =E6=9B=89=E6=9B=89 Xiaoxiao Liu <xiaoxiao.l=
iu-1@cn.alps.com>; XiaoXiao Liu <sliuuxiaonxiao@gmail.com>; dmitry.torokhov=
@gmail.com; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; =E6=
=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com>; zhangfp1=
@lenovo.com
> =E4=B8=BB=E9=A2=98: Re: =E7=AD=94=E5=A4=8D: [PATCH] input: alps-fix the i=
ssue the special alps trackpoint do not work.
>=20
> Hello!
>=20
> On Tuesday 21 May 2019 10:26:47 Hui Wang wrote:
> > Tested-by: Hui Wang <hui.wang@canonical.com>
> >=20
> > On 2019/5/21 =E4=B8=8A=E5=8D=889:07, Xiaoxiao Liu wrote:
> > > Add Pali Roh=C3=A1r.
> > >=20
> > > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > > =E5=8F=91=E4=BB=B6=E4=BA=BA: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> > > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: Monday, May 20, 2019 7:02 PM
> > > =E6=94=B6=E4=BB=B6=E4=BA=BA: dmitry.torokhov@gmail.com
> > > =E6=8A=84=E9=80=81: linux-input@vger.kernel.org; linux-kernel@vger.ke=
rnel.org;=20
> > > hui.wang@canonical.com; =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao=20
> > > <xiaojian.cao@cn.alps.com>; zhangfp1@lenovo.com; =E5=8A=89 =E6=9B=89=
=E6=9B=89 Xiaoxiao Liu=20
> > > <xiaoxiao.liu-1@cn.alps.com>; XiaoXiao Liu=20
> > > <sliuuxiaonxiao@gmail.com>
> > > =E4=B8=BB=E9=A2=98: [PATCH] input: alps-fix the issue the special alp=
s trackpoint do not work.
> > >=20
> > > when the alps trackpoint is detected and using the=20
> > > alps_v8_protocol_data procotol, the alps driver will not report the i=
nput data.
>=20
> Why it does not report input data?
>=20
> > > solution: use standard mouse driver instead of alps driver when the s=
pecail trackpoint was detected.
>=20
> This looks like an (undocumented) hack or workaround. Not a solution.
>=20
> > > Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> > > ---
> > >   drivers/input/mouse/alps.c | 23 ++++++++++++++++++++++-
> > >   1 file changed, 22 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c=
=20
> > > index 0a6f7ca883e7..516ae1d0eb17 100644
> > > --- a/drivers/input/mouse/alps.c
> > > +++ b/drivers/input/mouse/alps.c
> > > @@ -24,7 +24,7 @@
> > >   #include "psmouse.h"
> > >   #include "alps.h"
> > > -
> > > +#include "trackpoint.h"
> > >   /*
> > >    * Definitions for ALPS version 3 and 4 command mode protocol
> > >    */
> > > @@ -2864,6 +2864,22 @@ static const struct alps_protocol_info *alps_m=
atch_table(unsigned char *e7,
> > >   	return NULL;
> > >   }
> > > +int alps_check_is_trackpoint(struct psmouse *psmouse) {
> > > +	u8 param[2] =3D { 0 };
> > > +	int error;
> > > +
> > > +	error =3D ps2_command(&psmouse->ps2dev,
> > > +			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
> > > +	if (error)
> > > +		return error;
> > > +
> > > +	if (param[0] =3D=3D TP_VARIANT_ALPS)
> > > +		return 0;
> > > +	psmouse_warn(psmouse, "It is not alps trackpoint.\n");
> > > +	return -ENODEV;
> > > +}
>=20
> So, this function returns 0 when detected ALPS trackpoint and -ENODEV whe=
n not.
>=20
> > > +
> > >   static int alps_identify(struct psmouse *psmouse, struct alps_data =
*priv)  {
> > >   	const struct alps_protocol_info *protocol; @@ -2912,6 +2928,11 @@ =
static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
> > >   			protocol =3D &alps_v3_protocol_data;
> > >   		} else if (e7[0] =3D=3D 0x73 && e7[1] =3D=3D 0x03 &&
> > >   			   (e7[2] =3D=3D 0x14 || e7[2] =3D=3D 0x28)) {
> > > +				if (alps_check_is_trackpoint(psmouse) =3D=3D 0) {
> > > +					psmouse_warn(psmouse,
> > > +					"It is alps trackpoint, use the standard mouse driver.\n");
> > > +					return -EINVAL;
>=20
> And here I'm lost. If we have *not* detected ALPS trackpoint then if bloc=
k is not called which means that ALPS driver is used.
>=20
> So why is for non-ALPS trackpoints used ALPS driver? This does not seem l=
ike a correct...
>=20
> And when we have detected ALPS trackpoint (return value 0) then standard =
mouse driver is used and returned -EINVAL. This seems strange too.
>=20
> So either this code is wrong or there are missing more details for explai=
ning this strange logic. But still this looks like a hack not a proper fix/=
solution.
>=20
> > > +				}
> > >   			protocol =3D &alps_v8_protocol_data;
> > >   		} else if (e7[0] =3D=3D 0x73 && e7[1] =3D=3D 0x03 && e7[2] =3D=3D=
 0xc8) {
> > >   			protocol =3D &alps_v9_protocol_data;
> > > --
> > > 2.20.1
> > >=20
>=20
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--gm5ekay5c65hegb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXOTtwAAKCRCL8Mk9A+RD
UjI7AJ9gRrW3aZluqJMt+jbv+ySNlyLNXgCfZrv27/6+ip9IC/P+/TZiVbnRDE4=
=ErJL
-----END PGP SIGNATURE-----

--gm5ekay5c65hegb3--
