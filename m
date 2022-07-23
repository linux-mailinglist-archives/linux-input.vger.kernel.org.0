Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C87C57EC35
	for <lists+linux-input@lfdr.de>; Sat, 23 Jul 2022 07:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbiGWFiQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jul 2022 01:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiGWFiQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jul 2022 01:38:16 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA3AB5565
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 22:38:14 -0700 (PDT)
Received: from fsav114.sakura.ne.jp (fsav114.sakura.ne.jp [27.133.134.241])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26N5cCmE091674;
        Sat, 23 Jul 2022 14:38:12 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav114.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav114.sakura.ne.jp);
 Sat, 23 Jul 2022 14:38:12 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav114.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26N5cCeL091668
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 23 Jul 2022 14:38:12 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <03fda856-2c47-b8a4-908c-16e942678250@I-love.SAKURA.ne.jp>
Date:   Sat, 23 Jul 2022 14:38:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Content-Language: en-US
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
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <1902535.PYKUYFuaPT@opensuse>
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

Although current problem is that iforce_usb_disconnect() being blocked on
dev->mutex which was held by the caller of iforce_close(), I worry that
a proper fix requires something like commit db264d4c66c0fe00 ("media:
imon: reorganize serialization") in order to defer

	usb_free_urb(iforce_usb->irq);
	usb_free_urb(iforce_usb->out);
	kfree(iforce_usb);

part in iforce_usb_disconnect(), given that iforce_close() (which needs to
perform urb operation) might be called even after iforce_usb_disconnect()
completed.

Device file's close callback being not prepared for disconnect event
(that is, code assumes that close happens only before disconnect happens)
might be frequently observed problem in USB drivers...
