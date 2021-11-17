Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76465454EB9
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 21:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbhKQUup (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 15:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234356AbhKQUuo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 15:50:44 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3D9C061570;
        Wed, 17 Nov 2021 12:47:45 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id v19so3247080plo.7;
        Wed, 17 Nov 2021 12:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0vK/ighOzZuC6Y+2uf+e2G0O4RrKtsj6uBz25D3JSHE=;
        b=jOsuG4++rRbfbei3wgTWv6Nu9ZKIRWjd3Q1x8lfasRr7VVQd0qRTzAC8Wf64zWmi6b
         +T90ZsPVL13J8h7iqkBL8g1cM/39AHbMKaEQaWoGP7mZ8i0+yOUfHJaKKciQfUSaqs63
         0RPcrWHsBEcdZ5IygXZHZDxEv5Ii2QJlOkXdO5UM537S+WxY7KMyuzCADhhxiDGboq+4
         iFSg0jXX6aZkaHPbw10/ZRNVcc49nx00/PtB6PKSJgHxywjQMawPsqQv+E2T7r+6uzXn
         aB+RH841EyvHFULt1YvNwTaapEZ1m2n4vyET2yGrGfkJ/aLRpJHKCyDdD7raJIIaauzN
         PBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0vK/ighOzZuC6Y+2uf+e2G0O4RrKtsj6uBz25D3JSHE=;
        b=JJ7a/KJdpEuYk4xFjywva3bZkPxNJTRzSNRwaT/C+XBwxNF+Or4GT1x6xihsEvmodh
         KysL9SSTy38UNdKGavbkcEuWOsZO7ZnuSSKN9HKV3z7OYG+cnW3R3MWCIlT0gXuHdjDL
         ZP2eTlcXJ3FE355yUbZMgse8K9JgWKQDrRj6Dz2kVPiTxTuBFzlP78a9HH+B86RRSMkt
         VEk7n5dFlE6VGyTwhmP5tqljDJiZmMjXj8n1HajTg/YZZmRZk3hdRf1yTxld1+Rkgvda
         9cHw4AtZe3k+Xbk7/eIGZGZ1r4FzXunyo7QhDUdcrSRWULpV1hS09smlPrKCKtD29232
         5+gg==
X-Gm-Message-State: AOAM530VkTaxg2jg0kYFVc8Tz8u8jFfbx/WTO/6XWYp+M2jUhRQ78T3U
        zdBj7kZ7nQAUttrgp0Aai0Q=
X-Google-Smtp-Source: ABdhPJzEC2p9CKz/ZZEYDEmlP4fgK23s9z+zbfLmbyywgcJzuvpeuyktKLwofPfWSV13pArbF8sPwQ==
X-Received: by 2002:a17:90b:3890:: with SMTP id mu16mr3355961pjb.186.1637182065107;
        Wed, 17 Nov 2021 12:47:45 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e863:bb5d:673b:3a6d])
        by smtp.gmail.com with ESMTPSA id pg13sm511061pjb.8.2021.11.17.12.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 12:47:43 -0800 (PST)
Date:   Wed, 17 Nov 2021 12:47:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Brian Norris <briannorris@chromium.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-rockchip@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZVqbZpAPHOBG6bL@google.com>
References: <20211103234018.4009771-1-briannorris@chromium.org>
 <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <CAD=FV=XOda7vwUPY+WpGLzMwwrbrhQ9RqBQw4LhPwD6Sqhf7vw@mail.gmail.com>
 <CA+ASDXMvZCjn+X98JccyJiLQ0ggq-t-HqnM5SKYMbiQFqZDhGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+ASDXMvZCjn+X98JccyJiLQ0ggq-t-HqnM5SKYMbiQFqZDhGQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 17, 2021 at 10:38:58AM -0800, Brian Norris wrote:
> On Fri, Nov 12, 2021 at 4:52 PM Doug Anderson <dianders@chromium.org> wrote:
> 
> (Snip other comments; they seem reasonable, and I'll factor them into
> the next version)
> 
> > I guess one random thought I had is whether there would be an
> > appropriate place to put this that _wasn't_ in DRM. I still wonder
> > whether we'll ever try to upstream something like the cpufreq boost
> > driver that we're carrying around and using in Chrome OS. If so, it
> > would want to use these same helpers and it'd be pretty awkward for it
> > to have to reach into DRM. ...any chance we could just land these
> > helpers somewhere more generic?
> 
> Yeah, I was torn on what to do here as well. I'd rather land something
> than nothing, and when reading past conversations, it sounded like
> Dmitry didn't want this kind of thing in drivers/input/ [1]. I'd love
> to be wrong here though.

I simply feel that input_handler is already a very simple abstraction
and trying to specialize it to simplify users further is not productive.

> 
> I'm not sure where else this would belong though -- either in the
> producing subsystem (input) or the consuming one(s) (drm, cpufreq). We
> could make up some odd middle ground I suppose (lib/?), but that seems
> pretty artificial.
> 
> I guess one question is, what is this abstracting, and is that
> abstraction actually a shared need for multiple subsystems? I think
> the abstraction is, "impending user activity; <component X> should
> prepare itself". That general need is exactly the same for the cases
> I'm aware of. And if there is any tuning needed (e.g., ignore input
> device Y; or turn the whole thing off, because we're ignoring input
> for now), that would also seem to be a shared need.
> 
> Anyway, back to my first paragraph: I'll plan on keeping this as-is
> (as a DRM helper) unless I hear otherwise from input folks.
> 
> Brian
> 
> [1] https://lore.kernel.org/all/20180416174117.GA77055@dtor-ws/

Thanks.

-- 
Dmitry
