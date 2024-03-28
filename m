Return-Path: <linux-input+bounces-2549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC388CE93
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 21:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7ECD29ECCB
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 20:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C77F13D613;
	Tue, 26 Mar 2024 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMeEAvDE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401EC13F011
	for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484666; cv=none; b=Fa/kha23T5JJNY5f62iIghNMXu0A6ycr5euQuBORLs3fbppGkFu80lHBKZZh46vE+npJNm11+vMAqAQc3BF91CZPkjL8jtk58D/8JJBW7ThWvbd8T7HdY9N49tIvk4TnyIHFpahsEiTxxSgJAYFhKf1C3QY2yQfq5Lp5kreOw3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484666; c=relaxed/simple;
	bh=b7O+xsNW5AifEGP5unLgDOsETMh4o3Ed5FMEicgl0Bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caS0Q6/8wM37MQFxddVqnYxQuLKkYiL14kL5E2kKIcrsfOD+veqd5rocOQsX9vuiO7pGQTbqwIl3wNfJR7qwbImywvqxokG9u7yRCnLjaD7lWbbgtuNEq1E1j+q+LR8x2QYwWS2aYE2HJZcVCxyBgMhbBjlaC7AcBfQoDkXGqgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMeEAvDE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56c36f8f932so379981a12.0
        for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 13:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484662; x=1712089462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Iv0AZfW3wpSqdU6En0pi+/4bLDyGY5/1naPQo6iA0g=;
        b=tMeEAvDEx7rEZcfFT9pQHbbX6/U9FBRZ0Yqe6XyPlAO/HmLgIOq5KC15gmXLLX6hEu
         zZpqoaBY1TRlxOV+lavyczpXbZAcGjG3IR4WAhYjVMBduGbb5X7HogzY4KQax+A9lPtP
         A1wDZMcv6uQKeU0NrwJRFILi12d88nB8tpHaBXpIEYIoxt7m2Tqru48c1TF5Rknxt9At
         TvNfalVlI7I4NA3fNmwRiXMcnaBfH/xkk2imbde6roOGWs6LhN0dEFOjPIrMCYcOYbk7
         z7zXmYHGN2YnLWMlURXmU0yB/4IJYnxMWJqDgxl2tnG9obeF21O0kfB7wzgIo85WfMLn
         eAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484662; x=1712089462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Iv0AZfW3wpSqdU6En0pi+/4bLDyGY5/1naPQo6iA0g=;
        b=cPSS7SHl8bmPfUwLCVz9j9YKGP0VGzoFpf6BIt94pFCiW50nIzzJ3Y9hBUoa2AIcxZ
         jh0+dVweKVTZzfwdYvH68VjRRL2EmtmTfxQOQU6sfNeWpAaGRQ8x89sgG/JMz8+ayDYG
         7I9zCGB4EzH5WD/kL1++ncCJHK1w0GjuTXSQtz/1ScDj4VF1bVl8EfcYtO92+lL6iGyj
         LJ/1hmmWLo/RhONzfbsdgX6DypEQMMg2iyimNGIQpQ9tR9pEibjZV8yjw/uRu1lAtXWJ
         MlYRERDBX7ZNLBVNaLPVrW2QkizbxjS2W9mPWxm1fFvVx+kj1zuGQYz9xC+7qHrhmHNh
         EG6w==
X-Forwarded-Encrypted: i=1; AJvYcCXL8mNCTA5TMLqcFDqrivbBQW2/zJ9IXCqnsXiV1tLIWac47CeporiIT8iUoVO3tBr24WhXOaHmEJsj9k0r+oYBBsqbYBSOK30eipA=
X-Gm-Message-State: AOJu0Yy23WWAOtgs24UIQWwi7xwi1Fq25LQpxHFR3r7WmpIN9I1Bthjr
	TCKLvpKfvqoACagdpWssHcq4SSVcOTwXazci6iGarUhDD/hITG6tJGuAJ6uVQLk=
X-Google-Smtp-Source: AGHT+IG7S4HjUMgBB49GHchvHAMJD2aht3cd8KtHCObSSzp1R2kWTUNNEN8xAhAkTlsu/KwDh2IF6A==
X-Received: by 2002:a17:906:f59b:b0:a4a:3b69:66a0 with SMTP id cm27-20020a170906f59b00b00a4a3b6966a0mr2609291ejd.15.1711484662445;
        Tue, 26 Mar 2024 13:24:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:41 +0100
Subject: [PATCH 11/19] coresight: tpda: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-11-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=736;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=b7O+xsNW5AifEGP5unLgDOsETMh4o3Ed5FMEicgl0Bs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7VS6fHhY3xQU5O23lff9iEFJQUVzhwHGejs
 Mi4U6AthLOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1QAKCRDBN2bmhouD
 12iXD/oCdCTPj6r3JiZLlJFxbtCDh14a8HKda5v2HiiA6tvYM9UGYM4Bph8HMfJwleEBMXuN7SD
 RxobPBhCEEnohTCVDMENYkIUcrEfHqQvs7Bp2R0vVZaiqbOxJ0jTjQfm3/fzO/JtCU3a+YAPDN+
 edgTgKX1eXv8Q7++REKJuXQwGN+lvtu+Bb9TjlkJx2vaWMrnNoJye7XTMui+iQYOk3/i0+khie6
 3NKkzdj0Wgwe+0Oov6kbByiSU5dIhUOVgpZoaBdHuK74MOl6k+XISmGTysOo+Ja6agYfeZsKyXh
 J/k8bl5xwB2MA6ky4bbr+C24a1FdI7HlFsVceF65QqTkrILX5btPwxWq7ULXbmrTJQ98vdkgbpy
 U2Hhi2lCO5ReLeckBwOEK6mhkjE60HSbH0csg6uPR87GMg1PCuCCjfA+D/GEdpsEu/4FnhG6Vc8
 6esqOmwTZdbGn2c4KHUTF2UNtkTo+U4Gkcu7AklWm5J5xGz7MbSNjFtDNXe2TctziusIdSmRDmF
 VOsvI+FirAxU9IDMEnjI1EkyebUcwRaI3qIQokZRmdx+oinVHTi5+sILVQew6mx/NtFoF9c3HK/
 D0UnRFlxOiKJy3uUMPSgIpwSrnDBDAokTtOzt+8vl94YkR9vkevWuetkueKUvkvDMOt5Rlr5MxH
 Zo3LPLTDSOkdIJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 7739bc7adc44..bfca103f9f84 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -333,7 +333,6 @@ static struct amba_id tpda_ids[] = {
 static struct amba_driver tpda_driver = {
 	.drv = {
 		.name   = "coresight-tpda",
-		.owner	= THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe          = tpda_probe,

-- 
2.34.1


