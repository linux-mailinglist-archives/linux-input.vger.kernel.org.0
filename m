Return-Path: <linux-input+bounces-10149-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223CA3A9F2
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B5A67A6F36
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A17284B87;
	Tue, 18 Feb 2025 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhGzOTte"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED255284B86;
	Tue, 18 Feb 2025 20:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910560; cv=none; b=YfzoI1Vkou4UgEfLAWJgpmEh5f1/5moxf7R2fU08kcAmFGdYH6WQFDuiMn8tyOZs3XwjROWguOdUMRSADOQVCbjWWLhZTa6fDEAhHYqRh/Gwr6L1+sIyN54dy6S/KpqiVjvZGtYWt34EiukCvma/G9D3k3r0kxFXmVbPrjyFPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910560; c=relaxed/simple;
	bh=tbhkQiSuWfkTKI/m4UE8qTGyrob2IeP2ju7SpEGIBOk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bo06/v6nlkKGQUTVsloiEyK70bmifo5uyxeAdJmyHxGmNzZWLcEizMtoZYhllhwiaxz5ih3IhqudcVvKugfRCuNew8uiy825x428wTVBFAqLRj13LdLD5TD6N2BLK8jypJGt09FZ9mLXXyqb5H9mgbM3r+O20yp4d4d6G2nmAF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhGzOTte; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657F4C4CEE2;
	Tue, 18 Feb 2025 20:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910559;
	bh=tbhkQiSuWfkTKI/m4UE8qTGyrob2IeP2ju7SpEGIBOk=;
	h=From:To:Cc:Subject:Date:From;
	b=BhGzOTteuXGARCkmm3WKtbJs8aW8nkVAFkGl7bE60t2uiVH//18EzwyKywKXPQFjL
	 oMknOrnO2H6ErM8gBANTl1UPw9j51+WHiqiqESyEky3sxrV45BXN2Mst5+hc/hsTn5
	 wLKDoPyvuXOZRmaKBqKuQ1e32++rI7sIU/fW8MKzOrpDC6fzcw/8GbVarMzD1pKLx1
	 bHAlpOKRX13RUAxsGJGsVTSGzwn2gxCCEKjs6P5KFI/NvB7Tw8cV7xYQA/GPP6Gxa9
	 WCDwIyHFQt++fbCPFWFSDV8mOKcNZiE6Ia129eriHak4dSySIFvLOeeim83OqR2AnW
	 zve9w7UKbByNg==
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
Subject: [PATCH AUTOSEL 5.4 1/3] HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
Date: Tue, 18 Feb 2025 15:29:11 -0500
Message-Id: <20250218202914.3594039-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.290
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
index 8f8dfdf64833e..871f043eeba1e 100644
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


