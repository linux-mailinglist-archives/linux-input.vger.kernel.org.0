Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A53446B17
	for <lists+linux-input@lfdr.de>; Sat,  6 Nov 2021 00:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhKEXHI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 19:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhKEXHH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 19:07:07 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BF4C061570;
        Fri,  5 Nov 2021 16:04:27 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id t11so11910970plq.11;
        Fri, 05 Nov 2021 16:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mLpj0IWmQy+qHP6id8yi4q2C/7CSHG0Ef5TY0V38uHo=;
        b=gGnuyysLOjn74YheWLVOOvB91aEDyv98a5sjftQC6Q+xFJi7KlA5ry6s5GpNLCbD0i
         UklDrKpPtmTRk734CRE21u1TEvGwSalDHrGdYOBinXcemCjF3R1o1d5isaqQGzEbmsb9
         adEnVYojuNOUvXMOGz/hNrbzIVTM3oiUo00x19scAPafqpW1J1hx/weOcIj1TpWiMpoJ
         tHCDhFFffImJHP+24so2WY1qSkgE747iS64fDG1FOPLzi+C85vI5E2ZEs0craW3qcaIv
         VNROOWbkjbrbzuFxDfOLMFQ7BYLskN7K/0asQCb3eawbdy4LWX2m9hdgRqCwQ/gdkCqf
         1XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mLpj0IWmQy+qHP6id8yi4q2C/7CSHG0Ef5TY0V38uHo=;
        b=7LRqYzzdIFcFuVFEjuxIQvVFngx8ogUYWibXUizZU24inaL9gPEVctZQ5kKmhFsXz3
         DOPFLSZRKoO88/URLZfHOhB+iROvmNzDOf8nh9FE8i7M5DBL7P2gg7mT52hHDIFLdjkr
         N11mf3VF/PYRF7NLoS7ffe0wWlawxWD6Dg4ihUyUuONDdeKzQtXvAsjP4vIX0GF0AMxr
         2EFyEWDDZHv/gnnQpxqDUfYiuH7SjsXyltDxPjwKAUcwixXUv+oqxlDZt8xQpGK+9y0L
         6DTS3bonzjjc1p1xhVjipQ+ZSZNEFkGMxW4mq7yPs5kB0ypwUAgi+mOYrsXBp42DzwQZ
         HieQ==
X-Gm-Message-State: AOAM533gIJNIYokT2XjTmzF4UDwZCiPa9T6jQ5DKki6dG7eY+9ZvbcJ4
        bGUCqh4dVJzahqIbrBI8TGc=
X-Google-Smtp-Source: ABdhPJztZtaqlyNPm8X9iqeNAYQv3RY5G3wWepW3L3TyqzB3tjQRdBWkhvx3sLhA1A2JKTB9jauHHQ==
X-Received: by 2002:a17:90b:1241:: with SMTP id gx1mr33623659pjb.164.1636153467201;
        Fri, 05 Nov 2021 16:04:27 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:837c:e765:475f:22d3])
        by smtp.gmail.com with ESMTPSA id c5sm3757408pjm.52.2021.11.05.16.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 16:04:25 -0700 (PDT)
Date:   Fri, 5 Nov 2021 16:04:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-input@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wu Hao <hao.wu@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Ertman <david.m.ertman@intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Xu Yilun <yilun.xu@intel.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Input: add 'safe' user switch codes
Message-ID: <YYW4d/YK1MkIfGT/@google.com>
References: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com>
 <20211105170037.GA65511@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105170037.GA65511@nixie71>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff, Kieran,

On Fri, Nov 05, 2021 at 12:00:37PM -0500, Jeff LaBundy wrote:
> Hi Kieran,
> 
> On Fri, Nov 05, 2021 at 10:35:07AM +0000, Kieran Bingham wrote:
> > All existing SW input codes define an action which can be interpreted by
> > a user environment to adapt to the condition of the switch.
> > 
> > For example, switches to define the audio mute, will prevent audio
> > playback, and switches to indicate lid and covers being closed may
> > disable displays.
> > 
> > Many evaluation platforms provide switches which can be connected to the
> > input system but associating these to an action incorrectly could
> > provide inconsistent end user experiences due to unmarked switch
> > positions.
> > 
> > Define two custom user defined switches allowing hardware descriptions
> > to be created whereby the position of the switch is not interpreted as
> > any standard condition that will affect a user experience.
> > 
> > This allows wiring up custom generic switches in a way that will allow
> > them to be read and processed, without incurring undesired or otherwise
> > undocumented (by the hardware) 'default' behaviours.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > 
> > Sigh, a compile test might have at least saved the buildbots the trouble
> > of notifying me I also need to update the INPUT_DEVICE_ID_SW_MAX. But
> > even so - I'm really looking for a discussion on the best ways to
> > describe a non-defined switch in device tree.
> > 
> > Here's a compiling v2 ;-) But the real questions are :
> > 
> >  - Should an existing feature switch be used for generic switches?
> >  - Should we even have a 'user' defined switch?
> >  - If we add user switches, how many?
> > 
> 
> This is merely my opinion, but if a hardware switch does not have a defined
> purpose, it does not seem necessary to represent it with an input device.

Yes, exactly. For input core we are trying to avoid generic events with
no defined meaning.

What are these switches? GPIOs? Maybe it would be better to use GPIO
layer to test the state for them?

Thanks.

-- 
Dmitry
