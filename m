Return-Path: <linux-input+bounces-16469-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B5CA7DD2
	for <lists+linux-input@lfdr.de>; Fri, 05 Dec 2025 14:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E5A5304DA03
	for <lists+linux-input@lfdr.de>; Fri,  5 Dec 2025 13:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3CF326953;
	Fri,  5 Dec 2025 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCgt9IAn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2291821D3DC;
	Fri,  5 Dec 2025 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943099; cv=none; b=ls0tXUemp+7frT5BEflQOFD8caUrceGFOJJhp8MwYT+SxYrgi393KJ2QbnkvIUbOE8kvt3TQU7muWp6v942+NaMNdwRh8ouFbiQA+uMMxw3DsvzRADIxzUf6bqKk+pisUBoQvfyIyLwb4LP39CcLGFacAmO1yHzv6JZDV95RnuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943099; c=relaxed/simple;
	bh=Z4m8lSEAN12qsskXGw9D3Nlqf+YRA2nANmGJ9uykkQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n/dylteMLKNy+YVG6YnSNw/zs4XlW70wxaUcpB6kHx2gU3HPsM5x1jjnNEZ0znItMkgPPxmom46naZ20NZOaxL16PDYWkf66EORe2BFQSh/43A1BhFgIx6ofIEoERkoMQi4V37x/lEBcKVwvNmvH6lijW1j71AIoj8uj4RCcjZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCgt9IAn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17023C4CEF1;
	Fri,  5 Dec 2025 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764943098;
	bh=Z4m8lSEAN12qsskXGw9D3Nlqf+YRA2nANmGJ9uykkQQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BCgt9IAn1J0CI/O02UOJ09PRyV5E3FOhISzeFWQIUJ1s6d40Xo4BuEwgBSZtJMVKT
	 mOj+2+mJhjrntnUEecsGY/JnPK2Zi/vBOaYTgFnGAiLbI7haT1RqyPjLrfdZ6L5TVS
	 g6I+9334vh9OTiGqpM8pJchQUtArpQsEdQR9aSg/V+Di9Qv1FEo/AyvI4OFZD7D9k4
	 ykqaZ6oAo983nBtfKc2hf+MOofm6HNmhAe+JcrI7wejC/DVZ7GrDJ1R8FNvjkf08Zn
	 M+VOewdoFVgC1TpD0z9qWRn2K/0inpgj7stqz4MYXtrjgceLPLQIdx7xheNvnUoky/
	 slVlvtf1dCv6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A4BD2F7F2;
	Fri,  5 Dec 2025 13:58:18 +0000 (UTC)
From: PrakarshPanwar via B4 Relay <devnull+prakarshpanwar.gmail.com@kernel.org>
Date: Fri, 05 Dec 2025 19:27:29 +0530
Subject: [PATCH] HID: EVision: input mapping fix for K552 keyboard
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-evision-k552-mapping-fix-v1-1-848d086c43ee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MUQqAIBAFrxL73YKtGNhVoo+yrZbIRCGC8O5J9
 DmPefNA4iicoKseiHxJktMXaOoK3Db6lVHmwkCKTEPK4O/gbgzhMYYgfsVFbtQ8aedaS9pqKPc
 Qucxfuh9yfgHIKEJBagAAAA==
X-Change-ID: 20251205-evision-k552-mapping-fix-3eb3cc692393
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 PrakarshPanwar <prakarshpanwar@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764943096; l=3517;
 i=prakarshpanwar@gmail.com; s=20251205; h=from:subject:message-id;
 bh=FbNPppy7ffLlAcVnO/gIOJ8EROcXn+EFg4VSSnSlKFM=;
 b=7KadONIPAD8hdhKW3wJRHh93+dJCf9P3K7PLHEYphBx/PPBvL43NM1ejHqWiDoYg7HAQ8JshQ
 y8eQyGtdSW6CDDaVd1Cyhq7+3jegDpruCBJChuCbOOP8wEM9ADgvzK+
X-Developer-Key: i=prakarshpanwar@gmail.com; a=ed25519;
 pk=ZK93l6VijhK0Hqz7nq+uC+IPDAgNxoOPhtFTMGDVx0c=
