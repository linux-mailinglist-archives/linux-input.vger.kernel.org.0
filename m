Return-Path: <linux-input+bounces-16088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD6C58907
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8EB2E34C703
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF67345CC5;
	Thu, 13 Nov 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Raz1ToVJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040CA34572F;
	Thu, 13 Nov 2025 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048782; cv=none; b=rnjYSULw44SNgVIH65SgQ/bGa53KsD9QxSrQ4mq9Ij8BRcPeuZT5ac3vjQUf9a/QGO1Y81QG1ZiCWS1Ro5FJJTDnzrkojJ3VWmMM0wuBgaUtoEhXkQjETnn40Lj5q4gAvzPxtND1ev9KUyoYYL6ajRnPrjlwhljOZf5QWFC+q+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048782; c=relaxed/simple;
	bh=100NIUpe/MmbcoRj+BLsbRqmsAMwdJQoi7KDFZ6HdWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiGr97fy/Ulkjows1Cdc5smPGoqOBXTMocdqaPT9SHW18KNt2xKJD141bJYKcAQnXIZPthGpK/esa/PAGOtRjAgGNVx0fXO9dlcXLtpnW7nWnEJTtrbga67MrPp2t2FpA/6n25V5amNs0RN119HPOs/tOZCO1SqQj/mpe94roQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Raz1ToVJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763048780; x=1794584780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=100NIUpe/MmbcoRj+BLsbRqmsAMwdJQoi7KDFZ6HdWg=;
  b=Raz1ToVJZm247NyHghTl93FWOmQ2zUu9f3UDhYZrgGdctrz9zGNLBXx6
   CY8h/cp1XBAYJbslUIokCXWb2Sr4zJRREaEupTLV04+hcYahXsfq4OJnf
   cltt+ei1JN+vtkGobZFJf13iCWxn+cmuCsgeLeLpa0ry5/aw7kiOf2wPG
   s2mFhuyR5vac87p/I7laO6iVDk95i93yTO8Jgc9sa7bynbU1gzcFf7248
   OeXJVFnKXCAMC2AWzpV4D3LPLgk8iBiwm+jH3IWLaBK2Z8XOv1JjF+CqX
   R156sq18d5FOC+P0anvsp5joKUJWiZASwEMihl+LxtmOgZ3wii+yq6jhC
   A==;
X-CSE-ConnectionGUID: r6c9h4m2RtyHyTeVyKB/JA==
X-CSE-MsgGUID: Pi9ZOFM3Q4eWZex9+tYN7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68983126"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="68983126"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:46:19 -0800
X-CSE-ConnectionGUID: IX7lCf36RHGfzWP+QyzHjw==
X-CSE-MsgGUID: WR8dPHPsTXerbFDmOxwFyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="188819177"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 13 Nov 2025 07:46:19 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8B39197; Thu, 13 Nov 2025 16:46:17 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 1/5] Input: gpio_decoder - make use of device properties
Date: Thu, 13 Nov 2025 16:44:42 +0100
Message-ID: <20251113154616.3107676-2-andriy.shevchenko@linux.intel.com>
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


