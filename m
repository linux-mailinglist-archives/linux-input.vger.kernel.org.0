Return-Path: <linux-input+bounces-11576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0423A824A9
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 14:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 790AA8C3D96
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 12:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD9825F78A;
	Wed,  9 Apr 2025 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih9nkr9E"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA725EFBC;
	Wed,  9 Apr 2025 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201423; cv=none; b=cTJi8AcOY53NIUZI9stM3vCCAJ18wXXAtSNWQe6f8UlNEtMW5inge7xOtlSXNaLz87qYu4kqfoobzDO1Eb2V6WqNrBfZQtYi2duxXgzyd3hRopA0k0hQVhA4AOALXjNGMEFytFpBEn/JL+RpT9s0+SJy3VMCVZK31G++sqqymDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201423; c=relaxed/simple;
	bh=ndAoFBQiFkaWAC8OWaF8W+3qr9/sgyFXOJUizNVSs08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rVUwFiMfkz9Wwz0tf7FVoor6vAtBCIM4nBTq71Gy0T9Y0D4IgbF3HoM5NHlCWsmZXOpzmCzV50dR1uVxJinT953mLRXJw8M1kNFcF76+aXSvVxMRxNBOkRXmFBtd0o0mIfEZg3vlj0ofTdoZoX4nwnlCS0sieSiKLw3N6ZPYplU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih9nkr9E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC35C4CEE3;
	Wed,  9 Apr 2025 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201423;
	bh=ndAoFBQiFkaWAC8OWaF8W+3qr9/sgyFXOJUizNVSs08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ih9nkr9EK+GvVC1zn1vkzYS6i+GnRJQqGzU+CyioHyp721JLoTfNdARiWF52J7SOx
	 nde/NDMXSJkHQBIgZryWvxl0UEaC2KT1a+DC9lwJwld8f+udb55yF7GldEgTyvpmhS
	 JulpQKa7Oq4EHTuCmz3rqU86y1W52CG01cTcI2cIzdgLF35Jw7LjESz6l/CHlGO5IO
	 OUMFHEiEKeiUVStSxL2xtivilWaWrQ0+3vTzt6esb2NR58/Udha3FPNPmMh6bRUprb
	 ocYTIwL2/JPxNyFjMa9q44+po4nj8RHLaSCefvzEcly9Iv7SU6Zuvzz8/3dGBLVuf0
	 5gAfcUqzyrNWw==
From: Arnd Bergmann <arnd@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] [v2] Input: stmpe-ts - use module alias instead of device table
Date: Wed,  9 Apr 2025 14:22:55 +0200
Message-Id: <20250409122314.2848028-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When compile tested with W=1 on x86_64 with driver as built-in:

  stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]

Ideally this would be referenced from the platform_driver, but since
the compatible string is already matched by the mfd driver for its
parent device, that would break probing.

In this case, the of_device_id table just serves as a module alias
for loading the driver, while the device itself is probed using
the platform device name.

Remove the table and instead use a module alias that reflects how
the driver is actually probed.

Link: https://lore.kernel.org/lkml/20240403080702.3509288-8-arnd@kernel.org/
Link: https://lore.kernel.org/lkml/181dbdb8-c050-4966-8cb4-2f39495ff3f9@app.fastmail.com/
Cc: Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use a different approach, hopefully this makes more sense.
---
 drivers/input/touchscreen/stmpe-ts.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index a94a1997f96b..af0fb38bcfdc 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -366,12 +366,7 @@ static struct platform_driver stmpe_ts_driver = {
 };
 module_platform_driver(stmpe_ts_driver);
 
-static const struct of_device_id stmpe_ts_ids[] = {
-	{ .compatible = "st,stmpe-ts", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, stmpe_ts_ids);
-
+MODULE_ALIAS("platform:stmpe-ts");
 MODULE_AUTHOR("Luotao Fu <l.fu@pengutronix.de>");
 MODULE_DESCRIPTION("STMPEXXX touchscreen driver");
 MODULE_LICENSE("GPL");
-- 
2.39.5


