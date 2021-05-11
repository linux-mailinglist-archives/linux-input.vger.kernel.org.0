Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7823D37A10F
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 09:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhEKHne (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 03:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhEKHne (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 03:43:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F205C061574
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 00:42:28 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lgN27-0006wF-5r; Tue, 11 May 2021 09:42:23 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1lgN25-0000By-Tw; Tue, 11 May 2021 09:42:21 +0200
Date:   Tue, 11 May 2021 09:42:21 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>
Subject: Re: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <20210511074219.qxpgw4s5n6hngh2c@pengutronix.de>
References: <20210510193108.50178-1-stephan@gerhold.net>
 <20210510193108.50178-2-stephan@gerhold.net>
 <20210510194848.g7cgty3lirxkht5g@core>
 <YJmUm/6Vm3d9hp1z@gerhold.net>
 <YJowd/tDgVD2TBKO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YJowd/tDgVD2TBKO@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:40:50 up 159 days, 21:47, 49 users,  load average: 0.20, 0.10,
 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 21-05-11 10:21, Andy Shevchenko wrote:
> On Mon, May 10, 2021 at 10:16:41PM +0200, Stephan Gerhold wrote:
> > On Mon, May 10, 2021 at 09:48:48PM +0200, Ondřej Jirman wrote:
> 
> ...
> 
> > The reasons were:
> > 
> >   - Bulk regulator API: AFAICT there is no way to use it while also
> >     maintaining the correct enable/disable order plus the 10us delay.
> >     See https://lore.kernel.org/linux-input/X%2Fwj+bxe%2FIlznCj6@gerhold.net/
> 
> This by the way can be fixed on regulator level (adding some like ranges into
> bulk structure with timeouts, and if 0, skip them).

I would appreciate this :)

Regards,
  Marco
