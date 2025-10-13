Return-Path: <linux-input+bounces-15411-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA2BD3753
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A33B94F4092
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E56D3090CE;
	Mon, 13 Oct 2025 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fdZB/LPY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51CF309EEA
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364926; cv=none; b=G3NN6H52yLAtaQ9ctRtpgHKbFw5DG/HwIrB0EqbqTWVaMF39IMqU9Iq+dwLdIE5RViXRH8QP5K8ozU4s1HVgoSNtYpfM6sRXGia8ZLR6YntmEUMBOSueF9mlOz2OowNO53ydeNzhgZch6Bd7NGpJinBw+Yj6CG9pnx17do8uczU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364926; c=relaxed/simple;
	bh=ERfT447rtvaR+wf88k95vj4wStZVfwDMtZt0ytTxV+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lk441wmbqdGAyPuJhv9ji3r8Lp9nPwHxmXdtOD0wH3ok6gPzO3hgf86Fsvl6oikpbC7ETBdBBrCIZD893VrxU7/UFjo1jI3ddtGGGAtM9zix99gsLYZlxD5aowAP8WpsAJv1dVYs62X5blrttABLCki5FZ83IGL3N+T+Jg5C3kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fdZB/LPY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390447e87.3
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364905; x=1760969705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=;
        b=fdZB/LPYDTqAgmoK9RgXWW2qARG7f7n6iOtTFu9JTzlANYl6jP6FkFxkAu9ft2LXvo
         qrtXpiWpao5RWeQ4k1uN+T/HOEdl4PYR06nZRvwkzhuOXNNQmOBSapqlKcNFg+3ggEn3
         ga7E9bDQ+2cwdMofj6s9cOWOxgE18lHLjpyxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364905; x=1760969705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=;
        b=oiOfcShAZXKulXg3zmGdmES66C3ygArWMg8XIRme2JMIrP7DLF0lFwjrjM52JkCFIV
         A1pZoobhSzLd/4bmYYE6qmdrDXRyHeL9/76xMHbWAx0CJCoFl1LG9WcD9I+e9Tx4Fd2s
         /p67GLzx63RnVuk9lUVhzzV2rpjEIJYWoFfsL0Aq2mp/HEnR9ZryFWnFozAQJAE/Bk89
         3KjL9djkcjrN/hHjJqAVIdOjtEeHiW5Sk9wkHzumrdZHyZWmXtHLY5Ifo5GA9zQeJaLE
         VadNTonf/AE9hMBXrrR8EX2c7uKAdiKqKgIojmEaEsZPPBf0C1GiP+TH5ix8P/TdhhNY
         JImQ==
X-Gm-Message-State: AOJu0YyZiazfzzagRuvAQdd2I7ZzQuWsC8dW0ulQno+oS/aMYeoQfn36
	T5xPJRGhGbiBewuLmL/E8DSyLEIb7A/RJmi5KbbAH14L4viXjSzrpv7ZhjD8DfgmHg==
X-Gm-Gg: ASbGnctRvj3y+5zrLlWTtb21t2o8wGRnwNVinHI07a5KeIw/WjR9p3Ghy9X3yVi3AKZ
	qMgvWfi5d9A9FPDuAUeR/LIg8Q9Bl4UMzk/14keyZ981r4DkA08lr/7NxnpmsTqCa8XrF53kq0z
	K1vc9rCMjTu1DpuecQrtII4Q4IahFP6+i+xbbYdduEK0LqPjYtiReNDGofRCHRjkj5x/6IckEln
	WG+m7HD7iwxtPl9kOShnrmZfRogNPvyGozevJwC5a/w5awlyKe8dJtUj0ywN7IjbwO2zISym69T
	SYKOachLdoSxlOWZ0c0QPgnC8cHF4ecgSXzjGooVKqzKltDHFiqEEzVFjvJw3MQzcey4K3qULmT
	L5fgtAhAcsb36PUZ6b8F2IrlJ1fq8m/T5O7upJ/9HtLKLeaSZrx7XmrnO2+UMh71W+P/Meo2gw5
	B1cXWWfK4ZVxaFFHRBpj4iA+kkptMI
X-Google-Smtp-Source: AGHT+IHCybNyNMb0drsyz0aREmcwI4Uni6luvsP458rJiLZIzoW/QcUDGoAA5wmoQMp1unUYu7EgCQ==
X-Received: by 2002:a05:6512:2c06:b0:58a:92cc:581d with SMTP id 2adb3069b0e04-5906dafd171mr5060480e87.50.1760364904884;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:06 +0000
Subject: [PATCH 26/32] media: platform: rzg2l-cru: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-26-2c5efbd82952@chromium.org>
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
./platform/renesas/rzg2l-cru/rzg2l-csi2.c:307:30-37: WARNING: Consider using %pe to print PTR_ERR()
./platform/renesas/rzg2l-cru/rzg2l-csi2.c:726:30-37: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 1520211e74185fea3bca85f36239254f6b4651db..0fbdae280fdc49f963269a4bdaea38ff2e51884e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -303,8 +303,8 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 
 	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
 	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
-			csi2->remote_source->name, PTR_ERR(remote_pad));
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
 
@@ -722,8 +722,8 @@ static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
 	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
-			csi2->remote_source->name, PTR_ERR(remote_pad));
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
 	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,

-- 
2.51.0.760.g7b8bcc2412-goog


