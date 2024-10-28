Return-Path: <linux-input+bounces-7737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C97CE9B2DCB
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 12:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75C991F21DFD
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D791E048B;
	Mon, 28 Oct 2024 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0IjhM5J"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F931E0485;
	Mon, 28 Oct 2024 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112753; cv=none; b=QUHifU9NJqTjnJ0GG4xG8G21Qe4JlU+DhVsm7ThDislCwN9guriLkoNgPLwoQzVY7LKWRdIL5/Sg/a9daW5fzHm82HALC9ecknItIEM2HdwTAt/9vt/HzMbG/iKRX7iiRuNXX3RSvxge0y6wbUawKebsgPrvMcYELAaf2YDJ3jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112753; c=relaxed/simple;
	bh=0pB+SFuonPiYVgHLGX4PGHhmVAtheFXv+n2PUaKa9Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ei492oUgM6W6JhnA5PNcTKInF0xRRORLn+3wAGtUsnCHUpQAvjvui74Teu2gldR9bHyGO/UwxaJipCN3KE5kl3onIBUdkoByNXTJeJ7N9GCu1xmcTx1R9rFtW5HNVJdPIh6bcKKbYHn3+A4+S/uscn5C5xz6ol/Mkc3TQxbTlxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0IjhM5J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26809C4CEE3;
	Mon, 28 Oct 2024 10:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112753;
	bh=0pB+SFuonPiYVgHLGX4PGHhmVAtheFXv+n2PUaKa9Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0IjhM5Jd7mOSsUh5jfcmbqlh2yeepvJV0S6ZNL84W9xp04la6HvPPSBZnNeSqCSU
	 bffaGcrETDuYNX7wORlpYXppNmNd7Kb04fXM7mFWJ/PAagDamy0sdz7ijsADPwBhLs
	 lk+QdOAGPs6L12bx8eZWiRGxWuApKwFhxLN7hqwfKFewh7AZk+en/zTeRWsE//kq3p
	 rCK0z3YhqP31S7PiDKd6xpepQKkLGaKqpDboVka+B6NknRUoRcRT2m7P7/2NXPDwwm
	 cUA1z0Mr0hPx82JjvMMNAEPBsiHlzfReoqJWTLP8hNjUIHA4cHZW7DxP8WZEEJwMto
	 DXwT7hcbVUGig==
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
Subject: [PATCH AUTOSEL 6.6 07/15] HID: lenovo: Add support for Thinkpad X1 Tablet Gen 3 keyboard
Date: Mon, 28 Oct 2024 06:52:03 -0400
Message-ID: <20241028105218.3559888-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105218.3559888-1-sashal@kernel.org>
References: <20241028105218.3559888-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.58
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


