Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B722A9088
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 08:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgKFHkZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 02:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgKFHkY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Nov 2020 02:40:24 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9462FC0613CF
        for <linux-input@vger.kernel.org>; Thu,  5 Nov 2020 23:40:24 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c16so408603wmd.2
        for <linux-input@vger.kernel.org>; Thu, 05 Nov 2020 23:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=H/jQSiN2tGpCWcggCP9FyM2wQIVjYqAJtGxJOUgHLEY=;
        b=F7PEVrKf0rmG4ZgcbfXfewpMxLW9AzkfZdAGllK3MEI6yhABDPOknypwCvViiKILZE
         Q5ElUziTMlO1kg5hRu/mTMqPflOy1ywcdRlQcJ6M9Wsg39buUWwGtiHd/WG5b7S/jkGS
         KkbfC77NXkleedZvZGl1u5nekFTz0mclOavxh1HOIWRcxTtvH2JA0cbv0mGTZSDwSSA8
         LyOh9k0qhgs0uk8QWnJ30Xd2BVZU3BtWs9UX5JyB1jyUft6H6zbbzHhXfrjWwud2+HtA
         /CsfFKawMCyBA8NoivKUGa8rNX7YpuTSn8m9utrXXG5Me6xR/HF82v9HnGe+1MP+4i3M
         NWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H/jQSiN2tGpCWcggCP9FyM2wQIVjYqAJtGxJOUgHLEY=;
        b=Gi8KJ6L1PCY+hgoXDfMiVOyB0f/dh6S3N6WVLEIpwATnnaMK/he2WkGwshTPn2nrqc
         UWL4tZvWJO49tzAdr2qUe0StBc2ZZR3Hr/bQzpAcbYiNy6Zcmu3OLTqtAAZopYN3HyIE
         Xid9W/LIAZWMlnrMKDcNH3g3o14ZUmKtSLOh2tCTQbULXYJ0TVdtPsNOVvi6j2r3jYYV
         xW/5von3yd2aukBAemSCLF4C2Wqz33rCgZiUHd2IB/s9FPPjyPAfMNIB9IN+Su3jDSxu
         AlvKANXrCRdyt3O3pjKX+S7AmNcIToJ2iMNZJvc8aPx4L1En9361npADchg+YAe0kDaZ
         PpGQ==
X-Gm-Message-State: AOAM530ehUGpzMBS0hbYSsr3Iin9oArMjo7uLhp0bL7eUufGttmf6iGO
        gKXKydJeVt7SezJG0zB9mfD4zZL0NcCfWT0Y
X-Google-Smtp-Source: ABdhPJxFK6IJdXXPNiq9kY9ys2Eug4k/Ug5hzS0gXVUQavIqwq02s49Lrze0b3JXpQxIHPBq/GhiJw==
X-Received: by 2002:a1c:a982:: with SMTP id s124mr973561wme.65.1604648423307;
        Thu, 05 Nov 2020 23:40:23 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id a12sm746580wrr.31.2020.11.05.23.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 23:40:22 -0800 (PST)
Date:   Fri, 6 Nov 2020 07:40:20 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     joe@perches.com, linux-kernel@vger.kernel.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Peter Osterlund <petero2@telia.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Bruce Kalk <kall@compass.com>,
        this to <linux-input@vger.kernel.org>
Subject: Re: [PATCH 10/20] input: mouse: synaptics: Place braces around empty
 if() body
Message-ID: <20201106074020.GT4488@dell>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-11-lee.jones@linaro.org>
 <20201106072630.GD1003057@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201106072630.GD1003057@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 05 Nov 2020, Dmitry Torokhov wrote:

> Hi Lee,
> 
> On Wed, Nov 04, 2020 at 04:24:17PM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/input/mouse/synaptics.c: In function ‘synaptics_process_packet’:
> >  drivers/input/mouse/synaptics.c:1110:6: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
> > 
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > Cc: Peter Osterlund <petero2@telia.com>
> > Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
> > Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
> > Cc: Bruce Kalk <kall@compass.com>
> > Cc: this to <linux-input@vger.kernel.org>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/input/mouse/synaptics.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> > index 82577095e175e..07835939d83b9 100644
> > --- a/drivers/input/mouse/synaptics.c
> > +++ b/drivers/input/mouse/synaptics.c
> > @@ -1106,8 +1106,9 @@ static void synaptics_process_packet(struct psmouse *psmouse)
> >  					num_fingers = hw.w + 2;
> >  				break;
> >  			case 2:
> > -				if (SYN_MODEL_PEN(info->model_id))
> > +				if (SYN_MODEL_PEN(info->model_id)) {
> >  					;   /* Nothing, treat a pen as a single finger */
> > +				}
> 
> This gives me:
> 
> WARNING: braces {} are not necessary for single statement blocks
> 
> from checkpatch.

Yes, because checkpatch just sees it as a normal single statement,
rather than an empty one.  It complains about macros that can be
compiled out too, which is even more dangerous.

GCC wins this one though, as it *knows* it's an empty statement.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
