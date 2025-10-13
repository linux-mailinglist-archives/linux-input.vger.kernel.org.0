Return-Path: <linux-input+bounces-15384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB6BD3623
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8073C6EBF
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269BF306B3C;
	Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SuAki+bU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D09B271468
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364898; cv=none; b=NuopcGX6lXiFtNtgDRMTcdoW1cjokiK33jqXGy+46AVIM2MFTRM7hl1CmHbcJuuYRvTI5iCZIhYrq0mvve3lY77TDsR8pzDTfEBMXl7bTyU62+6RDVR5QJgVs8qXgqXCHhPmw210EjTZwuo7z3mfMp0hswnkiDx+b5AhiP3x3V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364898; c=relaxed/simple;
	bh=LrtS/QWSh262AIfz0Rm9zWkyxkdrbmKWBb/AyfTa1hs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJ8qU1/OPFHg/81TcrK3390+KPBhpKlvIaHZOdZ0I/lslVtDPVsvhlyPzq3sbjRJVHNIrtzceYpVGg8YNHvl1RCAUN5U8ZOtNSEtH9gTtTgTFBX3/5ramn0VJ5SiYEvD/Lax1XkFn4vvjUYkdCDihS67y8vY+sWkPwc7TUlREEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SuAki+bU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57e03279bfeso5318038e87.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364893; x=1760969693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ytl5LFG4k2lvKI1fHaoSkPXZntuyxjUYygC+V2GNf2w=;
        b=SuAki+bU1+sqx91zjRb8n0EEi+aIjyMjLemVQFqsrIJpCHciqG21hNvV8WEtkcKM+o
         vHvQC2hJ540h5mhQpavdS0PHWmnynxTuPOf15tH8Y2KhQVesWzck+u5y+6Q4YKaQ6BiE
         zbeixceW/BlfyD6aRiAVkeWSPbm7E32Fw4zlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364893; x=1760969693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ytl5LFG4k2lvKI1fHaoSkPXZntuyxjUYygC+V2GNf2w=;
        b=Mkb4bR7dFLLfNVqsSRooYN/6wkij40VtWow0UTL7e9FqhxoU5Ava5ZrgOK/iHXcBs+
         N02WaY8QoGVRWLuHvfs5rdERBeims/VXyItxJvFlQRF8xrsI7+JksmfImPiU2u46yyP0
         FRr+zUCNtjm4U21SW7XrLTObKu3B4WWuko3hJbAQ/ik7rf1dj1Qu2OB1wCw3j2H9dM61
         fU+jQMqOZDvx8Zg+fv8Z4C71N7b43qGdskpDKek5/wNs5fbZ8W3YH/esuf/VtNuv2FnP
         ZPkOktBtVR2nWGYMiDmghv2qDKH7NtBjCA+LEcBdgsHiXwlmfoqHhpcuDg1YiSb/p+qC
         4dKg==
X-Gm-Message-State: AOJu0YxwNhhPCsEBR74Q7uf80SKbZ5J2BTH4hrlC/3NLIj0mk03J9yAP
	3lJZN+cEsHRl1F/rkImNJmNAXSEu2sYLSfyGv+ueGeX6xCNyC4eQCVccduJlR/EuIw==
X-Gm-Gg: ASbGncuTBd079eLmSUbWUlhT25cdbCjSn2QBhoyIcLuU1PsM5/OV2fiZY8Dh/P9Y3gH
	jWwUUOQ9a3rzYJuhig9m/dfaMD+GVwZDdDSUfQlLF+ZOCx0Nm+Z2/pG4fi8tLoPNF2idbValUT6
	byklnOc3Mnisbu1RX0Xh1mY/EIIN7hh6/EiGw7JresKepbwDXutvKgYkVHM1zw3EsRKD4k4liTE
	RCwNfqFijWPrVbPX9e942IFTLwYjYkt4/VgMBkWxWldQyKsJq6zh4SMkGrTu7zTFZhS/LQAQ331
	s2Tgm1XzDCbO7VElZqD4+dEKCUNjoTig9+7utsCKamAs7aUTNgnJ7MXEK8dsyx/g/rVWW6C0bdQ
	oEqWv3qXGanlegCM9InbPqMYFvsnsYQXdHrdA4esSfqYr1v3dE9z+0AISnO3xrkV7XZCnT1gEcH
	0oAQijGpavN+nVOfYVvuFUjAZ9vWWr
X-Google-Smtp-Source: AGHT+IGVVbL5/vtkpaQMJQh0k7ML+5P3f5T7fpLYmv9ZzC8x6SpLBLD8o5pL52MoM0M8VLfq2lDuFQ==
X-Received: by 2002:a05:6512:3d09:b0:571:75c8:43a5 with SMTP id 2adb3069b0e04-5905e1d36demr7120769e87.1.1760364892853;
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:45 +0000
Subject: [PATCH 05/32] media: ar0521: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-5-2c5efbd82952@chromium.org>
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
./i2c/ar0521.c:1113:31-38: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ar0521.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 939bf590d4b2107c6669b83903028744de1c2b30..f156058500e3dce5d7b5b831bf8ec4056e49ad5b 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1109,8 +1109,8 @@ static int ar0521_probe(struct i2c_client *client)
 						ar0521_supply_names[cnt]);
 
 		if (IS_ERR(supply)) {
-			dev_info(dev, "no %s regulator found: %li\n",
-				 ar0521_supply_names[cnt], PTR_ERR(supply));
+			dev_info(dev, "no %s regulator found: %pe\n",
+				 ar0521_supply_names[cnt], supply);
 			return PTR_ERR(supply);
 		}
 		sensor->supplies[cnt] = supply;

-- 
2.51.0.760.g7b8bcc2412-goog


