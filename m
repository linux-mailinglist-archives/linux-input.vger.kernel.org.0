Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31108456CEC
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 11:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbhKSKEY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 05:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhKSKEX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 05:04:23 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC1FC06173E
        for <linux-input@vger.kernel.org>; Fri, 19 Nov 2021 02:01:22 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id x6so28731118edr.5
        for <linux-input@vger.kernel.org>; Fri, 19 Nov 2021 02:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=faisa42i+JkdKwP8h3lJgoixQnZuCwS4omXJL7Az6Fo=;
        b=AQZ6UaLr00vs460QHnYji8REBLc6ZpXBPqhYvHck0dhgv0TNHN9fQO3bm0tMOk4xyS
         2GSVmipWL7PmMNIn6Q4f1w09pZA+HNgUBP+imD+9PAH3XK2S4UEu/SxQ6rA2vlHwtFwT
         m15BJfhOgZyboBnGqg82+tPwYBAui4zCdK41w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=faisa42i+JkdKwP8h3lJgoixQnZuCwS4omXJL7Az6Fo=;
        b=cMthAysDecAnAhvnL9K2qj49QZD7O6WyRSyh6SBXWp63TpcbIQ2ykqFDvpGXZ0apGR
         Zb8NdANCCM6yu0aAaYkk6piPQDavkfBI8Fujc/Q/ad2BBYkeEgyAm3ppFerqgFWCeqYV
         hwdTtxB6k7hXYGus50JQGO7eTgAnjr1CChv1G/JFeFP0AGYc5mDiR31SOdvXGIUSLvVp
         C78S19j38R5T4AezpbxMPdICPssVTzTm/91ZMj0YKRKmNvuypp2w3JfvOFUofNxkWEOR
         NQxNVlcxCs4cCF8DUNI11rx/TSyWCVzoqTde1lCailTvY3SbKs5ZpZSswKRrFs4sjAbL
         mbww==
X-Gm-Message-State: AOAM533PKGuuBd24AY8g8ho7ghv+vMhZmCmtAyeWAGpipzaO0aIWOLep
        aozYLJJbJ03TI0/ivNkfFRGg/g==
X-Google-Smtp-Source: ABdhPJyNaia1PS7Z6q19PwDKk4GrhMtmufhRVt6QW/rreoJ6G0yF18wMZ0nYWD4E3ysw+lBZF4Ov9g==
X-Received: by 2002:a05:6402:1d48:: with SMTP id dz8mr22461836edb.100.1637316080619;
        Fri, 19 Nov 2021 02:01:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e1sm284559edc.27.2021.11.19.02.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 02:01:20 -0800 (PST)
Date:   Fri, 19 Nov 2021 11:01:18 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Brian Norris <briannorris@chromium.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZd17jm5Nkfu5YRO@phenom.ffwll.local>
Mail-Followup-To: Brian Norris <briannorris@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <YZYXR4u6VBEi4qnM@phenom.ffwll.local>
 <YZap4zKo8D5eZc1y@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZap4zKo8D5eZc1y@google.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 18, 2021 at 11:30:43AM -0800, Brian Norris wrote:
> Hi Daniel,
> 
> Thanks for the review. Lots to address elsewhere, but I can respond
> here first:
> 
> On Thu, Nov 18, 2021 at 10:05:11AM +0100, Daniel Vetter wrote:
> > On Wed, Nov 17, 2021 at 02:48:40PM -0800, Brian Norris wrote:
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -79,9 +79,15 @@ config DRM_DEBUG_SELFTEST
> > >  
> > >  	  If in doubt, say "N".
> > >  
> > > +config DRM_INPUT_HELPER
> > > +	def_bool y
> > > +	depends on DRM_KMS_HELPER
> > > +	depends on INPUT
> > 
> > Uh please no configs for each thing, it just makes everything more
> > complex. Do we _really_ need this?
> 
> First, it's not a configurable option (a user will never see this nor
> have to answer Y/N to it); it only serves as an intermediary to express
> the CONFIG_INPUT dependency (which is necessary) without making
> DRM_KMS_HELPER fully depend on CONFIG_INPUT. (We should be able to run
> display stacks without the input subsystem.)

I'm not so much worried about the user cost, but the maintenance cost.
Kbuild config complexity is ridiculous, anything that adds even a bit is
really silly.

> The closest alternative I can think of with fewer Kconfig symbols is to
> just use CONFIG_INPUT directly in the code, to decide whether to provide
> the helpers or else just stub them out. But that has a problem of not
> properly expressing the =m vs. =y necessity: if, for example,
> CONFIG_DRM_KMS_HELPER=y and CONFIG_INPUT=m, then we'll have linker
> issues.

