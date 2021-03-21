Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A31343588
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 23:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhCUWwq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 18:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhCUWw3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 18:52:29 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FF3C061574;
        Sun, 21 Mar 2021 15:52:29 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 11so9717101pfn.9;
        Sun, 21 Mar 2021 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O42IXO9/PRSvcgsOSdiISHmofQMCY7XDn/GFKXylUKo=;
        b=uvpQUKcS/DwH5aVSebXFsuSWwx36/tELpzRll7QkersSlyqMfhlSdqi4UVjQDw5YEh
         i+P6mUrlsS3z76SOFnH+PaSnL78XfYxU4pYpB6QWIt0fv+udvqX3g+kjpprkP6TWQ+Sw
         jNArqqp+SCWygm55Csd65eJ7GBoZtOJnQnQ00kDVn2RQZ7GZ2wA4DEnmKZ3FxvoNHsM+
         AW78L1SK++vzu20mQY9C4BnGwZweHbPVfMt8XLgvAeOtPGWMIA3D56uifrPmA56iPe2q
         eUfjTGIM71W5F7CLQgbwyYwEbh2eBvCMKlq4LQ5uiWQtqwS0CnA5xKG111RY62SU1qjO
         FVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O42IXO9/PRSvcgsOSdiISHmofQMCY7XDn/GFKXylUKo=;
        b=jAezQU5ihwTNLgVaTfkR3bqIP1dUrHqi4sQH/lr7oyH0q++Hq3VfYk/ClgzqVRxVXP
         DekPzhM1fwMrHZ3fCt8EfwIHnyagHy5CHDPKbiH9W/DmJV9tJkspwwqg4YE1IS3nkTKN
         0NmhH5FbmgRdZaR8hz0ar/gL+QGUSdo+jCr4c0pvm5EBslqszfY7ZLZkCqg2H9nXPrFg
         kAjGGkYRF0UzVfiSV6OruSUEPM4vD/eC520GHKW4xUz0hvB1T7Z8Cwz2UWkOqq+jzmQX
         cB5CUPq/N3Eh0Ik0COe+AA98a0vbR9bw+NtnKWuv5BFJ4XgnSkwn2wJ5CSih7AtFKKK/
         J/AA==
X-Gm-Message-State: AOAM5317iqjZ8rEx4MScJ7P0cYVAJ0bM2HCxsjXkCl95P5hM6E6jppqx
        VRkRIoNNx7U9dC7eCesQgB0=
X-Google-Smtp-Source: ABdhPJzrurTCeauQoOMBeE4I9Z7bCH97DzkYVEfvxxYVcXHSkMJHfz42dUuHAn1bMJ6tts9c6j60Cw==
X-Received: by 2002:a63:e1b:: with SMTP id d27mr20294863pgl.135.1616367148653;
        Sun, 21 Mar 2021 15:52:28 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id w203sm11595550pff.59.2021.03.21.15.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 15:52:27 -0700 (PDT)
Date:   Sun, 21 Mar 2021 15:52:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: atmel,maxtouch: add wakeup-source
Message-ID: <YFfOKHzmtvdcB2cG@google.com>
References: <20210212163806.69996-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212163806.69996-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 12, 2021 at 05:38:06PM +0100, Krzysztof Kozlowski wrote:
> The touchscreen can be a wake up source and it's being used in DTS:
> 
>   arch/arm/boot/dts/exynos5250-spring.dt.yaml:
>     trackpad@4b: 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied, thank you.

-- 
Dmitry
