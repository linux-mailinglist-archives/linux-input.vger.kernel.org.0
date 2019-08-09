Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2F21875F3
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 11:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406025AbfHIJav (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 05:30:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36997 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfHIJav (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 05:30:51 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hw1EV-0003sh-PK; Fri, 09 Aug 2019 11:30:47 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hw1EV-0006F3-8E; Fri, 09 Aug 2019 11:30:47 +0200
Date:   Fri, 9 Aug 2019 11:30:47 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/4] ADS7846 add general touchscreen features
Message-ID: <20190809093047.xo3vngthu3kqbtqz@pengutronix.de>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327133927.1340-1-m.felsch@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:30:21 up 83 days, 15:48, 58 users,  load average: 0.23, 0.11,
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

gentle ping.

Regards,
  Marco

On 19-03-27 14:39, Marco Felsch wrote:
> Hi,
> 
> The main purpose of this small set is to add support for the general
> touchscreen dt-properties. During this work I also changed the memory
> allocation methods to the devm_* ones to cleanup the error-paths.
> 
> Regards,
> Marco
> 
> Marco Felsch (4):
>   Input: ads7846 - convert to devm_ alloc functions
>   dt-bindings: input: ads7846: fix property description
>   dt-bindings: input: ads7846: replace vendor-bindings by general ones
>   Input: ads7846 - add support for general touchscreen bindings
> 
>  .../bindings/input/touchscreen/ads7846.txt    | 29 +++++--
>  drivers/input/touchscreen/ads7846.c           | 75 +++++++++++--------
>  2 files changed, 66 insertions(+), 38 deletions(-)
> 
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
