Return-Path: <linux-input+bounces-15590-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F7BEC8A3
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 08:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E67E94E2425
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 06:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9A72144D7;
	Sat, 18 Oct 2025 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b="g8NDmmo8";
	dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b="MdtVma45"
X-Original-To: linux-input@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F1B823DD
	for <linux-input@vger.kernel.org>; Sat, 18 Oct 2025 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760769335; cv=none; b=EHtgPfECEyZWJ3e0PwOdo01ms1O/qLacgoPQA9Ya5X/LgVj1nB1Vgsd7oH39Avq+bqZFEkfIqkvscPRguGoiLJ6SajnjQTNUv7VNHHAww4sN9BJRySbbqJ4sHR9cKN/whj/y7HFVO24nEOlbA4mi0GhtoiI0LkoEWYNd9aYV6u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760769335; c=relaxed/simple;
	bh=0WSIwkhDzl90fzjsIQh7p5mOPgDHHhX5nI0HoeyynIw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJB69U8ytKzyV/KiEU2cjotyypKNUcKYquyW9RKdhYnzNVBwKPKrzyLkzSrceFFCPBtdt86PMWGZDqGcj8HuYOsprpiEE/PlaRiRpAeKJ24kJ4rjS291O6knzhBESxUPZVL6QAXGyHgX40w5z2bxpgHmB3RYr2vDEK+i4uUWIs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hacktheplanet.fi; spf=pass smtp.mailfrom=hacktheplanet.fi; dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b=g8NDmmo8; dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b=MdtVma45; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hacktheplanet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hacktheplanet.fi
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=gibson; bh=0WSIwkhDzl90f
	zjsIQh7p5mOPgDHHhX5nI0HoeyynIw=; h=subject:to:from:date;
	d=hacktheplanet.fi; b=g8NDmmo8KeF7WjJEH1V9blKY0bq3+ld0/c2w0Y17AX1LVlnC
	MO/j99lQ0OZFVzoLPLpaheZ5El4sy2t4qxOBj8iZHWnZMWFIRDHqEpOPHr2lEizOnDWutO
	+Ckk8tVou5iz9cJN7Tu1H+KUhFmUQ9PEW6+70ul8dQiASST95Mc8IyNujOpO4CGO1SKVpU
	buSufEynFyt09Z1KhHWcU5mTsiGBWW/JXqKbGgiBCvtnUmdDVpEOvekTf7V3AJ7jxbXMbN
	bnii/oGJoVENFj/NY67B3+s1j2onbN1w14xHXy+oVmCMRzE4UaHcnLOAlNcJHBI8AHcL5L
	6egrQO5MkGFLQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hacktheplanet.fi;
	s=key1; t=1760769325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=9dZkwS80zv7CMH5OCsPxKdu5R7UnIbLoEA4hUq6Nbx0=;
	b=MdtVma459tFHBxjJBmfn/3jSyVSIlpWAJW9ZPquIJFmErRWvYt0t1Q7t3jexf2zKwtCOMG
	EIlWcwcdLEOKHwBGWJrUBPam14HkGScQL76bdj82vMLozzAe+nNkxb4en6Do9Aj/qIJFIO
	Vj7TWuNFESa2eLRzQtQ/4wF2QjNxjEsHLDknEN7tN2R+Pmt1JThTHVpMoQ3h5Z4N8XFEn1
	ja9XHnDCDlmF2Oxg1N+TKaJZ9MAcuWXURWZT1nUfSkZoFsLCIWQJCR5nstfSbSNAxCL9Q4
	srs6B50iuwod66gbFpqtlCm/UhaD4t6giLO2zfR3WyC6hKma8/Ekh84ff5vx9A==
Date: Sat, 18 Oct 2025 15:35:15 +0900
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lauri Tirkkonen <lauri@hacktheplanet.fi>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: lenovo: fixup Lenovo Yoga Slim 7x Keyboard rdesc
Message-ID: <aPM1I35YXWlabuKQ@mail.hacktheplanet.fi>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

The keyboard of this device has the following in its report description
for Usage (Keyboard) in Collection (Application):

	# 0x15, 0x00,                    //  Logical Minimum (0)                52
	# 0x25, 0x65,                    //  Logical Maximum (101)              54
	# 0x05, 0x07,                    //  Usage Page (Keyboard)              56
	# 0x19, 0x00,                    //  Usage Minimum (0)                  58
	# 0x29, 0xdd,                    //  Usage Maximum (221)                60
	# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               62

Since the Usage Min/Max range exceeds the Logical Min/Max range,
keypresses outside the Logical range are not recognized. This includes,
for example, the Japanese language keyboard variant's keys for |, _ and
\.

Fixup the report description to make the Logical range match the Usage
range, fixing the interpretation of keypresses above 101 on this device.

Signed-off-by: Lauri Tirkkonen <lauri@hacktheplanet.fi>
---
v1 -> v2: moved to hid-lenovo from hid-i2c, renamed hid-ids macro to
clarify the device only refers to the keyboard

v1: https://lore.kernel.org/all/aOdLxAEYQpV2zp77@mail.hacktheplanet.fi/

 drivers/hid/hid-ids.h    |  1 +
 drivers/hid/hid-lenovo.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5721b8414bbd..4b1946eb4e7f 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -715,6 +715,7 @@
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA2  0x8350
 #define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA900	0x8396
+#define I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD	0x8987
 #define USB_DEVICE_ID_ITE8595		0x8595
 #define USB_DEVICE_ID_ITE_MEDION_E1239T	0xce50
 
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 654879814f97..9cc3e029e9f6 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -148,6 +148,14 @@ static const __u8 lenovo_tpIIbtkbd_need_fixup_collection[] = {
 	0x81, 0x01,		/*   Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
 };
 
+static const __u8 lenovo_yoga7x_kbd_need_fixup_collection[] = {
+	0x15, 0x00,	// Logical Minimum (0)
+	0x25, 0x65,	// Logical Maximum (101)
+	0x05, 0x07,	// Usage Page (Keyboard)
+	0x19, 0x00,	// Usage Minimum (0)
+	0x29, 0xDD,	// Usage Maximum (221)
+};
+
 static const __u8 *lenovo_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
@@ -177,6 +185,13 @@ static const __u8 *lenovo_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 			rdesc[260] = 0x01; /* report count (2) = 0x01 */
 		}
 		break;
+	case I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD:
+		if (*rsize == 176 &&
+		    memcmp(&rdesc[52], lenovo_yoga7x_kbd_need_fixup_collection,
+			  sizeof(lenovo_yoga7x_kbd_need_fixup_collection)) == 0) {
+			rdesc[55] = rdesc[61]; // logical maximum = usage maximum
+		}
+		break;
 	}
 	return rdesc;
 }
@@ -1538,6 +1553,8 @@ static const struct hid_device_id lenovo_devices[] = {
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB2) },
+	{ HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD) },
 	{ }
 };
 
-- 
2.51.1

-- 
Lauri Tirkkonen | lotheac @ IRCnet

