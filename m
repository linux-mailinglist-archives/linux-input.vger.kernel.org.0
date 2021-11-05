Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BC6446B21
	for <lists+linux-input@lfdr.de>; Sat,  6 Nov 2021 00:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhKEXOE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 19:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhKEXOD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 19:14:03 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610C7C061570;
        Fri,  5 Nov 2021 16:11:23 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id g28so880489pgg.3;
        Fri, 05 Nov 2021 16:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fe30gTf1JSH+qni1elDo831NVGG1lJluzq3OLW/dWIM=;
        b=p5sJJOrDEYqV2YTQNzrstft63jCJWAaO8A+cosJrR/IlYDqk32+qiBb8ydvv9Sf/u6
         ztJ+Zv8n16UP7+B1acBMOC36VXH3xt5G9G4ePa2+gxgDVbK593fo3+vwUdkR6xGuVOD5
         pkVsFhBeVvMRFm3rAzAHuZYUDPIhzGKsjYrLn69dvTa9TeHgRomfF6sIljreV+xUTAqh
         ivqy2YdZA5VwG93YrS3mG4HK9tTAwo5HeygmnUA4GlgBklx0TsR2hVxtMC+ClzvWZz6Y
         IkZAy8wrUw0WstgzVJ/I0U7naYXGjdloseWwDUcIZoshEo1ceW3nOA7FWx+jIIgpLBnt
         7Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fe30gTf1JSH+qni1elDo831NVGG1lJluzq3OLW/dWIM=;
        b=w8mBOTHASLBiqBFtr/BP/vHN6ZzuqDdjhr3MmRRAl/TP+xL33jUz46PNu8tTjtm1FW
         3J29ZDfXUbdj1vB/rFIU8KOPcVMslq2ppmKD9q655z5WrGrPn5rQYROF0PKfZZrxC2vM
         zPdX00mx4bADYpyK6VsLrKrCkVn08Vip5zAhCEbFBkvkcSq2nEWFgb/nXLKnYqWQgUBz
         jcgLBJ5GaW2LdpE9ucxiyL0s6tVL5r89IJozanRXHDaUBEBCA6lsGb1LhrCL7CGof5vq
         +cDNaE5MP3aOqLCEJgCkXWh+EHMoPdwC69psDeNIKHUljiy97lVRxq8HzRL9J5QctDua
         Rpvg==
X-Gm-Message-State: AOAM532FnrCx+3pRUKuc8mrFFQDcR2rBTPHdIohELOW72hN8lsZJlAir
        31GIOLqqHad9RsGBLcHO5lo=
X-Google-Smtp-Source: ABdhPJxHEL9UfKqPpufsLjZ2IJT4l8QtchzUvFFL1+WAcE+uvhlq2IyLoqu4RJJf9RwCHrHW6clN+g==
X-Received: by 2002:a63:b957:: with SMTP id v23mr45380131pgo.74.1636153882737;
        Fri, 05 Nov 2021 16:11:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:837c:e765:475f:22d3])
        by smtp.gmail.com with ESMTPSA id c3sm8479607pfv.25.2021.11.05.16.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 16:11:21 -0700 (PDT)
Date:   Fri, 5 Nov 2021 16:11:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Brian Norris <briannorris@chromium.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-rockchip@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YYW6FwSeNMK25ENm@google.com>
References: <20211103234018.4009771-1-briannorris@chromium.org>
 <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 03, 2021 at 04:40:17PM -0700, Brian Norris wrote:
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

If this is acceptable to DRM folks I am OK with this from input POV. The
only think I would call out that the callback is executed in atomic
context with interrupts disabled.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
