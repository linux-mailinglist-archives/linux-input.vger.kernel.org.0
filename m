Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C6E1D028C
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 00:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgELWwQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 18:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELWwQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 18:52:16 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF852C061A0C;
        Tue, 12 May 2020 15:52:15 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q24so10116944pjd.1;
        Tue, 12 May 2020 15:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L8tksuSDTqs67QtjinsHE4FheuuliIT8AjKoc4ucm54=;
        b=A+aCawbyEMDcOaXESvLqmbZABWw9O6EP2s1AngbXLV2jFIlhagWHaNG/zKjJM2RhFx
         zR4GIbUSqtZJSgejE1vf8+vegxIzPbGyVYxtbx7Sl6ZFU7jT0DgnrOAM/PpuOSJsUNex
         ociJ4yn2NMIxKt+ipD9wQM7WQ8Z8Ygwn/nKw56/uOd2ygIegOMO5lGFdn6ZFbNuhwQeq
         fqbZNZMncqohFrxIOZq7UENBmTJw+EzF/ChjImjT+PVEz6Zm2ogd4nnvSD5b3goCf5lm
         bu6L9fnzBNIH9phxEleqG+Q4AJiTnHttCCBooCe3hgtQy5Dm9JgzUAi44UmBHKWlzh3N
         qcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L8tksuSDTqs67QtjinsHE4FheuuliIT8AjKoc4ucm54=;
        b=CPmvJJ/29L3lRda0Pa76z/h4gkAGYU46JhvBEHGFSzszKFYCZ4+nfuEO8NZ2MRB01g
         HKRbOEQ+e+h4xuKU1AzDIT9fa/fRSxJpO2WOIRs3x6w2jyl477NsXnFYtkb6GYVC5cRT
         f5pbdR6NE62NTkRcanOf/PY11MKY690tOJBNu/US7msVmie9gCrBx38IZjyOvLyxGAfn
         yQxr5oUMgY3WMdKQfFLsNSHwVxyEFr5OzjYIENFxA25M16ErYDQ8jMMehpYpeVlXn1nk
         hJ21zKawsl8PBl29zCDTrCv1bd9PsT6p8kzyjdANeTMV5lSFA+4JchOwif0lQ4MBx+3n
         EylA==
X-Gm-Message-State: AOAM531Rh9gFRLX5U9rwPTV4VaZDJW13VqQeHWK/0i1bAsICSxTxqhpS
        6ZLZgLEC97dDqKLxVZQDioI=
X-Google-Smtp-Source: ABdhPJwDUrxJZKSLp+Xr6kWbTqL3Ofq02Ayex445wtfRyI6/RGyZxIFRJC7Rb3atq+Syq8sFipfKUw==
X-Received: by 2002:a17:90a:344c:: with SMTP id o70mr5619516pjb.23.1589323935225;
        Tue, 12 May 2020 15:52:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id z1sm13623932pjn.43.2020.05.12.15.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 15:52:14 -0700 (PDT)
Date:   Tue, 12 May 2020 15:52:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: input: gpio-vibrator: Don't require
 enable-gpios
Message-ID: <20200512225212.GE89269@dtor-ws>
References: <20200512222205.1456300-1-megous@megous.com>
 <20200512222205.1456300-2-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512222205.1456300-2-megous@megous.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 13, 2020 at 12:22:02AM +0200, Ondrej Jirman wrote:
> It is possible to turn the motor on/off just by enabling/disabling
> the vcc-supply.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/input/gpio-vibrator.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> index 2384465eaa19..c700b640bd53 100644
> --- a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> +++ b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> @@ -24,7 +24,6 @@ properties:
>  
>  required:
>    - compatible
> -  - enable-gpios

Hmm we need at least one of the 2 (gpio and supply). Should we encode it
in the binding?

Also, in the dirver code, I guess we need to switch to have regulator
optional (so we are not given the dummy one) and bail if neither
regulator nor GPIO is found.

Thanks.

-- 
Dmitry
