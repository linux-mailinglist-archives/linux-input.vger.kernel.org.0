Return-Path: <linux-input+bounces-15422-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD60BD5377
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 18:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CA89546417
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDD130C35C;
	Mon, 13 Oct 2025 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSTFADP3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7A309DC5
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371286; cv=none; b=qlFedH8Uw1Mt6ES6eHsQMTwE9uCs3Mldj2XBZE5b+wF2TmmpHJRKZlNw56oSWvSOrLY1YjEHuF6KXxi8yS6b9B/7O6abHmy7svRpA4kQW8BpDaCMOCy165zE1s+3uzUSX0Tk9SvSBdDeEurtJxoV5ZewAoS+goGGebiPhqzgKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371286; c=relaxed/simple;
	bh=7pmScWeJxb/SA9LfgnIE+RSHfO7kt+ZDsVcv07zsRtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCX8snQtCkcxEL5zcNyJe70PwehA18ee73c1YfiKIVlpc7IVJbTWD7kvdz/lqlr2XFyC2ig/1EKBWhPhuEb8feWc1A2vtfQxta+eum6W8mK0oDf+YPdlvihwHG+qbGYtPEkbasCTYUi3uzkiAMeTr9/uYfi74Ctd+ZMp9nxSM/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSTFADP3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b40f11a1027so785235566b.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760371283; x=1760976083; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=NSTFADP3+2QyrhZwcvohG92A/fLKzgvINVGFEnh4vPePuOdHgVMTmEi9uaGzspZfQE
         ZRz705MBgQ3gClcB5e2pVOeYeUmyveixVdSSzLNpjBvALmMzthfvVs6TC8rOEgYFQXRk
         gPkjVJ0GmI+vkQzoVvpNXmsoRmKOhupMbdV/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371283; x=1760976083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=CLDDNud56V+AZKhDnFaoi3SoWsZ87m2WLx5/ClDpD+osIiSkNCGHC0AclLUs9WMEDl
         u+6O8ZSRKWhS40FjrPEUGr8Q5EXtHlBL1XRhQQKfFcgaJJ1XOIAuzv0vGIDAhkyqoPsP
         ZMxigVhIhuqmwONiaMglTSUYg0O0jpr1UHzlrC5wdbPFF4bnFdYS6v10em5by+bRCUOk
         kxWPKNGIFgnOzmput0mWYKShsV1xuWrsxFaObFvWxSBXaSK89/oCJ/eE9ei+WsK8JV9A
         tF61zQfQcnpo9AbcrumYRlM6ryrRFcCGvJb9J5PhLjiqtF+ozlUcQTObGBG7dU1Uq4+/
         Rn+A==
X-Forwarded-Encrypted: i=1; AJvYcCX24gWagXyoZhsn7lGq/Orx2MTvQJ0BLNpxGejD2khuybBhL9JTTnoCZLCIth+vgUE1vIOIrDtgatN2nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybSNtFJb6x9GYdY1Gq9R7Dc8sWFI9K4WtaT/7thVG4N7VM1Wt2
	l0g7a5vxVN1//FGduLQUqFMqZXeePa+HwuKnx+6FFFag6U/Z7p4hsRaM57leggEyju0B5vyIIIL
	cWeDTz1El
X-Gm-Gg: ASbGncvfixNwgXA5J0nOhrWnoe0fp4dGYEmw0iumoU4zYrC4vj+E29I1ba+zN4BNGvw
	oJr7KHsxJwPb91/zSzdN8DmdlzOSO5iwEEnecKssEAmYao15PMLrirTrEb0F33kspMqG5dNyk7g
	9629GLxdifNCDLRdfOgNXIW0R9+qL0WczrN1ZNdotuDqYLA2P42PoztIfEBp1MSojeDJb4R0/Tw
	9uP/JKDMtBgkUY8rXxbWytAONaegvfOM57B/CTcjdSO9Z+81vIii1u+4r/KId9Dn4VVq8HCTAEG
	hbftPn8nllIz0272nU7a9WM8IA5uZHig6kZhI3+Z2FodnGcziDmZl7rfhOZcoGG2ZdDjA2lpnwR
	U3PjVlm5+vgXkfkuhqmLUpXFo1LA5OTDXdlxHE5DLmrrlTlxH2zCMdugu3KCYP3K2dj0Fzd8D3S
	cyY5w=
X-Google-Smtp-Source: AGHT+IElSiclBG0a+YUZsp8bo3UmAsTyvZpgzkstlzaZZdC5Nu3v/hP6yBc6XQTF/az/EhG8jOTwHw==
X-Received: by 2002:a17:907:809:b0:b45:b078:c534 with SMTP id a640c23a62f3a-b50ac5cf768mr2330537266b.45.1760371283126;
        Mon, 13 Oct 2025 09:01:23 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65d6994sm955722266b.28.2025.10.13.09.01.22
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:01:22 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so815881966b.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 09:01:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYomVpPiSGlHeDdqaE9a7y5ujwbffmOVMTEFJry78ehHaUFj69pz0qTR1gJlpsGjfgKQy5+C5Xjj63Tg==@vger.kernel.org
X-Received: by 2002:ac2:4c50:0:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-5906dc0ff30mr6173104e87.22.1760370964286; Mon, 13 Oct 2025
 08:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org> <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
In-Reply-To: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:55:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
X-Gm-Features: AS18NWCmgLaH0rMvCIhheSPVtWPGKkpbEBd_aB_kzUyM4RaB_yHSiy8sRs-muw0
Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
Subject: Re: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Julien Massot <julien.massot@collabora.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Yong Zhi <yong.zhi@intel.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kieran

On Mon, 13 Oct 2025 at 17:03, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR().
> >
> > This patch fixes this cocci report:
> > ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>
> Ohhh nice. Is this new ? First I've come across it.

It is actually from 2019:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c

I just learned about it because there is a new check in coccinelle :).

It is pretty cool, but you need to be careful to check IS_ERR(ptr)
before doing the printk, otherwise %pe will print the pointer value.

Regards!

>
>
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
> >         imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx335->reset_gpio)) {
> > -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> > -                       PTR_ERR(imx335->reset_gpio));
> > +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> > +                       imx335->reset_gpio);
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> >                 return PTR_ERR(imx335->reset_gpio);
> >         }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda

