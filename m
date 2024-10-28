Return-Path: <linux-input+bounces-7735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD619B2D8E
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38BB8B229A3
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 10:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBBF1DDA3B;
	Mon, 28 Oct 2024 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vL4gViwT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1411DDA34;
	Mon, 28 Oct 2024 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112698; cv=none; b=IrrL4uLQlLqAa2d8UjT1cB2do2ogyXs2OHJu03bn7MsQ6/Aq6ngNr5Cmr3xwzi15FtwOZUI+R91UhE4n/UK+n7TxLZPt9Wnxc6OlKtzZpGXQ8Kb7luRwDIctvNpHOQn5sRGMj3sJeMH8CTQUYXp/pBHcAGoiyp4/eObFtylHOo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112698; c=relaxed/simple;
	bh=fprWw+EZ+3jrw169QDS4ywaP5OfWl7O0xQ2BMWjDV6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9w13tneqKSCngeY/EAPR3NkX0XCQHd9rB3ogN185vDtvjVDZlcuxjQoWP2dLAtlX3hVVv6EVY4F3RvS3UUnQLBcvtQP/PquJ3C7p2Q7zpLIIHxhLPt36Nxn/TSMKMqY626RJYlB6RzE697V1EiK7E/0bqbktWKAY7tJFw1eDoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vL4gViwT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C65DC4CEE8;
	Mon, 28 Oct 2024 10:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112698;
	bh=fprWw+EZ+3jrw169QDS4ywaP5OfWl7O0xQ2BMWjDV6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vL4gViwTThq0wAE4OOw084lFxC3npYChfOeB4aqv88JJl2oVZ+58Hl4Ea/x5kIFyP
	 GbdoO9L1CF+T9+3Vo9Dou2TilkAZlVI9VvFgr19Mb7zYXdZjbkrq9KrJPbk4veFn2b
	 MZPTh8YR89QyohgBUH2n/3HA2VLGUEttHdMy/Jf6eryUZTQN31w1WAVcxhttmZ2+z+
	 lvDk7ENAks3ENrloYqXKEmf0Ds3JtPOEQwsA+Tuj+zPLt9nBA3YMUCmgQVO7omwNqR
	 c3i42rA/7Kx9qst1jjfUM9s1tX9b8YGLIHVyN7v3f3lrGU9LJWejNA96NykFEAEyYy
	 LOYCTw4aWgxJw==
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
Subject: [PATCH AUTOSEL 6.11 17/32] HID: lenovo: Add support for Thinkpad X1 Tablet Gen 3 keyboard
Date: Mon, 28 Oct 2024 06:49:59 -0400
Message-ID: <20241028105050.3559169-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105050.3559169-1-sashal@kernel.org>
References: <20241028105050.3559169-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
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
index e5e72aa5260a9..24654c7ecb04e 100644
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
@@ -776,6 +778,7 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 		return lenovo_event_cptkbd(hdev, field, usage, value);
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
 	default:
 		return 0;
@@ -1056,6 +1059,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
 	}
@@ -1286,6 +1290,7 @@ static int lenovo_probe(struct hid_device *hdev,
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_probe_tp10ubkbd(hdev);
 		break;
 	default:
@@ -1372,6 +1377,7 @@ static void lenovo_remove(struct hid_device *hdev)
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		lenovo_remove_tp10ubkbd(hdev);
 		break;
 	}
@@ -1421,6 +1427,8 @@ static const struct hid_device_id lenovo_devices[] = {
 	 */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB3) },
 	{ }
 };
 
-- 
2.43.0


