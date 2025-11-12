Return-Path: <linux-input+bounces-16052-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66816C54155
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 20:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E85A4E15A2
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A78634EF04;
	Wed, 12 Nov 2025 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxqxILt8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE4E34D908;
	Wed, 12 Nov 2025 19:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974863; cv=none; b=lgvy3Lx+7c/SLu6zkmI91+MNxf9sUFlVK86ysWUrDOi7UMG7/Ij1xh+OsIu5CA3AD3j8NKElqwDmcJXaue89Bag1jCLF2cX867ruCzYg6BcsULF2zm6uEhqQxV84+1Sr/8H8K33GLfydH8kndL+Dv6c9x1E07e4XrPSAd1f05Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974863; c=relaxed/simple;
	bh=JPnsL1Fqba1yPR8H9hojJp1nnZEdKoqx4paCLzojuPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9bGQnETzikEKSKmYkONP37XJv/9ByMFlKfPEPvBSqD/UDFU47OOrlcNZ77YiA3Pz4aZ0vUrz960LfgJvrqz/EpZ/TfG9YOjaN/dAlSSfYgUkYsRxFTSw+UIMTRaUwRJFojoZHtk1m+ZFyjxnvUPlfBpoqVU6TfvIN1udASUVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxqxILt8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762974861; x=1794510861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JPnsL1Fqba1yPR8H9hojJp1nnZEdKoqx4paCLzojuPw=;
  b=ZxqxILt8vy0PcOsi5HJwIC7eEJTl4H8lXPDEed4U5ek7s0gPSnD3gqnd
   erJGhXPkaqiSDkNg9C8CeznQJEnOKkUGwOuYp+PJhfCuMF3krbf9FPNXa
   6QPciYT8L7KRwrZudbJyVQQBbIgHGyAxfuS1frpCAK5sLSghpDPwL1BaO
   c8S+6ouvYgn/d0tOzRUKwtgW6bsUXAdbSyhvr8/+fLmJe/mMBNJi6rHFG
   h1qQ2j8DKInmU3NoYzfHenK9EbpK2giau5T7QFzqvvyQRUGk80FxOKWX8
   I4NMY/iwqLq986oOVU+WYiRBknpmvqW5x2GVMVndJgcGlZ8BPPoPooyYi
   g==;
X-CSE-ConnectionGUID: 1LgZvyrPQaqsyZVlS7yX+Q==
X-CSE-MsgGUID: sfd6FRBjQASJOU2kkP0hLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65086887"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="65086887"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 11:14:16 -0800
X-CSE-ConnectionGUID: i8JkIVxFSm64RomS/mGzig==
X-CSE-MsgGUID: /St21FVZRD+BKR7xYN/BHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="219951619"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2025 11:14:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A996398; Wed, 12 Nov 2025 20:14:14 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 3/5] Input: gpio_decoder - replace custom loop by gpiod_get_array_value_cansleep()
Date: Wed, 12 Nov 2025 20:13:19 +0100
Message-ID: <20251112191412.2088105-4-andriy.shevchenko@linux.intel.com>
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
index a2ae400790f9..8c07f7ff66e5 100644
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
+		dev_err(decoder->dev, "Error reading GPIO: %d\n", val);
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


