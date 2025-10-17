Return-Path: <linux-input+bounces-15536-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF71BE6188
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 04:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 89B734E4029
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351202253EE;
	Fri, 17 Oct 2025 02:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPo+YPGd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95525219A7A
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667571; cv=none; b=AZX1E0/hHSnBPiQdPNLfRpvVCV1jhdWOLhPat5sHjOoUEX6VlDtkyzcqshH87/26rBNsJGSZqCEyoUCTWSq2XYFpHE5osumQRam/7CbwSBTOhFhij6j2jl+oK7oMKJephUfIs6Omfxufl48S3gRuOn6SKxS5n4GO25MDJNrwOG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667571; c=relaxed/simple;
	bh=93NrzllzjdcQXSEeJNJo0CAOcOhFLAK7jZGWdBeTTRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwueKaNYefsQ5nLkxk4UEXKRzb9xSAtE5I5371L9d94ZzuTuLNbIj0pr48X37HVyr8k1CSNzemocrI0HIvwqBubZPEtLGqiJnwtpKcmyCuaZyEqCnWWoV3XsZBBwwx9V1LEG+ob4jaC//OB5FXsMTxYEKh8wA/b8+O4Nc1h7MwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPo+YPGd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667570; x=1792203570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93NrzllzjdcQXSEeJNJo0CAOcOhFLAK7jZGWdBeTTRg=;
  b=HPo+YPGd/3MJmSZ7PLs6kLSg30LmA/gvI7qNnWVKfxC735bKQMzwk0Ot
   v3FRhgbLjLjNgxdA0Gx8iHtikAYotwNPWBZpRqDzlWRc/HOTGG40o2D+H
   6GlKAq4Ea9zgxxX58OSMoFG4lFcWP7Mj088gUW2JwfxuXS3ZRLCdPMSz5
   0qAzVlsuHm+bDbQrUB5DQIL29VIANbxBJqO1a+GNo9OfGkFOAKTjPUiCI
   KFBYgimA06PQ3GOzWEio4YjASVZ5Fq54hP+5nLWtZ235/iFddmsA2QQ9U
   DajaXjVRp7qHJZbYTS27/lxIIBRMYDoYhVNgrZ5MNuuW4WX4iW4VMmq6V
   g==;
X-CSE-ConnectionGUID: AWqk0d34QTyR0jIJ6vUPxA==
X-CSE-MsgGUID: paVFuKUASZOG+JVNiYHRJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66738708"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66738708"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:19:30 -0700
X-CSE-ConnectionGUID: gnF0lobeQaWoEzyK3LwqUw==
X-CSE-MsgGUID: BdT1GgnfQ/OPEUHVta7q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213586355"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 19:19:28 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH v2 2/6] HID: intel-ishtp-hid: Clear suspended flag only after connected on resume
Date: Fri, 17 Oct 2025 10:22:14 +0800
Message-ID: <20251017022218.1292451-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017022218.1292451-1-lixu.zhang@intel.com>
References: <20251017022218.1292451-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When resuming from suspend-to-RAM or hibernate, the ISH firmware is powered
on from D3, causing all previous client connections between the firmware
and driver to be lost. Although the underlying ishtp bus driver initiates a
client reconnection flow, this process is asynchronous. As a result, when
hid_ishtp_cl_resume_handler() is executed, the connection may not have been
re-established yet. Clearing the suspended flag prematurely in this
scenario can lead to a timeout when the upper-layer HID sensor driver set
feature during resume.

To prevent such timeouts, only clear the suspended flag after confirming
that the connection state is ISHTP_CL_CONNECTED.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index f61add862b6b..f37b3bc2bb7d 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -757,8 +757,15 @@ static void hid_ishtp_cl_resume_handler(struct work_struct *work)
 	struct ishtp_cl *hid_ishtp_cl = client_data->hid_ishtp_cl;
 
 	if (ishtp_wait_resume(ishtp_get_ishtp_device(hid_ishtp_cl))) {
-		client_data->suspended = false;
-		wake_up_interruptible(&client_data->ishtp_resume_wait);
+		/*
+		 * Clear the suspended flag only when the connection is established.
+		 * If the connection is not established, the suspended flag will be cleared after
+		 * the connection is made.
+		 */
+		if (ishtp_get_connection_state(hid_ishtp_cl) == ISHTP_CL_CONNECTED) {
+			client_data->suspended = false;
+			wake_up_interruptible(&client_data->ishtp_resume_wait);
+		}
 	} else {
 		hid_ishtp_trace(client_data, "hid client: wait for resume timed out");
 		dev_err(cl_data_to_dev(client_data), "wait for resume timed out");
-- 
2.43.0


