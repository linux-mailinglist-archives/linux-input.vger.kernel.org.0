Return-Path: <linux-input+bounces-16542-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB19CB7B52
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 03:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836163020C6D
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 02:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBB123D7DC;
	Fri, 12 Dec 2025 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZQLc+8e"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B281AA8
	for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 02:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507702; cv=none; b=WpAUkoZVepxR8sfcHm/vXTRxQ90w3HDTVgFy9mYc2wh1IFHwbBegX4nM3q6lgiMCO3ppvH9Wvsjt3DLfHxU9zyGK1JaoMynLUlD/FHn9kMD7mJtdFH7Q/bAu1Q/gL/LkAouF7heq2CWtNxv9WeUwDfdn/d48kErglVGi3jKqSGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507702; c=relaxed/simple;
	bh=QzZhIIpNOd5GLYHfuWuod7VdJYcFHcaM1GTE5EFnAGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m62jfnw4mey1BZbZVq/xdXgk16m0wDdZVpyBPG0jr9+5VKQ8HUqyGKd5VdqcV2C9ZO/4MgRmwXMrFIYyHSP5z1BFW8PWRX+879esI1d3Veorr+vhlsIFHRGd/R+Wuj1gRVqJzchAyXgpbV48dSctYrRO1owBWiAHectVaXOg0Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZQLc+8e; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765507701; x=1797043701;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QzZhIIpNOd5GLYHfuWuod7VdJYcFHcaM1GTE5EFnAGY=;
  b=BZQLc+8ecPKFlCvKr4/6hCRx46M4/+A28l12Oyq5xmzSwD9mxWG7YWTs
   fzyzDB6SyuAv705py2BG409Ze4XlEe9jbAAqUBlv6QzBnAWv34609ze8+
   9JGIgv7EiEL7Kgrr1RRyy0BpqQJ/RAo45ay09gw7yc22MLUY7X9E5JZ8o
   sm/6VImnutY/5EWa6GWzLnVT7ooJGKX1qnL4Nd8qfXT+XslPY7DQpt2aE
   W3YakMvxqplACmQPZGkdx9NZQnhC2bn3IinbG4AlUcwymL3G6hga3/oHA
   MTBlOqvhUs7im5PfeiMcfofIBS95LgTVr0cHgcnhgEr6LNcR/LCv0yHAU
   g==;
X-CSE-ConnectionGUID: zPnCwQw5QcWX/+GshZAlhg==
X-CSE-MsgGUID: fopULUDQTO+VgR7qWjOdRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="77813557"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="77813557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 18:48:21 -0800
X-CSE-ConnectionGUID: tdzJTgIjTSqLzGYo3NfEDQ==
X-CSE-MsgGUID: 8PJZQ+f4TeeCtoje+WrpvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="202043738"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa005.jf.intel.com with ESMTP; 11 Dec 2025 18:48:18 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	selina.wang@intel.com,
	wenji1.yang@intel.com,
	chee.yau.chan@intel.com
Subject: [PATCH] HID: intel-ish-hid: Reset enum_devices_done before enumeration
Date: Fri, 12 Dec 2025 10:51:50 +0800
Message-ID: <20251212025150.1390294-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some systems have enabled ISH without any sensors. In this case sending
HOSTIF_DM_ENUM_DEVICES results in 0 sensors. This triggers ISH hardware
reset on subsequent enumeration after S3/S4 resume.

The enum_devices_done flag was not reset before sending the
HOSTIF_DM_ENUM_DEVICES command. On subsequent enumeration calls (such as
after S3/S4 resume), this flag retains its previous true value, causing the
wait loop to be skipped and returning prematurely to hid_ishtp_cl_init().
If 0 HID devices are found, hid_ishtp_cl_init() skips getting HID device
descriptors and sets init_done to true. When the delayed enumeration
response arrives with init_done already true, the driver treats it as a bad
packet and triggers an ISH hardware reset.

Set enum_devices_done to false before sending the enumeration command,
consistent with similar functions like ishtp_get_hid_descriptor() and
ishtp_get_report_descriptor() which reset their respective flags.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index f37b3bc2bb7d..6d64008f2ce0 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -495,6 +495,7 @@ static int ishtp_enum_enum_devices(struct ishtp_cl *hid_ishtp_cl)
 	int rv;
 
 	/* Send HOSTIF_DM_ENUM_DEVICES */
+	client_data->enum_devices_done = false;
 	memset(&msg, 0, sizeof(struct hostif_msg));
 	msg.hdr.command = HOSTIF_DM_ENUM_DEVICES;
 	rv = ishtp_cl_send(hid_ishtp_cl, (unsigned char *)&msg,

base-commit: c75caf76ed86bbc15a72808f48f8df1608a0886c
-- 
2.43.0


