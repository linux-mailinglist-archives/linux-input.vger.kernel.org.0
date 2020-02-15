Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA59160125
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgBOXlD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:41:03 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39285 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOXlD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:41:03 -0500
Received: by mail-pf1-f194.google.com with SMTP id 84so6907708pfy.6;
        Sat, 15 Feb 2020 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3LWccuMcZcCePAbZvw/rbhcrl4SciX5LpSgDf07BHYY=;
        b=b2tI0/J0q8pkv906REntCZeJF1FIwRKHfS5RoaBTDoPwmHZI4nqaVKhu7sZ61gm+xV
         t+g4dgTVg35CYxaUnPGthqJKF7c5TB56OduOUG7hCISN3n5fr8XPTxLi+RI1GZPD5KFL
         kwd1oikCSPTXLgsaML8Rddrmiz/QK/C5pCw78XnaBJv1z8BhsMBYXQLuy4YsRHLp1Ioe
         /YdLuae+xOFjDygFjtlLoirHTNcdnlqbABXYFxND+G/taxRFJG7frujBrZwkIL+lIKkH
         42SnOzaaa7LUz4q24H1YHi1VK32k562Zx2oqFp/svtP93H1tXiLBfDn+drmSyFA3dqmv
         kOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3LWccuMcZcCePAbZvw/rbhcrl4SciX5LpSgDf07BHYY=;
        b=OTiBNuzwYPEyIYQe7X3F1Jjk15ABehPwtgl3SiItvriKoFlUcw8n7BP3jFFVzoSqBp
         srlkniBjkgFneEJF3iW33gxWkBL54ki1L7Uynqvzin12PN/QliDSpW3pZQ31YCnq1Pv/
         ggW+tBTnXTvFtGPV1+yqAZAFnBgGJ0UUOCweP2Hv5uUYwcEEV2rt3DqlDAOdJLwOcu9o
         k65jOg92dnD+GI8fBht+rcFXYBvZJknCnS6uoljKgVS8HG2O6M2lTlVt5zuFmNJa5+sE
         rbOnLbEXloe2dc3KW/oPuKaA4B+b/XNVPE1vC51zgp+B7vUXGdVNy6bVm/Dpzq7fwqrY
         1gqA==
X-Gm-Message-State: APjAAAXkS4vgLdjuQ2fhbEf0INSmAepdnWRChPFo032fslUGWVhrqnbW
        gn72OOwSTJju5RiYPaVtKXY=
X-Google-Smtp-Source: APXvYqwuCl2ycbl85ebKjWaRj0vu0h+CVVloKlN3zrJtY3TWP9nECJMG5gs7HNuAoVw3jIVRRe82uw==
X-Received: by 2002:aa7:8ec1:: with SMTP id b1mr10047410pfr.95.1581810062313;
        Sat, 15 Feb 2020 15:41:02 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d15sm12419218pgn.6.2020.02.15.15.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:41:01 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:40:59 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     robh+dt@kernel.org, stephan@gerhold.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Coreriver vendor
 prefix
Message-ID: <20200215234059.GI183709@dtor-ws>
References: <20200121141525.3404-1-nick.reitemeyer@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121141525.3404-1-nick.reitemeyer@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 21, 2020 at 03:15:24PM +0100, Nick Reitemeyer wrote:
> Coreriver is a South Korean microcontroller manufacturer: http://coreriver.com
> 
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>

Applied, thank you.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 6046f4555852..77fb3c453014 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -199,6 +199,8 @@ patternProperties:
>      description: Colorful GRP, Shenzhen Xueyushi Technology Ltd.
>    "^compulab,.*":
>      description: CompuLab Ltd.
> +  "^coreriver,.*":
> +    description: CORERIVER Semiconductor Co.,Ltd.
>    "^corpro,.*":
>      description: Chengdu Corpro Technology Co., Ltd.
>    "^cortina,.*":
> --
> 2.23.0
> 

-- 
Dmitry
