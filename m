Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2578B4422CF
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 22:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbhKAVmA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 17:42:00 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:39733 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhKAVlw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Nov 2021 17:41:52 -0400
Received: by mail-ot1-f47.google.com with SMTP id x16-20020a9d7050000000b00553d5d169f7so25524528otj.6;
        Mon, 01 Nov 2021 14:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3FwLLyJKx1GjeOB8yfv/tXfC5sTlYYY8+Nr2Ii7DjYE=;
        b=0zA9uWrQF1iAUhh8hST1XFCRdQud4ek2QxLzFcUO0pkXU9vRsa287mOLyhg3t/F9/l
         Z41IYXQbecwKxFB+R5dOV9DT+j72R8Nt4PFHXeLjYYbNRYqR1GQwSB9PFjRCyei04jFE
         glkln++BbEPNee1OMv9F/O1IagG1vT7sw1oQF2LSwKDoRK3g7Yccjf5P5PzuEgyX75dJ
         uQ3JyjB/j4CvcxRUYJBjHHIY6Ren2Yb5bw7Mkd5+zKF6qmyyfUK11H0CSuyKKCbTfjXw
         hezQMIOjKQXPbYNphMrVRQ4omyZ9iC/CaVP7QHUCoOBrNsUNzUzALa4jLs8bRgY9ixxp
         MTkA==
X-Gm-Message-State: AOAM531SlNfUtWmRXobDLzRPPKjw1R5ObCDxIpjpyJjVCylU3t2kPsfq
        5P31SD+M//YrBHo5Fog7hw==
X-Google-Smtp-Source: ABdhPJzAmFejXmyzkm8ES1JIKOl38NIjUlOA8LH4X858BfNUCmeoeCZ3RE1u+RIBtpbble0MltnDKw==
X-Received: by 2002:a05:6830:1516:: with SMTP id k22mr11498596otp.280.1635802758187;
        Mon, 01 Nov 2021 14:39:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bd5sm2043230oib.2.2021.11.01.14.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 14:39:17 -0700 (PDT)
Received: (nullmailer pid 1114161 invoked by uid 1000);
        Mon, 01 Nov 2021 21:39:16 -0000
Date:   Mon, 1 Nov 2021 16:39:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        ~postmarketos/upstreaming@lists.sr.ht, broonie@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        Michael.Srba@seznam.cz, robh+dt@kernel.org,
        phone-devel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: input/ts/zinitix: Convert to YAML, fix
 and extend
Message-ID: <YYBehK8JfcxN/geo@robh.at.kernel.org>
References: <20211027181350.91630-1-nikita@trvn.ru>
 <20211027181350.91630-3-nikita@trvn.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027181350.91630-3-nikita@trvn.ru>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 27 Oct 2021 23:13:46 +0500, Nikita Travkin wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> This converts the Zinitix BT4xx and BT5xx touchscreen bindings to YAML, fix
> them up a bit and extends them.
> 
> We list all the existing BT4xx and BT5xx components with compatible strings.
> These are all similar, use the same bindings and work in similar ways.
> 
> We rename the supplies from the erroneous vdd/vddo to the actual supply
> names vcca/vdd as specified on the actual component. It is long established
> that supplies shall be named after the supply pin names of a component.
> The confusion probably stems from that in a certain product the rails to the
> component were named vdd/vddo. Drop some notes on how OS implementations should
> avoid confusion by first looking for vddo, and if that exists assume the
> legacy binding pair and otherwise use vcca/vdd.
> 
> Add reset-gpios as sometimes manufacturers pulls a GPIO line to the reset
> line on the chip.
> 
> Add optional touchscreen-fuzz-x and touchscreen-fuzz-y properties.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Michael Srba <Michael.Srba@seznam.cz>
> Cc: phone-devel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> [Fixed dt_schema_check error]
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> This patch was previously submited here:
> https://lore.kernel.org/linux-input/20210625113435.2539282-1-linus.walleij@linaro.org/
> 
> Changes since the original patch:
>  - Use enum for compatible list instead of oneOf + const
> ---
>  .../input/touchscreen/zinitix,bt400.yaml      | 115 ++++++++++++++++++
>  .../bindings/input/touchscreen/zinitix.txt    |  40 ------
>  2 files changed, 115 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
