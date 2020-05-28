Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378AF1E6E48
	for <lists+linux-input@lfdr.de>; Fri, 29 May 2020 00:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436819AbgE1WBo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 18:01:44 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:40421 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436810AbgE1WBk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 18:01:40 -0400
Received: by mail-il1-f194.google.com with SMTP id a18so501799ilp.7;
        Thu, 28 May 2020 15:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ypTe2PhllcbFDiwKFVMlag8IDVx6GgqoGKohXERCZBQ=;
        b=nNIzupTrdmf9NfYSrznPeZOZaB6auMqjmpaOaCMkgLy4aYVigIfndKo6MLM1EXwA/8
         f7PK8HSnjlnoeVC8aPUe3A9/iAYMB8BHlIzMK4Kv2R8S1Gq4m54FAShxFPLmyL1XFpqJ
         4PezSh6/rt1AH4P/IOHuIn/FdFjsdlMKZB4gkOopdRUxdZzRVNC/nTKz9J9I4vLqAn+/
         Lf2+W+3ssLF/rg4eSkTbIhTDIcRklSKWhyj9A5ZLRfTc8/DUYwHGs+5wvfZO04fEyNAa
         fM8CieQd8B4MbM947f8RX5pcx5NOTpBaVRdQi8FY9OEQlpr6/NRR7g+YlSKf4c7OLONN
         CE2w==
X-Gm-Message-State: AOAM531FCt23Q8J/iQXVfomO3RLWE7E0X6PUh5hd4+SKbAIB8vTXWS0r
        w/WS+YR0Xl6I0IjF+V20xw==
X-Google-Smtp-Source: ABdhPJzFT3oU/vjsNRn309VDH/DNiO+Z5WPTFKoWeipwpTJAZ6V1gzsWGOibx8+mO77rr6DZOlHjqA==
X-Received: by 2002:a92:2801:: with SMTP id l1mr5040474ilf.132.1590703298885;
        Thu, 28 May 2020 15:01:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f9sm3853884ile.39.2020.05.28.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 15:01:38 -0700 (PDT)
Received: (nullmailer pid 760172 invoked by uid 1000);
        Thu, 28 May 2020 22:01:36 -0000
Date:   Thu, 28 May 2020 16:01:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johan Jonker <jbx6244@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: edt-ft5x06: change reg
 property
Message-ID: <20200528220136.GA748777@bogus>
References: <20200520073327.6016-1-jbx6244@gmail.com>
 <20200520171324.GS89269@dtor-ws>
 <4727344.YYj2SkWT1V@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4727344.YYj2SkWT1V@diego>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 20, 2020 at 08:41:59PM +0200, Heiko Stübner wrote:
> Hi Dmitry,
> 
> Am Mittwoch, 20. Mai 2020, 19:13:24 CEST schrieb Dmitry Torokhov:
> > Hi Johan,
> > 
> > On Wed, May 20, 2020 at 09:33:27AM +0200, Johan Jonker wrote:
> > > A test with the command below gives this error:
> > > 
> > > arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml:
> > > touchscreen@3e: reg:0:0: 56 was expected
> > > 
> > > The touchscreen chip on 'rk3188-bqedison2qc' and other BQ models
> > > was shipped with different addresses then the binding currently allows.
> > > Change the reg property that any address will pass.
> > > 
> > > make ARCH=arm dtbs_check
> > > DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/touchscreen/
> > > edt-ft5x06.yaml
> > > 
> > > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> > > index 383d64a91..baa8e8f7e 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> > > @@ -42,7 +42,7 @@ properties:
> > >        - focaltech,ft6236
> > >  
> > >    reg:
> > > -    const: 0x38
> > > +    maxItems: 1
> > 
> > Should we have a list of valid addresses instead of allowing any
> > address? Controllers usually have only a couple of addresses that they
> > support.
> 
> from what I've read, the fdt touchscreen controllers are just a generic
> cpu with device-specific (or better panel-specific) firmware, which seems
> to include the address as well - so it looks to be variable.
> 
> But of course that is only 2nd hand knowledge for me ;-)
> 
> 
> But also, the i2c address is something you cannot really mess up,
> either it is correct and your touchscreen works, or it isn't and and
> adding entries to this list every time a new address variant pops up
> feels clumsy.

Is that an Ack?

I'm fine either way. It's really only useful if there's a single 
address because with a list it could still be wrong just as any other 
data like an interrupt number could be wrong.

Rob
