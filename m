Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9DA57CE97
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 17:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbiGUPHE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 11:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiGUPHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 11:07:01 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436F48721A
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 08:07:00 -0700 (PDT)
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26LF6Wt0020230;
        Fri, 22 Jul 2022 00:06:32 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Fri, 22 Jul 2022 00:06:32 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26LF6SPH020221
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 22 Jul 2022 00:06:28 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <2bcd5385-2423-2e8f-be01-9db93afaba43@I-love.SAKURA.ne.jp>
Date:   Fri, 22 Jul 2022 00:06:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Content-Language: en-US
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        syzkaller-bugs@googlegroups.com, rydberg@bitmath.org,
        syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org
References: <000000000000ed47a705e2cbd347@google.com>
 <bae8fb53-969c-0e92-2e57-f602e4eb848e@I-love.SAKURA.ne.jp>
 <8106256.T7Z3S40VBb@opensuse>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <8106256.T7Z3S40VBb@opensuse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022/07/21 23:45, Fabio M. De Francesco wrote:
> If it can be fixed, as you said, by a simple notification to 
> wait_event_interruptible(), why not changing iforce_usb_disconnect() the 
> following way?
> 
> static void iforce_usb_disconnect(struct usb_interface *intf)
> {
>         struct iforce_usb *iforce_usb = usb_get_intfdata(intf);
> 
>         usb_set_intfdata(intf, NULL);
> 
>         __set_bit(IFORCE_XMIT_RUNNING, iforce_usb->iforce.xmit_flags);

I assume you meant clear_bit() here, for

	wait_event_interruptible(iforce->wait,
		!test_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags));

waits until IFORCE_XMIT_RUNNING bit is cleared.

However, clear_bit() is racy, for IFORCE_XMIT_RUNNING bit is set by
iforce_send_packet() at the previous line.

>         wake_up(&iforce_usb->iforce.wait);
> 
>         input_unregister_device(iforce_usb->iforce.dev);
> 
>         usb_free_urb(iforce_usb->irq);
>         usb_free_urb(iforce_usb->out);
> 
>         kfree(iforce_usb);
> }
> 
> I am sorry if I'm overlooking anything, especially because I'm entering 
> this thread without reading the other messages and so without knowing the 
> whole context. Furthermore I haven't even test-compiled these changes :-(

So far, I asked syzbot to test

--- a/drivers/input/joystick/iforce/iforce-usb.c
+++ b/drivers/input/joystick/iforce/iforce-usb.c
@@ -258,6 +258,9 @@ static void iforce_usb_disconnect(struct usb_interface *intf)
 
 	usb_set_intfdata(intf, NULL);
 
+	usb_poison_urb(iforce_usb->irq);
+	usb_poison_urb(iforce_usb->out);
+
 	input_unregister_device(iforce_usb->iforce.dev);
 
 	usb_free_urb(iforce_usb->irq);

which still triggered this problem, and

--- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -200,8 +200,10 @@ static void iforce_close(struct input_dev *dev)
 		/* Disable force feedback playback */
 		iforce_send_packet(iforce, FF_CMD_ENABLE, "\001");
 		/* Wait for the command to complete */
-		wait_event_interruptible(iforce->wait,
-			!test_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags));
+		wait_event_interruptible_timeout
+			(iforce->wait,
+			 !test_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags),
+			 5 * HZ);
 	}
 
 	iforce->xport_ops->stop_io(iforce);

which did not trigger this problem.

Since wait_event_interruptible() was used here, I think we can expect that
it is tolerable to continue without waiting for the command to complete...

