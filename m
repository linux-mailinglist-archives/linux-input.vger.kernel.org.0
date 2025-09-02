Return-Path: <linux-input+bounces-14417-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D725B3FFA6
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 14:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 794C918959A9
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 12:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BDC2FB973;
	Tue,  2 Sep 2025 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYISNsMy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD6288C20;
	Tue,  2 Sep 2025 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814922; cv=none; b=LDJteAxDkhovEsa4eo0lV6dLvsEcGSFwdp9wD36pJG/6bvo7VweO46WsXOCaCARvWSh6envOwqeXb61kSlWaZ7O9zMgzKUX+EzBnxD6yEdZFbpM8ATW1DpuSmyqCqpEkQZ8Wo+xPl8M/fTL3GkhzIvjNVD9R2cb41v4QCvEuegg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814922; c=relaxed/simple;
	bh=HeA1+/cHV5gPmD0WyG1N3nwGnqxfJ4RmixgnSuMv4Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EcDuJUKhojoBPFY6ObpEljGf6BYfn/uYeQ3ofPb1Bkh/TRnXK7ILLIf5RZc0vkVLtaCteKTsSZ7wodrd3Y5/nNlieVSHQvG4Y1QLTl9BscOh7evyvLMhN2hBoG+1ddV1uTmR8KY8MythJ7gV3rF26AsKWeTqY/xXeZbsDyoVUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYISNsMy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3B7C4CEED;
	Tue,  2 Sep 2025 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814922;
	bh=HeA1+/cHV5gPmD0WyG1N3nwGnqxfJ4RmixgnSuMv4Ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mYISNsMyYFngdyR8w+SOjktMZM+9/n/3dOylpCuT8CQT0t/pBcDeZC5SgbIc0aw8A
	 H9FXgXpdg1qGXc6LsgJlGSYa1BgIR8xhp+hNGG30BumqddtAMZr1iCiP5JhyolSSJb
	 HTj7/ForXletQO1/rnP63Tkhi3Ynys+vQ7DfGtuzqASY7oInBVQuskrh0NcPU5V35j
	 M1IjElgfmDYwpdfwFciQHqFrFAulKtSMM5W2wxl0OL3+wdz5JuPDK0HJNNSrpu3thq
	 9lefec8qVz474QEMjIaLqewnfF/FvFO6a9sMZBj0YPc7K4NGcwgNP/L2zUle58lycW
	 BvOhvpPAJlhJg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Zhang Lixu <lixu.zhang@intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	linux@treblig.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.15] HID: intel-ish-hid: Increase ISHTP resume ack timeout to 300ms
Date: Tue,  2 Sep 2025 08:08:14 -0400
Message-ID: <20250902120833.1342615-3-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902120833.1342615-1-sashal@kernel.org>
References: <20250902120833.1342615-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.4
Content-Transfer-Encoding: 8bit

From: Zhang Lixu <lixu.zhang@intel.com>

[ Upstream commit dfbd535db74df0343ca39670e06326d7aee8c8f4 ]

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
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## 1. Bug Fix Nature

The commit addresses a **real user-facing bug** that causes "several
tens of seconds delays" during HID sensor resume handling on s2idle
suspend/resume cycles. The code changes show this fixes timeout failures
in `hid_ishtp_cl_resume_handler()` that were causing "link not ready"
errors and preventing proper resume of HID sensors.

## 2. Small and Contained Changes

The commit makes minimal, focused changes:
- **Primary change**: Increases `WAIT_FOR_RESUME_ACK_MS` from 50ms to
  300ms
- **Location consolidation**: Moves the constant definition from
  multiple files to a single header (`ishtp-dev.h:51`)
- **Error logging addition**: Adds two lines in `ishtp-hid-
  client.c:762-763` for debugging
- **Total impact**: Only 12 lines changed across 4 files

## 3. No Architectural Changes

The commit makes no structural changes - it only:
- Adjusts a timeout value based on empirical measurements (180ms
  observed in failing systems)
- Adds diagnostic logging
- Consolidates a constant definition

## 4. Clear Regression Risk Assessment

The change has **minimal regression risk**:
- Increasing timeout from 50ms to 300ms cannot break existing working
  systems
- Systems that resumed within 50ms will continue to work
- Systems that needed 50-180ms (previously failing) will now work
- The 300ms provides safety margin without being excessive

## 5. Subsystem Impact

The changes are confined to the Intel ISH HID driver subsystem:
- `drivers/hid/intel-ish-hid/` - a specific hardware driver
- Does not affect core kernel functionality
- Only impacts systems with Intel ISH (Integrated Sensor Hub) hardware

## 6. Historical Context

Looking at the git history:
- The 50ms timeout was introduced in commit `e48bf29cf9d6d6` (2021) for
  async resume
- Multiple recent fixes in this subsystem (`07583a00106`,
  `823987841424`) show it's actively maintained
- The commit is already marked with "Upstream commit
  dfbd535db74df0343ca39670e06326d7aee8c8f4" indicating it's been
  accepted upstream

## 7. Stable Tree Rules Compliance

The commit perfectly aligns with stable tree criteria:
- **Fixes a real bug**: Resume failures causing multi-second delays
- **Tested solution**: Based on empirical measurements (180ms observed)
- **Minimal change**: Simple timeout adjustment
- **Hardware-specific**: Only affects Intel ISH hardware users
- **No new features**: Pure bugfix with diagnostic improvement

## 8. Additional Evidence

The commit message explicitly states:
- "The previous timeout was set to 50ms, which proved insufficient on
  affected machines"
- "Empirical measurements on failing systems showed that the time...
  could be as long as 180ms"
- This is based on actual testing and measurements, not speculation

The error logging addition (`hid_ishtp_trace()` and `dev_err()`) will
help diagnose any future issues without changing functionality.

This is an ideal candidate for stable backporting - it fixes a concrete
bug with minimal risk and clear benefit to affected users.

 drivers/hid/intel-ish-hid/ipc/pci-ish.c      | 3 ---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 3 +++
 drivers/hid/intel-ish-hid/ishtp/bus.c        | 3 ---
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h  | 3 +++
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index c57483224db6f..9d150ce234f25 100644
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
index 6550ad5bfbb53..d8c3c54a8c0f2 100644
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
index 5ac7d70a7c843..93a0432e70581 100644
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
index ec9f6e87aaf23..23db97ecf21cd 100644
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
-- 
2.50.1


