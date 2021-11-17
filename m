Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7ED454D0C
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 19:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238983AbhKQS1t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 13:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbhKQS1t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 13:27:49 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4375DC061764
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 10:24:50 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso6210819otf.12
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 10:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQ6/wfGxlq62JVYF2E32Rlz6vPrZMUyQROpg1BnR6yc=;
        b=iJ4RM1d7x7IyjFcBbZxyPp3mTGbPzfcdiC4ayejMerwTaE6kvxxQNbdNI3IW1UANOm
         L2bIw3wpFdnpwXCZvzOso5Y2Tw2uj0aczx4iy4lh3dpCRZYjxEJ9kg7rh1JGFJg2ajvc
         5fTgGT4YGyt4SaCS/fIbIeHouKL9x3aQ0F26E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQ6/wfGxlq62JVYF2E32Rlz6vPrZMUyQROpg1BnR6yc=;
        b=mJ8EoDyaADRMQLtpa5wEcJOwPt5621qDXnZa0MljD1mW89MIMwfiiI9NVEP2pSuN9/
         dE61Nj+g8Oy3bgyMkHEMlgY8HqW4LhQbGRV9tJO+mVMYM8I1/5kk33w9sXlwJzebP58w
         yBHT8NkaU+Yuj1hxpHUhKMQGOAfox8wvvMFh2NMahsEPKW7I1yQaBV1NVgEoncrSMFar
         zyzfnEa46IeG7iQ+D+w4W+/xLAbYI2njn1Yuzu5JktTpSMqJBKS0/530Z176m09mOvj2
         h9g4+Fgh4tyBslasqdRQ9qUY7r+4PDwxf3t5XciA4I/9+o6dhfO4jwauXWzrw3WnA1LV
         GePA==
X-Gm-Message-State: AOAM531TxSjHBVofW92jCHp6SQiWjV5RMSTOHCFtPlJerv8nNDLWuH/P
        f89pshuAE6dSxjlJIm4H7AoPplvG9W9X/w==
X-Google-Smtp-Source: ABdhPJyaYCth0FWO/4Pw42JqfEsyJml4NyUNiB4MFAHt3v9Okqq0SAQAgC/lqACZYuotqZ7DxZBThA==
X-Received: by 2002:a05:6830:918:: with SMTP id v24mr15470629ott.121.1637173488772;
        Wed, 17 Nov 2021 10:24:48 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id n22sm83354oop.29.2021.11.17.10.24.46
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 10:24:47 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso6230791otg.9
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 10:24:46 -0800 (PST)
X-Received: by 2002:a9d:4b19:: with SMTP id q25mr14987933otf.186.1637173485758;
 Wed, 17 Nov 2021 10:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20211103234018.4009771-1-briannorris@chromium.org>
 <20211103164002.2.Ie6c485320b35b89fd49e15a73f0a68e3bb49eef9@changeid> <CAD=FV=WDRDHVSiFW+yxaR=Z+mNdKnUY_eF_CFqKeQhcKmdag5g@mail.gmail.com>
In-Reply-To: <CAD=FV=WDRDHVSiFW+yxaR=Z+mNdKnUY_eF_CFqKeQhcKmdag5g@mail.gmail.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Wed, 17 Nov 2021 10:24:34 -0800
X-Gmail-Original-Message-ID: <CA+ASDXOiwU-r5ZGes-ZNxZSuMgbidz=+SdAX8phoYcvexUmU=w@mail.gmail.com>
Message-ID: <CA+ASDXOiwU-r5ZGes-ZNxZSuMgbidz=+SdAX8phoYcvexUmU=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/self_refresh: Disable self-refresh on input events
To:     Doug Anderson <dianders@chromium.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-rockchip@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Doug,

On Fri, Nov 12, 2021 at 4:52 PM Doug Anderson <dianders@chromium.org> wrote:
> On Wed, Nov 3, 2021 at 4:40 PM Brian Norris <briannorris@chromium.org> wrote:
...
> > Leverage a new drm_input_helper library to get easy access to
> > likely-relevant input event callbacks.
>
> So IMO this is a really useful thing and I'm in support of it landing.
> It's not much code and it clearly gives a big benefit. However, I
> would request a CONFIG option to control this so that if someone
> really finds some use case where it isn't needed or if they find a
> good way to do this in userspace without latency problems then they
> can turn it off. Does that sound reasonable?

Sure, I think so. This feature is unfortunately on the borderline of
"policy" (which we normally avoid baking into the kernel), so having
some control over it is probably a good idea -- e.g., module
parameter, CONFIG_*, or both.

I suppose that would make sense to be a "self_refresh"-level control,
and not a "drm_input_helper"-level control? Because different
applications (PSR, GPU boost, etc.) may have different characteristics
and reasons for leveraging this or not.

> > Inspired-by: Kristian H. Kristensen <hoegsberg@google.com>
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> > This was in part picked up from:
> >
> >   https://lore.kernel.org/all/20180405095000.9756-25-enric.balletbo@collabora.com/
> >   [PATCH v6 24/30] drm/rockchip: Disable PSR on input events
> >
> > with significant rewrites/reworks:
> >
> >  - moved to common drm_input_helper and drm_self_refresh_helper
> >    implementation
> >  - track state only through crtc->state->self_refresh_active
> >
> > Note that I'm relatively unfamiliar with DRM locking expectations, but I
> > believe access to drm_crtc->state (which helps us track redundant
> > transitions) is OK under the locking provided by
> > drm_atomic_get_crtc_state().
>
> Yeah, I'm no expert here either. I gave a review a shot anyway since
> it's been all quiet, but adult supervision is probably required...

Thanks ;)

> I can believe that you are safe from corrupting things, but I think
> you still have locking problems, don't you? What about this:
>
> 1. PSR is _not_ active but we're 1 microsecond away from entering PSR
>
> 2. Input event comes through.
>
> 3. Start executing drm_self_refresh_transition(false).
>
> 4. PSR timer expires and starts executing drm_self_refresh_transition(true).
>
> 5. Input event "wins the race" but sees that PSR is already disabled => noop
>
> 6. PSR timer gets the lock now. Starts PSR transition.
>
> Wouldn't it be better to cancel / reschedule any PSR entry as soon as
> you see the input event?

I did think about that option (calling mod_timer to delay the next PSR
entry), but thought it was a bit excessive, at least in terms of
calling it a "race" -- the race between steps #5 and #6 are
essentially equivalent to the natural (unsolvable) race between #1 and
#2 (we can't really read the future about input events).

But rereading your explanation and thinking again, I see that you're
pointing out less of a "race" in the traditional sense, and more of a
missing part of this feature: I think what you're really saying is
that input events should not only exit PSR, but they should delay PSR
(re)entry for some time. With my current patch, input events only
enforce any delay time window if we were already in PSR.

I'll try to factor that into the next version. Thanks!

Brian
