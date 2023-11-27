Return-Path: <linux-input+bounces-269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371F7FADB7
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 23:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 654231C2094E
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 22:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04F146555;
	Mon, 27 Nov 2023 22:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=s.parschauer@gmx.de header.b="FMx654Zp"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AE3192
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 14:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701125422; x=1701730222; i=s.parschauer@gmx.de;
	bh=Ra1qI8W7Efthg/3BfHmZVQAdBI36tkIyezwMc4BrKR0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=FMx654Zp3PguPu8+tkBMMx5uoAtyk8mbjFQteTTgPOeeVTG+PX2XCsPaGFtk1PVN
	 CH+baiyDsiDL+z2ArIKdQPRBDb6sAyhkXtcsa9a95qSOSU8UeTKQRBhYUzrTPZWuy
	 fy68wLZ80hgMu3pHSrTbAKCzxL4YB1HNXkeetSkmBNQh+Ao2ARl/MI4+eTddqYBNA
	 HeubXwWTdZ21DBr2i+TBKOy0UhkOlqg4bgA4S04LcPTPPvbxNBrONiD4k4f7eh9fg
	 PYCWTCDG2OO3VAVJ1SyNSGBFsHbSIjvIoyUUv4BpppK1QiiUH+ov0g9W/UK3l7ztJ
	 2jmT4yS5/kB4U3tiuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([95.91.246.134]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mplbx-1rdVo32cHN-00qDGZ; Mon, 27 Nov 2023 23:50:22 +0100
From: Sebastian Parschauer <s.parschauer@gmx.de>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	Sebastian Parschauer <s.parschauer@gmx.de>
Subject: [PATCH] HID: Add quirk for Labtec/ODDOR/aikeec handbrake
Date: Mon, 27 Nov 2023 23:49:37 +0100
Message-Id: <20231127224937.9407-1-s.parschauer@gmx.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:leB7eveDsf6Vgbt45GdlBVDJ6T77LXhz4CF8eJfTR/CUcfkd2pE
 LI15tkgfaJ/L/D6XeYYNIsvLg5ddvr+psz3SLF1gtz/fClL0ZcZMk9oFlk9pcTZ71FwhkFp
 fdNRWRc2P6VHw7/WPAC+6ZjCYNDkngO9JjaHJqdSF5jVi9iEj7ecdmW2/U6Ad535Ql/2gGS
 WWO3Ut71ycgBys4bdcHzw==
UI-OutboundReport: notjunk:1;M01:P0:3gTvDxK1VUk=;gfK6GLMPZmEukcuTu4wXEIDWBj+
 Nk/3qaON5L7j9TAGHNRe9sytRgpt4De2QuVGRTKwvYkKOSTeu9BEHQH9WSBirBKsGJAcLt2hn
 FK2U2tn2+5EDVIBiajWPOk8Rqt54ZqvYzYw9Mzp4gBIraerDzt2p+cfcW2tV7z4/yuKO4KbSt
 AgF+3gh1Wqus57pMqUNqkuo6vjw/nmuUvBOf1WhT8dQNVBAcJ63/oByuiiAkyUehQhLXRMjC5
 25XpgFYcsWTShtKVxk5CpIqJYYbED/gTWj7R+wngqQDwkS9vkGLjVOpdS1jS0XcrID6sQu8qv
 +RCljd4RnJS7xJgcTiwWsZ4a+9lpMA2xCYZKSD+NG/TwZ+87ISyCacUhoaE63C8EjzsbOtycZ
 QHSRGGNd1mQbCWGTINVEiaEJGjkEEN00sMAsn4wfc8w+CFpQXu4f+DhXDTEC5+9rIq6Tbt46t
 KOampbmM3YrZVZl5ucfXQuYRv7fhcRAZXcPpoc0uoKq4ZiBmql+LAV62MvqVUKgRyL8gGP0B+
 Jcw4IBNCnYh5+yOX493lmKo/yVA+Hp//O9a/+mD5IiuAQlTxwFgzC+uQlf0GA4Qy/6A6FfIUY
 uAezpQZ9rdOsrKsPN7c83YYgJxnbeWnKJigOnr2MfkdfcDwAhcwof7T8b4C8dSTVHAfxQXZym
 k+phF/pkNB3Chzc9bCvm1C8OeH3d7+GONL36EhmsKs2RcrljVS1EOrYSMJBgO3tnsF6sNSh8/
 090Wi0QkNqkr9iMcEK2VeRF8wLyrUNJP9zkGP89ZhrwR960GW4Ink5wLFFX0bxW4rFD8v7Ags
 BIUUDJYRr+yycgI6ZIcMSbXOlHXqm/paI+FcoJYRSRV0NPnxg1zEfoJsMfYK+FOvvHIxlL4YC
 6j1MwHR1qczIuTXuVgnvwFM5TZJQm/6zkNZOpmcTQ4YB4rOoa4I37q4R3KKq0PWJCnfznTghr
 lDwTvcY4yolHSfELccrL4usN9T4=

This device needs ALWAYS_POLL quirk, otherwise it keeps reconnecting
indefinitely. It is a handbrake for sim racing detected as joystick.
Reported and tested by GitHub user N0th1ngM4tt3rs.

Link: https://github.com/sriemer/fix-linux-mouse issue 22
Signed-off-by: Sebastian Parschauer <s.parschauer@gmx.de>
=2D--
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index f7973ccd84a2..a07afed1143c 100644
=2D-- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -744,6 +744,7 @@

 #define USB_VENDOR_ID_LABTEC		0x1020
 #define USB_DEVICE_ID_LABTEC_WIRELESS_KEYBOARD	0x0006
+#define USB_DEVICE_ID_LABTEC_ODDOR_HANDBRAKE	0x8888

 #define USB_VENDOR_ID_LCPOWER		0x1241
 #define USB_DEVICE_ID_LCPOWER_LC1000	0xf767
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 5a48fcaa32f0..d9a4f8f7bbb0 100644
=2D-- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -120,6 +120,7 @@ static const struct hid_device_id hid_quirks[] =3D {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406XE), H=
ID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2)=
, HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_T609A), =
HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LABTEC, USB_DEVICE_ID_LABTEC_ODDOR_HANDBR=
AKE), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_OPTICAL_USB_=
MOUSE_600E), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_M=
OUSE_608D), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_M=
OUSE_6019), HID_QUIRK_ALWAYS_POLL },
=2D-
2.35.3


