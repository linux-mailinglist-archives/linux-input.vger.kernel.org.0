Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D03B4BD7
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 12:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbfIQKUd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 06:20:33 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56447 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfIQKUd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 06:20:33 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAAb0-0002Zy-GR; Tue, 17 Sep 2019 12:20:30 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAAb0-0003P5-3K; Tue, 17 Sep 2019 12:20:30 +0200
Date:   Tue, 17 Sep 2019 12:20:30 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 1/4] dt-bindings: Input: da9062 - add key-opmode
 documentation
Message-ID: <20190917102030.t7wzy2j67sa6nusc@pengutronix.de>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-2-m.felsch@pengutronix.de>
 <AM5PR1001MB0994D57AE63D69B67D06A296808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR1001MB0994D57AE63D69B67D06A296808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:19:22 up 122 days, 16:37, 67 users,  load average: 0.09, 0.09,
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

Hi Adam,

On 19-09-16 15:03, Adam Thomson wrote:
> On 16 September 2019 15:04, Marco Felsch wrote:
> 
> > The onkey behaviour can be changed by programming the NONKEY_PIN
> > bitfield. Since the driver supports the reconfiguration we need to add
> > the documentation here.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/input/da9062-onkey.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > index 5f9fbc68e58a..d1792452ceff 100644
> > --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > @@ -19,6 +19,12 @@ Optional properties:
> >      entry exists the OnKey driver will remove support for the KEY_POWER key
> >      press when triggered using a long press of the OnKey.
> > 
> > +- dlg,key-opmode : Set the nONKEY behaviour. This value is initial set by the
> > +    otp values. Check [1] for more details. Valid value range: 0x0..0x3
> > +
> > +[1] https://www.dialog-semiconductor.com/sites/default/files/ \
> > +    da9062_datasheet_3v6.pdf
> > +
> 
> As mentioned in my other mail, this can apply to any of the 3 devices, so either
> we need be explicit and say this is only relevant for DA9061/2 right now, or we
> should refer to both datasheets.

We can go with both datasheets, please check my reply on your mail.

Regards,
  Marco


> 
> >  Example: DA9063
> > 
> >  	pmic0: da9063@58 {
> > --
> > 2.20.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
