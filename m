Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEEBB4BDC
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 12:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfIQKWW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 06:22:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47823 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfIQKWW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 06:22:22 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAAcl-0002mf-MX; Tue, 17 Sep 2019 12:22:19 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAAcl-0003PY-C1; Tue, 17 Sep 2019 12:22:19 +0200
Date:   Tue, 17 Sep 2019 12:22:19 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/4] dt-bindings: Input: da9062 - fix
 dlg,disable-key-power description
Message-ID: <20190917102219.ej77ulhndmt4psrc@pengutronix.de>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-4-m.felsch@pengutronix.de>
 <20190916195623.GF237523@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916195623.GF237523@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:21:23 up 122 days, 16:39, 67 users,  load average: 0.07, 0.08,
 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 19-09-16 12:56, Dmitry Torokhov wrote:
> On Mon, Sep 16, 2019 at 04:03:57PM +0200, Marco Felsch wrote:
> > There was a bug within the driver since commit f889beaaab1c ("Input:
> > da9063 - report KEY_POWER instead of KEY_SLEEP during power
> > key-press"). Since we fixed the bug the KEY_POWER will be reported
> > always so we need to adapt the dt-bindings too. Make the description
> > more precise while on it.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/input/da9062-onkey.txt | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > index d1792452ceff..648b1930df1b 100644
> > --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > @@ -15,9 +15,9 @@ Required properties:
> >  
> >  Optional properties:
> >  
> > -- dlg,disable-key-power : Disable power-down using a long key-press. If this
> > -    entry exists the OnKey driver will remove support for the KEY_POWER key
> > -    press when triggered using a long press of the OnKey.
> > +- dlg,disable-key-power : Disable host triggered hard shutdown using a long
> > +    key-press. If this property isn't present the host will send an i2c shutdown
> > +    command on a long key-press.
> 
> Can we say what happens when property is present instead? I.e. "If this
> property is present, the host will not be issuing shutdown command over
> I2C in response to a long key-press"?

As you prefer ;)

I will wait for Adam's response and send a v2.

Regards,
  Marco


> Thanks.
> 
> -- 
> Dmitry
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
