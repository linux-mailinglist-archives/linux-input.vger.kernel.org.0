Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89CD61625D4
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2020 12:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgBRL5E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 06:57:04 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59565 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgBRL5E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 06:57:04 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j41Uq-0005og-IB; Tue, 18 Feb 2020 12:57:00 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1j41Up-0004Nb-U0; Tue, 18 Feb 2020 12:56:59 +0100
Date:   Tue, 18 Feb 2020 12:56:59 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, robh+dt@kernel.org
Cc:     robh+dt@kernel.org, support.opensource@diasemi.com,
        stwiss.opensource@diasemi.com, Adam.Thomson.Opensource@diasemi.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Input: da9062 - add key-opmode
 documentation
Message-ID: <20200218115659.b3mggkniwvoyzqgn@pengutronix.de>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-2-m.felsch@pengutronix.de>
 <20200122055706.GB110084@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122055706.GB110084@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:56:26 up 95 days,  3:15, 123 users,  load average: 0.09, 0.19,
 0.17
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

On 20-01-21 21:57, Dmitry Torokhov wrote:
> On Wed, Nov 27, 2019 at 02:23:02PM +0100, Marco Felsch wrote:
> > The onkey behaviour can be changed by programming the NONKEY_PIN
> > bitfield. Since the driver supports the reconfiguration we need to add
> > the documentation here.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > v2:
> > - add da9061/3 references
> > - adapt binding description to be more general
> > 
> >  .../devicetree/bindings/input/da9062-onkey.txt         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > index 5f9fbc68e58a..0005b2bdcdd7 100644
> > --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > @@ -19,6 +19,16 @@ Optional properties:
> >      entry exists the OnKey driver will remove support for the KEY_POWER key
> >      press when triggered using a long press of the OnKey.
> >  
> > +- dlg,key-opmode : Set the nONKEY behaviour. This value is initial set by the
> > +    otp values. 
> 
> Did you mean to say "nONKEY behavior is normally specified in OTP
> settings; this property allows modifying it".
> 
> Rob, do you have any comments?

gentle ping.

> > See nONKEY_PIN register description for more information.
> > +    Valid value range: 0x0..0x3
> > +
> > +References:
> > +
> > +[1] https://www.dialog-semiconductor.com/sites/default/files/da9061_datasheet_3v6.pdf
> > +[2] https://www.dialog-semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf
> > +[3] https://www.dialog-semiconductor.com/sites/default/files/da9063_datasheet_2v2.pdf
> > +
> >  Example: DA9063
> >  
> >  	pmic0: da9063@58 {
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Dmitry
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
