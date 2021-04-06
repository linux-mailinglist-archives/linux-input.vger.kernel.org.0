Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B34D355B4D
	for <lists+linux-input@lfdr.de>; Tue,  6 Apr 2021 20:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhDFS0n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Apr 2021 14:26:43 -0400
Received: from mx-out.tlen.pl ([193.222.135.145]:10157 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236505AbhDFS0n (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Apr 2021 14:26:43 -0400
Received: (wp-smtpd smtp.tlen.pl 2504 invoked from network); 6 Apr 2021 20:26:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1617733588; bh=6JhLiDmG9aThvXp3eAzGh/wDeUJFIp/TbQ2272UW4Yk=;
          h=From:To:Cc:Subject;
          b=EhkvaBHCu7HXfkv3AjrPNVaQxm1UqJlqZ7JeO0cj6A2fuiyTh6hea3m5Nmjot38nu
           4Wh5U0gNArH/RmqdX49tvP91LtWDsNBviCFb7hN1JWI6TVpJANaqUix+uvr2+NlquX
           A/XdxP3q0UNaDKEh6cRr6DJbDpskJuyhcAZ865V0=
Received: from ackm196.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.10.88.196])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-input@vger.kernel.org>; 6 Apr 2021 20:26:28 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH resend] hid-a4tech: use A4_2WHEEL_MOUSE_HACK_B8 for A4TECH NB-95
Date:   Tue,  6 Apr 2021 20:25:38 +0200
Message-Id: <20210406182538.34347-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210327125329.40357-1-mat.jonczyk@o2.pl>
References: <20210327125329.40357-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: c539c1a5dccf6bd5633cd2b5183ee3b3
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [kfPk]                               
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This mouse has a horizontal wheel that requires special handling.
Without this patch, the horizontal wheel acts like a vertical wheel.

In the output of `hidrd-convert` for this mouse, there is a
`Usage (B8h)` field. It corresponds to a byte in packets sent by the
device that specifies which wheel generated an input event.

The name "A4TECH" is spelled in all capitals on the company website.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>

---

Hello,

This is the first patch I send to the LKML.

The mouse I have is quite old, I got it somewhere in '00s.

I received no answer and apparently the patch was not pulled, so I resend.

Greetings,
Mateusz

 drivers/hid/Kconfig      | 4 ++--
 drivers/hid/hid-a4tech.c | 2 ++
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 09fa75a2b289..be090aad4d2a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -93,11 +93,11 @@ menu "Special HID drivers"
 	depends on HID
 
 config HID_A4TECH
-	tristate "A4 tech mice"
+	tristate "A4TECH mice"
 	depends on HID
 	default !EXPERT
 	help
-	Support for A4 tech X5 and WOP-35 / Trust 450L mice.
+	Support for some A4TECH mice with two scroll wheels.
 
 config HID_ACCUTOUCH
 	tristate "Accutouch touch device"
diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
index 3a8c4a5971f7..2cbc32dda7f7 100644
--- a/drivers/hid/hid-a4tech.c
+++ b/drivers/hid/hid-a4tech.c
@@ -147,6 +147,8 @@ static const struct hid_device_id a4_devices[] = {
 		.driver_data = A4_2WHEEL_MOUSE_HACK_B8 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_A4TECH, USB_DEVICE_ID_A4TECH_RP_649),
 		.driver_data = A4_2WHEEL_MOUSE_HACK_B8 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_A4TECH, USB_DEVICE_ID_A4TECH_NB_95),
+		.driver_data = A4_2WHEEL_MOUSE_HACK_B8 },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, a4_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b60279aaed43..da3db9b3f640 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -26,6 +26,7 @@
 #define USB_DEVICE_ID_A4TECH_WCP32PU	0x0006
 #define USB_DEVICE_ID_A4TECH_X5_005D	0x000a
 #define USB_DEVICE_ID_A4TECH_RP_649	0x001a
+#define USB_DEVICE_ID_A4TECH_NB_95	0x022b
 
 #define USB_VENDOR_ID_AASHIMA		0x06d6
 #define USB_DEVICE_ID_AASHIMA_GAMEPAD	0x0025
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index d9ca874dffac..fabd562c52a4 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -212,6 +212,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_A4TECH, USB_DEVICE_ID_A4TECH_WCP32PU) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_A4TECH, USB_DEVICE_ID_A4TECH_X5_005D) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_A4TECH, USB_DEVICE_ID_A4TECH_RP_649) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_A4TECH, USB_DEVICE_ID_A4TECH_NB_95) },
 #endif
 #if IS_ENABLED(CONFIG_HID_ACCUTOUCH)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELO, USB_DEVICE_ID_ELO_ACCUTOUCH_2216) },
-- 
2.25.1

