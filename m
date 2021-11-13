Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56DB944F046
	for <lists+linux-input@lfdr.de>; Sat, 13 Nov 2021 01:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbhKMAzW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Nov 2021 19:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbhKMAzU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Nov 2021 19:55:20 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59324C061766
        for <linux-input@vger.kernel.org>; Fri, 12 Nov 2021 16:52:29 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id 14so13199973ioe.2
        for <linux-input@vger.kernel.org>; Fri, 12 Nov 2021 16:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WDMoJWVS3cLt8gel5ZAdj4e1dI2U2C9Sa5cKlc5Ze5g=;
        b=VG6EBwWgoJT2XTaKLIKToQkj/22xaDKEfaape+fbpwoDlL9hAcuqpP9I9+NMEKFmcL
         +u+fJF0Bm03Ggu4f2IMorqe1uYl+AniZrw98Kukh9eZtiAf4oSEQvlh70BY+iTAfVP8I
         zPBa4aWBkNCMAkySS5Tphpbq4Dk4nOZIbAqWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WDMoJWVS3cLt8gel5ZAdj4e1dI2U2C9Sa5cKlc5Ze5g=;
        b=S9K+8pxYH4ckSGPcRHGcnBUXISMhDTqtJbHMeL8spIRUIQN3T7JCjF+yE/iHEM5R5r
         Eg+nwybdmXpvmxQyYi6Qa/dDDwb8L7WnEOhaw/L+w16KkcxJg64kHd0dKoZL7wpSx/WU
         ezmlC2N9RwFfowTXxgNxg1qMiMVqX31eOuKS83mKWuj9NKGW+BIdFgtS11A35CvlT9ah
         3kid/OxEIvpkvgUwV2id1RRxiaGhIeEzKsXv40PtObXYIwrt7LIp5QtQxEidM2hI87Df
         Vj1UIhguB09OwcA6PzG220riTAaM/JBv2VQnGv7vb674IIynO0WPToOt8Ji/NOopWrvd
         IiQQ==
X-Gm-Message-State: AOAM53149uoIu/9hHkbC1QHLNASxvmavFcZ856gzOnqnYTLQf43sGMGM
        B/C+Lr5Qoz8+R4Dr1qBqPIUQL6l8pV5MzA==
X-Google-Smtp-Source: ABdhPJzzcdqWzBgccC7HDWMvVNZqGL7VQgOyX+vT8xtTk3vhf/jK9qNmp7Tpf5RnjcdwNphwOP861A==
X-Received: by 2002:a05:6602:2c45:: with SMTP id x5mr13314292iov.98.1636764748630;
        Fri, 12 Nov 2021 16:52:28 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id r3sm4186680iob.0.2021.11.12.16.52.27
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 16:52:27 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id e144so13374842iof.3
        for <linux-input@vger.kernel.org>; Fri, 12 Nov 2021 16:52:27 -0800 (PST)
X-Received: by 2002:a05:6638:190f:: with SMTP id p15mr15051440jal.82.1636764747377;
 Fri, 12 Nov 2021 16:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20211103234018.4009771-1-briannorris@chromium.org> <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
In-Reply-To: <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 12 Nov 2021 16:52:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XOda7vwUPY+WpGLzMwwrbrhQ9RqBQw4LhPwD6Sqhf7vw@mail.gmail.com>
Message-ID: <CAD=FV=XOda7vwUPY+WpGLzMwwrbrhQ9RqBQw4LhPwD6Sqhf7vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/input_helper: Add new input-handling helper
To:     Brian Norris <briannorris@chromium.org>
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

Hi,

On Wed, Nov 3, 2021 at 4:40 PM Brian Norris <briannorris@chromium.org> wrote:
>
> A variety of applications have found it useful to listen to
> user-initiated input events to make decisions within a DRM driver, given
> that input events are often the first sign that we're going to start
> doing latency-sensitive activities:
>
>  * Panel self-refresh: software-directed self-refresh (e.g., with
>    Rockchip eDP) is especially latency sensitive. In some cases, it can
>    take 10s of milliseconds for a panel to exit self-refresh, which can
>    be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
>    with an input_handler boost, that preemptively exits self-refresh
>    whenever there is input activity.
>
>  * GPU drivers: on GPU-accelerated desktop systems, we may need to
>    render new frames immediately after user activity. Powering up the
>    GPU can take enough time that it is worthwhile to start this process
>    as soon as there is input activity. Many Chrome OS systems also ship
>    with an input_handler boost that powers up the GPU.
>
> This patch provides a small helper library that abstracts some of the
> input-subsystem details around picking which devices to listen to, and
> some other boilerplate. This will be used in the next patch to implement
> the first bullet: preemptive exit for panel self-refresh.
>
> Bits of this are adapted from code the Android and/or Chrome OS kernels
> have been carrying for a while.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  drivers/gpu/drm/Makefile           |   3 +-
>  drivers/gpu/drm/drm_input_helper.c | 143 +++++++++++++++++++++++++++++
>  include/drm/drm_input_helper.h     |  22 +++++
>  3 files changed, 167 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/drm_input_helper.c
>  create mode 100644 include/drm/drm_input_helper.h
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 0dff40bb863c..378761685b47 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -49,7 +49,8 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
>                 drm_scdc_helper.o drm_gem_atomic_helper.o \
>                 drm_gem_framebuffer_helper.o \
>                 drm_atomic_state_helper.o drm_damage_helper.o \
> -               drm_format_helper.o drm_self_refresh_helper.o
> +               drm_format_helper.o drm_self_refresh_helper.o \
> +               drm_input_helper.o

Note that the Makefile part conflicts with drm-misc-next right now.
It's not very hard to resolve, but since this would likely land there
maybe it'd be nice to resolve?

Other than that, this seems sane to me and much better than copying
this between places, so assuming that the build problems get resolved
then I'm happy.

I guess one random thought I had is whether there would be an
appropriate place to put this that _wasn't_ in DRM. I still wonder
whether we'll ever try to upstream something like the cpufreq boost
driver that we're carrying around and using in Chrome OS. If so, it
would want to use these same helpers and it'd be pretty awkward for it
to have to reach into DRM. ...any chance we could just land these
helpers somewhere more generic?


> +struct drm_input_handler {
> +       struct input_handler handler;
> +       void *priv;
> +       void (*callback)(void *priv);
> +};

Super bike-sheddy comment is that "void *" data arguments are not
super common in the kernel. I would have expected the callback
function to just be passed a pointer to the "struct drm_input_handler"
and it could find any other data it needed via "container_of". I won't
insist though. ;-)


-Doug
