Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1980734F402
	for <lists+linux-input@lfdr.de>; Wed, 31 Mar 2021 00:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbhC3WIf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 18:08:35 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:38568 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232793AbhC3WIS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 18:08:18 -0400
Received: by mail-oi1-f175.google.com with SMTP id v25so1394346oic.5;
        Tue, 30 Mar 2021 15:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VAGjoWPvfg2FJLNwErmXF97+aE7omKK1hx3zyjfEqSU=;
        b=TfssQsR60yxzeQP2Z3Pggw9lW4pIzwUjoocpzFWQBlpw0DC4bkgFomAAgFNETh/Tex
         LAR2ITjCuyFTSrLovUPJCEdBO+nXqEVLHTxJgor6WNUlFgbv+SiPlk7E6/I7Dmwsv816
         ihOSd8Hu0ZMieXdHtg4h3wsR900mGkERIHNyppvRU6mOM5p7Vzm4gdA1TOQBmTbYnpmk
         XsNi/yo5hvuxtzXCouT22W4OGzf75bALles4lAPcPUxLMuYwmOKLKegtZHMPyKDciLjP
         keXmWEJzidsZ1J+Yznu+tTgUNiS7bBuZJf14AKRR9X6loz+90RW6Jn8ETmCCAGwv5Hmc
         SNew==
X-Gm-Message-State: AOAM533peepq3K6ndNFlSgVAvGcRHN1VUMAL9rSRUK5tDc2PMSt19TAi
        x8+yg6XMNPx3cjaRIozPIvngB/R5uA==
X-Google-Smtp-Source: ABdhPJzACZhFWbLlTIot7iujFgNfSOY6cLiUSfe3tbunrW/ZGGT5KFwkDRKKg8xarjXH4J++qAK4Pw==
X-Received: by 2002:aca:2416:: with SMTP id n22mr58581oic.161.1617142097807;
        Tue, 30 Mar 2021 15:08:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e18sm39509otf.2.2021.03.30.15.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 15:08:17 -0700 (PDT)
Received: (nullmailer pid 800728 invoked by uid 1000);
        Tue, 30 Mar 2021 22:08:16 -0000
Date:   Tue, 30 Mar 2021 17:08:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>, linux-input@vger.kernel.org,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] Input: cyttsp - Convert bindings to YAML and extend
Message-ID: <20210330220816.GA800699@robh.at.kernel.org>
References: <20210329130758.2082126-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329130758.2082126-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 29 Mar 2021 15:07:58 +0200, Linus Walleij wrote:
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
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Use minItems and maxItems directly without -items
> - Drop u32 type from all properties ending with "-ms"
>   that thus have implicit types.
> - Add maintiner to Cc.
> 
> Patch to add the new compatibles to the Linux driver is sent
> separately.
> ---
>  .../input/touchscreen/cypress,cy8ctma340.yaml | 149 ++++++++++++++++++
>  .../bindings/input/touchscreen/cyttsp.txt     |  93 -----------
>  2 files changed, 149 insertions(+), 93 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
