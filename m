Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9823845727B
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 17:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235636AbhKSQOO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 11:14:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhKSQON (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 11:14:13 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD549C06173E
        for <linux-input@vger.kernel.org>; Fri, 19 Nov 2021 08:11:11 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id z5so44800939edd.3
        for <linux-input@vger.kernel.org>; Fri, 19 Nov 2021 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=KIgonA2EFTJLKTGv6+UD7Og9LS6eD0ftI5Kt9N5ampc=;
        b=dgWOaaq8yzIV1gHvfhemyZzO0QeUnPQPv8uVRZXUwjLioj3Hwn6siTvzHlaMIZ+M10
         7tJHjRqw94twP/WJGnDKvc9Tmz0Fn6Yc9Vvt+pm9yC4Sy11voNWpvPXPuV5NiIR23tEp
         5UPYM6qyrV8lv4YGUd8iuMlwg7TcUyXij0cLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=KIgonA2EFTJLKTGv6+UD7Og9LS6eD0ftI5Kt9N5ampc=;
        b=Bui4o4XH+PsIxwvoipVAW8uzykFRHiM/2VHfiYodo7528mkrM/nUB79gt2wv/fFkH7
         3UPjRa+T/IVQZpWqOIyGRg9qhbcQxjyDjj74jl8TpBNwd9F76D+pdTDyP45fp++tfPGX
         cH/pHHjUtOorg5X2MJoV9G3tfpaxNAfMrbL+1g0Mk7fiyZPHhlih2WPT+DoiHwRt6J7v
         UkfiIgLe9h/MQ53zyS4fmTiypXKd+/iF7pWm6PtBW+T/TjRYFNRQ8qI+3+m1pkHhXflC
         MXRc3SwGcmV64cp3dGf6TzeBaXgTLw23Zbc/9hxB65I2qbmi0BQZF6RqG/l/lDjLsVfi
         XWkg==
X-Gm-Message-State: AOAM530LNCHOSV34HzyEh8b8oR5IcZhfFr1qvLqgdZ00UDC9AJqCjd1R
        EQLKLtUv1EAQjwQXDDkpTxjvbw==
X-Google-Smtp-Source: ABdhPJxdLdSV5agM8x3vcedpr+NqChZx9RvCft+FI62Knox080qmHnRF7sNgy7+mWO4QtRIMEi9PDQ==
X-Received: by 2002:a05:6402:268d:: with SMTP id w13mr26820359edd.257.1637338270326;
        Fri, 19 Nov 2021 08:11:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u16sm128924ejy.16.2021.11.19.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:11:09 -0800 (PST)
Date:   Fri, 19 Nov 2021 17:11:07 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Simon Ser <contact@emersion.fr>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        David Airlie <airlied@linux.ie>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Doug Anderson <dianders@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZfMm3GkFereYPTZ@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        David Airlie <airlied@linux.ie>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Doug Anderson <dianders@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-input@vger.kernel.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell>
 <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
 <20211119115419.505155b5@eldfell>
 <YZfIgd8s7uGXAD2X@phenom.ffwll.local>
 <98236dpcx39iOz8xAYrwGLfiLdwgUlljrbBgHL3wd8A0Wz4KzRk3PR8s_tb5Rxu4eScKI4483kB6Vhv-T64CJYOeQqwXlqo2c-64HvoS5cg=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98236dpcx39iOz8xAYrwGLfiLdwgUlljrbBgHL3wd8A0Wz4KzRk3PR8s_tb5Rxu4eScKI4483kB6Vhv-T64CJYOeQqwXlqo2c-64HvoS5cg=@emersion.fr>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 19, 2021 at 04:04:28PM +0000, Simon Ser wrote:
> On Friday, November 19th, 2021 at 16:53, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > Random idea ... should we perhaps let userspace connect the boosting? I.e.
> > we do a bunch of standardized boost targets (render clocks, display sr
> > exit), and userspace can then connect it to whichever input device it
> > wants to?
> 
> On IRC we discussed having user-space hand over a FD to the kernel. When the FD
> becomes readable, the kernel triggers the boost.
> 
> This would let user-space use e.g. an input device, an eventfd, or an epoll FD
> with any combination of these as the boost signal.

Can userspace filter eventfd appropriately like we do here? And can they
get at that maybe 2nd eventfd from logind or whatever there is on distros
where /dev access is locked down for compositors/users.

I do agree that if we can do this generically maybe we should, but also
the use-case for input boosting is pretty well defined. I think it's just
about making sure that compositors is in control, and that we don't make
it worse (e.g. with the sr exit adding latency when the compositor can
redraw quickly enough).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
