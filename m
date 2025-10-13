Return-Path: <linux-input+bounces-15400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973BBD36C6
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 521DF4F2C91
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2969D30ACFD;
	Mon, 13 Oct 2025 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ab6j/PZC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8A9308F1A
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364916; cv=none; b=ALgH3zsH123wcrQf31GGx2xFmx8MZWGreChsV1fAf2mNrFDE+wBfPAKhS7IOO9rjh8PEYevHcNWBTSVyy/7xCcwUTvFjTrhG9wsrJiXThYNuZef0MO3uwLTKXkSGG8OZcmr5Vua4VdwXtcAV3SGGXkl8oiyBZUJ2YTkGOBmHdQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364916; c=relaxed/simple;
	bh=nBAqAoz5fuJ6xQXtbwYZsAnoOFC+ZH9eAjSHPSKxyx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbbUBFSnnqkKM5384yeqYonu3F6vyianKc/APGPlDGY/zzn8G+gX9j6VfwLYXeRUyT4xWgFyvqyTbYgqKtvMkwpt3YFnS6o/VI5T5V9do+PaKHdUlafKbbShjyV6JwxSv2OIvIW0bq6b4IrIUFcHkb5+rN8Ik3EIgMPiQi7OEME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ab6j/PZC; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-367874aeeacso45354981fa.1
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364900; x=1760969700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWalVF0nnSBnNQ4jdDd+P85V6zyjZ9PX8Y+NqBliTWQ=;
        b=ab6j/PZCEZRQoZ+SfvDUsC4WrKz+6HQ+bkqjamVf74uQ+VytlVxom1T1xTuFaN+6mW
         7dHoCSH7YG3nJ4dqstQH8mghCi7UiUQmmBk9juCC7X2jDonpt1b5KasdxEWWX8YfbSB8
         fJM9PF6xMnub/BTW3VcVFebI1ybLhwK/beBvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364900; x=1760969700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWalVF0nnSBnNQ4jdDd+P85V6zyjZ9PX8Y+NqBliTWQ=;
        b=mrPym637cuy9QKmgFujPQ8bkxu9RtG+++LRvxTO4S36S0n+x1l5XYJD18mY75H/0eL
         z3CnyO712+xLNAFaodRwdr6nHzERF2hVYqPZ8IVu8dmA123wroxdAEEqxiFnDAABNhg+
         pVI0mnV1DpGVwtUpZgPIfhQNtHHchxFFR/UrOUtZfZ2klPClcEn7FcrUobZAWy+u1/gd
         CQ2LgXqi6nNvBODwEThg9UkIfN3OFHKUUFls3Tc1cWDgSFZW7gzxlhOx3IFFyFFgAdjf
         Wk/Ra28yWoclsdO3OtxPS1qSLGsEuG9MNleeT0QPxoenuwMKFvBcnGc/Hk+6VWjjZQp1
         CGxg==
X-Gm-Message-State: AOJu0YyLwu2YMPlK9MGyFQAfKNHYXp5z9yXoDaT82sAMi0I9svVh4w8r
	ovwGhD8qHkh0KInIUUTzlPwSMcXYiAmUXzj1tQO+k9TaJCisRedcFhdQn2E34N7pLw==
X-Gm-Gg: ASbGncshFDUien0U5kX7OJUnA+ZH/7MKqW+HMfVEdardskwjro7ROA6KS+ZPE6M4k5A
	Blf2D2jzOHrLEOHUbqG71uPpVQRzoOQfmNUE1C6eK7tI4I5UZV0/LZ9A7ViMKaZdE+bk4igzapS
	J5zUCgIdmwmEF98wLx5V388nS9RmieGU/Yus58wu1Foi11iK83byGFpJnJHW1JJonl7MUTyGrpF
	By69CSGDToEbvUJJJPXomaf6CXLgRkMpnchpSuunLvTyBrzYxXvCvXFUZEv3160RKf8aIaj/EC/
	ehNCDniQbfyIXU00LIZnECzXmoQr7UqpreZTMN6lMpdaFoEk8GppJ3yxVl3hp+6OJBt8JftqEga
	3FptsVv7pe+TTUtHKxP48uDcys95IncIvqgOoQwguVw5u4ZdexKWIUlg4qnG0/aWauzMHhEqU8r
	rywvHJFyd2iOGCEj9jEQ==
X-Google-Smtp-Source: AGHT+IGPZ0GBnGH+/De00vLY51zTi7j6Ya9EGY1cvcSTJfIjXM0TP8WRpiQmjBMOUob4MSX3WpygTw==
X-Received: by 2002:a05:6512:a91:b0:58a:f865:d7a4 with SMTP id 2adb3069b0e04-5906d5da909mr5473662e87.0.1760364899579;
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:57 +0000
Subject: [PATCH 17/32] media: i2c: ov5693: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-17-2c5efbd82952@chromium.org>
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
./i2c/ov5693.c:1296:9-16: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5693.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index d294477f9dd30704d2e43a0ed3e222aff3af365f..4cc796bbee9263c032384d8327961b5cee52b9e7 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1292,8 +1292,8 @@ static int ov5693_probe(struct i2c_client *client)
 	ov5693->xvclk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
 	if (IS_ERR(ov5693->xvclk))
 		return dev_err_probe(&client->dev, PTR_ERR(ov5693->xvclk),
-				     "failed to get xvclk: %ld\n",
-				     PTR_ERR(ov5693->xvclk));
+				     "failed to get xvclk: %pe\n",
+				     ov5693->xvclk);
 
 	xvclk_rate = clk_get_rate(ov5693->xvclk);
 	if (xvclk_rate != OV5693_XVCLK_FREQ)

-- 
2.51.0.760.g7b8bcc2412-goog


