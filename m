Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFA62D4B57
	for <lists+linux-input@lfdr.de>; Wed,  9 Dec 2020 21:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388128AbgLIUNd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 15:13:33 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37224 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730623AbgLIUNd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 15:13:33 -0500
Received: by mail-ot1-f68.google.com with SMTP id o11so2661956ote.4;
        Wed, 09 Dec 2020 12:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4WkPwlu52Q10AIZ+1tIPGMg0KSqgHstPiaQxqFnYDFo=;
        b=byyFk5R1f7QZOjXkqR4EaGqkpKWGY/okp/pDBOlodRqeAFZ/Ij6G0BAUApRdeZHNXD
         hd5stEG9LR8gLG8egrFbfpokfS3P5oOV6udX10FSDs0fnN7Lu0k0kbC0040EKokVorjZ
         u2zpQ69Ue/FCSYHZg9wiXkiIsJeuPp9dJvDWuf60425xghHVcdnPldwV60rXbS2w1oiM
         8VExVGeMqELgP7eGmqzC4Dal3FM6ylBBWxrsrdOiDyiCfvcxhms/Q2tXGloshCu09aG4
         feSsh5HZovrOef6gMOI8vHUSDGKj2VrKv5HCf3oAUtp51UaQeJJw6INTaE6e+dk+FrRm
         S49Q==
X-Gm-Message-State: AOAM532FKBIhRUtOifKc1DZb8pSbXomQMNb4cCIIc26LsuE++jgpiz39
        zQrGV9O6DNzd4K274yw2Yw==
X-Google-Smtp-Source: ABdhPJwtKQwS8Gi3pDPIlZI5JEncLbmyXnT+ngYSWpyLnhIFwPETb9SdRk81hmxd9JJ/MwuNbUM+5Q==
X-Received: by 2002:a9d:3e0d:: with SMTP id a13mr3371526otd.194.1607544771739;
        Wed, 09 Dec 2020 12:12:51 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y10sm593219ota.42.2020.12.09.12.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 12:12:50 -0800 (PST)
Received: (nullmailer pid 863704 invoked by uid 1000);
        Wed, 09 Dec 2020 20:12:49 -0000
Date:   Wed, 9 Dec 2020 14:12:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: Input: tm2-touchkey - document
 vddio-supply
Message-ID: <20201209201249.GA863661@robh.at.kernel.org>
References: <20201203131242.44397-1-stephan@gerhold.net>
 <20201203131242.44397-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203131242.44397-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 03 Dec 2020 14:12:41 +0100, Stephan Gerhold wrote:
> The Samsung touchkey controllers are often used with external pull-up
> for the interrupt line and the I2C lines, so we might need to enable
> a regulator to bring the lines into usable state. Otherwise, this might
> cause spurious interrupts and reading from I2C will fail.
> 
> Document support for a "vddio-supply" that is enabled by the tm2-touchkey
> driver so that the regulator gets enabled when needed.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/input/cypress,tm2-touchkey.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
