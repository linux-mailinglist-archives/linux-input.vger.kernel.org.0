Return-Path: <linux-input+bounces-15403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA27BD376E
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00DAA3B39A0
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6B730AD1D;
	Mon, 13 Oct 2025 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oTtzD0MG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184422D321B
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364917; cv=none; b=R6bMjkr3IeBB+5TilSMWjsSwVPp1yIdXvc9krs300tW1F+l67PoOBPBsCOlO1p8rbRSbxwTJEU0ayan+zPFFIIWIasY3zRjfkKQSN5C5T/1o42sybBApcSxzri6nM7ZYad+7uwrhT+UNA6L5qxTleXeNk6ITVh/VutU3oWzGDSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364917; c=relaxed/simple;
	bh=Pr7uYtACvfrJdA0iTcAeWQURuxIqSlR2/8LxrEHEZVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a8ohHw7i5BqUnZ2WeON2Jqz0+h25kc13wDAQT6zCsXdB6qPxJbwtFSusKkGL+Hse5jSUr7WYSbhTE7MyM9eqK+2nQGv4kP3YFKNsNOW/Rup5XWJfS5oto1okyvZvaRlGTHDp+DMP6omjPEMgxBJHswk6G1cuVjjmbFHuxWncaCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oTtzD0MG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso4245558e87.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364902; x=1760969702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xp5+d2aM9HDmwL1D3Ee1aFLEQL7phGBi28Bq8ZC4kWY=;
        b=oTtzD0MGAaFl2nYxEEX+709h/SDmu6So9mFVSNgkbc+0F28FkITOAgAvQGVvbdx/IQ
         fT9uPnXKAu/J8QuRbvs76Tn3A1KPSQuydIB+66Z+OCCZIgVNzpIHasHphxNeTs7avYzd
         UyDjCOuWLi0BmgmCfOehC4e1N9e6vB6ONxWyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364902; x=1760969702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp5+d2aM9HDmwL1D3Ee1aFLEQL7phGBi28Bq8ZC4kWY=;
        b=FkMO278Hg6KbBCOjVMHVfch7fyuy6Gyvdx8O3KHegrJV/hZNzrF59t29LkvGmNZd2w
         Hwd0Xl4iw+qS+IEOZjD18ZFwuTzjIgGDAFT6MhMHeAvPttv1+/WDN7+sTDQ/8skHf64K
         +cjaAjFzAoUxnVRZ0gY8Efkm9m0lgOQMELQcI6ee6N6lBNS2rp1hkYThAVqErOl2Ktnn
         ldQXzYWt1wPaTehsV0066loPp1f7ZGdIaTKNAWVGH/KFHC7KgapVu2D+D22eYXj129xB
         OuQ+kE7YmWUGsH0hyWtbAwyjpqq1IF34eWyfI/me7iUaa8OxjNkIx++GRzzJVx10sT3+
         DFSQ==
X-Gm-Message-State: AOJu0Yyo/3CDPz6MDrUswAp/QS/ltjrJQ9PoVLuuVdPY03dC3az9Ysgi
	ahEbFp75wg3gXSDTNgHKYyADUI/p7HMifsWjrMUkHFNjWz7maSyX5t/Ku4RbDwedJw==
X-Gm-Gg: ASbGncuzfIECBZjCu0hR1+cJJw9byEI5/pUwKAH5gJ0CIcKk5TPNFZU1a/qhEc+2EI0
	+KhaxtGuehHD6o9poX9dUGsPZ3Cl/vRIkwJWvzUnZ6Dre5iv9xA6qZrm41iKvMj7PWdtNvFHkkt
	ymfv6S9MoBRvbagolRcIvElh5WeNlKraoAPmJC6qDwN51Qf1RiQ7D0EgSmEnJQWNJv5iQNHCrsi
	k1KxjZPs6ZuSVay/FFT8IpP/E0HtjkzLsjbwaBgCMFIyMiZuvvtE1cYmxvFVvhwLpUFPrxegv+K
	jYwzamjt59nvTzfJ2Rx0P2rqIzPlgAe82rehA2BjwRWHWG/KQBZEm3AJBWW8kq13l6zZ7M0dH46
	o8/QAci/b0Lt85+i1ycgHJm3FBIUoHjNiJx2uAJ96pkvK24OZFoxuAfzdEVdEb2Zq1sZuHcXSBV
	Yc/T8jM+LE0qAGX7uf5IQ28uJv1i1y
X-Google-Smtp-Source: AGHT+IG5Jbn8AREYVQz4yshVmuRi7HcTs/B5++Cc/GK88THJwh0ZT5hT0MoIErPfPNNX7o2ai5GIJw==
X-Received: by 2002:a05:6512:1389:b0:583:ac7e:4e07 with SMTP id 2adb3069b0e04-5906d89243fmr6542710e87.14.1760364901812;
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:01 +0000
Subject: [PATCH 21/32] media: ipu-bridge: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-21-2c5efbd82952@chromium.org>
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
./pci/intel/ipu-bridge.c:567:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 4e579352ab2c0be656576fa223429432940747d8..153b2f3685b447130b7ddfc2f971ffca8acd68aa 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -563,8 +563,8 @@ static void ipu_bridge_instantiate_vcm_work(struct work_struct *work)
 	vcm_client = i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(adev),
 						   1, &data->board_info);
 	if (IS_ERR(vcm_client)) {
-		dev_err(data->sensor, "Error instantiating VCM client: %ld\n",
-			PTR_ERR(vcm_client));
+		dev_err(data->sensor, "Error instantiating VCM client: %pe\n",
+			vcm_client);
 		goto out_pm_put;
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


