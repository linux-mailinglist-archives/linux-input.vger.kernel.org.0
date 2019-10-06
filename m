Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCDBCCD7E
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2019 02:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfJFAcx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 20:32:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726863AbfJFAcx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 5 Oct 2019 20:32:53 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A0FD222BE;
        Sun,  6 Oct 2019 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570321971;
        bh=yVSCUoI+lseGFR4IYqnIN8StTXuL1oZ1vQrmfXipRHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D6LxZ1QuFoDIl516K2GCTZjZv4BnFdsxk8Jr9cmMguCqq9nIc8ryLQiLOhy36x0jN
         KTPJ1AP5u5xqnbnHmec2+YhpaeZ+PD2x2/BFKC/Q3/sudiUIkJ9IGGUiSuqIVXuoP5
         B0gOzu0wn+PcBb+I+UZrNS6/EFatxXtZ3hK81bmo=
Date:   Sun, 6 Oct 2019 08:32:27 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Andy Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Message-ID: <20191006003225.GD7150@dragon>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <20190922161415.GD1999@bug>
 <DB3PR0402MB3916F48DA2A16E57C624432BF5850@DB3PR0402MB3916.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB3916F48DA2A16E57C624432BF5850@DB3PR0402MB3916.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 23, 2019 at 02:34:07AM +0000, Anson Huang wrote:
> Hi, Pavel
> 
> > Subject: Re: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
> > 
> > On Tue 2019-09-03 10:03:40, Anson Huang wrote:
> > > NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as system
> > > controller, the system controller is in charge of system power, clock
> > > and power key event etc. management, Linux kernel has to communicate
> > > with system controller via MU (message unit) IPC to get power key
> > > event, add binding doc for i.MX system controller power key driver.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > ---
> > > Changes since V1:
> > > 	- remove "wakeup-source" property, as it is NOT needed for SCU
> > interrupt;
> > > 	- remove "status" in example.
> > > ---
> > >  .../devicetree/bindings/arm/freescale/fsl,scu.txt          | 14
> > ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > index c149fad..f93e2e4 100644
> > > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > @@ -157,6 +157,15 @@ Required properties:
> > >  Optional properties:
> > >  - timeout-sec: contains the watchdog timeout in seconds.
> > >
> > > +Power key bindings based on SCU Message Protocol
> > > +------------------------------------------------------------
> > > +
> > > +Required properties:
> > > +- compatible: should be:
> > > +              "fsl,imx8qxp-sc-pwrkey"
> > > +              followed by "fsl,imx-sc-pwrkey";
> > > +- linux,keycodes: See
> > > +Documentation/devicetree/bindings/input/keys.txt
> > 
> > Note you have keycode_s_ here, but keycode in the example and in the dts
> > patch.
> 
> NOT quite understand your point, could you please provide more details?

The property being used in driver, DTS, and DT example in the
bindings are all 'linux,keycode' rather than 'linux,keycodes'.

Shawn
