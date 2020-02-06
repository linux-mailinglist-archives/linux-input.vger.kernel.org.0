Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3810B1546F9
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 16:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgBFPDc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 10:03:32 -0500
Received: from mta-out1.inet.fi ([62.71.2.202]:40910 "EHLO johanna4.inet.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727007AbgBFPDc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 Feb 2020 10:03:32 -0500
Received: from localhost.localdomain (84.248.30.195) by johanna4.inet.fi (9.0.019.26-1)
        id 5E1C3A43181648E5; Thu, 6 Feb 2020 17:03:26 +0200
From:   Lauri Jakku <lja@iki.fi>
To:     lja@iki.fi, kernel-janitors@vger.kernel.org
Cc:     linux-input@vger.kernel.org, stern@rowland.harvard.edu,
        oneukum@suse.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH v7] HID:  random timeout failures tackle try.
Date:   Thu,  6 Feb 2020 17:01:24 +0200
Message-Id: <20200206150123.9098-1-lja@iki.fi>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

 -- v1 ------------------------------------------------------------
 send, 20ms apart, control messages, if error is timeout.

 There is multiple reports of random behaviour of USB HID devices.

 I have mouse that acts sometimes quite randomly, I debugged with
 logs others have published that there is HW timeouts that leave
 device in state that it is errorneus.

 To fix this I introduced retry mechanism in root of USB HID drivers.

 Fix does not slow down operations at all if there is no -ETIMEDOUT
 got from control message sending. If there is one, then sleep 20ms
 and try again. Retry count is 20 witch translates maximum of 400ms
 before giving up.

 NOTE: This does not sleep anymore then before, if all is golden.

 -- v2 ------------------------------------------------------------

 If there is timeout, then sleep 20ms and try again. Retry count is 20
 witch translates maximum of 400ms before giving up. If the 400ms
 boundary is reached the HW is really bad.

 JUST to be clear:
     This does not make USB HID devices to sleep anymore than
     before, if all is golden.

 Why modify usb-core: No need to modify driver by driver.

 -- v3 ------------------------------------------------------------

 Timeout given is divided by 100, but taken care that it is always
 at least 10ms.

 so total time in common worst-case-scenario is:

  sleep of 20ms + common timeout divided by 100 (50ms) makes
  70ms per loop, 20 loops => 1.4sec .

 -- v4 ------------------------------------------------------------
 No changes in code, just elaborating what is done in v[1,2,3].

 -- v5 ------------------------------------------------------------
 changes in code: what the build robot found:
    drivers/usb/core/message.c: In function 'usb_control_msg':
 >> drivers/usb/core/message.c:173:11: error: type defaults to
    'int' in declaration of 'timeout_happened' [-Werror=implicit-int]

        static timeout_happened = 0;
               ^~~~~~~~~~~~~~~~
    cc1: some warnings being treated as errors

 -- v6 ------------------------------------------------------------
 Moved and simplified code from usb/core to hid/usbhid/hid-core.

 Made wrapper function to handle actual usb_control_msg() call.

 Timeout is now divided by constant, witch is loop iteration
 count. This way the timeout is kept what user have requested,
 and no additional time is spent.

 NOTE: this adds call_timeout (ms) * call_count to function,
 this might be a problem, if caller expects call to return
 directly after timeout given by user.

 -- v7 ------------------------------------------------------------
 Checked review comments, and fixed according to those.

Signed-off-by: Lauri Jakku <lja@iki.fi>
v7: Checked review comments, and fixed.
v6: Moved retry-code to hid-core.
v5: Fixed build error
v4: Commit message update
v3: retry time adaption try
v2: Static timeouts v2
v1: Static timeouts v1
---
 drivers/hid/usbhid/hid-core.c | 40 +++++++++++++++++++++++++++++++----
 drivers/hid/usbhid/usbhid.h   |  4 ++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index c7bc9db5b192..4381ef747727 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -26,6 +26,7 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/string.h>
+#include <linux/ctype.h>
 
 #include <linux/usb.h>
 
