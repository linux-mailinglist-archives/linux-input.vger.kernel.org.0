Return-Path: <linux-input+bounces-10145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9FAA3A9F7
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4FF73A53C6
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6941DF721;
	Tue, 18 Feb 2025 20:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghhSDGBS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822841DED79;
	Tue, 18 Feb 2025 20:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910533; cv=none; b=PXYZM0LBtbmT+3JdVmL4g1ElZcJm0Of7hGrUfM08T+L0giTFv73I8RxKsV831HPGWocA1EhT6HPnZxEDgvSKY6JSJ6QC4mbtJPRZiIqEna0KxZDfq2at1qeVSvd+QzG7NIEgNqCFvEJFqGYCK652+etCbq7VKvR2hZbzHckb0MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910533; c=relaxed/simple;
	bh=vYCPcZa6djFo83adDHBf/iOGEJnY7fHBRVY4Ym/cS38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tmIGIqNQJ4vKVw6eNfNYnZhjfPu1iAYZ+NaLC5dLpBmeHdouPgSVzltQAP1Bn0opgX+PGXWAXjf5xIaDYdODyQ5/JkyppJXHLwMmga31VFjyrbZUzgFFoxxRTOsPvH9ZT+OnMJ7CQ7bhk3L3gyXuKxZI175mBO1lj0Xrnrg0cGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghhSDGBS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3F0C4CEE2;
	Tue, 18 Feb 2025 20:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910533;
	bh=vYCPcZa6djFo83adDHBf/iOGEJnY7fHBRVY4Ym/cS38=;
	h=From:To:Cc:Subject:Date:From;
	b=ghhSDGBSwAqMbWGhWcD2sSLRPLujFaDNJnJ8Y0S0z2nqc+FSMj23nLsh2EYMXjxng
	 U9HIJtJe1E/BeAhT8GT3xEUKe69hom6sqlXasB+p0Pajlj/P8q6NC0b1+cy9saKIXy
	 ZK0Jee3JSkxSUkMf7b9lmmJQN4phtbmA3Sg5528dI6gh/gLee0j8dpEJhiapXHitoD
	 39PPAZ7r4VpF/2ObK+ABE8rN9yt0gM04tn3vD9MmkTkL/VC8HKSaaigA79nL+AJ6LS
	 Q6ce/QFwsjxFrMkEzT7c7VeBzDXw7tt7xTqqrg5pXR3urIqBlw0eZMQXXb12di+6+y
	 FHbnjTId2vlLA==
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
Subject: [PATCH AUTOSEL 5.15 1/6] HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
Date: Tue, 18 Feb 2025 15:28:42 -0500
Message-Id: <20250218202848.3593863-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.178
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
index ba45605fc6b52..a48f7cd514b0f 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -577,14 +577,14 @@ static void fw_reset_work_fn(struct work_struct *unused)
 static void _ish_sync_fw_clock(struct ishtp_device *dev)
 {
 	static unsigned long	prev_sync;
-	uint64_t	usec;
+	struct ipc_time_update_msg time = {};
 
 	if (prev_sync && jiffies - prev_sync < 20 * HZ)
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


