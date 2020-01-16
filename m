Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D0413D628
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2020 09:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731451AbgAPIv2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Jan 2020 03:51:28 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:32913 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731453AbgAPIv2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jan 2020 03:51:28 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1is0s8-0005V5-8I; Thu, 16 Jan 2020 09:51:24 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1is0s7-0008Oo-Go; Thu, 16 Jan 2020 09:51:23 +0100
Date:   Thu, 16 Jan 2020 09:51:23 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] DA9063 Onkey Improvements and Fixes
Message-ID: <20200116085123.dr2i42axmjezd4q3@pengutronix.de>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127132304.22924-1-m.felsch@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:49:19 up 62 days, 7 min, 53 users,  load average: 0.07, 0.10,
 0.04
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

On 19-11-27 14:23, Marco Felsch wrote:
> Hi,
> 
> this is v2 contains all comments made on [1]. Please check the patch
> based changelog for further information. Patch "Input: da9063 - fix
> capability and drop KEY_SLEEP"  is already applied mainline.
> 
> [1] https://www.spinics.net/lists/devicetree/msg309431.html
> 
> Marco Felsch (3):
>   dt-bindings: Input: da9062 - add key-opmode documentation
>   input: misc: da9063_onkey: add mode change support

Can we apply those patches.

>   dt-bindings: Input: da9062 - fix dlg,disable-key-power description

This one can be dropped from this series.

Regards,
  Marco

>  .../devicetree/bindings/input/da9062-onkey.txt   | 15 ++++++++++++---
>  drivers/input/misc/da9063_onkey.c                | 16 ++++++++++++++++
>  drivers/mfd/da9062-core.c                        |  1 +
>  3 files changed, 29 insertions(+), 3 deletions(-)
> 
> -- 
> 2.20.1
