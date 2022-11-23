Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B673E634BA9
	for <lists+linux-input@lfdr.de>; Wed, 23 Nov 2022 01:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbiKWA2d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Nov 2022 19:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234815AbiKWA2d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Nov 2022 19:28:33 -0500
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D6A74CDD
        for <linux-input@vger.kernel.org>; Tue, 22 Nov 2022 16:28:30 -0800 (PST)
Received: from fsav117.sakura.ne.jp (fsav117.sakura.ne.jp [27.133.134.244])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 2AN0S9FZ068688;
        Wed, 23 Nov 2022 09:28:09 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav117.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav117.sakura.ne.jp);
 Wed, 23 Nov 2022 09:28:09 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav117.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 2AN0S8uT068683
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 23 Nov 2022 09:28:09 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <03e8c3f0-bbbf-af37-6f52-67547cbd4cde@I-love.SAKURA.ne.jp>
Date:   Wed, 23 Nov 2022 09:28:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] Input: MT - use __GFP_NOWARN allocation at
 input_mt_init_slots()
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        syzkaller-bugs@googlegroups.com,
        syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <000000000000de2f4f05b8942be9@google.com>
 <6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp>
 <Y31Z29bSaH38WuAt@google.com>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Y31Z29bSaH38WuAt@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022/11/23 8:23, Dmitry Torokhov wrote:
> Hi Tetsuo,
> 
> On Sat, Nov 19, 2022 at 04:09:56PM +0900, Tetsuo Handa wrote:
>> syzbot is reporting too large allocation at input_mt_init_slots() {1], for
>> num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).
>> Also, replace n2 with array_size(), for 32bits variable n2 will overflow
>> if num_slots >= 65536.
> 
> Not really keen on fiddling with the memory allocator flags just to
> appease syzbot. Maybe keep them as is, and simply limit the number of
> slots to something more reasonable, like 64, and return -EINVAL if it is
> above?
> 

Hmm, although most users seem to pass values within "unsigned char" range,
not limited to syzbot.

drivers/input/misc/uinput.c has

	nslot = input_abs_get_max(dev, ABS_MT_SLOT) + 1;
	error = input_mt_init_slots(dev, nslot, 0);

and drivers/virtio/virtio_input.c has

	nslots = input_abs_get_max(vi->idev, ABS_MT_SLOT) + 1;
	err = input_mt_init_slots(vi->idev, nslots, 0);

and drivers/input/misc/xen-kbdfront.c has

	int num_cont, width, height;
	num_cont = xenbus_read_unsigned(info->xbdev->otherend,
					XENKBD_FIELD_MT_NUM_CONTACTS,
					1);
	ret = input_mt_init_slots(mtouch, num_cont, INPUT_MT_DIRECT);

. Since these users might need to pass values beyond "unsigned char" range,
I think we should not limit to too small values like 64.

More worrisome thing is that several users are not handling
input_mt_init_slots() failures.


