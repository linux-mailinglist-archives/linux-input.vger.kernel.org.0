Return-Path: <linux-input+bounces-1155-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A7F826A8D
	for <lists+linux-input@lfdr.de>; Mon,  8 Jan 2024 10:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A18FB1F21301
	for <lists+linux-input@lfdr.de>; Mon,  8 Jan 2024 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B107D14276;
	Mon,  8 Jan 2024 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nbXzWqCD"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D013FEF
	for <linux-input@vger.kernel.org>; Mon,  8 Jan 2024 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240108092006epoutp013b120f0a3f1c72cea700904c72bb6de4~oVLe1FWvY1935019350epoutp01P
	for <linux-input@vger.kernel.org>; Mon,  8 Jan 2024 09:20:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240108092006epoutp013b120f0a3f1c72cea700904c72bb6de4~oVLe1FWvY1935019350epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1704705606;
	bh=Aeh63ARlk/fKxiss469QZfuzwt6Eklhg+CnypWQMAXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nbXzWqCDvklBgBF9EjiErRY704MkQ/N9+AtzYwNjs8IsYl61U6G5BC7rDAveRwBTm
	 wIBiRBke0OFKiYbSBsJjcqEt7IzwNbd6cNo5/HJUxoJuj/Uo+aCVc3O++XymT4L7mQ
	 Ee2KQ7d3mWVdVCceWxfUOvX3JpL8X9MPmBhpaU94=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240108092006epcas5p1ce12f914cf3597107ac22f3006e1d028~oVLejjQ9m1035210352epcas5p1D;
	Mon,  8 Jan 2024 09:20:06 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4T7pS45Rlvz4x9Pw; Mon,  8 Jan
	2024 09:20:04 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	28.88.09672.44EBB956; Mon,  8 Jan 2024 18:20:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240108092004epcas5p1c7069a6ede85066817d8ce5a79da75ad~oVLcSB51t1035210352epcas5p15;
	Mon,  8 Jan 2024 09:20:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240108092004epsmtrp1e4610ae69a23b1d53b37b43a3cd58bc4~oVLcROMuN1918419184epsmtrp1O;
	Mon,  8 Jan 2024 09:20:04 +0000 (GMT)
