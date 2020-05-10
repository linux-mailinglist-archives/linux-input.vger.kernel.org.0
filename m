Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DB11CCA88
	for <lists+linux-input@lfdr.de>; Sun, 10 May 2020 13:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgEJLGz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 May 2020 07:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726080AbgEJLGz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 May 2020 07:06:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46ECCC061A0C
        for <linux-input@vger.kernel.org>; Sun, 10 May 2020 04:06:55 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jXjnB-0002Kq-W2; Sun, 10 May 2020 13:06:45 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jXjnA-0005ZF-FY; Sun, 10 May 2020 13:06:44 +0200
Date:   Sun, 10 May 2020 13:06:44 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        LW@KARO-electronics.de, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/4] Input: edt-ft5x06 - fix get_default register write
 access
Message-ID: <20200510110644.7ynyfmdhnrl57auk@pengutronix.de>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
 <20200227112819.16754-2-m.felsch@pengutronix.de>
 <20200509190524.GN89269@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509190524.GN89269@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:03:16 up 177 days,  2:21, 178 users,  load average: 0.15, 0.16,
 0.09
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

On 20-05-09 12:05, Dmitry Torokhov wrote:
> Hi Macro,
> 
> On Thu, Feb 27, 2020 at 12:28:16PM +0100, Marco Felsch wrote:
> > Since commit b6eba86030bf ("Input: edt-ft5x06 - add offset support for
> > ev-ft5726") offset-x and offset-y is supported. Devices using those
> > offset parameters don't support the offset parameter so we need to add
> > the NO_REGISTER check for edt_ft5x06_ts_get_defaults().
> > 
> > Fixes: b6eba86030bf ("Input: edt-ft5x06 - add offset support for ev-ft5726")
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> I'll apply this, but I wonder if we should not move this check into
> edt_ft5x06_register_write(), and also have edt_ft5x06_register_read()
> return error if address is "NO_REGISTER"?

I tought so too but I wanted to keep the fix small and backportable.

Regards,
  Marco

> Thanks.
> 
> -- 
> Dmitry
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
