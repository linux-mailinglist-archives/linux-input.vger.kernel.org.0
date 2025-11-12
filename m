Return-Path: <linux-input+bounces-16050-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEDC5414F
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 20:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B7744E0675
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6F534DB4C;
	Wed, 12 Nov 2025 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMzWwhc9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9BE34C80C;
	Wed, 12 Nov 2025 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974862; cv=none; b=baibeBFGyxl4SDD/ikUmHAE6D8u0XfCzeVOI/aLCrOHh61/NSMRAxvrepnR3aRwfiaWOpfa7lNcvkUNqw/lpUAs+lKbYek/ig0SqE2LMabjmy4e+GUQdLf0C1lZurJKTTki+fd1YBTPkt/plBZ40GgbutdM6Ia/mrX69xcpAM6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974862; c=relaxed/simple;
	bh=8JxfYB+Q+An/5n/qTbjztLA2HZ6jSDINtZpjr0jXnSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pb5Hup5Nnb+eqgp4+RRj8pqufBxsqrJJkxHOfVNvXySoDQwESo/ds2RIZoLtoVyXbVwSBi6Wb51GhdeiLfNi3Wl7Sx3t8e1MVOmLlt6oJupyHEkVLyTdoXRY1LQfgXV9GxSqlcdir9JzNppddiqf4b6p8KQ/zbxgpbvElcA1DAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMzWwhc9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762974860; x=1794510860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8JxfYB+Q+An/5n/qTbjztLA2HZ6jSDINtZpjr0jXnSA=;
  b=IMzWwhc9H33aDpgh+yaKtRIcEdwFng2a6mqh6C+FVPtMhXWo8K/9WLq1
   x/7lquZ+Es1oHhrhxUUcqGN+PIiefBj8nFQv/DfBcjGWvU0EVNrsl+yOy
   WCtgY87POhG4zQDj85tF74e/LcEPHqhm9kj6SU6vkl1fMe/pMShhKRC5Y
   1JZ0PWRcldBYwq3MuRz6k6mw9A/G4ygDqkxGI/qzTASAGSa5nRrBTSwkP
   OUwCkxmHW66E30AnDwuRJvh5G0LZx0gzmbDwlSvJyEvE/uM0Bpwsh7Oci
   vvr4vJQhPUBMro91F/kU1B4Yom3ZGEHDqs6H6K1wgbCZhxmErG+DBUt1P
   w==;
X-CSE-ConnectionGUID: Sss9fLKkQ96Hkznia+GYGQ==
X-CSE-MsgGUID: 1nAD30znRxig2kduGnzGZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82678728"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="82678728"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 11:14:19 -0800
X-CSE-ConnectionGUID: iVQPWONJSm+jFXwAijBBJQ==
X-CSE-MsgGUID: 4G6/DpzMQxiIqv9zzyMHUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="189576359"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2025 11:14:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B20249A; Wed, 12 Nov 2025 20:14:14 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 5/5] Input: gpio_decoder - don't use "proxy" headers
Date: Wed, 12 Nov 2025 20:13:21 +0100
Message-ID: <20251112191412.2088105-6-andriy.shevchenko@linux.intel.com>
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/misc/gpio_decoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index 299f16d3bf4d..5fe56ae58183 100644
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


