Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2AD4576E1
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 20:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235871AbhKSTKW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 14:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235861AbhKSTKW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 14:10:22 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C136C06173E
        for <linux-input@vger.kernel.org>; Fri, 19 Nov 2021 11:07:20 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 28so9391057pgq.8
        for <linux-input@vger.kernel.org>; Fri, 19 Nov 2021 11:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q3pdqezUF3Pzbcds/tqL9a3vuB+GIr/2xlMTkcoKHS8=;
        b=mieh92MqEyaCRT1FaPUo0Ylw+EopgdsnKvE4+uToiX40sIMRdGF/jjsiLqfKJxLdVO
         1fRUmjyYu8bdBz+e0CPr4nS8X319aCYzHjYTN0XLgWeb7Q6xZwp8w/3vzPdyc6+FdY41
         fhSH97XWGnCqD4JEnmC9bLib413QEcOEpe6jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q3pdqezUF3Pzbcds/tqL9a3vuB+GIr/2xlMTkcoKHS8=;
        b=x+d0aD6tpRLe7CQ9XjrEecK9XNuGGHP1yobVpqdvSLVvuntTiOKuGmQ+AQuIWzDebo
         Hid3UZbI5lERwRCBoxSS0AM+xPLpffPbRW64WWkRulS3e9joM0gG6diBfl2/fwbBsGN0
         ObhGMX3Z37S3nbYqUtNzqC3/8xipSgRsRXL7jnm1SOvmkw5USbO1Ds3/oJOH9y+TcNFu
         9tBzcS2hbhur4VFSo2i2/qPmEHFOobY6ta8RzJkH9VWUyzmEM3k5EkD96r8LKOFX8f/h
         I2UkHgomncNLcT9DYJCPqs1dGAXx5izls9NOM0iksOI18aLnU9MPcvzTCZtIQ1PONoU8
         eh0g==
X-Gm-Message-State: AOAM5305b8egDkJCyjt23P0yqy+kMa34X2szPEdfBxgLfzZaXAxMyleN
        nk+kcIsOc0+S7ip5pjgciiR8uQ==
X-Google-Smtp-Source: ABdhPJz/CalZQJnQBmz5Ruvzzp4xId7hvXSM5tnD56nv0ohBgcfA6CYqnztrKPcmtSPoDW8Mw331SQ==
X-Received: by 2002:a63:494f:: with SMTP id y15mr18817862pgk.257.1637348839767;
        Fri, 19 Nov 2021 11:07:19 -0800 (PST)
Received: from google.com ([2620:15c:202:201:d418:2c22:1322:f27])
        by smtp.gmail.com with ESMTPSA id e7sm337651pgj.11.2021.11.19.11.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 11:07:18 -0800 (PST)
Date:   Fri, 19 Nov 2021 11:07:16 -0800
From:   Brian Norris <briannorris@chromium.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Message-ID: <YZf15Ir0LDjkYNF2@google.com>
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <YZYXR4u6VBEi4qnM@phenom.ffwll.local>
 <YZap4zKo8D5eZc1y@google.com>
 <YZd17jm5Nkfu5YRO@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZd17jm5Nkfu5YRO@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

On Fri, Nov 19, 2021 at 11:01:18AM +0100, Daniel Vetter wrote:
> On Thu, Nov 18, 2021 at 11:30:43AM -0800, Brian Norris wrote:
> > On Thu, Nov 18, 2021 at 10:05:11AM +0100, Daniel Vetter wrote:
> > > On Wed, Nov 17, 2021 at 02:48:40PM -0800, Brian Norris wrote:
> > > > --- a/drivers/gpu/drm/Kconfig
> > > > +++ b/drivers/gpu/drm/Kconfig
> > > > @@ -79,9 +79,15 @@ config DRM_DEBUG_SELFTEST
> > > >  
> > > >  	  If in doubt, say "N".
> > > >  
> > > > +config DRM_INPUT_HELPER
> > > > +	def_bool y
> > > > +	depends on DRM_KMS_HELPER
> > > > +	depends on INPUT
> > > 
> > > Uh please no configs for each thing, it just makes everything more
> > > complex. Do we _really_ need this?
> > 
> > First, it's not a configurable option (a user will never see this nor
> > have to answer Y/N to it); it only serves as an intermediary to express
> > the CONFIG_INPUT dependency (which is necessary) without making
> > DRM_KMS_HELPER fully depend on CONFIG_INPUT. (We should be able to run
> > display stacks without the input subsystem.)
> 
> I'm not so much worried about the user cost, but the maintenance cost.
> Kbuild config complexity is ridiculous, anything that adds even a bit is
> really silly.
> 
> > The closest alternative I can think of with fewer Kconfig symbols is to
> > just use CONFIG_INPUT directly in the code, to decide whether to provide
> > the helpers or else just stub them out. But that has a problem of not
> > properly expressing the =m vs. =y necessity: if, for example,
> > CONFIG_DRM_KMS_HELPER=y and CONFIG_INPUT=m, then we'll have linker
> > issues.
> 
> Usually this is done by providing static inline dummy implementations in
> the headers. That avoids having to sprinkle new Kconfig symbols all over.

Right, I already did that, and I'm not sprinkling
CONFIG_DRM_INPUT_HELPER much. (I do include one around the module
parameter, because it doesn't make much sense to have the module
parameter even exist, if the underlying feature is stubbed out.)

But that doesn't solve the problem in my last sentence, involving
tristates. The "stub inline" approach only works well for boolean
features -- either built-in, or disabled. Once your feature is in a
module, you need to ensure that no built-in code depends on it.

Do you want DRM_KMS_HELPER to unconditionally depend on CONFIG_INPUT? If
so, I can just add a 'select' or 'depend' and drop this intermediate
symbol.
If not, then what do you expect to happen with DRM_KMS_HELPER=y and
CONFIG_INPUT=m?

Brian
