Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6519F454D4F
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 19:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240136AbhKQSmN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 13:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240099AbhKQSmM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 13:42:12 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D7FC061570
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 10:39:13 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id t19so8423403oij.1
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 10:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMwG57gRfhGvfx3bsDRgnJ+lC91dyaKgwcL6O6NADCg=;
        b=bJY06TjEuEzBnei7QjerBZN/1ksqFWHyKXL5pm5sxptQa7m+l/ok/BVkK/Uw2vekW5
         VIav0aHERuBwOTK/lDVT3QeGPFjnz59tSD824VTVn8odKVwl2w8sQKQy2un2aeRMQ8//
         KXriJulpdalysaLauw+DTWngzeYooAdSBTcPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMwG57gRfhGvfx3bsDRgnJ+lC91dyaKgwcL6O6NADCg=;
        b=fcf1xjVxHOjpLUVUHnMH3gWM/KxBLMiwWqAbblEPh1bYhetYYftz/AQbGf//RV61ju
         wUIl5ny4sh+aWOuMPeizotmZ7XknQuim0PMwOtsBQHyHK4liiz4tlTc659J9CVcgb5V2
         7XYcLCJUntzN7qNDfZFkXN5v8wd0JwyuwA4qPJzhgc5M+8tZlqKEe+gYsE7gudjgSVB6
         8k/OL8AuA2wx6vhPYdsyhBUoVTgXTazOXrp2v1LJRWTPnb2O1L9f2okLFBZI7sLsWTJ9
         fsMaGQCcwhXEqBRhoINLppDOACYNdln4CG9OpVEgI2v7zQLgPQe6yItQdqcd/83/EJny
         wV1Q==
X-Gm-Message-State: AOAM530Nx9uKpRTQHXDfMX+68n1yo+MG9k6gQrVNAVifHSmwHwm5tf/T
        l1KMCEv6MgbJySJp5Wl+3tgaqs4WLRl2jQ==
X-Google-Smtp-Source: ABdhPJw4e72CdyQ/WzXxs4LeQgPLCvziUVAfqy/zhsNRAQ0uJ6i9NppKxjWTzaDbmiF9qJ3sQ4NzDQ==
X-Received: by 2002:a05:6808:11c8:: with SMTP id p8mr1819484oiv.72.1637174352367;
        Wed, 17 Nov 2021 10:39:12 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id q10sm129609oiw.17.2021.11.17.10.39.10
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 10:39:10 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id q25so8535215oiw.0
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 10:39:10 -0800 (PST)
X-Received: by 2002:a05:6808:1811:: with SMTP id bh17mr1707744oib.105.1637174349813;
 Wed, 17 Nov 2021 10:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20211103234018.4009771-1-briannorris@chromium.org>
 <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid> <CAD=FV=XOda7vwUPY+WpGLzMwwrbrhQ9RqBQw4LhPwD6Sqhf7vw@mail.gmail.com>
In-Reply-To: <CAD=FV=XOda7vwUPY+WpGLzMwwrbrhQ9RqBQw4LhPwD6Sqhf7vw@mail.gmail.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Wed, 17 Nov 2021 10:38:58 -0800
X-Gmail-Original-Message-ID: <CA+ASDXMvZCjn+X98JccyJiLQ0ggq-t-HqnM5SKYMbiQFqZDhGQ@mail.gmail.com>
Message-ID: <CA+ASDXMvZCjn+X98JccyJiLQ0ggq-t-HqnM5SKYMbiQFqZDhGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/input_helper: Add new input-handling helper
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

On Fri, Nov 12, 2021 at 4:52 PM Doug Anderson <dianders@chromium.org> wrote:

(Snip other comments; they seem reasonable, and I'll factor them into
the next version)

> I guess one random thought I had is whether there would be an
> appropriate place to put this that _wasn't_ in DRM. I still wonder
> whether we'll ever try to upstream something like the cpufreq boost
> driver that we're carrying around and using in Chrome OS. If so, it
> would want to use these same helpers and it'd be pretty awkward for it
> to have to reach into DRM. ...any chance we could just land these
> helpers somewhere more generic?

Yeah, I was torn on what to do here as well. I'd rather land something
than nothing, and when reading past conversations, it sounded like
Dmitry didn't want this kind of thing in drivers/input/ [1]. I'd love
to be wrong here though.

I'm not sure where else this would belong though -- either in the
producing subsystem (input) or the consuming one(s) (drm, cpufreq). We
could make up some odd middle ground I suppose (lib/?), but that seems
pretty artificial.

I guess one question is, what is this abstracting, and is that
abstraction actually a shared need for multiple subsystems? I think
the abstraction is, "impending user activity; <component X> should
prepare itself". That general need is exactly the same for the cases
I'm aware of. And if there is any tuning needed (e.g., ignore input
device Y; or turn the whole thing off, because we're ignoring input
for now), that would also seem to be a shared need.

Anyway, back to my first paragraph: I'll plan on keeping this as-is
(as a DRM helper) unless I hear otherwise from input folks.

Brian

[1] https://lore.kernel.org/all/20180416174117.GA77055@dtor-ws/
