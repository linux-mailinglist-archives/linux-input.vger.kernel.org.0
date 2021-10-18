Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46742430F63
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 06:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhJREzl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 00:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhJREzk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 00:55:40 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A26BC06161C;
        Sun, 17 Oct 2021 21:53:30 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id m21so14773320pgu.13;
        Sun, 17 Oct 2021 21:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3hL3DoHE/oUGtl1WEuRhxS/hkccDAoUuxvo1jYuNhNw=;
        b=n1+IxaRghb2lsbuAd6BD0slPd7cvc6HPuO0LWAzew9IxCH+B9kVRKoBgCTIVnTq+i5
         R6u0bj1FMovr/v18pE95t/M4wLP32eOUg0IUj8zSy4rOwVowQTQaQxYvyvcF6y1Wlt71
         x6hWq2Ep4VLMChOGt2ijxWKpP2PDVE3tUYsnnnqJJ/dXIEj129lbinFZtDS506p86hYA
         /U5qXL0PKmGWrLNTbBtK2AsMSXep9P27c5aCyIDqGStnk5RCJl42eycyYpWAsXsNveDP
         tS9kxEXY3+CYO3+VuGnY5AH32ocu8+IOAZEDm585drMPq0UpT0n3ckTf7vq8k6tcelSK
         zfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3hL3DoHE/oUGtl1WEuRhxS/hkccDAoUuxvo1jYuNhNw=;
        b=tZY83yy/5y1Bq/cPRkyIHf4pjvEVGvQGWprVffV13B7Bq7lYbpDM3PTdHm/MC+tvBP
         ueZ85VPh+4dtY3Z6NVpsBHUyUFQ1VrSVFYbbNgVinzaoKGUeIoKkCeeJb9OLm8vcs4NT
         6yFShbbTWepVfghWQKWhHffNYB1pa0kp1hVJuxwzbvA2QDR4HSs8ID965O2zsy0pcyqf
         Qpbs3j7rx5VRgHUmaJoZXVCWWbNMN4p4uoHuoVPrWac/dnrQzBuwAgQcG05heSszpC48
         NCv4ZfRp6bZgyX/qItsPU5id1mho77qt1Br8wKCzz+dqYd8qcBcuywZCu8NKSwdFkYLO
         dfQA==
X-Gm-Message-State: AOAM532mr2chsYTA0cfXvoqcOzEPe/7BDREvUHmltwZsvTXlRQ2q8qSj
        6gCN+Orer/Iu1hNbBqgercrAUTzRsfI=
X-Google-Smtp-Source: ABdhPJyBOBfZ+k7PLJ+rRGWTcCh2Gz2aSra1QyooZLGFC0M08XWMdXwNQNY34yx3P5KJvMzUWBNgWg==
X-Received: by 2002:a62:6206:0:b0:44c:bc1f:aa5a with SMTP id w6-20020a626206000000b0044cbc1faa5amr26909605pfb.5.1634532809456;
        Sun, 17 Oct 2021 21:53:29 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7649:ee4:7a4f:e362])
        by smtp.gmail.com with ESMTPSA id c205sm11382738pfc.43.2021.10.17.21.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 21:53:28 -0700 (PDT)
Date:   Sun, 17 Oct 2021 21:53:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ping Cheng <pinglinux@gmail.com>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Aaron Skomra <skomra@gmail.com>,
        "Dickens, Joshua" <joshua.dickens@wacom.com>, caihuoqing@baidu.com
Subject: Re: [PATCH] HID: wacom: Make use of the helper function
 devm_add_action_or_reset()
