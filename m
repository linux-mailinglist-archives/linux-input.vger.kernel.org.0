Return-Path: <linux-input+bounces-15404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D6798BD36C0
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C08E34C961
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E21430B50C;
	Mon, 13 Oct 2025 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KBkCTGve"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F123093B6
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364920; cv=none; b=aoSnTYUJR37oM4QqB6bjO3r5G1Xu1ecjFOXnDwtlwL3PzA7wHakH82/yjr1fTHzLXRyb6untdfNbJIdHzgxvFX3puLTwUl49RmSWi7X0qeyLUkeQLopR9FsFw/EVSHqASJvKfVysdSrhmt3IbS0nsw4KZUfc1zAqFrqvjFm3ZgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364920; c=relaxed/simple;
	bh=1KGLnwkNkXZu6CtEdNPModZR1Vc28L95VShr6d6uVXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TobGhWoXNa1jOChKQSX7QkZbsND2cEa+K2Ji5Dn2/tSv7jwZOPEcqM231FnbSl5usU+Gy/M7Mlck47ACx51J6ztFTbef0iHOHVVGlLhv7qPo8+oiAS0hjOp3YMMyoJVUQRPBZ/ygCYgsjANOe+95IewKWGvnwYqPEW+fSNsT9Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KBkCTGve; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5818de29d15so5335623e87.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364902; x=1760969702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=;
        b=KBkCTGveZFTbNnm9yL8Hva2hAVSadFJTVH/gHAix+vxv5DRP/QYgtuQhpzVdIOJXfX
         ASvboVONdg9jucIO1VpkVrKI2Q/4V6STrYUGqayCJSC3eHHhqufyJ5kHA94a+zNwwTk1
         nIZp3GiISQDgZHP8/+k9u/49ZquBxlesRB8bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364902; x=1760969702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=;
        b=lLV5TCF0heCUDHWgyLJY2LFaHH+unieB4mfJCa8r2c3abyKQIY4DGigAX9jI9uPwlv
         xrDqQmPTCQS+fsr9mfLr2T18sNoKrjb0McdcOZkmjW8Bl0h1y6RTD/EifVEXDWgYFP3u
         3WzU3J/jGIlVICRxAzSDe7uZqoZR6+xt/aljgiCHM1VsJOs8q3AgbJzCsV9aHAFu0xGi
         tb8VE96neoeAfaVVWCmciJOR+I9PQ4k7HuDlPioxvPbvYFrajtPrJaCEunmzAGlxqiUm
         MvdTq/n8/Y15ROp4efv23Ecc1D+8M5JC9jMVJeMbHEuI2MKY+l5VVEvun+yEtsIQ5jfx
         kTrA==
X-Gm-Message-State: AOJu0Yx/BfMoJ31O5T6m1bcum/Ov2mhV7d7fGKU6anqkzGTL85QF6nZ7
	1eKBVMLqjCYr/9bs7DldSATddDgJy0dlZRuKAWt63Bze8IlD/ipdvOoo+6raOrkyPg==
X-Gm-Gg: ASbGnctgseDu7jTmuhY7ZVbHFEj+n2iiePBiaRBiM4QNmy+5qfkK4B6+YUSlpfl82PP
	+eozY6Livs4JDn5rk33M2FNvoBsks93PJ+iKsV0EqFBJjMWcsfi4kmEHHa4xogJ1m8ploeg5qEb
	BnP1kb4m4EcjChVv5wqQGV2z1KRvwiPbRFdyPk8xJCkrovs2S4WQPKqnYC1GaQtZsRUouHHbsqX
	dHPRNg2h5+WRvr7C2qo1VKapR53gUV9O8I59ChsIFTUTJO3PFjWaD3QVnnEviLZRcpODma/kCe6
	/be15TZpc/SKz4z+vd4xj3RUGS87X44Sb57f6Onpr9UNmTPq0WuEetBk8lZw+Y28TX4zI+4kKLR
	6JDRUIlJU93grG+IYBl+RplAXjilRQUaEZHdQWuzw6EqFZiqPftRZLmIJ36j4Wylbxrnte8LhjD
	mzyMranMpCVbp67uBMQww73Y12ybjl
X-Google-Smtp-Source: AGHT+IEmYSyu4nHTtG8vRgmb2LccUUeX39k0JKnrkMfDo77UUQwM9CrYH1frfefAQcn5JPDuzUf+OA==
X-Received: by 2002:a05:6512:104b:b0:58b:394:fd4c with SMTP id 2adb3069b0e04-5906dd6fb89mr6060927e87.33.1760364902483;
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:02 +0000
Subject: [PATCH 22/32] media: ipu3-cio2: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-22-2c5efbd82952@chromium.org>
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
./pci/intel/ipu3/ipu3-cio2.c:318:19-26: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index a87f105beb5e267fd450b8a36ef9b0e0ecafc598..986b9afd7cb5b6a07c796b4333f93d427a8c4fbe 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -314,8 +314,8 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 
 	src_pad = media_entity_remote_source_pad_unique(&q->subdev.entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(dev, "can't get source pad of %s (%ld)\n",
-			q->subdev.name, PTR_ERR(src_pad));
+		dev_err(dev, "can't get source pad of %s (%pe)\n",
+			q->subdev.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


