Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B6F3664ED
	for <lists+linux-input@lfdr.de>; Wed, 21 Apr 2021 07:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234769AbhDUFky (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Apr 2021 01:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhDUFky (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Apr 2021 01:40:54 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE08C06174A;
        Tue, 20 Apr 2021 22:40:16 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id m11so27634547pfc.11;
        Tue, 20 Apr 2021 22:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aUxV9oqSLPy9HKavz/QVvpqmIE694AU46J2T27SMTto=;
        b=owapy1xbSmL57RWvVc74stEAJTEEOrF3/mKK/rJWc5jAhlhhMCRb+gIjXFtDv4fGEw
         B+MikSCMzaXqR4osLHySb8FMZN2mCDv9U1S6nc3dbIEvgItIwEnFAaCuUj2Y3LhDKS40
         SJ1qBPmnwW9Ny6PTDcwIoxLVbHPa8osggoK2lJVqS0XXexM3DKgU+702ZLvs5s4qrxDm
         f5nRgM25ByWVbdcPQCrMaqFpxTYtI1SZKzKqCM1x3hIqSagJkSNvQ06/BsCbxAceiJed
         oMXR6ZKN2dpQ6XB+O29Qh5ZHQcSaIFVSal24LhT2FVlPNP5Np9HBHiMaJsKF9edPGFZS
         Mqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aUxV9oqSLPy9HKavz/QVvpqmIE694AU46J2T27SMTto=;
        b=Q/70aYFq72XcnchgHqJGlu9RCHJC6DXlUJSuLJF5+q06Wwcp+R1aaeUuNNIq0v+OBw
         q4CPa692xOlaAxTSim19nui7soGbQxCaNQaI2bJn8vYzYvuW6BHPh/C/OP16AUlunKxj
         Mk6m/V8adSOpq1JrlYDf7OBlMe9FFnlzh9r1wSr9zykM9ZPisK8s8DDk+MvYEcGQBrim
         vN1xEmumvEXK9PhqRzyK6VITL3khRZrnnZNJBwW5K+4MLMCkoFg/oGWzJDR/i4Nr8Y4m
         MAO1qmpNqjEVMv81cW/psCzUkXQCn/htpp888f1fTvptp4HqH/9ZOzvgkhGejDfSzTmR
         Dcfw==
X-Gm-Message-State: AOAM531ke5ufsbd12anGfrJdSj7qOUx+c7E9BhfI83CZbdf7nS1sXlBu
        y7zoMhIJghQdmPZMQyOmVKQ=
X-Google-Smtp-Source: ABdhPJyiHKWIOBGfPfCTxpixxnF362ze1zMebAqKbocJYnXtNaJ6PE4hM2GYX8C2U1zGSiAJkwYN1w==
X-Received: by 2002:aa7:9571:0:b029:259:1f95:27db with SMTP id x17-20020aa795710000b02902591f9527dbmr25892525pfq.54.1618983615835;
        Tue, 20 Apr 2021 22:40:15 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b533:61c1:84ff:eacd])
        by smtp.gmail.com with ESMTPSA id a20sm658197pfn.23.2021.04.20.22.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 22:40:14 -0700 (PDT)
Date:   Tue, 20 Apr 2021 22:40:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Hung <joe_hung@ilitek.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, luca_hsu@ilitek.com
Subject: Re: [RESEND v7 2/2] input: touchscreen: Add support for ILITEK Lego
 Series
Message-ID: <YH+6vHUf12roZPP+@google.com>
References: <20210419051325.147314-1-joe_hung@ilitek.com>
 <20210419051325.147314-2-joe_hung@ilitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419051325.147314-2-joe_hung@ilitek.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Mon, Apr 19, 2021 at 01:13:25PM +0800, Joe Hung wrote:
> Add support for ILITEK Lego series of touch devices.
> Lego series includes ILITEK 213X/23XX/25XX.
> 
> Tested/passed with evaluation board with ILI2520/2322 IC.

Sorry, I mean to send the email earlier, but I did apply the patches
with some minor formatting changes and ...

> +
> +	/* Single touch input setup */
> +	input_set_abs_params(input, ABS_X, ts->screen_min_x,
> +			     ts->screen_max_x, 0, 0);
> +	input_set_abs_params(input, ABS_Y, ts->screen_min_y,
> +			     ts->screen_max_y, 0, 0);

You do not need to set up single-axis as ...

> +
> +	/* Multi-touch input setup */
> +	input_set_abs_params(input, ABS_MT_POSITION_X,
> +			     ts->screen_min_x,
> +			     ts->screen_max_x, 0, 0);
> +	input_set_abs_params(input, ABS_MT_POSITION_Y,
> +			     ts->screen_min_y,
> +			     ts->screen_max_y, 0, 0);
> +
> +	touchscreen_parse_properties(input, true, &ts->prop);
> +
> +	error = input_mt_init_slots(input, ts->max_tp,
> +				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);

this will do it for you.

Thanks.

-- 
Dmitry
