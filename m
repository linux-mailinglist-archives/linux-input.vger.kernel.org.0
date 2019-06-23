Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E2C4FA93
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 09:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfFWHFH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 03:05:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43428 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFWHFH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 03:05:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id cl9so5063324plb.10;
        Sun, 23 Jun 2019 00:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZnpCzo1NN9Md21LN3g8I3RIF4YViSRZP0r1Fx0SQ3qk=;
        b=jVEMmNei2LTirlxL0/IDX1B3y5pJJgi02yOX+2LKm83WV7r/qkwpHhzsDVlt4MlfsL
         gLxlBAYRm+LmbywgT2m3fCT+OqBuWeB+gJkMIzbzVFjwonTWm6SkxDbPTvzik5qSEMcf
         6YhwtJvv4gbVrCgwyAnBF4lfyoP9q0K6iR3ZxCNmHI0Ol0JEMSKrjAMIN6IfRCTiDwlX
         nVvzAqTzJKhY1fEuS5XoSJ4zXZ+AhVTsyEcxyrttBWrLd+3N7E7fyjEOfs/kgpdX4iTn
         ATpJlGA9iUR5jEJH8YgnCDaegvA6JtGOtXf1KuJeNAcui2MavguwTGnANMGl8+RC4thq
         62cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZnpCzo1NN9Md21LN3g8I3RIF4YViSRZP0r1Fx0SQ3qk=;
        b=hyny7k3MKC/spKyzNAkI7RSis1jFpuH7rLcWXksLjTz7Z6dE2UKW0/rddlVKc2Y/4u
         /K+hzZtb4fc7jZjOJSl5RZpeUTu/hlurCPwurArwb2q68+UDWO76gz7tzHXGcOfZ0WR1
         gB+CgJa2aImUpXmK0+5+Yy29BuZ/RLDeoPSFHndTbhrNz3ai3JELQlxp8JJO1f1S49Oe
         Ycfg6aB/YhMiamV3BGLo6xq0q2Mxeef3gq1r4bFNcA8tbuRRE3Y1IdwlfEFCfv5m6zZv
         cPnNwb2dnxLpHeLmZl+bW7dW16ePGIVQYTM/fGndglTuWfMLImBZ9ogdJSJK7T2TBLZf
         tU7g==
X-Gm-Message-State: APjAAAXGOipPiJaAwuhkjA8gDr2rMDNO6I/pIuuBNNWoaYcXaZ8sTpEL
        t/gZnPJCCTqNGBH6ZhoQdto=
X-Google-Smtp-Source: APXvYqw98NyNvej0S/JhvdpiCIMWy/Pmnw7NdOwIaICwB1nXmuJIZDwQ+TpJs8zZzwVw2jutwskfnw==
X-Received: by 2002:a17:902:2a26:: with SMTP id i35mr101268234plb.315.1561273506124;
        Sun, 23 Jun 2019 00:05:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r1sm7040201pji.15.2019.06.23.00.05.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 23 Jun 2019 00:05:05 -0700 (PDT)
Date:   Sun, 23 Jun 2019 00:05:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v1] Input: rotary-encoder - Add gpio as push button
Message-ID: <20190623070504.GE204275@dtor-ws>
References: <20190614133651.28396-1-mylene.josserand@bootlin.com>
 <20190614145158.ic5n4jauzigvcpru@flea>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190614145158.ic5n4jauzigvcpru@flea>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 14, 2019 at 04:51:58PM +0200, Maxime Ripard wrote:
> Hi Mylene,
> 
> On Fri, Jun 14, 2019 at 03:36:51PM +0200, Mylène Josserand wrote:
> > Add the support of a gpio that can be defined as a push button.
> > Thanks to that, it is possible to emit a keycode in case of a
> > "push" event, if the rotary supports that.
> >
> > The keycode to emit is defined using "linux,code" property
> > (such as in gpio-keys).
> >
> > Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> > ---
> >  .../devicetree/bindings/input/rotary-encoder.txt   |  5 +++
> >  drivers/input/misc/rotary_encoder.c                | 50 ++++++++++++++++++++++
> >  2 files changed, 55 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.txt b/Documentation/devicetree/bindings/input/rotary-encoder.txt
> > index a644408b33b8..1cfce5d0b5c4 100644
> > --- a/Documentation/devicetree/bindings/input/rotary-encoder.txt
> > +++ b/Documentation/devicetree/bindings/input/rotary-encoder.txt
> > @@ -22,6 +22,9 @@ Optional properties:
> >  - wakeup-source: Boolean, rotary encoder can wake up the system.
> >  - rotary-encoder,encoding: String, the method used to encode steps.
> >    Supported are "gray" (the default and more common) and "binary".
> > +- push-gpio: a gpio to be used as a detection of a push from the rotary.
> 
> According to Documentation/devicetree/bindings/gpio/gpio.txt, GPIO
> properties with a -gpio suffix are now deprecated in favor of the
> -gpios suffix.
> 
> > +- linux,code: keycode to emit with the push-gpio of this rotary encoder.
> > +  Required property in case "push-gpio"'s one is used.
> 
> I guess we should make it clear in the property name that it's the
> keycode emitted at push. Otherwise, it will be ambiguous between the
> rotary itself, or the button.

Also, I am pretty sure someone will come up with a switch instead of a
button shortly after ;) so I think we should have an event type there as
well.

Thanks.

-- 
Dmitry
