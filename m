Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C98451D092
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 07:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240078AbiEFFZl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 01:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239514AbiEFFZg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 01:25:36 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4245DA5C
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 22:21:54 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2f7c424c66cso70185357b3.1
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 22:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=88isz0MZHg/nP05I6+mk5MU0B1SUnS9c9B4WsQsyQug=;
        b=khbarEvsre7ANul/bZOz/ro004/MrsSi4BpQsQUI0Hlcf3qw0O1Loe2IjHJQfoVSOk
         3zNIMUtq05VWJvAEj491B1ixA9kglLN0YqNPA1+RvhnfEZmhdl4IbEwEVANpIdlE3Py9
         2LQ6VKCVHlA7lxSejghu5t7VPtq01AnarazIklOIvs/E4HbjsS1Qt+i/VieWxibfLOix
         ZsHYzU0c/vaBdy8Y2MIg1dXOWBOERvnrcmxBvAUHG+Ndp7IRBWKFPq94m0MQVbh1f57+
         fO8Ck/oA356gaYnuvNx8jBOLnJ/fzOeDtisXpqVJAH7UEuJufIylLQ0V4xSA3tnyg0NP
         OTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=88isz0MZHg/nP05I6+mk5MU0B1SUnS9c9B4WsQsyQug=;
        b=Uii3TLGCOFlC50FGe2jK8sIqWfoJGLHISf8jR6AZHorHa4EtAdWDkDZ6H6dAc4j255
         6OQkJV5v8RGWb6b0IMKz4q/Cghbqg/N9OM2cBvY7TeDwSrQySsUjXBWUlojPGk5SRSTR
         r8uRVs8sQRlZPgQlFzDvuSKlUJGPtHSvzSl1mp9fDyYl6KHKlfAC2tQl6EdjXAkTiKur
         S18TrUaeg62LBzOKv5aAxa+/EJskeKLfJFwNvRmeNj++bOql/KYe67g+V/8l5kf7tDZd
         /5bg276Fmx6iJkkp6SkytpOUjQksPU16Fu+clhc02tKk4G643nK2bMpZEJ+GswWrxgUq
         Ohzw==
X-Gm-Message-State: AOAM533pZIhRA85MgdSmxbPxYzsBDlfVeezU7GzGcKANADIhj4WdbXFd
        Th0eQtnRMWPgi7R8B6kkzUbUtOyK91einHA6vjU=
X-Google-Smtp-Source: ABdhPJzY55BGtDyoX26sayWmdRrEFKEYxr2IsUR84DhD6R1a7OBuSH3oKr8sYNnj4YZySkOZWCXBPcC5Gku+dZNqMT4=
X-Received: by 2002:a81:6a0a:0:b0:2f8:1544:b57d with SMTP id
 f10-20020a816a0a000000b002f81544b57dmr1209457ywc.106.1651814513513; Thu, 05
 May 2022 22:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com> <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
 <YnQBkd5V3lmC9cGr@google.com>
In-Reply-To: <YnQBkd5V3lmC9cGr@google.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 5 May 2022 22:21:42 -0700
Message-ID: <CAEc3jaB5aRtuWBV8wuqFy+Tic360LLbV6M09KY+aeWR7XLjZxw@mail.gmail.com>
Subject: Re: [PATCH 1/6] HID: hid-playstation: Allow removal of touchpad
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Vicki Pfau <vi@endrift.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vicki,

Joining the conversation late as I on a long vacation.

On Thu, May 5, 2022 at 12:47 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, May 05, 2022 at 10:50:24AM +0200, Benjamin Tissoires wrote:
> > Hi Vicki,
> >
> > On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
> > >
> > > This allows the touchpad input_dev to be removed and have the driver remain
> > > functional without its presence. This will be used to allow the touchpad to
> > > be disabled, e.g. by a module parameter.
> >
> > Thanks for the contribution.
> > I'd like to hear from Roderick, but I have a general comment here:
> > We had Wii and Steam controllers following this logic. Now we are
> > adding Sony PS ones... That seems like a lot of duplication, and I
> > wonder if we should not have something more generic.
>

I understand the use case of rejecting input. I wasn't that fond of
handling it kernel side also because it would complicate the code a
lot more (and some would perhaps want to do the same for accelerometer
device). Below Dmitry gives a nice idea about inhibition.

Methods I would considered perhaps would have been a custom udev role
(it sounds like you have control of the platform). Or another method
is using EVIOCGRAB to get exclusive access to an input device to block
others from using it again depends on your specific use case. When
this topic came up some years ago with Valve it was one of the methods
considered there if I recall.

> Hmm, if userspace is not interested in data from an input device (and it
> does not want to simply not open it), it can use inhibit/uninhibit sysfs
> attributes to silence it.
>
> I am not sure we need to build support for destroying input device or
> introducing module parameters, etc.
>

Inhibition is interesting and could work. I wasn't aware of this
feature and we may actually use it for hid-playstation to save some
power as there are various HID commands for power saving when the
device isn't open. If we were to add that, some care would need to be
taken with HIDRAW, which the driver is often unaware of. I guess the
end responsibility for making sure the device would work would be with
the hidraw user (unless there will be some interop APIs).

> Thanks.
>
> --
> Dmitry


Thanks,
Roderick
