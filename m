Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA9A5973A7
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 09:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfHUHgS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 03:36:18 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58157 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfHUHgR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 03:36:17 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i0LAE-0004WZ-2U; Wed, 21 Aug 2019 09:36:14 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1i0LAD-0007UV-Ox; Wed, 21 Aug 2019 09:36:13 +0200
Date:   Wed, 21 Aug 2019 09:36:13 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Rob Herring <robh@kernel.org>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: input: ads7846: replace vendor-bindings
 by general ones
Message-ID: <20190821073613.nh5oyyvahb3i6nf6@pengutronix.de>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
 <20190327133927.1340-4-m.felsch@pengutronix.de>
 <5ca06167.1c69fb81.6e121.c248@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca06167.1c69fb81.6e121.c248@mx.google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:35:05 up 95 days, 13:53, 60 users,  load average: 0.04, 0.03,
 0.00
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

On 19-03-31 01:42, Rob Herring wrote:
> On Wed, 27 Mar 2019 14:39:26 +0100, Marco Felsch wrote:
> > Mark the vendor-bindings as deprecated and replace them by the general
> > ones. All deprecated bindings are used as default and gets overwritten by
> > the general ones if the user supplies both. This ensures the backward
> > compatibility with old dt's.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../bindings/input/touchscreen/ads7846.txt    | 29 ++++++++++++++-----
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

How about this patch?

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
