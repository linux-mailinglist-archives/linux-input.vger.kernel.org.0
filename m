Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA6C580A1D
	for <lists+linux-input@lfdr.de>; Tue, 26 Jul 2022 05:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiGZDxk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jul 2022 23:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiGZDxj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jul 2022 23:53:39 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DEE29827
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 20:53:38 -0700 (PDT)
Received: from fsav113.sakura.ne.jp (fsav113.sakura.ne.jp [27.133.134.240])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26Q3rbbb044446;
        Tue, 26 Jul 2022 12:53:37 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav113.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp);
 Tue, 26 Jul 2022 12:53:37 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26Q3raGs044441
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 26 Jul 2022 12:53:36 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <f23c165c-3f2b-e802-21ce-70eef22ebe31@I-love.SAKURA.ne.jp>
Date:   Tue, 26 Jul 2022 12:53:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Content-Language: en-US
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     syzkaller-bugs@googlegroups.com, Johan Hovold <johan@kernel.org>,
        rydberg@bitmath.org,
        syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org, ira.weiny@intel.com
References: <000000000000ed47a705e2cbd347@google.com>
 <8095587.T7Z3S40VBb@opensuse>
 <30ccf517-f6b3-fc54-33d0-ffc24ada4b29@I-love.SAKURA.ne.jp>
 <1902535.PYKUYFuaPT@opensuse>
 <03fda856-2c47-b8a4-908c-16e942678250@I-love.SAKURA.ne.jp>
In-Reply-To: <03fda856-2c47-b8a4-908c-16e942678250@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022/07/23 4:15, Fabio M. De Francesco wrote:
> I had misunderstood easily what you said because I had no context. I have 
> not yet all the necessary context to prepare a "real" patch. As said, it 
> was only a "proof of concept".

Well, it seems that the cause of this problem is nothing but lack of wake_up()
after clear_bit(). Debug printk() patch shown below says that iforce_usb_out()
 from interrupt context hit "urb->status -71, exiting" when iforce_close()
 from process context was in progress.

[  491.314788][ T2962] iforce_close(ffff88807e6b8000) start
[  491.316393][   T14] usb 1-1: USB disconnect, device number 117
[  491.320453][ T2962] iforce_send_packet(ffff88807e6b8000) start
[  491.326488][    C0] iforce 1-1:0.0: urb->status -71, exiting
[  491.327471][   T14] iforce_usb_disconnect(ffff88807e6b8000) start
[  491.335041][ T2962] iforce_send_packet(ffff88807e6b8000)=0
[  491.351266][ T2962] wait_event_interruptible(ffff88807e6b8000) end
[  491.357778][ T2962] iforce_close(ffff88807e6b8000) end
[  491.366421][   T14] input_unregister_device(ffff88807e6b8000) end
[  491.372939][   T14] iforce_usb_disconnect(ffff88807e6b8000) end

On 2022/07/26 12:08, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-and-tested-by: syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         e0dccc3b Linux 5.19-rc8
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15e470de080000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=26034e6fe0075dad
> dashboard link: https://syzkaller.appspot.com/bug?extid=deb6abc36aad4008f407
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=14b307f6080000
> 
> Note: testing is done by a robot and is best-effort only.
