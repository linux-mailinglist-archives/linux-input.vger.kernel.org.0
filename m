Return-Path: <linux-input+bounces-13654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6051B0E80D
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 03:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DFBB567986
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 01:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEE313AD05;
	Wed, 23 Jul 2025 01:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoSr76VJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED966143744
	for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 01:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753234153; cv=none; b=pLzDBKvvKvPa1ID7Dm471MPmiopP4ejT57+/zSjx9gYBYf4ol+SKdsTYrxp1egGHq5OfesvCKL+Xg+DikeDfX7twgnOPYacjaEnVjQotdCxsWWoUm0RnQVCiZahUhltK2BuvaACjEgh8Mxbaz4JiItqkxuTm7LTFF/lF2dkkYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753234153; c=relaxed/simple;
	bh=PenWa9UL0ZbX0coaLL8pYMk1KES7hcbtKeIIXfu2Ce8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMnRjNExU7TYlUfHXxDLeHoXknrMhQZddaCXoGHxzUdb4l6eq0Q1+xO8kaNUVaa4pn+IP5dyLwrsgF34k8/EiPMTp+BGhQDhG9IsXF11exM4I4FZ7ME8l1Yga9Hr6B/dAW6pA4jj+B9GX+d5fif8XnmSDkQJCDgVev3ANLe2D20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoSr76VJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753234152; x=1784770152;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PenWa9UL0ZbX0coaLL8pYMk1KES7hcbtKeIIXfu2Ce8=;
  b=MoSr76VJTCGXpKVT/HtcXILWatGXbqHQTjOHmvc58iwhs+H2iPaclzMg
   SyX32DBWIEZ/G//9mcrQVWg5kaqGtzB9UAwDlfUvkri62ETSom1Apn8nv
   1dvyzVVVloU3c/g+PxiAxgFGg+l/aKq1iAyK8R4DlkQI1S6FQquLt+Tib
   4bDCeNNAe3bGaX899hN6UQXefcJTRr58TCKNXF+JJy74Z+SUI+LJpHhQ/
   ySoPM1XF7zEo23HGLgzQwO7QORmuXCsIKuZxVJ+x5HDHsFYOWBP/bk4N+
   tZWsVL9Hje85k7uuLN07Ag28ZhHU5Y4AcrjpRGgP04wmytOGtdeZPfdML
   w==;
X-CSE-ConnectionGUID: YSI7BgOKTn2Fm7T8Gnou8w==
X-CSE-MsgGUID: OBXD6AzUQkSsoivNx7cyXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="72956827"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="72956827"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 18:29:11 -0700
X-CSE-ConnectionGUID: Z6QUobh8RyW/qxWSz3/myg==
X-CSE-MsgGUID: 9m7bfMacSqyKLgrszIk6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="158594212"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2025 18:29:09 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hua.he@intel.com,
	wenji1.yang@intel.com,
	juswin.hsueh@intel.com,
	henry.yeh@intel.com,
	neo.wong@intel.com
Subject: [PATCH] HID: intel-ish-hid: Increase ISHTP resume ack timeout to 300ms
Date: Wed, 23 Jul 2025 09:31:32 +0800
Message-ID: <20250723013132.479762-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During s2idle suspend/resume testing on some systems, occasional several
tens of seconds delays were observed in HID sensor resume handling. Trace
analysis revealed repeated "link not ready" timeout errors during
set/get_report operations, which were traced to the
hid_ishtp_cl_resume_handler() timing out while waiting for the ISHTP
resume acknowledgment. The previous timeout was set to 50ms, which proved
insufficient on affected machines.

Empirical measurements on failing systems showed that the time from ISH
resume initiation to receiving the ISHTP resume ack could be as long as
180ms. As a result, the 50ms timeout caused failures.

To address this, increase the wait timeout for ISHTP resume ack from 50ms
to 300ms, providing a safer margin for slower hardware. Additionally, add
error logging when a timeout occurs to aid future debugging and issue
triage. No functional changes are made beyond the timeout adjustment and
improved error reporting.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c      | 3 ---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 3 +++
 drivers/hid/intel-ish-hid/ishtp/bus.c        | 3 ---
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h  | 3 +++
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index c57483224db6..9d150ce234f2 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -264,9 +264,6 @@ static void ish_shutdown(struct pci_dev *pdev)
 
 static struct device __maybe_unused *ish_resume_device;
 
-/* 50ms to get resume response */
-#define WAIT_FOR_RESUME_ACK_MS		50
-
 /**
  * ish_resume_handler() - Work function to complete resume
  * @work:	work struct
diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index 6550ad5bfbb5..d8c3c54a8c0f 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -759,6 +759,9 @@ static void hid_ishtp_cl_resume_handler(struct work_struct *work)
 	if (ishtp_wait_resume(ishtp_get_ishtp_device(hid_ishtp_cl))) {
 		client_data->suspended = false;
 		wake_up_interruptible(&client_data->ishtp_resume_wait);
+	} else {
+		hid_ishtp_trace(client_data, "hid client: wait for resume timed out");
+		dev_err(cl_data_to_dev(client_data), "wait for resume timed out");
 	}
 }
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index 5ac7d70a7c84..93a0432e7058 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -852,9 +852,6 @@ EXPORT_SYMBOL(ishtp_device);
  */
 bool ishtp_wait_resume(struct ishtp_device *dev)
 {
-	/* 50ms to get resume response */
-	#define WAIT_FOR_RESUME_ACK_MS		50
-
 	/* Waiting to get resume response */
 	if (dev->resume_flag)
 		wait_event_interruptible_timeout(dev->resume_wait,
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index ec9f6e87aaf2..23db97ecf21c 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -47,6 +47,9 @@
 
 #define	MAX_DMA_DELAY	20
 
+/* 300ms to get resume response */
+#define WAIT_FOR_RESUME_ACK_MS		300
+
 /* ISHTP device states */
 enum ishtp_dev_state {
 	ISHTP_DEV_INITIALIZING = 0,

base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
-- 
2.43.0


