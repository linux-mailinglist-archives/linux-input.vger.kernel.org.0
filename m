Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647623FE008
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 18:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245259AbhIAQg7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 12:36:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35701 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236453AbhIAQg7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 12:36:59 -0400
Received: (qmail 405969 invoked by uid 1000); 1 Sep 2021 12:36:00 -0400
Date:   Wed, 1 Sep 2021 12:36:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Michal Kubecek <mkubecek@suse.cz>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        syzkaller-bugs@googlegroups.com, linux-input@vger.kernel.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: [PATCH 2/3] HID: usbhid: Fix warning caused by 0-length input reports
Message-ID: <20210901163600.GB404634@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Syzbot found a warning caused by hid_submit_ctrl() submitting a
control request to transfer a 0-length input report:

	usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType a1

(The warning message is a little difficult to understand.  It means
that the control request claims to be for an IN transfer but this
contradicts the USB spec, which requires 0-length control transfers
always to be in the OUT direction.)

Now, a zero-length report isn't good for anything and there's no
reason for a device to have one, but the fuzzer likes to pick out
these weird edge cases.  In the future, perhaps we will decide to
reject 0-length reports at probe time.  For now, the simplest approach
for avoiding these warnings is to pretend that the report actually has
length 1.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com
Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: stable@vger.kernel.org

---

 drivers/hid/usbhid/hid-core.c |    1 +
 1 file changed, 1 insertion(+)

Index: usb-devel/drivers/hid/usbhid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -389,6 +389,7 @@ static int hid_submit_ctrl(struct hid_de
 		maxpacket = usb_maxpacket(hid_to_usb_dev(hid),
 					  usbhid->urbctrl->pipe, 0);
 		if (maxpacket > 0) {
+			len += (len == 0);    /* Don't allow 0-length reports */
 			len = DIV_ROUND_UP(len, maxpacket);
 			len *= maxpacket;
 			if (len > usbhid->bufsize)
