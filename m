Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B10943069B
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 06:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244932AbhJQEap (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 00:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbhJQEao (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 00:30:44 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C1AC061765;
        Sat, 16 Oct 2021 21:28:35 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id o133so11985569pfg.7;
        Sat, 16 Oct 2021 21:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=skcWmsGhkUF1xH1dCjfxAdJy8Z1FOllaUJj4g1xQv/A=;
        b=HBATO/U51x+CfN3FRY6C4J0uP/TyRUwp8ThA12jS1E/W+mveGbMmoS9Oj8CUS8aCJW
         TCv0ClDRx8dvdvZt7dACTHvwORasqy76RUJCrSc/KVJI9xIRJPXRsD/b4sdKfqssy59o
         7k2IuB3HJWyEDFEOHHItTiPl0LZr40bnO1dmcHvZXazE9BXuNTt+XE5brmfbU+uo/7qx
         WEI5sz+KC5aX6Bt+ZiGUnHl9Fu90gWH0ZXJZnDHT8Lu9TFpE3owpMxCp2waYpc6j5GVg
         gvNRooZmziPHhqMWM4EGoFAMDEO0eabZJdkRDLPqUFB3kUcktuvtwcSN/laokb6FeTPx
         pnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=skcWmsGhkUF1xH1dCjfxAdJy8Z1FOllaUJj4g1xQv/A=;
        b=MGeLpuvGYdgtdt/12rE1jZmwbVELQZNvYG3YKq2Z+e6jCPpD1X6Kx/tNC9yoVCq3tE
         GYNEfC2sSYDwLGUMwNHDdWxADvA2ujRFDsQ3Y6VP/c6SrRjI8VrGEF2jW/JDy56zq8Sw
         gCFXFPUwfwwhPGrkn6PiuLT8pvNC25Xxg8kYd9rGNPtTarelpQvogfLL/RjMwE+ZCdBi
         LX64+K+W7+Mc7n2uCzZfBSGoWFv7iVB78rxQmwrYfHDenPAlQQc5IYHTx4SFtqfn0g9C
         NJOVmotnW44qNruHj2btPP8RE81sid1//VEUDL+7aSb67BT61ZWEdG3EzvNoDaLZYZRi
         v4AA==
X-Gm-Message-State: AOAM533/wic3+6j2lwen5ysDhDA5wMQU/DNGL0TRayhCgH4F5JFiRKnS
        eBM0bLeQJVOQ6ywx+Vmw6UY=
X-Google-Smtp-Source: ABdhPJzjJxwe3IS6LFpW8ey83S4WRElk/D67yNB84IESVrkLwFVYVGzawiB4Iuu9L5MN6S2wqktJiQ==
X-Received: by 2002:a05:6a00:2389:b0:44d:6d57:a38e with SMTP id f9-20020a056a00238900b0044d6d57a38emr21300745pfc.50.1634444914579;
        Sat, 16 Oct 2021 21:28:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:e49a:151f:b7d7:af9a])
        by smtp.gmail.com with ESMTPSA id o127sm9041327pfb.216.2021.10.16.21.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 21:28:33 -0700 (PDT)
Date:   Sat, 16 Oct 2021 21:28:31 -0700
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
Subject: Re: [PATCH v2 1/2] reboot: Export symbol 'reboot_mode'
Message-ID: <YWumb+KpYVJVVdQE@google.com>
References: <20210714095850.27185-1-shawn.guo@linaro.org>
 <20210714095850.27185-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714095850.27185-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 14, 2021 at 05:58:48PM +0800, Shawn Guo wrote:
> Some drivers like Qualcomm pm8941-pwrkey need to access 'reboot_mode'
> for triggering reboot between cold and warm mode.  Export the symbol, so
> that drivers built as module can still access the symbol.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Applied, thank you.

-- 
Dmitry
