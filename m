Return-Path: <linux-input+bounces-12365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1ADAB6349
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948AF4A37F7
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12AF206F2A;
	Wed, 14 May 2025 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmdMUL8y"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA3E204592;
	Wed, 14 May 2025 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204698; cv=none; b=hS9OxhgIml4+OCz1k1Um40eO9bX/Xe1zwV0+In9oeCDOwpGOfDhVSVxLRzMSEZH6mZjLqChSfMP9jyhK+ZxeMtWR4DPK++fgLx+TMmLwP72tZgsDpyZn9UswOVsYs+C30L3cJlHHFHnbmZ7plC631iKxCruqW8aymX4uuCn8nYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204698; c=relaxed/simple;
	bh=O5XoA45OVZeec67U6NzneQ/tSvQ4WPrXJXEkDN3BaKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V1WE186z0nFHW+yDJ1YzJikQpyXWjk0VbVIN5pf5zdCcpa6QXxvNMJYeeM/jebMVjKQJKzkkK00ugvUXp15DwCrIU/+ZoAc06L85tcJi1PDpfqCFTyliRkbO78XZV1sBQL6kHcTzgjXaj8sMpD8w4C8Xpk+t2cryU4IxmR8q17A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmdMUL8y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747204697; x=1778740697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O5XoA45OVZeec67U6NzneQ/tSvQ4WPrXJXEkDN3BaKw=;
  b=mmdMUL8ypZvJhchuOhc/g+Bgfb+ZAvbf1Gri61gzz6PHTBbtKQYgR1lY
   Szn2s6T6bSxeSQblO8HZ2vWC9wdTZr25B9A/Gg7i5CMXLQUiI7+zAjztT
   6MquPAr/I7F3MV/g00Uj3HkxeTsvJhiwavjy1rZOxDc01X9n7H27HDZAM
   rzW3cxcmDvya/VXKUC5KvRBuUh66o+sNsV0VPYQaA30Xb9ez5JNlCX4RZ
   GMPO/WLC2tNgSypIq4wYzYErEMeyiIuCtLyaQaZXQ2AP+SiNvCoO0heuW
   u9Ufwav7r1zE9AP9eIUdaChuBBKGxLJyuaOGPd3gGtBrGzEvr0a7c195P
   g==;
X-CSE-ConnectionGUID: drpuVKXATWGCsMIpFMEPbQ==
X-CSE-MsgGUID: Gp+Wf9iITPa2Cv3wuks6zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49247427"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49247427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:38:17 -0700
X-CSE-ConnectionGUID: 7KRsks/CQ3e38/Id89Eakg==
X-CSE-MsgGUID: hzxwkZHYRJGw1MUjBHdYbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138933969"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 23:38:14 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Chong Han <chong.han@intel.com>
Subject: [PATCH v1 3/3] HID: Intel-thc-hid: Intel-quicki2c: Enable Wake-on-Touch feature
Date: Wed, 14 May 2025 14:37:35 +0800
Message-Id: <20250514063735.141950-4-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250514063735.141950-1-even.xu@intel.com>
References: <20250514063735.141950-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch call THC helper functions to enable Wake-on-Touch (WoT)
during driver initialization and disable it when driver is removed.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Chong Han <chong.han@intel.com>
---
 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 40faba5bd81d..3335775dcf4d 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -11,8 +11,11 @@
 #include <linux/sizes.h>
 #include <linux/pm_runtime.h>
 
+#include <linux/gpio/consumer.h>
+
 #include "intel-thc-dev.h"
 #include "intel-thc-hw.h"
+#include "intel-thc-wot.h"
 
 #include "quicki2c-dev.h"
 #include "quicki2c-hid.h"
@@ -31,6 +34,14 @@ static guid_t i2c_hid_guid =
 static guid_t thc_platform_guid =
 	GUID_INIT(0x84005682, 0x5b71, 0x41a4, 0x8d, 0x66, 0x81, 0x30, 0xf7, 0x87, 0xa1, 0x38);
 
+/* QuickI2C Wake-on-Touch GPIO resource */
+static const struct acpi_gpio_params wake_gpio = { 0, 0, true };
+
+static const struct acpi_gpio_mapping quicki2c_gpios[] = {
+	{ "wake-on-touch", &wake_gpio, 1 },
+	{ }
+};
+
 /**
  * quicki2c_acpi_get_dsm_property - Query device ACPI DSM parameter
  * @adev: Point to ACPI device
@@ -398,6 +409,8 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 
 	thc_interrupt_enable(qcdev->thc_hw, true);
 
+	thc_wot_config(qcdev->thc_hw, &quicki2c_gpios[0]);
+
 	qcdev->state = QUICKI2C_INITED;
 
 	return qcdev;
@@ -413,6 +426,7 @@ static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
 {
 	thc_interrupt_enable(qcdev->thc_hw, false);
 	thc_ltr_unconfig(qcdev->thc_hw);
+	thc_wot_unconfig(qcdev->thc_hw);
 
 	qcdev->state = QUICKI2C_DISABLED;
 }
-- 
2.40.1


