Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D47F124539
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 12:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLRLCa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 06:02:30 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37912 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfLRLC3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 06:02:29 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so1796983wrh.5;
        Wed, 18 Dec 2019 03:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kWlBV5cUUXjYWUh0dXkQkWK4b1z1l+2C2HXtIRHze6A=;
        b=UCaR+Uj2u58lujjbQqHjZLVeg3JhQhCNcKozOEi4TC9bzQJ3bOzH30wjm2lMw/cxPK
         7RKW2+9Uc32cvtdm2llrt36SWOTzVmkvxEWtJdxv1na93yeaeCIeYle3rh2sZpfyyYkY
         IJF6Ts7lHvcYkhxVdxv7Ga01Ob/2/snOAwwdDR8PDItgpwm71h/kypu2TTb395exo6vI
         5XLC9msJixhvVAUU9pEL/9WJX4E0TksRVGllrbnNEHtAyJY8M1+t6MoXkiY1a/zViXPe
         159QAyiLvgNcd6x7nnbpKmyRp8A7OrsI0i+4V6qzARr/dqe4h8zFuRPOVNe6ES/p6iwK
         29YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kWlBV5cUUXjYWUh0dXkQkWK4b1z1l+2C2HXtIRHze6A=;
        b=fpruLPw0Ih+z/MSwKNX1QrPzRvOBsWvu9wuHQI4XD1TsYWXUu6UuS0il7H6grzzqAq
         mCrmGllgvMypwHvwfknOllI1N3LuNcOB1FlGtLTGA9kJNDg1xrqeoIbnimfMx9o1MjM2
         CLyufM3WwH7Eo+2/iF9QInH7PBZg1khgoIZEDisnTV8cR6m0tn7QP6iu0XAfiZ3TgYZ0
         KnDyj86i+8J/cK3DFno5pYompM9kJ4vGcBLG8rpraborS0sQAqF3UfC2LNIFiS5xwH6P
         m45zFfZD1QdGXNtdF0BZZ6WJuASjLQr6uSsdRwrr0AwEUC9A5HCn7d9KdVEHmNe80qO6
         zW/w==
X-Gm-Message-State: APjAAAV1Rxo1qE6ftqjWLlTW4CTxl1EGcMsMcaJBjBnJQ5apROh6mm1l
        Yist2panUGPxeojKKOoN4G4=
X-Google-Smtp-Source: APXvYqwwRWSYdUx/joyd3yKjC0OLvkRrvPp/0zbGvUYN6OqE9AKEjGMOBRr29aXXNP947a6wjp2Xww==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr2143931wro.310.1576666946974;
        Wed, 18 Dec 2019 03:02:26 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id h2sm2258368wrt.45.2019.12.18.03.02.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 03:02:25 -0800 (PST)
Date:   Wed, 18 Dec 2019 12:02:24 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-input@vger.kernel.org,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
Message-ID: <20191218110224.44vcgdxh3j4bn7rw@pali>
References: <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali>
 <20191202193628.GI50317@dtor-ws>
 <20191202230947.ld5ibnczdpkekfcm@pali>
 <20191203173821.4u6uzxeaqnt3gyz3@pali>
 <20191203191112.GJ50317@dtor-ws>
 <20191205105206.slibwytrcteicx6y@pali>
 <CANFp7mXyaqoMDBs4m_Dfm9+4U88g9WoJVcV1g_4KM4xzFhiGXQ@mail.gmail.com>
 <20191206091114.kh255jrmerruumnq@pali>
 <20191206174048.GQ50317@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qohh5fgjffnqn6l4"
Content-Disposition: inline
In-Reply-To: <20191206174048.GQ50317@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--qohh5fgjffnqn6l4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Friday 06 December 2019 09:40:48 Dmitry Torokhov wrote:
> On Fri, Dec 06, 2019 at 10:11:14AM +0100, Pali Roh=C3=A1r wrote:
> > On Thursday 05 December 2019 12:03:05 Abhishek Pandit-Subedi wrote:
> > > On Thu, Dec 5, 2019 at 2:52 AM Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> > > >
> > > > On Tuesday 03 December 2019 11:11:12 Dmitry Torokhov wrote:
> > > > > On Tue, Dec 03, 2019 at 06:38:21PM +0100, Pali Roh=C3=A1r wrote:
> > > > > > On Tuesday 03 December 2019 00:09:47 Pali Roh=C3=A1r wrote:
> > > > > >
> > > > > > Hi Dmitry!
> > > > > >
> > > > > > I was looking again at those _IOW defines for ioctl calls and I=
 have
> > > > > > another argument why not specify 'char *' in _IOW:
> > > > > >
> > > > > > All ioctls in _IOW() specify as a third macro argument type whi=
ch is
> > > > > > passed as pointer to the third argument for ioctl() syscall.
> > > > > >
> > > > > > So e.g.:
> > > > > >
> > > > > >   #define EVIOCSCLOCKID _IOW('E', 0xa0, int)
> > > > > >
> > > > > > is called from userspace as:
> > > > > >
> > > > > >   int val;
> > > > > >   ioctl(fd, EVIOCSCLOCKID, &val);
> > > > > >
> > > > > > Or
> > > > > >
> > > > > >   #define EVIOCSMASK _IOW('E', 0x93, struct input_mask)
> > > > > >
> > > > > > is called as:
> > > > > >
> > > > > >   struct input_mask val;
> > > > > >   ioctl(fd, EVIOCSMASK, &val);
> > > > > >
> > > > > > So basically third argument for _IOW specify size of byte buffe=
r passed
> > > > > > as third argument for ioctl(). In _IOW is not specified pointer=
 to
