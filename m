Return-Path: <linux-input+bounces-9259-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6CCA12E6F
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 23:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B25B165B68
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 22:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D40D1DDA09;
	Wed, 15 Jan 2025 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyTzjWpd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4361DD87D;
	Wed, 15 Jan 2025 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981173; cv=none; b=czSMSO89UGZq3RjhO4R8hM6xoe+dSMQqtdFtELPH7cOLqSOjGH6ja2q7T4CsGSPASNsJkcqvWuLTS9EzO1wkhfBenN/nlbKAoM/ZYvXNzqtPtEas5LztOZHHx2PM/ZP97N6DTycHzbhh6Uc2rBLlO01/FHY86lqbj3GNy47+ouI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981173; c=relaxed/simple;
	bh=mfzps7MrY/bcz2UOrFkJP6HwpcWdEzOi6VXm2UtiSLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTWBjIQa35I2SuWh7Jx7a+CZUDSudKcZXcTl4HKna/ggiKPloII4wDEioQWqBc71baYC33A/UtTVVUHri8E8RZQA6ZxwXH84tUXLypkNV0cWUZ0XrHwMtAFVgHFAJtgeBUSeEtf+dB1Fo4Un1usw/VVnheBSq6nNimD73OHCSWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyTzjWpd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB044C4AF0E;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736981172;
	bh=mfzps7MrY/bcz2UOrFkJP6HwpcWdEzOi6VXm2UtiSLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uyTzjWpdC5SB7jXP4WHm60MmDCUZJyPhf9ctjTPiPuypXzFowfNIPkvyldO5uf6XX
	 YbFtpz3IE5Dw1UEehGaYecwPPTUPHLC3rGIdlXbwVicjqwo+CwRaiK148EOfeCqXSS
	 LLS6ofC1OFpJN2Ql1yZtI9VGrgwGmX+vEx0xNQbVXy37aS9HxzvCbqP9XT7DOE6L+A
	 fxF/l9hnFzhXJ35uAOkgFVUOYPCKJxymiHFVKty6w2mIbsfxgzAjcfmQbS9Zm8p+ZC
	 pXdSUnV65zbb2Ar59GN+KmMDhzpRVigYNEJv6qNhYrfX0elbVXRrg4x+2Odj7X6Iue
	 49w5/8UH4AP1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93C4C02185;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 15 Jan 2025 23:46:08 +0100
Subject: [PATCH v4 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen
 driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-z2-v4-4-d7361ab16ba0@gmail.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
In-Reply-To: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736981170; l=1260;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=DolVP44jd1KXaKyL604wEY81MMwwSbO5gUWo7+wphsY=;
 b=XlRk+bLP9zEGiCp9eJLiEMa05qHY5eHk0W5DNCv7FcaOdlW1QLmRgMgO2apg7DUctcOuZtl7p
 i0r0nBjdRVHB2/YAZGEfpwWUhtwBdaNfvKkTTF5+fcAup8RX8Byxn88
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..8b3776eb748e128f87c44886b117e0652447fb37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2191,6 +2191,7 @@ F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -2211,6 +2212,7 @@ F:	drivers/dma/apple-admac.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c

-- 
2.48.0



