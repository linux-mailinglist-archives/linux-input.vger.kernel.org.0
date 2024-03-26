Return-Path: <linux-input+bounces-2548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF488CE8E
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 21:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58E261F8470E
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 20:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADC113F016;
	Tue, 26 Mar 2024 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQ/eSFW9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E6A13E8AD
	for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484664; cv=none; b=XYKHsyYPUcQglZccyRpCIAXckjRe0MTs/cDd6lhKSff3B1EzpMHs/yoI686RRjp4MYI/d2xN+ZemfCtDYnvz4UQ/jyfaeXgCVWEkg8pmF+0ZlBUXegDSYAvrMSIJeg8xDb7AJZI5+DGrqo7M2UOVxg0vRM0YMROkxQOq0dLn3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484664; c=relaxed/simple;
	bh=GHYJDWqnZoc7/rYug0BmurqWnNvrY/zLtghYn4WZPjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVvUfdB8+ykRanvdnxVgkvBWiGLFxIz6MN95fV9wyY5XgMcHE4IKT3xf9ReDAWOzQRNPE7acTkfztiWx+3tKybPftx3S2GpE6+a6Gm0cb0dpRhf2yZnbfZNMt835JBktyh9IgjNr5BM0we24dNqAqQXt5P1YzOHFwL7jGihvTEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQ/eSFW9; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d4a901e284so113769901fa.1
        for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 13:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484660; x=1712089460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKOnOabUB6pF+ej5SQDvcGeRRaglO84Sz9O3R1GaVFA=;
        b=qQ/eSFW9m/z+cJNzmwm2jxAUMalRVu6gZTtVLS9SikVb/w7vORdF/cED/5FyVlqGnE
         K1itBcC4y8C4Ax8rAPDiPlBuWJfk0wXIIDSp8765VF1iEpQn7gR4cqUBmhigblIJMh7t
         rHTcuuKF7m+/8YrRohV0NaACH+JWlh4DgXHgfDWW3E3nH3F5HRzKMFVDpi4FjVW3oWe+
         rAEYkb5OVa63LbvTmiCsJPgwqxXIeQbix+TzHz91nAmLSZUIOxFGHPjFHsPFc57/qdvz
         eOUr3UdFrzVJCzcyvBj3fvjycU2yXXzMmttacfznF0lMYOuGJMe24s1KZS8cBBbrx5ew
         y08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484660; x=1712089460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKOnOabUB6pF+ej5SQDvcGeRRaglO84Sz9O3R1GaVFA=;
        b=DwUifbG5UT+6wfAnpJA4JF1TqbYlUasKpUECwUHgD1MJzfK7ptepWJFTRPEhEIpLfe
         IB9kqd7Ug2E4BtrGOwq3LFkRI2+RPWUnFYmx4YDuEZgylEHacqiMTlvDoZ4wDSdpQwP2
         gpR1nYrMH0l4Gw9F2C2CZV7HnKCTUdKr2hn24dujso5b/EI3aK6pq0/FqagWCgJOqmkO
         upFu29yvHRLZI67N7O469NUHp9hykItTnO3f0Rz5/V0rxcjPMvyHm6RxEMdCmGS3GHhe
         lKPcRXaKSMgL8q4Q6dBdiQ2sFKbVt9ps1fUDcbICjXUbUGurJEwf1Bx5yLHFNt3LMeEF
         DTAw==
X-Forwarded-Encrypted: i=1; AJvYcCWuvCHtXO9HBWqaYqKAZiy6/pEafw6mPuEoA7M/jTZCqjiJ9kUvan9Vmd+lQn7dpFvNM+y/G1VdU5LAPpn9Xqw/Kf7q8AWwGwXG5NY=
X-Gm-Message-State: AOJu0YwaDTrohN73FejZNHwD2IQU7mwkZz7GhmDgkreoMrX1hsufmW4O
	9euaqzvajnH+44PRyL6lAdVh265B8b8iInDkxmr1kox40pt1yda0UQ49MvzIdlI=
X-Google-Smtp-Source: AGHT+IESmzkKIx7adnGUE8VL685+RZ7GFnBS4CbHBYXytjFSFZVBSl9GE7H4tv5Ufd2Mfv7gRTK1NA==
X-Received: by 2002:a2e:97c3:0:b0:2d6:8e88:5a8b with SMTP id m3-20020a2e97c3000000b002d68e885a8bmr610711ljj.32.1711484660485;
        Tue, 26 Mar 2024 13:24:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:40 +0100
Subject: [PATCH 10/19] coresight: tmc: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-10-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=745;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GHYJDWqnZoc7/rYug0BmurqWnNvrY/zLtghYn4WZPjI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7UHCFK8a0nQ6hsfzaGBQG3fZhmF1o3Dz7kU
 68k5ByzCrKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1AAKCRDBN2bmhouD
 12sbD/0bm9OxvO/yndxGXeD2ddir4+4GYj3zVF50/RCNP239KPawL714M6CqzE7jBWZUy2LZoLW
 pHHRmfpLw35XdFoNQv9vOyr5vIpdp6vH3L4o+zd3qdmBq603IIXiukXSMsw9xD9mM68xuon9cPO
 yZh9gLd7KC9zG3r6j6QDfTq42SoZVTVN/d3QugZKcgLO19tuw+5+i+QRNsie29m9D4MkSIu1yPg
 xMnaTymj0YvBhrERC1Qnc6N9NKa1i4Y6EdI1TAmw6x3qMXxpvxogoVFRujzpzX9AqNfUm8+5L1t
 jMxLXiBrW4p+tU38wlDISWmbZjiNogv/0VoamQKnmzjGqBCJ9XIX7mJBGv9RmEmcu7zyXNKbThm
 YN2SN9a/wu88AG6ZyQt+Ph2UPmrC7FjYQolln39hVlYXDPXp3ePlfH7t1h53gj9FvUjvyqGLaOK
 QPOf94OGpPJ65+iscAfXc2IbQ8aFFZGIWbZQx8gDTdv/koUUtWRthD1VmaU2SAJwMbRV0LKrCPM
 FOlzvEuL3zlKvPsG41il3k4BsIxm9qGgi8oa0vYEHuAFylq+x/fFvQGZtEKbQAwmDrwHX6XmAfg
 +Mr9ombJvshL+qUH/J6LTKxly06KNIdHmIaoSDc0/0pIW/ph2gVexYDQ0SxHlepokzpj/yhKFUJ
 qzrs4LxRd1z5t7w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 72005b0c633e..0d251cae814f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -602,7 +602,6 @@ MODULE_DEVICE_TABLE(amba, tmc_ids);
 static struct amba_driver tmc_driver = {
 	.drv = {
 		.name   = "coresight-tmc",
-		.owner  = THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe		= tmc_probe,

-- 
2.34.1


