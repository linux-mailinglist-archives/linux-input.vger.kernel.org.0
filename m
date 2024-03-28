Return-Path: <linux-input+bounces-2540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D322E88CE5A
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 21:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B4011F815B8
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 20:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536CE13D88B;
	Tue, 26 Mar 2024 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EXWV5E51"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAFA13D61C
	for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 20:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484647; cv=none; b=Gs39T2fKUVzH4lkend1LUaffsN2hxOU9isDxdrmwERHgH1IWKPAkx0us+k0B8tlfPvC5Zczz+AZ14bqLqGZeEEByr+v1PHzQJPXH6fwuaHLbLbo/TyYnKg+CghilE4B+yASbFJ4dlTvExDijfYhOjxUIOeHto/iCAjDSLkf5XEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484647; c=relaxed/simple;
	bh=E6oiCUv77bElbjGq0w2fujcqFTlKT8NL9bDH7uHNcnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJcrRrV44H62KgnFo/raTaVWVC/wuz2mAFnacy46c1B3kJLKIuUpGGQrNojCaoPL50oZRtRZDOteUK9lHX9wpgGM1Sqo6NNAVhNkBMTqkmK8HDr3ykauon5rEC8qeRJ2tryjDAdJOZNWcXhFlON3GwAvzTeyVBETom8UfVZ9WZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EXWV5E51; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a46a7208eedso818133466b.0
        for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484643; x=1712089443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oszJq80lB2gEh9lWeE9ItwyQq2sVQmw5suR14elTxRc=;
        b=EXWV5E51SySBcB2JoGemy43ozFm7ZIiIIa/WK/YmUszSr/DugKsmbAK6dCfPGwI9nI
         lSPEDi3X9NTB8ylOkneMyCsOIdVmM1z9uCZ8QYsIWc32Wfe3UrO0yfSjBvbxoblGX4ZV
         WuZ0ZKHa4WglucPzlApmcI5L2MAU0oVUI8hA6nP1p048yMPxBGTiqBAxXlkxN2471v6g
         eMcAd5PfR1UaIgMLsz7n5RVhp5U0PMVxWfb2C/B0RaPT+oar6PZnGwCvoLEBgraD5OJ9
         +C6un5vqy840rqg83IZqiE/5ipTuSgiFnG6Rgxp1Scp8F+ne19QiVLGhWqIyC33qLqDU
         lrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484643; x=1712089443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oszJq80lB2gEh9lWeE9ItwyQq2sVQmw5suR14elTxRc=;
        b=vgPA1bgIxYOQWYW1Jya7i0iHzmVfC/M/X9bc3OiblhHQE35aD0ald85R3hyl+aUcz+
         2cwZ8C+6yAmuu2NUC1UhPLdM5dn9/O9tx4PpBERI1lR57uKF1bsVD4SpnPuP49g7HZQY
         eBeRRVGjcRXMUl+iR+3qi7OYaAr7iQt8kVxxnEFxthreYk3+kc9Jnd2zx4HZF+CC/C5m
         kbXTzNJFKdf/ELocvJ/oEPn51jWkezEu7u7u0o3rdQOGSbzwMS7Zoans7dpfzwZ+DGI3
         rLH1my7ktBMyeD2NnybhfwKRrRJ73kak8JU9K9z8qrNvSBYEfu7maIJ8H4IQ6dd96arD
         de8g==
X-Forwarded-Encrypted: i=1; AJvYcCXUeDQKAfaqwx6PXozCaz4ev/y5lbtGTafMl6KCyybAZdSR4fLPMihMKTVU7KmK6uw8T9h7qqwpIIKTq2+XJbf5ub15qB6ZvOWIHBM=
X-Gm-Message-State: AOJu0Ywa6odfuAjsVFVtneE9svXCLtnsSBvWTc54QJPTUFOSttCQwx8n
	B9MN9CuojC9oqIvo2HYSj3OddnD0yLaLQMMcCKniDRVZ5j/kKT11QKl9TC8SgaA=
X-Google-Smtp-Source: AGHT+IF36ebGHdThhaXtGqM/m8jr3LdkOo+O0duXrjQ1dCCzQHRrHj2gdSWK7PhOmV9feIMSlJ3TuQ==
X-Received: by 2002:a17:906:169a:b0:a4d:f406:259e with SMTP id s26-20020a170906169a00b00a4df406259emr1568712ejd.1.1711484643350;
        Tue, 26 Mar 2024 13:24:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:32 +0100
Subject: [PATCH 02/19] coresight: cti: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-2-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-input@vger.kernel.org, kvm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=E6oiCUv77bElbjGq0w2fujcqFTlKT8NL9bDH7uHNcnY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7NOwLLbJwaDUXL7V0PZh2jku+JoMDsPrc7m
 NzHCD3TWnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuzQAKCRDBN2bmhouD
 1zcCD/wL7jy6EpLsVXBGfS64OBKoLjqB570Nzr0xz5jjEOIHnWEDebnlh2C9JRhEwi4ybeuiYUh
 d8OKzKNy5u1RrBqvyeZD3ETlW83XhTv8PdFb8WanJkUJ7Ob8YMesycKcnijf2seqXrPkA+FQI4w
 rFSrSXuvNx+OjDSmYfkVidv0rpBT74bf/PzYydwUxVP7rjTuXM5rNKSl77s6EvPOvrPTE8t/Rbw
 XrHqKCXQlBMdBt4uC6fm9GVQtc6SLAsYheVeOLRGxtz+MYUaDWGMicARiMFrAirc29AI7hftROU
 84wz50/TuB4s4U9heZ0ljKA1oYuujdugLPLph9WXB+zzfHz2dYa76mPI03DuF0w6CXtxhmqM456
 IUPEIIFbp/HLx0x50QhWNnz+X5KnLTYvIPjLXoqwYe0klaC2f+mqBgI4pEGKFwgjMlCOPyGGw+W
 gK4hjrni09R1RHmFzfeZ+XxjrHuYiY89MQvapBUifZDclD6Tje2rmV2YrRW+3ZnsyMz7+P8TFNm
 VdlFafpLM/XiQfBV9MOXM83S/RGSkPnFFuWAf0mscOBGiqlVjPIsaBkamqXOUZBaJXWxLUK62dj
 CfgUsFRgQUrSiw0cj9+pSXjf7sL9haRJXVq8dQ56TA3w/5+9G45chAo/5PIBxYIFaeWsLHhVUgL
 SqRSg3rM2hSciDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on first amba patch.
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index e805617020d0..d2b5a5718c29 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -982,7 +982,6 @@ MODULE_DEVICE_TABLE(amba, cti_ids);
 static struct amba_driver cti_driver = {
 	.drv = {
 		.name	= "coresight-cti",
-		.owner = THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe		= cti_probe,

-- 
2.34.1


