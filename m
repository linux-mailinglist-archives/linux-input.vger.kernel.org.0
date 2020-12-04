Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5112CF01E
	for <lists+linux-input@lfdr.de>; Fri,  4 Dec 2020 15:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgLDO5m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 09:57:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:59292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbgLDO5m (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Dec 2020 09:57:42 -0500
Date:   Fri, 4 Dec 2020 15:58:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607093821;
        bh=WTdkFpRW9e4hsJVlxSvVSI+n8Es1h4JGaS6CHuBqGFc=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=dX71lnWUTvpjqgjKlhbsAoU2UX7L424ByyCRLoTBtYjZ0GcrCz3vOTWswwghT40UK
         LZqPJjazjYUVlAfILkHJOcRVII//nvnjQNUKKR5RJIydowFTJiQoY+HUgpR/3HAOgw
         X9Y5fn3QIV0IdM8GPKrSmnV8ZTsdW7KSXipR6DTQ=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] ARM: sa11111: make sa1111 bus's remove callback return
 void
Message-ID: <X8pOiU2a6BjfFuov@kroah.com>
References: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 26, 2020 at 12:47:24PM +0100, Uwe Kleine-König wrote:
> The driver core ignores the return value of struct device_driver::remove
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct sa1111_driver::remove return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and ensures future
> users behave accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
