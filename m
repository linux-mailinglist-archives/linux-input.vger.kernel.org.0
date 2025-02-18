Return-Path: <linux-input+bounces-10118-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1AA3A8B8
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352993A5DD6
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E5C1C701F;
	Tue, 18 Feb 2025 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hh4yZtGT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09041C701A;
	Tue, 18 Feb 2025 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910303; cv=none; b=OfVu9FuJLGQN0njdbyxNQSmTp8EOSQrZbU+49UkPBLCZNTl9PhP9Oz73fNRkuRNwbq9aMN2hkvG4V4d5FXX1Pys1TKc3T4erbpI3gS/hYrBektehH/oh+o99zCEp/0GgVuENYfREiS/bEC/l1ruvV7Hoju0xaJrDLSwSkhhVhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910303; c=relaxed/simple;
	bh=uhIyvX/g+PywHbusJCXtvE9oqzaIA4Fe+7NPhxU6MeI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s/3xK4rtKNAPdF7Is3PjdBfd0iRnbOrKYrcNL7Sve7KRiGcgIYBqqxeuyM6JoJ62mTF7wgNiqfl0tMEPsErs6bNDXRmHrjirCM7SYorGkYYI+Oc1DjljgjmSFj29T/qrldkn0cbqTnihq3NOPoNvIA03TPg1ym85fYnJ/NTV5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hh4yZtGT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF11C4CEE2;
	Tue, 18 Feb 2025 20:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910303;
	bh=uhIyvX/g+PywHbusJCXtvE9oqzaIA4Fe+7NPhxU6MeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hh4yZtGTLqmAH/5n9tquwYQq7nP72r3RIxqEnmugz5lO59RrZVaiy6r/dbYBvpB6W
	 r4umZAsClIHmQjXTm1t/7wndFiXFkwDz5RGy5fS/6yj79oprbGN1hvRq8UNEm2y+KG
	 9SdyshMQTlws9wbgnVqd0cUHNYdNI98lbBMBG0nX3jq/2h5rLRuS4hugZ0jjU3Agiw
	 WH5PykdIHJZt7TbgM1QvGqtqWIKHtlNxvn/buujLMLxvhEMfuixX/ZG7+GfImQtgy1
	 ae5CRZdns5AHjSM0ufUK7QZlN4pDYPtMyJFSQO3arceZWP875c0Mkpa10puRA4+ADe
	 dJsnKuzIxRKfA==
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
Subject: [PATCH AUTOSEL 6.13 02/31] HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
Date: Tue, 18 Feb 2025 15:24:22 -0500
Message-Id: <20250218202455.3592096-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
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


