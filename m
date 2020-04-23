Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348601B5444
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 07:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgDWF3Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Apr 2020 01:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726027AbgDWF3Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Apr 2020 01:29:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF84C03C1AF
        for <linux-input@vger.kernel.org>; Wed, 22 Apr 2020 22:29:24 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jRUQG-0006GN-6K; Thu, 23 Apr 2020 07:29:16 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jRUQF-0004xt-Pj; Thu, 23 Apr 2020 07:29:15 +0200
Date:   Thu, 23 Apr 2020 07:29:15 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Fengping yu <fengping.yu@mediatek.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        wsd_upstream@mediatek.com, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5] add mtk matrix keypad driver for keypad on MTK SoC
Message-ID: <20200423052915.355mc7qvrofmv743@pengutronix.de>
References: <20200423011958.30521-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423011958.30521-1-fengping.yu@mediatek.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:28:26 up 159 days, 20:47, 157 users,  load average: 0.04, 0.06,
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

Hi Fengping,

On 20-04-23 09:19, Fengping yu wrote:
> 
> Change since v4:
> - remove extra space and redundant lines
> - remove disable_irq_nosync and enable_irq in irq handler
> - put defconfig as a single patch
> - unified device properties interface for ACPI and device trees

This is a good changelog for reviewers.

> - fixed other issue according reviewer comments

This one is a bit useless..

Regards,
  Marco

> fengping.yu (3):
>   dt-bindings: add matrix keypad documentation
>   arm64: configs: defconfig: enable mtk keypad config
>   drivers: input: keyboard: add mtk keypad driver
> 
>  .../devicetree/bindings/input/mtk-kpd.txt     |  61 +++++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/input/keyboard/Kconfig                |   9 +
>  drivers/input/keyboard/Makefile               |   1 +
>  drivers/input/keyboard/mtk-kpd.c              | 242 ++++++++++++++++++
>  5 files changed, 314 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
>  create mode 100644 drivers/input/keyboard/mtk-kpd.c
> 
> --
> 2.18.0
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
