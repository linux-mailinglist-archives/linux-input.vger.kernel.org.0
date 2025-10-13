Return-Path: <linux-input+bounces-15399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 758A3BD36B4
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C88084F2ED0
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCD530AAD8;
	Mon, 13 Oct 2025 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hJTDjea0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB33093C0
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364915; cv=none; b=cGVvwckXag/5BqobdS3OFBJH3IrKBdS/+MTDuAzkkm0k7tGAxzhu9+UccBjfb+xb6o6C9b9czc9pfoZPKRskYpAOVdVW6VY7bbm4TQLKXm01XGrxrK9Ip2RJgM2AHM42cl4iCd1k1E2WQwlr4glmGy3Y1/YYDNqVqt7qgICtpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364915; c=relaxed/simple;
	bh=SRU041Bx6qBndiZAXSPZ90z0DuuZmjP7aN/HQli4PfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTdB/1lNmFYFolj7UhmCJ8OKVHilOzpbqXpSlZ0FAkAblvvJM1OMu2frQl9FD1kW73FlTn4sDql2OO0zQqnASmYYnu0CAaF3OYisnO7w7lAeKfDBrcu3ytKqKenXmuaONgtogTM/NCt/tb3HRgUHrt76SwENZSwDdshOjJmmiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hJTDjea0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57992ba129eso5322335e87.3
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364903; x=1760969703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=hJTDjea0a36grPn3kcoSCf/zYXD+3RASlDVxY+p5b5CiDf7TPAN9eBwKihyN2eTVbH
         GPzdWthqCSRdyY66Pl8L0GKuBcYYtWWYa8W9HVjV/A1ta55l14SL5LtDaNiJvJdtsXmH
         +QJeAEiN5lparA41FYm1fzX3SIaUO+Za6cHwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364903; x=1760969703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=btqgJWa8owACSoqaNinrJ4ybC6F2JeXdCCcTfSg1Q3wOyHRIBfW83lsSZBLLwUpDBd
         EMNzJlexDWVdUI6l3tbqbTxIpSyjgsUq+rRLVXBqimQ/0zluNagCsx6CKgN6yQo8Yoq7
         Sxb79/bkzFofac5gWX9qFxGxNfjJ6l7aYLaTqwXJHytBnTW/2kybBk1N8NoAv5fb8FE5
         Ej/iRYCFDzFV2FrFhfj1ilp7Q2ESDmZkxcd/vVsMar8evZHjdaJXaIXbRNH0Y5e09cRV
         56muVgTm3IdagqLMf2V9IHs8HsYYX06HcaGdT+S23JYR6Z5GaBlrlG0v3CVrTJqXvtTM
         pZtw==
X-Gm-Message-State: AOJu0Yz41+lx3aqJVJrgbfMOcZE5d84ssoZDExkDapiBPfjTYGlQnZpg
	j66fzJtf4tZ0LndDhwUh/qSQwnexpZjQnEycsb+ZU95yrS/0lhpYveteG6a9Ok2Bk+ZUI4eBU7G
	jBXKKdnhv
X-Gm-Gg: ASbGncvjRoYanH6X9ihIC39ikRmuRO/LEMSMXHTb3cNSlUMl7MGc95/pa9rrOoYPhpp
	8qu5mQPNz8Vhd7kdLcGiVjS3b1MPX65wojJZlUf82iwLHIw1NcgDA0yk2B6cPa9hddIz6iXOuCj
	7jNN9t997z1s2fhxj3jL86P001Y6bebE9QgEMtoMnnK/EtPhQTS1WwskZMzl0OiSDGo8K2KEWF6
	AmJCWPhLquxoiE6L+ARp9WNw+mg0tb2w67InczV2aLEYFfB549yPHNhrdaSqQaDSJuxDuM1TLUQ
	lN6gsw8IfN+j/wU5WF1PKKqkxbBpKr6365Ah7ZeydB1upTcOQAR8AWtNkaXaA5AcHc69Mx0aTAp
	2+Ch9D9BYji3blSm0M/mfILFaxioouVyByXI/r53QJSUjIu77t146rYMUmcYYh594vdvyuLFmVF
	3hzKrVEGhvtsckIzYSeg==
X-Google-Smtp-Source: AGHT+IHTiQ/qP/uDKTsRTktboy2tz6+O6QgpLJK8/qSWk5/9SrQl1mdClJ1AYpOXCltPovAllg1/dg==
X-Received: by 2002:a05:6512:3c87:b0:576:89cc:95e3 with SMTP id 2adb3069b0e04-5906dc12458mr6541046e87.10.1760364903311;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:03 +0000
Subject: [PATCH 23/32] media: ipu6: isys: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-23-2c5efbd82952@chromium.org>
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
./pci/intel/ipu6/ipu6-isys-csi2.c:91:22-29: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index d1fece6210ab25de4e8c7b5247f049cc1dd1e677..d858976112ba2bfc2907f9b88dc6c6434053f4a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -87,8 +87,8 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
-			"can't get source pad of %s (%ld)\n",
-			csi2->asd.sd.name, PTR_ERR(src_pad));
+			"can't get source pad of %s (%pe)\n",
+			csi2->asd.sd.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


