Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA4B1103B8
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2019 18:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfLCRi1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Dec 2019 12:38:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54366 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCRi1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Dec 2019 12:38:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id b11so3831124wmj.4;
        Tue, 03 Dec 2019 09:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hf1GEOTtUT5DFT9gZa5Emai2aUMzMaSb3KfXYC7NTBw=;
        b=me/gELWwhGoTijaU04Rgwe9CJuiDhi3Ce6csKDhzn+z0JagSCiKzp4EdQrfOzVchHv
         bLexUDAOkBQPlWjf3fP0B8Oy1rZk4oOeiSeVUXIUU0jW109DIvQWLm3IfgqUZDz7hHhw
         LQ+5XwzGQZnLS/1FwPbKUjF0OcuprIzCbeUm+JeGHl8Qs1ZPbpa9Nr76dO5JfCwSYQpl
         looVoXvDgzReK9iuFrtfFmVbben93dgBa+94dJtS2oYP6eMsg65QPaOd0/W5HQKRmsAj
         bKfvD53jgTzhH3HPr6uHuPLBHWAtchIfwkxMUwpqtIBSe+N+5cagmkIeJD6Bo6Dj09R9
         6MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hf1GEOTtUT5DFT9gZa5Emai2aUMzMaSb3KfXYC7NTBw=;
        b=Hs0DD7qaE42NFYFdFzMeIR8DXvIkb5TlWKsEuC3kNGTrxCp2wpmD17AgTbJ0eRaqE/
         w/FDxzDGTPWYY8kklKAuzKAmSOh5pZvdD9bwTS2t/JkAJckItTnQ1h00fGTb187QbHZ1
         cMYTrdFHrytkdVI7tT0aLzUR2nwamEQgrB0/wn2wntmZD/osCz2OVD7TWvjRMY7/VP8s
         VL1nz7fdFRHfp3H/bA61OO1YJYtmhvY63+WG1BI0NX3DcpFU0VrkXwDDA2ipEWrivpbZ
         uuEKBvTJ4EobK1o2rgih6TidFPeU/srH+lL0HQAV28qOKpWo4yOB93zXwJbu50Pg9gfb
         zrNQ==
X-Gm-Message-State: APjAAAXucK0r1Ayz6cH64jYMgt8ps7Lpha+Hgtix0WWWIx1HQPtZP4as
        wAgs9Lr8wx1Ve+PtxqwECZU=
X-Google-Smtp-Source: APXvYqyR8hLxgwCadstEPcB1ak4FGNcU8m8HZd0HQOX+9GD3bZWwWvwS4oprJKZPTRJpWd8UKzosiw==
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr14779400wmm.70.1575394704767;
        Tue, 03 Dec 2019 09:38:24 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id p10sm3536516wmi.15.2019.12.03.09.38.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 09:38:22 -0800 (PST)
Date:   Tue, 3 Dec 2019 18:38:21 +0100
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
Message-ID: <20191203173821.4u6uzxeaqnt3gyz3@pali>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali>
 <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali>
 <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali>
 <20191202193628.GI50317@dtor-ws>
 <20191202230947.ld5ibnczdpkekfcm@pali>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xlvpbxqyrlflyepa"
Content-Disposition: inline
In-Reply-To: <20191202230947.ld5ibnczdpkekfcm@pali>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--xlvpbxqyrlflyepa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tuesday 03 December 2019 00:09:47 Pali Roh=C3=A1r wrote:
> On Monday 02 December 2019 11:36:28 Dmitry Torokhov wrote:
> > On Mon, Dec 02, 2019 at 07:53:40PM +0100, Pali Roh=C3=A1r wrote:
> > > On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> > > > On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Roh=C3=A1r wrote:
> > > > > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > > > > Hi Pali,
> > > > > >=20
> > > > > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Roh=C3=A1r wrote:
> > > > > > > Hello!
> > > > > > >=20
> > > > > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi=
 wrote:
> > > > > > > > Support setting the uniq attribute of the input device. The=
 uniq
> > > > > > > > attribute is used as a unique identifier for the connected =
device.
> > > > > > > >=20
> > > > > > > > For example, uinput devices created by BlueZ will store the=
 address of
> > > > > > > > the connected device as the uniq property.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chrom=
ium.org>
> > > > > > >=20
> > > > > > > ...
> > > > > > >=20
> > > > > > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/lin=
ux/uinput.h
> > > > > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > > > > --- a/include/uapi/linux/uinput.h
> > > > > > > > +++ b/include/uapi/linux/uinput.h
> > > > > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > > > > >  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> > > > > > > >  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
> > > > > > > >  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> > > > > > > > +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
> > > > > > >=20
> > > > > > > I think that usage of char* as type in _IOW would cause compa=
tibility
> > > > > > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COM=
PAT). Size
> > > > > > > of char* pointer depends on userspace (32 vs 64bit), so 32bit=
 process on
