Return-Path: <linux-input+bounces-2547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2988CE8D
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 21:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DC631F8557F
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 20:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B2013E6D0;
	Tue, 26 Mar 2024 20:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJNPmAhZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115CC13E6CE
	for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484663; cv=none; b=DKxe0fm5Jr4IhuRoh5Rq5rdBIUt3tlsc4ogMP0d9cvMxzhpx3iSql86G0Ca5Iy0u2tkhIG4c8t3JrvO0dIxoKPuBAnj9J8/pdzOFO9UUy/LX/WJ7AUtAyzVmImbwBzSt5X/O6lMoqUxWROADme5F8FOokdDAWHz+TS6z3kz+2rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484663; c=relaxed/simple;
	bh=fnlJGlGCPlGnh8/3y5/698na0L3A4l3OxrAMDKXym3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJkZCqqm4EXclmkamki0DSygc7d0p6+ptb/YJ1yMWj/MVJLR+HpJf+GPOuNeAznbQIDqFiL75EzH9ghFxhfNSBzQnk2vduT926rpI/HXS/Nem3Jq341MWmYgohaLFWMPT/MT00uL6uuH23glbLDXvGUREFUkpcCkvp8g12chQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJNPmAhZ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56bf6418434so4495371a12.0
        for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484658; x=1712089458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kB5jvT4S7A1HpS3cfPeTRooUZKIZ+DXxiu/1Uok5y18=;
        b=lJNPmAhZMsB66HXhMlwV59ZeBo7K6VgpI+K8GJBIhu35igyalcJ6cOvgejuTtsQkI0
         Ji+1vIjBgObP+V4d4wldD1CuWlex+73zT34sQV2iuI1LpcFHctSRqCKqjGZQcABZ5tY1
         BlfOu0oCuR93nae9gi3DPgljQaRRpiWtOs1pd5GdAFtEsbPXpV91ytER7MLHIPeijX1w
         E5N77hOXo2ulW0M1ZpeZhc06MlBYN1GW04TLKMwXNNh/tCwvzEijjcC3o9uWg6ZT8roZ
         UQCRZt3xxUUMnPrFkvaSfa2pgcDXYjb81QgeVWHmUCdVOKOXEBk6opT+fYgPJUEmEP8h
         yKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484658; x=1712089458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kB5jvT4S7A1HpS3cfPeTRooUZKIZ+DXxiu/1Uok5y18=;
        b=jruALIZBuXocRzG2Yy3vlZ1EixRDLDkx3hCv9+Z7rOcaS5OfKt1N4peZ5oY5TneknN
         5zfhqp4rFS1A/5aEpQY0+lig0B7P6Q30tjrQI2mtcrbN/op7gX53rCtfGYYd6gfIC/9U
         Amhh+jle6CdnuXEZ2J7dVfKYwZ0GOWuV4fXoaTXPYMFd4VAas8WYXxc98r+Nnmrmj6Bx
         dKx0xv3tgzdZAZElLG+tps3FgFC3WBPElE+CVK+hIqpr17xoJxV+vus7T7FC7btDE/iL
         S8/RXzkw4HGHgKvnRh0NydLemAdcIH/VSLBuSHhBeqm0jklfTlvZcTDoN8wSQTJBsNRO
         84MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdwG1Mf63r/TDeNMmejoPgSpVMW7sDfmjWK9F9wLrewuJqNNQVoMJn+axMI8Hyzg/VjsPEBvAAlrV404BDGd3AmT8d2+1vCf2WFC4=
X-Gm-Message-State: AOJu0Yx7JXhoPn+gVc4iKCxUwMiKeCJS4/bEQ4nZ89geEsEkaSJH892v
	NGynXP5khyWh8337UrlnnUGFHDqu2GKQ+78oWiMX8TiNJ94oya054NKmGjPU24M=
X-Google-Smtp-Source: AGHT+IEyS9tnrSIemw0kLFF+72JgXRqLE6M9KrOysNkNOnmeH8BJgB2ASc79O+oEZQvxgv1o8wCeug==
X-Received: by 2002:a17:907:86aa:b0:a4e:29d:c2cf with SMTP id qa42-20020a17090786aa00b00a4e029dc2cfmr30786ejc.29.1711484658382;
        Tue, 26 Mar 2024 13:24:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:39 +0100
Subject: [PATCH 09/19] coresight: stm: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-9-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=722;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fnlJGlGCPlGnh8/3y5/698na0L3A4l3OxrAMDKXym3w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7THHtSEYd3f96/f1nr7d+Iclo+pWi5CIiYZ
 0YERGX5JTOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu0wAKCRDBN2bmhouD
 1yFjD/9SWsyXmiy+bsVRyfZIBbZGZjdHUxFAHi59IUIzhHcxiGObntzThm/sYmK1ZNe2fjd4Z6x
 ty2Pq7Ib3KxpEGKe9D1nz/n3zS+yAGd3ntbzjNreMPx6j8HKOvrql7CVhIPk6CiYN9f3Lm7ZpUw
 G7Mv0ajwulkRjHAa16rssNS8kuE2mBU0LRawMhsF9fFF3i0lP+tN5Mx3dCtK+pQ8xnYxrqfwj60
 g6YFNuR+3EUGl0fhhIY0GtSfkW9UtLAeWjX1UpcKdL1DdMbGUOJ2lvgEXUPRpHdE87zqUOR4+up
 alHUpmtEY8VSkpqT6uTlIeC4MoU88Tyn62VGNjqH6zcBmra7HEVqkUV1gxfVgXFfS0sB48enFRe
 yLy9P1TFBQa4RPGISdHtbTViJFByBeOrMrdB+bEFiEmco76wyt2gcYL4+QEAuNkx05obioAK0LW
 oi6k5fu5eYVOiTtEK5eNA8wQ1fZGmx3bwH8GLIOfPjhDqtlkt4TR+B11CZxOUV+aHVl4mX99s9X
 D0FUGqojtc6l2Vpa/AAiBHWAsw2feN4vhNgaoG2PzUW5DUkTGu2/NeShZMo3mLZseoyc0UYaXWB
 Zpb+IacOi/SIBoR7oiTw6e13jMWBQ4lltgnAd8i2GB76EFyPIItuxNHEM8W+XUdNgm4Cj1EA2SR
 B6yGWbHpUQGNRWA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-stm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 974d37e5f94c..15b52358965c 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -954,7 +954,6 @@ MODULE_DEVICE_TABLE(amba, stm_ids);
 static struct amba_driver stm_driver = {
 	.drv = {
 		.name   = "coresight-stm",
-		.owner	= THIS_MODULE,
 		.pm	= &stm_dev_pm_ops,
 		.suppress_bind_attrs = true,
 	},

-- 
2.34.1