X-Endpoint-Received: by B4 Relay for prakarshpanwar@gmail.com/20251205 with
 auth_id=571
X-Original-From: PrakarshPanwar <prakarshpanwar@gmail.com>
Reply-To: prakarshpanwar@gmail.com

From: PrakarshPanwar <prakarshpanwar@gmail.com>

Added fix for Media Key in Redragon K552 keyboard
In Windows, this keyboard F1 Key opens Media Player,
but in Linux it opens System Settings.

This commit is a fix for that bug it remaps K552 F1 key
which outputs KEY_CONFIG(171) now outputs KEY_MEDIA(226)

It also restructures the input mapping code in hid-evision

Signed-off-by: PrakarshPanwar <prakarshpanwar@gmail.com>
---
 drivers/hid/hid-evision.c | 39 ++++++++++++++++++++++++++++++++++++---
 drivers/hid/hid-ids.h     |  1 +
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-evision.c b/drivers/hid/hid-evision.c
index 3e7f43ab80bb63ba073bc71f72acdb5ffaed8202..f78861863d4fc8a1305948385aa561ab374ceb49 100644
--- a/drivers/hid/hid-evision.c
+++ b/drivers/hid/hid-evision.c
@@ -14,14 +14,29 @@
 
 #include "hid-ids.h"
 
-static int evision_input_mapping(struct hid_device *hdev, struct hid_input *hi,
+static int evision_k552_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		struct hid_field *field, struct hid_usage *usage,
 		unsigned long **bit, int *max)
 {
-	/* mapping only applies to USB_DEVICE_ID_EVISION_ICL01 */
-	if (hdev->product != USB_DEVICE_ID_EVISION_ICL01)
+	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_CONSUMER)
+		return 0;
+
+	switch (usage->hid & HID_USAGE) {
+	/* report 3 */
+	case 0x183:
+		hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_MEDIA);
+		break;
+	default:
 		return 0;
+	}
+
+	return 1;
+}
 
+static int evision_icl01_input_mapping(struct hid_device *hdev, struct hid_input *hi,
+		struct hid_field *field, struct hid_usage *usage,
+		unsigned long **bit, int *max)
+{
 	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_CONSUMER)
 		return 0;
 
@@ -41,6 +56,23 @@ static int evision_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
+static int evision_input_mapping(struct hid_device *hdev, struct hid_input *hi,
+		struct hid_field *field, struct hid_usage *usage,
+		unsigned long **bit, int *max)
+{
+	int ret = 0;
+
+	if (hdev->product == USB_DEVICE_ID_EVISION_ICL01) {
+		ret = evision_icl01_input_mapping(hdev, hi,
+			field, usage, bit, max);
+	} else if (hdev->product == USB_DEVICE_ID_EVISION_K552) {
+		ret = evision_k552_input_mapping(hdev, hi,
+			field, usage, bit, max);
+	}
+
+	return ret;
+}
+
 #define REP_DSC_SIZE 236
 #define USAGE_MAX_INDEX 59
 
@@ -59,6 +91,7 @@ static const __u8 *evision_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 static const struct hid_device_id evision_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_EVISION, USB_DEVICE_ID_EVISION_ICL01) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_EVISION, USB_DEVICE_ID_EV_TELINK_RECEIVER) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_EVISION, USB_DEVICE_ID_EVISION_K552) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, evision_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d31711f1aaeccb4ec93c5a9056af605d1775e0c5..f30b383036c74ad48b2d6880a44b2f2ac5dab46e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -478,6 +478,7 @@
 
 #define USB_VENDOR_ID_EVISION           0x320f
 #define USB_DEVICE_ID_EV_TELINK_RECEIVER 0x226f
+#define USB_DEVICE_ID_EVISION_K552      0X5000
 #define USB_DEVICE_ID_EVISION_ICL01     0x5041
 
 #define USB_VENDOR_ID_FFBEAST		0x045b

---
base-commit: 2061f18ad76ecaddf8ed17df81b8611ea88dbddd
change-id: 20251205-evision-k552-mapping-fix-3eb3cc692393

Best regards,
-- 
PrakarshPanwar <prakarshpanwar@gmail.com>



