Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE4C39C25
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2019 11:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfFHJcS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 8 Jun 2019 05:32:18 -0400
Received: from [115.28.160.31] ([115.28.160.31]:43030 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726478AbfFHJcS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 8 Jun 2019 05:32:18 -0400
X-Greylist: delayed 498 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 Jun 2019 05:32:16 EDT
Received: from localhost.localdomain (unknown [116.227.76.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 64EBE60115;
        Sat,  8 Jun 2019 17:23:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1559985836; bh=Ooj+uWgIdUQmHsps02IaKxcBM7x4K5lybvDb7CLsnf4=;
        h=From:To:Cc:Subject:Date:From;
        b=cgz9N89RoPdH+PbOoFDfFp18tWe9l+bgbxLHtQWjiaMvQta1dzcxkzA1b7c9Qmw6m
         cDJnKLmuO8fVv5aOk7RTyqwP46oCqK8YfYt4XFlLrfmG/RUxEXozUyFON4PsQ8Ssmc
         xfwGK9jwolakFTzO7Eg91z4OT1DKRbCbjRovTmow=
From:   Wang Xuerui <git@xen0n.name>
To:     linux-input@vger.kernel.org
Cc:     Wang Xuerui <git@xen0n.name>,
        Nikolai Kondrashov <spbnick@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] HID: uclogic: Add support for Ugee Rainbow CV720
Date:   Sat,  8 Jun 2019 17:23:24 +0800
Message-Id: <20190608092324.4623-1-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for Ugee Rainbow CV720 to hid-uclogic.

Signed-off-by: Wang Xuerui <git@xen0n.name>
---
 drivers/hid/hid-ids.h            | 1 +
 drivers/hid/hid-uclogic-core.c   | 2 ++
 drivers/hid/hid-uclogic-params.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 84e0c78d73cd..80edfb639306 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1153,6 +1153,7 @@
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO01	0x0042
 #define USB_DEVICE_ID_UGEE_TABLET_G5		0x0074
 #define USB_DEVICE_ID_UGEE_TABLET_EX07S		0x0071
+#define USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720	0x0055
 
 #define USB_VENDOR_ID_UNITEC	0x227d
 #define USB_DEVICE_ID_UNITEC_USB_TOUCH_0709	0x0709
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 8fe02d81265d..490c1ddb350c 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -387,6 +387,8 @@ static const struct hid_device_id uclogic_devices[] = {
 				USB_DEVICE_ID_UGEE_TABLET_G5) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
 				USB_DEVICE_ID_UGEE_TABLET_EX07S) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
+				USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
 				USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 0187c9f8fc22..8e120dde31fa 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -999,6 +999,8 @@ int uclogic_params_init(struct uclogic_params *params,
 		     USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540):
 	case VID_PID(USB_VENDOR_ID_UGEE,
 		     USB_DEVICE_ID_UGEE_XPPEN_TABLET_G640):
+	case VID_PID(USB_VENDOR_ID_UGEE,
+		     USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720):
 		/* If this is the pen interface */
 		if (bInterfaceNumber == 1) {
 			/* Probe v1 pen parameters */
-- 
2.21.0

