Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D6645505B
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 23:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241091AbhKQWZp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 17:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235955AbhKQWZn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 17:25:43 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955FDC061570;
        Wed, 17 Nov 2021 14:22:44 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so3273047wmd.1;
        Wed, 17 Nov 2021 14:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mwlYRnJRhyUd0Ty1gYVfbTyggiaaMRX+fkzIV9N7tT8=;
        b=bFGtBekwIyD0wNwcj+WiwwQ7uWKNSgUvW1qT+CSRBd63xgOJFEjNsm07rav7dRniM4
         1PzMwAzqXtiYNOyGDMpWCg0ex30Illk0HaJWME11/Lxc0MfOnyla9jsanpwgjuKojdSr
         +MLxVRtU4HWF3fOI63ZcKvzYzEr/Q2Sy86OefzZW9fRzHemi+SnLqU8CrVnh6BzRs87H
         1eADtA1FKHnP8fuMs3MoITt6Zkqfr0JPAf/54rHjT3Htab8tXOC3BL4Z8W+CJkGIeKWd
         gmlph2ZJ6KVKoZ8DMInwjG9xMcXpMwsTcQEzOWS9K5L++tqqFZ+sm3rhIirnCRd9nhTD
         q9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mwlYRnJRhyUd0Ty1gYVfbTyggiaaMRX+fkzIV9N7tT8=;
        b=fW3QcRtWWmpXumm0IbGAhjrBCi2GVEy6IfGaXgPZ5InWELRiEO98fQoZ/6hfXFb8aF
         WNpIa5ONT8aSTztSuQr77Tqb2qX4TYMR707+vyiPE6J4wgAeNVaZpmSoVNQiUvsbjZ3C
         wh7WgGpXi1VRp7dloclJnIa75Y+naQLygOEeslK9BBgPTJMesoRVi9GePJ94OdR3O/U1
         zGT/lsyjWQyBe2L8Y9jJutIFnb+KoiJSwYOpoTirl3SzVAqcj/QXfkCqX9ruyMREhlGc
         8FVoszbUdso5khsPs4vG+dAVmnuuOcOoJgCQv+JSO3tMssB64o5pXiCBPCEEg4mPnFJx
         RgUQ==
X-Gm-Message-State: AOAM5330NPqGo1V9ZevnXbWB1oB5jfJtlQFt4RF80WUM656kaqKAW9Fk
        /JyUTZ5wi+WCkpiSZtppzGF9yGw580gQVtCq7NU=
X-Google-Smtp-Source: ABdhPJz8mhkdwzrUhNDhYZ+5LsBGHu8usMBbpvRQFUY3sKEpdkbf/e2ABAowrlGzo9nz4Y5f/AstdH0/wy05kI904Lg=
X-Received: by 2002:a05:600c:4e51:: with SMTP id e17mr3954574wmq.127.1637187763032;
 Wed, 17 Nov 2021 14:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20211103234018.4009771-1-briannorris@chromium.org>
 <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid> <CAD=FV=XOda7vwUPY+WpGLzMwwrbrhQ9RqBQw4LhPwD6Sqhf7vw@mail.gmail.com>
In-Reply-To: <CAD=FV=XOda7vwUPY+WpGLzMwwrbrhQ9RqBQw4LhPwD6Sqhf7vw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 17 Nov 2021 14:27:47 -0800
Message-ID: <CAF6AEGt6CdoXsuKgfoUYUuq1V7_besLCEkmfGQRZD3hdr-ym7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/input_helper: Add new input-handling helper
To:     Doug Anderson <dianders@chromium.org>
Cc:     Brian Norris <briannorris@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org, David Airlie <airlied@linux.ie>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 12, 2021 at 4:52 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Nov 3, 2021 at 4:40 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > A variety of applications have found it useful to listen to
> > user-initiated input events to make decisions within a DRM driver, given
> > that input events are often the first sign that we're going to start
> > doing latency-sensitive activities:
> >
> >  * Panel self-refresh: software-directed self-refresh (e.g., with
> >    Rockchip eDP) is especially latency sensitive. In some cases, it can
> >    take 10s of milliseconds for a panel to exit self-refresh, which can
> >    be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
> >    with an input_handler boost, that preemptively exits self-refresh
> >    whenever there is input activity.
> >
> >  * GPU drivers: on GPU-accelerated desktop systems, we may need to
> >    render new frames immediately after user activity. Powering up the
> >    GPU can take enough time that it is worthwhile to start this process
> >    as soon as there is input activity. Many Chrome OS systems also ship
> >    with an input_handler boost that powers up the GPU.
> >
> > This patch provides a small helper library that abstracts some of the
> > input-subsystem details around picking which devices to listen to, and
> > some other boilerplate. This will be used in the next patch to implement
> > the first bullet: preemptive exit for panel self-refresh.
> >
> > Bits of this are adapted from code the Android and/or Chrome OS kernels
> > have been carrying for a while.
> >
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/Makefile           |   3 +-
> >  drivers/gpu/drm/drm_input_helper.c | 143 +++++++++++++++++++++++++++++
> >  include/drm/drm_input_helper.h     |  22 +++++
> >  3 files changed, 167 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/drm_input_helper.c
> >  create mode 100644 include/drm/drm_input_helper.h
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 0dff40bb863c..378761685b47 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -49,7 +49,8 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
> >                 drm_scdc_helper.o drm_gem_atomic_helper.o \
> >                 drm_gem_framebuffer_helper.o \
> >                 drm_atomic_state_helper.o drm_damage_helper.o \
> > -               drm_format_helper.o drm_self_refresh_helper.o
> > +               drm_format_helper.o drm_self_refresh_helper.o \
> > +               drm_input_helper.o
>
> Note that the Makefile part conflicts with drm-misc-next right now.
> It's not very hard to resolve, but since this would likely land there
> maybe it'd be nice to resolve?
>
> Other than that, this seems sane to me and much better than copying
> this between places, so assuming that the build problems get resolved
> then I'm happy.
>
> I guess one random thought I had is whether there would be an
> appropriate place to put this that _wasn't_ in DRM. I still wonder
> whether we'll ever try to upstream something like the cpufreq boost
> driver that we're carrying around and using in Chrome OS. If so, it
> would want to use these same helpers and it'd be pretty awkward for it
> to have to reach into DRM. ...any chance we could just land these
> helpers somewhere more generic?
>

One of the problems with cpu input boost is the cooldown period
(anti-spacebar-heater) aspect vs relatively short boost period.. in
that it is short enough that you need to consider that certain keys
(ie. modifier keys) should boost on key-release instead of key-press.

That isn't really an issue for triggers to exit PSR, or what we use
input-boost for downstream in drm/msm (where it isn't really boost,
just an early trigger to start powering up the GPU if it is suspended)

BR,
-R
