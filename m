Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924DED31C9
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 22:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfJJUBk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 16:01:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43095 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfJJUBk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 16:01:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id a2so4569593pfo.10;
        Thu, 10 Oct 2019 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dggle1lGDx8Qxx2mqkDfOTmU1YgQVIaDK+cCDPiyRrg=;
        b=hQnqM6WGFZhl0JRy8EwNgFKkqCDKIubhYK3RWdajapd+uR30F5eBnMafVApx80xeCG
         5WKBMSz3wLXTVQPcTjBWsNnBVJgR5dRuZTDB8wNaUUFJ+McOE7nxZZvIE9iIhiHD79ds
         3ohmn6J2GxZzBFy7VvthYMa8Z5nDdMwLvDPlIDIM+kZ93FY3ehvu45WjK0JE7R06fJq2
         vYswdGBpZuf8+CqpuaaXqtbd0FOK9npTe1GSExe1qsNwJfELk4SULqgMIMoFc95BoxRO
         RYKEoBY186D7+eVG4si6As8R1HGUUzPfpM9bguZgtZ0/9mVW+4xufnJXbg09O//QWNVy
         vxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dggle1lGDx8Qxx2mqkDfOTmU1YgQVIaDK+cCDPiyRrg=;
        b=bLi055TmYsFhlja7QRQqaACjZPk48A3pp+W1/YNL51ZmjGerJ1bNL4hwniCt1b3VI7
         tagy6bL9ejg1F33SmuazW2cJXu47V4hsqP/B0Qfxeyr/NpvCWemjNjl4gwqYGOkfp9pU
         38xxN1Q+C+vGB2+AKYqXxR2r9l5oEzzH8UEwDEpwPKDABAipfy4Xepz+4Uw4qZue4xw2
         d+yRzGIcyMGRBgZPNaf+cwzgEshNipWd1V6vqZv32W/3G5dtvQ5GiZ1c2KgD6152m4Yr
         sHHuf/AJHd5HJyzNaaA9c4HSHVJIqbfmtAOuqOEyV54sshO8XWime8S2NVV6scQHBzuL
         nXOg==
X-Gm-Message-State: APjAAAXIoDtsP1SPYETrBOLm5fOeVJTe+NGAWt7Y0JX13KmJpS/I34m/
        hyzQGa+wiXKX3y43zMYjrvw=
X-Google-Smtp-Source: APXvYqxMsLhxvyWy3WqrCHakPPHIs5iTo1iLOsq2x5o1nTva822FdlllXF7lvvRBz04iUrzn0FTkJg==
X-Received: by 2002:aa7:821a:: with SMTP id k26mr12716528pfi.184.1570737698768;
        Thu, 10 Oct 2019 13:01:38 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r21sm7721967pfc.27.2019.10.10.13.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 13:01:38 -0700 (PDT)
Date:   Thu, 10 Oct 2019 13:01:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: input: Add poll-interval property
Message-ID: <20191010200136.GA229325@dtor-ws>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-4-git-send-email-michal.vokac@ysoft.com>
 <20191010194036.GA16869@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191010194036.GA16869@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 10, 2019 at 02:40:36PM -0500, Rob Herring wrote:
> On Thu, Oct 03, 2019 at 08:12:54AM +0200, Michal Vokáč wrote:
> > Add an option to periodicaly poll the device to get state of the inputs
> > as the interrupt line may not be used on some platforms.
> > 
> > Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> > ---
> > Changes since v2:
> >  - None
> > 
> > Changes since v1:
> >  - Use poll-interval instead of linux,poll-interval.
> >  - Place the poll-interval binding into the common schema.
> >  - Properly describe that either interrupts or poll-interval property is
> >    required.
> >  - Fix the example to pass validation.
> > 
> >  .../bindings/input/fsl,mpr121-touchkey.yaml        | 25 +++++++++++++++++++++-
> >  Documentation/devicetree/bindings/input/input.yaml |  4 ++++
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> > index c6fbcdf78556..035b2fee4491 100644
> > --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> > +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> > @@ -17,6 +17,10 @@ description: |
> >  allOf:
> >    - $ref: input.yaml#
> >  
> > +oneOf:
> 
> It should be valid to have both properties present, right?

The poll does not really sense and does not have any effect when
interrupt is supplied.

> The h/w description can't know what the OS supports.

It also has no idea what OS does at all and whether it even pays
attention to any of these properties. We are just trying to say here "I
do not have an interrupt wired, so for this device's primary use case
(that is coupled with a certain $PRIMARY OS) we need to poll the
controller ever so often to handle our use case".

> In that case, we should use 'anyOf' here instead.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> > +  - required: [ interrupts ]
> > +  - required: [ poll-interval ]
> > +
> >  properties:
> >    compatible:
> >      const: fsl,mpr121-touchkey
> > @@ -41,12 +45,12 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > -  - interrupts
> >    - vdd-supply
> >    - linux,keycodes
> >  
> >  examples:
> >    - |
> > +    // Example with interrupts
> >      #include "dt-bindings/input/input.h"
> >      i2c {
> >          #address-cells = <1>;
> > @@ -64,3 +68,22 @@ examples:
> >                               <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
> >          };
> >      };
> > +
> > +  - |
> > +    // Example with polling
> > +    #include "dt-bindings/input/input.h"
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        mpr121@5a {
> > +            compatible = "fsl,mpr121-touchkey";
> > +            reg = <0x5a>;
> > +            poll-interval = <20>;
> > +            autorepeat;
> > +            vdd-supply = <&ldo4_reg>;
> > +            linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
> > +                             <KEY_4>, <KEY_5>, <KEY_6>, <KEY_7>,
> > +                             <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
> > index ca8fe84a2e62..6d519046b3af 100644
> > --- a/Documentation/devicetree/bindings/input/input.yaml
> > +++ b/Documentation/devicetree/bindings/input/input.yaml
> > @@ -24,6 +24,10 @@ properties:
> >            minimum: 0
> >            maximum: 0xff
> >  
> > +  poll-interval:
> > +    description: Poll interval time in milliseconds.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> >    power-off-time-sec:
> >      description:
> >        Duration in seconds which the key should be kept pressed for device to
> > -- 
> > 2.1.4
> > 

-- 
Dmitry
