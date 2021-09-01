Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958DD3FE006
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 18:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245405AbhIAQgt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 12:36:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40017 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234766AbhIAQgr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 12:36:47 -0400
Received: (qmail 405944 invoked by uid 1000); 1 Sep 2021 12:35:49 -0400
Date:   Wed, 1 Sep 2021 12:35:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Michal Kubecek <mkubecek@suse.cz>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        linux-input@vger.kernel.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: [PATCH 1/3] HID: usbhid: Fix flood of "control queue full" messages
Message-ID: <20210901163549.GA404634@rowland.harvard.edu>
References: <20210819195300.GA8613@rowland.harvard.edu>
 <000000000000c322ab05c9f2e880@google.com>
 <20210820140620.GA35867@rowland.harvard.edu>
 <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm>
 <CAO-hwJ+i4MqOj0umUW9kFgYSZLt3QMb6hDZHQwb8AKH9pKxSTg@mail.gmail.com>
 <20210901153811.GA403560@rowland.harvard.edu>
 <20210901155145.qflw5s4zqiud7gke@lion.mk-sys.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901155145.qflw5s4zqiud7gke@lion.mk-sys.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Michal Kubecek <mkubecek@suse.cz>

[patch description by Alan Stern]

Commit 7652dd2c5cb7 ("USB: core: Check buffer length matches wLength
for control transfers") causes control URB submissions to fail if the
transfer_buffer_length value disagrees with the setup packet's wLength
valuel.  Unfortunately, it turns out that the usbhid can trigger this
failure mode when it submits a control request for an input report: It
pads the transfer buffer size to a multiple of the maxpacket value but
does not increase wLength correspondingly.

These failures have caused problems for people using an APS UPC, in
the form of a flood of log messages resembling:

	hid-generic 0003:051D:0002.0002: control queue full

This patch fixes the problem by setting the wLength value equal to the
padded transfer_buffer_length value in hid_submit_ctrl().  As a nice
bonus, the code which stores the transfer_buffer_length value is now
shared between the two branches of an "if" statement, so it can be
de-duplicated.

Signed-off-by: Michal Kubecek <mkubecek@suse.cz>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 7652dd2c5cb7 ("USB: core: Check buffer length matches wLength for control transfers")
Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: stable@vger.kernel.org

---

 drivers/hid/usbhid/hid-core.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

Index: usb-devel/drivers/hid/usbhid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -377,27 +377,26 @@ static int hid_submit_ctrl(struct hid_de
 	len = hid_report_len(report);
 	if (dir == USB_DIR_OUT) {
 		usbhid->urbctrl->pipe = usb_sndctrlpipe(hid_to_usb_dev(hid), 0);
-		usbhid->urbctrl->transfer_buffer_length = len;
 		if (raw_report) {
 			memcpy(usbhid->ctrlbuf, raw_report, len);
 			kfree(raw_report);
 			usbhid->ctrl[usbhid->ctrltail].raw_report = NULL;
 		}
 	} else {
-		int maxpacket, padlen;
+		int maxpacket;
 
 		usbhid->urbctrl->pipe = usb_rcvctrlpipe(hid_to_usb_dev(hid), 0);
 		maxpacket = usb_maxpacket(hid_to_usb_dev(hid),
 					  usbhid->urbctrl->pipe, 0);
 		if (maxpacket > 0) {
-			padlen = DIV_ROUND_UP(len, maxpacket);
-			padlen *= maxpacket;
-			if (padlen > usbhid->bufsize)
-				padlen = usbhid->bufsize;
+			len = DIV_ROUND_UP(len, maxpacket);
+			len *= maxpacket;
+			if (len > usbhid->bufsize)
+				len = usbhid->bufsize;
 		} else
-			padlen = 0;
-		usbhid->urbctrl->transfer_buffer_length = padlen;
+			len = 0;
 	}
+	usbhid->urbctrl->transfer_buffer_length = len;
 	usbhid->urbctrl->dev = hid_to_usb_dev(hid);
 
 	usbhid->cr->bRequestType = USB_TYPE_CLASS | USB_RECIP_INTERFACE | dir;
