Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5C42CFADE
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 10:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbgLEJii (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 04:38:38 -0500
Received: from isilmar-4.linta.de ([136.243.71.142]:46126 "EHLO
        isilmar-4.linta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbgLEJh4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 04:37:56 -0500
X-Greylist: delayed 1404 seconds by postgrey-1.27 at vger.kernel.org; Sat, 05 Dec 2020 04:36:55 EST
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.2.0.102])
        by isilmar-4.linta.de (Postfix) with ESMTPSA id 55F72201111;
        Sat,  5 Dec 2020 09:05:30 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
        id 1107F20EBD; Sat,  5 Dec 2020 09:26:28 +0100 (CET)
Date:   Sat, 5 Dec 2020 09:26:27 +0100
From:   Dominik Brodowski <linux@dominikbrodowski.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] ARM: sa11111: make sa1111 bus's remove callback return
 void
Message-ID: <X8tEMw7d9S0hq8fN@light.dominikbrodowski.net>
References: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Thu, Nov 26, 2020 at 12:47:24PM +0100 schrieb Uwe Kleine-König:
> The driver core ignores the return value of struct device_driver::remove
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct sa1111_driver::remove return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and ensures future
> users behave accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

For the PCMCIA-related change, FWIW,

	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik
