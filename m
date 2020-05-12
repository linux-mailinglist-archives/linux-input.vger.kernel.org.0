Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA13D1D02D6
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 01:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbgELXF7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 19:05:59 -0400
Received: from vps.xff.cz ([195.181.215.36]:42250 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727104AbgELXF7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 19:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1589324757; bh=blZoiLTu+A/avnSXLStZACMQViZsw7dUh1Z6i4t2+kc=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=MbiVsmNqQbA3s6tCEZDKId9/06UVSeWvW3s2p5J+RiuGPnl2vmJ23ft11kWJu1pe3
         9j9B+V77r87Y6tThPEuo6W7svzgEbvQaZcoaRMYtWwj9aHdsEfiTByqxM6d3r+D5xJ
         fK5AiiQOLtJPtWhlb3tG0auFZF432GWb7dAZwNd4=
Date:   Wed, 13 May 2020 01:05:57 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: input: gpio-vibrator: Don't require
 enable-gpios
Message-ID: <20200512230557.zvdgwhbqygc2fufv@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Luca Weiss <luca@z3ntu.xyz>, Tomas Novotny <tomas@novotny.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>
References: <20200512222205.1456300-1-megous@megous.com>
 <20200512222205.1456300-2-megous@megous.com>
 <20200512225212.GE89269@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512225212.GE89269@dtor-ws>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 12, 2020 at 03:52:12PM -0700, Dmitry Torokhov wrote:
> On Wed, May 13, 2020 at 12:22:02AM +0200, Ondrej Jirman wrote:
> > It is possible to turn the motor on/off just by enabling/disabling
> > the vcc-supply.
> > 
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/input/gpio-vibrator.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> > index 2384465eaa19..c700b640bd53 100644
> > --- a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> > +++ b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> > @@ -24,7 +24,6 @@ properties:
> >  
> >  required:
> >    - compatible
> > -  - enable-gpios
> 
> Hmm we need at least one of the 2 (gpio and supply). Should we encode it
> in the binding?

Not sure how to encode either one or the other property being required, but
not both at once.

Maybe I can add a supply-vibrator compatible to the driver and binding and
make requirements dependent on the compatible?

> Also, in the dirver code, I guess we need to switch to have regulator
> optional (so we are not given the dummy one) and bail if neither
> regulator nor GPIO is found.

Though nothing bad will happen in the driver if binding will lack both
of these. The driver will just not control any HW, so at least it's
failsafe as is.

regards,
	o.

> Thanks.
> 
> -- 
> Dmitry
