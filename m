Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E5532F4A9
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 21:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhCEUj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 15:39:58 -0500
Received: from mail-oo1-f42.google.com ([209.85.161.42]:41213 "EHLO
        mail-oo1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCEUje (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 15:39:34 -0500
Received: by mail-oo1-f42.google.com with SMTP id h38so740412ooi.8;
        Fri, 05 Mar 2021 12:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/DUNcNtPRhi4wjsL1Nxt7Bq+A6DwjjW8YASVD46+u6c=;
        b=c4l+c2JITlbotwCSyqHZSQ32QRuBVxmgS3Po/QOLasuCDgQEZQDQ0hA7f91INCi1bZ
         3kM8nQGpmxOV+Z+1W/gyGmPig1ANRVtcZbMj4VQVzGGfqNPHJLTOwfqoF2nllfqxfW6z
         nYxjHHG/m5SuM718d0JDFZ7GoE1KimExhs3iVwb+AFE+TsOlBDKooqpvgAoMGCrYvZR7
         vR9k2ZNVC65zf6mV9IQ0IwWLasPNNeRrh87y6IbJm8orDtMclS53FfX+UXPdWGg83d8T
         A6i9K30PX6wih8hd7p80vBWeqFFfrWBQggVszRKyh7FXYuiEL3YNinshyOITvASq/aOE
         cfhw==
X-Gm-Message-State: AOAM532sRQdfmdKfvIqGBUGNUJqSsHosGPHyCcsz1cvG9KGb/0gxhxcd
        5WDr5z4u6IjB9FafkHXekA==
X-Google-Smtp-Source: ABdhPJzkODo5l0kOmvg3vy02ShhHeB9WfVF0FyOmQw/IiZef1gHjwTC7O0V7fXm4IhvBEsXH6EI6Tw==
X-Received: by 2002:a05:6820:255:: with SMTP id b21mr9290736ooe.0.1614976773798;
        Fri, 05 Mar 2021 12:39:33 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s73sm757781oih.36.2021.03.05.12.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:39:32 -0800 (PST)
Received: (nullmailer pid 607511 invoked by uid 1000);
        Fri, 05 Mar 2021 20:39:30 -0000
Date:   Fri, 5 Mar 2021 14:39:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        devicetree@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: atmel,maxtouch: add wakeup-source
Message-ID: <20210305203930.GA607465@robh.at.kernel.org>
References: <20210212163806.69996-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212163806.69996-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 12 Feb 2021 17:38:06 +0100, Krzysztof Kozlowski wrote:
> The touchscreen can be a wake up source and it's being used in DTS:
> 
>   arch/arm/boot/dts/exynos5250-spring.dt.yaml:
>     trackpad@4b: 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
