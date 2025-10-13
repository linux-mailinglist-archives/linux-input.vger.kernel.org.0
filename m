Return-Path: <linux-input+bounces-15397-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 653E4BD36BD
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5E934F2D62
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2725A3081BB;
	Mon, 13 Oct 2025 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h/H2RjIx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E9308F2D
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364915; cv=none; b=m6in5k070ZRDiqus7SMS8/CB1i9s2G9xk5T+lWU7QOxvkAUqTG146TF8dFjuOWzm6JMLkcYsCqNf6h9aK7JyMl3AqKRFySFRnZWD/BrPYCflj5+gQ74xTGrDq3IjtDK0aj1OByiUbqzssmv+/MC3FOgqDmPcYXBkwgrfYDQ7krw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364915; c=relaxed/simple;
	bh=JPx0giLNBAPr7LhNStN/lfffepZheYGDJQPhVGzb+6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koOUFGDwtA0MGFYZ6Y5OzW75WCZXPQlNmhr3c4oG5wsePLudUdkEX9En4NvETfAPx1nS1GBAhh8FhgHwSzaNlM75A0D3l+OjMRL12KLXt3RIXoyy3xWPZdUKKOB3pkccb11pfKuswzDWJgWBVQAJtzM5zIygiZ22T1K2AxtkVEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h/H2RjIx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-578ecc56235so3649678e87.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364900; x=1760969700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=;
        b=h/H2RjIxmODKT6pS6/j7HGH0PivvkPqHlFtbwRpzPHaCFPJBX8vAcx4TvobJEg6GW1
         mdMuWCWSyuvLusid4Pq0Z9xn6VnjL214RA3NhDRMvUAoJRteM5ag7EMACNz0ObDyixBh
         Ih40Mwa+8GDJTFMrI0dtajJ0gYzo2p7QiCQXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364900; x=1760969700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=;
        b=kTEiixhy7Jv9KXco3UfFliEV56X+BRj1LrTq/h/KMjrjn4G9chWyuWqeMBHpfLW4iv
         d0hcWtcYHucEcLaFQyZjWD56vjdONxhVi9cr58PIKBTjDYc8iXD98UVO1XMifzpMeKfb
         BKYlPx8ZGU6B14d+j/853TCaaAVt8uEnAeKiMB9Qoj4O2nrnnnfXT8gsRJhwgXECPqjR
         DxAvzGdcKlvT6XKl8LIKqS02YIbgEsRHOAqDCqbTnCu+PzbIZ73Sd/rq72JgkDeCErVW
         ol2jKeD6BcPnP+NyVDbgTgumMFlt+NjC7z/nVYCJTeu207QwjuBgPmv/krU9eGtsQnDQ
         PGNw==
X-Gm-Message-State: AOJu0YymoD8qILM2NZKWMynOzgr2NDj2SnvOnNNAJhxtSIZYwELTp1mr
	fH3vus8XKDaeWHdM6mECItnzXeBMEynnZXLVwx7Nh4SHU9W1hs9dGolC0afvMPXeTQ==
X-Gm-Gg: ASbGnct1ES3aKqhVdFYdhuocRxbjHr2goqf2WTxoDipO/IVacUls38rt+T9E7H4/10x
	BfPrT2CsETB5ArG+jDdZn4AcIHRiifilR8T4d5QsFB0qVECXAnkz0QSlXsgvwLLBIWkjhLOcVZl
	7QHnzXgJhrJIqtzpFWc5CYbPn+R79Dt+TsiekD+EsXv22YtPbwEB24GJ8Vxav10U7t4aHMx/khB
	mcS1/kqFbvN6Wxhi91TU5KtWrEYxC5XSTIOOXsWsK6HelkJ02mxWNMguQ6eyKLC0KTelUg0IPyv
	WH60mX6FE/AHg9fqc5VtpmW/MFcT2bGuQ98Y+LGI18QGLYN7jaxm6ItoJRql0LQ8owRAYlhkS9N
	SCacT4ALRtylkJQtkptYi/cthkZGcqEUqdgCChT/wKONq3d+TeGP67gSCrzv7QWJFfx+crhPF3P
	aWwTmTCezAHy/dXTBFMQ==
X-Google-Smtp-Source: AGHT+IEH9NSSx39JZw7O8X2sLmRDHl36VtDy7qnNgdDgO7X/hYoH/eK9oEmeokNHWwuJqGEVp7ffAA==
X-Received: by 2002:a05:6512:2388:b0:57a:6d7d:dd7b with SMTP id 2adb3069b0e04-5906d773bedmr6254025e87.8.1760364900095;
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:58 +0000
Subject: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
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
./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov9282.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(ov9282->reset_gpio)) {
-		dev_err(ov9282->dev, "failed to get reset gpio %ld",
-			PTR_ERR(ov9282->reset_gpio));
+		dev_err(ov9282->dev, "failed to get reset gpio %pe",
+			ov9282->reset_gpio);
 		return PTR_ERR(ov9282->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


