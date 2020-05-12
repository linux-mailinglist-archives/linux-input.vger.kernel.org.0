Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F821D02FC
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 01:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgELXZJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 19:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgELXZI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 19:25:08 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94FCC061A0C;
        Tue, 12 May 2020 16:25:08 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n11so6890378pgl.9;
        Tue, 12 May 2020 16:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FpcFfkc/yG9vq9eXWklG8CGjwtKug3YGgFN39WyeyGc=;
        b=pWipj/rYO4TE/WgccVGCKMhCO9dOQMqbFgFILxy9bPyfdAGU1AtXDDAPLFE5d8BWYI
         y8h0guWLroeHHFvshFPgfDBEmOBlBrNj/JhqWtissEv8GDGrkVAGwfcj/J+til5ld39Q
         thnBvYCXu26hayF9UigwA4E9gGpRbfhzbNfY/sY6qG4jAQD+dccELCfuxT/jEOuK3mGm
         elBCMpGuoEH9Rv6OALCkus/pHOOWd8KbSHckTf5EJDK0m38v+T6292Y/4FG6gZAmN3QS
         UamcfP8ImTECWAyv7V7C5ACDg9cHr4B4WH7xilGOx3JOD2eacTv87TnouwuuY5P6NUZ8
         sDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FpcFfkc/yG9vq9eXWklG8CGjwtKug3YGgFN39WyeyGc=;
        b=eucHbVcoeZKTHw4N+fONryzFzIJ6K58dJBWwPxnyam7yxTIFzkNIxc3krH9BHdQ3C3
         mEiSt3HtAHvgHhy8CQRLMF9LGleckaGJuZPhjz4TyB94S/VnlvGnjBTGP30HtVd3RdW9
         8uJ1yVemvKq0Zem/VSn/w8PoL+b9fME1NvckLqrhDLTaoQGIxtFhTAPatAc2EWwdnTAW
         PUHRJEr4/OsGoU0yC/xtSnsxYOb9U/krmh2Hermfbb9DMQwpA8BB06Sx7/rd6+dqq3SP
         VWKvzsWeLNq9wNqmAqy81cCqrTHFSYKlaB4HDuL6RiUJ79LmSh96Bqj/5e3SiEHFxdeN
         fFog==
X-Gm-Message-State: AOAM531TNah3Gyt+w30CfgUloAjh5yKJ5eE1U5myq86GIWCbM1RDq0l4
        IsfvqFWaEX2A8IFF9EodjAk=
X-Google-Smtp-Source: ABdhPJzLZlncWatTS+oNiA4vxd3oVeXcykQQb3eNLFClvMbGM8HbwrjGaxKq48Gne8Qhoh171ik1lA==
X-Received: by 2002:a63:77c6:: with SMTP id s189mr12368295pgc.267.1589325908104;
        Tue, 12 May 2020 16:25:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id m4sm94819pje.47.2020.05.12.16.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 16:25:07 -0700 (PDT)
Date:   Tue, 12 May 2020 16:25:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: input: gpio-vibrator: Don't require
 enable-gpios
Message-ID: <20200512232505.GF89269@dtor-ws>
References: <20200512222205.1456300-1-megous@megous.com>
 <20200512222205.1456300-2-megous@megous.com>
 <20200512225212.GE89269@dtor-ws>
 <20200512230557.zvdgwhbqygc2fufv@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512230557.zvdgwhbqygc2fufv@core.my.home>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 13, 2020 at 01:05:57AM +0200, Ondřej Jirman wrote:
> On Tue, May 12, 2020 at 03:52:12PM -0700, Dmitry Torokhov wrote:
> > On Wed, May 13, 2020 at 12:22:02AM +0200, Ondrej Jirman wrote:
> > > It is possible to turn the motor on/off just by enabling/disabling
> > > the vcc-supply.
> > > 
> > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/input/gpio-vibrator.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> > > index 2384465eaa19..c700b640bd53 100644
> > > --- a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> > > +++ b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
> > > @@ -24,7 +24,6 @@ properties:
> > >  
> > >  required:
> > >    - compatible
> > > -  - enable-gpios
> > 
> > Hmm we need at least one of the 2 (gpio and supply). Should we encode it
> > in the binding?
> 
> Not sure how to encode either one or the other property being required, but
> not both at once.
> 
> Maybe I can add a supply-vibrator compatible to the driver and binding and
> make requirements dependent on the compatible?

Rob is our bindings overlord... I'll defer to him here.

Thanks.

-- 
Dmitry
