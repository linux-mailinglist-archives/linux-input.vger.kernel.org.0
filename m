Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BBB45733D
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 17:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236590AbhKSQmp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 11:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhKSQmo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 11:42:44 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D187DC061574;
        Fri, 19 Nov 2021 08:39:42 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id s13so19175384wrb.3;
        Fri, 19 Nov 2021 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WWxvb18J2OY31IOdF8stiBLalQgXLoh0/wK/1Bc450I=;
        b=G/0sZg/TTmfGtyUBtoN7qKLoLhMKvoJ+uHbBFtA+vUeA4c8l/a4gvR/KvwdM5GgdeG
         K5aGLhWroUkdVAKoyOy9XSCgOlka18S9LVxC4hEtS4m4ZcIjqzIt4C398fELpvAkBUGp
         kAGIO0R+WKD0F7cs70CDOsgmPk907XfZuEH2TFWQWMJFVVvBt6fhuOcVE1VhUNQrMz/2
         gfd7zVIdQsyQkNG4ybBUzMmdaB1YV2Daeeie5XKJWliXPsmVm1GQimSuJyTIxGBT8STd
         HkAQkveIny04C9zN6ddwK532QR+/Fm9y3SRYaHOWk8z/fIbx7RL87GP3mWFYDPUyKWxC
         3piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WWxvb18J2OY31IOdF8stiBLalQgXLoh0/wK/1Bc450I=;
        b=CmScK6lLVUHPS+dx9vEnsgaoIVcpLHNM64qaE0o7UKuaq4k/nLkumXRz+e3RAUP1Uu
         fb5CvInHpV9gGyuE40yh6dlCPWv9r722h5xL+HEzeBYo3Vt+UQWtsIQkY28AvQ023Ebo
         CCyyHfq83XihugqXjTdvB1a3joxtyZb11O/rNJlSn1AfPTzKB36AImOf7yxMGMQzmvZh
         pOMYct8epSCbAmCQgY8Ke/yH6gXKU1s9lmR0U4By7XJf4NXtboO3qUkNlusjJMG2yeGc
         ds4JCucx3Ew+G3X+uGJc4Z3AjajkeQU3UHGfT9amQSIbpCip4CPYt98oYRuKE2/kQ2nF
         8vag==
X-Gm-Message-State: AOAM531FTGDorw3y72xMxa/4LnUer+E6R2mH1BSVnKnwWFOMhSsi+gH9
        0RVpA0nsLmCJTBmDSJliSEaK6GUUbasYnuCXABA=
X-Google-Smtp-Source: ABdhPJxfl7O5ix42iKo6OVNO1pcXl3m9LKgUvG/qGjMcTbNPkTvvG4O8hTy0Lvlihamj11q+V2U2n8BSL8Km1tAxcyc=
X-Received: by 2002:a5d:6351:: with SMTP id b17mr8718687wrw.151.1637339981245;
 Fri, 19 Nov 2021 08:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell> <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
 <20211119115419.505155b5@eldfell>
In-Reply-To: <20211119115419.505155b5@eldfell>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 19 Nov 2021 08:44:45 -0800
Message-ID: <CAF6AEGus9CtgjvpJRX-YPkrrNeE+--9KeGxKBN_U=aOzzRE8FA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Brian Norris <briannorris@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        David Airlie <airlied@linux.ie>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 19, 2021 at 1:54 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
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
>

The question is, I think we want to use this for at least a couple
different things.. PSR exit, and/or early GPU wakeup/boost.  So I'm
not quite sure where/what this ioctl should be.  Different drivers may
have different uses.  Also, because of the CrOS userspace sandbox
architecture, the place that could do a kms ioctl isn't really the
place that would know when to call the ioctl.

But if we want to move the policy out of the kernel, one approach
would just be to have some sysfs where userspace could configure the
input_device_id[] filter..

BR,
-R
