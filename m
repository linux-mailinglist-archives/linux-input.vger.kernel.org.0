Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE5F2BA3C3
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 08:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgKTHpJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 02:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbgKTHpJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 02:45:09 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C95AC0617A7
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 23:45:07 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a3so8916726wmb.5
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 23:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Z9uaGnpUQ8pBqUtPqF5fSNca/bGB1zgM7fyqtPcZ/hw=;
        b=gDUlahM4GabwQzUAcGb61i5C3Sy/O0K+Y3PZDYbm2unT4oumpKXaY+OH3cgKd73i9L
         uQlsZos0DLnC+vCHtUm6D1Y1Qu6/CDon94zTy7uJ/gdNB+5aAgHovMB/uzWzGf3e9Iwr
         0FNHuGLEtrHttJNjauHrge+hB87FLcj9A3i1AQ2ye2jHXVqeBh3D+GkquP6e26LengIx
         /fiWD/TML0OY6QCthoWHA7Spts09OJXV8JLjOs8/7MAyTg5uEfKC5lwvf9hZI0HFGVcb
         Ok9QJO8epSD9QH+QyeXU8NX5JbCyXCKj0esA9/dTea5Lheww3vZn0bTGMUNJcY2LihIt
         4jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Z9uaGnpUQ8pBqUtPqF5fSNca/bGB1zgM7fyqtPcZ/hw=;
        b=WakE8i+NCSmodPX/yK/Ym7aZ1WP54aWQOiDvMlseBcHMvMLI+k3GRoGhF0OuH9Le5O
         1eyPNV/L2jxXHkKMYhrgiOzUUGcWI1t9qsT0nnD9BXYdPc62VChBPT5Tnq3CEvN0wK+Z
         +2xI6UzfIgVDmnNb7c9yIZ2N8f90VZhZ1ckQ4moZcd08nM+jxwtWbpQc8+9XcIYovefh
         hkld+wu64ZTPklmPeLpQUhds0ZqTv18xCoEgxa2Wm3hzPkGP1FohWwgvZf0I7a8HE4xi
         GHGwBuCIh0ACJ42ToytAmX/hqWFtf8otKl+Dpewt57xWTAWQRNIiaCSRieIeqZQniFsa
         gW9A==
X-Gm-Message-State: AOAM531KnHff2Y236Idt+KM435mnGce+HXdpJv/r74LToinDBKMXF4k2
        0N/HEwFB9Q7gUsWBWFnBQz9g2A==
X-Google-Smtp-Source: ABdhPJwM+yLEfbeeQ01pZWCzh27uIUNFxZBVRDlxBaLtBLXPYRe09Zrx4Yu184Q0coDtBeXHmXSdeQ==
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr8648338wmh.110.1605858306014;
        Thu, 19 Nov 2020 23:45:06 -0800 (PST)
Received: from dell ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id f18sm3848853wru.42.2020.11.19.23.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 23:45:05 -0800 (PST)
Date:   Fri, 20 Nov 2020 07:45:02 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 06/15] input: touchscreen: melfas_mip4: Remove a bunch of
 unused variables
Message-ID: <20201120074502.GZ1869941@dell>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-7-lee.jones@linaro.org>
 <20201113074202.GJ356503@dtor-ws>
 <20201113075525.GH2787115@dell>
 <20201120030901.GJ2034289@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201120030901.GJ2034289@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 19 Nov 2020, Dmitry Torokhov wrote:

> On Fri, Nov 13, 2020 at 07:55:25AM +0000, Lee Jones wrote:
> > On Thu, 12 Nov 2020, Dmitry Torokhov wrote:
> > 
> > > On Thu, Nov 12, 2020 at 11:01:55AM +0000, Lee Jones wrote:
> > > > Fixes the following W=1 kernel build warning(s):
> > > > 
> > > >  drivers/input/touchscreen/melfas_mip4.c: In function ‘mip4_report_touch’:
> > > >  drivers/input/touchscreen/melfas_mip4.c:474:5: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
> > > >  drivers/input/touchscreen/melfas_mip4.c:472:5: warning: variable ‘pressure_stage’ set but not used [-Wunused-but-set-variable]
> > > >  drivers/input/touchscreen/melfas_mip4.c:469:7: warning: variable ‘palm’ set but not used [-Wunused-but-set-variable]
> > > >  drivers/input/touchscreen/melfas_mip4.c:468:7: warning: variable ‘hover’ set but not used [-Wunused-but-set-variable]
> > > > 
> > > > Cc: Sangwon Jee <jeesw@melfas.com>
> > > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > > > Cc: linux-input@vger.kernel.org
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  drivers/input/touchscreen/melfas_mip4.c | 11 -----------
> > > >  1 file changed, 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> > > > index f67efdd040b24..9c98759098c7a 100644
> > > > --- a/drivers/input/touchscreen/melfas_mip4.c
> > > > +++ b/drivers/input/touchscreen/melfas_mip4.c
> > > > @@ -465,13 +465,9 @@ static void mip4_report_keys(struct mip4_ts *ts, u8 *packet)
> > > >  static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
> > > >  {
> > > >  	int id;
> > > > -	bool hover;
> > > > -	bool palm;
> > > >  	bool state;
> > > >  	u16 x, y;
> > > > -	u8 pressure_stage = 0;
> > > >  	u8 pressure;
> > > > -	u8 size;
> > > >  	u8 touch_major;
> > > >  	u8 touch_minor;
> > > >  
> > > > @@ -480,14 +476,11 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
> > > >  	case 1:
> > > >  		/* Touch only */
> > > >  		state = packet[0] & BIT(7);
> > > > -		hover = packet[0] & BIT(5);
> > > > -		palm = packet[0] & BIT(4);
> > > 
> > > No really happy that we'd be losing information about protocol. Is there
> > > a better way to suppress the warning while keeping this info?
> > 
> > Yes.  We can either convert the information to comments, or mark the
> > variables as __always_unused.
> 
> If __always unused suppresses this warning that would be my preference.

No problem.  Will fix.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
