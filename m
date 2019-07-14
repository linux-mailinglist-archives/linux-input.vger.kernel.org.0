Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 187E3680B0
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2019 20:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbfGNS3b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jul 2019 14:29:31 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38229 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbfGNS3b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jul 2019 14:29:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id z75so6650723pgz.5;
        Sun, 14 Jul 2019 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pvN3czcomFmymVDK1Avc83sBlfQuMl7UAtMrvJZX+YU=;
        b=cR4haE3KZrhdCSpClpCYsq1Melf5HK6v1crTOU0GH7qoVyxzRg9ZZRYVOGnGn2CULc
         x6ikV8qiL0FTI5tB9zcwgsLq1LYOAQFFyDEV0odIrVTnOzTEv9GFw+eOVnAwEa98Sqkr
         jN0FcIdrAXtGbn1QsYfMyoB/JtOA4Qb0+ttjIoCl8TRve7icXijXai3v+EB/bsMCBaHR
         2tkgM4GGQXc6ZYinQ5aaquLbhPBdDEg2gNU6qBRDTxqv7IxI/qchB97d4azi5UNIQ0A0
         3/2ogV5ZHTIcXy3I/XBAEKJK7LZMGaExhuz4dWYgBacCd4cYyicjuuC5vWotF/YsnDYj
         G/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pvN3czcomFmymVDK1Avc83sBlfQuMl7UAtMrvJZX+YU=;
        b=oI0/DOSyYCphXg/mNQV6N507JPAi+BDgtQs64YCniK8DfcIiaiuwGV6zMqlWA+MfxT
         y34o3uu1qHf9UKUtsPP68ogtNWyHciA5h9ilNBls+kJLJTQbGNcdgxm5yj93zzyh8TKm
         ehahY6We9p4bRVYcu/4oWnXuuKisUqpnofxng9NalCAbZZ+/sm0ytr6XbH74JtkrAFnL
         3ewtNaD57FpUAEHHiPnGdbr350wxEVxLcVyXr+RzExoadD/m4T7eKJDNGa947l9CGLfc
         7i6V7N4NS3RrncUjnQJYeRDWulv1EEJAEYxTmi8Ph/PYbEBt+MRsVKv6wIO7ai6oTZfx
         8oJw==
X-Gm-Message-State: APjAAAXQwOGCxQ/tACQoej8zyG5jU+N27WOs34cErSYpNJ1JFQGnJoJ1
        pMg6tGmv8Gg0jTY4L3wGMZo=
X-Google-Smtp-Source: APXvYqzCzGXg+mTL+dOqiWBRGk0YTacnCLB4ynl9TJ2W5Z8LiMmBlyOj4FMi2tXn6lbcNSPzFZlDlw==
X-Received: by 2002:a63:e14d:: with SMTP id h13mr22807314pgk.431.1563128969674;
        Sun, 14 Jul 2019 11:29:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m31sm16099199pjb.6.2019.07.14.11.29.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 14 Jul 2019 11:29:29 -0700 (PDT)
Date:   Sun, 14 Jul 2019 11:29:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/8] Input: synaptics: Fix misuse of strlcpy
Message-ID: <20190714182927.GB190835@dtor-ws>
References: <cover.1562283944.git.joe@perches.com>
 <070330472a7314a21d85c42dd66cdd43222559c3.1562283944.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <070330472a7314a21d85c42dd66cdd43222559c3.1562283944.git.joe@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 04, 2019 at 04:57:41PM -0700, Joe Perches wrote:
> Probable cut&paste typo - use the correct field size.

Applied, thank you.

Luckily both sizes (name and phys) are the same, so we need not to have
this in any of the stables.

> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/input/mouse/synaptics.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 1080c0c49815..00a0cf14f27f 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -705,7 +705,7 @@ static void synaptics_pt_create(struct psmouse *psmouse)
>  
>  	serio->id.type = SERIO_PS_PSTHRU;
>  	strlcpy(serio->name, "Synaptics pass-through", sizeof(serio->name));
> -	strlcpy(serio->phys, "synaptics-pt/serio0", sizeof(serio->name));
> +	strlcpy(serio->phys, "synaptics-pt/serio0", sizeof(serio->phys));
>  	serio->write = synaptics_pt_write;
>  	serio->start = synaptics_pt_start;
>  	serio->stop = synaptics_pt_stop;
> -- 
> 2.15.0
> 

-- 
Dmitry
