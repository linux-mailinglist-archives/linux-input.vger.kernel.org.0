Return-Path: <linux-input+bounces-7739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3179B2DF3
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 12:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FABC28301A
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE831FF5FC;
	Mon, 28 Oct 2024 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgSTH/vl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661831FF5F3;
	Mon, 28 Oct 2024 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112782; cv=none; b=tgxU9x+ZhsukKamxZd9xldSZGc+VDO9fhRbiMEUjBhBALY/yhaEQ/AZuLy/XvMU6sYohcqJNDx9/fIPoP+1kooZ4BVB4BPJuHfSiZ7JIzbKmmaA+Xji+SFJNuS8uNchIZs1n8LAvA3HKNumGOufJ8ryktqwIMNA1xaE+7c5mFlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112782; c=relaxed/simple;
	bh=0pB+SFuonPiYVgHLGX4PGHhmVAtheFXv+n2PUaKa9Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHJO7qRQ0VHChxUcjGz1dXWFi3wX8lMP1ZWMro+qSq9XBjCnJbKHtBqMJMn5zz77ez8/x/aOjR5CAYwQm7RcBkmnMWi8vUkl+RpDbPX6VwyH25UL7wjqgKaJik+p6GrgEkpmOjq6ivHEpsTOHN+UtKRcyMqGubH2aTkYsIW8M00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgSTH/vl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34640C4CEC3;
	Mon, 28 Oct 2024 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112782;
	bh=0pB+SFuonPiYVgHLGX4PGHhmVAtheFXv+n2PUaKa9Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DgSTH/vl3MLjSHjgzcjbXhkU4ou18jiu3Ei1t38eIK/5XIDxzFLVqc1tnp+zOlYf2
	 TmZQuxkHC6/fJJLI0XtO0JomsyB5Ax9sFnY+Hhrkc/t4aXC+ZF7TFSrzbh8ogF6Qll
	 vO+3chqMXPYJ8oiMe4tXF+4ICG+vfFdX9mggZCNyOKaPTB+DnmCHnX0a+hHj7v2W93
	 JCWQSajONorRu+yBLqgNX+mQ0GebCnZYI0nsV9v7EqAm4g04rqs6eo5rqCYL8rn9IJ
	 9N4pCl8yfTzghXYXZwuIbZjO8R42KC3Qa0Nbb6nWRRPoYfOvsLP4PnlBk161w/wPyv
	 A6NhQdsrbQumg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Izhar Firdaus <izhar@fedoraproject.org>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 5/8] HID: lenovo: Add support for Thinkpad X1 Tablet Gen 3 keyboard
Date: Mon, 28 Oct 2024 06:52:46 -0400
Message-ID: <20241028105252.3560220-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105252.3560220-1-sashal@kernel.org>
References: <20241028105252.3560220-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.114
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 51268879eb2bfc563a91cdce69362d9dbf707e7e ]

The Thinkpad X1 Tablet Gen 3 keyboard has the same Lenovo specific quirks
as the original  Thinkpad X1 Tablet keyboard.

Add the PID for the "Thinkpad X1 Tablet Gen 3 keyboard" to the hid-lenovo
driver to fix the FnLock, Mute and media buttons not working.

Suggested-by: Izhar Firdaus <izhar@fedoraproject.org>
Closes https://bugzilla.redhat.com/show_bug.cgi?id=2315395
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-lenovo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index f86c1ea83a037..a4062f617ba20 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -473,6 +473,7 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
 							       usage, bit, max);
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
 	default:
 		return 0;
@@ -583,6 +584,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
 		if (ret)
 			return ret;
@@ -777,6 +779,7 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 		return lenovo_event_cptkbd(hdev, field, usage, value);
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
 	default:
 		return 0;
@@ -1059,6 +1062,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
 	}
@@ -1289,6 +1293,7 @@ static int lenovo_probe(struct hid_device *hdev,
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_probe_tp10ubkbd(hdev);
 		break;
 	default:
@@ -1375,6 +1380,7 @@ static void lenovo_remove(struct hid_device *hdev)
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		lenovo_remove_tp10ubkbd(hdev);
 		break;
 	}
@@ -1424,6 +1430,8 @@ static const struct hid_device_id lenovo_devices[] = {
 	 */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB3) },
 	{ }
 };
 
-- 
2.43.0


