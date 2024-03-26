Return-Path: <linux-input+bounces-2551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E453988CEAC
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 21:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 564BFB28313
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 20:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D835B1411C8;
	Tue, 26 Mar 2024 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFNCRvDG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA3413FD84
	for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484671; cv=none; b=kA3SZ792844Muf6cbLv5MYK1apIi/FS/x6G1+4CfyQKc9wTUWNfnOUfUeyiJCk0MuxhF61suLa04l+qwZvU7PSqrIKYherIIlXD50+pk0azB5Ci+KZciKbo+zbdesUKD6E7yncwhQt6P+R9H7ocQpDfbrGvkN4aPC3n7vL8QqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484671; c=relaxed/simple;
	bh=mzW83dKAeopOAlsaYSxUYRMWGIcV+pi1cfkK7J9iXH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lpMC4u0+2fPp7gMzxGfdzZR9jki0kKkaxiRY5VFzb6bFIduJPwZLwXAc57g9i7E0taJFGUaJHbaWviNDfP6N/82sVEaqJbM/Oksqq6AdsUtGQpgpDYCdoUVltp8LBjThoPV+zW/shFOmmJZqA91OMjdMDaahN44X4lsd7R6Vok8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFNCRvDG; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a4715991c32so724303166b.1
        for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484666; x=1712089466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuVDaEvr2c6AAkjEaLK4iGtTvSGvFSYUkhrUiINQHVM=;
        b=wFNCRvDGA8XOTFNkRfPMM3BdPa33tbfUO+DGXWPvN4uUizzBYOLQB2YXxqNzDWqOxv
         6nNyBFfEM7qnhKnajT60ujS/C8ZCJIVP1yi/QV+iwqtzyXUcHZZB+iieh+vO6a8KWvzl
         SB2k7SfbLJ7afUAvZ0CjWrumUVemsP5vK2cDHftBi+PBn3jd8A/RB5Uw61Qef5nQ6J8f
         pRxfZBVEnguJbraIxj1Y3NIlizUYGSxno/G2fGgJFEkKUJ8w8YktY3hrsUErP00Q6X6t
         OU3rXJeIHyg2/9qUIslObvinFoaM4xJ7FUK6QPPOhTBU5OoIvPqxipBTwd1HzPWzzINo
         nV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484666; x=1712089466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuVDaEvr2c6AAkjEaLK4iGtTvSGvFSYUkhrUiINQHVM=;
        b=QmfeoPdUhW5WkAiAVT3RW6fgb1f3lUFchfeDhaCPTwYk1jWvKbxsQWqADb7nCuxa5a
         Ikv/BJEmDJk0nGXQP0iM+yzwBIn15zRCPJ8hBfOLofqLR5N6VbV+7+v2Y1SMcnT/XaIc
         V5IQHm4MGt2J1MG0YqZXhwiLdLOhnqQasqsqbN4MX8L/MJu2J0GVI1ugUB2CKx6Y+cTk
         TCeogzQRv5M5mZ2EzKzvSsExLyT7qek2A05ghqeE2LLnc0It8xooNPXMGyhceFf5vmV+
         7KBlI1KfVY3GuykBi1tQR15+n1N/bSoGRRwKqUzx1+mnTAZgGjeTFNF8SYF3fQcUaYTQ
         Yz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCDAYpxRK00ObYwWbbpHuOky4T34APpMwo7KMTdomMm82qKi4qKdZTDNpcCCUrhRK4vFwKZWZOKC6LY8ojC/bUbgUu4KHltoYxTtI=
X-Gm-Message-State: AOJu0YzlWPKD0YIhd5jMC+E9fy5Uf6/Tnrm4wuKlscfycWMAAY11658l
	AgspSMfv9aP6XrxUKLyWnUce2Fb6wDxopPw0vsWJ19MRzqVfcz6rQHAVwNkDN7o=
X-Google-Smtp-Source: AGHT+IFHSER7YzYA9YStVg65zDciiNiGG7ueOSBINzUVaXu+ywI3HbB5wXjAk97hfb/FMIFSp663HA==
X-Received: by 2002:a17:907:86aa:b0:a4e:29d:c2cf with SMTP id qa42-20020a17090786aa00b00a4e029dc2cfmr30978ejc.29.1711484666718;
        Tue, 26 Mar 2024 13:24:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:43 +0100
Subject: [PATCH 13/19] coresight: tpiu: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-13-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=729;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mzW83dKAeopOAlsaYSxUYRMWGIcV+pi1cfkK7J9iXH4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7WRhiBye4JPUDUabGW8d0YAo6h+snTYUYAO
 26UykPuFNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1gAKCRDBN2bmhouD
 1yYjD/917HcS9h6P/anThHL1FhBJ6kR70Zqgi1NnZ/bUfxBkPtJjBAzS10+Phk7non4SmlFqodt
 ihWJzYjc8YDq/aARsJQDj/+4lkfPXoVcGOKaOr+io+biWFplarvo/LK1yWWgZENgcdNN0EeroN6
 agwwrSsX/qVKx3oVPx16kewExZzKKulFeio6Y9XJVfeNTOwJKpN0bgPT68hbtJ3lhb1meCz+uad
 qlgeu2stSdNg4qVFudy+ATp1ZdE3RloRzX1vg3rWgdE0tOV2ozr6cO/mzxuh/MDyJHAcAH5nHEe
 vSrVtFwPTQiyei7G7BmxQHcQInKudMTbbINpGY1FVZ2sgHlcmw+nmjcJHz4dosl+EmZn+m8Dstx
 DWYAKPNKL35sqjp5bXeoXYb+H1NTG0WICUqg271lqp9CwXvH2gQVkKw261M/xulaHWZMfajrKcb
 8EfddeWzVm5nNiRajXmiJ+zzA6xuxKUio9etRkwQAngG3UqFWo5raKYiRQIV/X4NwvPVbbT0eAu
 ZQJLTR0MhpSq0QBYZtXDpyOEPIi0T2IVanll6fix2jcGp/u4qjob/k8k1I/u8BlS5MfGwmlso4h
 8+c9SDFTcHyEGw8WH4UyRr91D7iZc1XHRcGmhZl9MnbR/Ca9GbU/Dy9AExmIFXnSJJTeTao9uVn
 g57cf3JmUqoNXCQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tpiu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 29024f880fda..7dc9ea564bca 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -236,7 +236,6 @@ MODULE_DEVICE_TABLE(amba, tpiu_ids);
 static struct amba_driver tpiu_driver = {
 	.drv = {
 		.name	= "coresight-tpiu",
-		.owner	= THIS_MODULE,
 		.pm	= &tpiu_dev_pm_ops,
 		.suppress_bind_attrs = true,
 	},

-- 
2.34.1


