Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0BB835F9C0
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 19:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350259AbhDNR0j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 13:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236853AbhDNR0j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 13:26:39 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBE2C061574;
        Wed, 14 Apr 2021 10:26:16 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id t22so14947504pgu.0;
        Wed, 14 Apr 2021 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ENw6at9UPM7TIsMZCmLs5WK9osDBZ10p5WwyludzJWY=;
        b=bAgRjY5e5WlvPla0VEZonDBt+P0P1u5ndPiFV0IJGPCy9tTQ8nNmOuJk75XwFQ2h8y
         x1rtdn1R62VhRYlab3Yj+XUEZZWurh9aHMo/9kYa1+lqWvcrKX4mk5i1AH4T8XXeSF9V
         KGNYAMgvkeh7ehZ3jhLv/H0YR4glXAt9G7+2ZJSqH5ptF4aoUtfxGyitvDiqwZ8LiFeA
         0vBf+C+x5GR7sQ5hj1BVWSAfY8vbIjfEbwscb7SHvNP82vp1XlBiJiHtk0lskz+88TAS
         me7QF5xHSBo8qMW+mW1VySa7CiMlxOzkm0uVYopJAKYYBiD0t1E48Y1cbxQGvYeLqkM5
         dYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ENw6at9UPM7TIsMZCmLs5WK9osDBZ10p5WwyludzJWY=;
        b=YFipp4hAOQVRTBJ4cwMX66V4n1baTe02PWODs3qmUjZkRZ3C38cdQxyFCODFGAc8+M
         +fvE+Nb6PGNJBN13ARXh3T8QgpjoSmz1C5Tqht40lL0IZbHDFM5ZWQuFc0s8EV+pzs//
         L57eAApXnidL367n55gTCreNGV2psfzaY3w+bDl+n2lt9HTpKH3X2kdnex23fR55P6Ak
         jYOOQxQ7R0voPqnZD0QWTDPNcC/8kGgy370vgso5JHrlbrHRpA+h9JpSXa9be+hUTz84
         WDU6uRRZZRi6+yui1VSUv8aUVxGBrBFeh1ZzBFq9xnUo2yS+IazpxMPCUIOOD1wu2j09
         js3Q==
X-Gm-Message-State: AOAM5324TpiPNuK0zUQIjp4gir6HeOTAYJrH3n490agCfvGvk4+tikI9
        bx3cJEO6vcylF+A4t2Dmkrs=
X-Google-Smtp-Source: ABdhPJwTAnIaUtZOn8jngQq/9Lm5K49Y9S7QIDxP42wQwzSqCLPxNBWPu7z38Lq7eg0VFdOn6foHEg==
X-Received: by 2002:a65:4548:: with SMTP id x8mr30485476pgr.413.1618421176389;
        Wed, 14 Apr 2021 10:26:16 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c22:82af:e208:38f6])
        by smtp.gmail.com with ESMTPSA id s13sm38329pjl.48.2021.04.14.10.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:26:15 -0700 (PDT)
Date:   Wed, 14 Apr 2021 10:26:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Peter Hutterer <peter.hutterer@who-t.net>,
        Rob Herring <robh@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] Input: add driver for the Hycon HY46XX touchpanel
 series
Message-ID: <YHcltT7HkJoXrX0f@google.com>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-4-giulio.benetti@benettiengineering.com>
 <YHaBJ6MX9c28MUQY@google.com>
 <YHaP1Fzsi5pSaEq3@koala>
 <080a71d9-d629-5589-c943-4e65a7f414d8@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <080a71d9-d629-5589-c943-4e65a7f414d8@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Giulio, Peter,

On Wed, Apr 14, 2021 at 01:22:55PM +0200, Giulio Benetti wrote:
> Hi Peter, Dmitry,
> 
> On 4/14/21 8:46 AM, Peter Hutterer wrote:
> > On Tue, Apr 13, 2021 at 10:44:07PM -0700, Dmitry Torokhov wrote:
> > > Hi Giulio,
> > > 
> > > On Tue, Apr 13, 2021 at 04:44:46PM +0200, Giulio Benetti wrote:
> > > > +
> > > > +	input_mt_report_pointer_emulation(tsdata->input, true);
> > > 
> > > For touchscreens it does not make much sense to report BTN_DOUBLETAP,
> > > BTN_TRIPLETAP, etc, events (they are really for touchpads), so I changed
> > > this to
> > > 
> > > 	input_mt_report_pointer_emulation(tsdata->input, false);
> > > 
> > > to only report ABS_X, ABS_Y, and BTN_TOUCH, and applied.
> > 
> > Can you expand on this please, just to make sure I'm not misinterpreting
> > those codes? Those bits are just for how many fingers are down (but without
> > position), dropping those bits means you restrict the device to a pure
> > single-touch screen. Or am I missing something here?

They are indeed represent number of fingers on the surface. I think I
over-simplified this a bit by saying these events are only for
touchpads, as there is allowance for BTN_TOOL_*TAP in
Documentation/input/multi-touch-protocol.rst for MT devices that may
report more contacts than what they can distinctly track, and it is
not restricted to touchpads (but I believe in reality only used by a
couple of "semi-MT" touchpad drivers).

What I meant to say that for ST fallback of MT-capable devices we
typically provide BTN_TOOL_*TAP for devices declared as INPUT_MT_POINTER
(which is touchpads) and for INPUT_MT_DIRECT and others we only provide
ABS_X, ABS_Y, ABS_PRESSURE and BTN_TOUCH (see input_mt_sync_frame()),
and I think this driver should follow the suit.

> 
> I've re-tested the driver after setting input_mt_report_pointer_emulation()
> use_count to false. It works correctly with all touch points expected. That
> use_count refers to finger count of Touchpad[1]. Also you can see that even
> with use_count=false this for loop[2] is entered by counting all the
> mt->slots and then input_event() reports all of them.

That is not quite true. The loop in question locates the oldest contact
still on the surface and MT->ST mapping uses it as the "primary" point
for ST events. It is reported in addition to sending all contacts via MT
protocol as ABS_MT_SLOT, ABS_MT_POSITION_X, ABS_MT_POSITION_Y, ...

> 
> I hope I've understood correctly :-)
> 
> [1]: https://elixir.bootlin.com/linux/v5.12-rc7/source/drivers/input/input-mt.c#L190
> [2]: https://elixir.bootlin.com/linux/v5.12-rc7/source/drivers/input/input-mt.c#L208
> 
> > then again, MT support has been in the kernel for long enough that by now
> > everything should understand it, so there's a certain "meh" factor.

Yeah, there is that too.

Thanks.

-- 
Dmitry
