Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11AC17E5B6
	for <lists+linux-input@lfdr.de>; Mon,  9 Mar 2020 18:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgCIRa6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 13:30:58 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45589 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbgCIRa6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Mar 2020 13:30:58 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4773AE000A;
        Mon,  9 Mar 2020 17:30:54 +0000 (UTC)
Date:   Mon, 9 Mar 2020 18:30:54 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Anson Huang <Anson.Huang@nxp.com>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        dmitry.torokhov@gmail.com, a.zummo@towertech.it,
        rui.zhang@intel.com, daniel.lezcano@linaro.org,
        amit.kucheria@verdurent.com, wim@linux-watchdog.org,
        daniel.baluta@nxp.com, gregkh@linuxfoundation.org,
        linux@rempel-privat.de, tglx@linutronix.de,
        m.felsch@pengutronix.de, andriy.shevchenko@linux.intel.com,
        arnd@arndb.de, ronald@innovation.ch, krzk@kernel.org,
        robh@kernel.org, leonard.crestez@nxp.com, aisheng.dong@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V3 1/7] firmware: imx: Add stubs for !CONFIG_IMX_SCU case
Message-ID: <20200309171556.GH3563@piout.net>
References: <1583714300-19085-1-git-send-email-Anson.Huang@nxp.com>
 <20200309110609.GE3563@piout.net>
 <1ad38cdb-bf0d-1c19-b233-15a5857bd6fa@roeck-us.net>
 <20200309164705.GG3563@piout.net>
 <20200309171012.GA24802@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309171012.GA24802@roeck-us.net>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 09/03/2020 10:10:12-0700, Guenter Roeck wrote:
> On Mon, Mar 09, 2020 at 05:47:05PM +0100, Alexandre Belloni wrote:
> > On 09/03/2020 06:27:06-0700, Guenter Roeck wrote:
> > > On 3/9/20 4:06 AM, Alexandre Belloni wrote:
> > > > On 09/03/2020 08:38:14+0800, Anson Huang wrote:
> > > >> Add stubs for those i.MX SCU APIs to make those modules depending
> > > >> on IMX_SCU can pass build when COMPILE_TEST is enabled.
> > > >>
> > > >> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > >> ---
> > > >> Changes since V2:
> > > >> 	- return error for stubs.
> > > > 
> > > > I'm not sure why you are sending v3 with the stubs as we determined that
> > > > 2/7 is enough to compile all the drivers with COMPILE_TEST.
> > > > 
> > > > 
> > > 2/7 alone is not sufficient. With only 2/7, one can explicitly configure
> > > IMX_SCU=n, COMPILE_TEST=y, and get lots of compile failures. Granted,
> > > one should not do that, but 0day does (I don't know if that is the result
> > > of RANDCONFIG), and I am not looking forward having to deal with the
> > > fallout.
> > > 
> > 
> > How would that be possible if the drivers all depend on IMX_SCU?
> > 
> That dependency is being changed to IMX_SCU || COMPILE_TEST
> as part of the series.
> 

Yes, my point is that those patches should not be applied at all, only
2/7.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
