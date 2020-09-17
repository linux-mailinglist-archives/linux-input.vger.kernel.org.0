Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD16126CFD6
	for <lists+linux-input@lfdr.de>; Thu, 17 Sep 2020 02:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgIQAM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 20:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgIQAM7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 20:12:59 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5AEC06178C;
        Wed, 16 Sep 2020 17:03:34 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w7so68795pfi.4;
        Wed, 16 Sep 2020 17:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WDzQsVS9IxLNF3a+IIFjupoxMQ40am4ig/tBs3wzfu4=;
        b=kEwlFG2m5pCDaYGbbtTtnYIyYqO1ztsPI09BZ1U5X1UfrDPbOeQrg0TXNGP4/LsuMM
         imdSTTSQ7Ec7QkJm8tFV3FAmroMAZD5axt4FpFTv0ZXo3MgD1H4x6cYm1lW/t1o6V88X
         qOVn5izr6Ro566Mzpcg80cJguAXEINXS3fF/rB9xKCzyUvKsTxAHTZUd6Dht15a9fIQ2
         xQjLwmP9bWijjMJrUl37qOccxiR44ODLbsN4vaDiZFzWy4Pp2k+jann0ZL4SceqaLtsm
         8x3PIVXo42qniJJqUrdQKk+zas5DuGgyR6x1sTC++3bVhv8QX8e/dv8fu/tfpArKP718
         Mkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WDzQsVS9IxLNF3a+IIFjupoxMQ40am4ig/tBs3wzfu4=;
        b=G/mFzpbURKWJi02b1Kx7srD3Msv2BF3UPMFlwdWzlzZfxFTFJKM0yN8jeIOOibfu4A
         Ry7RRZYCQNuR4fwGsvoaDZGc67EL1HPq5GBM8Mt81h6KXP+S0Ltxj7nlG463rKpyVf8C
         aw7qVOtN38Td11Gdiba6tvFlFbU5wm4YLennM92PAAr2dU+2Q4oyHm8l4Y6XpEr7/c0T
         0glkn2QtZ3K/SHPtcfhzlrx1sJIjOhJRuerC7wNzpRQkCetgmUIi4RgJOJ6k2LJQfiLF
         T8KyRLTgmhVDs9wStZEP9heFz49pMNLaMh1YPpvmQQoOGDeBSYoqPWAStRWZODaL+k7a
         dVag==
X-Gm-Message-State: AOAM533Y+vgHBKVJzpAvxpnN/gNwM5wydUMgdhDNtooGZqIKZJZtRMQz
        cs286oBFMsgAzr+whfK/wd4=
X-Google-Smtp-Source: ABdhPJxepajcywx1ktmFwK416v92g15gvuSqTod09R8Me1XPElkUaNL/SnecEbQpdetmhlVCNNZAIw==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr19647881pgh.201.1600301014308;
        Wed, 16 Sep 2020 17:03:34 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s22sm19372865pfd.90.2020.09.16.17.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 17:03:32 -0700 (PDT)
Date:   Wed, 16 Sep 2020 17:03:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RESEND 5/5] input: iqs269a: Make sliders two-dimensional
Message-ID: <20200917000329.GM1681290@dtor-ws>
References: <1600289400-27632-1-git-send-email-jeff@labundy.com>
 <1600289400-27632-6-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600289400-27632-6-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 16, 2020 at 03:50:00PM -0500, Jeff LaBundy wrote:
> libinput rejects devices that define one axis without the orthogonal
> axis, as well as devices for which either axis's resolution is zero.
> 
> To solve this problem, present a thin y-axis with a resolution equal
> to one.

No, let's fix this in libinput please.

> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  drivers/input/misc/iqs269a.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index 04947f1..4a0e4ec 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -1377,6 +1377,8 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
>  					     EV_KEY, BTN_TOUCH);
>  			input_set_abs_params(iqs269->slider[i],
>  					     ABS_X, 0, 255, 0, 0);
> +			input_set_abs_params(iqs269->slider[i],
> +					     ABS_Y, 0, 1, 0, 0);
>  		}
>  
>  		error = input_register_device(iqs269->slider[i]);
> -- 
> 2.7.4
> 

Thanks.

-- 
Dmitry
