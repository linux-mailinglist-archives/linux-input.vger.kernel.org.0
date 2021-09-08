Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D160140325D
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 03:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346867AbhIHBo5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 21:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346153AbhIHBo4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 21:44:56 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9D9C061757;
        Tue,  7 Sep 2021 18:43:49 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t20so511547pju.5;
        Tue, 07 Sep 2021 18:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IUajGtbIkTnMLmvJKDDM5bNk82jKbI6oddFYd20CVM8=;
        b=V0FW30MvEZTV/igRZjLppoHUoGJTHLMAWRScMq+QK8z1oj6YoDNwWDqWpDUCGvOxSk
         eze8wWtvhumaRwR670DP8T3p3eFdif2JmB2wqnR1QryWPUGyV8p6IU8dhMcU667+wBOY
         mdEZwg8pdX8ce8u/x+xchoAVqmnMA6e5tqTVRhK4ze1/zyoe2xFMjMhKNJgNHfs8pQyl
         PlhWLOGK4MbIJ6mVlJc+mj8pS0JuXcfO4CmfUnpzGdF4tlJ1v5c6Pjlq9DvfusD2f4no
         z3lWMyAldO2jhBy7WkqnGc5u4cx5/iNWVaRJxGXOLRIogBAys6WUWz++2RjUAv5CYp52
         DqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IUajGtbIkTnMLmvJKDDM5bNk82jKbI6oddFYd20CVM8=;
        b=a3cYFblXPLC4qc4eF/0HBG2XWQsML33SxvCtLdtUpkHuUsJWvGGZrnGifI4FFugHx/
         lFhuYuC/zmbTb74nSU/Da8oKJHymxVmSlwJR3bBP77U/l+l8WefSJ9XrVBt7qbHFWEal
         /pMs/JxszbopSuDy2zrQDvPeHbcFRq9wiE/It6IHoUIY8/rXfcE5Nv8tXaLEO5NXKD4k
         OMRjFVHOU1sqi2wU40dsxUUZQfTTfKjtZO66KABlLHyHMW4d4kb0TDnMPcE/AxwjW2Zw
         Tkfops7v3dtw+F21XTPgBP+PRPFi9/RVVZDIMjx5SYvsZnvQH+Mo/XTPK/Sn2B96QBp7
         hn6A==
X-Gm-Message-State: AOAM532ry/WNEW3g6OMaSyde6G7IP+kSqrgZG+/Z2viewnAiN6G+adre
        n1ERyicG1W2cZxN2OM+edwznLYJS33U=
X-Google-Smtp-Source: ABdhPJwrXXm0yXPxI3u3HhPDOQQta9IquAbHV4nqKwMP4comgvSHywK/CP6bxyQWL8xMjgz32CfoZA==
X-Received: by 2002:a17:90b:4a51:: with SMTP id lb17mr1327070pjb.245.1631065428401;
        Tue, 07 Sep 2021 18:43:48 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:ded6:ee2d:2354:13b7])
        by smtp.gmail.com with ESMTPSA id h16sm282254pfn.215.2021.09.07.18.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 18:43:47 -0700 (PDT)
Date:   Tue, 7 Sep 2021 18:43:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: analog: Always use ktime functions
Message-ID: <YTgVUWzFSOg/I4C+@google.com>
References: <20210907123734.21520-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907123734.21520-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Guenter,

On Tue, Sep 07, 2021 at 05:37:34AM -0700, Guenter Roeck wrote:
> @@ -241,11 +176,11 @@ static int analog_cooked_read(struct analog_port *port)
>  	int i, j;
>  
>  	loopout = (ANALOG_LOOP_TIME * port->loop) / 1000;
> -	timeout = ANALOG_MAX_TIME * port->speed;
> +	timeout = ANALOG_MAX_TIME * NSEC_PER_MSEC;
>  
>  	local_irq_save(flags);
>  	gameport_trigger(gameport);
> -	now = get_time();
> +	now = ktime_get();

There are time[4], now, etc variables above this block that are u64. I
think they can be make ktime_t. I can do it myself if you agree.

> @@ -378,35 +313,19 @@ static void analog_calibrate_timer(struct analog_port *port)
>  	u64 t1, t2, t3;

I think these should also be ktime_t.

Thanks.

-- 
Dmitry
