Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842E02A6FD7
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 22:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgKDVoY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 16:44:24 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39178 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgKDVoY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 16:44:24 -0500
Received: by mail-oi1-f193.google.com with SMTP id u127so23784189oib.6;
        Wed, 04 Nov 2020 13:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e4NpFDFmZaPriK3ND2LGW7qVbb33EM7ULOQUiheU7vQ=;
        b=l39OYGFL6AZPJW0qpARutdCqu7QNu3yUoo943pxBYhAs27/2tSoMIgPTDepu4CVv85
         kuGhWlM81ko1WqSNlUF/cNYKaOL+Dcn9tbzSoxyO3kATC/2xi3LpqMCgzY4BFfdOmCGQ
         T2ZdEyg5DXzFewKCLfIUCfn+gQA5LRKb7WBZ3Lc7t2xvsJXOyBlJNtMDedBRFdhK3+NX
         rus48Sewy/hfIe6hmFJjXS5KLURdDcfCer1GKHKUuQFa2BkrUZtzrEl0b8eY7JpxLm8e
         XqD+ajNnO5ojFHshd7hbz85QgCPRW6Gim8Utn1yRFVi4Pz2FgDFX7E8QK57DLmlaVoe5
         1Rgg==
X-Gm-Message-State: AOAM5307tU/3tONtz/VIb9WqEXntAWOd/5SlpxmHXUdbu2gkfkOeYppx
        5CBtG1++JR++FIlK4Medi+aBR64YXw==
X-Google-Smtp-Source: ABdhPJxHBS5n23f3/6zaBWLu1cJgpOHCRMy7pEWRwgdAqu0qb5PUkPgQB+IGQjvvm0AE8mRxboxAKA==
X-Received: by 2002:aca:b909:: with SMTP id j9mr3982850oif.132.1604526263338;
        Wed, 04 Nov 2020 13:44:23 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i12sm869300oon.26.2020.11.04.13.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 13:44:22 -0800 (PST)
Received: (nullmailer pid 4175239 invoked by uid 1000);
        Wed, 04 Nov 2020 21:44:21 -0000
Date:   Wed, 4 Nov 2020 15:44:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrej Valek <andrej.valek@siemens.com>
Cc:     nick@shmanahar.org, hadess@hadess.net, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: goodix
Message-ID: <20201104214421.GA4172944@bogus>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201029170313.25529-3-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029170313.25529-3-andrej.valek@siemens.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 29, 2020 at 06:03:12PM +0100, Andrej Valek wrote:
> Add information about option how to disable FW loading for each boot.

Please fix your subject.

> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> index da5b0d87e16d0..e7d9404c86abf 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> @@ -53,6 +53,7 @@ properties:
>    touchscreen-size-x: true
>    touchscreen-size-y: true
>    touchscreen-swapped-x-y: true
> +  touchscreen-do-not-load-fw: false

This is not a generic touchscreen property. It needs a vendor prefix.

>  
>  additionalProperties: false
>  
> -- 
> 2.20.1
> 
