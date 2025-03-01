Return-Path: <linux-input+bounces-10449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B6A4A9DE
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 09:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27B611898A58
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 08:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809A41C5F08;
	Sat,  1 Mar 2025 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WsBzM9Ml";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aS7+W9kV"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2711C07F3;
	Sat,  1 Mar 2025 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740819247; cv=none; b=qjy3+aSyrCVOLtFmNc1MAYMbfSPZvou/x81HAeeES3Kb+5wHZsy9sH+gfj0v0dzJ7kXrz59CxfxKrCNi7yRaRulwmq6Ed1kJ+7Bh0I57aDJIlaS85Jc4wtZwCO7LofJGzC00x7cuWG5jdouEHP9fuXuatLLjLKsCJ68UajpkozA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740819247; c=relaxed/simple;
	bh=voNSdIhjURkfHoQz4ym/UQ+upP4h1eT5bAope5OQ7ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YBgH3EVcAdlK2tvcetdSgfKEB1SmqqkDW63OIlIMheD3ChDpyv8ihz2b0Y21fJJsZcB8nT7TVvwpb94WstpjQz8klLOspRTF9ko3+9MkjjXD1H8eTYD3hpgkNJsyBUAedYafmF/UOOGjHv5EiyMd8PJJsmio5h99co2W9nMC4vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WsBzM9Ml; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aS7+W9kV; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z4f5121t7z9sm9;
	Sat,  1 Mar 2025 09:53:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740819237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+LnG1NVteNtt+rxjTEBs450MCL50ipK7PqPJFPKafjY=;
	b=WsBzM9MlMCpuYSYjhKRDkIWK0i83vSZAKR+IpboebeZNpTMEKeL+ZLvvSxjBg2MrqZh1Fw
	iaxBvHdQ2PY5a9QxNlYr0Ud7FsA6wzaO83MopK3Mz4m2IiGmYocsjLfqe99Rb2nm4wNM7H
	mWwYBi9tZr+BjWrRXAhGy8ddI8zzENP/kmfyMPw/ohXt5JkK4dLnSZoBKcR0yK9uwAoRyh
	wElToJ8hSFUhP9innB77VmqlcPmq/S4AZ0eJUfIi00sRWAj97yNPCey+YCgoPCPw6nyrgQ
	6GNOCyFWGjghlYeRL7frIAUTWp7uP73+0azUZv8Tz5pTo2yTScjykuRp6vGFmQ==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740819235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+LnG1NVteNtt+rxjTEBs450MCL50ipK7PqPJFPKafjY=;
	b=aS7+W9kVHRyPRyltYKU6JXR0q2nGl63LZd+p4CfjyTseW4+rTlUJnhOoauapb6Zli+ibSW
	tFUcJbK10ucXMZan0I4rSc+avwoCrGKV+Z3cpEKFm8PW6o/ULkolH8059lqE/kHDv85A0h
	BNBqIx6laklEfvBjwDhw1NcF1Lo5khoA6sgMG0Q9kkTyhkqzSwaQvnrIIvNNj8Lyo43P81
	RmejnD2kQoC4ikWAZz913Sc0UBEVIYSfVVXr8xwca1Cv0qmoE/vCJsTSGFvWNQI04laCoX
	kX2itjBA3xYz5jXIaEyBDRRxq+UDAJtlKw4MU5dfClliidz2NYUdX5O1IP4JRQ==
Date: Sat, 01 Mar 2025 09:53:39 +0100
Subject: [PATCH RESEND] Input: elantech: Retry ETP_FW_VERSION_QUERY on
 Lenovo Thinkpad E14 Gen2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-fix-elantech-firmware-query-v1-1-35d2e8aa78d9@mailbox.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maurice Hieronymus <mhi@mailbox.org>
X-MBO-RS-META: 5qyfhe3r1r6dtaw6wt9dx1ye5kpo8twx
X-MBO-RS-ID: 5e7eac056ab126a60da

On the ThinkPad E14 Gen2, the touchpad occasionally fails to respond to
the ETP_FW_VERSION_QUERY during initialization at boot. As a result, the
touchpad is detected as a generic mouse. Reloading the `psmouse` kernel
module after startup resolves the issue, suggesting a timing-related
problem.

