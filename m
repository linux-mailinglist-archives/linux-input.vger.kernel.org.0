Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898C81505AF
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 12:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbgBCLyY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 06:54:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36916 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgBCLyX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Feb 2020 06:54:23 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so16649654wmf.2;
        Mon, 03 Feb 2020 03:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GsEDW/FBwDbqEDgsSOp7b8GtI71AOIhOF9dkOu8aKL8=;
        b=hsxKhjMDBRg5cSsv9EkNAsRoo/RLzzmuiq0p98K9Di2CctV6/EANQW+NsNIUB51sT8
         TKQeykVZ3jb8Rzx5uCBmXHPjAe0QjPr0uKDVoazhq3DiBWo+i7C3AaZF7zTiLiGNRIRl
         WTHxFRNBxsaO/qY/WUz5uBIDPKcCh+jMyVTbuszsDdmPbOzMeVgUtVBUvEcVmBhIPuh4
         NB7EMA7tI6tHVXCLdPo3KCCXAftNKaF+y79GtuNdiPHxlhusVOhewZPX+8vvT4p/ovnA
         wIm0IdARmMrHNM7qfhjZYfliNDvds3R2s8pUgMnSDsnYZmtfDpdC8Z4pTADsyBs0TGo7
         FgMw==
X-Gm-Message-State: APjAAAV1c5NOvfQi+Bcm7OAxWM2BOD2FWCPqz7T6COzvhCG9ZdWmBKDi
        BpWc/wX2ESBWCvFv89SunR9fXEZ8Dw==
X-Google-Smtp-Source: APXvYqxzbSM2JF3AX1i6UQDV1bhOBfs5HG8SEy6P4arYwtN9q5w5NeqP0JWJp/yg2WaBMB2NF0PadA==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr28013109wmj.96.1580730861147;
        Mon, 03 Feb 2020 03:54:21 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id s19sm22788368wmj.33.2020.02.03.03.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 03:54:20 -0800 (PST)
Received: (nullmailer pid 8764 invoked by uid 1000);
        Mon, 03 Feb 2020 11:54:19 -0000
Date:   Mon, 3 Feb 2020 11:54:19 +0000
From:   Rob Herring <robh@kernel.org>
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, stephan@gerhold.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Nick Reitemeyer <nick.reitemeyer@web.de>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Coreriver vendor
 prefix
Message-ID: <20200203115419.GA8706@bogus>
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

On Tue, 21 Jan 2020 15:15:24 +0100, Nick Reitemeyer wrote:
> 
> Coreriver is a South Korean microcontroller manufacturer: http://coreriver.com
> 
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
