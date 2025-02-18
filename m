Return-Path: <linux-input+bounces-10109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD63A39377
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 07:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31FF17A1973
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 06:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4FB1B21AC;
	Tue, 18 Feb 2025 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHf1erWo"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41617482;
	Tue, 18 Feb 2025 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739860589; cv=none; b=pIZLJ4r7cAZpCO49rn5UgDsDYJ895im0+CGfTMMYDnrat1d46RX3OvByHmL+nZNPYH1RxJoih+d+ilRp/vxouPGXb8OAf+SJoLSzSNuhUZ6gPeYuFVGtaTtSTD8DLG6Aod03TkN0OGpSlNMZHn6EJljwomDmzDAMsBSog6Yox58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739860589; c=relaxed/simple;
	bh=ji7OA+qmRSMMJ26TLBqdJ1B+xeM5CrdPpKxix/eMAic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uc5Q3gd2vuPPpFpo4o5iZ1Ry9kB/iI8p4tdgihVryzvLWgXGl+J0cy4TEb0oU0VW/GPwah8DqIKXy0YiUomNyD/3mK/gtVVvimkgFHPYFGvsZ+PYLU6OPPShVgB66stEsf7PNmMhHXdVHYlxO+HmoVII4GuK2+OVZA5ULQsds7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHf1erWo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739860587; x=1771396587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ji7OA+qmRSMMJ26TLBqdJ1B+xeM5CrdPpKxix/eMAic=;
  b=GHf1erWoVmzfdzFYiDI7pADMHT8AWujuGhxAn3jN45fR7Sphv1N1GOvm
   U8pEyZG0mtNz87xdiprpr01vZ+PeH31sfVaiBJDR5KHwGQrpWoHiRluJK
   plR3UOpWfpdRCxMhCXSvYG0iyB95TXhl/JhsA4A3VaJwk5CmIGc6Il+uf
   uydRGuAPS6UgbRgB+CFNeqR5usqrQdA9N3M37Dzv5sZtMJ5dDFV8qSmCF
   NWkXnbU5ufcSGoDrwEULEuawDHwQoeCATgJpQ8ygT8KnSO2FRgSo/f3F8
   3/+18rjssjhLqAm87m5dOXVKnUzPxdzEfwAsE8HSWdCY/qlKqRvaaCsAW
   g==;
X-CSE-ConnectionGUID: 7r2lqkBsR7WGjb+wGE+IxA==
X-CSE-MsgGUID: W/VigcH/TUSMgvypsI6zPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40248500"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40248500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 22:36:27 -0800
X-CSE-ConnectionGUID: CVaNfDgFRKSPaqQMv018jw==
X-CSE-MsgGUID: fZyVdhL1TvOS8DywZasZyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151500925"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2025 22:36:26 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	stable@vger.kernel.org
Subject: [PATCH 2/2] HID: intel-ish-hid: Fix use-after-free issue in ishtp_hid_remove()
Date: Tue, 18 Feb 2025 14:37:30 +0800
Message-ID: <20250218063730.1211542-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218063730.1211542-1-lixu.zhang@intel.com>
References: <20250218063730.1211542-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The system can experience a random crash a few minutes after the driver is
removed. This issue occurs due to improper handling of memory freeing in
the ishtp_hid_remove() function.

The function currently frees the `driver_data` directly within the loop
that destroys the HID devices, which can lead to accessing freed memory.
Specifically, `hid_destroy_device()` uses `driver_data` when it calls
`hid_ishtp_set_feature()` to power off the sensor, so freeing
`driver_data` beforehand can result in accessing invalid memory.

This patch resolves the issue by storing the `driver_data` in a temporary
variable before calling `hid_destroy_device()`, and then freeing the
`driver_data` after the device is destroyed.

Fixes: 0b28cb4bcb17 ("HID: intel-ish-hid: ISH HID client driver")
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid.c b/drivers/hid/intel-ish-hid/ishtp-hid.c
index 00c6f0ebf356..be2c62fc8251 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid.c
@@ -261,12 +261,14 @@ int ishtp_hid_probe(unsigned int cur_hid_dev,
  */
 void ishtp_hid_remove(struct ishtp_cl_data *client_data)
 {
+	void *data;
 	int i;
 
 	for (i = 0; i < client_data->num_hid_devices; ++i) {
 		if (client_data->hid_sensor_hubs[i]) {
-			kfree(client_data->hid_sensor_hubs[i]->driver_data);
+			data = client_data->hid_sensor_hubs[i]->driver_data;
 			hid_destroy_device(client_data->hid_sensor_hubs[i]);
+			kfree(data);
 			client_data->hid_sensor_hubs[i] = NULL;
 		}
 	}
-- 
2.43.0


