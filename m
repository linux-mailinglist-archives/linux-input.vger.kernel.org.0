Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1222839D894
	for <lists+linux-input@lfdr.de>; Mon,  7 Jun 2021 11:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhFGJYc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Jun 2021 05:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhFGJYc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Jun 2021 05:24:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401ABC061766
        for <linux-input@vger.kernel.org>; Mon,  7 Jun 2021 02:22:41 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lqBSn-0005jZ-Lh; Mon, 07 Jun 2021 11:22:29 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1lqBSm-0002Hg-Pz; Mon, 07 Jun 2021 11:22:28 +0200
Date:   Mon, 7 Jun 2021 11:22:28 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Eugen.Hristev@microchip.com
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Jonathan.Cameron@Huawei.com, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        david@protonic.nl, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/4] add z1 and z2 channels support for
 resistive-adc-touch driver
Message-ID: <20210607092228.drmyvuq6ac5hswz6@pengutronix.de>
References: <20210525054634.9134-1-o.rempel@pengutronix.de>
 <88b91dc3-efbf-51f5-51cf-3e865c0988ff@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88b91dc3-efbf-51f5-51cf-3e865c0988ff@microchip.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:17:51 up 186 days, 23:24, 48 users,  load average: 0.03, 0.22,
 0.23
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Eugen,

On Wed, Jun 02, 2021 at 11:15:47AM +0000, Eugen.Hristev@microchip.com wrote:
> On 5/25/21 8:46 AM, Oleksij Rempel wrote:
> > changes v6:
> > - drop other DT changes
> > - add more Reviewed-by tags
> > - remove redundant GRTS_CH_NONE check
> > 
> > changes v5:
> > - fix validate for other DT examples.
> > - add Reviewed-by: Rob Herring <robh@kernel.org> to some of the patches
> > 
> > changes v4:
> > - resistive-adc-touch: remove unused variable
> > 
> > changes v3:
> > - yaml: fix validation for channel names
> > - yaml: add nodename validation
> > 
> > changes v2:
> > - add yaml conversion patch to this series
> > - reword commit message for the last patch
> > - fix possible overflow on the buffer dispatcher
> > 
> > Oleksij Rempel (4):
> >    dt-bindings: touchscreen: Convert resistive-adc-touch binding to json
> >      schema
> >    dt-bindings: touchscreen: add touchscreen-x/y-plate-ohms property
> >    dt-bindings: touchscreen: resistive-adc-touch: add support for z1 and
> >      z2 channels
> >    Input: resistive-adc-touch: add support for z1 and z2 channels
> > 
> >   .../input/touchscreen/resistive-adc-touch.txt |  33 -----
> >   .../touchscreen/resistive-adc-touch.yaml      |  86 +++++++++++
> >   .../input/touchscreen/touchscreen.yaml        |   6 +
> >   .../input/touchscreen/resistive-adc-touch.c   | 140 ++++++++++++++++--
> >   4 files changed, 218 insertions(+), 47 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
> >   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
> > 
> > --
> > 2.29.2
> > 
> 
> 
> 
> Hello Oleksij,
> 
> As I am listed in the MAINTAINERS file for this driver, why I am not 
> even CC-ed to this patch series ?

Sorry, I missed you by accident.
Beside, you are not listed as maintainer for the:
Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.*

> At least what I could have done is test this series on my board using 
> this driver.

Do you have some regressions with it?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
