Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304C510E240
	for <lists+linux-input@lfdr.de>; Sun,  1 Dec 2019 15:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfLAOyC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Dec 2019 09:54:02 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33489 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbfLAOyC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Dec 2019 09:54:02 -0500
Received: by mail-wr1-f67.google.com with SMTP id b6so11282202wrq.0;
        Sun, 01 Dec 2019 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eQ6j5REmRqsOoT+5p/IYCrc/BN9PFvrkeKZl4Qm6aME=;
        b=U8Kv/Ovgp71jqToLyKQGQoY+JoSXxNhlFEfuGUzAz34JRxcaLTdYCfecAMN+rFWf7Q
         JmUOf/eotjA8Xg3sHKhasQH9DH4D0Zo2rUumZLW4XkcNbrGl0NoUPBVzJ9Hv+fwtPk0P
         NbOhYbHGJ6YqfPyMaKi0cmFFgVoHy7dwqj6i1hMrzN9U2fcldkgN3ggXDTsoOO7kbkjJ
         z9CDZz3152TfwqrV7ikKHBBWzWKlngw0GerxsPRChyJdbFaAcLmuNKdW1P9S3gXioMkK
         Cs+oS17RrwUNBuXhHbUNPklcwS/orAmFphdxPEogf61x/GbZ+yaWSCq7z1k6OlCMWFA2
         3K1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eQ6j5REmRqsOoT+5p/IYCrc/BN9PFvrkeKZl4Qm6aME=;
        b=Ld+sEYKhnQmCmalEIn+aEWrnmjGMq1Ce7C6BKy7FwYPmgQpfR8imejPkEk8JPrRqWK
         u67UJXAiC9uWJH/lhcNFwgWILmIqWQgHQZLfs6ZpwFBCITJiQ0nYm6DfKPi8eKKi1Uk4
         JteSZ1AMQlwB5gD4vtoFZ19aPmOXFy+58SAmfwCOSgTaipl0xX9QI0i5WhMq595a4Fym
         9x4Yk2JsWCI18ev6c6XY65Gvxm+Z7UPnhTobkAMC68hr+q6Xg1rn/nhPQKQ6JCgiLDPA
         qCjj5BsCn4zHGYdVUZPzQUBNvREopoYfgT+5SSU2BlNhI9FosgFojLrfm+KISB5YDAi7
         i3gA==
X-Gm-Message-State: APjAAAVf7NqeIQolkB+H+ZSmmkfMBsWmdwF1MGDLa/oRtyeyOi9obd+J
        JdH/dk49NYjE6FMykkSdAIc=
X-Google-Smtp-Source: APXvYqw53JPwoAAL3NBcH70lQaDfKjLv6VcteuCUqGUsh9s44jkNGPEKWlSUcJIJViaPf5bXXaPrIw==
X-Received: by 2002:adf:ef10:: with SMTP id e16mr1471239wro.336.1575212039488;
        Sun, 01 Dec 2019 06:53:59 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id g184sm21920979wma.8.2019.12.01.06.53.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2019 06:53:58 -0800 (PST)
Date:   Sun, 1 Dec 2019 15:53:57 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     linux-input@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
Message-ID: <20191201145357.ybq5gfty4ulnfasq@pali>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="smwdn6axeor6yqcl"
Content-Disposition: inline
In-Reply-To: <20191127185139.65048-1-abhishekpandit@chromium.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--smwdn6axeor6yqcl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi wrote:
> Support setting the uniq attribute of the input device. The uniq
> attribute is used as a unique identifier for the connected device.
>=20
> For example, uinput devices created by BlueZ will store the address of
> the connected device as the uniq property.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

=2E..

> diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
> index c9e677e3af1d..d5b7767c1b02 100644
> --- a/include/uapi/linux/uinput.h
> +++ b/include/uapi/linux/uinput.h
> @@ -145,6 +145,7 @@ struct uinput_abs_setup {
>  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
>  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
>  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)

I think that usage of char* as type in _IOW would cause compatibility
problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPAT). Size
of char* pointer depends on userspace (32 vs 64bit), so 32bit process on
64bit kernel would not be able to call this new UI_SET_UNIQ ioctl.

I would suggest to define this ioctl as e.g.:

  #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)

And then in uinput.c code handle it as:

  case UI_SET_UNIQ & ~IOCSIZE_MASK:

as part of section /* Now check variable-length commands */

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--smwdn6axeor6yqcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXePUAwAKCRCL8Mk9A+RD
UhaNAKC3ivzu3IGKS7x5GO7bDEGgP0W0IACfVFJF3Q2bS7l3S6b4CxRtr6cpx6g=
=3inZ
-----END PGP SIGNATURE-----

--smwdn6axeor6yqcl--
