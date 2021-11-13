Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD34E44F044
	for <lists+linux-input@lfdr.de>; Sat, 13 Nov 2021 01:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhKMAzL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Nov 2021 19:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhKMAzL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Nov 2021 19:55:11 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D4BC061767
        for <linux-input@vger.kernel.org>; Fri, 12 Nov 2021 16:52:19 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id y16so13346079ioc.8
        for <linux-input@vger.kernel.org>; Fri, 12 Nov 2021 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ar+96otnAzeN5XyQtZwRbRvg/01cns8FSyH4rDQT4T4=;
        b=EGyRVXShdBOHi4a5JP4tWIcCl0qnPG5C3nLBIQVAP3oPkc2D14VyhTCDf7WNGPpRWr
         mqinLcayYYsxIC9Uqr88/5qSk85g0nMYmUhOLIr1YMBQRgvwgY3WTPCSU3lMRDcrnE+d
         I6OXzQ9Pqmk6L5tz0hqrgUcLf1+d8cQjHVzuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ar+96otnAzeN5XyQtZwRbRvg/01cns8FSyH4rDQT4T4=;
        b=FDG1CD9jAWC4IRH6T7SVsJN2H7D05e/0HziVwLmprthfTePOzYgznaJ+L2ohNjGUpL
         vj/lys9iNPS2uCjuDMav0I56a9xWKAWEarCY6VAsTw44rJNXxYipL+PuAE5PB5ls8ezf
         1pkzyapddu68alI0ZwCbq5m4NNpmrH/SJJRltIw393U3lMiAPVygTpijzr5+FZ1jF6mH
         FannhZJmKpkPBYgYvY2LQo2XuPOTbpvt+rmgH6xCLUgMydAVa2ZSIf8KHN1prVpJv8BR
         J8n4zALxiDPPTVEjGnQm4R7zEtiDIK3yRTV+JZfFRuGGuSmGZnUa5pHTZE55jpD3Iw11
         NBuQ==
X-Gm-Message-State: AOAM533n93EwuL2okZl5ixa0GGAu2dSlPuU8ZmOQKahZkG/1XxDIQ35n
        6oILVhYzArr/RSSiwTh2Y0bSKgahMzJtDA==
X-Google-Smtp-Source: ABdhPJxagL4SKJx0QigeSXvKKwBJsKLo7KUEIOGpo7hfKPc0hFMhI7E5DL5hUAmD2X6XJKol/RcE0A==
X-Received: by 2002:a5d:8903:: with SMTP id b3mr13761706ion.44.1636764738805;
        Fri, 12 Nov 2021 16:52:18 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id z9sm4897808ile.29.2021.11.12.16.52.15
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 16:52:17 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id 14so13199662ioe.2
        for <linux-input@vger.kernel.org>; Fri, 12 Nov 2021 16:52:15 -0800 (PST)
X-Received: by 2002:a5d:9753:: with SMTP id c19mr13234220ioo.136.1636764735260;
 Fri, 12 Nov 2021 16:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20211103234018.4009771-1-briannorris@chromium.org> <20211103164002.2.Ie6c485320b35b89fd49e15a73f0a68e3bb49eef9@changeid>
In-Reply-To: <20211103164002.2.Ie6c485320b35b89fd49e15a73f0a68e3bb49eef9@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 12 Nov 2021 16:52:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WDRDHVSiFW+yxaR=Z+mNdKnUY_eF_CFqKeQhcKmdag5g@mail.gmail.com>
Message-ID: <CAD=FV=WDRDHVSiFW+yxaR=Z+mNdKnUY_eF_CFqKeQhcKmdag5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/self_refresh: Disable self-refresh on input events
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
> To improve panel self-refresh exit latency, we speculatively start
> exiting when we
> receive input events. Occasionally, this may lead to false positives,
> but most of the time we get a head start on coming out of PSR. Depending
> on how userspace takes to produce a new frame in response to the event,
> this can completely hide the exit latency.
>
> In local tests on Chrome OS (Rockchip RK3399 eDP), we've found that the
> input notifier gives us about a 50ms head start over the
> fb-update-initiated exit.
>
> Leverage a new drm_input_helper library to get easy access to
> likely-relevant input event callbacks.

So IMO this is a really useful thing and I'm in support of it landing.
It's not much code and it clearly gives a big benefit. However, I
would request a CONFIG option to control this so that if someone
really finds some use case where it isn't needed or if they find a
good way to do this in userspace without latency problems then they
can turn it off. Does that sound reasonable?


> Inspired-by: Kristian H. Kristensen <hoegsberg@google.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> This was in part picked up from:
>
>   https://lore.kernel.org/all/20180405095000.9756-25-enric.balletbo@collabora.com/
>   [PATCH v6 24/30] drm/rockchip: Disable PSR on input events
>
> with significant rewrites/reworks:
>
>  - moved to common drm_input_helper and drm_self_refresh_helper
>    implementation
>  - track state only through crtc->state->self_refresh_active
>
> Note that I'm relatively unfamiliar with DRM locking expectations, but I
> believe access to drm_crtc->state (which helps us track redundant
> transitions) is OK under the locking provided by
> drm_atomic_get_crtc_state().

Yeah, I'm no expert here either. I gave a review a shot anyway since
it's been all quiet, but adult supervision is probably required...

I can believe that you are safe from corrupting things, but I think
you still have locking problems, don't you? What about this:

1. PSR is _not_ active but we're 1 microsecond away from entering PSR

2. Input event comes through.

3. Start executing drm_self_refresh_transition(false).

4. PSR timer expires and starts executing drm_self_refresh_transition(true).

5. Input event "wins the race" but sees that PSR is already disabled => noop

6. PSR timer gets the lock now. Starts PSR transition.

Wouldn't it be better to cancel / reschedule any PSR entry as soon as
you see the input event?


-Doug
