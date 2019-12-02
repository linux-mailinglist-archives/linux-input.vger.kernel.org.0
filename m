Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30EFB10F328
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2019 00:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfLBXJx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 18:09:53 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42866 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfLBXJx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 18:09:53 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so1316740wrf.9;
        Mon, 02 Dec 2019 15:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3SiZHStHdNwKd4k0PA7yaGGj1hYm6GIulwshCwq+z2M=;
        b=C4CKBtxhr3L5VZCFrol7SGLdY4e1Y+XuL4QvIo52BcPOgN48/0SmduYw14wcJb4aUl
         6R12GOgzyNzse11S81iOxW+mEONFxqpDRT3ZGELxInoRMzP09YqD1fc3okAt57C1HXtC
         kBF9ZCROg9Y/NOOKEeRY5uX6jOyHdP/v73oSpApjJOmGurRnwLxT2vWAQNn4qJK8tHpm
         4khfsj6TA3qUcnb3QCEUCYLFwTu23nbQU2jrpl1VePESHFCGOmn5V5ARWiajT21smdUa
         GYtluXksMpA1IaxAsW1tvgW4bPqpaYBKAD3F4j+QVrR+HIrA21PnfM/bAJMlPpuzGZpj
         ByBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3SiZHStHdNwKd4k0PA7yaGGj1hYm6GIulwshCwq+z2M=;
        b=lFpND21I/qLEdd9lRpxvc2ASmpkzjj7TmLOkMNWBYmcQCMLXU91EysvhRdEtE6bxkT
         BMdMHAXKepFm9+abfpo2kyAgC4tqsgTg5LIJGLy29yDLi1QUe1c86KR8PEbuHmzkpfaF
         9XdDWuBhUGcSZ3Pe8Q1qQ0MU6zulETdscxICd6APDnCxAu6P1uD0Mq5037f9QYHAu3IM
         Zz1fzbkd4+tSIWXOOsmfJhauHWHSTSqw+YI3CmIjHCGyBNsza5+D9vHt/TcrICaLABew
         /p/7rZqGZHn1wwBX3jAb7AQv6FxoFPt2fYsDVG1TXVyZFC4ik+crdwK4eVD9b/UoEP7t
         T1xA==
X-Gm-Message-State: APjAAAW2ImiY9Q1KpBE9sS5Sx2PsCkhh0ub89in2bTsfaIOCPdxeTODb
        IBlka51aMPi3P/2khtkWosA=
X-Google-Smtp-Source: APXvYqxPN9gYozPb/44Uug0FGTi6qb6GARk0Vn4Twem59e6nqrP2WkS/Bvj1HMnHip9D/ncf5D4YrA==
X-Received: by 2002:a5d:6ca1:: with SMTP id a1mr1619121wra.36.1575328189830;
        Mon, 02 Dec 2019 15:09:49 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id z26sm922313wmk.33.2019.12.02.15.09.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 15:09:48 -0800 (PST)
Date:   Tue, 3 Dec 2019 00:09:47 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-input@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
Message-ID: <20191202230947.ld5ibnczdpkekfcm@pali>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali>
 <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali>
 <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali>
 <20191202193628.GI50317@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7npjrcjeypf2arfk"
Content-Disposition: inline
In-Reply-To: <20191202193628.GI50317@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--7npjrcjeypf2arfk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Monday 02 December 2019 11:36:28 Dmitry Torokhov wrote:
> On Mon, Dec 02, 2019 at 07:53:40PM +0100, Pali Roh=C3=A1r wrote:
> > On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> > > On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Roh=C3=A1r wrote:
> > > > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > > > Hi Pali,
> > > > >=20
> > > > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Roh=C3=A1r wrote:
> > > > > > Hello!
> > > > > >=20
> > > > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi w=
rote:
> > > > > > > Support setting the uniq attribute of the input device. The u=
niq
> > > > > > > attribute is used as a unique identifier for the connected de=
vice.
> > > > > > >=20
> > > > > > > For example, uinput devices created by BlueZ will store the a=
ddress of
> > > > > > > the connected device as the uniq property.
> > > > > > >=20
> > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromiu=
m.org>
> > > > > >=20
> > > > > > ...
> > > > > >=20
> > > > > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux=
/uinput.h
> > > > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > > > --- a/include/uapi/linux/uinput.h
> > > > > > > +++ b/include/uapi/linux/uinput.h
> > > > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > > > >  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> > > > > > >  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
> > > > > > >  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> > > > > > > +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
> > > > > >=20
> > > > > > I think that usage of char* as type in _IOW would cause compati=
bility
> > > > > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPA=
T). Size
> > > > > > of char* pointer depends on userspace (32 vs 64bit), so 32bit p=
rocess on
> > > > > > 64bit kernel would not be able to call this new UI_SET_UNIQ ioc=
tl.
> > > > > >=20
> > > > > > I would suggest to define this ioctl as e.g.:
> > > > > >=20
> > > > > >   #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111,=
 0)
