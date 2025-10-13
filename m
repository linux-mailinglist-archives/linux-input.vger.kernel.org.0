Return-Path: <linux-input+bounces-15391-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF25BD3644
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A829D189E9A8
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D4D3093A5;
	Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NnY5/nQK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51721307AE9
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364906; cv=none; b=PO/1yLBJYuiQN4YBj9vtg/2+P2/KxfBF7Qsyl9sBNXFlFLytoZDj0wlaPkGxYK1ghNMQi8XVIx/srx5KKhcFNfoHetguGdGpL21JKHFO+wcmPWlMWWqdTMobgxNQ3aFamZ2UdRICEK4yyAb4xMr9qRgFcYc9Z17Q+17PRqY0qfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364906; c=relaxed/simple;
	bh=WDrjkEkP4ilF+TE+CToBnzSz7Z1VpjDMiO15zLgsPrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rncUnIaR2ZPwv84GcGVKAWo0xJV6rehnHvPVhWwP2aHstLiHn5yPEKNjtJvGong5I89XMM1eqnOi7NaulkFmQeIZgzKFM9Lz26/qilIWHk7Ncf9AvGV+6IcGwj68Fvs3NMWE+gFq5ghp3o7kqvX3LwUxpZu8jnU8EBfLuv7Ng2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NnY5/nQK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57a59124323so4619662e87.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364896; x=1760969696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=NnY5/nQK0GQNwo7L3DyKxl5JWRuCtJLmvEwsUp7+d3aHV4XCEECynsTZr/b/GROeEO
         hnbIsFSp/iULr0uwBHswBG8Nm5vDRCmBPbQlDn1mrzCDBjOJvwKGyKaGaGsyZ6Oeqvn9
         j511y1phO7mAR9hy7YJdoMv0+DpC9c8qD4FCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364896; x=1760969696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=FsoEgwX6pTB9U2Ehf5sWe5WrH1OCUQ2XT1uGyOeSQ/IhLIrseU9b+5Y6rP274RCwUL
         oNtqiW6bYkRgIdXsK8teEnGPs/am5PAKVIiJrJMUrHa6qCZxV3b54DnRpXzWecckoM7T
         +ERNMFJMZnTzyG2C/zFYrxSbT1efTOtqFnliUI36L+VM3hY/++2GHPag78ObMKtbxle7
         BVQkcAhoKT0M9XrvgrBH3FT69GRqJU/D7tb2WUhDBlwfbQLxnsZiw0EaaoSG0A3qqV1K
         NLJ30uO3O6ZdIGmxGZhQo0RI0WzhaQgVqHlLY/937HV5qhxErkMDkJaEDaNt77POUMmh
         a8Jg==
X-Gm-Message-State: AOJu0Yy5jVy5zTNItiIDz46gd8CIwRWcaQEtZGTNZk3z5bcbNmYr3OpV
	FXuc3yptlsgP8WY4TbbjJsrw1fr/Lfyf/3cvTkxhawQugUl2/rg4Weev6sYMCw6n0w==
X-Gm-Gg: ASbGncv5c8yTDkf0lAKh9lqKCa09cRiCgKklhACueRNezNgxlUlzwqp8qgh9HvkOAVw
	xhegR/4XP6kFAWib/NRbChoQnLyQX58wGERyFOGSerlEMvaLBe7ek+t5BV4PjGFkQWh3Zr7jRh7
	GuSlP/AYPkq+JnxY68fntBpNqnmE1tJdUPwkgU2b/FB8FhXlIHZQOvApzQoN5E9sOa70KvSybwz
	6C/50KwHCZRkdbraPQnwvrzs0+EL6tVo4XhBcYSNQjLlcJza/Hzx7tUWArZFtVgnfkm9r2f4iBq
	XOshPvh0X7+41Yk02U6+j6wKLWyJlbnWytxGOYYL0bTVcOp1OGamhoLl45VArdPr6njkSy2YT9Z
	2Hftv+LFx91jKyDs2vXpaH5ulETh9Ecx5vQbga+aHkEa/yLl7wvuuaJtnK15CmsNTE4bboe8IMt
	WrBT54TLuNRx7GPazHUQ==
X-Google-Smtp-Source: AGHT+IHRStcb5/UNrBSpVyOQrSmM6wvY4Sq5I8E4EibgafKAtbziLGF8qFxpeqrq8sYvK0QOKhdKZw==
X-Received: by 2002:a05:6512:308d:b0:579:ec3a:ada2 with SMTP id 2adb3069b0e04-5906d7738b2mr6908772e87.4.1760364895693;
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:50 +0000
Subject: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx335->reset_gpio)) {
-		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
-			PTR_ERR(imx335->reset_gpio));
+		dev_err(imx335->dev, "failed to get reset gpio %pe\n",
+			imx335->reset_gpio);
 		return PTR_ERR(imx335->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