@@ -75,6 +76,37 @@ static void hid_io_error(struct hid_device *hid);
 static int hid_submit_out(struct hid_device *hid);
 static int hid_submit_ctrl(struct hid_device *hid);
 static void hid_cancel_delayed_stuff(struct usbhid_device *usbhid);
+static int usbhid_control_msg(struct usb_device *dev, unsigned int pipe,
+				_u8 request, __u8 requesttype, __u16 value,
+				__u16 index, void *data, __u16 size,
+				int timeout);
+
+
+static int usbhid_control_msg(struct usb_device *dev, unsigned int pipe,
+				_u8 request, __u8 requesttype, __u16 value,
+				__u16 index, void *data, __u16 size,
+				int timeout)
+{
+	int retry_timeout = USBHID_CONTROL_COMMAND_RETRY_TIMEOUT(timeout);
+	int retry = USBHID_CONTROL_COMMAND_RETRY_COUNT;
+	int ret;
+	int timeout_looping;
+
+	ret = usb_control_msg(dev, pipe, request, requesttype,
+		value, index, data, size, timeout);
+
+	while ((ret == -ETIMEDOUT) && (retry-- > 0)) {
+		/* NOTE: this adds, in worst case, retry_timeout
+		 * (ms) * call_count to function, this might be
+		 * a problem if caller expects call to return
+		 * directly after timeout given by user.
+		 */
+		ret = usb_control_msg(dev, pipe, request, requesttype,
+				value, index, data, size, retry_timeout);
+	}
+
+	return ret;
+}
 
 /* Start up the input URB */
 static int hid_start_in(struct hid_device *hid)
@@ -656,7 +688,7 @@ static int usbhid_wait_io(struct hid_device *hid)
 
 static int hid_set_idle(struct usb_device *dev, int ifnum, int report, int idle)
 {
-	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+	return usbhid_control_msg(dev, usb_sndctrlpipe(dev, 0),
 		HID_REQ_SET_IDLE, USB_TYPE_CLASS | USB_RECIP_INTERFACE, (idle << 8) | report,
 		ifnum, NULL, 0, USB_CTRL_SET_TIMEOUT);
 }
@@ -669,7 +701,7 @@ static int hid_get_class_descriptor(struct usb_device *dev, int ifnum,
 	memset(buf, 0, size);
 
 	do {
-		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
+		result = usbhid_control_msg(dev, usb_rcvctrlpipe(dev, 0),
 				USB_REQ_GET_DESCRIPTOR, USB_RECIP_INTERFACE | USB_DIR_IN,
 				(type << 8), ifnum, buf, size, USB_CTRL_GET_TIMEOUT);
 		retries--;
@@ -877,7 +909,7 @@ static int usbhid_get_raw_report(struct hid_device *hid,
 		count--;
 		skipped_report_id = 1;
 	}
-	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
+	ret = usbhid_control_msg(dev, usb_rcvctrlpipe(dev, 0),
 		HID_REQ_GET_REPORT,
 		USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 		((report_type + 1) << 8) | report_number,
@@ -914,7 +946,7 @@ static int usbhid_set_raw_report(struct hid_device *hid, unsigned int reportnum,
 		skipped_report_id = 1;
 	}
 
-	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+	ret = usbhid_control_msg(dev, usb_sndctrlpipe(dev, 0),
 			HID_REQ_SET_REPORT,
 			USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 			((rtype + 1) << 8) | reportnum,
diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
index 8620408bd7af..67008a2c937e 100644
--- a/drivers/hid/usbhid/usbhid.h
+++ b/drivers/hid/usbhid/usbhid.h
@@ -48,6 +48,10 @@ struct usb_interface *usbhid_find_interface(int minor);
  */
 #define HID_IN_POLLING		14
 
+#define USBHID_CONTROL_COMMAND_RETRY_COUNT			10
+#define USBHID_CONTROL_COMMAND_RETRY_TIMEOUT(TotalTimeoutInMS) \
+		((TotalTimeoutInMS) / USBHID_CONTROL_COMMAND_RETRY_COUNT)
+
 /*
  * USB-specific HID struct, to be pointed to
  * from struct hid_device->driver_data
-- 
2.25.0

