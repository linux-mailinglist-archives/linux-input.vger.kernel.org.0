Return-Path: <linux-input+bounces-16089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A29C9C589F4
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3DB17363E43
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A5C346FA0;
	Thu, 13 Nov 2025 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpbvZszs"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952692F28FA;
	Thu, 13 Nov 2025 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048783; cv=none; b=nIl/R3Uenbzdr3eWL2ibGwuQs16JgGcBYj8Zt07MDiG/ydVepPAoQz4Eix0hQEswHCE1yLqecuxIRA65atfNDboRiTObp2FHSdH88h2vAnIuZIM+ZiAQjcuBZfZ4GW7EiItyNZcAjNIzwboaRHVXUGHac8+YWmEVd+AnCGxOTIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048783; c=relaxed/simple;
	bh=j8WPIWl6qkDYlVSZbuoLCIhGuEJ83qGYo523B0+8Xus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ON5P/5aK3rrlmy5o3FoHwkm0CuLAejGfZG75NhaZMZ6g5FFbyqSJVcDJJJpBvYLJjvGOJYsemDDFe4TFUC3CF0017VYg4d24zUS0k0IIS2MbqDwkl6Dc6KM9uBxWzgN47d5C2ne1sq/YjBc177boHrSeHb97kkrdJFvMEGWhN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpbvZszs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763048782; x=1794584782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j8WPIWl6qkDYlVSZbuoLCIhGuEJ83qGYo523B0+8Xus=;
  b=XpbvZszsSm/Ty0kP89lNGILZ/jKL7gb2vQRNx9qPdnWagg9pKU6oCe4C
   oQcvMu7mjkMK1Yh7mWGJYAkeqIenBHDAdOBir4kwCkfszNS2qImt+U3sd
   XbBWgM8uin+o/RysgBFnl46toNKZOyQLE0G/59ycySDac8bXaZ9yWNaSD
   MYOtPX1H/kKw2ZP9z/Gyo/wPTErm9z4z6jDCHj02F66XS8p0i00drjdiE
   +yvoXUyyvLO4kanfH42jZ3GrH4d73uFxRosq4NnZHX0vovOKclRXA6Pvx
   yQ5Ng2cZI/aF0ZZ79P1I9nOj6I03jIkftpZWu0x//QQUvKR/dikfAHDxw
   Q==;
X-CSE-ConnectionGUID: GaQkzg1UShSG537vcQ1h2g==
X-CSE-MsgGUID: gJpEHaVSRKWKPzhxKvQo4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75448545"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75448545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:46:20 -0800
X-CSE-ConnectionGUID: j06jTqgPRO+DBiFm+q5DYg==
X-CSE-MsgGUID: aQM3pfs5Q+KfBOPMxuozPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="212933922"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 07:46:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9382D99; Thu, 13 Nov 2025 16:46:17 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 3/5] Input: gpio_decoder - replace custom loop by gpiod_get_array_value_cansleep()
Date: Thu, 13 Nov 2025 16:44:44 +0100
Message-ID: <20251113154616.3107676-4-andriy.shevchenko@linux.intel.com>
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

There is a custom loop that repeats parts of gpiod_get_array_value_cansleep().
Use that in conjunction with bitmap API to make code shorter and easier to
follow.

With this done, add an upper check for amount of GPIOs given based on
the driver's code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/misc/gpio_decoder.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index a2ae400790f9..7f319b932550 100644
--- a/drivers/input/misc/gpio_decoder.c
+++ b/drivers/input/misc/gpio_decoder.c
@@ -6,11 +6,13 @@
  * encoded numeric value into an input event.
  */
 
+#include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -26,23 +28,18 @@ struct gpio_decoder {
 static int gpio_decoder_get_gpios_state(struct gpio_decoder *decoder)
 {
 	struct gpio_descs *gpios = decoder->input_gpios;
-	unsigned int ret = 0;
-	int i, val;
+	DECLARE_BITMAP(values, 32);
+	unsigned int size;
+	int err;
 
-	for (i = 0; i < gpios->ndescs; i++) {
-		val = gpiod_get_value_cansleep(gpios->desc[i]);
-		if (val < 0) {
-			dev_err(decoder->dev,
-				"Error reading gpio %d: %d\n",
-				desc_to_gpio(gpios->desc[i]), val);
-			return val;
-		}
-
-		val = !!val;
-		ret = (ret << 1) | val;
+	size = min(gpios->ndescs, 32U);
+	err = gpiod_get_array_value_cansleep(size, gpios->desc, gpios->info, values);
+	if (err) {
+		dev_err(decoder->dev, "Error reading GPIO: %d\n", err);
+		return err;
 	}
 
-	return ret;
+	return bitmap_read(values, 0, size);
 }
 
 static void gpio_decoder_poll_gpios(struct input_dev *input)
@@ -81,6 +78,9 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 	if (decoder->input_gpios->ndescs < 2)
 		return dev_err_probe(dev, -EINVAL, "not enough gpios found\n");
 
+	if (decoder->input_gpios->ndescs > 31)
+		return dev_err_probe(dev, -EINVAL, "too many gpios found\n");
+
 	if (device_property_read_u32(dev, "decoder-max-value", &max))
 		max = (1U << decoder->input_gpios->ndescs) - 1;
 
-- 
2.50.1


