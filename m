Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8AA2BC22B
	for <lists+linux-input@lfdr.de>; Sat, 21 Nov 2020 22:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgKUVBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 21 Nov 2020 16:01:50 -0500
Received: from v133-130-127-43.a05a.g.tyo1.static.cnode.io ([133.130.127.43]:56346
        "EHLO mail.hard-wi.red" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728459AbgKUVBu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 21 Nov 2020 16:01:50 -0500
X-Greylist: delayed 371 seconds by postgrey-1.27 at vger.kernel.org; Sat, 21 Nov 2020 16:01:48 EST
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.hard-wi.red (Postfix) with ESMTPA id 3666E2000E7;
        Sat, 21 Nov 2020 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hard-wi.red; s=dkim;
        t=1605992130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=xXmjl9KdvMj+q78Dtg4S+J4OXqzsc707ZPj+S2i4LKI=;
        b=OAMMVio3LCJPhNbEgW6+wTFR5BdQBZ4YyZEyN5mYc8IyJOKqmxWitD6ZCz2zjX8QumBtVa
        dacjnVKY2xEMYeu9MGiPI0bUS5SwOc26KsPfrWBsd2h9JGC83mZXXB3bHpbZ7+q0JccqRT
        AHWg9tYloD3GFvUyUEuecvRPAGWqOp8=
From:   YOSHIOKA Takuma <lo48576@hard-wi.red>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     YOSHIOKA Takuma <lo48576@hard-wi.red>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: elecom: rewrite report based on model specific parameters
Date:   Sun, 22 Nov 2020 05:54:37 +0900
Message-Id: <20201121205438.4092-1-lo48576@hard-wi.red>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=hard-wi.red;
        s=dkim; t=1605992130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=xXmjl9KdvMj+q78Dtg4S+J4OXqzsc707ZPj+S2i4LKI=;
        b=lDcxjQhxKfKtMsswsEqF1NkAXR0n9RmT8VRtAgk53p1BYFzAVyh3ZRznMGRiHJiJVKAjgq
        3t2BSXqe8tACdLnX7gtp2CG01bbenHjv84kB2ZONDnld0yE82x65m1f5Ht69Z78iFYYi+H
        SkkWeNeJvqHDmjne+ZfIakIgYzEWhlA=
ARC-Seal: i=1; s=dkim; d=hard-wi.red; t=1605992130; a=rsa-sha256; cv=none;
        b=ZSqU2ZDXpCb9qeu94Xz2Pj0oH+eP8O461ajvwZy2VHeMlOplm6mPU20IKeGy+QIB2UvBao
        C0uhoQi27zAWY82fjxmYpOd/Qm2BkDkdJKxlw6wG+1QZTOVKVKqYG3qnLDqKUMZ+D8wo2p
        lHoD73OxxheQUkHJOTIeAu5gL5S2CTg=
ARC-Authentication-Results: i=1;
        mail.hard-wi.red;
        auth=pass smtp.auth=lo48576@hard-wi.red smtp.mailfrom=lo48576@hard-wi.red
Authentication-Results: mail.hard-wi.red;
        auth=pass smtp.auth=lo48576@hard-wi.red smtp.mailfrom=lo48576@hard-wi.red
X-Spamd-Bar: /
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The report descriptor for EX-G wireless mouse (M-XGL20DLBK) is a bit
different from that for trackball mice such as DEFT. For such mouse, the
current `mouse_button_fixup` cannot be used as is, because it uses
hard-coded indices for a report descriptor.

Add parameters to `mouse_button_fixup` function, in order to support
fixing report descriptors for more models.

Signed-off-by: YOSHIOKA Takuma <lo48576@hard-wi.red>
---
 drivers/hid/hid-elecom.c | 41 ++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
index 8c712d4bc075..233188100884 100644
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -11,6 +11,7 @@
  *  Copyright (c) 2017 Diego Elio Pettenò <flameeyes@flameeyes.eu>
  *  Copyright (c) 2017 Alex Manoussakis <amanou@gnu.org>
  *  Copyright (c) 2017 Tomasz Kramkowski <tk@the-tk.com>
+ *  Copyright (c) 2020 YOSHIOKA Takuma <lo48576@hard-wi.red>
  */
 
 /*
@@ -29,25 +30,26 @@
  * report descriptor but it does not appear that these enable software to
  * control what the extra buttons map to. The only simple and straightforward
  * solution seems to involve fixing up the report descriptor.
- *
- * Report descriptor format:
- * Positions 13, 15, 21 and 31 store the button bit count, button usage minimum,
- * button usage maximum and padding bit count respectively.
  */
 #define MOUSE_BUTTONS_MAX 8
 static void mouse_button_fixup(struct hid_device *hdev,
 			       __u8 *rdesc, unsigned int rsize,
+			       unsigned int button_bit_count,
+			       unsigned int padding_bit,
+			       unsigned int button_report_size,
+			       unsigned int button_usage_maximum,
 			       int nbuttons)
 {
-	if (rsize < 32 || rdesc[12] != 0x95 ||
-	    rdesc[14] != 0x75 || rdesc[15] != 0x01 ||
-	    rdesc[20] != 0x29 || rdesc[30] != 0x75)
+	if (rsize < 32 || rdesc[button_bit_count] != 0x95 ||
+	    rdesc[button_report_size] != 0x75 ||
+	    rdesc[button_report_size + 1] != 0x01 ||
+	    rdesc[button_usage_maximum] != 0x29 || rdesc[padding_bit] != 0x75)
 		return;
 	hid_info(hdev, "Fixing up Elecom mouse button count\n");
 	nbuttons = clamp(nbuttons, 0, MOUSE_BUTTONS_MAX);
-	rdesc[13] = nbuttons;
-	rdesc[21] = nbuttons;
-	rdesc[31] = MOUSE_BUTTONS_MAX - nbuttons;
+	rdesc[button_bit_count + 1] = nbuttons;
+	rdesc[button_usage_maximum + 1] = nbuttons;
+	rdesc[padding_bit + 1] = MOUSE_BUTTONS_MAX - nbuttons;
 }
 
 static __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
@@ -65,13 +67,28 @@ static __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	case USB_DEVICE_ID_ELECOM_M_XT3URBK:
 	case USB_DEVICE_ID_ELECOM_M_XT3DRBK:
 	case USB_DEVICE_ID_ELECOM_M_XT4DRBK:
-		mouse_button_fixup(hdev, rdesc, *rsize, 6);
+		/*
+		 * Report descriptor format:
+		 * 12: button bit count
+		 * 30: padding bit count
+		 * 14: button report size
+		 * 20: button usage maximum
+		 */
+		mouse_button_fixup(hdev, rdesc, *rsize, 12, 30, 14, 20, 6);
 		break;
 	case USB_DEVICE_ID_ELECOM_M_DT1URBK:
 	case USB_DEVICE_ID_ELECOM_M_DT1DRBK:
 	case USB_DEVICE_ID_ELECOM_M_HT1URBK:
 	case USB_DEVICE_ID_ELECOM_M_HT1DRBK:
-		mouse_button_fixup(hdev, rdesc, *rsize, 8);
+		/*mouse_button_fixup(hdev, rdesc, *rsize, 13, 15, 21, 31, 8);*/
+		/*
+		 * Report descriptor format:
+		 * 12: button bit count
+		 * 30: padding bit count
+		 * 14: button report size
+		 * 20: button usage maximum
+		 */
+		mouse_button_fixup(hdev, rdesc, *rsize, 12, 30, 14, 20, 8);
 		break;
 	}
 	return rdesc;
-- 
2.29.2

