Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B13987937F
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 21:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbfG2TBT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 15:01:19 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32770 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfG2TBT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 15:01:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id f20so19482400pgj.0
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2019 12:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vBEQwBpZz0slQDA7+pzq8jYSF7xKAg3j19GwTBC3tOY=;
        b=Ak1i10lVM+rFx8CY30gm113L7107u5QvfP6RvbYrQ11GwRn0nx+BGVldMrQSf+58Ac
         JSsITzrH4pPChEQnAAx8FoqkQRf6WusvXfZEHFifBv03QPE/VTNjjpzQevGM2nUltzmZ
         nvKgrfowRIMzJZq4TrbRQRy438WDtET4dvIt34n+npWxJsdJTP5aiVMEmbwjGFRZbG10
         XKki2GE7dfKTEGKXBZLiYh0pywH+pn18dKxAiL+PfH62cqxENr4usNRyHh0EFfpDa1ZW
         AlL/LlNwRTeV7HykRq44f70BVnmk/55eveViaYzd9XuwowcnhIPU2P0vunhxTHJHaPKK
         Mj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vBEQwBpZz0slQDA7+pzq8jYSF7xKAg3j19GwTBC3tOY=;
        b=F9SE35AjlmTvpkx9Whh7IzNNP7s020ALrpizFfcBJFwaPT4Uerc3LSkXQ3HJU0GDic
         wFh3dM6M6xc836zMtJ5xtOstBS7IjZDucj5N3rutivFJEZTrimbW9nHksCS3IyQJ7nDU
         B3uBHaJsP+MxPHiME0+TCDxTeVfUsXg9rcNtiT+MyAg0X53QeP4zDUpfa6bp/iRFQtql
         mK8C1x/J3m7QL5m4NFmIfNwgya/HhSM6ST7zm+u9mgxtmGCHGkHc927L1H7Oes0sLX0n
         X7aY1ZvUSmP+rJEPIzCiiaLj6qK79Kutq3In/8/vbC65sn5hoUs5+y+GIDJLJMNR1pHm
         k3FQ==
X-Gm-Message-State: APjAAAW6vnm/a+GXB+MilBkfs/5Vh7VKtF5FjM4LnGUQEO+GKDnTMHbw
        vHoR6YTH76YmNLrxVVzrENsdUA==
X-Google-Smtp-Source: APXvYqyr3abG5qjlbn/aT3Wi43wcnchl7owWaLT3yrQK9IwqgmSMolqGcYfafX9Q25JfCk3XXba5ug==
X-Received: by 2002:a62:3883:: with SMTP id f125mr38341180pfa.258.1564426877895;
        Mon, 29 Jul 2019 12:01:17 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
        by smtp.gmail.com with ESMTPSA id i14sm96813536pfk.0.2019.07.29.12.01.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 12:01:16 -0700 (PDT)
Date:   Mon, 29 Jul 2019 12:01:11 -0700
From:   Benson Leung <bleung@google.com>
To:     Olivier Gay <ogay@logitech.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nestor Lopez <nlopezcasad@logitech.com>, bleung@google.com,
        bleung@chromium.org
Subject: Re: [PATCH] HID: logitech-dj: extend consumer usages range
Message-ID: <20190729190111.GB24254@google.com>
References: <20190729172152.4874-1-ogay@logitech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <20190729172152.4874-1-ogay@logitech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Mon, Jul 29, 2019 at 07:21:52PM +0200, Olivier Gay wrote:
> Extend the range of usage codes in the consumer page descriptor of
> the driver. Some Logitech HID devices send usages in that upper range.
>=20
> Signed-off-by: Olivier Gay <ogay@logitech.com>

Tested-by: Benson Leung <bleung@chromium.org>

Patch works for me on my sample when picked to the chromeos-kernel.

Thanks!
Benson

> ---
>  drivers/hid/hid-logitech-dj.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index 6196217a7d93..0e058ddb8e1c 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -380,9 +380,9 @@ static const char consumer_descriptor[] =3D {
>  	0x75, 0x10,		/* REPORT_SIZE (16)                    */
>  	0x95, 0x02,		/* REPORT_COUNT (2)                    */
>  	0x15, 0x01,		/* LOGICAL_MIN (1)                     */
> -	0x26, 0x8C, 0x02,	/* LOGICAL_MAX (652)                   */
> +	0x26, 0xFF, 0x02,	/* LOGICAL_MAX (767)                   */
>  	0x19, 0x01,		/* USAGE_MIN (1)                       */
> -	0x2A, 0x8C, 0x02,	/* USAGE_MAX (652)                     */
> +	0x2A, 0xFF, 0x02,	/* USAGE_MAX (767)                     */
>  	0x81, 0x00,		/* INPUT (Data Ary Abs)                */
>  	0xC0,			/* END_COLLECTION                      */
>  };				/*                                     */
> --=20
> 2.17.1
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXT9CdwAKCRBzbaomhzOw
wqW5AQDe864HyzJpoK13yCpLoErmE7YXhB0cws1I+EUJ+j3CswEAqWkXkkG9ZHTv
vv62smvULFa6CcVPX0iGcj9yS4FIJwI=
=7PK5
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
