Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA088392377
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 01:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbhEZX7F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 19:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbhEZX7E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 19:59:04 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12606C061574;
        Wed, 26 May 2021 16:57:32 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id kr9so1698814pjb.5;
        Wed, 26 May 2021 16:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vuXWeQOw0gNxDi9H3AsJyjBAkLkVaGXioSB0T/4hSkk=;
        b=B9wjSgTtj1OHe0E/i0VCCnCeYaoeLshR/0ZHSd+xASosoDLJcjGdnjD43sXiq3txgH
         Gqax0tudJ+4tg6XpXc8pwc7/Upue3S/asxPlpfmEBTmmTvWAk4WZl2xM1EFQwq3Ow/4J
         6rjFfo05fihsIivHdk8mWTZE/w9/vkmFVrXz21OAnjZeP0yMLDP3hR/QC7/gzP8mz6Hv
         RvCns1tjN5PKCbng1/+uCo/3mJm+5qdvcZOcq8JJCsXWtLaLpe0gBVg60UvZ3FdagSKy
         NnzR8mxQI213OfoOMJ8b5IRCanRk7/XchR6uolaTH7CkQBiM9myXdPDxrWlws04hiqk9
         PvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vuXWeQOw0gNxDi9H3AsJyjBAkLkVaGXioSB0T/4hSkk=;
        b=OuqjUTtrtv2y3/oDJR+taCneyFLvkdOFncZOuD4Z4XGAfMcCZbUYGS84a1suyGCiy9
         nRZoTtWilSDUXoXKeLTNtyPnm2K+9OzWYfI7WFVy/l9Y5Jkx0fbQ9MSVEAU69mNsIcBY
         zDFw1lMFfu+v1wWEo+015kiO71Zbq/X6uV55K4ID4iHbXmQtQk/YO+ZcFp8gtUih61A0
         vnj63NU9vSKRYChwdniRr8yqLTP/JWuEBrwkfEHprb0tNbUUJG4Z2UZPGNmK+3x8X1Rn
         F3MZkG5+2K/fcx77ghPyTNtKM4axysvzLk2EfGRdvvuI5+9vrYgg7BQxuBCuFi6hFtH5
         Y7gg==
X-Gm-Message-State: AOAM532Q/ix6N8OHvA57LmvdMvudT8DZruLliPU43VMxmTlMtscErY9b
        A3ekwyACwtBLGqkP7WHejJs=
X-Google-Smtp-Source: ABdhPJyos5Ta7JUtMFolbDMts5v3KWcRKTAWkGAes7J7cpxcPydklOVmkWKHjOhvI24Iz+DI3qeJCg==
X-Received: by 2002:a17:90a:564c:: with SMTP id d12mr6447300pji.136.1622073451421;
        Wed, 26 May 2021 16:57:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2eca:168c:3933:43bc])
        by smtp.gmail.com with ESMTPSA id d17sm274242pfq.28.2021.05.26.16.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 16:57:30 -0700 (PDT)
Date:   Wed, 26 May 2021 16:57:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3 v6] Input: cyttsp - Convert bindings to YAML and
 extend
Message-ID: <YK7gZzQ4u4VWu31m@google.com>
References: <20210526230352.1433537-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526230352.1433537-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 01:03:50AM +0200, Linus Walleij wrote:
> This converts the CYTTSP "Cypress TrueTouch Standard Product"
> to YAML bindings and fixes and adds some things in the process:
> 
> - Rename the bindings file to cypress,cy8ctma340 after the main
>   product in the series.
> - Add proper compatibles for the two known products:
>   CY8CTMA340 and CY8CTST341.
> - Deprecate "cypress,cyttsp-spi" and "cypress,cyttsp-i2c"
>   because device compatibles should be named after the
>   hardware and not after which bus they are connected to.
>   The topology implicitly tells us which bus it is and what
>   interface to used.
> - Add VCPIN and VDD supplies, these are present just like
>   on the CY8CTMA140.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Ferruh Yigit <fery@cypress.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
