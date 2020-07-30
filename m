Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57E2232F08
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 10:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgG3I7f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 04:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgG3I7e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 04:59:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F71C061794
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 01:59:34 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1k14PQ-0002tp-I6; Thu, 30 Jul 2020 10:59:28 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1k14PQ-0003bj-0G; Thu, 30 Jul 2020 10:59:28 +0200
Date:   Thu, 30 Jul 2020 10:59:27 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
        Robin Gong <yibin.gong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/3] Input: snvs_pwrkey - only IRQ_HANDLED for our own
 events
Message-ID: <20200730085927.ro3c2ptiixi2ikyf@pengutronix.de>
References: <20200723074314.3304-1-horia.geanta@nxp.com>
 <20200723074314.3304-4-horia.geanta@nxp.com>
 <20200729075513.ckjnhfv3dxuesvsi@pengutronix.de>
 <20200730060601.GE1665100@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200730060601.GE1665100@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:56:41 up 258 days, 15 min, 251 users,  load average: 0.05, 0.08,
 0.08
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

On 20-07-29 23:06, Dmitry Torokhov wrote:
> Hi Marco,
> 
> On Wed, Jul 29, 2020 at 09:55:13AM +0200, Marco Felsch wrote:
> > Hi,
> > 
> > On 20-07-23 10:43, Horia Geantă wrote:
> > > From: André Draszik <git@andred.net>
> > > 
> > > The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.
> > > 
> > > This driver here should only return IRQ_HANDLED if the status register
> > > indicates that the event we're handling in the irq handler was genuinely
> > > intended for this driver. Otheriwse the interrupt subsystem will
> > > assume the interrupt was handled successfully even though it wasn't
> > > at all.
> > 
> > After checking the RM and the imx6qdl.dtsi I'm not very sure that this
> > is right since the snvs-powerkey has a seperate irq-line. So we can be
> > sure that this irq is for us. If this is the case we don't need to check
> > the SNVS_LPSR_REG instead we only need to clear it.
> 
> Wouldn't we want to know if for some reason we get spurious interrupts?

We could check the bit at the very begin of the IRQ and return early but
according the RM this should never happen. Anyway you're right HW is
never bug free.

Regards,
  Marco

> Thanks.
> 
> -- 
> Dmitry
