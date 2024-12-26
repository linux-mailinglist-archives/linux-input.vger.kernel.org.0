Return-Path: <linux-input+bounces-8775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CF9FC772
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 02:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B395E1882C3A
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 01:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3339D17BCE;
	Thu, 26 Dec 2024 01:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3ArIXg4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33432B9A4;
	Thu, 26 Dec 2024 01:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176954; cv=none; b=Vu5TlT4NN/QfrWnREPkfqfDDXALC4BKBRz/zcVgZZI//Cy4EXW2/yNX8yzzA5L+kOke3oMovQFLLsiIBfxNflYgD8WbQ25mjOubogDGH2gcnP3qLanCJDbf3xlq85eGO/b5ZKhY0R+a7wW6eqx3mgj1DYFea4xKtgVR8fYMigqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176954; c=relaxed/simple;
	bh=k2tVnWEIrHd4osFoyjY9FXoOiQ6TfMNd6KstRZjhJrI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pX3CY+2BcbCvkt33cc+24jSHqvwtnfn5T4G5UJx+KPfZjwXLf+P5oZryYVgCON25M/3xuyljvMy3yZYxjGSTQIsaQPbJdi3e+N7FjKc8+3tb8TLqtI0SXFE52dVUqjIVGDn+C43VX7ClMsVy/073STcqy5KHtcShD1F1dfO3+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3ArIXg4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735176952; x=1766712952;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k2tVnWEIrHd4osFoyjY9FXoOiQ6TfMNd6KstRZjhJrI=;
  b=T3ArIXg4MAFOqKprXTU0t8reUCczXUAqDAXVDrX0rqkqrZwG2hxYomQL
   Oa7/xfjrSKMMqCXvSe2JPpH2H2r2ghMXVsDv01vaCL6ZvielIj9T36zdL
   iqOhER1/ggrDp/71ncp/zp8FMw7lZ9VLCWFCJ0PJtIUJNU2+kO3mruUcR
   b9KF6zSz/s1s9R3ocsHK8tBJONZ/Z6zHz2/hLilO5kRY98OCOBlPu75vv
   1LDuGRSLp3cVqSPCxjBHmPmYrr+Y44v4g/kb7rljFk+0129+Qy2+uhscd
   cWZlabxN1/ZtaOw4GrxLgeo5AIRAv4BzB7jCvKV0p6PI+GT1KDgs74ik/
   g==;
X-CSE-ConnectionGUID: 5peYIZw3RlKzh5z+ZtX6jQ==
X-CSE-MsgGUID: qh+Bkzw2SsSFRof8Ne6ZkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39284761"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="39284761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 17:35:51 -0800
X-CSE-ConnectionGUID: AKjzrJ4QRnGFHKSRVpVdGg==
X-CSE-MsgGUID: sdSoZaboRFSIFWq4GkuRbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="104779795"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 25 Dec 2024 17:35:49 -0800
From: Even Xu <even.xu@intel.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH] Hid: Wacom: Add PCI Wacom device support
Date: Thu, 26 Dec 2024 09:35:27 +0800
Message-Id: <20241226013527.3048277-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PCI device ID of wacom device into driver support list.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/wacom_wac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 5501a560fb07..b60bfafc6a8f 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4946,6 +4946,10 @@ static const struct wacom_features wacom_features_0x94 =
 	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
 
+#define PCI_DEVICE_WACOM(prod)						\
+	HID_DEVICE(BUS_PCI, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
+	.driver_data = (kernel_ulong_t)&wacom_features_##prod
+
 #define USB_DEVICE_LENOVO(prod)					\
 	HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
@@ -5115,6 +5119,7 @@ const struct hid_device_id wacom_ids[] = {
 
 	{ USB_DEVICE_WACOM(HID_ANY_ID) },
 	{ I2C_DEVICE_WACOM(HID_ANY_ID) },
+	{ PCI_DEVICE_WACOM(HID_ANY_ID) },
 	{ BT_DEVICE_WACOM(HID_ANY_ID) },
 	{ }
 };
-- 
2.40.1