> > > > > > struct input_mask, but struct input_mask itself.
> > > > > >
> > > > > > And in case you define
> > > > > >
> > > > > >   #define MY_NEW_IOCTL _IOW(UINPUT_IOCTL_BASE, 200, char*)
> > > > > >
> > > > > > then you by above usage you should pass data as:
> > > > > >
> > > > > >   char *val =3D "DATA";
> > > > > >   ioctl(fd, MY_NEW_IOCTL, &val);
> > > > > >
> > > > > > Which is not same as just:
> > > > > >
> > > > > >   ioctl(fd, MY_NEW_IOCTL, "DATA");
> > > > > >
> > > > > > As in former case you passed pointer to pointer to data and in =
later
> > > > > > case you passed only pointer to data.
> > > > > >
> > > > > > It just mean that UI_SET_PHYS is already defined inconsistently=
 which is
> > > > > > also reason why compat ioctl for it was introduced.
> > > > >
> > > > > Yes, you are right. UI_SET_PHYS is messed up. I guess the questio=
n is
> > > > > what to do with all of this...
> > > > >
> > > > > Maybe we should define
> > > > >
> > > > > #define UI_SET_PHYS_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE,=
 111, len)
> > > > > #define UI_SET_UNIQ_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE,=
 112, len)
> > > >
> > > > I'm not sure if this is ideal. Normally in C strings are nul-termin=
ed,
> > > > so functions/macros do not take buffer length.
> > > Except strncpy, strndup, snprintf, etc. all expect a buffer length. At
> >=20
> > This is something different as for these functions you pass buffer and
> > length of buffer which is used in write mode -- not for read mode.
> >=20
> > > the user to kernel boundary of ioctl, I think we should require size
> > > of the user buffer regardless of the data type.
> > >=20
> > > > _STR therefore in names looks inconsistent.
> > > The _STR suffix is odd (what to name UI_SET_PHYS_STR then??) but
> > > requiring the length seems to be common across various ioctls.
> > > * input.h requires a length when requesting the phys and uniq
> > > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/include/uapi/linux/input.h#n138)
> > > * Same with HIDRAW when setting and getting features:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/include/uapi/linux/hidraw.h#n40,
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/samples/hidraw/hid-example.c#n88
> >=20
> > All these ioctls where is passed length are in opposite direction
> > (_IOC_READ) as our PHYS and UNIQ (_IOC_WRITE).
> >=20
> > I fully agree that when you need to read something from kernel
> > (_IOC_READ) and then writing it to userspace, you need to specify length
> > of userspace buffer. Exactly same as with userspace functions like
> > memcpy, snprintf, etc... as you pointed. Otherwise you get buffer
> > overflow as callee does not know length of buffer.
> >=20
> > But here we we have there quite different problem, we need to write
> > something to kernel from userspace (_IOC_WRITE) and we are passing
> > nul-term string. So in this case specifying size is not required as it
> > is implicitly specified as part of passed string.
>=20
> With the new IOCTL definitions it does not need to be a NULL-terminated
> string. It can be a buffer of characters with given length, and kernel
> will NULL-terminate as this it what it wants, not what the caller has to
> give.

Hi Dmitry! I was thinking more about this problem and I will propose
alternative solution, but first with details...

I think that we should use NULL terminated strings. Or better disallow
NULL byte inside string. Reason: all userspace application expects that
input device name would be NULL terminated which implies that in the
middle of name cannot be NULL byte.

So this must apply also for new PHYS / UNIQ ioctl API. If we want in our
ioctl API to use buffer + size (with upper bound limit for size) instead
of passing NULL term string (with upper bound limit for string size)
then kernel have to add a leading NULL byte to string, plus check that
in the buffer there is no NULL byte. I guess this a very little
complicate code, but nothing which is problematic.

And on the userspace part. Now when userspace want to pass constant
string for device name, it just call

  ioctl(fd, UI_SET_PHYS, "my name of device");

After adding a new ioctl with buffer + size API, userspace would have to
call:

  ioctl(fd, UI_SET_PHYS_STR(strlen("my name of device")), "my name of devic=
e");

which looks strange, so programmers would had to move device name into
new variable:

  const char *name =3D "my name of device";
  ioctl(fd, UI_SET_PHYS_STR(strlen(name)), name);

For me the old ioctl API looks easier to use (no need for strlen() or
extra variable), but this is just my preference of usage -- as it is
simpler for me. Maybe you would have different opinion...

And now question: Why we have uinput_compat_ioctl()? It is there only
because size part of IOCTL number is different on 32bit and 64bit
systems. As we know size part of UI_SET_PHYS is wrong and does not make
sense...

Would not it be better to change size of UI_SET_PHYS to just zero and
then when matching ioctl number just ignore size for this UI_SET_PHYS
ioctl? Same for UI_BEGIN_FF_UPLOAD_COMPAT and UI_END_FF_UPLOAD_COMPAT
added in: https://git.kernel.org/tip/tip/c/7c7da40

And we would not have to deal with uinput_compat_ioctl() at all.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--qohh5fgjffnqn6l4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXfoHPQAKCRCL8Mk9A+RD
Ui6vAKCQoaVc3rdeWz7eQwciy9rk2PYh5wCgzFl5rIfTL2ILCkXYVnmGETGK6uI=
=NdRu
-----END PGP SIGNATURE-----

--qohh5fgjffnqn6l4--
