Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16AF2355503
	for <lists+linux-input@lfdr.de>; Tue,  6 Apr 2021 15:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242622AbhDFNYc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Apr 2021 09:24:32 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:37414 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344422AbhDFNY1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Apr 2021 09:24:27 -0400
Received: by mail-oi1-f172.google.com with SMTP id k25so15050393oic.4;
        Tue, 06 Apr 2021 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=JjENON6/Sx20JnClGDF/AXxvY7fv/GFzvMQJPylTgSc=;
        b=L4K8gClpOlxYTGPcnDerQgQV1rFjnPEiNyI8KeOKPKm9uuzCgmWlUzr9YPbzmglPgm
         dHl9O5fCQnAFsBZ23pxdqrU3Q4t2c2tfpEOYIaAtyR2NuoHpMqQbHuvv/JhI2KkxT4/9
         zjHpLMACYSuqY0+JJ6sWbLcCYA1daH2JZsoMhBoMEuA8Yada7ch8JBEbUuVI2Q/dsDpe
         fAV5foN8WSZmdLmNx3yxNBckpvcm81Fr2KtUw7+0mBBIKD2cZK+9PFoS1y0+9g8b2IrO
         7DOKV47WY6qERzo8gSniz5vXUTaeJUJsNC2V3/NWflkA/Tqc+pFY66RW6cjtQ3d4L3Gl
         7h2g==
X-Gm-Message-State: AOAM531Qiz81oBl1OdRKELGXg9hpS+Q6/BNOALqQpE0xSzKf1RYDeJSE
        d4AnDrgJFrDsCvJ2JHHTGA==
X-Google-Smtp-Source: ABdhPJz6rmDyQsgrOoVLlXBQMirxfLVInksGHJ1IftaUOy3LfEw72kG5w/Z0hpnHQfq9gf3n61UCVg==
X-Received: by 2002:a05:6808:f12:: with SMTP id m18mr3145875oiw.62.1617715458447;
        Tue, 06 Apr 2021 06:24:18 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a20sm3647488oia.49.2021.04.06.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:24:16 -0700 (PDT)
Received: (nullmailer pid 1674496 invoked by uid 1000);
        Tue, 06 Apr 2021 13:24:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
References: <YGbc7Qbu6s659Mx4@latitude> <20210402161627.2546145-1-giulio.benetti@benettiengineering.com> <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Tue, 06 Apr 2021 08:24:05 -0500
Message-Id: <1617715445.154812.1674495.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 02 Apr 2021 18:16:26 +0200, Giulio Benetti wrote:
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> As suggested by Rob Herring:
> * fixed $id: address
> * added "hycon," in front of every custom property
> * changed all possible property to boolean type
> * removed proximity-sensor-switch property since it's not handled in driver
> V2->V3:
> As suggested by Jonathan Neuschäfer:
> * fixed some typo
> * fixed description indentation
> * improved boolean properties descriptions
> * improved hycon,report-speed description
> ---
>  .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.example.dt.yaml:0:0: /example-0/i2c/hycon-hy4633@1c: failed to match any schema with compatible: ['hycon,hy4633']

See https://patchwork.ozlabs.org/patch/1461797

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

