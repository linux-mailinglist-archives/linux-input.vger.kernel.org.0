Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC1D4554DB
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 07:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243422AbhKRGmq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 01:42:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhKRGmp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 01:42:45 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D11C061764
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 22:39:46 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id o6-20020a17090a0a0600b001a64b9a11aeso4741158pjo.3
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 22:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMI94b/yAujS84g8LGbPIlO0F6a4sIjHraHl0xC9qbA=;
        b=RXZYLWj+1PEiNsO61vCWFGwgPlLIfFJ/upevq6+bkOm+yNbUGWjZVdGe8mFaTU0sRM
         4y768qWlDzmvJhLSqREaYUui+WYrgxAaAtWKOHZHxm400qFBLt3jQiJhyDM0cRj2xJkn
         T2BjmVR5eDgKUOgoyvHFP/0MhvHy/inHT2HKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMI94b/yAujS84g8LGbPIlO0F6a4sIjHraHl0xC9qbA=;
        b=kqocsg7jIq5HTEKgpU2oglEBBnWfx6vfFfKjSfrYAa7v6Enmzk9ebXy2PDYaE9pxkH
         TBZE2REyBtJSl8Savw941B7C2f7vBb91GV9SmGY5zEu6D10UPyHxf1gVnm+irIusNU2U
         qXrGob+zwZd0i0SZNmVqV9+eUU3HGuNkWRIPrmM2p/l0pz9E4fljdfHwwTW6NKaUrVtd
         RYSPS0oGSbVBE+Po7WuHOcwGmXl4I0iARaPk/y/eAUBDj+YxYIrdhc4z8Xd9GUO4cYV+
         +22Jj84cxXQHSBoDgVykx0RgpiLxyUOevj0+m0/4Gz533ISpNwrAZf5p5iNZ9qXqcCXh
         OWhQ==
X-Gm-Message-State: AOAM531cBAlAoJ1Maz1pI5g30jEIbMSW2T0LPDQl42kBR5kpM2UE1Dzk
        kJfp5a+Efb8gMt3WEcYyeslGqhOrK/iqmAg5+O0BhQ==
X-Google-Smtp-Source: ABdhPJxaTW+u+s1H+E8ZH+9vokchEDm3K3lC/3RDIg6F87zyZurnpOQ1SBHlrNPn0pFuECkb0RNA1ePDFrAYegdbiOg=
X-Received: by 2002:a17:903:185:b0:141:f5f3:dae with SMTP id
 z5-20020a170903018500b00141f5f30daemr63792446plg.56.1637217585625; Wed, 17
 Nov 2021 22:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20211103234018.4009771-1-briannorris@chromium.org>
 <20211103164002.2.Ie6c485320b35b89fd49e15a73f0a68e3bb49eef9@changeid>
 <CAKMK7uHGNrgqjQh3DX4gChpNt+xhB_39sVrhdA3BFqnoW-ue2w@mail.gmail.com> <CA+ASDXPtWsZRTUmrGQKY2Sc-yaeg=e47QpkYWA=KpN5iYGafjQ@mail.gmail.com>
In-Reply-To: <CA+ASDXPtWsZRTUmrGQKY2Sc-yaeg=e47QpkYWA=KpN5iYGafjQ@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 18 Nov 2021 07:39:34 +0100
Message-ID: <CAKMK7uHS0vhZDk4d4MyBr1fJGitosmPXB21pJq6992nRCBnkoQ@mail.gmail.com>
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
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 17, 2021 at 8:37 PM Brian Norris <briannorris@chromium.org> wrote:
>
> On Wed, Nov 17, 2021 at 11:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > Can you pls resend with dri-devel on cc? scripts/get_maintainers.pl
> > should pick this up, you have all the maintainers but not the list.
>
> Oops, I don't know how that happened. I guess I sometimes have to trim
> get_maintainer output, since it likes to hoover up a bunch of
> barely-relevant previous committers. I must have been too aggressive.
>
> I'll plan on sending v2 to dri-devel, but let me know (privately if
> you'd like) if you'd prefer a pure RESEND of v1.

Nah just for next version is fine, assuming you include all the
context in in-patch changelog and all that so new readers can catch
up.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
