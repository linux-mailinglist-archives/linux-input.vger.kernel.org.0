Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A16498F281
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2019 19:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729975AbfHORnh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Aug 2019 13:43:37 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:38124 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730936AbfHORnh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Aug 2019 13:43:37 -0400
Received: (qmail 5345 invoked by uid 2102); 15 Aug 2019 13:43:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Aug 2019 13:43:36 -0400
Date:   Thu, 15 Aug 2019 13:43:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com>,
        Jiri Kosina <jikos@kernel.org>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <gustavo@embeddedor.com>, <hdanton@sina.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        <syzkaller-bugs@googlegroups.com>, <linux-input@vger.kernel.org>
Subject: Re: general protection fault in __pm_runtime_resume
In-Reply-To: <000000000000b1729e058fecdcee@google.com>
Message-ID: <Pine.LNX.4.44L0.1908151333220.1343-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 12 Aug 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger  
> crash:
> 
> Reported-and-tested-by:  
> syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=177252d2600000
> 
> Note: testing is done by a robot and is best-effort only.

That was the result from testing Hillf's patch:

--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1410,6 +1410,7 @@ static void usbhid_disconnect(struct usb
        spin_lock_irq(&usbhid->lock);   /* Sync with error and led handlers */
        set_bit(HID_DISCONNECTED, &usbhid->iofl);
        spin_unlock_irq(&usbhid->lock);
+       hid_hw_stop(hid);
        hid_destroy_device(hid);
        kfree(usbhid);
 }

There is very good reason to believe this patch is not the correct
solution to the problem.  For one thing, in some circumstances the
patch ends up calling hid_hw_stop() twice (not shown here, but we have 
seen this in other bug reports from syzbot).

For another, I have just tested a different patch and found that it 
also prevents this particular crash:

> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=170b66a6600000
>
> Note: testing is done by a robot and is best-effort only.

My patch:

Index: usb-devel/drivers/hid/hid-lg.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-lg.c
+++ usb-devel/drivers/hid/hid-lg.c
@@ -818,7 +818,7 @@ static int lg_probe(struct hid_device *h
 
 		if (!buf) {
 			ret = -ENOMEM;
-			goto err_free;
+			goto err_stop;
 		}
 
 		ret = hid_hw_raw_request(hdev, buf[0], buf, sizeof(cbuf),
@@ -850,9 +850,12 @@ static int lg_probe(struct hid_device *h
 		ret = lg4ff_init(hdev);
 
 	if (ret)
-		goto err_free;
+		goto err_stop;
 
 	return 0;
+
+err_stop:
+	hid_hw_stop(hdev);
 err_free:
 	kfree(drv_data);
 	return ret;
@@ -863,8 +866,7 @@ static void lg_remove(struct hid_device
 	struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
 	if (drv_data->quirks & LG_FF4)
 		lg4ff_deinit(hdev);
-	else
-		hid_hw_stop(hdev);
+	hid_hw_stop(hdev);
 	kfree(drv_data);
 }
 
Index: usb-devel/drivers/hid/hid-lg4ff.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-lg4ff.c
+++ usb-devel/drivers/hid/hid-lg4ff.c
@@ -1477,7 +1477,6 @@ int lg4ff_deinit(struct hid_device *hid)
 		}
 	}
 #endif
-	hid_hw_stop(hid);
 	drv_data->device_props = NULL;
 
 	kfree(entry);

This fixes a fairly obvious bug in the hid-lg driver: It does not 
always call hid_hw_stop() in all pathways after calling hid_hw_start().

Presumably the same is true for the other related bugs found by syzbot.  
I'm doing some more testing and we will see...

Alan Stern

