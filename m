Return-Path: <linux-input+bounces-10126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C52B8A3A941
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D2F23A2AAA
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B271EFFBD;
	Tue, 18 Feb 2025 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaTRnptt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12D11EFFB6;
	Tue, 18 Feb 2025 20:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910388; cv=none; b=tOMVr1KZfKlF0WZjvq5qLVYoRYIGdT3recvezwWfpWhrBKjBFIkJm26/kXeVhgNrywioZKP5jmEsMIqpCSldk2Hmlp8mDgMjdLjpufoVFBWtZ4g7aJuUgTZS3cQmX8NLJfZP8yM6aAKJRhV2W7IWGULKTUwpgWT5Wc0DVBEdCCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910388; c=relaxed/simple;
	bh=uhIyvX/g+PywHbusJCXtvE9oqzaIA4Fe+7NPhxU6MeI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oZMxe0lWkrCdGBa3kOWaQ6HPM7tcwXTD51zrCXNV+sBkDrNsEuq/BHiXVyFZs+NLVmHgZG4J0Eh/4d1f21sTUtIQ4/FIwMJVc++JrdpmURJYbZgjR8yX10YaC2oj3+/VBsQiRNGiRR+xnOFFvh1yl1dlNI7jbGs7gsdlLnBhs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaTRnptt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC529C4CEE2;
	Tue, 18 Feb 2025 20:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910387;
	bh=uhIyvX/g+PywHbusJCXtvE9oqzaIA4Fe+7NPhxU6MeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MaTRnpttmyzGIY6lYyG+IzVIZL5K/ZHscnDIx7/2DrqY4bH7CcaaTBcWBjKQVhf4W
	 quwrTbAMtGb0UtNIJCwO7b2wi7GG+38RQcYscppAfHpXhwDKpUokRfZSKBnD7rzhiv
	 BfpT8tOholJcInq7prAizPQet3hPUYEMwOfSvbic73gqOKCqwbgtfzNkYKKOIef+Fy
	 NUsrrWtXrUuC8BbKCbQ2111qdM5CtAcrZ8PZmE1uNasUT7JOP4tOT1ZvbDxDi6LM17
	 4uqk+1t5E8sqIFzlcKBARQ/H73C/AX/L4kQ2gZMMQnXkAJIjR+++mma+r41DHRrwe6
	 /y1Jc+RwcJEoA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhang Lixu <lixu.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	andriy.shevchenko@intel.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 02/31] HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
Date: Tue, 18 Feb 2025 15:25:48 -0500
Message-Id: <20250218202619.3592630-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202619.3592630-1-sashal@kernel.org>
References: <20250218202619.3592630-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.15
Content-Transfer-Encoding: 8bit

From: Zhang Lixu <lixu.zhang@intel.com>

[ Upstream commit 4b54ae69197b9f416baa0fceadff7e89075f8454 ]

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
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 3cd53fc80634a..cb956a8c386cb 100644
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
2.39.5


