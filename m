Return-Path: <linux-input+bounces-15388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78133BD3648
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C16E189E97A
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1695A2727FE;
	Mon, 13 Oct 2025 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uup3Ks8b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C692F3C31
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364904; cv=none; b=Z3YWqTL+89AUANzbWZUGQdPoizSB/+qg+NHZC70iR2SOU6JE/MtCOrYQI35loA5sXH4sRod6FAxKn3u6lnn3qvTjsga+VoMtyKoFwRAB2Dp+rn1rGzdAG+k5N+2O28OrbCgU1biV+u+OkZRfouDpD30dPLz6uJlQmcMzsTTFh+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364904; c=relaxed/simple;
	bh=v1chswa10XA6p6iwQSk8q4C1sH6EpIjnX5wmdhMAOFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OqdZJTgtJHzFW7ctXYSDQHhEIMQMexDszfU74tZNuDEhFZj+W6db19itWS7LNdU5OSw7vu4m/78mShX5itOT84choZftK0AJMtG9e/j5KyZ+dC5AK3N2B0rFwHnXmgOOHCWdk5C+nsG5KtaKXKkqeGB5OUzWYEOzYrImYAyZMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uup3Ks8b; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-58d29830058so5245343e87.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364894; x=1760969694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=Uup3Ks8bF3JiomVVwUis6g5aliJ8KZSeM381ZCHWw9KOvEoa8LuZfR5uu+jQM6C0kp
         Ucd+55EEHb6ewgpjk3nPBwBdeQhZ78Br4VIHYv/HZpWRgfRXK07ziONu/ithU+HGL7c2
         ugVKe0F97WgDvUIi1qnCejUuXadWhtaO9KlOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364894; x=1760969694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=oJF0qJe0zU61OeL2myYCA5H37a6NFQD8iHygfDbxUG69JuRHDypF0ZeRRKoATGpden
         jxOzyYeRp9RfFDqasiSEq1Ckofk6lueL7kIb2c/9+OJCeYzNamAfp8CxaIFFIdiFXwQp
         JBbPTPyiLgXag3U9vrtP6BtHHVXO3mLSi6TqGgrOWrvGjvsVXQfZJ6uDDF275Ws9cQ8f
         CXPK+IIKvpXfGVYqLS7UOUDY4XAC2JcKXlUOOPbqR+NLBk6Oc4CF7mkeEIEe4JnmX8Hc
         FGc6UtoUQ5DbJV+WHBEWOJowpAiy/0wQ9Wpb1eyfrWfuTAwRkof9T/ccWNAYMMXQBU/2
         JpqQ==
X-Gm-Message-State: AOJu0Yz97dFyopiBC8Pp1scVMvj/Hu2+WDoajieG9K3xBbidp5yn+1TQ
	LpI6lDucL+JQORztc5zQ9lb0PCC+83pFM4M6yqDu+8/BIpJM5+Ws/1L7DHv0xBGTRA==
X-Gm-Gg: ASbGncsRRjdby0ngKn1YrRTJd0E+5dGqUGQskoGw4qh/Oa5ERWgkiKEj+RxB1SxFybk
	od0eXwkWAb49mBhkProjWtS//yX1UNectkMd6OKDBBwoDCALIS9I3yH2e7u5o8JqJzq8sqn9m+Z
	wJ94CfE0TLZylX6oWCRnB/zFa88XuNI3Mm+m5pmw09zSTx8BVgfL9D8jjzN1tfb3v6AkvGvAqn1
	zLTB+gRCXJSrIp5SYjbgWBU+d9dsHnc76TXUierufCagGEOU0b4r74mI0VF4M2tdzEngSFwtKJ9
	JoDNjjj5Cvbe8XJ8duUdmEsid+pYN7jk8wVmC98NpJuEe2oaM3vs5Lvza4+9OFtjsWvYDqa+WhV
	E2wXnhSBYM7TMHsodO0lzkK/ymql+vGLkiJWC8hA18AcTc/0/jlGID2LHLv5qFWIrPwraK3Zzro
	Y8jNIPkmBuzE/XnfU8XA==
X-Google-Smtp-Source: AGHT+IGDBA6vFVbdaAIVk4TqwO+W9UovYsrjETSu90SPXIb8+mEsMg943qVguajtHcsDf6ytgGLF1Q==
X-Received: by 2002:a05:6512:6c3:b0:57e:f60:2327 with SMTP id 2adb3069b0e04-5906dae8090mr6097318e87.49.1760364893949;
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:47 +0000
Subject: [PATCH 07/32] media: i2c: ds90ub913: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-7-2c5efbd82952@chromium.org>
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
./i2c/ds90ub913.c:625:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ds90ub913.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 73150061ea458937ae4ba7a937ea030b0d98bce3..e97e499b04e6c2700d7d433ccb4fdc57ff12b586 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -622,7 +622,7 @@ static int ub913_v4l2_notifier_register(struct ub913_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog


