Return-Path: <linux-input+bounces-15410-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832BBD376A
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCC4F4F2430
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CAB309DCD;
	Mon, 13 Oct 2025 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CWFXNHcu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E72C21C3
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364926; cv=none; b=qgxdC1L5dB27lkatacftNAGTuwtaWlUnViKZuelfa3TncAMBiBaVgfP+VXaxyYpfsFJ10fTt2RdMKvhinxPxDkl6DBuw8He1afpfoQpcH/rjr+LdSu1caGx8IcWJFziLL/0OuMQUz9tFm37QdTIMYmYcy0vuwkc14ANJnfLZqKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364926; c=relaxed/simple;
	bh=13OLz3ayUSOskJ/koG5Yo/gq8bsy35PH0jrjBKE+QnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ibb7F4r7vjgRpKbUUqAs0iPIlyRLeR42mYp5PUifV2/ExKri5Ebg9EXM8wM+KYRz9D2Jv2aE74dVVl88quy2oV2TCbrK6X61yHbkvyOZYsPTeufYJMZmj6etvjVBKh42xPzWOHXwE1XVfLQmhR4Wm8ByWLHaknP6c536oK+WnwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CWFXNHcu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-578ecc56235so3649853e87.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=CWFXNHcueXVWOwcAoVQJ8klxj+nMfw1192cgAlKmEj1N2WvAGAM0ofXrCDOLJv8fKU
         7dEm4tqJk5clyD9k3btKHvw2aKJ8ZDJ3UJAOmMQNTKmtokguSPbxcMO4p04YaaEC11hk
         KQgRH3AZrgSFg8NKTN87vBD8y4VNvhJ/vd0IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=Ant4VyC8VobfIIE7piC2jhBmgC2j/aIay+bz0DC4wztQI8fQ2+GOSLmb6lxIWxuhGv
         cFV9DdrFC11AMPABtFMFZb/PMgPnImrSHqikbWJEv8Ql4WgD8h6pK+6HTe5QOieADuma
         crmr3q7l2e+FrVQdHl2PvfuCcqovGc2iqIBlbJY9Cph7cPTHbx6kn4hx+/EBlVD2iI+w
         RCT2SOSzhWIOmjFNU8yeh7X0sJl219ybyI5QekKj3aaxa5Yog2s5gjGjAQOlvmQEJ4nG
         RGlWd4yw04A0ML3syFLm8vzOGFxRE/2mTm0iuW96gWUXJq5ZXObILvz93FCu4qwkLRDo
         v9nw==
X-Gm-Message-State: AOJu0YzwGINyzpnN9lj1HuBbV6W893KV6hAOmVAXg/0hhZO+nFr8GEpE
	3uNwK+KD0p6VAtMxXYGedJ/RUmEM9XezUS4Y1zW7g9s/uf4p4cOH6/4IGrdnW7LDTA==
X-Gm-Gg: ASbGncton1BX6DXyZalqeJuI/+mJuZrLn8UtLIvrO8wIcmYD9DNDW1rwBb0VoVbtHWX
	auKlVd37bZrYliG9rvZ2pTyeDPRsUQAaFPn1i/6KwamQ2sqcrkl9FWxLXYEebvo9kmYvcTBKAG1
	y0m/Y39RgVALs2rVqJJb8kahaYF6leJVuQYnNsQqGYaVMbF2KOlZClaQQxERT38lNCAPOe/iUCv
	WlbcabeXcvCjek/u+ruirIAs2nNQwRd8dxEJ2Axym6DJqoiEX7YzElpsowMMAPUjjUOyUTeGy70
	+6rtWZZDbU38bQeHI+OAp2w/PrZ5nMPA4Ap0dczpPUa5vxjhFzEuP2za871auUjb2Q8EKwNbHTX
	E2l5+kFGaXUH+XSacTR3AyD3XJKc8bmlyUT3Q1H5V8R8xsWdixcMtcUv6heQDnJi5G1h3shRJK3
	eI/90cpU1sZtoo3axA4w==
X-Google-Smtp-Source: AGHT+IEQsTtyBvH7wA40gxhWBW3oPtbImGl+YQPk0oKm5qusk9oOE9kCkc6erWew+lMrb0jYwU0vow==
X-Received: by 2002:a05:6512:b19:b0:579:8bbb:d61b with SMTP id 2adb3069b0e04-5906dae8e6amr5727710e87.46.1760364907237;
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:10 +0000
Subject: [PATCH 30/32] media: ti: cal Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-30-2c5efbd82952@chromium.org>
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
./platform/ti/cal/cal.c:1111:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/cal/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b644ed890412104887ce3ec32b5024a02a9676c8..3e25ce0c3c3bdce3434d19c416481bd8d8b838f5 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1107,8 +1107,7 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 		return 0;
 	}
 
-	dev_warn(cal->dev, "failed to get ti,camerrx-control: %ld\n",
-		 PTR_ERR(syscon));
+	dev_warn(cal->dev, "failed to get ti,camerrx-control: %pe\n", syscon);
 
 	/*
 	 * Backward DTS compatibility. If syscon entry is not present then

-- 
2.51.0.760.g7b8bcc2412-goog


