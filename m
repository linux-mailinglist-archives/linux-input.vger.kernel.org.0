Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB24198D6D
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 09:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730125AbgCaHuS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 03:50:18 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34555 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730247AbgCaHuQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 03:50:16 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jJBez-0005DD-Rj; Tue, 31 Mar 2020 09:50:09 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jJBey-0001qI-S2; Tue, 31 Mar 2020 09:50:08 +0200
Date:   Tue, 31 Mar 2020 09:50:08 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     dmitry.torokhov@gmail.com, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, LW@KARO-electronics.de
Cc:     kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/4] EDT-FT5x06 Fixes and improvments
Message-ID: <20200331075008.4t7kdqkwf5ebjwr7@pengutronix.de>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
 <20200309064422.k7o3eyvfqklflpt4@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309064422.k7o3eyvfqklflpt4@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:48:12 up 136 days, 23:06, 159 users,  load average: 0.00, 0.08,
 0.07
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

gentle ping..

On 20-03-09 07:44, Marco Felsch wrote:
> Hi,
> 
> gentle ping.
> 
> Regards,
>   Marco
> 
> On 20-02-27 12:28, Marco Felsch wrote:
> > Hi,
> > 
> > first this series fixes a possible undefined register access for
> > ev-ft5726 devices.
> > 
> > This series also includes the v4 of the improved pm ops. Please check
> > my notes I made on the patch.
> > 
> > Last but least it adds the support for async probe which is important
> > for fast booting because devices having a reset-pin specified sleeps
> > 300ms..
> > 
> > Regards,
> >   Marco
> > 
> > Ahmad Fatoum (1):
> >   Input: edt-ft5x06 - prefer asynchronous probe
> > 
> > Marco Felsch (3):
> >   Input: edt-ft5x06 - fix get_default register write access
> >   Input: edt-ft5x06 - move parameter restore into helper
> >   Input: edt-ft5x06 - improve power management operations
> > 
> >  drivers/input/touchscreen/edt-ft5x06.c | 179 ++++++++++++++++++++++---
> >  1 file changed, 157 insertions(+), 22 deletions(-)
> > 
> > -- 
> > 2.20.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
