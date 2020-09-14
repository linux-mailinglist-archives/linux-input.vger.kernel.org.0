Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4EC26940B
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 19:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgINRuO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 13:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgINRtz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 13:49:55 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8380EC061788;
        Mon, 14 Sep 2020 10:49:55 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t14so372418pgl.10;
        Mon, 14 Sep 2020 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Map+hm2luK4joxy1or88ltvi/Ll/0Bex60j+geeyBLM=;
        b=rAL60idqBmAdAU5u8tD/4tuKn2B3trS7TGM6fT2VpIlmDWRfm9Icp5CBSRyaRVSvVt
         WZN7bldIbq+pgMAY02dYPUvY/ZGrFVjrEz3jFFevhjExL/Eeg3Gw/I2mSUmGbVwKvZZM
         G5bNhIolqCa+UKKWKY9Di6Zv3TVrVBGtTLhli471I2OjFuIYjQknA9297F3BvgQ1gQHx
         YSDCtkJCGijtp6mH/fNQs2G0cRxCa8x0D83dhnadcl0X5fSssmhVGZGFpQqMdkrHEHqW
         N62dlG/uzbqEqoECzJ7HfUFykB/sRHhonE5xs1xcLWaI5wm7cWoqojXnu6SpcP4Ir1Zf
         yG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Map+hm2luK4joxy1or88ltvi/Ll/0Bex60j+geeyBLM=;
        b=ZKrK6nlPVgZpiTHDs8Wg1BIttuLt6wiEs2NuDLVTFHLOuHj4byEzyolU7hRCaxckpU
         NU9jfh71Lz0WOlTZjBw2I2ruJeyhNAcHQkQg7vn57sN92+ivg0IZtpG3KaS+A8pHSq0Y
         RqSkshizpBUO4ZmrMRYrIS7A0BTp2Fp9EXZHSYpJNeGEOH/wwvQg6Bpytkkt+PV5LCyz
         /znpyb7LWJfSdUKiVXqdJveW3Ikenim78k8Xb4tyYDVLCZw/q7jcMzV8m/aeKA+m6fib
         4EPMq8UusmJErOunyOjdylT/8NqAYQJqTa0Kb+CryvPCWRmXZBILHWoR66QX+I4d188k
         PEaA==
X-Gm-Message-State: AOAM530JA00sJ0YrWJUsWluewqGqup/cmIp+VKJrmuX4ikcrC8TE1AlX
        4ofnKdBazQ6lRlEyyCs1FNc=
X-Google-Smtp-Source: ABdhPJyaSVBbXWUkEKOBMcqJRJ3PpFBWtpe9G2HDyRT0YjNatLpEx9rszU23NeAN/Nl5i6v1lrCLqg==
X-Received: by 2002:a17:902:8548:b029:d0:cbe1:e70b with SMTP id d8-20020a1709028548b02900d0cbe1e70bmr15473944plo.25.1600105795009;
        Mon, 14 Sep 2020 10:49:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id c1sm4855788pfj.219.2020.09.14.10.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 10:49:54 -0700 (PDT)
Date:   Mon, 14 Sep 2020 10:49:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: imx6ul_tsc - clean up some errors in
 imx6ul_tsc_resume()
Message-ID: <20200914174952.GS1665100@dtor-ws>
References: <20200905124942.GC183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200905124942.GC183976@mwanda>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 05, 2020 at 03:49:42PM +0300, Dan Carpenter wrote:
> If imx6ul_tsc_init() fails then we need to clean up the clocks.
> 
> I reversed the "if (input_dev->users) {" condition to make the code a
> bit simpler.
> 
> Fixes: 6cc527b05847 ("Input: imx6ul_tsc - propagate the errors")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

There is also an opportunity to factor out some common code from
open/close and suspend/resume, I'll send out a patch in a moment.

Thanks.

-- 
Dmitry
