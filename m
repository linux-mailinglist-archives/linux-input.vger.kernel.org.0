Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5983F0B42
	for <lists+linux-input@lfdr.de>; Wed, 18 Aug 2021 20:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhHRSuE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Aug 2021 14:50:04 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56319 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231743AbhHRSuD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Aug 2021 14:50:03 -0400
Received: (qmail 204834 invoked by uid 1000); 18 Aug 2021 14:49:27 -0400
Date:   Wed, 18 Aug 2021 14:49:27 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>
Cc:     Michal Kubecek <mkubecek@suse.cz>, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
Message-ID: <20210818184927.GD197200@rowland.harvard.edu>
References: <000000000000d77b6505c767b8f8@google.com>
 <00000000000038c55d05c9d1dc3b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000038c55d05c9d1dc3b@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 18, 2021 at 02:14:23AM -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    794c7931a242 Merge branch 'linus' of git://git.kernel.org/..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=13af2205300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=96f0602203250753
> dashboard link: https://syzkaller.appspot.com/bug?extid=9b57a46bf1801ce2a2ca
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ae58ce300000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d71731300000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType a1
> WARNING: CPU: 0 PID: 8434 at drivers/usb/core/urb.c:410 usb_submit_urb+0x149d/0x18a0 drivers/usb/core/urb.c:410
> Modules linked in:
> CPU: 0 PID: 8434 Comm: syz-executor752 Not tainted 5.14.0-rc6-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:usb_submit_urb+0x149d/0x18a0 drivers/usb/core/urb.c:410
> Code: 7c 24 40 e8 45 64 1f fc 48 8b 7c 24 40 e8 4b fc 0b ff 45 89 e8 44 89 f1 4c 89 e2 48 89 c6 48 c7 c7 e0 b2 27 8a e8 01 fc 91 03 <0f> 0b e9 a5 ee ff ff e8 17 64 1f fc 0f b6 1d 19 ca 01 08 31 ff 41
> RSP: 0018:ffffc90000effbd0 EFLAGS: 00010082
> RAX: 0000000000000000 RBX: ffff888027944058 RCX: 0000000000000000
> RDX: ffff8880235db880 RSI: ffffffff815d85c5 RDI: fffff520001dff6c
> RBP: ffff888021618140 R08: 0000000000000000 R09: 0000000000000000
> R10: ffffffff815d23fe R11: 0000000000000000 R12: ffff888018aff118
> R13: 00000000000000a1 R14: 0000000080000280 R15: ffff888021900400
> FS:  000000000223d300(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005614a6c2a160 CR3: 00000000222ca000 CR4: 0000000000350ef0
> Call Trace:
>  hid_submit_ctrl+0x6ec/0xd80 drivers/hid/usbhid/hid-core.c:416
>  usbhid_restart_ctrl_queue.isra.0+0x244/0x3a0 drivers/hid/usbhid/hid-core.c:258

The problem is that syzbot has created a device with a report length of 
zero.  If we use the padded length instead of the actual length, the 
error should vanish.

I believe this is fixed by Michal's patch, below.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 794c7931a242

--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -377,27 +377,26 @@ static int hid_submit_ctrl(struct hid_device *hid)
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
