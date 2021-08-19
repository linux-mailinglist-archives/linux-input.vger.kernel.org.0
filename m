Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561CD3F2112
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 21:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhHSTxn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 15:53:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37397 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233792AbhHSTxi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 15:53:38 -0400
Received: (qmail 10514 invoked by uid 1000); 19 Aug 2021 15:53:00 -0400
Date:   Thu, 19 Aug 2021 15:53:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mkubecek@suse.cz,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
Message-ID: <20210819195300.GA8613@rowland.harvard.edu>
References: <20210819152626.GD228422@rowland.harvard.edu>
 <00000000000009e24705c9ecf9b3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000009e24705c9ecf9b3@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 19, 2021 at 10:35:11AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> WARNING in hid_submit_ctrl/usb_submit_urb
> 
> cm6533_jd 0003:0D8C:0022.0001: submit_ctrl: maxpacket 64 len 0 padlen 0
> ------------[ cut here ]------------
> usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType a1

Ah.   The padding code doesn't add anything if the length is 
already a multiple of the maxpacket value, and of course 0 is such 
a multiple.

The following simplified variant of Michal's patch should fix the 
problem.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 794c7931a242

Index: usb-devel/drivers/hid/usbhid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -377,27 +377,23 @@ static int hid_submit_ctrl(struct hid_de
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
-		if (maxpacket > 0) {
-			padlen = DIV_ROUND_UP(len, maxpacket);
-			padlen *= maxpacket;
-			if (padlen > usbhid->bufsize)
-				padlen = usbhid->bufsize;
-		} else
-			padlen = 0;
-		usbhid->urbctrl->transfer_buffer_length = padlen;
+		len += (len == 0);	/* Don't allow 0-length reports */
+		len = round_up(len, maxpacket);
+		if (len > usbhid->bufsize)
+			len = usbhid->bufsize;
 	}
+	usbhid->urbctrl->transfer_buffer_length = len;
 	usbhid->urbctrl->dev = hid_to_usb_dev(hid);
 
 	usbhid->cr->bRequestType = USB_TYPE_CLASS | USB_RECIP_INTERFACE | dir;
