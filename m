Return-Path: <linux-input+bounces-9465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D2A18983
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 02:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA8863A9130
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 01:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E729F9FE;
	Wed, 22 Jan 2025 01:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2UrtJ4m"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398654670
	for <linux-input@vger.kernel.org>; Wed, 22 Jan 2025 01:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737509282; cv=none; b=GwNjT2Uuk8TKR3NElVNkVjmAhP3EWPKtHzDhedkYq1DzlZs9smL1bOfNwNHso6Rxllv4YGIksh0inYl4Rl5ymOr5wNOxy3YTSMdKca3wG8TQA+7RzXaHvxRdQvwvRoAz6hR7iexTrnqXGa9xfZDM4Hjw2yiMm8yRnsEjuMPdhFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737509282; c=relaxed/simple;
	bh=9hSXvRhyG6II3qu7nIGXA7UzT+0vubqmliRGucrnv30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krWJrfPr5LLPdyugryJyBmppOdYL/EPOB6zxRCROQ4W1CSkikOly7c7fI2RVICQyftwYjF96YcFptZxarqEWZ/Y8lKzW5N4dkfl6C+PjwlPmUTkysCKXd4D+Dne1r/rgEJ563fjZO4K58lj8NIfOQzYfAfVC8QVfDWmhWJysINQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2UrtJ4m; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737509281; x=1769045281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9hSXvRhyG6II3qu7nIGXA7UzT+0vubqmliRGucrnv30=;
  b=j2UrtJ4m1DuyFziF317aY8MpyquK52QEFjyvXuX5tBHVFsszTFhEIEa3
   B2QElRFO/g3qIA8LGcvn2IxE5Ehy8XqmZ/98n1GZoZD684XLbH/niNg1v
   RD8zCk9QlcoGSYAUKNW4CFjfdSc7ITGqqQkAwt4R9LLE909giNq+BGlp7
   MzzXSyqTfuOwxok0ayx8MMvM4k2o0I1bFMaj4RWgaBNirBFHB66QS6J/u
   YClLCUKnBcGN2JFTBXbnBSfrrLP4KL/WXElMRqMudIKaFxVpyiDzlgO1n
   YItlbGJrvB2V4JcJUeTUh7+/gnkqPD3ry7LhsQWEBlKJuOLUUevZtwdQo
   g==;
X-CSE-ConnectionGUID: KFBccMvET/yFe8Q/jhOVYQ==
X-CSE-MsgGUID: Ir890fPVQmO+PAcaBL0+lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37648170"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="37648170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:28:00 -0800
X-CSE-ConnectionGUID: BrbTSygKS7yGELLcoprocw==
X-CSE-MsgGUID: SX6EuePYSWaRG3D1U425kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111964608"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2025 17:27:59 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	changling.he@intel.com,
	even.xu@intel.com
Subject: [PATCH 2/2] HID: intel-ish-hid: Send clock sync message immediately after reset
Date: Wed, 22 Jan 2025 09:29:01 +0800
Message-ID: <20250122012901.743123-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122012901.743123-1-lixu.zhang@intel.com>
References: <20250122012901.743123-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISH driver performs a clock sync with the firmware once at system
startup and then every 20 seconds. If a firmware reset occurs right
after a clock sync, the driver would wait 20 seconds before performing
another clock sync with the firmware. This is particularly problematic
with the introduction of the "load firmware from host" feature, where
the driver performs a clock sync with the bootloader and then has to
wait 20 seconds before syncing with the main firmware.

This patch clears prev_sync immediately upon receiving an IPC reset,
so that the main firmware and driver will perform a clock sync
immediately after completing the IPC handshake.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c         | 9 ++++++---
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index cb956a8c386c..4c861119e97a 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -517,6 +517,10 @@ static int ish_fw_reset_handler(struct ishtp_device *dev)
 	/* ISH FW is dead */
 	if (!ish_is_input_ready(dev))
 		return	-EPIPE;
+
+	/* Send clock sync at once after reset */
+	ishtp_dev->prev_sync = 0;
+
 	/*
 	 * Set HOST2ISH.ILUP. Apparently we need this BEFORE sending
 	 * RESET_NOTIFY_ACK - FW will be checking for it
@@ -577,13 +581,12 @@ static void fw_reset_work_fn(struct work_struct *work)
  */
 static void _ish_sync_fw_clock(struct ishtp_device *dev)
 {
-	static unsigned long	prev_sync;
 	struct ipc_time_update_msg time = {};
 
-	if (prev_sync && time_before(jiffies, prev_sync + 20 * HZ))
+	if (dev->prev_sync && time_before(jiffies, dev->prev_sync + 20 * HZ))
 		return;
 
-	prev_sync = jiffies;
+	dev->prev_sync = jiffies;
 	/* The fields of time would be updated while sending message */
 	ipc_send_mng_msg(dev, MNG_SYNC_FW_CLOCK, &time, sizeof(time));
 }
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index 44eddc411e97..ec9f6e87aaf2 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -253,6 +253,8 @@ struct ishtp_device {
 	unsigned int	ipc_tx_cnt;
 	unsigned long long	ipc_tx_bytes_cnt;
 
+	/* Time of the last clock sync */
+	unsigned long prev_sync;
 	const struct ishtp_hw_ops *ops;
 	size_t	mtu;
 	uint32_t	ishtp_msg_hdr;
-- 
2.43.0


