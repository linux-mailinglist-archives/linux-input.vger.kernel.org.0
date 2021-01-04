Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B2B2EA0CF
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 00:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbhADXaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 18:30:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbhADXaH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 18:30:07 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A989C061574;
        Mon,  4 Jan 2021 15:29:27 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id r17so26901867ilo.11;
        Mon, 04 Jan 2021 15:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Wfic2K92ZXllRUefSx4aK3r1rxJzT1+EDUtALxKeyGw=;
        b=sGDLOoHWZQHkQja3CIDZf11h1sz75fE1mfUH6FiH/sfL4+rwt/MP1oUerDN+G1DpTw
         FUlayG9pZcBjd9wtQbHaND2g6DAp0NXIUpZmQPyosIP9SiHNtK64nm4NIp5To+V/i/d5
         /y9w68GxK8vEfTei3MUbXmEAFWJ2P1QBmmK6zh++ECgF9rnEacxsE+PFJ0n9LPg2r71v
         SS2vuzDldSs23FBesjCQqAe5aDf3AfYc0hcYScIR90NwzIqdSp22XcWAWdMf/IC1ACKZ
         HS5Vn4BDlB8sykfuYLka5JErSIBL+V9lV/IoyHLf5bzNUjX8QkGLVI/wH0nd27ikX5xA
         F1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wfic2K92ZXllRUefSx4aK3r1rxJzT1+EDUtALxKeyGw=;
        b=YP7AR2CDcWbtGnjOamvFWfMiKd68REQ2l+Dd0P4W5+3iMpwLE4X18nFwJchy2yXDZC
         +h/FQP9CcohBjRgMvvhwlqdsBADsyRwsAMFov/fiW++lrpKsbGpAFgL1HUbuaO4UdzFy
         4PyS3ZYGtPjSbNGZ/9IdBDm2qvjxRadaI1k1ucTP475nkY4Gch1UeeRIVD0yoQmn3cWi
         Zvnssc9SPLhVpUxwlRzQsOhlK5JmtrHt+sZP9/SDQqELzNv7A/FLGnYPpjWKzoUNQ4JS
         pqprxqbdaTs/t9tpgcr+Td0sdRAkIylVCXiOuLz+MtmVpQUJQn8GHPhg0JI66AqE3whJ
         QoVg==
X-Gm-Message-State: AOAM531JD/NFWNRkA7BN/pBkj7lMRfMbfdE9o1kJTtsyMZuOpKJonISZ
        TmVvtSa/Uy9q4m9jE35ykjc/d6kzR3g=
X-Google-Smtp-Source: ABdhPJw5Ux3bGVNWT1ajZZpxSxwcybODIkr6oq6d5fCHnxKZwzQ4/07/HZfpqrDYCoC4TZevY0uEAA==
X-Received: by 2002:a63:2fc5:: with SMTP id v188mr72279520pgv.243.1609801282930;
        Mon, 04 Jan 2021 15:01:22 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id ft19sm375829pjb.44.2021.01.04.15.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 15:01:22 -0800 (PST)
Date:   Mon, 4 Jan 2021 15:01:19 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     tglx@linutronix.de, maz@kernel.org, gregkh@linuxfoundation.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxarm@openeuler.org
Subject: Re: [PATCH] genirq: add IRQF_NO_AUTOEN for request_irq
Message-ID: <X/OePw97VgXtRBxj@google.com>
References: <20210104222612.2708-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104222612.2708-1-song.bao.hua@hisilicon.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 05, 2021 at 11:26:12AM +1300, Barry Song wrote:
> This patch originated from the discussion with Dmitry in the below thread:
> https://lore.kernel.org/linux-input/20210102042902.41664-1-song.bao.hua@hisilicon.com/
> there are many drivers which don't want interrupts enabled automatically
> due to request_irq().
> So they are handling this issue by either way of the below two:
> (1)
> irq_set_status_flags(irq, IRQ_NOAUTOEN);
> request_irq(dev, irq...);
> (2)
> request_irq(dev, irq...);
> disable_irq(irq);
> 
> The code in the second way is silly and unsafe. In the small time gap
> between request_irq and disable_irq, interrupts can still come.
> The code in the first way is safe though we might be able to do it in
> the generic irq code.
> 
> I guess Dmitry also prefers genirq handles this as he said
> "What I would like to see is to allow passing something like IRQF_DISABLED
> to request_irq() so that we would not need neither irq_set_status_flags()
> nor disable_irq()" in the original email thread.

One of the reasons I dislike irq_set_status_flags() is that we have to
call it before we actually granted our IRQ request...

> 
> If this one is accepted, hundreds of drivers with this problem will be
> handled afterwards.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  include/linux/interrupt.h |  3 +++
>  kernel/irq/manage.c       |  3 +++
>  kernel/irq/settings.h     | 10 ++++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
> index bb8ff9083e7d..0f22d277078c 100644
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -61,6 +61,8 @@
>   *                interrupt handler after suspending interrupts. For system
>   *                wakeup devices users need to implement wakeup detection in
>   *                their interrupt handlers.
> + * IRQF_NO_AUTOEN - Don't enable IRQ automatically when users request it. Users
> + *                will enable it explicitly by enable_irq() later.
>   */
>  #define IRQF_SHARED		0x00000080
>  #define IRQF_PROBE_SHARED	0x00000100
> @@ -74,6 +76,7 @@
>  #define IRQF_NO_THREAD		0x00010000
>  #define IRQF_EARLY_RESUME	0x00020000
>  #define IRQF_COND_SUSPEND	0x00040000
> +#define IRQF_NO_AUTOEN		0x00080000
>  
>  #define IRQF_TIMER		(__IRQF_TIMER | IRQF_NO_SUSPEND | IRQF_NO_THREAD)
>  
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index ab8567f32501..364e8b47d9ba 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -1693,6 +1693,9 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
>  			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
>  		}
>  
> +		if (new->flags & IRQF_NO_AUTOEN)
> +			irq_settings_set_noautoen(desc);

Can we make sure we refuse this request if the caller also specified
IRQF_SHARED?

Thanks.

-- 
Dmitry
