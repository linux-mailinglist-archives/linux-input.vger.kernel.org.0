Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDA31B13BA
	for <lists+linux-input@lfdr.de>; Mon, 20 Apr 2020 19:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgDTR6j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Apr 2020 13:58:39 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46039 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDTR6i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Apr 2020 13:58:38 -0400
Received: by mail-oi1-f194.google.com with SMTP id k133so9584632oih.12;
        Mon, 20 Apr 2020 10:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dcPKK/Z82IrbhlxfoxaOZNMOk/JJzTs22cge4JBQeik=;
        b=ZS1pakvBTVkRaxiJZyg7RBi/PXBI4xji388wT3sKWRPXkw8ggove59mOwkZ6IT8M8N
         26pTFvrDTK0PcCMkvF1f6FmyO6AZpSksl0KQsXNkPktHWUAQRKuCURyn9SejrusYtLaI
         xxexnt+1DqdyIIATbHlZ9puO2BlCrAk3I/eSH++ujeAtNTxbEhCoeD3Z3vxYp3N2q88d
         RWqA1GMW2q38JToUMnpe+GcYvfHqScPDoLep/lCG6vNjea2RRFZwoX6NepC12CmR8pFr
         LalaxhedtHit2dG0+nFXO9iiiHRgtsnT2qZZdyGj0aeSJZOgKqAL2p4RRIHiKq9HfQF0
         vIwA==
X-Gm-Message-State: AGi0PuaKjd3025/cIDOdgbY042/4CROqSN9LUmkR9afBSOIbw2lPiJ+z
        1UBOH48vl5KQcmZ0D2vXYw==
X-Google-Smtp-Source: APiQypIdSxDnkzoGvplyq+0cQXFUxFEnIyyNYoMQQC/YC9t0Q6lHXcV7sKdKYNUalBncIkTOaz5H9Q==
X-Received: by 2002:aca:d485:: with SMTP id l127mr398302oig.119.1587405517760;
        Mon, 20 Apr 2020 10:58:37 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m36sm77626otm.62.2020.04.20.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:58:36 -0700 (PDT)
Received: (nullmailer pid 4787 invoked by uid 1000);
        Mon, 20 Apr 2020 17:58:35 -0000
Date:   Mon, 20 Apr 2020 12:58:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH 1/2 v4] dt-bindings: touchscreen: Add CY8CTMA140 bindings
Message-ID: <20200420175835.GA3511@bogus>
References: <20200417204312.13453-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417204312.13453-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 17 Apr 2020 22:43:11 +0200, Linus Walleij wrote:
> This adds device tree bindings for the Cypress CY8CTMA140
> touchscreen.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v4:
> - Drop the description of 'reg', it's surplus.
> - Set the I2C frequency to the span 100k to 400k instead
>   of hardcoding 400k.
> - Collect Rob's review tag.
> ---
>  .../input/touchscreen/cypress,cy8ctma140.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.example.dts:18.22-32.11: Warning (unit_address_vs_reg): /example-0/i2c@00000000: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.example.dts:18.22-32.11: Warning (unit_address_format): /example-0/i2c@00000000: unit name should not have leading 0s

See https://patchwork.ozlabs.org/patch/1272475

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