> > > > > > > 64bit kernel would not be able to call this new UI_SET_UNIQ i=
octl.
> > > > > > >=20
> > > > > > > I would suggest to define this ioctl as e.g.:
> > > > > > >=20
> > > > > > >   #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 11=
1, 0)
> > > > > > >=20
> > > > > > > And then in uinput.c code handle it as:
> > > > > > >=20
> > > > > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > > > > >=20
> > > > > > > as part of section /* Now check variable-length commands */
> > > > > >=20
> > > > > > If we did not have UI_SET_PHYS in its current form, I'd agree w=
ith you,
> > > > > > but I think there is benefit in having UI_SET_UNIQ be similar to
> > > > > > UI_SET_PHYS.
> > > > >=20
> > > > > I thought that ioctl is just number, so we can define it as we wa=
nt. And
> > > > > because uinput.c has already switch for variable-length commands =
it
> > > > > would be easy to use it. Final handling can be in separate functi=
on like
> > > > > for UI_SET_PHYS which can look like same.
> > > >=20
> > > > Yes, we can define ioctl number as whatever we want. What I was try=
ing
> > > > to say, right now users do this:
> > > >=20
> > > > 	rc =3D ioctl(fd, UI_SET_PHYS, "whatever");
> > > > 	...
> > > >=20
> > > > and with UI_SET_UNIQ they expect the following to work:
> > > >=20
> > > > 	rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > 	...
> > >=20
> > > And would not following definition
> > >=20
> > >   #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > >=20
> > > allow userspace to call
> > >=20
> > >   rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> > >=20
> > > as you want?
> >=20
> > OK, so what you are saying is that we can have whatever in the size
> > portion of ioctl number and simply ignore it in the driver
>=20
> Yes.
>=20
> > (and I do not
> > think we need to do any of "UI_SET_UNIQ & ~IOCSIZE_MASK" really).
>=20
> You are right, we do not need to clear any IOCSIZE_MASK. As ioctl number
> would be always sam constant number. So it would be really simple. So
> original patch would work if UI_SET_UNIQ define would be changed to
> above with _IOW() macro.
>=20
> > While this would work, I am not sure it is the best option as I think
> > we'd have to comment extensively why we have arbitrary number in place
> > of the size.
>=20
> Comment can be added. But this is as ioctl is going to accept variable
> length array (not fixed array), zero value make sense for me (zero as we
> do not know exact size).
>=20
> > And we still do not really save anything, as we still have to go through
> > compat ioctl handler (since we have it already) and it is very simple to
> > add a case for UI_SET_UNIQ there...
>=20
> Yes, compat ioctl is still used. But my proposed solution does not
> involve to define a new compact ioctl number just for sizeof(char *).
>=20
> I'm looking at this particular problem from side, that there is no
> reason to define two new ioctl numbers for UI_SET_UNIQ (one normal
> number and one compat number), when one number is enough. It is one new
> ioctl call, so one ioctl number should be enough.
>=20
> And also with my proposed solution with ioctl size=3D0 it simplify
> implementation of UI_SET_UNIQ as it is not needed to implement also
> UI_SET_UNIQ_COMPAT ioctl nor touch compat ioct code path. Basically
> original patch (with changed UI_SET_UNIQ macro) is enough.
>=20
> But of of course, this is my view of this problem and I would not be
> against your decision from maintainer position. Both solutions would
> work correctly and bring same behavior for userspace applications.


Hi Dmitry!

I was looking again at those _IOW defines for ioctl calls and I have
another argument why not specify 'char *' in _IOW:

All ioctls in _IOW() specify as a third macro argument type which is
passed as pointer to the third argument for ioctl() syscall.

So e.g.:

  #define EVIOCSCLOCKID _IOW('E', 0xa0, int)

is called from userspace as:

  int val;
  ioctl(fd, EVIOCSCLOCKID, &val);

Or

  #define EVIOCSMASK _IOW('E', 0x93, struct input_mask)

is called as:

  struct input_mask val;
  ioctl(fd, EVIOCSMASK, &val);

So basically third argument for _IOW specify size of byte buffer passed
as third argument for ioctl(). In _IOW is not specified pointer to
struct input_mask, but struct input_mask itself.

And in case you define

  #define MY_NEW_IOCTL _IOW(UINPUT_IOCTL_BASE, 200, char*)

then you by above usage you should pass data as:

  char *val =3D "DATA";
  ioctl(fd, MY_NEW_IOCTL, &val);

Which is not same as just:

  ioctl(fd, MY_NEW_IOCTL, "DATA");

As in former case you passed pointer to pointer to data and in later
case you passed only pointer to data.

It just mean that UI_SET_PHYS is already defined inconsistently which is
also reason why compat ioctl for it was introduced.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--xlvpbxqyrlflyepa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXeadigAKCRCL8Mk9A+RD
UkWEAJ0adxjwIUFAhWq0sGgUKdFfXEXbZACgw7jPQCtZtVTFvbHVZ73GkK8cJcc=
=4NDj
-----END PGP SIGNATURE-----

--xlvpbxqyrlflyepa--
