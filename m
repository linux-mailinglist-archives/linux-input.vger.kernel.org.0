Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB42790C51
	for <lists+linux-input@lfdr.de>; Sun,  3 Sep 2023 15:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjICN4P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Sep 2023 09:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjICN4P (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Sep 2023 09:56:15 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D152FB6
        for <linux-input@vger.kernel.org>; Sun,  3 Sep 2023 06:56:10 -0700 (PDT)
Received: from fsav411.sakura.ne.jp (fsav411.sakura.ne.jp [133.242.250.110])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 383Dtmb0013003;
        Sun, 3 Sep 2023 22:55:48 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav411.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp);
 Sun, 03 Sep 2023 22:55:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 383Dtlkv012998
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sun, 3 Sep 2023 22:55:48 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <07350163-de52-a2bf-58bf-88c3d9d8d85b@I-love.SAKURA.ne.jp>
Date:   Sun, 3 Sep 2023 22:55:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH (repost)] Input: MT - use __GFP_NOWARN allocation at
 input_mt_init_slots()
Content-Language: en-US
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Henrik Rydberg <rydberg@bitmath.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <aa0d1e42-9a62-698b-fa89-000ce397316c@I-love.SAKURA.ne.jp>
In-Reply-To: <aa0d1e42-9a62-698b-fa89-000ce397316c@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ping?

On 2023/03/28 20:25, Tetsuo Handa wrote:
> syzbot is reporting too large allocation at input_mt_init_slots(), for
> num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).
> 
> Use __GFP_NOWARN. Also, replace n2 with array_size(), for 32bits variable
> n2 will overflow if num_slots >= 65536 and will cause out of bounds
> read/write at input_mt_set_matrix()/input_mt_set_slots() on architectures
> where PAGE_SIZE > 4096 is available (e.g. PPC64).
> 
> Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
> Link: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> Dmitry Torokhov proposed limiting max size to accept. But since it seems
> that nobody knows appropriate max size to accept, reposting as-is.
> https://lkml.kernel.org/r/03e8c3f0-bbbf-af37-6f52-67547cbd4cde@I-love.SAKURA.ne.jp
> 
>  drivers/input/input-mt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
> index 14b53dac1253..cf74579462ba 100644
> --- a/drivers/input/input-mt.c
> +++ b/drivers/input/input-mt.c
> @@ -47,7 +47,7 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
>  	if (mt)
>  		return mt->num_slots != num_slots ? -EINVAL : 0;
>  
> -	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL);
> +	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL | __GFP_NOWARN);
>  	if (!mt)
>  		goto err_mem;
>  
> @@ -80,8 +80,8 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
>  	if (flags & INPUT_MT_SEMI_MT)
>  		__set_bit(INPUT_PROP_SEMI_MT, dev->propbit);
>  	if (flags & INPUT_MT_TRACK) {
> -		unsigned int n2 = num_slots * num_slots;
> -		mt->red = kcalloc(n2, sizeof(*mt->red), GFP_KERNEL);
> +		mt->red = kcalloc(array_size(num_slots, num_slots),
> +				  sizeof(*mt->red), GFP_KERNEL | __GFP_NOWARN);
>  		if (!mt->red)
>  			goto err_mem;
>  	}

