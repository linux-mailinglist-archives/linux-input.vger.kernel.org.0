Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F005A34FE
	for <lists+linux-input@lfdr.de>; Sat, 27 Aug 2022 08:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbiH0GSE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Aug 2022 02:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiH0GSD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Aug 2022 02:18:03 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B42AD8B0A
        for <linux-input@vger.kernel.org>; Fri, 26 Aug 2022 23:18:02 -0700 (PDT)
Received: from fsav315.sakura.ne.jp (fsav315.sakura.ne.jp [153.120.85.146])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 27R6I03P041788;
        Sat, 27 Aug 2022 15:18:00 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav315.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp);
 Sat, 27 Aug 2022 15:18:00 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 27R6HxMH041782
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 27 Aug 2022 15:18:00 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <ee82117b-6f98-eae8-9002-675cd98d6f11@I-love.SAKURA.ne.jp>
Date:   Sat, 27 Aug 2022 15:17:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2] Input: iforce - wake up after clearing
 IFORCE_XMIT_RUNNING flag
Content-Language: en-US
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>, ira.weiny@intel.com,
        Hillf Danton <hdanton@sina.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <c10494c0-5da5-716d-3e62-abca5b65dd88@I-love.SAKURA.ne.jp>
 <887021c3-4f13-40ce-c8b9-aa6e09faa3a7@I-love.SAKURA.ne.jp>
 <2b11d0b2-0a2e-257d-34f8-37e3f69a58c5@I-love.SAKURA.ne.jp>
In-Reply-To: <2b11d0b2-0a2e-257d-34f8-37e3f69a58c5@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

No response from maintainers for one month.
Do I need to directly ask Greg or Andrew to take this patch?

On 2022/08/16 18:50, Tetsuo Handa wrote:
> Any questions?
> 
> On 2022/07/27 7:00, Tetsuo Handa wrote:
>> syzbot is reporting hung task at __input_unregister_device() [1], for
>> iforce_close() waiting at wait_event_interruptible() with dev->mutex held
>> is blocking input_disconnect_device() from __input_unregister_device().
>>
>> It seems that the cause is simply that commit c2b27ef672992a20 ("Input:
>> iforce - wait for command completion when closing the device") forgot to
>> call wake_up() after clear_bit().
>>
>> Fix this problem by introducing a helper that calls clear_bit() followed
>> by wake_up_all().
>>
>> Link: https://syzkaller.appspot.com/bug?extid=deb6abc36aad4008f407 [1]
>> Reported-by: syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>
>> Fixes: c2b27ef672992a20 ("Input: iforce - wait for command completion when closing the device")
>> Tested-by: syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>
>> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> Co-developed-by: Hillf Danton <hdanton@sina.com>
>> Signed-off-by: Hillf Danton <hdanton@sina.com>
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> 