X-AuditID: b6c32a4b-39fff700000025c8-c0-659bbe440f66
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	39.57.08755.44EBB956; Mon,  8 Jan 2024 18:20:04 +0900 (KST)
Received: from ws2030077324.sa.corp.samsungelectronics.net (unknown
	[107.99.237.91]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240108092002epsmtip2713df726529de8070f7202c46fada4f7~oVLazhPr42072620726epsmtip2D;
	Mon,  8 Jan 2024 09:20:02 +0000 (GMT)
From: Sandeep C S <sandeep.cs@samsung.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>
Cc: gaudium.lee@samsung.com, ih0923.kim@samsung.com,
	suhyun_.kim@samsung.com, jitender.s21@samsung.com, junwan.cho@samsung.com,
	sandeep.cs@samsung.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [HID Patchsets for Samsung driver v2 3/6] HID: Samsung : Add
 Samsung wireless keyboard support.
Date: Mon,  8 Jan 2024 14:49:13 +0530
Message-Id: <20240108091917.1552013-4-sandeep.cs@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240108091917.1552013-1-sandeep.cs@samsung.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphk+LIzCtJLcpLzFFi42LZdlhTXddl3+xUg/V3VCyuT9nManF7gafF
	1iVzWS1uHW9ltHj5YAO7xebJj1gsbn76xmpxedccNov22c8YLR6t2MTkwOWxaVUnm8f7fVfZ
	PPq2rGL0+LxJLoAlKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJ
	xSdA1y0zB+geJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BSYFecWJucWleul5e
	aomVoYGBkSlQYUJ2xrZD01kLfqlVrL16jamBcY5CFyMnh4SAicSv+UuZuxi5OIQEdjNKfDgy
	iwUkISTwiVFiW1c2hP2NUWL3LnmYhuOv/jJCNOxllPi47DgbhNPJJHFhCcgoTg42AS2JviPf
	mUBsEYEIiXcLNjGC2MwC1xklHjwM7GLk4BAWyJJY3p0BEmYRUJVo2/UIrJxXwFbixafd7BDL
	5CX2HzwLNpJTwE5i25ONUDWCEidnPmGBGCkv0bx1NtgHEgJf2SVe9E1khWh2kbh08RcbhC0s
	8er4FqihUhIv+9vYIRq6GSWW3j4G5cxglGjZeZUZospe4ufrCWwglzILaEqs36UPsY1Povf3
	EyaQsIQAr0RHmxBEtYrE067drDDzv5+AOFRCwEOirX8tOySAJjJKHJvymGkCo/wsJE/MQvLE
	LIRtCxiZVzFKphYU56anFpsWGOellsMjNjk/dxMjOFlqee9gfPTgg94hRiYOxkOMEhzMSiK8
	kjNmpwrxpiRWVqUW5ccXleakFh9iNAWG8kRmKdHkfGC6ziuJNzSxNDAxMzMzsTQ2M1QS533d
	OjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgelMaIWh/ZKYayqyF5VT5RtfTfi1JvrzkbVzHMscejKl
	dniwPs5337DvUXpb4xfuzWW79rR7y1zhXxpkt3+dO9fmmgnNKu03bOJ/Hv+e77ToM/OmR/xX
	movaPrX3HGCWVUo+yxGvu5mr+twGyV3TtFyulL8oP6ozRycr4a1IhzVrYmfpRYMTyn6zt2ae
	VHv9dvs/16S3rQ6zzyZPj173y+rD14OzhDa1lSwRaMoz/ie6b/Kbyi8P72i/jjvjuStII90s
	bYfyjv6QJRUli2Zrcocq6na4ry554z7H3sfpZFVB/Y6+GYY9FaGzpX3T+pf6bpyrqtw3wVRm
	hpnLm+dtSWHVDAzemVG/XK8IcqV5K7EUZyQaajEXFScCAK0VwaYfBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvK7LvtmpBhcecVpcn7KZ1eL2Ak+L
	rUvmslrcOt7KaPHywQZ2i82TH7FY3Pz0jdXi8q45bBbts58xWjxasYnJgctj06pONo/3+66y
	efRtWcXo8XmTXABLFJdNSmpOZllqkb5dAlfGtkPTWQt+qVWsvXqNqYFxjkIXIyeHhICJxPFX
	fxm7GLk4hAR2M0ps2XyTCSIhJbHq+j1GCFtYYuW/5+wQRe1MEgsWNLKAJNgEtCT6jnwHaxAR
	iJCY9m8t2CRmgfuMElv3X2UDSQgLZEg0tr5jBbFZBFQl2nY9AmvgFbCVePFpNzvEBnmJ/QfP
	MoPYnAJ2EtuebASrEQKpmfKNHaJeUOLkzCdgi5mB6pu3zmaewCgwC0lqFpLUAkamVYySqQXF
	uem5xYYFhnmp5XrFibnFpXnpesn5uZsYwaGupbmDcfuqD3qHGJk4GA8xSnAwK4nwSs6YnSrE
	m5JYWZValB9fVJqTWnyIUZqDRUmcV/xFb4qQQHpiSWp2ampBahFMlomDU6qBKaXl+LyrpVKt
	Hz+pyXvILzL8znyiZ6LDMfGEqsvzs/al5UoyiLwSm+oofparwjLr0D1Vj8vbcy8UXskL0pvM
	otWTwOSjM6EgjXHPQkm5vdx/atILr7I3LudU4PPbdvdx7nZ9CaHwJcnf7lrvnljW3alxh0WX
	a8L1kG1c1xdyfbYInXSf/cp63ch+X5UVH77sNDbbl26jXeiyI7U/+ee8pxwXn37ZVXk9k6Fx
	6qXJ5if0Lc/PXVcvY5F1kvVWuldctMAac32GXgulGYbOEecqT29P/zf31br7p2frdlVm8bUt
	vZ7l5te7v+vowr9GpbqnWbMvT38haJH86afLdM87TxmTL5/Y+z2PQ5vve+4WJZbijERDLeai
	4kQAaxF6yeQCAAA=
X-CMS-MailID: 20240108092004epcas5p1c7069a6ede85066817d8ce5a79da75ad
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240108092004epcas5p1c7069a6ede85066817d8ce5a79da75ad
References: <20240108091917.1552013-1-sandeep.cs@samsung.com>
	<CGME20240108092004epcas5p1c7069a6ede85066817d8ce5a79da75ad@epcas5p1.samsung.com>

Add Support for samsung wireless keyboard with input mapping events.

Device 7021 (Samsung wireless keyboard)

Signed-off-by: Sandeep C S <sandeep.cs@samsung.com>
Signed-off-by: Junwan Cho <junwan.cho@samsung.com>
Signed-off-by: Jitender Sajwan <jitender.s21@samsung.com>
---
 drivers/hid/hid-ids.h     |   2 +
 drivers/hid/hid-samsung.c | 108 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 72046039d1be..2f526dc8983a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1139,8 +1139,10 @@
 #define USB_DEVICE_ID_SAITEK_X65	0x0b6a
 
 #define USB_VENDOR_ID_SAMSUNG		0x0419
+#define USB_VENDOR_ID_SAMSUNG_ELECTRONICS	0x04e8
 #define USB_DEVICE_ID_SAMSUNG_IR_REMOTE	0x0001
 #define USB_DEVICE_ID_SAMSUNG_WIRELESS_KBD_MOUSE	0x0600
+#define USB_DEVICE_ID_SAMSUNG_WIRELESS_KBD	0x7021
 
 #define USB_VENDOR_ID_SEMICO			0x1a2c
 #define USB_DEVICE_ID_SEMICO_USB_KEYKOARD	0x0023
diff --git a/drivers/hid/hid-samsung.c b/drivers/hid/hid-samsung.c
index 33cc92337394..611acd7ffd6d 100644
--- a/drivers/hid/hid-samsung.c
+++ b/drivers/hid/hid-samsung.c
@@ -144,6 +144,110 @@ static int samsung_kbd_mouse_input_mapping(struct hid_device *hdev,
 	return 1;
 }
 
+static int samsung_kbd_input_mapping(struct hid_device *hdev,
+	struct hid_input *hi, struct hid_field *field, struct hid_usage *usage,
+	unsigned long **bit, int *max)
+{
+	if (!(HID_UP_CONSUMER == (usage->hid & HID_USAGE_PAGE) ||
+			HID_UP_KEYBOARD == (usage->hid & HID_USAGE_PAGE)))
+		return 0;
+
+	dbg_hid("samsung wireless keyboard input mapping event [0x%x]\n",
+		usage->hid & HID_USAGE);
+
+	if (HID_UP_KEYBOARD == (usage->hid & HID_USAGE_PAGE)) {
+		set_bit(EV_REP, hi->input->evbit);
+		switch (usage->hid & HID_USAGE) {
+		/* Only for UK keyboard */
+		/* key found */
+#ifdef CONFIG_HID_KK_UPGRADE
+		case 0x32:
+			samsung_kbd_mouse_map_key_clear(KEY_KBDILLUMTOGGLE);
+			break;
+		case 0x64:
+			samsung_kbd_mouse_map_key_clear(KEY_BACKSLASH);
+			break;
+#else
+		case 0x32:
+			samsung_kbd_mouse_map_key_clear(KEY_BACKSLASH);
+			break;
+		case 0x64:
+			samsung_kbd_mouse_map_key_clear(KEY_102ND);
+			break;
+#endif
+		/* Only for BR keyboard */
+		case 0x87:
+			samsung_kbd_mouse_map_key_clear(KEY_RO);
+			break;
+		default:
+			return 0;
+		}
+	}
+
+	if (HID_UP_CONSUMER == (usage->hid & HID_USAGE_PAGE)) {
+		switch (usage->hid & HID_USAGE) {
+		/* report 2 */
+		/* MENU */
+		case 0x040:
+			samsung_kbd_mouse_map_key_clear(KEY_MENU);
+			break;
+		case 0x18a:
+			samsung_kbd_mouse_map_key_clear(KEY_MAIL);
+			break;
+		case 0x196:
+			samsung_kbd_mouse_map_key_clear(KEY_WWW);
+			break;
+		case 0x19e:
+			samsung_kbd_mouse_map_key_clear(KEY_SCREENLOCK);
+			break;
+		case 0x221:
+			samsung_kbd_mouse_map_key_clear(KEY_SEARCH);
+			break;
+		case 0x223:
+			samsung_kbd_mouse_map_key_clear(KEY_HOMEPAGE);
+			break;
+		/* Smtart Voice Key */
+		case 0x300:
+			samsung_kbd_mouse_map_key_clear(BTN_TRIGGER_HAPPY13);
+			break;
+		/* RECENTAPPS */
+		case 0x301:
+			samsung_kbd_mouse_map_key_clear(BTN_TRIGGER_HAPPY1);
+			break;
+		/* APPLICATION */
+		case 0x302:
+			samsung_kbd_mouse_map_key_clear(BTN_TRIGGER_HAPPY2);
+			break;
+		/* Voice search */
+		case 0x305:
+			samsung_kbd_mouse_map_key_clear(BTN_TRIGGER_HAPPY4);
+			break;
+		/* QPANEL on/off */
+		case 0x306:
+			samsung_kbd_mouse_map_key_clear(BTN_TRIGGER_HAPPY5);
+			break;
+		/* SIP on/off */
+		case 0x307:
+			samsung_kbd_mouse_map_key_clear(BTN_TRIGGER_HAPPY3);
+			break;
+		/* LANG */
+		case 0x308:
+			samsung_kbd_mouse_map_key_clear(KEY_LANGUAGE);
+			break;
+		case 0x30a:
+			samsung_kbd_mouse_map_key_clear(KEY_BRIGHTNESSDOWN);
+			break;
+		case 0x30b:
+			samsung_kbd_mouse_map_key_clear(KEY_BRIGHTNESSUP);
+			break;
+		default:
+			return 0;
+		}
+	}
+
+	return 1;
+}
+
 static __u8 *samsung_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	unsigned int *rsize)
 {
@@ -161,6 +265,9 @@ static int samsung_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (hdev->product == USB_DEVICE_ID_SAMSUNG_WIRELESS_KBD_MOUSE && hid_is_usb(hdev))
 		ret = samsung_kbd_mouse_input_mapping(hdev,
 			hi, field, usage, bit, max);
+	else if (hdev->product == USB_DEVICE_ID_SAMSUNG_WIRELESS_KBD)
+		ret = samsung_kbd_input_mapping(hdev,
+			hi, field, usage, bit, max);
 
 	return ret;
 }
@@ -203,6 +310,7 @@ static int samsung_probe(struct hid_device *hdev,
 static const struct hid_device_id samsung_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAMSUNG, USB_DEVICE_ID_SAMSUNG_IR_REMOTE) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAMSUNG, USB_DEVICE_ID_SAMSUNG_WIRELESS_KBD_MOUSE) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SAMSUNG_ELECTRONICS, USB_DEVICE_ID_SAMSUNG_WIRELESS_KBD) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, samsung_devices);
-- 
2.34.1


