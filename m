Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30CDF55CF88
	for <lists+linux-input@lfdr.de>; Tue, 28 Jun 2022 15:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbiF0WTc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jun 2022 18:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242565AbiF0WT1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jun 2022 18:19:27 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD440BC09;
        Mon, 27 Jun 2022 15:19:25 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id a15so10243593pfv.13;
        Mon, 27 Jun 2022 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Js963GkQFGBYqJooj5sPWY5KMH31s/v0z3qfinhDKlI=;
        b=DqUPnZzgzFYGuRR4m4rcXk5vl3B83pFzS9fXGG5CEEwklCEPUqLDRljPlFPT6UYLYl
         b1/w6NeRbIQ+vDQVX7pXMFgitRTb1DSbSg4DSf27DvLNg4pUCpcO4bmmxViHZqWWM36y
         t+Uxl5LvNtMDfkY5aqnsbkVFCYOxM/aOltFddN+CzFPTJajHg2vJhQJY3YOT2eD0cTsv
         Gyseed5ChKv4vVNxGrRGMLanpU3/W32VAGhgDv4nuh2gFo/fdOvkDJ1K2dwH50/S9IuI
         5iwU62kZOnJ5KKE90vrPC/1XsNfYqmrbS7HSR2Vl1nth3valG1MuyS74CWGPblMbPqnd
         T0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Js963GkQFGBYqJooj5sPWY5KMH31s/v0z3qfinhDKlI=;
        b=7qNrIY1sN/AwpK/9XrWC7fXe5Y7RCSuafrgbbSKT1IIyc+z5XwdxTjOwwsacwywZsx
         AI2kcexO8jh0ShnG33eqTQpWxpFhaoO7+LzYCmZ2f5Bmr9GnFt65P4/5reG0VFalKyT4
         L1YnP8aUmcMdLQ2dHUp1AypYo3tWYJea6TGMNC8PsjXwG/z+sgm+FPTdfToOIYEn90Hl
         khb1tg5vyRLL0PRMN6hnx+vFReV2GinjHrootxvreYIKBhoP0TGRVqOdMbbuSes7Bw0E
         OfKWM2QwE2tEobM1ILd9VMzTqpQMqRFvoJgLqYM9jrEu7rhD340u+D3dqfWVRYJdzPL6
         V2BQ==
X-Gm-Message-State: AJIora/o7cy0YjFOhqfeOBCgoSeU1ytFUsC5YYhimYntvPetsJKQG+EM
        e8MKmZWKI6zm45lMrL7q+9w6bojeYTY=
X-Google-Smtp-Source: AGRyM1sgta8Ia6+rSVDcXsgc1DqGCGSh4AqZKKk0qimpu4gvBQxDSNw3pPqITnXvq3709SzEov3M/Q==
X-Received: by 2002:a63:cd15:0:b0:411:51f0:eaf5 with SMTP id i21-20020a63cd15000000b0041151f0eaf5mr1911789pgg.189.1656368365151;
        Mon, 27 Jun 2022 15:19:25 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:8319:8d76:976e:108f])
        by smtp.gmail.com with ESMTPSA id m20-20020a170902c45400b0016a8010218bsm4077762plm.27.2022.06.27.15.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:19:24 -0700 (PDT)
Date:   Mon, 27 Jun 2022 15:19:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/9] Miscellaneous fixes for Azoteq IQS7222A/B/C
Message-ID: <YrosY/D/RPVLdTe5@google.com>
References: <20220626072412.475211-1-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220626072412.475211-1-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 26, 2022 at 02:24:03AM -0500, Jeff LaBundy wrote:
> This series comprises a handful of minor fixes that result from
> continued testing and updated guidance from the vendor.
> 
> Jeff LaBundy (9):
>   Input: iqs7222 - correct slider event disable logic
>   Input: iqs7222 - fortify slider event reporting
>   Input: iqs7222 - protect volatile registers
>   Input: iqs7222 - acknowledge reset before writing registers
>   Input: iqs7222 - handle reset during ATI
>   Input: iqs7222 - remove support for RF filter
>   dt-bindings: input: iqs7222: Remove support for RF filter
>   dt-bindings: input: iqs7222: Correct bottom speed step size
>   dt-bindings: input: iqs7222: Extend slider-mapped GPIO to IQS7222C
> 
>  .../bindings/input/azoteq,iqs7222.yaml        |  28 +--
>  drivers/input/misc/iqs7222.c                  | 178 ++++++++++++------
>  2 files changed, 130 insertions(+), 76 deletions(-)

Applied the lot, thank you.

-- 
Dmitry
