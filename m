Return-Path: <linux-input+bounces-14418-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A8B3FFE2
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 14:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE52D7B85B1
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 12:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B0630496A;
	Tue,  2 Sep 2025 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIBhxa9r"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FDD304969;
	Tue,  2 Sep 2025 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814927; cv=none; b=M+owhsS+R65ah74bnm3rfGctRlxH4JVY5JKlnSLhdkB6yzPntPrYC3KJmZ03nWkdDbrK36kpbPayEd3S1jozXpSVIbxVfdqjQyy+iQzrQbSlyUPDGsOZyufd/Vp+m3556GaR/5SiMQPBvtRLea/d1rpERI3wFYxxXnRdDJZdMd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814927; c=relaxed/simple;
	bh=TWBOkaAMgS8nixfHJ6MketFW6NqNTcg+z9VAOmrhpFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdOO/gze5nnZ9ZNsHAhlJdZxibGBhgHPu1/ZfgZxoK4sarMQh5foB7LzwXz+hXj2M2m17+6N86NVcd+tBRPx22OH8ykMoUbNcLj13dg/pUXrHEb3Xg1d2mdawuKHKV70hpTzJs0x/9Y28E8Crab7+uI3HSTa4W3wd3Lpx2FNluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIBhxa9r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18118C4CEF7;
	Tue,  2 Sep 2025 12:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814926;
	bh=TWBOkaAMgS8nixfHJ6MketFW6NqNTcg+z9VAOmrhpFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bIBhxa9rSQ0WUtgk46xaGVOm3cKzHBugNrxRKY4cS29kL4G43eHejcCqRnkk7JtLL
	 lKMqUkV7jLCq5TnYAYjI+UujWPcxk0u5xr/QGnlJSq298RjPhHHe9l1ev/qebfiOsT
	 ixCGaY3BGL9QuuvJhj2d2+5jVsPnweawiQIoeuS8z4C2qt8JbKjgtmN1e4ERn19WqQ
	 dMNB6I/jOBsud7QyseHkjUH7E6WX6hD3pVEuQDP8ImcQSc0mkE3gf/cjOtjlDP8OqT
	 3l5W8UnWpAoEPlrX+8bpU2AcPwmJVeon7Vm1bFayfn9+5wumh10z71cNi33HuNZrpr
	 rC2y66IztziNQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Martin Hilgendorf <martin.hilgendorf@posteo.de>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16] HID: elecom: add support for ELECOM M-DT2DRBK
Date: Tue,  2 Sep 2025 08:08:18 -0400
Message-ID: <20250902120833.1342615-7-sashal@kernel.org>
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

From: Martin Hilgendorf <martin.hilgendorf@posteo.de>

[ Upstream commit 832e5777143e799a97e8f9b96f002a90f06ba548 ]

The DT2DRBK trackball has 8 buttons, but the report descriptor only
specifies 5. This patch adds the device ID and performs a similar fixup as
for other ELECOM devices to enable the remaining 3 buttons.

Signed-off-by: Martin Hilgendorf <martin.hilgendorf@posteo.de>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Hardware Enablement Bug Fix
The commit fixes a functional bug where the ELECOM M-DT2DRBK trackball
mouse has 8 physical buttons but only 5 are usable due to an incorrect
HID report descriptor. This is clearly stated in the commit message:
"The DT2DRBK trackball has 8 buttons, but the report descriptor only
specifies 5."

## Minimal and Contained Changes
The patch is extremely small and low-risk:
- Adds one device ID definition (`USB_DEVICE_ID_ELECOM_M_DT2DRBK
  0x018d`)
- Adds the device to three existing device tables
- Reuses existing fixup logic by adding `case
  USB_DEVICE_ID_ELECOM_M_DT2DRBK:` alongside the already-supported
  `USB_DEVICE_ID_ELECOM_M_HT1DRBK_011C` case

## Follows Established Pattern
The code changes show this device shares the exact same fixup parameters
as the M-HT1DRBK_011C device (lines 104-113 in hid-elecom.c):
```c
case USB_DEVICE_ID_ELECOM_M_DT2DRBK:
case USB_DEVICE_ID_ELECOM_M_HT1DRBK_011C:
    /* Report descriptor format:
     - 22: button bit count
     - 30: padding bit count
     - 24: button report size
     - 16: button usage maximum
     */
    mouse_button_fixup(hdev, rdesc, *rsize, 22, 30, 24, 16, 8);
```

## No Risk of Regression
- The changes only affect the specific device ID (0x018d)
- No modifications to core HID subsystem logic
- Uses well-tested `mouse_button_fixup()` function already in use for
  multiple other ELECOM devices
- Cannot affect other devices or subsystems

## User Impact
Without this patch, users of the ELECOM M-DT2DRBK trackball cannot use 3
of the 8 physical buttons, significantly limiting the device's
functionality on Linux. This is the type of hardware enablement fix that
stable kernels should include to maintain proper hardware support.

## Similar Patches Precedent
The git history shows similar ELECOM device support additions have been
routinely added (e.g., commit 29f316a1d7e0a for M-HT1DRBK_011C device),
indicating this is standard practice for the HID subsystem.

 drivers/hid/hid-elecom.c | 2 ++
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
index 0ad7d25d98647..69771fd350060 100644
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -101,6 +101,7 @@ static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		 */
 		mouse_button_fixup(hdev, rdesc, *rsize, 12, 30, 14, 20, 8);
 		break;
+	case USB_DEVICE_ID_ELECOM_M_DT2DRBK:
 	case USB_DEVICE_ID_ELECOM_M_HT1DRBK_011C:
 		/*
 		 * Report descriptor format:
@@ -123,6 +124,7 @@ static const struct hid_device_id elecom_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT2DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1URBK_010C) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1URBK_019B) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1DRBK_010D) },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index a687fbbb77b00..0e2b9be3bd8b3 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -448,6 +448,7 @@
 #define USB_DEVICE_ID_ELECOM_M_XT4DRBK	0x00fd
 #define USB_DEVICE_ID_ELECOM_M_DT1URBK	0x00fe
 #define USB_DEVICE_ID_ELECOM_M_DT1DRBK	0x00ff
+#define USB_DEVICE_ID_ELECOM_M_DT2DRBK	0x018d
 #define USB_DEVICE_ID_ELECOM_M_HT1URBK_010C	0x010c
 #define USB_DEVICE_ID_ELECOM_M_HT1URBK_019B	0x019b
 #define USB_DEVICE_ID_ELECOM_M_HT1DRBK_010D	0x010d
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 90be93bdb0895..416160cfde77b 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -412,6 +412,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT2DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1URBK_010C) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1URBK_019B) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1DRBK_010D) },
-- 
2.50.1


