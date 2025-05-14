Return-Path: <linux-input+bounces-12364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3343AB6346
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D4DC7B2C4D
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7F8202F8F;
	Wed, 14 May 2025 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiQSAanP"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00C202963;
	Wed, 14 May 2025 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204696; cv=none; b=RZqHFqUOsVxWsGTdyVPuMIEzNK/KxAuzE0FnbUerVDfaPCWNAQX3qHus4ZqzmA1cOGfaoImuKSHhsrXVWTYXseU4T7QJ3YXhlnUB/yWkTn0PbEkWypjM2fclJZGw9lSXjvSTClSYaxdG5FP2dZdR1cpK1zmIGXKI9IiMFUGYXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204696; c=relaxed/simple;
	bh=+4Krdkt68RlcOdChDTGXUOMRniV+6NGGjzqsCT5/vio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DLuL4R7IC5op1HMy9WaOFC8YhbxGWazuf5vK5XE5OA4Z3PNIBp/rq25upzhOY/p3DRxr1i/Wyio28ZmBFdg/Cd2vhW++00on/dTnR64XHQjQgzu910JyWCkrUcoCgMoWHXc8/t5xYCRvygWHxOgpwx/gSp7PiitqNs8OLwGTIfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiQSAanP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747204695; x=1778740695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+4Krdkt68RlcOdChDTGXUOMRniV+6NGGjzqsCT5/vio=;
  b=kiQSAanPggGl6ZLWo8VysGFGijut0E3J6ygdN7p75VoDihbZW/MiEtCT
   fMGx4n40wszPasofei9PENLqJOyE7eKPiC24gWVpCB6JzgRXs5RfNrpdM
   XqMStqMjSQKFG3wF7XLWuHVMr6RWqhshH+20IEwd9CBsMSmebHCFv0FWG
   QJrVzn1NxdCGHxmif/hJj2KVGPNCZp7BcRZxNju/CyCwU3L2EeY1WgKXq
   +NvJK0zi39SFRIdSYIxJ0yKmbE4gMR/SOJyjAhnQY/pXpLz+6Or2HUi5r
   m2X2VOjDR4s4kre3YWFIFTTxU6DsO8+knO3ms/hwgWo4tB08+vqgUknZf
   w==;
X-CSE-ConnectionGUID: Us4Y5UmSSHm4294Qc6uahw==
X-CSE-MsgGUID: kfO5j2keQ6Gv8cXBLAxD2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49247422"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49247422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:38:15 -0700
X-CSE-ConnectionGUID: I3ARBeUJQLCydZ3O72z0AA==
X-CSE-MsgGUID: r22+eeg2QsS4y/MDAxRLPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138933960"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 23:38:13 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Chong Han <chong.han@intel.com>
Subject: [PATCH v1 2/3] HID: Intel-thc-hid: Intel-quickspi: Enable Wake-on-Touch feature
Date: Wed, 14 May 2025 14:37:34 +0800
Message-Id: <20250514063735.141950-3-even.xu@intel.com>
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
 .../intel-thc-hid/intel-quickspi/pci-quickspi.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index d4f89f44c3b4..5e5f179dd113 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -11,8 +11,11 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 
+#include <linux/gpio/consumer.h>
+
 #include "intel-thc-dev.h"
 #include "intel-thc-hw.h"
+#include "intel-thc-wot.h"
 
 #include "quickspi-dev.h"
 #include "quickspi-hid.h"
@@ -46,6 +49,15 @@ static guid_t thc_platform_guid =
 	GUID_INIT(0x84005682, 0x5b71, 0x41a4, 0x8d, 0x66, 0x81, 0x30,
 		  0xf7, 0x87, 0xa1, 0x38);
 
+
+/* QuickSPI Wake-on-Touch GPIO resource */
+static const struct acpi_gpio_params wake_gpio = { 0, 0, true };
+
+static const struct acpi_gpio_mapping quickspi_gpios[] = {
+	{ "wake-on-touch", &wake_gpio, 1 },
+	{ }
+};
+
 /**
  * thc_acpi_get_property - Query device ACPI parameter
  *
@@ -426,6 +438,8 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
 
 	thc_interrupt_enable(qsdev->thc_hw, true);
 
+	thc_wot_config(qsdev->thc_hw, &quickspi_gpios[0]);
+
 	qsdev->state = QUICKSPI_INITIATED;
 
 	return qsdev;
@@ -442,6 +456,7 @@ static void quickspi_dev_deinit(struct quickspi_device *qsdev)
 {
 	thc_interrupt_enable(qsdev->thc_hw, false);
 	thc_ltr_unconfig(qsdev->thc_hw);
+	thc_wot_unconfig(qsdev->thc_hw);
 
 	qsdev->state = QUICKSPI_DISABLED;
 }
-- 
2.40.1


