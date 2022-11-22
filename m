Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC27634B0A
	for <lists+linux-input@lfdr.de>; Wed, 23 Nov 2022 00:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbiKVXXN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Nov 2022 18:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbiKVXXM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Nov 2022 18:23:12 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9B75F77
        for <linux-input@vger.kernel.org>; Tue, 22 Nov 2022 15:23:11 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id h193so15303803pgc.10
        for <linux-input@vger.kernel.org>; Tue, 22 Nov 2022 15:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYKJhV+qMau6tt613e85MEqtM3I47XonYXo+lbEcZ0Q=;
        b=EamaZhkZt7M71gl4qFstn8dBmIzv3borxfDLrN82hcLnkphQ+c2WY0Hua8VjAuIp1J
         UYbQDnAXVMz5gAGNHR+Su11QDEumiq2GoZw/HgR/1wSji9JK8MmEQ7K4SCG4cQ4kY/4s
         jPHq7bxTqQd5t0fKV7doCUAhu/YETTtd+6hV1WpNxVz2RLDkU5Mn/O9BV6kCKjsiWvnk
         uVGbm+lmY+LIbfLtgwy0A+TGiKP31mzNDMNuTNuqJgOfQnffkhl4tyvyXoay9RtVzVKh
         VYNmxTi9wp1Ac3sBfSKWi+wYNZjwPnAa8tAGI/xFJyU9N/Oi/tP51z19257A7SfURsDt
         XMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYKJhV+qMau6tt613e85MEqtM3I47XonYXo+lbEcZ0Q=;
        b=Al+Ecq6hWkQFNRDZk70sMl5cYyOo/so2W2ZV78lgB3vn3O73lSSJ5I+y4KCJj9LSj/
         hRijvV1OzFukGiP/4q3eVWsMqUoGzS9UltiWA6jX5URG7XDG6OC/SOAhzkkykzXa1Mrw
         pAVbyiAqxf7Ba3mg/ftLbVtPWqgZUpeq+o5/paXPFSCQKvzAHWMafmSN6NEwPmNypjk7
         MQJyiDpPDa0MYqFGG9EMvetIXLDcBoeAsOZNKTkDFCPY0hu5tOwAZh/MvsiyfwQf7joW
         rPmOnkK4gIa+OttOglZDnheQ7phYozv+ZmIomT5qAzIQebTu/4OAnE3svRZgsPSipvZ/
         3mZg==
X-Gm-Message-State: ANoB5plZvf1VMTxYcrbuUW7/q7Rct+CpPHhPAhwUYP32MXBKqBTQ8b/D
        U89eOXWj5sZ2AHPeBrZq2go=
X-Google-Smtp-Source: AA0mqf7bhzxccbgOp+fVFR9CksH7bHkIGa6c5FavOwgrS9IxJlescokFcDlRB4gjkGQXOENoYs2Zcw==
X-Received: by 2002:a63:185a:0:b0:476:e84c:ab63 with SMTP id 26-20020a63185a000000b00476e84cab63mr9900705pgy.496.1669159390623;
        Tue, 22 Nov 2022 15:23:10 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:af8d:6047:29d5:446c])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090276c600b00172b87d9770sm12562212plt.81.2022.11.22.15.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:23:09 -0800 (PST)
Date:   Tue, 22 Nov 2022 15:23:07 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        syzkaller-bugs@googlegroups.com,
        syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: MT - use __GFP_NOWARN allocation at
 input_mt_init_slots()
Message-ID: <Y31Z29bSaH38WuAt@google.com>
References: <000000000000de2f4f05b8942be9@google.com>
 <6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Tetsuo,

On Sat, Nov 19, 2022 at 04:09:56PM +0900, Tetsuo Handa wrote:
> syzbot is reporting too large allocation at input_mt_init_slots() {1], for
> num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).
> Also, replace n2 with array_size(), for 32bits variable n2 will overflow
> if num_slots >= 65536.

Not really keen on fiddling with the memory allocator flags just to
appease syzbot. Maybe keep them as is, and simply limit the number of
slots to something more reasonable, like 64, and return -EINVAL if it is
above?

> 
> Link: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5 [1]
> Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
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
> -- 
> 2.34.1
> 
> 

Thanks.

-- 
Dmitry
