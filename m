Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEEE445722D
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 16:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236048AbhKSP4n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 10:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236046AbhKSP4n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 10:56:43 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DE1C061574
        for <linux-input@vger.kernel.org>; Fri, 19 Nov 2021 07:53:41 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id r25so7608873edq.7
        for <linux-input@vger.kernel.org>; Fri, 19 Nov 2021 07:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=j6ZBHEuBMINUI0NHynx/JAd182zvPE30UGgO4LSxZT8=;
        b=cLFaCrFUDWnjM6RN44xaIUWGhlA8AjiwIjNMiFnJqzFbwcCLaR6yZdIpS3XgyfSgbk
         b+DRNaySfaXQUmTRqpOy7OP6qlDUSpFFdyJSmTW/fn1hHKhWMtQJR6HftSM0RBnDWNDM
         QbOa7oEN/xYZlgy4yy5pnup7ZkqxiSKzMcWMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=j6ZBHEuBMINUI0NHynx/JAd182zvPE30UGgO4LSxZT8=;
        b=J6gWbVUO2wWEhpNb/JiIg0rwuq6bOA3B1m6Lovp2Rx7zmzhg8o1ehB4iAv1rBB7uHr
         9lGcMU//tIJadHnHAwU1JWi9TI2+FL/BA2QZmqVduea1Bx3pc0RW8zQhXSytS6GWTOmY
         qxyo36sc2oYfYFTqejdb56sB0OjXUCtMTT9pdHZlNGzu0qhjyoeI7YiyXHRIDooJJnWI
         5jm9B28CH9OlILgJS1CSBXff8oVY8b9JYxMihsYyK9NMp496BkQvGe63lAj1QMRH0Ifm
         6OhR49e5viwDT7FV16pQlndjbDxA8ZEi8fVELBvFjyL2tuGr6oi4Nh35y2AmT4AJoT9t
         IQlg==
X-Gm-Message-State: AOAM531m1hYKAsCj6Q3U0bEef8QjUMzkgPgJgclTPDfF63ppoZ6jM1bq
        /DAnNEmYTPxfFfVQowUonWmhKg==
X-Google-Smtp-Source: ABdhPJyLTIXW2cwncUjF6nOaAAumf42PL7T8ocCSEESmqxIgDOARKf7XOwdXaq6ojG/YVWRcdZwvog==
X-Received: by 2002:a17:907:7f8b:: with SMTP id qk11mr9088107ejc.176.1637337219520;
        Fri, 19 Nov 2021 07:53:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r18sm96198eje.90.2021.11.19.07.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 07:53:39 -0800 (PST)
Date:   Fri, 19 Nov 2021 16:53:37 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Brian Norris <briannorris@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Doug Anderson <dianders@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZfIgd8s7uGXAD2X@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Brian Norris <briannorris@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Doug Anderson <dianders@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-input@vger.kernel.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell>
 <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
 <20211119115419.505155b5@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119115419.505155b5@eldfell>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 19, 2021 at 11:54:19AM +0200, Pekka Paalanen wrote:
> On Thu, 18 Nov 2021 15:30:38 -0800
> Rob Clark <robdclark@gmail.com> wrote:
> 
> > On Thu, Nov 18, 2021 at 2:39 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Wed, 17 Nov 2021 14:48:40 -0800
> > > Brian Norris <briannorris@chromium.org> wrote:
> > >  
> > > > A variety of applications have found it useful to listen to
> > > > user-initiated input events to make decisions within a DRM driver, given
> > > > that input events are often the first sign that we're going to start
> > > > doing latency-sensitive activities:
> > > >
> > > >  * Panel self-refresh: software-directed self-refresh (e.g., with
> > > >    Rockchip eDP) is especially latency sensitive. In some cases, it can
> > > >    take 10s of milliseconds for a panel to exit self-refresh, which can
> > > >    be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
> > > >    with an input_handler boost, that preemptively exits self-refresh
> > > >    whenever there is input activity.
> > > >
> > > >  * GPU drivers: on GPU-accelerated desktop systems, we may need to
> > > >    render new frames immediately after user activity. Powering up the
> > > >    GPU can take enough time that it is worthwhile to start this process
> > > >    as soon as there is input activity. Many Chrome OS systems also ship
> > > >    with an input_handler boost that powers up the GPU.
> > > >
> > > > This patch provides a small helper library that abstracts some of the
> > > > input-subsystem details around picking which devices to listen to, and
> > > > some other boilerplate. This will be used in the next patch to implement
> > > > the first bullet: preemptive exit for panel self-refresh.
> > > >
> > > > Bits of this are adapted from code the Android and/or Chrome OS kernels
> > > > have been carrying for a while.
> > > >
> > > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > > ---  
> > >
> > > Thanks Simon for the CC.
> > >
> > > Hi Brian,
> > >
> > > while this feature in general makes sense and sounds good, to start
> > > warming up display hardware early when something might start to happen,
> > > this particular proposal has many problems from UAPI perspective (as it
> > > has none). Comments below.
> > >
> > > Btw. if PSR is that slow to wake up from, how much do you actually gain
> > > from this input event watching? I would imagine the improvement to not
> > > be noticeable.
> > >
> > > I think some numbers about how much this feature helps would be really
> > > good, even if they are quite specific use cases. You also need to
> > > identify the userspace components, because I think different display
> > > servers are very different in their reaction speed.
> > >
> > > If KMS gets a pageflip or modeset in no time after an input event, then
> > > what's the gain. OTOH, if the display server is locking on to vblank,
> > > there might be a delay worth avoiding. But then, is it worth
> > > short-circuiting the wake-up in kernel vs. adding a new ioctl that
> > > userspace could hit to start the warming up process?  
> > 
> > In my measurements, it takes userspace a frame or two to respond and
> > get to the point of starting to build cmdstream (before eventually
> > doing atomic/pageflip ioctl).. possibly longer if you don't also have
> > a similar boost mechanism to spool up cpufreq
> > 
> > But the important thing, IMO, is that atomic/pageflip ioctl is the
> > cumulation of a long sequence of events.. input-boost is letting
> > whatever it may be (PSR exit, GPU resume, etc) happen in parallel with
> > that long sequence.
> 
> Right, exactly. That is why I was musing about a *new* ioctl that
> userspace could hit as soon as any input device fd (or network fd!)
> shows signs of life. Would that be enough, avoiding all the annoying
> questions about which input and DRM devices should participate here
> (and what about non-input devices that still want to trigger the
> warm-up, like network traffic, e.g. remote control?), or does it really
> need to be kernel internal to be fast enough?
> 
> As Brian wrote about his quick hack to test that via debugfs, sounds
> like the userspace solution would be totally sufficient.

Random idea ... should we perhaps let userspace connect the boosting? I.e.
we do a bunch of standardized boost targets (render clocks, display sr
exit), and userspace can then connect it to whichever input device it
wants to?

That also avoids the multi-user lol of us boosting the wrong seat, we
could do a drm ioctl where you pass it an eventfd and essentially say
"listen to this mkay?" That way the boosting would also neatly get passed
along with compositors as we vt switch them, in case you have one that's
all tablet, and another one (console emulation) that's kbd only.

Also this avoids the latency problem perhaps of a compositor which just
dumbly paints every frame because it's VR or something like that, so never
any sr exit possible.

Just an idea, compositor people pls shred it :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
