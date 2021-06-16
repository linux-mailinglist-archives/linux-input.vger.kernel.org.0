Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB8C3AA2D0
	for <lists+linux-input@lfdr.de>; Wed, 16 Jun 2021 20:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhFPSEw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Jun 2021 14:04:52 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:45820 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFPSEw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Jun 2021 14:04:52 -0400
Received: by mail-io1-f44.google.com with SMTP id k5so114576iow.12;
        Wed, 16 Jun 2021 11:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BwJG53yeIKpwmHLQ3ka5oXerXYUJ0GJWceYTPITcxG0=;
        b=G8PF7SVH8texhIx/BwQMUBT1Aphw9z5PnDHCCL1aTjXU96D0FuREqEDB9UnhliKmg6
         3DAq/HtKgf05HThVja7f9KwOLsCpgWfBcigMob9kmmY4DhETBrRmKhmXsW2wBgG8SwQN
         Gj7A2eevXaTaB16gAeluc9va7iIxJMYJpcOGNNE39ycYWUGfei4BCjQp3V681gk+RI+F
         fo3uypFb5CxfT4iiDCPGAFxFdbX6NHr5eU+tNNNYZ2YbT2kqgWV1fqG2rzImbnchv/f8
         uc9YRgZU1Hjx9B5cGmk+ssEThD5kXCCHP1JA7xMAr/k68ol6XAkdf8yHXTT0Mu18p67r
         sjdA==
X-Gm-Message-State: AOAM533f29xGc1Z9Ia+Jz5SLdxMKpanrVSgbWkdSnAohkj38f034UpLY
        1fVmnOgVarF7wEc5JBqYeyg0mYNyTg==
X-Google-Smtp-Source: ABdhPJyNJ4hbhowQxMaqjBKIJh8+VQAdyz5O3aEnc7NVjg6pZ3FhmJ+XTvjahMVuYHzbCajW+WmBVw==
X-Received: by 2002:a02:cc89:: with SMTP id s9mr575167jap.43.1623866565691;
        Wed, 16 Jun 2021 11:02:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d7sm1397131ilv.79.2021.06.16.11.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 11:02:44 -0700 (PDT)
Received: (nullmailer pid 3626047 invoked by uid 1000);
        Wed, 16 Jun 2021 18:02:43 -0000
Date:   Wed, 16 Jun 2021 12:02:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb
 ili2xxx bindings
Message-ID: <20210616180243.GA3624758@robh.at.kernel.org>
References: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 11 Jun 2021 15:54:27 +0200, Geert Uytterhoeven wrote:
> While Linux uses a different driver, the Ilitek
> ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller Device Tree
> binding documentation is very similar.
> 
>   - Drop the fixed reg value, as some controllers use a different
>     address,
>   - Make reset-gpios optional, as it is not always wired.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/input/ilitek,ili2xxx.txt         | 27 -------------------
>  .../input/touchscreen/ilitek_ts_i2c.yaml      |  7 +++--
>  2 files changed, 5 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
> 

One driver or 2, I don't care from a binding perspective if sharing 
works.

Reviewed-by: Rob Herring <robh@kernel.org>
