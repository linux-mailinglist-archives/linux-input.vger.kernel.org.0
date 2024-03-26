Return-Path: <linux-input+bounces-2552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18C88CEAD
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 21:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92581C3D722
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 20:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFA11411D0;
	Tue, 26 Mar 2024 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kki0SPKK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965814039A
	for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484672; cv=none; b=OQqPdROj+sER2bHYoi7h7YbbzKEO4xAcWRUlsUqqloeUlgQqWXgAk5NyG51HMVdgzE8Lasyav9pJph+o2DTJw+lMCdaUsSGJaNC5MkXm0/S6xLJ7Wey/3uRFSS/d3ikvREg6godJApjSP0w7zUBAYvBtzTqqU+GzQ9cgitpDbp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484672; c=relaxed/simple;
	bh=PiuxZrMIhu4YE9ePGusRzKlLsI9F5/aZep2EtBiAXkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAFkXggjZGaHdksVMo1ynQ76vnQQcMmn6AD0RjOGftxSRnLsXtqW9jfKhvU90/3scj8OeWgIUNuNUgLYN+oe9a1Os1dFX8ln1nyr0/RGAW1Zly032HsxVdEjalDFaROiLJWYQxSeV0ZjbxFK3y8D6z0z/TEv9RuVG48jk9NpeDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kki0SPKK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4a393b699fso31883766b.0
        for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484669; x=1712089469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsGMZVojJ8C70w++rBfj6RoYwUbfH5A2iM2yGofnBw4=;
        b=kki0SPKKX7f4H6PY3icoYPK0JfGISblCFkYTjUUSmVpnxBtpuPFGBUm6UUw0Dk6mYN
         hRyB6XxWNAExgQOMNFqB3DvjugT+oO7VHT8uHroojyDC5C9seuXX17xbeWCbx/SQgJ+6
         S9LIHzp5lSqydOlXz5Tira7ydkk4K/XF/AlJjEUNlK/ORoajMHcYiZVgbDsTFQ1z0BUi
         vwGJQ2N+opRdaUQUNRnYeWmOgRPrrwHwuml+LNTueS5IyGrz9zw5KJlc11fUXQ+O82XH
         /X+13OqlRM+0iMhgt+LaD+GE8pFSN9RgD2fUkg0w0muqwOu1lBgrM/A6mNBMiXW2Tz9i
         O3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484669; x=1712089469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsGMZVojJ8C70w++rBfj6RoYwUbfH5A2iM2yGofnBw4=;
        b=vN9xHq0EMQQfy0kURTNRpoLj+zpD3jwqwWXB/xJ0LVeypAuJb2ELgCaW3CUkg28P9c
         CRyqoZKk+MPwZGW25RvIccsLCzqlznvjTwfCQII+PYSQc9LhIorukm3jziPdRZzOayVx
         lu+0KHp5ZKWeeloj4BtvIlubM1N2VDS8eLxYdHt834ajc7D7XtYrnDAJuWGneR4Lnyo5
         7xOK9YO87+dadJ2b3gE6pzM688aat9ow9m2n4ROlH0ENJAnwZwRjJsKh+sisY2volKIk
         Wnm49LyXUUk2JiqjRa3g/gXJ4VzaNs3pVW7CTIk2/gg9sfxQBnlVJqUU2py5pIqO+ZGI
         6Pbw==
X-Forwarded-Encrypted: i=1; AJvYcCUv6knauCGPSCYVFKDlPOeutQ73YdLgPSK/AaRdvPEtJ8J8M2rWVXwF0Ss1MRIuVg0xkAwUBRCyzkvNBuR2eaGTLXT9s5RIHI9TnV8=
X-Gm-Message-State: AOJu0YxjFqqdYLoLzLR1qgmMxOP6hZwSVVx22cJkohaPUNSPWSw5hgGC
	4o40fb2GzndbmE1CEcm19XMXmTnKMUuuqvNmW+APVLMpoujlJzjZHxF1baRmt2M=
X-Google-Smtp-Source: AGHT+IHmg5rYTO8UGtft9sv37ciYnybAFPwpWY/SdRPJpcr/NpSWN2L0glBTXoz0FMh1/rJxCe/mHg==
X-Received: by 2002:a17:906:2b56:b0:a4d:f924:dd30 with SMTP id b22-20020a1709062b5600b00a4df924dd30mr1856464ejg.27.1711484668981;
        Tue, 26 Mar 2024 13:24:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:44 +0100
Subject: [PATCH 14/19] i2c: nomadik: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PiuxZrMIhu4YE9ePGusRzKlLsI9F5/aZep2EtBiAXkQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7XOnweD5fuRrpZasTw5YorRCvt7rz83nEnl
 mxTb0IGYS+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1wAKCRDBN2bmhouD
 100WEACWUJ3bHNUybrnLzHEW+50Of4V7yzTuUxCdwKIibp17CQYMnV9k05Cp/IkUiZieYeDG3b6
 dTgDp0izc2qKekHwXcoqBRz9Oh17xN5R2lsOXeoV4CduUn2cOAoTlqR4xRD20lMvdaet5Juy9zh
 vGavY8WUeoW6+dF//oLQn5YKrb4/+6mQIEEmSFVShckTfUSXhmO/R7mb7oF+UhqNYTlCPyi/PLT
 pFP2gLwXmq0jOXnqqizAjWI68WG9f32UGxHjh08HwOk3pkrQQQNu6UbwrdwOzWw+sPAznCGQ6oY
 w8EHMBCaihOHxPRJaJBRdlJRT0gaSjdMUkN/7pi6bZx6LnWewJ1gYnp4fobQnV4HBSelma7K1ov
 E+dr5l2ROqsfBstb04HV504A4DKquVZpJZRVy+ezozr1/n8URBMRZ0ripxZu4gJn13Gf9sqK8xo
 YAWtKrwZnyntWEwCnuq0yFJQsTk1w7kzgurw0YsmWRFVDTnZgxjLOzSOBliN+KeWanVkAZ0fMVc
 kV/4DPQyArEwIf/1PYjLS+oTpvw1Bjdfi+oxxVNN/61v9BQ+vKKVBX95pkg7UtUa0rhGKrXgzH7
 yoADgidig2D3rnRwwQi0E+vgBUAMXMTcdVC7fun9luTFX8Sa32soVTpLNXy146pHsGpBJ0TDFMB
 xEEp5fyTubgsP1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on first amba patch.
---
 drivers/i2c/busses/i2c-nomadik.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 4f41a3c7824d..17fb313565b8 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1194,7 +1194,6 @@ MODULE_DEVICE_TABLE(amba, nmk_i2c_ids);
 
 static struct amba_driver nmk_i2c_driver = {
 	.drv = {
-		.owner = THIS_MODULE,
 		.name = DRIVER_NAME,
 		.pm = pm_ptr(&nmk_i2c_pm),
 	},

-- 
2.34.1


