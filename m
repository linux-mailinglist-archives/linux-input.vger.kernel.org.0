Return-Path: <linux-input+bounces-9464-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C66A18982
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 02:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D14A93A40FB
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 01:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6D761FF2;
	Wed, 22 Jan 2025 01:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWw48g9J"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE8060DCF
	for <linux-input@vger.kernel.org>; Wed, 22 Jan 2025 01:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737509281; cv=none; b=lrPQx26HoJEDRVsgeZs8Nfjepu4OXWo0Jiw1oblwJ5YVjlGjzTvM4CJXwPcuNJDe658OGzgIJyVdy/rmCNROya83518PJG6+RHa7Q/2/P2nAzphwtJmcs8X4fq2a5+HWZDU/OLjbRok78IqAP2NgoEpAzmb9JY/YK2LxqksdD6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737509281; c=relaxed/simple;
	bh=l/VFQZWxdKaO0IFD6oOzgA8BJxH17+SpWFpcUJTG4Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXjU5U9PFNzJhGwQ9EDP5BebPz0rtGzA2eFROr6iv1kmCAEU+NcLNHajw7NB0QDVgimZZ+66qDzNaEpFJe+SV6QV/WHxnXog5C/DnszC4iE1h9gvphUh/xjkS9kUITZhVClPpsbVRDbYAeFzmyso0qu2oqx34yGmS8nLkKly/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWw48g9J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737509279; x=1769045279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l/VFQZWxdKaO0IFD6oOzgA8BJxH17+SpWFpcUJTG4Zk=;
  b=nWw48g9JJfCKOYeHpO+k1EaSWDp/RBLRigyXkjzADqPttKtV2KZc+K7A
   IAGH/e5Nq5Zz3YskBgsXjsSWVam6zI/xosYukx0m1HbFIr/Vh5iL5S6CK
   nA69Uenq43SOXyOYC+QjEwPMTYIrFegrXfx5Wp0s84QLbIYoeXB9bwEAe
   Fg854oJPCWBIjCX713KUpvtMH1NkW/qsjUtzQnwSVDM75Ye51TIo2gnic
   S8U0CsqmYhrxYspkY0ns957IRQKTfVPjFt9fOChis+8J7fGXguVSINoY8
   TYvVg/3Uj3XzjRZzbFLtohqCRJsLBHb9yTHbepoMMh9JxtFu4Oc4ZvY+q
   A==;
X-CSE-ConnectionGUID: f449OD3VR4S2jcebwdkLdA==
X-CSE-MsgGUID: hr/j2IbUSDuHumAuLH6z0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37648141"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="37648141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:27:58 -0800
X-CSE-ConnectionGUID: Uv/Z3Y+XQr2D5oJz2OUyIw==
X-CSE-MsgGUID: Fb9Jq4okSS+5RqfTUKFGDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111964598"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2025 17:27:57 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	changling.he@intel.com,
	even.xu@intel.com
Subject: [PATCH 1/2] HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
Date: Wed, 22 Jan 2025 09:29:00 +0800
Message-ID: <20250122012901.743123-2-lixu.zhang@intel.com>
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

The timestamps in the Firmware log and HID sensor samples are incorrect.
They show 1970-01-01 because the current IPC driver only uses the first
8 bytes of bootup time when synchronizing time with the firmware. The
firmware converts the bootup time to UTC time, which results in the
display of 1970-01-01.

In write_ipc_from_queue(), when sending the MNG_SYNC_FW_CLOCK message,
the clock is updated according to the definition of ipc_time_update_msg.
However, in _ish_sync_fw_clock(), the message length is specified as the
size of uint64_t when building the doorbell. As a result, the firmware
only receives the first 8 bytes of struct ipc_time_update_msg.
This patch corrects the length in the doorbell to ensure the entire
ipc_time_update_msg is sent, fixing the timestamp issue.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 3cd53fc80634..cb956a8c386c 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -578,14 +578,14 @@ static void fw_reset_work_fn(struct work_struct *work)
 static void _ish_sync_fw_clock(struct ishtp_device *dev)
 {
 	static unsigned long	prev_sync;
-	uint64_t	usec;
+	struct ipc_time_update_msg time = {};
 
 	if (prev_sync && time_before(jiffies, prev_sync + 20 * HZ))
 		return;
 
 	prev_sync = jiffies;
-	usec = ktime_to_us(ktime_get_boottime());
-	ipc_send_mng_msg(dev, MNG_SYNC_FW_CLOCK, &usec, sizeof(uint64_t));
+	/* The fields of time would be updated while sending message */
+	ipc_send_mng_msg(dev, MNG_SYNC_FW_CLOCK, &time, sizeof(time));
 }
 
 /**
-- 
2.43.0


