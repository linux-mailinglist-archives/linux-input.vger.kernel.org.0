Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB6D2AFE59
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 06:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgKLFhQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 00:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgKLBtH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 20:49:07 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B47C061A04;
        Wed, 11 Nov 2020 17:49:07 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id e7so2991941pfn.12;
        Wed, 11 Nov 2020 17:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tss6wQP1XzwIz1UFhRrC2d4Vh1ljAS8ZjFmnOwc4WV0=;
        b=ZVZSEme25BmUqO7wKcITnNPB+SepinSR8NA4Rq0N7yHh5tDnxNKXGkBsvOOArZD2YG
         H/pZjGivwVsTHNCg3YkZVIl5UmWW27FWSdKIP6dKWuHEkqX/TxQLFod+cPMaOsuUljoz
         pwYmoqLSfxV5NzIDkNqWbi7MP4SAqrtaKEvFxp6mjNbKkBdoTTLTOzg3/lnNkxt59U+h
         t+mkhewKtIkZt/tv1iB2OblWl6nW+d0D5IimfhpSjqMQ26J0635tfott8XO7tgs4uK1p
         UkWNhdKg4ojF861VgWIyC76rz3taLv6fXWHVyiWR7nt614fBpvUHqNpdYZZfbNJc/H+X
         1IRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tss6wQP1XzwIz1UFhRrC2d4Vh1ljAS8ZjFmnOwc4WV0=;
        b=sj5uoDwOtoMLbQh+ji8yxl8Xv5oh59kBk3tnOgu4zF4dY95wTRaT7iDj90cDqa72E6
         xGvPxZRafirFbJTq8VZK1LPFJlI/IujQIhA1EiXVnAVyTmYFrErWATQsWOQylR0uP6i4
         M9RxftTkoW6S90D46ri4ab9yhb25VlJSAWqTNYLn9fX+ojxEd2Wb67xL7VjeJb0cppm4
         lTA1EuDqJphKv8nlovEI4AE5QAhvkr/uyTyFo8mNuZPAFk4Zj5rNEqYTpDw4mW1/GTvB
         L4wkJ90Ml5Q1WieKMQl2Lad9FTfwW5Q2NRsSWSm0VUzBouPMUGVjOPs76ba5BSd7fSn+
         nLgw==
X-Gm-Message-State: AOAM530BAr+OjJm+Bh+kCmSsQ4qVlrL4b+L2Ay9+F7yXX36UMUoQL+Ws
        T5LcrLi7nzQYIkhBjxoLOq0=
X-Google-Smtp-Source: ABdhPJwkYqM2mbK1nkwgtQX0enByeR+7yZhs8McprLLOfOJtixjG2L004/coyDxaupooFqmnkq10uQ==
X-Received: by 2002:a17:90a:dc01:: with SMTP id i1mr6651000pjv.195.1605145747505;
        Wed, 11 Nov 2020 17:49:07 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i2sm3735710pjk.12.2020.11.11.17.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 17:49:06 -0800 (PST)
Date:   Wed, 11 Nov 2020 17:49:03 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc:     Jonathan.Cameron@huawei.com, eugen.hristev@microchip.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu
Subject: Re: [PATCH] Input: touchscreen: fix kconfig dependency bug for
 TOUCHSCREEN_ADC
Message-ID: <20201112014903.GC1003057@dtor-ws>
References: <20201102221504.541279-1-fazilyildiran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102221504.541279-1-fazilyildiran@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 03, 2020 at 01:15:05AM +0300, Necip Fazil Yildiran wrote:
> When TOUCHSCREEN_ADC is enabled and IIO_BUFFER is disabled, it results
> in the following Kbuild warning:
> 
> WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
>   Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
>   Selected by [y]:
>   - TOUCHSCREEN_ADC [=y] && !UML && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && IIO [=y]
> 
> The reason is that TOUCHSCREEN_ADC selects IIO_BUFFER_CB without depending
> on or selecting IIO_BUFFER while IIO_BUFFER_CB depends on IIO_BUFFER. This
> can also fail building the kernel.
> 
> Honor the kconfig dependency to remove unmet direct dependency warnings
> and avoid any potential build failures.
> 
> Fixes: aa132ffb6b0a ("input: touchscreen: resistive-adc-touch: add generic resistive ADC touchscreen")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=209881
> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>

Applied, thank you.

-- 
Dmitry
