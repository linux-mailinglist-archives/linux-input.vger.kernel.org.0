Return-Path: <linux-input+bounces-15421-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB90BD4D97
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 18:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 029D3348623
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBF230FF28;
	Mon, 13 Oct 2025 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UcUEJhcC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C026FD84
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370972; cv=none; b=ZP8J+tSquOv3LUSBKGbgh5y2h+KVNZ0Tmt57PiZZmfKCv/baetXDNf5S/PDCq01AN9QWgdcp9NGE4lAdEikTyROmdVXj54xKgCKD7Qd7LVQ8b0Tm03O6C6c98qzg1Nbo7pQryr2ZyqxDatmeXiANXMbpalvL8G+ie/ArtEy9ah4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370972; c=relaxed/simple;
	bh=cAB0kIpqj20tM7yHpaFoe3xcfA2AB5cxFaYcvZmpAuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzKWGXnfstDlF8UmkGgd40cfVDooguDLYpbC5b/6YUsRhGV/h6fxaPc8sb1DpLsGyGM2s/ecnI4+JGDlCNZARZ2+ykd0WiSDFher9nQkb/CE6fNiys2Uxe+4cSPYgOiA3/3m0TgtH337wmVkkNoRyGwxHTIO9T20xNCjQN/2HU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UcUEJhcC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so8607613a12.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760370969; x=1760975769; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=UcUEJhcCgZbc+qvln5Mi5muZ31gAWmbGEHc5V/JUlHKiMcY/Y2kqhcaFQy/VZsjYta
         ZFn/DpDe9JaDLGo6D0DiJEic0b2UDdF6/VcDIyV0hhgil5O3xSLrh314mWxRSLs7qm39
         4gOGDqPEUoOsbfm5oVhL9pa2igkzACBCm9LOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370969; x=1760975769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=DkJ0TgOp/PER/VCub2rCQctusCFWQ5TDibh3stqbGsVUGJj2zCvoJ3w5GEvO9Rfn8I
         XIZ+3nAS2GnzxuV2Txjv89Nwr2GjWkz1AkoOZ7LxiV1a+qDKOY6WkJDsW6namlB0Afy4
         FGSajmRP6EPJ/RUVAgkIKj29d12O0JcE1NJYYC6N5q0xI4msdqJPizC4S1NcWpeL2lEa
         kevckYK9NKJGQSx4O1aubt8dr6CEofCv8Hy2UoocaTiv+s9dEthu3pZe4CltpR3vC04C
         aNpa8dh4NLsCPk6oqhea32t5xMPMBwQPryAJe/OEuZj+zWWe6BMyiaB+ZaIrO20T+F4O
         76rg==
X-Forwarded-Encrypted: i=1; AJvYcCVY80O15lr5DnAbuZGlsEPQ8sHBu79DXB/AfZLclGkOnWOw8fxrCgH5lCA5Wpx4jKTXtx60wGXk59gR/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0tLAaTQz5IxFXdArVuNI+gjzsmPQNEowKVPHHlo9kjPPgYqo
	Ba0yWFH/ARoBdrwpPEfgQETCW2YIen4/eKqMryNRmInff6goQ3gfOOpYPzGDbVgnb9k0yGLPNdj
	HMN0j+L+T
X-Gm-Gg: ASbGnctkdcKweKKbZKYyOnia2QWO4E7UlYgEDtBNKq8G5eH3yzcJ7n9N7M6neBUZNyu
	Qw+jBWpgQhfAl3BMBl1qDUrB4RUz3TuPpW7Ebydclkvxep/S/2v/JCAQGxsF5vKCg+NfwTotpqH
	97AvbzvabsvTQMSwAeRppaYUzgSzlRtVD+EpPfTr/0Flpnl0EiskV+yTcHjKM/RpIasjXZ4dpxg
	+b3d28UbGBTnvTGNkdplU6u4IEIynyeUwTJ1hVcPpG6qfZoK49pUOB1GFs9IezvoFROlxExgZC3
	xax5kfSpjEz1T1jeXPF4/InUWuVnATsI8c2Ui0dccSCEUmc1OGpeLb4v6Be0acNHUwB3GLR6pzy
	zb4BPwaPkRF5bNhIH0tmZ3hlT3t+VDfys5Qnc+pqYjMembA8BRNzgDfWGDbbQPlqxYjp3+hBevp
	DSSPU=
X-Google-Smtp-Source: AGHT+IEaMdKquFnGBVzrGkQdoajDDGo5xQcHvkaz5reNnlMeSMFNRwrVjYhZ/6lOvPC3AJqddFZTxA==
X-Received: by 2002:a05:6402:34c8:b0:638:afd9:e96d with SMTP id 4fb4d7f45d1cf-639d5b43b2cmr19141317a12.1.1760370969311;
        Mon, 13 Oct 2025 08:56:09 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c323693sm9299173a12.43.2025.10.13.08.56.08
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:56:09 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-639df8d869fso8231256a12.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 08:56:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIqfKgOkzJCkeEdEcb6bSd939dZ0PVf0gUQRtHDPYaQEhS63zlImeTwey7zN65guyX2wLH6JgmDS/AXw==@vger.kernel.org
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr6030162e87.50.1760370658194; Mon, 13 Oct 2025
 08:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org> <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:50:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
X-Gm-Features: AS18NWAjEedfD0tRDHHy9p2HIYCpNxcTQpn_Xf2f0oNW4TLvTJ881tcLSkxWDmQ
Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Frank

On Mon, 13 Oct 2025 at 17:36, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR()
> >
> > This patch fixes this cocci report:
> > ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/input/touchscreen/cyttsp5.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Suppose it will go though input subsystem intead of media.
> Need post seperated at difference thread?

Indeed, it belongs to input. if there is a v2 I will move it to a
different thread.

Thanks!

>
> Frank
>
> >
> > diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> > index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
> > --- a/drivers/input/touchscreen/cyttsp5.c
> > +++ b/drivers/input/touchscreen/cyttsp5.c
> > @@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
> >
> >       regmap = devm_regmap_init_i2c(client, &config);
> >       if (IS_ERR(regmap)) {
> > -             dev_err(&client->dev, "regmap allocation failed: %ld\n",
> > -                     PTR_ERR(regmap));
> > +             dev_err(&client->dev, "regmap allocation failed: %pe\n",
> > +                     regmap);
> >               return PTR_ERR(regmap);
> >       }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda

