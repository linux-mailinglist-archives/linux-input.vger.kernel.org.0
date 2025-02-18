Return-Path: <linux-input+bounces-10147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA42A3A9DF
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C759B1883CEC
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCD21DF754;
	Tue, 18 Feb 2025 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiPamoZA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500E1B87F2;
	Tue, 18 Feb 2025 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910548; cv=none; b=FQChT6kGsEnw+yael0P64Y5i8be65Tit33rGCRi55HC48ZK/zUSQc0peuutLLh3q2LLs6X+uxrAhuw/eGd9uCAiO6pYfzUNCIC6nI9yy06b0S9RJ1dk7w1o6eBZwL87DwYiVvMcTGCeGgwCyO29FOh2v+wJvPsYwhFHT8MrgxkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910548; c=relaxed/simple;
	bh=k/z+dTlrbXNfGCL6XV/fJzPd5oaIbQvn4fCEfV4RlqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n+kTr5mcvc0/2OGFSpjMRnXgvtU4TRpAm8s4sWMUZe7ioaT4jQcjAOEAz5KQdS5YX9TB7BhvXFsnc3Rs2on9uQVxPtbm4R/88kRAixFpswnrXerBgupmiDfbkoE0aEXPqSLLXMzIcvJ8B6TOFlZZkDFaHX4nVSU2vau683ojA9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiPamoZA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A069C4CEE2;
	Tue, 18 Feb 2025 20:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910548;
	bh=k/z+dTlrbXNfGCL6XV/fJzPd5oaIbQvn4fCEfV4RlqY=;
	h=From:To:Cc:Subject:Date:From;
	b=NiPamoZAb132jbupDkEjVGAwkS9gEk48XDZcvkdlPImG8hZGcUeV3wfOUlucpa8r7
	 2KbmFerr9JrsSvbYllzpWTcJdwrXUFynPcTnUIzdZe1AoNcA5Lcmp/A5cET2ndaKKE
	 E127nGgkqehyFATcTKJa7sBbGmt05hrHhUb0pAfD3PuY9N3FpWnbqiTc35z8UENmhd
	 0h+HHF/Szj3F07gy2Lxl+teerU6Yt8e3Y6f9ofwVMgtS476L3Bpfp4Y9JoODW91NYv
	 UCs9VZYnlCfidLJJMC7NY5BCnLMIH+dDvCDKcsALKktTp5ekzrva//v9rYIUdnsxgV
	 QGziAZ93VHbFA==
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
Subject: [PATCH AUTOSEL 5.10 1/4] HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
Date: Tue, 18 Feb 2025 15:28:59 -0500
Message-Id: <20250218202903.3593960-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.234
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
index a45ac7fa417b9..da896f5c74424 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -549,14 +549,14 @@ static void fw_reset_work_fn(struct work_struct *unused)
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


