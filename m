Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09FC5BA30E
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2019 18:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387640AbfIVQN4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Sep 2019 12:13:56 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46614 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387471AbfIVQN4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Sep 2019 12:13:56 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 98F198031F; Sun, 22 Sep 2019 18:13:39 +0200 (CEST)
Date:   Sun, 22 Sep 2019 18:13:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com, mripard@kernel.org,
        olof@lixom.net, arnd@arndb.de, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, stefan@agner.ch,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, tglx@linutronix.de, ronald@innovation.ch,
        m.felsch@pengutronix.de, ping.bai@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Message-ID: <20190922161347.GB1999@bug>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

> NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
> system controller, the system controller is in charge of system
> power, clock and power key event etc. management, Linux kernel
> has to communicate with system controller via MU (message unit)
> IPC to get power key event, add binding doc for i.MX system
> controller power key driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -157,6 +157,15 @@ Required properties:
>  Optional properties:
>  - timeout-sec: contains the watchdog timeout in seconds.
>  
> +Power key bindings based on SCU Message Protocol
> +------------------------------------------------------------
> +
> +Required properties:
> +- compatible: should be:
> +              "fsl,imx8qxp-sc-pwrkey"
> +              followed by "fsl,imx-sc-pwrkey";
> +- linux,keycodes: See Documentation/devicetree/bindings/input/keys.txt

Actually there's no reason for having "linux,keycodes" property when it is always
a power button.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
