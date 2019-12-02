Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119C810EF8D
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 19:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfLBSxp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 13:53:45 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46764 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfLBSxp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 13:53:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so401243wrl.13;
        Mon, 02 Dec 2019 10:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f1v7Nshk6iUxJP3MddmPzidScvIGdRe5OmcnUCAkON0=;
        b=XGwV1mItkhgTdZwwbVNEACxRbTs8LSWOx0Y0LkkF9qPUpy5oOusnG5/w5NOdo68xNV
         NDS2veH+u1ZQ8lFpH05EO2y5DpZs95zH8MSVwAASHh2oNa2wVSSFn8uDfxDlZKYIyHtj
         jALjaRp6xwWehXwwIS9R9YlvNuMsni7V5mWrfqZkLY3KDXmv7st3sbPjq3MDSdFda+7P
         SnLWDZ1CGXFyGtNXsql1T5MWBFsQj1788+EM8fB4RViStvE4nB4LHkiDiJVmSW8/HBfZ
         FbB/WTX/+jyCBXE9KzJKSKiqkyfHszQw29gNiZfzYiw6BLE4KpVN0QWOGW8OHkFqoCv9
         L4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f1v7Nshk6iUxJP3MddmPzidScvIGdRe5OmcnUCAkON0=;
        b=Fm7+UoCf7RGCYj6W/efhXZZwJXjdshvtTN8F/lgLedyzRpE32BwKKrFAwcrgdzobK8
         sQ3ceXd40f5pcSgNVBJOihT+rIDEhjNv+/YncwZV9E3T7nOXmxtOaLS3RIM1crRfSyvA
         gtod7to4wgFDwIzmTL94vziP816qxFTqGQEIHcRQpninpHAONodfpBw8OzXjJKYnq17e
         2OPV/DXg/hKw0wSGJGeCmaWox6iPjb+XoqUkBnEBfpFbHqnsd2hbqmC1eP3b8xPymzps
         Zwq14/0/KlfZd7Cxv5IF2yAc/j+woKbabjD+k5CsnIl/EqMzSTVXTDlSfgclHARTYYfK
         rXMQ==
X-Gm-Message-State: APjAAAWKbC/eh7bsD9Ka/AZ5shDryLqwm9aYgP1LEkiQlvcPVWQNLKT0
        tu+cGUiXPleWOKuxMuv8Jz0=
X-Google-Smtp-Source: APXvYqyT5qIZqkrFXiSHABrKE+fUSySESMth558JCSTXqpdokQG8FYcOIPXEvGBDJOqe6aBeIfztcA==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr467853wrt.366.1575312822127;
        Mon, 02 Dec 2019 10:53:42 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id p5sm309610wrt.79.2019.12.02.10.53.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 10:53:41 -0800 (PST)
Date:   Mon, 2 Dec 2019 19:53:40 +0100
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
Message-ID: <20191202185340.nae4lljten5jqp3y@pali>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali>
 <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali>
 <20191202175440.GA50317@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2etcyssq2xsldc6g"
Content-Disposition: inline
In-Reply-To: <20191202175440.GA50317@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--2etcyssq2xsldc6g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Roh=C3=A1r wrote:
> > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > Hi Pali,
> > >=20
> > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Roh=C3=A1r wrote:
> > > > Hello!
> > > >=20
> > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi wrote:
> > > > > Support setting the uniq attribute of the input device. The uniq
> > > > > attribute is used as a unique identifier for the connected device.
> > > > >=20
> > > > > For example, uinput devices created by BlueZ will store the addre=
ss of
> > > > > the connected device as the uniq property.
> > > > >=20
> > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.or=
g>
> > > >=20
> > > > ...
> > > >=20
> > > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uin=
put.h
> > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > --- a/include/uapi/linux/uinput.h
> > > > > +++ b/include/uapi/linux/uinput.h
> > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > >  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> > > > >  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
> > > > >  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> > > > > +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
> > > >=20
> > > > I think that usage of char* as type in _IOW would cause compatibili=
ty
> > > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPAT). =
Size
> > > > of char* pointer depends on userspace (32 vs 64bit), so 32bit proce=
ss on
> > > > 64bit kernel would not be able to call this new UI_SET_UNIQ ioctl.
> > > >=20
> > > > I would suggest to define this ioctl as e.g.:
> > > >=20
> > > >   #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > > >=20
> > > > And then in uinput.c code handle it as:
> > > >=20
> > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > >=20
> > > > as part of section /* Now check variable-length commands */
> > >=20
> > > If we did not have UI_SET_PHYS in its current form, I'd agree with yo=
u,
> > > but I think there is benefit in having UI_SET_UNIQ be similar to
> > > UI_SET_PHYS.
> >=20
> > I thought that ioctl is just number, so we can define it as we want. And
> > because uinput.c has already switch for variable-length commands it
> > would be easy to use it. Final handling can be in separate function like
> > for UI_SET_PHYS which can look like same.
>=20
> Yes, we can define ioctl number as whatever we want. What I was trying
> to say, right now users do this:
>=20
> 	rc =3D ioctl(fd, UI_SET_PHYS, "whatever");
> 	...
>=20
> and with UI_SET_UNIQ they expect the following to work:
>=20
> 	rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> 	...

And would not following definition

  #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)

allow userspace to call

  rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");

as you want?

> They would not expect a variable length IOCTL here, or expect a
> fixed-size string, nor do they expect to cast pointer to u64. So keeping
> the spirit of UI_SET_PHYS, even if it is not great from 64/32 bit point
> of view is beneficial here.
>=20
> >=20
> > > But you are absolutely correct that in current form the patch is
> > > deficient on 64/32 systems, and the compat handling needs to be added
> > > before it can be accepted.
> >=20
> > Is not better to avoid usage of compat ioctl? Or it is OK to use compat
> > ioctl also for new features? I do not know if there are some kernel
> > rules for it or not... But for me it sounds like "compatibility layer
> > for older code".
>=20
> Yes, if uinput driver did not have any compat code in it, we would not
> want to add it. But alas! we already need to handle compat cases for
> expsting API, so consistency is more important than purity (in my
> opinion) here.
>=20
> Thanks.
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--2etcyssq2xsldc6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXeVdsgAKCRCL8Mk9A+RD
UizOAJ9Q3KfvZg+KBeneTeD4TNT4oX4cRQCgxcA8gx8TdeB2oOo7XPVxPq/88XQ=
=s/uf
-----END PGP SIGNATURE-----

--2etcyssq2xsldc6g--