> > > > > >=20
> > > > > > And then in uinput.c code handle it as:
> > > > > >=20
> > > > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > > > >=20
> > > > > > as part of section /* Now check variable-length commands */
> > > > >=20
> > > > > If we did not have UI_SET_PHYS in its current form, I'd agree wit=
h you,
> > > > > but I think there is benefit in having UI_SET_UNIQ be similar to
> > > > > UI_SET_PHYS.
> > > >=20
> > > > I thought that ioctl is just number, so we can define it as we want=
=2E And
> > > > because uinput.c has already switch for variable-length commands it
> > > > would be easy to use it. Final handling can be in separate function=
 like
> > > > for UI_SET_PHYS which can look like same.
> > >=20
> > > Yes, we can define ioctl number as whatever we want. What I was trying
> > > to say, right now users do this:
> > >=20
> > > 	rc =3D ioctl(fd, UI_SET_PHYS, "whatever");
> > > 	...
> > >=20
> > > and with UI_SET_UNIQ they expect the following to work:
> > >=20
> > > 	rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> > > 	...
> >=20
> > And would not following definition
> >=20
> >   #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> >=20
> > allow userspace to call
> >=20
> >   rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> >=20
> > as you want?
>=20
> OK, so what you are saying is that we can have whatever in the size
> portion of ioctl number and simply ignore it in the driver

Yes.

> (and I do not
> think we need to do any of "UI_SET_UNIQ & ~IOCSIZE_MASK" really).

You are right, we do not need to clear any IOCSIZE_MASK. As ioctl number
would be always sam constant number. So it would be really simple. So
original patch would work if UI_SET_UNIQ define would be changed to
above with _IOW() macro.

> While this would work, I am not sure it is the best option as I think
> we'd have to comment extensively why we have arbitrary number in place
> of the size.

Comment can be added. But this is as ioctl is going to accept variable
length array (not fixed array), zero value make sense for me (zero as we
do not know exact size).

> And we still do not really save anything, as we still have to go through
> compat ioctl handler (since we have it already) and it is very simple to
> add a case for UI_SET_UNIQ there...

Yes, compat ioctl is still used. But my proposed solution does not
involve to define a new compact ioctl number just for sizeof(char *).

I'm looking at this particular problem from side, that there is no
reason to define two new ioctl numbers for UI_SET_UNIQ (one normal
number and one compat number), when one number is enough. It is one new
ioctl call, so one ioctl number should be enough.

And also with my proposed solution with ioctl size=3D0 it simplify
implementation of UI_SET_UNIQ as it is not needed to implement also
UI_SET_UNIQ_COMPAT ioctl nor touch compat ioct code path. Basically
original patch (with changed UI_SET_UNIQ macro) is enough.

But of of course, this is my view of this problem and I would not be
against your decision from maintainer position. Both solutions would
work correctly and bring same behavior for userspace applications.

> Thanks.
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--7npjrcjeypf2arfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXeWZugAKCRCL8Mk9A+RD
UnTeAKCTUnr6gGjn/3NUTv/7PKhuAkV9mQCfbozrQ4bozHH1N5T69B0hkEw695E=
=VymX
-----END PGP SIGNATURE-----

--7npjrcjeypf2arfk--
