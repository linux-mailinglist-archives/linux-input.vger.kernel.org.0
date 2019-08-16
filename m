Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9A60906D1
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 19:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfHPR0T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 13:26:19 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40628 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbfHPR0S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 13:26:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so2712029pla.7;
        Fri, 16 Aug 2019 10:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UKsyRA84vTqyJ3iyrNlp2zXmCxrxVNANEtLCfJzC0Ec=;
        b=dFFUldQwRHuZw7+vsaBu4dYTBpHOXVJSslbp/UHk1Z9bO7rA6iKefAjlHLLwlECQ6w
         iSAXxQIwQNfXuvuPvms+tla/ncqfdHZVhydswpLs3UWgvhqIIRGm5iV+Z0K5yyr7PkwU
         reCzvZxKHbkUuI0G08URwDc0TNvLqNjyHBHqXJXaRSA4GoxXYy0c9bWqzHZ54NyFPx9n
         hvgxQUbCAFz8d1fUrFvR6tY5gl2NuX18Nyngh064K5Za6kF3lD4tcaZiHU+QV93GlFok
         L5pWBrnUcoohVaX9NlA7YWoOsdDUUfgFMSjRrNIy73QQvhcDT85UcSUhhTKX8seoFh4L
         KMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UKsyRA84vTqyJ3iyrNlp2zXmCxrxVNANEtLCfJzC0Ec=;
        b=sqBqNTWlH1WM9AYxqzN9IixHV5evthWgkph7yFx6UHEzmHov87Pfm6cWAp3DyokGaM
         o4CUhIaGB5h5KSg4iM867+QSFw21qzbCbkGsSXXVWjxZAfeoXz03dXpgU2M/xFlisvTx
         WTQt59V0b6CCkWVHj55IN05V5cgrDpK4cHxSdceXYC4mKSMfHwDh8Idypg9fRbPWHSCl
         ljUTn92pd84eSGocI6jXfPDVDPE36Q8QuZ0+q2Tvr8TyKSyC6cC+8RYTbux4tpRtfsHD
         F5KuLF8GCHw5s/ANIZVfrboWNM2feDnOxCs1HD4IpHTkdGQx+zMBvkzIy0LTFdx4VZyy
         0nDw==
X-Gm-Message-State: APjAAAX+d/NPgl1yC4X+Sstmae1NLJloxUp2u9fUFNEe0mFsDs36xRtj
        T0aSpcBwUHXV2Q8qFiD6ghSNtLxI
X-Google-Smtp-Source: APXvYqzacLUjJ8QKiCikvB+Fli2ehgFNf7M0VUXkmNde6Tryh/zhk8wnv9dVTxuKmEIv/CeZ5LfOfA==
X-Received: by 2002:a17:902:7786:: with SMTP id o6mr542608pll.11.1565976377919;
        Fri, 16 Aug 2019 10:26:17 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r137sm9768077pfc.145.2019.08.16.10.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 10:26:17 -0700 (PDT)
Date:   Fri, 16 Aug 2019 10:26:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, george_davis@mentor.com
Subject: Re: [PATCH v1 41/63] Input: touchscreen: Atmel: Enable
 IRQ_DISABLE_UNLAZY flag for interrupt
Message-ID: <20190816172615.GJ121898@dtor-ws>
References: <20190816083558.19189-1-jiada_wang@mentor.com>
 <20190816083558.19189-2-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816083558.19189-2-jiada_wang@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 16, 2019 at 05:35:36PM +0900, Jiada Wang wrote:
> From: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> 
> The de-/serializer driver has defined only irq_mask "ds90ub927_irq_mask" and
> irq_unmask "ds90ub927_irq_unmask" callback functions. And de-/serializer
> driver doesn't implement the irq_disable and irq_enable callback functions.
> Hence inorder to invoke irq_mask callback function when disable_irq_nosync is
> called the IRQ_DISABLE_UNLAZY interrupt flag should be set. If not the
> disable_irq_nosync will just increment the depth field in the irq
> descriptor only once as shown below.
> 
> disable_irq_nosync
>  __disable_irq_nosync
>   __disable_irq (desc->depth++)
>    irq_disable
>     if irq_disable present -----------> if IRQ_DISABLE_UNLAZYflag set
>              |                  no                  |
>          yes |                                  yes |
>              |                                      |
>      desc->irq_data.chip->irq_disable   desc->irq_data.chip->irq_unmask
>                                          (ds90ub927_irq_mask)
>                                           disable_irq
>                                            __disable_irq_nosync
>                                             __disable_irq
> (desc->depth++)
> But the enable_irq will try to decrement the depth field twice which generates
> the backtrace stating "Unbalanced enable for irq 293". This is because there is
> no IRQ_DISABLE_UNLAZY flag check while calling irq_unmask callback function
> of the "ds90ub927_irq_unmask" de-/serializer via enable_irq.
> 
> enable_irq
>  __enable_irq (desc->depth--)
>   irq_enable
>    if irq_enable present -------------> desc->irq_data.chip->irq_unmask
>               |                no        (ds90ub927_irq_unmask)
>           yes |                            enable_irq
>               |                             __enable_irq (desc->depth--)
>     (desc->irq_data.chip->irq_enable)

I'd prefer if we instead did not use the disable_irq_nosync() in the
driver.

Thanks.

-- 
Dmitry