This patch retries the ETP_FW_VERSION_QUERY command if it fails. This
allows the touchpad more time to initialize and respond during firmware
version queries.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
On the Lenovo ThinkPad E12 Gen2, the touchpad does not respond to scrolling
gestures after startup. The kernel log (`dmesg`) reveals the following:

[1.439036] psmouse serio1: elantech: synaptics_send_cmd query 0x01 failed.
[1.801802] input: PS/2 Logitech Wheel Mouse as /devices/platform/i8042/serio1/input/input6

A command failure causes the touchpad to be recognized as a generic mouse.
Reloading the `psmouse` kernel module resolves the issue:

[158.928793] psmouse serio1: elantech: assuming hardware version 4 (with firmware version 0x5f3001)
[158.941924] psmouse serio1: elantech: Synaptics capabilities query result 0x90, 0x18, 0x0d.
[158.968111] psmouse serio1: elantech: Elan ic body: 0x11, current fw version: 0x4
[159.084746] input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio1/input/input15

Enabling debug logging revealed that the driver fails to query the firmware
version of the touchpad during initialization:

[1.435339] libps2:ps2_sliced_command: psmouse serio1: 01 - -5
[1.436523] psmouse:elantech_detect: psmouse serio1: elantech: failed to query firmware version.

The issue appears to be a timing problem, where the touchpad is not fully
initialized during the firmware query. Interestingly, enabling debug
logging reduces the frequency of the issue, giving the touchpad more time
to initialize.

This patch introduces a retry mechanism for PS/2 sliced commands during
firmware queries, similar to the retry logic in `elantech_ps2_command`.
Testing over several weeks confirms that this change resolves the issue
reliably on my hardware.
---
 drivers/input/mouse/elantech.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 79ad98cc1e799c5acf7212c2d952d766f6a0a1a2..202150443209f66fdb736949b38db2188224350d 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -44,6 +44,30 @@ static int synaptics_send_cmd(struct psmouse *psmouse, unsigned char c,
 	return 0;
 }
 
+/*
+ * A retrying version of synaptics_send_cmd
+ */
+static int synaptics_send_cmd_retry(struct psmouse *psmouse, unsigned char c,
+				unsigned char *param)
+{
+	int rc;
+	int tries = ETP_PS2_COMMAND_TRIES;
+
+	do {
+		rc = synaptics_send_cmd(psmouse, c, param);
+		if (rc == 0)
+			break;
+		tries--;
+		psmouse_dbg(psmouse, "%s retrying query 0x%02x (%d).\n", __func__, c, tries);
+		msleep(ETP_PS2_COMMAND_DELAY);
+	} while (tries > 0);
+
+	if (rc)
+		psmouse_err(psmouse, "%s query 0x%02x with retry failed.\n", __func__, c);
+
+	return rc;
+}
+
 /*
  * V3 and later support this fast command
  */
@@ -1432,7 +1456,7 @@ int elantech_detect(struct psmouse *psmouse, bool set_properties)
 	 * value to avoid mis-detection. Logitech mice are known to respond
 	 * to Elantech magic knock and there might be more.
 	 */
-	if (synaptics_send_cmd(psmouse, ETP_FW_VERSION_QUERY, param)) {
+	if (synaptics_send_cmd_retry(psmouse, ETP_FW_VERSION_QUERY, param)) {
 		psmouse_dbg(psmouse, "failed to query firmware version.\n");
 		return -1;
 	}
@@ -1718,7 +1742,7 @@ static int elantech_query_info(struct psmouse *psmouse,
 	/*
 	 * Do the version query again so we can store the result
 	 */
-	if (synaptics_send_cmd(psmouse, ETP_FW_VERSION_QUERY, param)) {
+	if (synaptics_send_cmd_retry(psmouse, ETP_FW_VERSION_QUERY, param)) {
 		psmouse_err(psmouse, "failed to query firmware version.\n");
 		return -EINVAL;
 	}

---
base-commit: 08bd5b7c9a2401faabdaa1472d45c7de0755fd7e
change-id: 20250101-fix-elantech-firmware-query-07619912f603

Best regards,
-- 
Maurice Hieronymus <mhi@mailbox.org>


