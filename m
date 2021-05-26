Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E4039237C
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 01:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234697AbhEZX7m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 19:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234564AbhEZX7l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 19:59:41 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088BAC061574
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 16:58:09 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id t193so2318343pgb.4
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RqNFYvTSCQo5EECqppvTLuCqm7OpQwliEDgby0Wmq6U=;
        b=HWryLjky5SzLT3AuoEFKMPiZtLouEete8OHlx1q0CmDVFtGMEBNOh7dCchl0gyXR6C
         1SDAmWT8u64RYuaDpKt87mnmPqpPlyXi2UM12KVVtyacKftWZU0WpeRhz3I0TcrGDrgU
         mdcpswGf5zPGDKxHvt1QFbazctUNXh93t9o/aAbRY16zCw4ksxw+gAGBwEwZ8gSbsh6N
         F3hHadHhcgN9H+qTbAh2wzqX7v/dlOhVN12GekGAvMigPt1d4G3eQI/bb/tckUAzEbyK
         GEAzAHO7b0W2xSjfkeqN6lIbJLTVgl+jYJ0v6QZB9m6Ci6BaFi2l+2SZhTk8M60E5ci3
         3epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RqNFYvTSCQo5EECqppvTLuCqm7OpQwliEDgby0Wmq6U=;
        b=J4gKBGY9wriIqyyIYlNsllUTHkwbo51jSS8aANKtPMPrexqqAoMZQx2n3NS6X2so9n
         TKBjs919i8KD83LZ0qhMUYNRtxPEbnWYlZDy0iU75WwxhyGfTgk3u+N/xFPmXA5R1yGZ
         1YCFdJy84/j37sO6kdy6+AKbruR2pDRugjyOSNnQ3p+qONTdPpuoED6ZNBWpcJxmmIhy
         3RkS+FeJTBkCZZHHzUIiUolzzoylCCDTqK/QFd/zruYyVENHcZFO5VcFWvvyfKzJtYbb
         R/dbvWxMqWYFDF6AIHecJlJ+3i1Kuc4XvNnKEw+82ChbkXAD9+0w2yfJW/QBtm34t0UX
         rK+Q==
X-Gm-Message-State: AOAM531TRg3DhNjqt+H+hTEv/b01kqQIaMx7aax9yitv7J0XfvPH8MFq
        MegCKXll9pM2D/EQCYT0rbs=
X-Google-Smtp-Source: ABdhPJwODf3lwQxEqV9METwNMCI6RwL6ZEvGY6St37WE1XFUqjx5xzphu74nSbAnNsyedaOxbr97GQ==
X-Received: by 2002:aa7:800a:0:b029:250:c8c5:64b3 with SMTP id j10-20020aa7800a0000b0290250c8c564b3mr953092pfi.23.1622073488551;
        Wed, 26 May 2021 16:58:08 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2eca:168c:3933:43bc])
        by smtp.gmail.com with ESMTPSA id s123sm264898pfb.78.2021.05.26.16.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 16:58:07 -0700 (PDT)
Date:   Wed, 26 May 2021 16:58:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/3 v6] Input: cyttsp - Probe from compatibles
Message-ID: <YK7gjaT90sUnVm94@google.com>
References: <20210526230352.1433537-1-linus.walleij@linaro.org>
 <20210526230352.1433537-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526230352.1433537-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 01:03:51AM +0200, Linus Walleij wrote:
> The driver (both SPI and I2C interface) should probe from
> the compatible strings, cypress,cy8ctma340 etc when using
> device tree, not as now, where it is probing implicitly from
> the I2C/SPI node name "cypress,cyttsp-i2c" etc.
> 
> Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
