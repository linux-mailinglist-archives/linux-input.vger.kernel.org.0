Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F3F1CBFFB
	for <lists+linux-input@lfdr.de>; Sat,  9 May 2020 11:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgEIJjb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 May 2020 05:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727811AbgEIJjb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 May 2020 05:39:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA44CC061A0C
        for <linux-input@vger.kernel.org>; Sat,  9 May 2020 02:39:30 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jXLwx-0002uz-Fz; Sat, 09 May 2020 11:39:15 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jXLww-0005mD-2O; Sat, 09 May 2020 11:39:14 +0200
Date:   Sat, 9 May 2020 11:39:14 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Fengping Yu <fengping.yu@mediatek.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Add mtk matrix keypad driver for keypad on MTK SoC
Message-ID: <20200509093914.qidkjwkp32gn6td6@pengutronix.de>
References: <20200509020458.8359-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509020458.8359-1-fengping.yu@mediatek.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:36:19 up 176 days, 54 min, 170 users,  load average: 0.06, 0.07,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yu,

sorry if this is not your first name..
Something went wrong with you v6 since you are sending diffs to files
that are not present in input-master/next.

Regards,
  Marco

On 20-05-09 10:04, Fengping Yu wrote:
> Change since v5:
> - remove unnecessary include files
> - remove redundant comments and newlines
> - use local irqnr variable instead of member variable of mtk_keypad struct
> - use regmap to read and write registers
> - drop kpd_get_dts_info directly into probe function
> - use devm_add_action_or_reset to avoid goto error handling when do clk setting
> - use devm_request_threaded_irq api to request irq
> - remove platform_set_drvdata
> 
> fengping.yu (3):
>   dt-bindings: Change keypad documentation schema
>   drivers: input: keyboard: Add mtk keypad driver
>   configs: defconfig: Add CONFIG_KEYBOARD_MTK_KPD=y
> 
>  .../devicetree/bindings/input/mtk-kpd.txt     |  61 -------
>  .../devicetree/bindings/input/mtk-kpd.yaml    |  93 +++++++++++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/input/keyboard/Kconfig                |   5 +-
>  drivers/input/keyboard/mtk-kpd.c              | 151 ++++++++----------
>  5 files changed, 163 insertions(+), 148 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> --
> 2.18.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
