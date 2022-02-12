Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD724B3287
	for <lists+linux-input@lfdr.de>; Sat, 12 Feb 2022 02:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiBLBuk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Feb 2022 20:50:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiBLBuk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Feb 2022 20:50:40 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DEFE3D99
        for <linux-input@vger.kernel.org>; Fri, 11 Feb 2022 17:50:37 -0800 (PST)
Received: (qmail 652714 invoked by uid 1000); 11 Feb 2022 20:50:37 -0500
Date:   Fri, 11 Feb 2022 20:50:37 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de
Subject: [PATCH] HID: elo: Fix refcount leak in elo_probe()
Message-ID: <YgcSbUwiALbmoTvL@rowland.harvard.edu>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
 <000000000000d31cac05d7c4da7e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000d31cac05d7c4da7e@google.com>
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Syzbot identified a refcount leak in the hid-elo driver:

BUG: memory leak
unreferenced object 0xffff88810d49e800 (size 2048):
  comm "kworker/1:1", pid 25, jiffies 4294954629 (age 16.460s)
  hex dump (first 32 bytes):
    ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
    00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
  backtrace:
    [<ffffffff82c87a62>] kmalloc include/linux/slab.h:581 [inline]
    [<ffffffff82c87a62>] kzalloc include/linux/slab.h:715 [inline]
    [<ffffffff82c87a62>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
    [<ffffffff82c91a47>] hub_port_connect drivers/usb/core/hub.c:5260 [inline]
    [<ffffffff82c91a47>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c91a47>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c91a47>] hub_event+0x1097/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126c3ef>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ccd9>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81276765>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810022ff>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Not shown in the bug report but present in the console log:

[  182.014764][ T3257] elo 0003:04E7:0030.0006: item fetching failed at offset 0/1
[  182.022255][ T3257] elo 0003:04E7:0030.0006: parse failed
[  182.027904][ T3257] elo: probe of 0003:04E7:0030.0006 failed with error -22
[  182.214767][ T3257] usb 1-1: USB disconnect, device number 7
[  188.090199][ T3604] kmemleak: 3 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
BUG: memory leak

which points to hid-elo as the buggy driver.

The leak is caused by elo_probe() failing to release the reference it
holds to the struct usb_device in its failure pathway.  In the end the
driver doesn't need to take this reference at all, because the
elo_priv structure is always deallocated synchronously when the driver
unbinds from the interface.

Therefore this patch fixes the reference leak by not taking the
reference in the first place.

Reported-and-tested-by: syzbot+8caaaec4e7a55d75e243@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1971]


 drivers/hid/hid-elo.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

Index: usb-devel/drivers/hid/hid-elo.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-elo.c
+++ usb-devel/drivers/hid/hid-elo.c
@@ -239,7 +239,7 @@ static int elo_probe(struct hid_device *
 
 	INIT_DELAYED_WORK(&priv->work, elo_work);
 	udev = interface_to_usbdev(to_usb_interface(hdev->dev.parent));
-	priv->usbdev = usb_get_dev(udev);
+	priv->usbdev = udev;
 
 	hid_set_drvdata(hdev, priv);
 
@@ -270,8 +270,6 @@ static void elo_remove(struct hid_device
 {
 	struct elo_priv *priv = hid_get_drvdata(hdev);
 
-	usb_put_dev(priv->usbdev);
-
 	hid_hw_stop(hdev);
 	cancel_delayed_work_sync(&priv->work);
 	kfree(priv);