Usually this is done by providing static inline dummy implementations in
the headers. That avoids having to sprinkle new Kconfig symbols all over.

> In short, yes, I think we really need this. But I'm not a Kbuild expert.
> 
> > > diff --git a/include/drm/drm_input_helper.h b/include/drm/drm_input_helper.h
> > > new file mode 100644
> > > index 000000000000..7904f397b934
> > > --- /dev/null
> > > +++ b/include/drm/drm_input_helper.h
> > > @@ -0,0 +1,41 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (C) 2021 Google, Inc.
> > > + */
> > > +#ifndef __DRM_INPUT_HELPER_H__
> > > +#define __DRM_INPUT_HELPER_H__
> > > +
> > > +#include <linux/input.h>
> > > +
> > > +struct drm_device;
> > > +
> > > +struct drm_input_handler {
> > > +	/*
> > > +	 * Callback to call for input activity. Will be called in an atomic
> > > +	 * context.
> > 
> > How atomic? Like hardirq, and nasty spinlocks held?
> 
> Maybe I should have just cribbed off the <linux/input.h> doc:
> 
>  * @event: event handler. This method is being called by input core with
>  *      interrupts disabled and dev->event_lock spinlock held and so
>  *      it may not sleep
> 
> I probably don't want to propagate the subsystem details about which
> locks, but I guess I can be specific about "interrupts disabled" and
> "don't sleep".

You can also do hyperlinks in the generated htmldocs and just reference
that:

https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#highlights-and-cross-references

> 
> > > +	 */
> > > +	void (*callback)(struct drm_input_handler *handler);
> > > +
> > > +	struct input_handler handler;
> > > +};
> > > +
> > > +#if defined(CONFIG_DRM_INPUT_HELPER)
> > > +
> > > +int drm_input_handle_register(struct drm_device *dev,
> > > +			      struct drm_input_handler *handler);
> > > +void drm_input_handle_unregister(struct drm_input_handler *handler);
> > > +
> > > +#else /* !CONFIG_DRM_INPUT_HELPER */
> > > +
> > > +static inline int drm_input_handle_register(struct drm_device *dev,
> > > +					    struct drm_input_handler *handler)
> > > +{
> > > +	return 0;
> > > +}
> > 
> > I guess the reason behind the helper is that you also want to use this in
> > drivers or maybe drm/sched?
> 
> I think my reasoning is heavily described in both the cover letter and
> the commit message. If that's not clear, can you point out which part?
> I'd gladly improve it :)
> 
> But specifically, see the 2nd bullet from the commit message, which I've
> re-quoted down here:
> 
> > >  * GPU drivers: on GPU-accelerated desktop systems, we may need to
> > >    render new frames immediately after user activity. Powering up the
> > >    GPU can take enough time that it is worthwhile to start this process
> > >    as soon as there is input activity. Many Chrome OS systems also ship
> > >    with an input_handler boost that powers up the GPU.
> 
> Rob Clark has patches to drm/msm to boost GPU power-up via a similar
> helper.

Yeah this question was just for confirmation, might be good to include
that other patch set too for the full picture.

> > Anyway I think it looks all reasonable. Definitely need an ack from input
> > people
> 
> I realized I failed to carry Dmitry's Ack from version 1 [1]. If this
> has a v3 in similar form, I'll carry it there.
> 
> > that the event list you have is a good choice, I have no idea what
> > that all does. Maybe also document that part a bit more.
> 
> I'm admittedly not an expert there, and this is actually one reason why
> we hoped to make this a library (that nobody wants to keep figuring out
> whether all those flags, etc., are really doing the right thing), but
> there are comments about what each entry is _trying_ to do. Are you
> suggesting more, as in, why "BTN_LEFT + EV_KEY" means "pointer"? Or why
> we match certain devices (because they represent likely user activity
> that will affect the display pipeline)? Or both? Anyway, I'll give it a
> shot, if we keep this.

So maybe this is all very obvious for input folks, and comments about what
each does is overkill.

But I think in the kerneldoc for gfx folks it would be good to explain
what kind of events this listens for, like iirc you listen to key-up not
key-down, since often the boost has expired by the time the key is
actually lifted? Stuff like that I think would be good to explain the why
behind the choice of entries in the list. Or that we try to listen to some
pointer/mouse events (all of them? only "important" ones?)
-Daniel

> 
> Brian
> 
> [1] https://lore.kernel.org/all/YYW6FwSeNMK25ENm@google.com/

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
