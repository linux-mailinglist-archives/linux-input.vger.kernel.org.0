Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9621332E6B6
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 11:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCEKus (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 05:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhCEKuX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 05:50:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC51C061574
        for <linux-input@vger.kernel.org>; Fri,  5 Mar 2021 02:50:22 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lI82G-00086L-I2; Fri, 05 Mar 2021 11:50:20 +0100
Message-ID: <ac234f3a5b2cef8fd9344283695154b28827429f.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/5] exc3000 firmware update support
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     patchwork-lst@pengutronix.de,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Date:   Fri, 05 Mar 2021 11:50:19 +0100
In-Reply-To: <20210125182527.1225245-1-l.stach@pengutronix.de>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

could you give this series a look? It would be a shame if this would
again get stuck, as it's complex enough that even rebasing and re-
testing takes a considerable amount of time, so I would like to avoid
to do this once again, if possible.

Regards,
Lucas

Am Montag, dem 25.01.2021 um 19:25 +0100 schrieb Lucas Stach:
> Hi all,
> 
> this series adds support for updating the firmware on exc3000 touchscreen
> devices. The protocol has been reverse engineered from the proprietary
> update tool.
> 
> Compared to the last posting of this series almost a year ago, the
> biggest change is the rebasing on top of the conflicting changes that
> went in in the meantime and some better documentation.
> 
> Regards,
> Lucas
> 
> Lucas Stach (5):
>   Input: exc3000 - split MT event handling from IRQ handler
>   Input: exc3000 - factor out vendor data request
>   Input: exc3000 - fix firmware version query for device in bootloader
>   Input: exc3000 - add type sysfs attribute
>   Input: exc3000 - add firmware update support
> 
>  .../ABI/testing/sysfs-driver-input-exc3000    |  29 ++
>  drivers/input/touchscreen/exc3000.c           | 492 +++++++++++++-----
>  2 files changed, 404 insertions(+), 117 deletions(-)
> 


