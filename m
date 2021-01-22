Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4713230091A
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 17:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbhAVQ4j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 11:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbhAVQOv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 11:14:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAE4C06178B
        for <linux-input@vger.kernel.org>; Fri, 22 Jan 2021 08:14:11 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2z4Y-0003b1-FP; Fri, 22 Jan 2021 17:14:06 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2z4W-0001px-5f; Fri, 22 Jan 2021 17:14:04 +0100
Date:   Fri, 22 Jan 2021 17:14:04 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, alistair23@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Add Wacom I2C support to rM2
Message-ID: <20210122161404.thcocfjghfqaga6t@pengutronix.de>
References: <20210121065643.342-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121065643.342-1-alistair@alistair23.me>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:02:21 up 51 days,  6:08, 28 users,  load average: 0.03, 0.05,
 0.05
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

thanks for the patches. Before getting into the series please check all
your commit subjects. Also please check that you do only one logical
change per patch: e.g. adding DT-Support means: Add the dt-table and not
more.

I looking forward to your v2 :)

Regards,
  Marco

On 21-01-20 22:56, Alistair Francis wrote:
> Add support to the reMarkable2 (rM2) for the Wacom I2C device.
> 
> This is based on the reMarkable Linux fork and with this series I am
> able to probe the Wacom digitiser.
> 
> Alistair Francis (6):
>   devicetree/bindings: Initial commit of wacom,wacom-i2c
>   input/touchscreen: Add device tree support to wacom_i2c
>   touchscreen/wacom_i2c: Add support for distance and tilt x/y
>   touchscreen/wacom_i2c: Clean up the query device fields
>   touchscreen/wacom_i2c: Add support for vdd regulator
>   arch/arm: reMarkable2: Enable wacom_i2c
> 
>  .../input/touchscreen/wacom,wacom-i2c.yaml    |  48 +++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm/boot/dts/imx7d-remarkable2.dts       |  41 ++++++
>  arch/arm/configs/imx_v6_v7_defconfig          |   1 +
>  drivers/input/touchscreen/wacom_i2c.c         | 136 +++++++++++++++---
>  5 files changed, 205 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> 
> -- 
> 2.29.2
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
