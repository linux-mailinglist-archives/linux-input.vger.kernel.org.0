Return-Path: <linux-input+bounces-1097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F56823BAE
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 06:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36DDE1C24C3B
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 05:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC4A12E65;
	Thu,  4 Jan 2024 05:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Xzbd5741"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5618640
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 05:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so125302276.1
        for <linux-input@vger.kernel.org>; Wed, 03 Jan 2024 21:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1704344876; x=1704949676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR4TAdpORcUfD0xhX/PDqB5I0l6LiG232iyhYtTdcXk=;
        b=Xzbd5741oyKnhhvoEHSeULcVgIj6YBH1khLLgns8y9PBG9eorUYHxMDjmEOSqzXdvq
         +yy2UPFFKQpGIvKOWoFVyVszX8zBkbIb+8Z4sRJXgIbHFyQXGaJ6MCVfnJ+c7I2QtsMz
         KI/tIjv1V6vFWxIaLEKCFNvcWSzmXtPFRYCxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704344876; x=1704949676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NR4TAdpORcUfD0xhX/PDqB5I0l6LiG232iyhYtTdcXk=;
        b=uPGgoixgO/O5fm8i5LSSMM1j4MnNoC8YuZDHBEpwuNwrWJvKKmFDfhs9UnQMCnEje4
         SzLH/AwzBJygvMX+9iZpnV4D9nGxltukNV1Ph5xxD2i6beVkSsnbuze2XfAlvPfkDFx3
         KasImgRlb0w8cQtWvMRspzgb4p747/itdhrW5NsArz8yPZXg7NJd8cONohQ7UmviB2Ly
         BXq//TMkpmQs5qvHWcMlU3MOc4dw59op8ecpxMB41KzuT5M2084IfPZNzuuxELKdUG9u
         /cJtobLjd8Qf9qIJHavnhPe5/2zM+QgqmJj8cHSbr9sEBDViueeOeEzVHjMwXljzl2vH
         pI2Q==
X-Gm-Message-State: AOJu0Yynbk6xjnKn6dpzfMRF0Mj4ekU48M3xFkAfsIfXVTtwjE436c92
	hDsuPUonOgK3NdEgIpE5xc9djWtjY8TfWLMYnLL6WN0lcuNp
X-Google-Smtp-Source: AGHT+IHI8p2FEmfb/7z21GPJ+1pzT9xTz9PkM/BO/OWWKOOKxJHUnn9pfn76e0JkEyVB52kC9L//CEt7wXYhpXkqWtI=
X-Received: by 2002:a25:ab93:0:b0:dbd:5d43:953 with SMTP id
 v19-20020a25ab93000000b00dbd5d430953mr69780ybi.43.1704344876252; Wed, 03 Jan
 2024 21:07:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127204206.3593559-1-zack@kde.org> <20240104050605.1773158-1-zack.rusin@broadcom.com>
In-Reply-To: <20240104050605.1773158-1-zack.rusin@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 4 Jan 2024 00:07:45 -0500
Message-ID: <CABQX2QNjc7-wVZX1hZVbOjNmz+ow0xUOtn-XjpK-5p28-onpTQ@mail.gmail.com>
Subject: Re: [PATCH v2] input/vmmouse: Fix device name copies
To: linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Raul Rangel <rrangel@chromium.org>, 
	linux-input@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 12:06=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> Make sure vmmouse_data::phys can hold serio::phys (which is 32 bytes)
> plus an extra string, extend it to 64.
>
> Fixes gcc13 warnings:
> drivers/input/mouse/vmmouse.c: In function =E2=80=98vmmouse_init=E2=80=99=
:
> drivers/input/mouse/vmmouse.c:455:53: warning: =E2=80=98/input1=E2=80=99 =
directive output may be truncated writing 7 bytes into a region of size bet=
ween 1 and 32 [-Wformat-truncation=3D]
>   455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
>       |                                                     ^~~~~~~
> drivers/input/mouse/vmmouse.c:455:9: note: =E2=80=98snprintf=E2=80=99 out=
put between 8 and 39 bytes into a destination of size 32
>   455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   456 |                  psmouse->ps2dev.serio->phys);
>       |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> v2: Use the exact size for the vmmouse_data::phys
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 8b8be51b4fd3 ("Input: add vmmouse driver")
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Raul Rangel <rrangel@chromium.org>
> Cc: linux-input@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v4.1+
> ---
>  drivers/input/mouse/vmmouse.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.=
c
> index ea9eff7c8099..74131673e2f3 100644
> --- a/drivers/input/mouse/vmmouse.c
> +++ b/drivers/input/mouse/vmmouse.c
> @@ -63,6 +63,8 @@
>  #define VMMOUSE_VENDOR "VMware"
>  #define VMMOUSE_NAME   "VMMouse"
>
> +#define VMMOUSE_PHYS_NAME_POSTFIX_STR "/input1"
> +
>  /**
>   * struct vmmouse_data - private data structure for the vmmouse driver
>   *
> @@ -72,7 +74,8 @@
>   */
>  struct vmmouse_data {
>         struct input_dev *abs_dev;
> -       char phys[32];
> +       char phys[sizeof_field(struct serio, phys) +
> +                 strlen(VMMOUSE_PHYS_NAME_POSTFIX_STR)];
>         char dev_name[128];
>  };
>
> @@ -452,7 +455,8 @@ int vmmouse_init(struct psmouse *psmouse)
>         psmouse->private =3D priv;
>
>         /* Set up and register absolute device */
> -       snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
> +       snprintf(priv->phys, sizeof(priv->phys),
> +                "%s" VMMOUSE_PHYS_NAME_POSTFIX_STR,
>                  psmouse->ps2dev.serio->phys);
>
>         /* Mimic name setup for relative device in psmouse-base.c */

Sorry, I missed the original discussion of this during the
VMware->Broadcom email transition. How about we just use the exact
sizing then like in the v2?

z

