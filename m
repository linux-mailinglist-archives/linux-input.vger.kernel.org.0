Return-Path: <linux-input+bounces-15387-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3471DBD365F
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419243A54D1
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05970257828;
	Mon, 13 Oct 2025 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R6yq3nz7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3342D3A71
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364901; cv=none; b=Qd4EOVW92IkUD4TVyF2m2f6UjKytXAtciuu+rWppJoK9rFiib3HpZ34hMGlFKQepsHtWzD61wya/4z2Cb5ED3D0JxCluUq97NfMTYEmXKe4IUsjo9ckNmkofACNWYYcmFs0Jybvy7TXLoIhP4TPlbdDDB+iBu1EAmLodqRIXi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364901; c=relaxed/simple;
	bh=/L6PKcFgTFzEsGq20C+fAHYn8KGkkVmm5YQquq5Z0Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=byBv09Sp/6LrE6PWWcCe1FZyZJmK5p2WKwQEwcef7IZt/O8lQnsFs14RvS1lBzR4NJfDypjQFKCGewJkstm8ReCLb6gy1+HF5lDFJZS77l+MfAacr437w0NgzNb0zGbVvAe9K2LEyt6t9HREmdsCr0BiFwmzVQT1m9ZpSBW9nLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R6yq3nz7; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59054fc6a45so1057050e87.3
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364893; x=1760969693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9T8mO4GmxU6Sp5lObaHqxq0/smUXIq4FXIudPa6OeB0=;
        b=R6yq3nz7f9fqGCJ0qh+ZB9t2ZFlnNHoGPzkK7FNr2nXORsYaQGAukJ7sqahEtih0Vs
         Prnnhj2mQtrl+E+vZ/9zeg9kRMMSiwG2qGvjqXzin6SA49tVBrM0ck0kMGp4ZG2QqmAE
         jkIy2gR09FGBRe6Gy6vgN0S9rVw1D9vSxoImY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364893; x=1760969693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9T8mO4GmxU6Sp5lObaHqxq0/smUXIq4FXIudPa6OeB0=;
        b=tUTFrrscI3KbQL9PM7/fgAvnaR/r1dRXRGcYNRr0amBnNCw5cpRHxz09LAhq9A4N0Y
         xc2SbBSuxIDFjjmo8o99SQXk+FTQdlTyolQwfMM9K2PGMLgso5qgLhTe0n0wTvg52Ocf
         ijK1slYyr03cFaenDjVHtPOF/S+1MsAwa6YFhrVonZU7HpS1NCDpMmnE9HqC7ZdhFV+u
         bHSvJgmAdi8Jdi9aqtaODK6nxtATN8I+U4EeDgzCxUbVKucqQ6HsUC05tfuINM3tfNyW
         UhBgwvfuIRQUyhf0bKmOVfcPktmqEvT+TcmTshkt+pk2MlT7osZAje969K/6vGUu76Mi
         VNvw==
X-Gm-Message-State: AOJu0Yw2OLmixj9mdslfLfeg76qNOwUuizJnDaay35/X+vaTKWr5uFYx
	vhrNv63x7H09UP0+OvelZ/lJ2Qmb7Bp28BWtSQmmRZhM3uee0Yp4nq3zFAEPNeZ+Dg==
X-Gm-Gg: ASbGncsmCbZ2eOGn203n3nn7mVZEMNBViNPUeIbxuJnPjm9Px+eZz8Fy/bHy4msPUm2
	pt2sqyRnCmf5OxmTkR6EwKza1QeBUU7fVySUPvUNZCfdkwNMy+JmnXnZR5Pd70lU5aakY+JH7HI
	dZV1dkHfKkv0R07YFflmvLDSn2V4GRQbh8QHOGBH6hUDecZMOR3rnXJlug6N9UEwrFlIb2U9FhG
	JK8tvvvjJoFr+fssqFnAlIqiNa6dzvC43E2MqdYZ2U3AlQIFl0Zt0yFbpd5B1ZBu6wukDhD6swu
	S1HqB7xsGR1ixyrRopbAjLt0W4MaYhvWfpdlE9/3uUR4ugsW2cr5lHpMhnZNu2p5JN4cYckNwJr
	KeZaNyzJs3+cji6xC4Lco2dihmf9oVQFOuaRO1N2lZ5T+NQI6Aa9Qr4lTszWGdD2F/jowMD3qKy
	N+knFiU8YzXrIKC2nR3rBUEX5ySw55
X-Google-Smtp-Source: AGHT+IF29XnVuKewIk2Zn4qpOdHSO/Y/bSkdxJ/SAd2VXfC5cMU7PSQseV2CsRuBBvo11GHLWuTn2Q==
X-Received: by 2002:a05:6512:3d14:b0:55f:4633:7b2 with SMTP id 2adb3069b0e04-5906dd73db3mr5724883e87.46.1760364893403;
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:46 +0000
Subject: [PATCH 06/32] media: ccs: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-6-2c5efbd82952@chromium.org>
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
omitting PTR_ERR()

This patch fixes this cocci report:
./i2c/ccs/ccs-core.c:3241:3-10: WARNING: Consider using %pe to print PTR_ERR()
./i2c/ccs/ccs-core.c:3298:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1c889c878abd3aeb1b7a887cff29b5eb864ab057..f8523140784c7120eaf018ffa9e3b43ea12ef72f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3237,8 +3237,8 @@ static int ccs_probe(struct i2c_client *client)
 		dev_info(&client->dev, "no clock defined, continuing...\n");
 		sensor->ext_clk = NULL;
 	} else if (IS_ERR(sensor->ext_clk)) {
-		dev_err(&client->dev, "could not get clock (%ld)\n",
-			PTR_ERR(sensor->ext_clk));
+		dev_err(&client->dev, "could not get clock (%pe)\n",
+			sensor->ext_clk);
 		return -EPROBE_DEFER;
 	}
 
@@ -3294,8 +3294,8 @@ static int ccs_probe(struct i2c_client *client)
 
 	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(sensor->regmap)) {
-		dev_err(&client->dev, "can't initialise CCI (%ld)\n",
-			PTR_ERR(sensor->regmap));
+		dev_err(&client->dev, "can't initialise CCI (%pe)\n",
+			sensor->regmap);
 		return PTR_ERR(sensor->regmap);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


