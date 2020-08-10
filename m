Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5AF3240B5A
	for <lists+linux-input@lfdr.de>; Mon, 10 Aug 2020 18:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgHJQts (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Aug 2020 12:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgHJQtr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Aug 2020 12:49:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FE6C061756
        for <linux-input@vger.kernel.org>; Mon, 10 Aug 2020 09:49:47 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1k5AzZ-0005bd-V2; Mon, 10 Aug 2020 18:49:46 +0200
Message-ID: <9be441d3943f2a7f625be7ec6c1fc79dd84db6c3.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] Input: exc3000: split MT event handling from IRQ
 handler
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Date:   Mon, 10 Aug 2020 18:49:45 +0200
In-Reply-To: <20200810162720.GR1665100@dtor-ws>
References: <20200313143345.28565-1-l.stach@pengutronix.de>
         <c0bc260d70b5506da2c4e2dc64176d45e1888a25.camel@pengutronix.de>
         <218ee65d70261a766b8ae490a64f60dabe2eca47.camel@pengutronix.de>
         <20200810162720.GR1665100@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Montag, den 10.08.2020, 09:27 -0700 schrieb Dmitry Torokhov:
> Hi Lucas,
> 
> On Mon, Aug 10, 2020 at 02:40:30PM +0200, Lucas Stach wrote:
> > Hi Dmitry,
> > 
> > Am Montag, den 18.05.2020, 15:24 +0200 schrieb Lucas Stach:
> > > Hi Dmitry,
> > > 
> > > any chance you could take a look at this series?
> > 
> > Are you able to find some time to look at this series? Should I resend
> > the series?
> 
> Sorry about delays. Could you please resend as I applied another se5ries
> to this driver?

Urgh, this may take me some time, as the other series collides quite
badly with this one and adds some of the same bits (firmware version
query). So I'll need to do some rework of the series, requiring a full
round of testing. :(

Regards,
Lucas

