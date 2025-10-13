Return-Path: <linux-input+bounces-15392-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E0BD36B5
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5A73B90F2
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0C8309DD8;
	Mon, 13 Oct 2025 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XEDSeT2F"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643CD3081B7
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364908; cv=none; b=Ue+wlTcEx3PSR4lS5/K9PtCmbziLjq1MJxRs/qko5fi3nHIdSlqtoRkXt0TWZFHYoH2Ub/3cBL8cT+6/iyjyyVc3LTL5fquIBQWFl9bdPYoxC0FuS2EuB8Aib6bA0B19t2trWaibLqehCyPgkGxC6uJodMEWnzzxF5/TbvBeIFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364908; c=relaxed/simple;
	bh=PoPtHLGESxHSet6DKhSq32L4rnbboY4bB4TsHRSTKBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0dyB/3cqIPRqe9Fcn6nHXLlfnoQ03zMLP/m8W+P9wPbiAlU/f23cIHc5095XtPWTlB1JhJQEd+1B8VVBdy00CKhOd5gB2Q7ayOr/JCH3Kl3b1nHOPCyzgWJRuW4ihPyGOyZKqUVO8VWEamB0kFAj3uCDFJSt9bJgTUla5Om2e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XEDSeT2F; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so4681829e87.1
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364898; x=1760969698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=;
        b=XEDSeT2F4b1hw1txr+gV6rS/DIfjBKvYcomtDjmiUyO3XsaM6alkVnnzztSmS2lcii
         thfDO9/Dy1DHTHohdQ0owiRufRA+ZVIQyS6DByElS1aTBixn4Xs4C/ZfKl7SjW3yr6wM
         cFcxtmKvMJP0UkyDNXKag61cJFndIwpUgI4u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364898; x=1760969698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=;
        b=VhFlYOIuX5nAZxlqoRaHeT+5csoYQ/eSJieI3hXsexrQfUKYTJ/fhRmqwCgvw043Eb
         e0YHpptknjwCKAixamOAINh7fxXASp0wH/THlvzWhw0xXqyxv9k6C33yQaNjGMwULj6G
         5p7SFoMvmjwgk14i82vaj9DNsdXS5/+zH1y621Ekjuh/ElQ2EL9zBbLAs8YNqdO+XLAS
         wirM06RgZDNUF6qGaHYXH955MynNIp7xnyUUX9qz/UWS9RWfwD+SWhtplohTbg0z4JA7
         k78thYcOegeLQ4OGeSsUScWHjYxzi05GBIMrLa99qRLS+GO+7vOs13x4gkp/6t2MN5y/
         mU2Q==
X-Gm-Message-State: AOJu0YzeUz/6iXwUivRbPRtGGZqmNvBRBV/cUDJPUB17o+WJuiZsi38o
	ynRp0sgpKii8wNqiT4WJAgg03rnWHcqZ0yOY6JRltMpqftKUL/8Hs+L2txkANM/TZA==
X-Gm-Gg: ASbGncuhGRDV9r7f93p5IzKeIkiS7cWnjxQRPxlXrha3gJzCq1qzfSiqnlgoD2H1sph
	omd9j+xKNvu9QrDCmlMZcK/rjq6olLojnX13m5sm4scFJ6Kg87WieD3Yp9ovWFXK0ImnEqoVcYx
	3SWkoOGneiKxksJQ8lf3/9g2A9IrUzpmYX+ooVStAjGlMG1ApsIbsl1l5WA0nBIcFqKLJreWLyA
	y7HOjgMlD5XwtXDC8WTArSPHdni2p5Q0As751iD69TM0In3NmWx+uRi9n/ch7jN+PJdssiV4aew
	l6HOrc5OteKrmJa7DMDiV9HQPGKPKCG4txIpoNHnEwuJDLspbt760Pif/Sb8Jv8hLY+k2zcWlFT
	gohMqPjKLx2NH5IJCwa9vHzoI54YCmeyg+YrC9Xr48pCh8D4sMrAiUd9vS0LvbMLjBwBnWdtMp4
	cwOte8KYuaD6qnYiPZzfOqBG0SPJO5
X-Google-Smtp-Source: AGHT+IHydw0CVPv6HxiK0rxt7/F7rhhFXqFXXsY7vFrPuGUIbADwLidmgxRKInXX5MSWX37dI8vbkg==
X-Received: by 2002:a05:6512:3d17:b0:57d:9f0b:fd4b with SMTP id 2adb3069b0e04-5906db0ccd1mr6079921e87.6.1760364897595;
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:53 +0000
Subject: [PATCH 13/32] media: i2c: max96717: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-13-2c5efbd82952@chromium.org>
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
./i2c/max96717.c:653:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max96717.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index c8ae7890d9fa87a78084df1f3be631004acbf57b..71ec4fdb8e3d96dddc23ab090a63b23b1d093fd4 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -650,7 +650,7 @@ static int max96717_v4l2_notifier_register(struct max96717_priv *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog


