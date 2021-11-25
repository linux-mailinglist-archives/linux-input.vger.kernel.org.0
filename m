Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F9E45DD86
	for <lists+linux-input@lfdr.de>; Thu, 25 Nov 2021 16:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbhKYPgl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Nov 2021 10:36:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241585AbhKYPel (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Nov 2021 10:34:41 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55C9C06174A
        for <linux-input@vger.kernel.org>; Thu, 25 Nov 2021 07:25:09 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l16so12416186wrp.11
        for <linux-input@vger.kernel.org>; Thu, 25 Nov 2021 07:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=bgokrwfXdRB9SClU9n/nKdZVyUcKPx1fDzLulUzJIPU=;
        b=BktAf1OS+eudDpfgrdZDTSFFMA7Yx1oBn5NMzdoU7qIo8aNQ9mok4e2egctvZU1mko
         URk5CsZF+wfaS2PBAqP0GONNNyChiLkL+Cn3nlkbJubQzzbvN+ZxhxMH6RQhCRyrTmWO
         zzBIJ4Mhg0tjItLDamKowUeOk7aREzY9Rg5Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=bgokrwfXdRB9SClU9n/nKdZVyUcKPx1fDzLulUzJIPU=;
        b=l2EtfNuXVeCdm6CA6uLZMaej3fdcUGAvqL1A3oMaII0k3Mni2lovNaEBG3FZCfJ3tg
         jXoioMNDPEDrQ4DpujsZCR2KwpsE0hfPXzX+GcSe2oHTCJKVxPkIcTKsFAUHMJ7Uqhik
         T9az+hn/oDmevT+V7ksE95C4x852q6hIYbRtmdJUPRgjHFxeGDmoyfoNXcf3ApnADEjB
         1FIEKlud3FMQyozhbgtczIBztaX5E6knVTTfBnwYBhz0LCeh+69LhuFbQhq9CvDENRxa
         9YcvCy/+9tIbs+I3jy41soXL3+Vvqg1VHDZMD+68IzVLmfa8Pk8mctbZz859EfzXCYlp
         Qmrw==
X-Gm-Message-State: AOAM533QzdeN67P0ATOSQsPvtxuHLSkgW01v+VbhYvLZIVnwtUEL2EBp
        +Jfot3ZEgZkenhPjn6F6ebIZaZJr7KP5QQ==
X-Google-Smtp-Source: ABdhPJwe8pptmsJdDF9M6JUSyrscCdaDaxsY8JQgVcoGOgo8XjGLEdr1e+oL4tgyhJgNNAWjvV0HCw==
X-Received: by 2002:a5d:6111:: with SMTP id v17mr7637482wrt.512.1637853908242;
        Thu, 25 Nov 2021 07:25:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id bg12sm4220870wmb.5.2021.11.25.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:25:07 -0800 (PST)
Date:   Thu, 25 Nov 2021 16:25:05 +0100
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
Message-ID: <YZ+q0ZlIRoq4nZMl@phenom.ffwll.local>
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
 <YZd17jm5Nkfu5YRO@phenom.ffwll.local>
 <YZf15Ir0LDjkYNF2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZf15Ir0LDjkYNF2@google.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 19, 2021 at 11:07:16AM -0800, Brian Norris wrote:
> Hi Daniel,
> 
> On Fri, Nov 19, 2021 at 11:01:18AM +0100, Daniel Vetter wrote:
> > On Thu, Nov 18, 2021 at 11:30:43AM -0800, Brian Norris wrote:
> > > On Thu, Nov 18, 2021 at 10:05:11AM +0100, Daniel Vetter wrote:
> > > > On Wed, Nov 17, 2021 at 02:48:40PM -0800, Brian Norris wrote:
> > > > > --- a/drivers/gpu/drm/Kconfig
> > > > > +++ b/drivers/gpu/drm/Kconfig
> > > > > @@ -79,9 +79,15 @@ config DRM_DEBUG_SELFTEST
> > > > >  
> > > > >  	  If in doubt, say "N".
> > > > >  
> > > > > +config DRM_INPUT_HELPER
> > > > > +	def_bool y
> > > > > +	depends on DRM_KMS_HELPER
> > > > > +	depends on INPUT
> > > > 
> > > > Uh please no configs for each thing, it just makes everything more
> > > > complex. Do we _really_ need this?
> > > 
> > > First, it's not a configurable option (a user will never see this nor
> > > have to answer Y/N to it); it only serves as an intermediary to express
> > > the CONFIG_INPUT dependency (which is necessary) without making
> > > DRM_KMS_HELPER fully depend on CONFIG_INPUT. (We should be able to run
> > > display stacks without the input subsystem.)
> > 
> > I'm not so much worried about the user cost, but the maintenance cost.
> > Kbuild config complexity is ridiculous, anything that adds even a bit is
> > really silly.
> > 
> > > The closest alternative I can think of with fewer Kconfig symbols is to
> > > just use CONFIG_INPUT directly in the code, to decide whether to provide
> > > the helpers or else just stub them out. But that has a problem of not
> > > properly expressing the =m vs. =y necessity: if, for example,
> > > CONFIG_DRM_KMS_HELPER=y and CONFIG_INPUT=m, then we'll have linker
> > > issues.
> > 
> > Usually this is done by providing static inline dummy implementations in
> > the headers. That avoids having to sprinkle new Kconfig symbols all over.
> 
> Right, I already did that, and I'm not sprinkling
> CONFIG_DRM_INPUT_HELPER much. (I do include one around the module
> parameter, because it doesn't make much sense to have the module
> parameter even exist, if the underlying feature is stubbed out.)
> 
> But that doesn't solve the problem in my last sentence, involving
> tristates. The "stub inline" approach only works well for boolean
> features -- either built-in, or disabled. Once your feature is in a
> module, you need to ensure that no built-in code depends on it.
> 
> Do you want DRM_KMS_HELPER to unconditionally depend on CONFIG_INPUT? If
> so, I can just add a 'select' or 'depend' and drop this intermediate
> symbol.
> If not, then what do you expect to happen with DRM_KMS_HELPER=y and
> CONFIG_INPUT=m?

Yeah just add the dependency. If you still want to keep it optional the
way to do it is to add

	depends on FOO || FOO=n

And then just have #if IS_ENABLED(FOO) around your inline wrappers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
