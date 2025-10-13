Return-Path: <linux-input+bounces-15383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05282BD3629
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65EC63C62CE
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F71257827;
	Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EcCgmV32"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE526E708
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364898; cv=none; b=P8CQpmBHxWr0KrIX21Ao+Ta2XFfeQuEiEzOKjG0bAKFsukp+WyFS5lVSsFbRviOydWrApRP+Wdk4FPbw6MPVOxlG66elE/vyAt9NGki/ZHFiKianfiwoYhiOhhDRTvrBjaM6n4sDQpy5I5uyCv7JpiR73WpwHVGoMd1pwpxAWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364898; c=relaxed/simple;
	bh=EWbKp6zVXKla0AyI4Ib0EFYpCMHe2Dydv7j+omIlI14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOvT9TkGgbmlQGj5LwiHYCMintV8sDT7/aWcHbfqkZHvYU+irrqnhT+Tl+6E7fd0BYqIoMrhj56TjEDAPdB62JwYDrvhcY7F2ofaQT0YyoLuBl5MhzmKNpwS2k4imI9Y3ClCeglNbKJKPwJWlCwrWSrwid8Nd/UvGgyiVtx7YCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EcCgmV32; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso1150006e87.1
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364892; x=1760969692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDkvCYuJbKI5HTEwyE65VkdYWfgRYyc1U+blXUUQVgU=;
        b=EcCgmV32a0HZiXFDs48CmHwrDNUra3ZYW+Wy+oy/Ht6eVil+Ec7Zv9cYLEC7SJv8qJ
         KBkiBXHRv+q2REcjasnsufbfhFeNofaCaBBDW0Bz88I4hUS4OHj7oV79TNdL9TyDv/e0
         c38ZPmus3+8/WQGqx3zZAj1FGQbEZZdxpfzoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364892; x=1760969692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDkvCYuJbKI5HTEwyE65VkdYWfgRYyc1U+blXUUQVgU=;
        b=o91fJ7lII1RlKZ48aAjFcIW9sFNDMWxZNggtxe2+drDD/cuTyF5oyoA/sFyCjFps1g
         wT+8PnRw6VHvgDPE2kmmIVsbiTzxmCv2+E9S3uZq+e+zDKClEk8wkHFFlFGPUpAONptV
         EINBktDorNCKJ5/TglrwVClZuWFzz8bGDS0YdNc6QgeiXI1YJVcgRr0Aiv77p6TP+/Zm
         xxGX/VN50KC6KnR7lrZyh0jeq/ddQw/N541hg6h1a3A2oVoIuzmSBABaENHkqzp/XLDu
         8WMGs+bzPPxedhZlUT8M5JROzocwMe/KQmS+m8m7rLOpaC+zVzMhygEuCYpsg5il39xi
         K3pQ==
X-Gm-Message-State: AOJu0YwyE4kFnxWTStDonRcGQsIrJEdEHM4P4K4PHueK6OuGO+l6TMhQ
	K/s5L3V9LaSf0EYUQPDTPe1RRKGMNe6WgsodkhqlYyHemXeuFH0iHElzat6Ughwc9w==
X-Gm-Gg: ASbGncucxDvoRfzb9nsByjBnL/18b4mA0j7Qzb1aL74KkhEz0EUAKnw6zN0HcpoS41f
	FJHSCWzP5MmyP6ZaYyWfxKkaP1cIBXkXWWDwyDOPCT02DXLqlvM20UdWihs9nwrbG+s3o/Pu+vA
	6tvs+YVvt60BYva/1pGPcU+1EVdBzW0VdaFe3GADVGrfRjWpyzJRja3OXEgFcHkmnd/TPVuXVL8
	88VxQTjLcJM39xOOT9uwDYL8WncOpcoyy18X2SBoyVwRjM7lgT3kC5uX47SUkeWSy52VqYlURHj
	xtz6nNlXqmtqfrrsoD8ky43oyKDFy5GHqJc4zJWEO8Tia/wqA8jBEb2Y9v/e62haplc05VHQsDh
	BlO5+VxpTlQe8+cAADZXmb7KniHbZGBkyo+9ohHuD6U8zjjIqmwXyxY0bt1Mr3NJeg2/xX7IS88
	4hFajRX3O1QghjDNy5NQ==
X-Google-Smtp-Source: AGHT+IERp0UGzsms3m0FKqLtDNsdKrYzy/yeu64vwUTfcVOJBQFfqT4aKP9avdaubkT+3l9KavisJQ==
X-Received: by 2002:a05:6512:6192:b0:579:f4b3:bc3c with SMTP id 2adb3069b0e04-5906de86e2fmr5500248e87.55.1760364892337;
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:44 +0000
Subject: [PATCH 04/32] media: adv7842: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-4-2c5efbd82952@chromium.org>
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
./i2c/adv7842.c:3470:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7842.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 9780082db8415a3d65860666d0dce8399f57e4e3..a35077178a0950090369e17b4aaf9904da041a00 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3466,8 +3466,8 @@ static struct i2c_client *adv7842_dummy_client(struct v4l2_subdev *sd, const cha
 
 	cp = i2c_new_dummy_device(client->adapter, io_read(sd, io_reg) >> 1);
 	if (IS_ERR(cp)) {
-		v4l2_err(sd, "register %s on i2c addr 0x%x failed with %ld\n",
-			 desc, addr, PTR_ERR(cp));
+		v4l2_err(sd, "register %s on i2c addr 0x%x failed with %pe\n",
+			 desc, addr, cp);
 		cp = NULL;
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


