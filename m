Return-Path: <linux-input+bounces-16092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C6C58A4B
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BB8EE359B22
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6DA35471B;
	Thu, 13 Nov 2025 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRjZMGgh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B8E346FA5;
	Thu, 13 Nov 2025 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048785; cv=none; b=XU66a5PSr+wo1NiOoiKprui7Q4IQE5i5v7AExAydRdP31Q5WQs6n4RH3WZEU2N6dnndDWBe3gaog5BU3M+XeaRRlrNYlgwoSBhtED4W8Zwe25P9R75PnUxv5048tuG/aweNXQjVQF/JuvtyVI0AWLSY6WUkGesJ2zNkpzI2hwRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048785; c=relaxed/simple;
	bh=NH/ceQ3mjaQT5vDkEJD/gpQXnn3J2iODCOYBIFZ/XiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAuFUoVMBIIzfZYmUClavLZyczrVnzrQZJPt9QxVqZg1iinO6Wmn12G+yAOesJFAl3IZI4pbLBEr3Ik9Q/qSeTG5vLsibNyezJ0/OHtC3fwiJc9WpySOeIJB89riMeJ8CQYNloJ2qjRHZ1p7/naUHUrtEsAQGGbxILBdv8XT+hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRjZMGgh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763048783; x=1794584783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NH/ceQ3mjaQT5vDkEJD/gpQXnn3J2iODCOYBIFZ/XiU=;
  b=jRjZMGgh1JSkChCThIRtryWoJY4e9InMKdZoZS+OW8CcjGWnc3dd8cdf
   398xztILEPKjleVuNkAiuIWYWSPbdoi6T3EQdv2NWJNku38nNMBVZYhZx
   DTEQdv1zo1a6nAlceoplWv2bM3Wbu/FkpkhTxoYcXzoz4jd3jo16LEUbL
   04Tu37GPQO9NmhZfb3gFNbJnyZZ+OnL2Xz9CzA+cQWFZWquPQi4S6hvTn
   NbsR2VPNGkBT0eVEj/mXtFJKyl+krbx30SnoxlcDTUxhp1DD5Susbw5TW
   h7lQIEh4OOafehn9oawbjK5h0F5hYjXj+YKTA2jOhpmdmkW0G7EZJ0GCg
   Q==;
X-CSE-ConnectionGUID: SaHXMf/wQi2QGobeTCKBeA==
X-CSE-MsgGUID: FOWMf11rR8GoZVwztInXdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75448553"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75448553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:46:21 -0800
X-CSE-ConnectionGUID: +Rmr1sA0Qvif7Q+t9tR6zg==
X-CSE-MsgGUID: sF/6SQ2jRM21vyIuMdyKmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="212933929"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 07:46:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9C2E89B; Thu, 13 Nov 2025 16:46:17 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 5/5] Input: gpio_decoder - don't use "proxy" headers
Date: Thu, 13 Nov 2025 16:44:46 +0100
Message-ID: <20251113154616.3107676-6-andriy.shevchenko@linux.intel.com>
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/misc/gpio_decoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index 057717de9849..f0759dd39b35 100644
--- a/drivers/input/misc/gpio_decoder.c
+++ b/drivers/input/misc/gpio_decoder.c
@@ -7,16 +7,17 @@
  */
 
 #include <linux/bitmap.h>
-#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/device/devres.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
-#include <linux/kernel.h>
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
 struct gpio_decoder {
 	struct gpio_descs *input_gpios;
-- 
2.50.1


