Return-Path: <linux-input+bounces-11058-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF9A6C29E
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 19:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DFBD3B7B75
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 18:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D295122FE17;
	Fri, 21 Mar 2025 18:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3P4mNjN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001A22F15E;
	Fri, 21 Mar 2025 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742582404; cv=none; b=HAEtwWO+6j+4NKlzWAOifLgqSKK8dcWGVvwFFo7K3Qa0bHrjKkqw/+Tih6yYCiyO0mJT6bHsaISPhoxpBEN/AwCcbD1KX9Lgpm/XoEmmiFQO2M76hfq02LkwSIO/JkPx09EikYqHavak4+6rl+YlBkiW72U3nFSqCBgrKEFtFMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742582404; c=relaxed/simple;
	bh=w92w8TSyFieWZo0U810gsK3z/XuQidLvqgnyWqkbBZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCpQqaVbItkrV45GuH2/bLyjyJkNJof3WeCK0S+3fM+MJeS+PzZq6s/7ClRSd8CYQErtnoYomS1mzjnoS9+o6NvWX6UipezoVlwzZisThfc5nLAtJMqooBbj4rSH7lIaWEi7wxipCwdCHExieERW3X0D+/PbbKXom5whj+R2SZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3P4mNjN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742582403; x=1774118403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w92w8TSyFieWZo0U810gsK3z/XuQidLvqgnyWqkbBZs=;
  b=c3P4mNjNwMIEp2xPSTs8N5O+LXnzr0F0SwifvUZ7zgVJUoKbf1fbK/X2
   PmEbUdC78pbq+58xO4SlZfTJIiHQ2LNOqB8u6Lmx7RfAYcOaDNVetOcUW
   SSd+nE6dLPshWcrsFL27JReVUFD8++kU4pBEO+oSm8QQXTHr4m2cOqWmv
   GwZE98vJLqQpPyynVOwXMsv2lZXQRC3g8ksv7JxBhREXGOabY4lQmhkNj
   n7Drmk3qJJI0cpxvaBQEFutWIPEYFgwzRF5lPn1kr6iVphtXGpWi8zNzv
   osnOygqbBqiXsEwVM9ItqWUgkYTS1eaHy/DSuh6dA1R4qoXL2OGmaxqVp
   A==;
X-CSE-ConnectionGUID: lEr5EIedT+C529N0aaGtsg==
X-CSE-MsgGUID: BrD/TT0+TSa6vgcokieq2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43986457"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="43986457"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:40:00 -0700
X-CSE-ConnectionGUID: jwrZnqRJQwa8Nh9GmJZ0/A==
X-CSE-MsgGUID: QRZySN90SjelWavrN6utxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123282492"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Mar 2025 11:39:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 17D32AF; Fri, 21 Mar 2025 20:39:58 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/2] Input: wdt87xx_i2c - tidy up ACPI ID table
Date: Fri, 21 Mar 2025 20:39:17 +0200
Message-ID: <20250321183957.455518-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321183957.455518-1-andriy.shevchenko@linux.intel.com>
References: <20250321183957.455518-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tidy up ACPI ID table:
- drop ACPI_PTR() and hence replace acpi.h with mod_devicetable.h et al.
- remove explicit driver_data initializer

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/wdt87xx_i2c.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 88d376090e6e..99636d6eb0f3 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -9,17 +9,24 @@
  * may be copied, distributed, and modified under those terms.
  */
 
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/input/mt.h>
 #include <linux/interrupt.h>
-#include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/io.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/slab.h>
-#include <linux/firmware.h>
-#include <linux/input/mt.h>
-#include <linux/acpi.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
 #include <linux/unaligned.h>
 
 #define WDT87XX_NAME		"wdt87xx_i2c"
@@ -1153,13 +1160,11 @@ static const struct i2c_device_id wdt87xx_dev_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wdt87xx_dev_id);
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id wdt87xx_acpi_id[] = {
-	{ "WDHT0001", 0 },
+	{ "WDHT0001" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, wdt87xx_acpi_id);
-#endif
 
 static struct i2c_driver wdt87xx_driver = {
 	.probe		= wdt87xx_ts_probe,
@@ -1168,7 +1173,7 @@ static struct i2c_driver wdt87xx_driver = {
 		.name = WDT87XX_NAME,
 		.dev_groups = wdt87xx_groups,
 		.pm = pm_sleep_ptr(&wdt87xx_pm_ops),
-		.acpi_match_table = ACPI_PTR(wdt87xx_acpi_id),
+		.acpi_match_table = wdt87xx_acpi_id,
 	},
 };
 module_i2c_driver(wdt87xx_driver);
-- 
2.47.2


