Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69A72B6FBC
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 21:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730259AbgKQUKi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 15:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgKQUKh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 15:10:37 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4911C0613CF;
        Tue, 17 Nov 2020 12:10:37 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id f12so1074992pjp.4;
        Tue, 17 Nov 2020 12:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bmbJEohduwIPhnsFk/cfq3mtQUXTQveb1Iq9VOsGuMU=;
        b=jZM/9RMqhYJxtofwet0Zn613Rc8plW58KNwfn1ShIQjROJ5GlqgnuRc3EY2GyZA/2H
         eK/0gn7vkgWnlC+1vElgkJOMFlZVdbCNoxfVb4awATNTv3IMPsz2OCIz9XcR7KyhXRq/
         HY/F5JTv5PY16HTaPfCAwv9DdfYiaxYN+OXAZhJ+UXyZdAzrXNMpZnVfwgWVkPbHfXk+
         cewSFd0i0ynorooarcBhYRx+Ht+blCi36jqFc7aqMGBvwdNJX3PfYn61oHxx0FUvACiJ
         THQJ5IB4xxrVnJyLaVIGzTQ3Hyy1qsaHvy8oyIpzlomQmm/tYMGehXj+zkcksv/ZPzhz
         6FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bmbJEohduwIPhnsFk/cfq3mtQUXTQveb1Iq9VOsGuMU=;
        b=pUN8BczV0iaN07Q4uM1XB4j2lpabc1nI24eO3Th24efxpL+CzC6APSotWCqivwDVsf
         zhfK7BJ1h+dOBGyQWF+Uhd4Z37Q3qZMFoRjwQMbMjchhWcliIQ5Jymz/oRebix7blgCU
         WppAEn/9vHBEJzkMWMhJ7ryz64WKjBCsuZ9icv74ELyovdvv77pxB06625616LuO7BeU
         HXj8Gzz1Ua5Rev80Yk6vSCN6j3klhX4mYF1jtso+ycjBpmONIwZRYfLq9S7CtQP7NrVr
         TPpxh1PqZs+fLbVX3THLjB/wBVMBeAmeFJlLpVoxOmnV7odngafpD+Vsv2O5/WIzI3MU
         bTTA==
X-Gm-Message-State: AOAM532n5SG2tIv2od76EYAqdj7g8No5hKKj2yXR5HM3elPqFOhnKygO
        RpzVgJhOB2CR3hxocXmoRMY=
X-Google-Smtp-Source: ABdhPJz5uefSitZ/i0yMZ12HAGdsOeL40fwWRL8vg1C3nO+a8kN0tYqDfbzee8n5UI0eCMDZxR/hRg==
X-Received: by 2002:a17:90a:fa93:: with SMTP id cu19mr735753pjb.117.1605643837076;
        Tue, 17 Nov 2020 12:10:37 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h32sm19167326pgl.36.2020.11.17.12.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 12:10:36 -0800 (PST)
Date:   Tue, 17 Nov 2020 12:10:34 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: sunkbd - fix UAF in sunkbd_reinit()
Message-ID: <20201117201034.GA2009714@dtor-ws>
References: <20201117132751.14863-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117132751.14863-1-yangyingliang@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yang,

On Tue, Nov 17, 2020 at 09:27:51PM +0800, Yang Yingliang wrote:
> 
> After sunkbd->tq is added to workqueue, before scheduled work finish, sunkbd is
> freed by sunkbd_disconnect(), when sunkbd is used in sunkbd_reinit(), it causes
> a UAF. Fix this by calling flush_scheduled_work() before free sunkbd.
> 
> This fixes CVE-2020-25669.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/input/keyboard/sunkbd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/keyboard/sunkbd.c b/drivers/input/keyboard/sunkbd.c
> index 27126e621eb6..b6222896acdf 100644
> --- a/drivers/input/keyboard/sunkbd.c
> +++ b/drivers/input/keyboard/sunkbd.c
> @@ -316,6 +316,7 @@ static void sunkbd_disconnect(struct serio *serio)
>  {
>  	struct sunkbd *sunkbd = serio_get_drvdata(serio);
>  
> +	flush_scheduled_work();

This is unfortunately racy as we may get interrupt and reschedule the
work again before we get to disabling the port.

It is properly fixed by 77e70d351db7de07a46ac49b87a6c3c7a60fca7e.

>  	sunkbd_enable(sunkbd, false);
>  	input_unregister_device(sunkbd->dev);
>  	serio_close(serio);
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
