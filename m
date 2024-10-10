Return-Path: <linux-input+bounces-7277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A23999474
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE9061F246F1
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99871EF081;
	Thu, 10 Oct 2024 21:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpdRHmy5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA801EBFFC;
	Thu, 10 Oct 2024 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595584; cv=none; b=DmFZnWObqmE2JSF3OvgiPIaAcDcdF2Q+lJ6Hiljthc7pn5eMSVqGfzDTzO3Q/WSqE414iBPUOZ2ir8PILDzghptVvtHqTOl81/7VoJKkPWYsvQVG1fU69F4jI9LXh5WTdUHp8yvTAWM/CB48MktF5HFmS2a9QugND4O5y/4m6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595584; c=relaxed/simple;
	bh=4o2z0ObAz6CPUNa+/NOKjLjAT/4Z8Sf5d/THzPhhJlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u0ocQTSzuCUQHfJHj2L5qRdA5+0igEI0HsPt0xP2cT46mC15CtfR3mlGb9xHTUeeVkQZ7TuIvkXW19eIOCNQuYTdTNF0N/cN+hgmVNgC0gNrdOQ+0/Su4BL3HWwl3ANb1jHiiBYwo9zWZaUH6lzrTd8Ghxbvgq8e3Rgs0pGMaZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpdRHmy5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so940252f8f.2;
        Thu, 10 Oct 2024 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595582; x=1729200382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+l713dFhBMpKSXKC6Fm7N/NzG3LTu7+MrLDSBO7iRI=;
        b=OpdRHmy5xmk3AxG++h4tuYt7KM5dRDWy9PSYglr6GfBvfE+YKk1JGcWIpKJZvefLFD
         /7GlhwvYaXash26WBbkmCCL2+moORTx4gD4fj6BqD8vueU7XRga4Qs37QTnhcqXYTWaU
         cPbA5ZG5YS5j0qwNC+78tCoSd6ThnPTpkkBld1gLnExhpgd8tkWc0jRBz1+UWTxJ+r9+
         eQ0F9rbZlRIr2Y+ykC5H+9vJ1yhFViLhbmo5ibleSOsmmS2nW7/p29zJ0393RXFKPlXO
         YrRB7ixxslXbWZhfGh0SUkI52Wy22PVwd3wuN2H+a8J+ynGwRcggOZq9SrOgNVqQ3lvg
         71lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595582; x=1729200382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+l713dFhBMpKSXKC6Fm7N/NzG3LTu7+MrLDSBO7iRI=;
        b=LMSQz2ErAjDkO/UbEKQ2HdGQuaIaJOJts1Y3mJPrO+UQ4RheD/R1zzBnxvkUFdrwvF
         zn+EqY9hoZ8KESajdpKwhWJAau5GdDqI+e59XD8I0IG4rUF5Zfn9jFtTTNK0w5J4TDyS
         u0SWIdVTPLuGNLTF1WEzNHUtvrP6pERUyasJTwXLRKqyYy3K5LhrNi80OWPkX0cN/bSA
         CefvRBxY65IEs8REILEEaoM2dmA+4XhxX2GSlukW/r2o3SKmd57ToMfGSQSG5LTumffH
         EARMJ8kWKcGknM3wogxWAl/Q1trhSt9iDSmYAesIR1qW2WaVGmRK+/vilRr7e2sjB31R
         Ribw==
X-Forwarded-Encrypted: i=1; AJvYcCUmn8b7LTM2t5S6F1CHgBCL5mqzW1TI3ASs8DPeu1KDePppNvGO79KqqLU85sYNqEu0vmeo4/Xe9IlBCEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQg0PsDLfIeGgUws7PUH/sw9KJ2aXuYhswHVjaDJuZWiPGaSW/
	4h1Cd8zG8R0zy8zAgUUMZHEDyl1b21pqDFppBKGMkIKHzcREvH4k
X-Google-Smtp-Source: AGHT+IEvJZkGPBj6pO8V1hiWxBTo3gFi3FsJ4y5Lja3Q/V2mIy4xGoBh/d2/6Gut5mAv35qY3Oj9lw==
X-Received: by 2002:a05:6000:1a8b:b0:37d:511b:aec1 with SMTP id ffacd0b85a97d-37d552adfacmr460647f8f.45.1728595581715;
        Thu, 10 Oct 2024 14:26:21 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:20 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:26:00 +0200
Subject: [PATCH 10/10] Input: ts4800-ts - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1226;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4o2z0ObAz6CPUNa+/NOKjLjAT/4Z8Sf5d/THzPhhJlQ=;
 b=8IHDkQJt0RQQZ7gzCWiCDhKjk3wcdMT+YxA0O1TzbbCR57WziNB1Lx4QOqe5AQsAbp1tPpiZm
 2LS//T4sNttBUuMfU0lGBv8RZk6/sRz5DdGS4tJGsn+V5T2XSOKEf+C
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/ts4800-ts.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ts4800-ts.c b/drivers/input/touchscreen/ts4800-ts.c
index 6cf66aadc10e..98422d1e80d6 100644
--- a/drivers/input/touchscreen/ts4800-ts.c
+++ b/drivers/input/touchscreen/ts4800-ts.c
@@ -110,18 +110,17 @@ static int ts4800_parse_dt(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *syscon_np;
 	u32 reg, bit;
 	int error;
 
-	syscon_np = of_parse_phandle(np, "syscon", 0);
+	struct device_node *syscon_np __free(device_node) =
+		of_parse_phandle(np, "syscon", 0);
 	if (!syscon_np) {
 		dev_err(dev, "no syscon property\n");
 		return -ENODEV;
 	}
 
 	ts->regmap = syscon_node_to_regmap(syscon_np);
-	of_node_put(syscon_np);
 	if (IS_ERR(ts->regmap)) {
 		dev_err(dev, "cannot get parent's regmap\n");
 		return PTR_ERR(ts->regmap);

-- 
2.43.0


