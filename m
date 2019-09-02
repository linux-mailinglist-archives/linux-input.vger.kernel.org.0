Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF6FA5819
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 15:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbfIBNjS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 09:39:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52821 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731290AbfIBNjS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Sep 2019 09:39:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id t17so14649036wmi.2;
        Mon, 02 Sep 2019 06:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M0OACsjJM/vFX4zZJBUZMzKJ/8JnqkMV5QQXF6yqIpw=;
        b=GvJr9+ogweiL3yV6clbltN0YUs/nKQsG+nCwo0cY9aHWWqy2NrynnKtTZJ3l2CsE+4
         O/LnFU6w76e0BxMVnKQBHTupQ6NH58zaPtHw1FfRi+Tz8lEirJP2a9TmVOwGP74aH2vD
         zyRpRO0FP2N8smLdrJiMIw/WOTrKpWn9bUxd3EYM2qZIXkdVXeK/bu+qtTPwmUlvV6Tk
         q1l/TTVKsN8nghyVbPvnhgytZmE1GvU/5qKihPckS/ExalmybGE/zkViK4V1vMCyKjFM
         GoFilllwlv16pAbyC0GkIOM3YBnraZGG2XfPNroWexhS+RNcAlyiPV8ILV/wmfcLQL7P
         +b0g==
X-Gm-Message-State: APjAAAVGVSFLJoExbysWrR5YzSdzHjaNQVyVPTew09IURR9R4ABPcdXs
        tCYU1m0SN18TIimqyN8UXg==
X-Google-Smtp-Source: APXvYqypcMzdNic7ziNevmFZ8BaxYjbIqLahyGSd0YIMXh2YBwVcb/OvssGZQd+0DzdiFqCWRfYvcQ==
X-Received: by 2002:a1c:3d03:: with SMTP id k3mr37181683wma.138.1567431555922;
        Mon, 02 Sep 2019 06:39:15 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id s19sm28771567wrb.94.2019.09.02.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:39:15 -0700 (PDT)
Date:   Mon, 02 Sep 2019 14:39:14 +0100
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com, olof@lixom.net,
        mripard@kernel.org, arnd@arndb.de, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, hsweeten@visionengravers.com,
        tglx@linutronix.de, gregkh@linuxfoundation.org, stefan@agner.ch,
        ronald@innovation.ch, ping.bai@nxp.com, m.felsch@pengutronix.de,
        andriy.shevchenko@linux.intel.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH 1/5] dt-bindings: fsl: scu: add scu power key binding
Message-ID: <20190902043521.GA14143@bogus>
References: <1567198429-27886-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567198429-27886-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 30, 2019 at 04:53:45PM -0400, Anson Huang wrote:
> NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
> system controller, the system controller is in charge of system
> power, clock and power key event etc. management, Linux kernel
> has to communicate with system controller via MU (message unit)
> IPC to get power key event, add binding doc for i.MX system
> controller power key driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index c149fad..001d0b7 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -157,6 +157,17 @@ Required properties:
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
> +Optional Properties:
> +- wakeup-source: See Documentation/devicetree/bindings/power/wakeup-source.txt
> +
>  Example (imx8qxp):
>  -------------
>  aliases {
> @@ -220,6 +231,13 @@ firmware {
>  			compatible = "fsl,imx8qxp-sc-rtc";
>  		};
>  
> +		scu_pwrkey: scu-pwrkey {
> +			compatible = "fsl,imx8qxp-sc-pwrkey", "fsl,imx-sc-pwrkey";
> +			linux,keycode = <KEY_POWER>;
> +			wakeup-source;

wakeup-source implies an interrupt property.

> +			status = "disabled";

Don't should status in examples.

> +		};
> +
>  		watchdog {
>  			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
>  			timeout-sec = <60>;
> -- 
> 2.7.4
> 

