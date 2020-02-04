Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8D3151997
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 12:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgBDLT2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 06:19:28 -0500
Received: from mta-out1.inet.fi ([62.71.2.226]:34846 "EHLO johanna3.inet.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbgBDLT2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Feb 2020 06:19:28 -0500
X-Greylist: delayed 378 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Feb 2020 06:19:26 EST
Received: from MinistryOfSillyWalk.home (84.248.30.195) by johanna3.inet.fi (9.0.019.26-1)
        id 5E1C39D515F02B02; Tue, 4 Feb 2020 13:13:00 +0200
From:   Lauri Jakku <lja@iki.fi>
To:     oneukum@suse.com, benjamin.tissoires@redhat.com
Cc:     jikos@kernel.org, linux-input@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Lauri Jakku <lja@iki.fi>
Subject: [PATCH v2] USB: HID: random timeout failures tackle try.
Date:   Tue,  4 Feb 2020 13:06:59 +0200
Message-Id: <20200204110658.32454-1-lja@iki.fi>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is multiple reports of random behaviour of USB HID devices.

I have mouse that acts sometimes quite randomly, I debugged with
logs others have published: that there is HW timeouts that leave
device in state that it is errorneus.

To fix this, I introduce retry mechanism in root of USB HID drivers.

Fix does not slow down operations at all if there is no -ETIMEDOUT
got from control message sending. 

If there is one, then sleep 20ms and try again. Retry count is 20
witch translates maximium of 400ms before giving up. If the 400ms
boundary is reached the HW is really bad.

JUST to be clear:
    This does not make USB HID devices to sleep anymore than
    before, if all is golden.

Why modify usb-hid-core: No need to modify driver by driver.

Signed-off-by: Lauri Jakku <lja@iki.fi>
---
 drivers/usb/core/message.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 5adf489428aa..b375e376ea22 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -20,6 +20,7 @@
 #include <linux/usb/hcd.h>	/* for usbcore internals */
 #include <linux/usb/of.h>
 #include <asm/byteorder.h>
+#include <linux/errno.h>
 
 #include "usb.h"
 
@@ -137,7 +138,10 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
 		    __u16 size, int timeout)
 {
 	struct usb_ctrlrequest *dr;
-	int ret;
+	int ret = -ETIMEDOUT;
+
+	/* retry_cnt * 20ms, max retry time set to 400ms */
+	int retry_cnt = 20;
 
 	dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
 	if (!dr)
@@ -149,11 +153,27 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
 	dr->wIndex = cpu_to_le16(index);
 	dr->wLength = cpu_to_le16(size);
 
-	ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
+	do {
+		ret = usb_internal_control_msg(dev,
+					pipe,
+					dr,
+					data,
+					size,
+					timeout);
+
+		/*
+		 * Linger a bit, prior to the next control message
+		 * or if return value is timeout, but do try few
+		 * times (max 400ms) before quitting.
+		 */
+		if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
+			msleep(200);
+		else if (ret == -ETIMEDOUT)
+			msleep(20);
+
+		/* Loop while timeout, max loops: retry_cnt times. */
+	} while ((retry_cnt-- > 0) && (ret == -ETIMEDOUT));
 
-	/* Linger a bit, prior to the next control message. */
-	if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
-		msleep(200);
 
 	kfree(dr);
 
-- 
2.25.0

