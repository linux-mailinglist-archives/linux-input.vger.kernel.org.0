Return-Path: <linux-input+bounces-16051-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FDAC5415B
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 20:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9530334945E
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B2034DCF2;
	Wed, 12 Nov 2025 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLdNSUfN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8382734D38D;
	Wed, 12 Nov 2025 19:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974863; cv=none; b=V7fpTabUINY4MWv0nb15m457dW7PSpBShwLXdgm9wPfmKx096MJsXqgS3380yaP7cqUM1f3uHNCCQGno3CgKTHharioCim85mq3A/X+u9OgMdxF3pF+pbY21K85RHK6SiPYPoEvfb4N9FHIppkcuDuhjh1rCJTWDQnlgDDIyfZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974863; c=relaxed/simple;
	bh=100NIUpe/MmbcoRj+BLsbRqmsAMwdJQoi7KDFZ6HdWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbDTE6nqpqr95QLu5G0QUJNyoB1jDwrSoDYqMXdPJzm39I0jFbTfDbwqZv4JI6vrZnCnbf91xXL8ijn1yIVKH6YU1iB827Ds7e+ZD/HD1IN9sR/x7CAGA6K8d7vVx8mxSe3strt/wLRuL6QzoirMmuSpeTTWUy1x1X9uN3MowNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLdNSUfN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762974860; x=1794510860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=100NIUpe/MmbcoRj+BLsbRqmsAMwdJQoi7KDFZ6HdWg=;
  b=mLdNSUfNm74OMJYx6shE7sRjJD4YasSp1hjtrRbkfhoRFFq58Sjg/BkL
   scVI/cQjbicKQRkUI7mGyv6sIJa5WDSoID/dtHwKz58g7qmXnll+KdhEq
   J8phx5Q+qUxQEHSFTJTT52bQLDrVyiPIn7BNQKAAX1VPj1qrJc/vm5O3G
   GiNcfTjVupOlbfG7opbkXd0CcCJtw1LjkZivdqjy4u89FpxA7tGqv5EZm
   Ic6uQs298QxbIVNzIqxx/smcubA0kX5NMwCC79jnG5PVM1wCa/88lsVNz
   cMSzUc8kXmep/mw2iTgP0LUExXsd1b1JbkqTWsXTi6lDnVcht44KVYyP8
   A==;
X-CSE-ConnectionGUID: 94+BZa18SduZubrr9CEnjQ==
X-CSE-MsgGUID: qpfH54ArS+OiBXLzHL6thw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65086886"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="65086886"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 11:14:16 -0800
X-CSE-ConnectionGUID: 9f0IlICMTiyHdYUXTrnwlw==
X-CSE-MsgGUID: OFpj2LbuTPCO6IPV/aqOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="219951618"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2025 11:14:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A0C3596; Wed, 12 Nov 2025 20:14:14 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/5] Input: gpio_decoder - make use of device properties
Date: Wed, 12 Nov 2025 20:13:17 +0100
Message-ID: <20251112191412.2088105-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251112191412.2088105-1-andriy.shevchenko@linux.intel.com>
References: <20251112191412.2088105-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the module to be property provider agnostic and allow
it to be used on non-OF platforms.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/misc/gpio_decoder.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index ee668eba302f..459abc749a49 100644
--- a/drivers/input/misc/gpio_decoder.c
+++ b/drivers/input/misc/gpio_decoder.c
@@ -10,9 +10,10 @@
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 struct gpio_decoder {
 	struct gpio_descs *input_gpios;
@@ -110,19 +111,17 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id gpio_decoder_of_match[] = {
 	{ .compatible = "gpio-decoder", },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_decoder_of_match);
-#endif
 
 static struct platform_driver gpio_decoder_driver = {
 	.probe		= gpio_decoder_probe,
 	.driver		= {
 		.name	= "gpio-decoder",
-		.of_match_table = of_match_ptr(gpio_decoder_of_match),
+		.of_match_table = gpio_decoder_of_match,
 	}
 };
 module_platform_driver(gpio_decoder_driver);
-- 
2.50.1


