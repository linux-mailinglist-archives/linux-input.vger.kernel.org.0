Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAAE57E322
	for <lists+linux-input@lfdr.de>; Fri, 22 Jul 2022 16:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbiGVOje (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jul 2022 10:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbiGVOjd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jul 2022 10:39:33 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7D79DC9E
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 07:39:32 -0700 (PDT)
Received: from fsav312.sakura.ne.jp (fsav312.sakura.ne.jp [153.120.85.143])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26MEdCmb014924;
        Fri, 22 Jul 2022 23:39:12 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav312.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav312.sakura.ne.jp);
 Fri, 22 Jul 2022 23:39:12 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav312.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26MEdBKV014917
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 22 Jul 2022 23:39:12 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <30ccf517-f6b3-fc54-33d0-ffc24ada4b29@I-love.SAKURA.ne.jp>
Date:   Fri, 22 Jul 2022 23:39:09 +0900
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
        linux-input@vger.kernel.org
References: <000000000000ed47a705e2cbd347@google.com>
 <8106256.T7Z3S40VBb@opensuse>
 <2bcd5385-2423-2e8f-be01-9db93afaba43@I-love.SAKURA.ne.jp>
 <8095587.T7Z3S40VBb@opensuse>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <8095587.T7Z3S40VBb@opensuse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022/07/22 22:53, syzbot wrote:
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=1141355e080000

This patch helps only if iforce_usb_disconnect() is called while waiting at
wait_event_interruptible(iforce->wait, !test_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags)).

It is possible that iforce_usb_disconnect() is called before
iforce_send_packet(iforce, FF_CMD_ENABLE, "\001") sets IFORCE_XMIT_RUNNING bit.

On 2022/07/22 1:53, Fabio M. De Francesco wrote:
> On giovedì 21 luglio 2022 17:06:26 CEST Tetsuo Handa wrote:
>> On 2022/07/21 23:45, Fabio M. De Francesco wrote:
>>> If it can be fixed, as you said, by a simple notification to 
>>> wait_event_interruptible(), why not changing iforce_usb_disconnect() the 
>>> following way?
>>>
>>> static void iforce_usb_disconnect(struct usb_interface *intf)
>>> {
>>>         struct iforce_usb *iforce_usb = usb_get_intfdata(intf);
>>>
>>>         usb_set_intfdata(intf, NULL);
>>>
>>>         __set_bit(IFORCE_XMIT_RUNNING, iforce_usb->iforce.xmit_flags);
>>
>> I assume you meant clear_bit() here, for
>>
>> 	wait_event_interruptible(iforce->wait,
>> 		!test_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags));
>>
>> waits until IFORCE_XMIT_RUNNING bit is cleared.
>>
> 
> Sorry, yes you are correct. I didn't note that negation of test_bit().
> However, you understood what I was trying to convey :-)
> 
>> However, clear_bit() is racy, for IFORCE_XMIT_RUNNING bit is set by
>> iforce_send_packet() at the previous line.
> 
> Why not protecting with a mutex, I mean both in iforce_usb_disconnect() and 
> soon before calling iforce_send_packet() in iforce_close()?

Protecting with a mutex does not help. It is possible that clear_bit(IFORCE_XMIT_RUNNING)
is called before iforce_send_packet() is called.

> 
> It did not trigger this problem because of _timeout(), I guess.

Right.

> 
> If I recall correctly, this task hanged in wait_event_interruptible() and 
> your problem was how to clear that bit and make the task return from 
> wait_event_interruptible(). Correct?

Not limited to clearing IFORCE_XMIT_RUNNING bit. We could introduce a new
bit for disconnect event and check both bits at wait_event_interruptible().

>> Since wait_event_interruptible() was used here, I think we can expect that
>> it is tolerable to continue without waiting for the command to complete...
> 
> Ah, yes. Maybe you are right here but I wouldn't bet on what authors 
> thought when they called wait_event_interruptible() :-)

The author who added this wait_event_interruptible() call is Dmitry Torokhov.

  commit c2b27ef672992a206e5b221b8676972dd840ffa5
  Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Date:   Wed Dec 30 12:18:24 2009 -0800

      Input: iforce - wait for command completion when closing the device

      We need to wait for the command to disable FF effects to complete before
      continuing with closing the device.

      Tested-by: Johannes Ebke <johannes.ebke@physik.uni-muenchen.de>
      Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Dmitry, what do you think? Even without iforce_usb_disconnect() race,
a joystick device not responding for many seconds would be annoying.

