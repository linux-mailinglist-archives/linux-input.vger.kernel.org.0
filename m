Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80F872D5296
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 05:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732171AbgLJEHs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 23:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732490AbgLJEHe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 23:07:34 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B46AC061793
        for <linux-input@vger.kernel.org>; Wed,  9 Dec 2020 20:06:54 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id t18so2121925plo.0
        for <linux-input@vger.kernel.org>; Wed, 09 Dec 2020 20:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0GPEqIaWJcqLf7P6askLTC3D31i4Szuh6Rq0AHAG9Tc=;
        b=TdUOb18rR3jHySMqE+Q4DwihstlzSQ39+NVElGJvJpMBKrAdlt24K0j0MysT8LKgm4
         behPcXhCeHvZMq8p+ZFntxxntoVss7iU8CNoucTM1ahvuF1myQnpjqWQQddGhyiz1MwB
         orWcniOmCDjZmEO3BdmyrTXBhJu8nZpc1kDkcojqIiI+mjXDXPmXUSiVlrn8RcpK4f4n
         kO5gmAQ0wYxsp9wbiKViUW84oZCvuozrZTDkiKJ7ZlsTO4VPT5xfRM/WqLiS27bAr3DC
         Pg5e+Vk8LkcjbU61hxu/w9S+dtIQh7OSA8SmP4TGRS5GOqQV9OfRwmWsJChYjXS/Fp6M
         0FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0GPEqIaWJcqLf7P6askLTC3D31i4Szuh6Rq0AHAG9Tc=;
        b=M0NBx7eFFHQNapSoFCbD5NHDXjHz0E/fJ64jE/IJ1Yy2mpLjFPfq7oennBBv0y9hB+
         06rb0eXMWaJ33XL44nzcpqYrWaY/INSLcEbDAU+AJygKvN7J6hgmTcBsNvm8WUSZ8rMy
         WhoJOGI/0Sb51ChPBS9wQfzQ+KQtOONdQ/T4wRW3PT2t//vE6Ghkov5U9jKCoyTF5Sc4
         hOrYwG/c5BxZPACALuq5GaQMEo0s61ALjp15v7FuUT1n9ElcfD9XI6GwiEWaQR31GWlk
         VLJuMETQsUA+3vPpF6QokYkSVOdoYT5CxvRxlWVi2DuR1ObJsinuMHML4Inhhw2pE0UJ
         Lxug==
X-Gm-Message-State: AOAM531uUwH2e/Y8DC0bCYGNutKd2Kc4xl1QqYlmpprmPLSn9NUYNqda
        v+IIqZR7Cx94HwZIOvs4+aOH
X-Google-Smtp-Source: ABdhPJxRZ9O4Ut3GXyiS1qDLjT465suH8On/iOHxAyw+WES6Fr5N5oEeYnc/3qrG4cAeqcHet71dYQ==
X-Received: by 2002:a17:902:b18c:b029:da:fc41:baf8 with SMTP id s12-20020a170902b18cb02900dafc41baf8mr5059919plr.58.1607573213512;
        Wed, 09 Dec 2020 20:06:53 -0800 (PST)
Received: from thinkpad ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id t15sm4063549pja.4.2020.12.09.20.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 20:06:52 -0800 (PST)
Date:   Thu, 10 Dec 2020 09:36:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: input: Add reset-time-sec common
 property
Message-ID: <20201210040644.GC6466@thinkpad>
References: <cover.1607216141.git.cristian.ciocaltea@gmail.com>
 <c08349db08db67e71cf428fe7fd53624aaa0acf8.1607216141.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c08349db08db67e71cf428fe7fd53624aaa0acf8.1607216141.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 06, 2020 at 03:27:01AM +0200, Cristian Ciocaltea wrote:
> Add a new common property 'reset-time-sec' to be used in conjunction
> with the devices supporting the key pressed reset feature.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> ---
> Changes in v3:
>  - This patch was not present in v2
> 
>  Documentation/devicetree/bindings/input/input.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
> index ab407f266bef..caba93209ae7 100644
> --- a/Documentation/devicetree/bindings/input/input.yaml
> +++ b/Documentation/devicetree/bindings/input/input.yaml
> @@ -34,4 +34,11 @@ properties:
>        specify this property.
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> +  reset-time-sec:
> +    description:
> +      Duration in seconds which the key should be kept pressed for device to
> +      reset automatically. Device with key pressed reset feature can specify
> +      this property.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +

Why can't you just use "power-off-time-sec"?

Thanks,
Mani

>  additionalProperties: true
> -- 
> 2.29.2
> 