Message-ID: <YWz9xQizZB04DAqe@google.com>
References: <20210922125939.427-1-caihuoqing@baidu.com>
 <nycvar.YFH.7.76.2110071338010.29107@cbobk.fhfr.pm>
 <CANRwn3SZagP7uCSHVDGMPMqQiKyUQJSjq143_DA1y0UPvsmkAA@mail.gmail.com>
 <DB6PR07MB4278FF50AB23B9B69411CA3B9BB19@DB6PR07MB4278.eurprd07.prod.outlook.com>
 <CANRwn3TTgZ9+T7h81tNShvEB8QWkrbKLPrQSnviFKMHa8Zga_Q@mail.gmail.com>
 <20211015025815.GA3874@LAPTOP-UKSR4ENP.internal.baidu.com>
 <CAF8JNhLF8_f1x1K52ay_cmkKqpNiY7P4kMwt=ia6ws9Yd9uoNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8JNhLF8_f1x1K52ay_cmkKqpNiY7P4kMwt=ia6ws9Yd9uoNQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ping,

On Sun, Oct 17, 2021 at 02:58:47PM -0700, Ping Cheng wrote:
> I tested the set of two patches. I didn't see any issues with them
> applied. But, while reviewing the patches, I noticed a minor logic
> mismatch between the current patch and the original code. I'd hope at
> least one of the maintainers (Jiri, Benjamin, or Dimitry) reviews this
> patch, especially the part that I commented below, to make sure that
> we don't trigger any race condition.
> 
> Thank you Huoqing, Jason, and the maintainer team!
> 
> > > From 7adc05783c7e3120028d0d089bea224903c24ccd Mon Sep 17 00:00:00 2001
> > > From: Jason Gerecke <jason.gerecke@wacom.com>
> > > Date: Thu, 14 Oct 2021 07:31:31 -0700
> > > Subject: [PATCH] RFC: HID: wacom: Shrink critical section in
> > >  `wacom_add_shared_data`
> > >
> > > The size of the critical section in this function appears to be larger
> > > than necessary. The `wacom_udev_list_lock` exists to ensure that one
> > > interface cannot begin checking if a shared object exists while a second
> > > interface is doing the same (otherwise both could determine that that no
> > > object exists yet and create their own independent objects rather than
> > > sharing just one). It should be safe for the critical section to end
> > > once a fresly-allocated shared object would be found by other threads
> > > (i.e., once it has been added to `wacom_udev_list`, which is looped
> > > over by `wacom_get_hdev_data`).
> > >
> > > This commit is a necessary pre-requisite for a later change to swap the
> > > use of `devm_add_action` with `devm_add_action_or_reset`, which would
> > > otherwise deadlock in its error case.
> > >
> > > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > > ---
> > >  drivers/hid/wacom_sys.c | 9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > > index 93f49b766376..62f50e4b837d 100644
> > > --- a/drivers/hid/wacom_sys.c
> > > +++ b/drivers/hid/wacom_sys.c
> > > @@ -881,8 +881,8 @@ static int wacom_add_shared_data(struct hid_device *hdev)
> > >       if (!data) {
> > >               data = kzalloc(sizeof(struct wacom_hdev_data), GFP_KERNEL);
> > >               if (!data) {
> > > -                     retval = -ENOMEM;
> > > -                     goto out;
> > > +                     mutex_unlock(&wacom_udev_list_lock);
> > > +                     return -ENOMEM;
> > >               }
> > >
> > >               kref_init(&data->kref);
> > > @@ -890,11 +890,12 @@ static int wacom_add_shared_data(struct hid_device *hdev)
> > >               list_add_tail(&data->list, &wacom_udev_list);
> > >       }
> > >
> > > +     mutex_unlock(&wacom_udev_list_lock);
> > > +
> > >       wacom_wac->shared = &data->shared;
> > >
> > >       retval = devm_add_action(&hdev->dev, wacom_remove_shared_data, wacom);
> > >       if (retval) {
> > > -             mutex_unlock(&wacom_udev_list_lock);
> 
> The mutex_unlock was called after devm_add_action is finished, whether
> it is a failure or success. The new code calls mutex_unlock before
> devm_add_action is executed. Is that ok?

I think this is OK, but I would prefer if assignments that alter the
shared data (i.e. assignment to wacom_wac->shared->pen, etc) would
continue stay under mutex protection, so they need to be pulled up.

With that you can add my

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

to the both patches, provided that Jason's comes first.

Thanks.

-- 
Dmitry
