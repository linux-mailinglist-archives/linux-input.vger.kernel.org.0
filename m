Return-Path: <linux-input+bounces-16090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7AC58952
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 14890364158
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96FF353888;
	Thu, 13 Nov 2025 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bceVHHMR"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE01346795;
	Thu, 13 Nov 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048784; cv=none; b=no0YHm18QaKpK7W72ueoo7w9vU+vn6XSTFuD/D3OZQyWyzQ7NU2XtHtIHnVCnbWvId8iDPZlMw9HmcSAbA7dn+hULLjsyAS5RPAqtEOeYerKC1O4xZ6EY1YpGbk5LXoXedGjXO97b1UTh3/7z9q29LvDGlXEkbkj/z+78P8ViBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048784; c=relaxed/simple;
	bh=uO8NvJOunCO6wpxP9XWnyz5rYhnDRXXJdrD0fq0KUGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcyZVZtC4Yd10RhI8spGKNClbok2C0efswXeUbHed0arVcHUhrTS8DcgqZ3P1JJx/BAGBSwqNRWj3Wr2dWehcEGb9JN+FkVlDuSyzWQSdTH9tBGbj2NkGTxPL6z2auzN8h+1MCYKWZSr8Kmf51iNwSiYFaMuc7hcreWgjwV3JXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bceVHHMR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763048783; x=1794584783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uO8NvJOunCO6wpxP9XWnyz5rYhnDRXXJdrD0fq0KUGY=;
  b=bceVHHMRMbpoHuXTCn6GoobMpF7/kXTc7iB7xwf4J9EGRJ6uAbLODFYZ
   ti+2eH0UYm51lW17ZyvHAYfvdy3zpl+owIknxs0WJbNyBQqIGAAUOS8SB
   YhxyARiXqEGDegBfAhUh3XjX3zkVgvNeDYCRW+mGw0FxmvPH9vYbeNNkK
   6tJqtteksNA+Snz1IF6KwFlEmyZ4FMe5HQfqOjehLWWZe0taEX1e8UcxY
   eIsD7j8Z5NZ57Lcg5DDW8gspqq9tNEtmbsTA14kcgodc8OBPjDoEer6QR
   IB3/g4yotP2e648WXBlP2Sgy/3vuWYNFdQKuZ5+N0KYaB6Qpiw3spqdsd
   A==;
X-CSE-ConnectionGUID: MICBWDBmTvKmvAhiGf3q1Q==
X-CSE-MsgGUID: x3xLSqLYRka9zJkKesMXcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75448548"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75448548"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:46:20 -0800
X-CSE-ConnectionGUID: 1TGFAM0uRziPiU5k4xAWsQ==
X-CSE-MsgGUID: tqiCKJazS9+q0w7NfBkDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="212933923"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 07:46:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 97CFE9A; Thu, 13 Nov 2025 16:46:17 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 4/5] Input: gpio_decoder - make use of the macros from bits.h
Date: Thu, 13 Nov 2025 16:44:45 +0100
Message-ID: <20251113154616.3107676-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113154616.3107676-1-andriy.shevchenko@linux.intel.com>
References: <20251113154616.3107676-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of BIT() where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/misc/gpio_decoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index 7f319b932550..057717de9849 100644
--- a/drivers/input/misc/gpio_decoder.c
+++ b/drivers/input/misc/gpio_decoder.c
@@ -60,7 +60,7 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_decoder *decoder;
 	struct input_dev *input;
-	u32  max;
+	u32 max;
 	int err;
 
 	decoder = devm_kzalloc(dev, sizeof(*decoder), GFP_KERNEL);
@@ -82,7 +82,7 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "too many gpios found\n");
 
 	if (device_property_read_u32(dev, "decoder-max-value", &max))
-		max = (1U << decoder->input_gpios->ndescs) - 1;
+		max = BIT(decoder->input_gpios->ndescs) - 1;
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-- 
2.50.1


