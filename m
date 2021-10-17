Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D02A4306A4
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 06:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244957AbhJQEcC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 00:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244942AbhJQEcB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 00:32:01 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD62FC061765;
        Sat, 16 Oct 2021 21:29:52 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id q10-20020a17090a1b0a00b001a076a59640so9197221pjq.0;
        Sat, 16 Oct 2021 21:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IYP6qbslTw2DcY6dxE/NBZSgY8DFSMmbbHftZ+ytovw=;
        b=B13b6TMqyRsDUsTN7EiMwXNAVQNb/I3oKHJAO41+DjpGbVVJOMEqpTrQkhFnua78Ty
         3EhwH9CTikd6sLp/nb3Y3mGxq4G7Dv8zlruPzwgHU+4LayVQEG57qAg3ZNBIezFQ2KBJ
         24tBZCl3YTjROQ/2OcIsFDBqqm+cA0sezH823e1UK5dzRrDmdppnJDZ5Mbbz3/gLpuzG
         O9tAPybiNdVjVdq/49ZQaxNmrcVuQOe3QwzBmQmYdlAxOb7wSE9SuFppBIy17Y+m5uS4
         IWFcsFr9mc+nPSmM2Vsp2yJ5U07Hk2QUX/+V7NVSBFc9YKuw6HVEq6Pvf/3UtItsq971
         RpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IYP6qbslTw2DcY6dxE/NBZSgY8DFSMmbbHftZ+ytovw=;
        b=d0c7pFyz/ZXUWdbhha9wdJdymFDMfjEr+8sYy92zDDkZtrPqIHXbUx1keD0ygL74Hb
         Jmnqma2IOcya1x7D4o7U1AOHC/jkzRLXlgeEo7/Kpyhn7dSOKehzL4ZFsGPf7O7rCjrI
         DSUHbCRy44veCcJkC0FYtNTMhdtGEfXqHwaQLkoOugPtrsiIFWtM+slEK6Inx10RxR2G
         Sehys61cOJPMdCH8+i+qN/87HVaIY3UxgbJXSJbICfX34YNsPW3V9xnE89NDkWVIoeq5
         WOXQ0r+MsDZtxYlu+AdsxwPJNvq7NTyaFq57tS5KSt6dBVUS+L6Nv60XQwixr64HF7uN
         TpQQ==
X-Gm-Message-State: AOAM533ZNwiM3eDbBPCdFr22Q7Ltn8Kqv5DNLdBVnWnd4pvtR2WxXpy/
        9M5q4ZMRwfnsQmo1bMfFF8M=
X-Google-Smtp-Source: ABdhPJwszCcJ7l32J2XfHjBckJxCLGxY1qJ/JColDPntXtcMXWhWnku+37nfNjI8tLNIzOhpBN8GiQ==
X-Received: by 2002:a17:902:64d6:b0:13e:a59e:332c with SMTP id y22-20020a17090264d600b0013ea59e332cmr19650402pli.30.1634444992189;
        Sat, 16 Oct 2021 21:29:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:e49a:151f:b7d7:af9a])
        by smtp.gmail.com with ESMTPSA id oc8sm9299237pjb.15.2021.10.16.21.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 21:29:51 -0700 (PDT)
Date:   Sat, 16 Oct 2021 21:29:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Warm reset support for pm8941-pwrkey
Message-ID: <YWumvKznZAS4U6Le@google.com>
References: <20210714095850.27185-1-shawn.guo@linaro.org>
 <20210824030058.GC22595@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824030058.GC22595@dragon>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 24, 2021 at 11:00:59AM +0800, Shawn Guo wrote:
> On Wed, Jul 14, 2021 at 05:58:47PM +0800, Shawn Guo wrote:
> > It adds warm reset support for pm8941-pwrkey driver.
> > 
> > Changes for v2:
> > - Export symbol 'reboot_mode' to fix the build error with pm8941-pwrkey
> >   being module.  (Thanks Luca Weiss for reporting)
> > 
> > Shawn Guo (2):
> >   reboot: Export symbol 'reboot_mode'
> >   Input: pm8941-pwrkey - Respect reboot_mode for warm reset
> > 
> >  drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
> >  kernel/reboot.c                    | 1 +
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> Hi Dmitry,
> 
> Any comments on these patches?

Sorry, I was waiting to see if there would be objections to exporting
reboot_mode symbol. Both are applied now.

Thanks.

-- 
Dmitry
