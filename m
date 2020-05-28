Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92601E6E50
	for <lists+linux-input@lfdr.de>; Fri, 29 May 2020 00:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436841AbgE1WDA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 28 May 2020 18:03:00 -0400
Received: from gloria.sntech.de ([185.11.138.130]:60762 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436834AbgE1WC4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 18:02:56 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jeQbx-0005Eo-Rk; Fri, 29 May 2020 00:02:49 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johan Jonker <jbx6244@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: edt-ft5x06: change reg property
Date:   Fri, 29 May 2020 00:02:49 +0200
Message-ID: <12739492.Qs6HZxOyHu@diego>
In-Reply-To: <20200528220136.GA748777@bogus>
References: <20200520073327.6016-1-jbx6244@gmail.com> <4727344.YYj2SkWT1V@diego> <20200528220136.GA748777@bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Freitag, 29. Mai 2020, 00:01:36 CEST schrieb Rob Herring:
> On Wed, May 20, 2020 at 08:41:59PM +0200, Heiko Stübner wrote:
> > Hi Dmitry,
> > 
> > Am Mittwoch, 20. Mai 2020, 19:13:24 CEST schrieb Dmitry Torokhov:
> > > Hi Johan,
> > > 
> > > On Wed, May 20, 2020 at 09:33:27AM +0200, Johan Jonker wrote:
> > > > A test with the command below gives this error:
> > > > 
> > > > arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml:
> > > > touchscreen@3e: reg:0:0: 56 was expected
> > > > 
> > > > The touchscreen chip on 'rk3188-bqedison2qc' and other BQ models
> > > > was shipped with different addresses then the binding currently allows.
> > > > Change the reg property that any address will pass.
> > > > 
> > > > make ARCH=arm dtbs_check
> > > > DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/touchscreen/
> > > > edt-ft5x06.yaml
> > > > 
> > > > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> > > > index 383d64a91..baa8e8f7e 100644
> > > > --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> > > > @@ -42,7 +42,7 @@ properties:
> > > >        - focaltech,ft6236
> > > >  
> > > >    reg:
> > > > -    const: 0x38
> > > > +    maxItems: 1
> > > 
> > > Should we have a list of valid addresses instead of allowing any
> > > address? Controllers usually have only a couple of addresses that they
> > > support.
> > 
> > from what I've read, the fdt touchscreen controllers are just a generic
> > cpu with device-specific (or better panel-specific) firmware, which seems
> > to include the address as well - so it looks to be variable.
> > 
> > But of course that is only 2nd hand knowledge for me ;-)
> > 
> > 
> > But also, the i2c address is something you cannot really mess up,
> > either it is correct and your touchscreen works, or it isn't and and
> > adding entries to this list every time a new address variant pops up
> > feels clumsy.
> 
> Is that an Ack?

for the patch itself:
Acked-by: Heiko Stuebner <heiko@sntech.de>


> I'm fine either way. It's really only useful if there's a single 
> address because with a list it could still be wrong just as any other 
> data like an interrupt number could be wrong.
> 
> Rob
> 




