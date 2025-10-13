Return-Path: <linux-input+bounces-15393-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D7BD3656
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43AA634C8F7
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F11E309EE1;
	Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I21vI3yq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691013081BA
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364908; cv=none; b=jKd2ueObxde0lo4hHOpLtjsUf65qXXcAoYm+5agPXTUJCR2BKFhGCq69BIkX9gjlrBIfAjVXIVqe8mY/xd+MfkP5PFlI7s3lE7gxSAMBWYVWfjcWNHeKR6wLweelYu1jXw3UuC+X1pOyACbt0Dckyfv7tihvVpjLD7Sb/FV51zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364908; c=relaxed/simple;
	bh=cjTbphg5ydQRNNF0zGsMKQ9PfRKUomJXS0y++m9uD5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPJ2hepohtpZjZoQAd3aSMF4IcICA9ueJh/80IF21EFwzJcaSlwiV8SXVCoixM2IB4BybUmAz4BfhM3Wmca9dGNup4ETdlkhDNFgK6lj3qw6P+aiXC+4woOikCJY+5q/1DGeng8P2QUdzEEtZ21xBw0rNLQ982fkDs3/5Vvyvgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I21vI3yq; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-58d29830058so5245399e87.0
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364897; x=1760969697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx2Nk8bbTBBYhN943GhcMzv342eYq6Mo/xpbKyZ7/rI=;
        b=I21vI3yqWJ+gtAKtphPU+0JVrvViANfW5mf7L1y2jKwRfe8+LAbSDJdgyax9+zc1X3
         aYbxt50wlnvFbEXRcU6PpMxCoTQ3zjnfvkapF1fDFUvXKG7Do/kyA0UDAB6LY7php88G
         iLoxBG/lO3qezExPedC2mANEKRhnDJjks4JFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364897; x=1760969697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gx2Nk8bbTBBYhN943GhcMzv342eYq6Mo/xpbKyZ7/rI=;
        b=ovTKr2SGeOiCeBVtb53ueCfpe1/x557QWvIDrLc2sz+ia7oSAeIYlBIg+DCCcpyCbT
         M05aWmHlk0pZYoiroI9icxtHbxyn66EkgAvBqn2iWZcT3VlaroKU4Keib+IjqeycJ1T+
         pF+vepzi+xBJvXOvkEzzt/FhLYAxcpxpzKNFnAt5iZfGNVl55769r3t6/3tQkr5R2PCE
         Zr/Bql18pd3FS2/lkQz53lzWlD0PxnLT/rcLLOh+p1M5IPgreDhfynXTbv6snROr7SLr
         49Dm0C8S/rE5W1NYpaCmSw+dPj2wldUvjiqyw63XIEdvL8FYcJqzFeyFcnx99Ma51hgE
         y/jA==
X-Gm-Message-State: AOJu0YzrcIzswssuI5gXuOSsVzov9Mu2/6ax9RqeKOAuVEOYFzfwbpR0
	Ws0TikBXPAxNrPtoxSYJ+TGwRozdZ1SF1scbX7+N6CJB3hRzksIAqsWpJTpAQ07GMg==
X-Gm-Gg: ASbGncsYxt6ibRUJscVF8hbQ9JqnUePw4C+nwyPO4ZkpD0/BsN55meqf9GBVdqkOAI4
	4lJApsbZ/+Qq4yk5Wm4GxINvXpoTRZpgTJZKLkheDyfQjXV4DeKbq/mOoLoeSkQ8VIsAJXA1Xgt
	jKHZbt2WmNIL1Ix52Z9zifKsme2I910GtSQ2P1hwHKZXfYtK+ozjWZVbI4DWQ0vM9sn99++5p/W
	UkieJWrTcBu68P5EBuu/Js0jYpJApEvcPVF+cNISOR1StLV9dEi0oMKCacO9tjU3kAHr1qr/Gww
	cv3PApuZBn2MAZKAbVj5nDbtTBIv6bHsiEyzGV660i2+egl4t4WHCnVUClVAMyRrcef4URcVsjg
	01wBiiO4rFaneHJyYvSip+lgdkg/QTBUBqLF2atVGQLVw7j90vbnGE2N7y+esNt6Q4K25kSOaG5
	JOMiXYg6ariu8FX699BJkIs+dtZepeTmttDlUoDoE=
X-Google-Smtp-Source: AGHT+IGza3WB72u87Qc/jc2dtqKhHQX3673S999Ht+Uo4ar3zMBnJvEIFFWeIrwIdWwBJ84BunwKvw==
X-Received: by 2002:ac2:4c45:0:b0:57e:9865:d6a5 with SMTP id 2adb3069b0e04-5906d9e7318mr6028332e87.40.1760364896522;
        Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:51 +0000
Subject: [PATCH 11/32] media: i2c: imx412: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
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
./i2c/imx412.c:931:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx412.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 7bbd639a9ddfa7fa76d3a4594be1e1c4d002c98a..b3826f80354703b17b416dc233854da3f5736e38 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -927,8 +927,8 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx412->reset_gpio)) {
-		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
-			PTR_ERR(imx412->reset_gpio));
+		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
+			imx412->reset_gpio);
 		return PTR_ERR(imx412->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


