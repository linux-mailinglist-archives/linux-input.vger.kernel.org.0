Return-Path: <linux-input+bounces-10119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5F8A3A8BD
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81CA217453A
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9E81D61B1;
	Tue, 18 Feb 2025 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhD2Teat"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6E1D61AC;
	Tue, 18 Feb 2025 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910307; cv=none; b=D8WiAB0516sr7AZnacdYIUTXYRWd/QkgnzP5HlF48V2SByb9lQeQFvl18wQSCvg4jS5L21HDbwmCFxOfBKQAgYx8HlVyfKad8RGDwHPMG3dvuO6+zLI5j+zHgyrDWMbZxuo5mjadTO2Aj10vfbQKhOxriA4WHSHPHMapjFsf1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910307; c=relaxed/simple;
	bh=7NA97BaYLDXvPlX1kOjax7amK/G2RN81JC/5aiXT8gY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i7qnOGvr00L6mGQGc6nAgbx6ZsZIg42KCYMhMjBTiPbrLoC7d+k2qOYqChLgRN+Zn2I3Rj+kc9wDKv34hB5+IWVkXad4TQOLIuTlEZDxfF+h9YVBrmRTsZ+ew6m5y1jEETlPLchYj2GiTtpAW4O8PJ7LAJlDDHy9691p/10FWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhD2Teat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0AAC4CEE4;
	Tue, 18 Feb 2025 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910306;
	bh=7NA97BaYLDXvPlX1kOjax7amK/G2RN81JC/5aiXT8gY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QhD2TeatkRxHdomvutrtympav2J6hnwd6Migh8iwmRRLfwA9Ap3z3/DjcKHt/SyIB
	 aqsBk6HabOh2NvrIfcXgD8A8//tJVkHZYccwqSwhuveBw4t/9TXXKniwd0EpkMyfQM
	 KR77FopzuJ/OJHupGuzY5j+9VJJYusyHIH94Ec8udHwWp//5vthIArjSh1EsUnCU7x
	 z6UDCIUR+rtoGRKKkHzC1y3rwU+eSLKab4+dcRsiD4Im9PH0rloafuiecRcHPINU+a
	 Q2rQCXxS+Tv0+GFgTIGw1pfbXu/Ng48yfktTMan0KLN3eUmjEpoplJ94HH3JT8kZx5
	 ybWDhr3uVOOpw==
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
Subject: [PATCH AUTOSEL 6.13 03/31] HID: intel-ish-hid: Send clock sync message immediately after reset
Date: Tue, 18 Feb 2025 15:24:23 -0500
Message-Id: <20250218202455.3592096-3-sashal@kernel.org>
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
index cb956a8c386cb..4c861119e97aa 100644
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
index effbb442c7277..dfc8cfd393532 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -254,6 +254,8 @@ struct ishtp_device {
 	unsigned int	ipc_tx_cnt;
 	unsigned long long	ipc_tx_bytes_cnt;
 
+	/* Time of the last clock sync */
+	unsigned long prev_sync;
 	const struct ishtp_hw_ops *ops;
 	size_t	mtu;
 	uint32_t	ishtp_msg_hdr;
-- 
2.39.5


