Return-Path: <linux-input+bounces-16411-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8355EC96024
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 08:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5EAC4E178D
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 07:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C372E2C327A;
	Mon,  1 Dec 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDhPLpQh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70F32C15BB;
	Mon,  1 Dec 2025 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764574230; cv=none; b=e0pfs4o5B1+eBT4Lk4WqN2djxZO0p/ooDcmX09gJUTVJKmqoBJp8f4v+eYX1nmboqfbU6oJw13+tq1Z7lAmtAhL9hkItDz6fDhtirHj+hTDrx1CC7ywhr5orXjb7cemgWTKPP6CBM6TrQaz7aqobf4ONoGWhPk80bCXuKOA0zJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764574230; c=relaxed/simple;
	bh=cQf8kKARSTeUHlo1HHrVBItRsCEzadaHyp7VxsKktT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CZh3qAPtQEXekpJC3KNbfaZRyzs6fuGI1d5ca+ulzJ4oH+9fXA5r6z6Xh8app76epjGr4+WtNPVbXNyhQHkJNWfmMUbiOHAXaae8e11D1Z6oSmXcY8yeZfKSwbHgZDGDPzLjGB0Of1I5/bySWfzulERDNMxYIcp7M8ek7wep8WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDhPLpQh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764574229; x=1796110229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cQf8kKARSTeUHlo1HHrVBItRsCEzadaHyp7VxsKktT8=;
  b=jDhPLpQhaclqcW3FaGSyc4QFUC9VBpoK0KD4T+IFeNuUgKZC2X1gNiws
   wPk1j/MM8Th/xSoiNhW1wdv/nrMjydEN1oTiRPvoKhsnYb+kd5YJuoK9f
   Ymkt0xFaYhguZN8NzYS9PBqqVL2EqSUHrAEeJlLq8imWIjDU0zYQyk2N8
   Dm5o2urMq/UbDWpf5SvaifH0ikDZSnYvrblXl0P1QgUoUgLdRQWHWDgmO
   L8LfafKXe2gB5x9taxnHCJQGXb4WjU0rHbvBenyvUY6nURbGUsPDkIoJH
   Uh7oSNcKtm2/BGWPdpYtc+Jx4Q+xTDUaI+hnPd/ZbPXVWc8nHi+fdyjCF
   g==;
X-CSE-ConnectionGUID: tUnHWnGtQdWD467P9AiiTQ==
X-CSE-MsgGUID: 4on3xuRcTHWFaUw591pd4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="69097659"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="69097659"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 23:30:28 -0800
X-CSE-ConnectionGUID: 20/XBXMFQoOC3spPqkk3jQ==
X-CSE-MsgGUID: 57qKvULpR3OLw9wtN1QotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193886851"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa006.fm.intel.com with ESMTP; 30 Nov 2025 23:30:27 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>
Subject: [PATCH v1 4/4] HID: Intel-thc-hid: Intel-quicki2c: Add output report support
Date: Mon,  1 Dec 2025 15:30:47 +0800
Message-Id: <20251201073047.3313824-5-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251201073047.3313824-1-even.xu@intel.com>
References: <20251201073047.3313824-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for HID output reports in the intel-quicki2c driver by
implementing the output_report callback in the HID low-level driver
interface.

This enables proper communication with HID devices that require
output report functionality, such as setting device configuration or
updating device firmware.

Tested-by: Rui Zhang <rui1.zhang@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
---
 .../intel-quicki2c/quicki2c-hid.c             |  8 ++++++++
 .../intel-quicki2c/quicki2c-protocol.c        | 19 +++++++++++++++++++
 .../intel-quicki2c/quicki2c-protocol.h        |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
index 5c3ec95bb3fd..580a760b3ffc 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
@@ -83,6 +83,13 @@ static int quicki2c_hid_power(struct hid_device *hid, int lvl)
 	return 0;
 }
 
+static int quicki2c_hid_output_report(struct hid_device *hid, u8 *buf, size_t count)
+{
+	struct quicki2c_device *qcdev = hid->driver_data;
+
+	return quicki2c_output_report(qcdev, buf, count);
+}
+
 static struct hid_ll_driver quicki2c_hid_ll_driver = {
 	.parse = quicki2c_hid_parse,
 	.start = quicki2c_hid_start,
@@ -91,6 +98,7 @@ static struct hid_ll_driver quicki2c_hid_ll_driver = {
 	.close = quicki2c_hid_close,
 	.power = quicki2c_hid_power,
 	.raw_request = quicki2c_hid_raw_request,
+	.output_report = quicki2c_hid_output_report,
 };
 
 /**
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index a287d9ee09c3..4030337dd6f5 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -195,6 +195,25 @@ int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 	return buf_len;
 }
 
+int quicki2c_output_report(struct quicki2c_device *qcdev, void *buf, size_t buf_len)
+{
+	size_t len;
+	int ret;
+
+	len = quicki2c_init_write_buf(qcdev, 0, 0, false, buf, buf_len,
+				      qcdev->report_buf, qcdev->report_len);
+	if (!len)
+		return -EINVAL;
+
+	ret = thc_dma_write(qcdev->thc_hw, qcdev->report_buf, len);
+	if (ret) {
+		dev_err(qcdev->dev, "Output Report failed, ret %d\n", ret);
+		return ret;
+	}
+
+	return buf_len;
+}
+
 #define HIDI2C_RESET_TIMEOUT		5
 
 int quicki2c_reset(struct quicki2c_device *qcdev)
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
index db70e08c8b1c..6642cefb8a67 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
@@ -13,6 +13,7 @@ int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
 			unsigned int reportnum, void *buf, size_t buf_len);
 int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 			unsigned int reportnum, void *buf, size_t buf_len);
+int quicki2c_output_report(struct quicki2c_device *qcdev, void *buf, size_t buf_len);
 int quicki2c_get_device_descriptor(struct quicki2c_device *qcdev);
 int quicki2c_get_report_descriptor(struct quicki2c_device *qcdev);
 int quicki2c_reset(struct quicki2c_device *qcdev);
-- 
2.40.1


