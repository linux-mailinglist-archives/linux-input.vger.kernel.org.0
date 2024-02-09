Return-Path: <linux-input+bounces-1768-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8284F068
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 07:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5477528E461
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 06:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBDA56B71;
	Fri,  9 Feb 2024 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ievNd1wt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC2D657A8
	for <linux-input@vger.kernel.org>; Fri,  9 Feb 2024 06:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707461559; cv=none; b=jyl8rT3dIaaQJSdTUqRV+N/eIXu8YwB/nPJoW/oK+N4c+IqMj25VJbjFdHobIldXcCpqTCS7qA2NjU6X/rx+yEQrgSln1iBiJerw9voA5Lwe7yfNhZF6RYhubbmzvy6FVKkbk1SLO72wZfSwGY7O1OFy7t1RUb21VRiP7GnEE90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707461559; c=relaxed/simple;
	bh=YaCsz3xecRMv1m09IxKZx7m39Uqw5RYb8HO5xJ7IMuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQKPckR+FtAwQD9nkeIFdAHFkYL6MsL2Ry/RBZvqFBO6Twn0STTBJlcumcGt+I6RSefTr1W3vlnXTfHv5BqfgH8YkqgQOQ6gbr7V9+6C4mrTkI+GXbvKh4D32kZnyEQabZSt63yfwZuEXGOXYoahppHGbOulZyrblllZihOeybU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ievNd1wt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707461558; x=1738997558;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YaCsz3xecRMv1m09IxKZx7m39Uqw5RYb8HO5xJ7IMuk=;
  b=ievNd1wtdoFrJa3RjXa15AOhC20v+hBqUTH2J1E/r84UKH5Us4nvXUCa
   lgyjb4arUJei05ayZxbsvj8JRO2qiJ0xZgRYe1JEs6pFYEbgbu1VesRcQ
   FuCGO6rU/Q3AzuBhXMY7lp8U3OrTEdcXSkU4Sa6R/esojQ1SMXpOHv8So
   QNLvG7pHZ3r9TlxMA9dgOJwb1YHvRLTflO2lCDVsjdQN2ti4a0SJrqV8u
   XJPnKKjX8P+f6u1xfPHbWy83B7AVon8L68hWBmSvurdb6FcSkn010jbGt
   Bk4c8fWrm06vgqEr1icP4Ha1jiyOZSr2z2GqQPnEscHBFVI474JVQ7ZIu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1274961"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1274961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 22:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6519370"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2024 22:52:36 -0800
From: Even Xu <even.xu@intel.com>
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Cc: Even Xu <even.xu@intel.com>
Subject: [PATCH] HID: Intel-ish-hid: Ishtp: Fix sensor reads after ACPI S3 suspend
Date: Fri,  9 Feb 2024 14:52:32 +0800
Message-ID: <20240209065232.15486-1-even.xu@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After legacy suspend/resume via ACPI S3, sensor read operation fails
with timeout. Also, it will cause delay in resume operation as there
will be retries on failure.

This is caused by commit f645a90e8ff7 ("HID: intel-ish-hid:
ishtp-hid-client: use helper functions for connection"), which used
helper functions to simplify connect, reset and disconnect process.
Also avoid freeing and allocating client buffers again during reconnect
process.

But there is a case, when ISH firmware resets after ACPI S3 suspend,
ishtp bus driver frees client buffers. Since there is no realloc again
during reconnect, there are no client buffers available to send connection
requests to the firmware. Without successful connection to the firmware,
subsequent sensor reads will timeout.

To address this issue, ishtp bus driver does not free client buffers on
warm reset after S3 resume. Simply add the buffers from the read list
to free list of buffers.

Fixes: f645a90e8ff7 ("HID: intel-ish-hid: ishtp-hid-client: use helper functions for connection")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218442
Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c    | 2 ++
 drivers/hid/intel-ish-hid/ishtp/client.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index aa6cb033bb06..03d5601ce807 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -722,6 +722,8 @@ void ishtp_bus_remove_all_clients(struct ishtp_device *ishtp_dev,
 	spin_lock_irqsave(&ishtp_dev->cl_list_lock, flags);
 	list_for_each_entry(cl, &ishtp_dev->cl_list, link) {
 		cl->state = ISHTP_CL_DISCONNECTED;
+		if (warm_reset && cl->device->reference_count)
+			continue;
 
 		/*
 		 * Wake any pending process. The waiter would check dev->state
diff --git a/drivers/hid/intel-ish-hid/ishtp/client.c b/drivers/hid/intel-ish-hid/ishtp/client.c
index 82c907f01bd3..8a7f2f6a4f86 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client.c
@@ -49,7 +49,9 @@ static void ishtp_read_list_flush(struct ishtp_cl *cl)
 	list_for_each_entry_safe(rb, next, &cl->dev->read_list.list, list)
 		if (rb->cl && ishtp_cl_cmp_id(cl, rb->cl)) {
 			list_del(&rb->list);
-			ishtp_io_rb_free(rb);
+			spin_lock(&cl->free_list_spinlock);
+			list_add_tail(&rb->list, &cl->free_rb_list.list);
+			spin_unlock(&cl->free_list_spinlock);
 		}
 	spin_unlock_irqrestore(&cl->dev->read_list_spinlock, flags);
 }
-- 
2.43.0


