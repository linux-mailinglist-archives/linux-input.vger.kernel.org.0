Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C675249991
	for <lists+linux-input@lfdr.de>; Wed, 19 Aug 2020 11:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgHSJoK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Aug 2020 05:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgHSJoJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Aug 2020 05:44:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1945CC061757
        for <linux-input@vger.kernel.org>; Wed, 19 Aug 2020 02:44:08 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1k8KdR-00066I-MU; Wed, 19 Aug 2020 11:43:57 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1k8KdK-000091-4F; Wed, 19 Aug 2020 11:43:50 +0200
Date:   Wed, 19 Aug 2020 11:43:50 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     octavian.purdila@intel.com, irina.tirdea@intel.com,
        hadess@hadess.net, mamlinav@gmail.com, dmitry.torokhov@gmail.com,
        hdegoede@redhat.com, yannick.fertre@st.com
Cc:     kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Goodix: Obviously wrong reset logic
Message-ID: <20200819094350.h7sz7uvgnp6btxxj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:17:32 up 278 days, 36 min, 255 users,  load average: 0.02, 0.05,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

since linux v4.5 the goodix touch driver support the reset by commit
ec6e1b4082d9 ("Input: goodix - reset device at init"). I was a bit
confused while I read the goodix_reset() function:
8<----------------------------------------------------------------------
static int goodix_reset(struct goodix_ts_data *ts)                                                                                      
{              
	int error;

	/* begin select I2C slave addr */
	error = gpiod_direction_output(ts->gpiod_rst, 0);
	if (error)
		return error;

	msleep(20);				/* T2: > 10ms */                                                                        

	/* HIGH: 0x28/0x29, LOW: 0xBA/0xBB */                                                                                           
	error = goodix_irq_direction_output(ts, ts->client->addr == 0x14);
	(error)
		return error;

	usleep_range(100, 2000);		/* T3: > 100us */

	error = gpiod_direction_output(ts->gpiod_rst, 1);
	if (error)
		return error;
	
	...
}
8<----------------------------------------------------------------------
because the gpiod_direction_output() takes the logical level and and not
the physical level. Also it is not intuitive to read. Releasing the reset
line first and set it after?

As pointed out by the commit message, the reset logic is based on the
datasheet GT911 [1] and GT9271[2]. Those datasheets says that the reset
pin is active low. Setting this in my DT-based board will break
everything. I checked the DT's already using a goodix device and all of
them are specifying the pin as active-high. IMHO this is wrong.

Now the question is: Does the ACPI tables specify it as active high too
and was this the reason to miss-use the gpiod_ API? If this is the case
fixing the driver would break everything and in that case we should at
least mention it within the driver and within the DT-Bindings.

Regards,
  Marco
