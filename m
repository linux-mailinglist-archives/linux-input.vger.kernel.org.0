Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269A02CFA99
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 09:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgLEIYt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 03:24:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:50702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727967AbgLEIXu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 5 Dec 2020 03:23:50 -0500
Date:   Sat, 5 Dec 2020 09:23:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607156590;
        bh=jj96Kcw+xXfcVwQbBF31tiFa7EGTlH/VyMukbQ2TMaY=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=1dgDBKOGb79bfGHXuCQiXheR07tYnIPb0e4AS0b2kZF/DSEG3AOBsA8UKFuo3zHlc
         O3Z7WKHWpck70ASSHP4Uys0NxuH5OxeixsYJ9L6xEZ4ODrakyraVcoQ3hY1Ie0nWhF
         Xd3ILezKQERxl1dQ0xcrtWMMgpdr0Ihqq/nkkP1I=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-usb@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alan Stern <stern@rowland.harvard.edu>, kernel@pengutronix.de,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: sa11111: make sa1111 bus's remove callback return
 void
Message-ID: <X8tDamO7UviczH3n@kroah.com>
References: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
 <X8pOiU2a6BjfFuov@kroah.com>
 <20201204200927.p354eli7uqr776sp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201204200927.p354eli7uqr776sp@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 04, 2020 at 09:09:27PM +0100, Uwe Kleine-König wrote:
> Hey Greg,
> 
> On Fri, Dec 04, 2020 at 03:58:17PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Nov 26, 2020 at 12:47:24PM +0100, Uwe Kleine-König wrote:
> > > The driver core ignores the return value of struct device_driver::remove
> > > because there is only little that can be done. To simplify the quest to
> > > make this function return void, let struct sa1111_driver::remove return
> > > void, too. All users already unconditionally return 0, this commit makes
> > > it obvious that returning an error code is a bad idea and ensures future
> > > users behave accordingly.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Thanks, can I interpret this also as an Ack to take the change affecting
> drivers/usb via Russell's tree?

Sorry, yes, that is what I was implying here, I should have been more
specific.

thanks,

greg k-h
