Return-Path: <linux-input+bounces-10141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60FA3A9AF
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36254176C8B
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0921DEFE5;
	Tue, 18 Feb 2025 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojg1dxNu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B461DEFDA;
	Tue, 18 Feb 2025 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910508; cv=none; b=BT1cVNmFjrpxpHIk0ZlRzZPJZ3gKJvYa293j8asZwCSnb5zDG5Oo9+ilt8hsT4Ort6/K05a1R2UTC1g9awcrKAAgHXOYtbmqnBOU6UDXKsDGij8BM5979WuWhSpnvNMeqCLi711s6/qR+DOMLY7jRoj1tpkIx60bZDG7XjISEPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910508; c=relaxed/simple;
	bh=FSJ/8KsUnEDxJ+fnS21eb18i908n9aHzHhNKEiZi0xs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZknGKzFKJ/PYRgy+N9qXvFvn4HReigQPVaxfKmBFan09f6N/G6C5zs57zXU4e4qsnWDLzXb45WNWE92HTudWrjWmWvitdzXwih9i0LuI1+A0BeO7yf2NmhXXggR//8JrlX67+AA9dii7AUAw0SLG4vC33G+CHYyIjc/UV/VYuDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojg1dxNu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7821C4CEE2;
	Tue, 18 Feb 2025 20:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910507;
	bh=FSJ/8KsUnEDxJ+fnS21eb18i908n9aHzHhNKEiZi0xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ojg1dxNuOSxsBWmHZAa+z7Srh55e4JwXIH2T2vSV1aO1Pa5ePuDJNwNZwxX276ppd
	 Sms5GOWw0uxsnyhK7Stv1Uc9DWMnvufR8Cw3WN2pDfi+jDwY7PVvBZIgfMFvBojbcP
	 NHN7ktgtw+2LSCrGFzuniwVQCVmEghrpqY5bA4uvlZ2dzQ6eTWcsyydyfqQQE+vdeu
	 gV8QUJc37AzMxh2ICyMH5V8zV9Ktf0lOK0N50B6sJiVy1cO2bqJWEWqIRygrqlma8+
	 TVHXQNHTSMjUKG5YGPkI94VGBiw09dcSusRRpfGir7OMqvlYDLIdFLKFBJf3tqKxxm
	 PSbbsN8ep9BzQ==
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
	linux@treblig.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/13] HID: intel-ish-hid: Send clock sync message immediately after reset
Date: Tue, 18 Feb 2025 15:28:06 -0500
Message-Id: <20250218202819.3593598-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202819.3593598-1-sashal@kernel.org>
References: <20250218202819.3593598-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.128
Content-Transfer-Encoding: 8bit

From: Zhang Lixu <lixu.zhang@intel.com>

[ Upstream commit 7e0d1cff12b895f44f4ddc8cf50311bc1f775201 ]

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
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c         | 9 ++++++---
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index b1a41c90c5741..42141a78bdb4b 100644
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
@@ -576,13 +580,12 @@ static void fw_reset_work_fn(struct work_struct *unused)
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
index 32142c7d9a043..9b2ee3fe04b8f 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -212,6 +212,8 @@ struct ishtp_device {
 	unsigned int	ipc_tx_cnt;
 	unsigned long long	ipc_tx_bytes_cnt;
 
+	/* Time of the last clock sync */
+	unsigned long prev_sync;
 	const struct ishtp_hw_ops *ops;
 	size_t	mtu;
 	uint32_t	ishtp_msg_hdr;
-- 
2.39.5


