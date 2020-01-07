Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E89132101
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 09:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgAGIIi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 03:08:38 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38803 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgAGIIi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jan 2020 03:08:38 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iojui-0004tf-Oq; Tue, 07 Jan 2020 09:08:32 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iojuh-0003Rx-Os; Tue, 07 Jan 2020 09:08:31 +0100
Date:   Tue, 7 Jan 2020 09:08:31 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: Input: da9062 - fix
 dlg,disable-key-power description
Message-ID: <20200107080831.lbeqpdxkgk42pbke@pengutronix.de>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-4-m.felsch@pengutronix.de>
 <AM5PR1001MB099439FC20DAEBFC6584081280430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191210082759.2hf6ekuqgs2uzzm2@pengutronix.de>
 <AM5PR1001MB0994D38015B1799F3F3A7CF380550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR1001MB0994D38015B1799F3F3A7CF380550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:05:04 up 52 days, 23:23, 43 users,  load average: 0.09, 0.13,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Adam, Dmitry,

On 19-12-12 10:08, Adam Thomson wrote:
> On 10 December 2019 08:28, Marco Felsch wrote:
> 
> > Hi Adam,
> >
> > On 19-12-02 12:15, Adam Thomson wrote:
> > > On 27 November 2019 13:23, Marco Felsch wrote:
> > >
> > > > There was a bug within the driver since commit f889beaaab1c ("Input:
> > > > da9063 - report KEY_POWER instead of KEY_SLEEP during power
> > > > key-press"). Since we fixed the bug the KEY_POWER will be reported
> > > > always so we need to adapt the dt-bindings too. Make the description
> > > > more precise while on it.
> > > >
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > > v2:
> > > > - change description according Dmitry's suggestion.
> > > >
> > > >  Documentation/devicetree/bindings/input/da9062-onkey.txt | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > > > b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > > > index 0005b2bdcdd7..9f895454179d 100644
> > > > --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > > > +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> > > > @@ -15,9 +15,8 @@ Required properties:
> > > >
> > > >  Optional properties:
> > > >
> > > > -- dlg,disable-key-power : Disable power-down using a long key-press. If this
> > > > -    entry exists the OnKey driver will remove support for the KEY_POWER key
> > > > -    press when triggered using a long press of the OnKey.
> > > > +- dlg,disable-key-power : If this property is present, the host will not be
> > > > +    issuing shutdown command over I2C in response to a long key-press.
> > >
> > > This also changes behaviour of button press reporting as the driver will not
> > > report a longer press (i.e. a button hold where the driver polls for release).
> > > It will only report a short key press to user-space with this property provided.
> > >
> > > The question here is do we still want to support long press reporting but
> > > without the I2C sequence for shutdown? If so the driver needs to be updated
> > to
> > > work this way as right now it doesn't.
> >
> > Good point. I checked the driver and the documentation for the
> > da9062/3 again and it seems that we interrupt the pmic hw by doing the
> > shutdown by itself. As the documentation says:
> >
> > DA9063:
> > If the hardware reset was initiated by a (debounced) press of nONKEY (or
> > GPIO14 and GPIO15 together) longer than SD_DELAY, the DA9063 initially
> > only asserts control bit KEY_RESET in the fault register and signals a
> > non-maskable interrupt allowing the host to clear the armed reset
> > sequence within 1 s. If the host does not clear KEY_RESET then a
> > shutdown to RESET mode is executed. KEY_SD_MODE determines if normal
> > power sequence timing or a fast shutdown is implemented.
> >
> > DA9062:
> > If the reset was initiated by a user’s long press of nONKEY, initially
> > only KEY_RESET is set and the nIRQ port will be asserted. KEY_RESET
> > signals the host that a shutdown sequence is started. If the host does
> > not then clear KEY_RESET within 1 s by writing a 1 to the related bit in
> > register FAULT_LOG, the shutdown sequence will complete. When the reset
> > condition has disappeared, DA9062 requires a supply (VSYS >
> > VDD_FAULT_UPPER) that provides enough power to start-up from the
> > POWERDOWN mode.
> >
> > So we don't need to check for the KEY_RESET? This would cleanup the code
> > a bit.
> 
> We could remove that but I think the intention originally was to have this code
> there in case there was some way to more gracefully shutdown the system in this
> scenario. Right now that's not the case as the code simply calls to shutdown
> the pmic via a manual register call, but maybe in the future this could be made
> more gracful. Another slight advantage of leaving that code in is that we're
> not waiting for another second delay for the PMIC to pull the plug.
> 
> With regards to this patch and the subsequent one to update the OnKey driver, I
> think we should deprecate this property. The OnKey mode binding you added in
> a different patch will configure the OnKey according to how you want it to
> behave in hardware so I don't think this property makes much sense anymore. We
> can then remove the need for 'key_power' usage in the driver.

Is it okay for you both to drop this patch from this series and open a
new 'rework' series?

Regards,
  Marco

> 
> >
> > Regards,
> >   Marco
> >
> > > >
> > > >  - dlg,key-opmode : Set the nONKEY behaviour. This value is initial set by the
> > > >      otp values. See nONKEY_PIN register description for more information.
> > > > --
> > > > 2.20.1
> > >
> > >
> >
> > --
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
