Return-Path: <linux-input+bounces-9532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B9AA1C41F
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 16:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F739188960F
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 15:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B092C190;
	Sat, 25 Jan 2025 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sjO4prl3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fK9qXzbR"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4481376F1;
	Sat, 25 Jan 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737820580; cv=none; b=CbYUPDgDxxw3kWr/+FLg4BJvf+U1uZE0rJMVGgh1486F2srIEsDPuvS6EzV5jxhpeY2zJwbo9g/Cst6jiFo+b54Xe/E+iLWaJbtL3fM2H/qUwufD3AvtuNyNLnKIvBNHJ3+5CUnuvG9V7Ygj1t3FQbre5u/wK6QKp3izAkFVL/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737820580; c=relaxed/simple;
	bh=NHPrEnprfHj4vBSZ2CncL+MtNwXpYmkFt1B9uEGF3Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YsugF8ysnaENFHsVjDYuaGYhCzpc91AM1frGDJeoQ5a/L7mFL3DVFM9dWQDyFdBN0jE0kE/1qeW7pKboN+Kct9pzgl3ka741CUza5DcFPpjjCA+lB4gykdshC7p2Kpgk6htHtWAOoz9GcqIOaKP/fOIciQF3XeQbb4h2nvvL6ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sjO4prl3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fK9qXzbR; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YgK6M34Nyz9sr1;
	Sat, 25 Jan 2025 16:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737820571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/a4B3LFCH0cw8pkbIEn7IMoUgCo81EdadpIkiLzXGCI=;
	b=sjO4prl38LJU/mvoWh5U9FXj2xCjlzdCZzoaAkd6v3+Q7+PdAjsmsZmo8w03spDFEgH4kA
	IWRVokmh3eDMEaf/7rRlzUuxNIrVJlCdULiK/QUmTnkUtytJpvn9rgE0OUvTN8wAaeKXte
	GTz29hRW0SKoL7XnxNo8NYDfEf54u3wPrVRuDUqEK0RtUFFfNtx8gfUXkXt3J08DyZErAR
	UAgsqN8PWT0sQ+qaVdoEQujBqHvMX7bGLEoBVV3xSyyC4Fo2tLHYW/ZrEDDqi5Uk2H6Q9s
	QwTBfsMXfmq2RSe1e3OXpnMO+JfI7tP+fd9d2GgpaSh2KZL1P5h0cv/VivHzYg==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737820569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/a4B3LFCH0cw8pkbIEn7IMoUgCo81EdadpIkiLzXGCI=;
	b=fK9qXzbRoh4Na1fg7tZvFjGHyHZ2ds46i1fkpULwZKFDHiWfLZGiGM4AEmMHCWuS+VAy/a
	sNHghwEgrS85rNAQl4OWmYYeJRvEuq8iKa3cv7skoQyHn153vn19z7lzxBLf+6dXXkAJmq
	RIvgux+73lJYSShwSCyIbBFdmaZh+Br6EU8XF6efrmwyG14iRW8d1IRzM8blYxsYGdG5Y9
	fBtGquBW0K0s7ovU18ovruyEILuf5qIqcjXdQWS85iXctJRhVGF3MR1FGFEe0FTJtXs36x
	gE4Ip8h91R9uwud+F3LC4JdxonxdG7iqLiYNYTPecsq54dmFmUuCXLyZx7B1lA==
Date: Sat, 25 Jan 2025 16:55:47 +0100
Subject: [PATCH] Input: elantech: Retry ETP_FW_VERSION_QUERY on Lenovo
 Thinkpad E14 Gen2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250125-fix-elantech-firmware-query-v1-1-b507a5361741@mailbox.org>
X-B4-Tracking: v=1; b=H4sIAIIJlWcC/32NwQqDMBBEf0X23JRsRMWe+h/FQ9RVA2rqxlpF/
 PdupecypzcMb3YIxI4C3KIdmBYXnB8F8BJB1dmxJeVqYTDaJBo1qsatino7zlR1Ajy8LZOaXsS
 b0lmKeY6mSXUMYngyyfy0PwrhzoXZ83aeLfhtf16T/PUuqCRZ2sRIpanJ3gfr+tKvV88tFMdxf
 ADXOasHyAAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maurice Hieronymus <mhi@mailbox.org>
X-MBO-RS-META: p8moexnfkj5s3hzq7d6gddpymcxxj8yh
X-MBO-RS-ID: b620910fb73adb6e015
X-Rspamd-Queue-Id: 4YgK6M34Nyz9sr1

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
index 79ad98cc1e79..202150443209 100644
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


