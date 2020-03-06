Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329D817C312
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 17:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgCFQi5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 11:38:57 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46704 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgCFQi5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 11:38:57 -0500
Received: by mail-vs1-f67.google.com with SMTP id s9so1104259vsi.13
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qx3A/IQVNW7fzT3DwYvCqbENQb/6yvNaKEnyDu7jQZY=;
        b=2SQTFpXFJ0ik4M9EvISuXCVD3a7NNwmMo805wmtt408kV/i1HIwGDl8LwDBMYvNIiJ
         RZIqPk0VF9ZuvoGBqwqep2ipEY4NNQEGAJAcXLT3sTjK8Btj6AqWQMdrrc9wr3RZ8Ong
         Tx5DVRr103eEnHPfHk2FVvCmMXrQft2kBHl8eHNMAdHVmSAa1m10QUmchvkNvIH5p5x4
         QyY2aDHx8tgT0gAQRbJ6Ydu7Z2fVpO7X5qeVcbuAIyu3bCXqcASZHZKJ8ZljOPtXPP9G
         BGcqbEU/rAoQFHtk6bXIZVXtoXXnpy3xfrTgbAopTUrcF3bTgjcdk0D9UDJs5wmaQeW7
         k0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qx3A/IQVNW7fzT3DwYvCqbENQb/6yvNaKEnyDu7jQZY=;
        b=L9wBuaxyZSnaTAdgqCm7lEQDqq3PHr5lM4L1q6Y1hA6QGvCsh8MVlYnIvm3YREsP+1
         nTULYLalXxWkIfSJi1OTsaAVuls1AtQN3XMvxxRToJ+ZtSrr3yRN7v6VWfV2fPqWMWaG
         QzRiKJcTFfeqprqgholehObXSi6PQP8T3vAC35yb06e/9dkra8apQmTd96KHbww1KVKr
         +RMHoObBfABZz5CIgnhuFzHLTYVFW9LWbx2tDnwL03TFjfuhbck3iTVSjZt08Va2sw7i
         WbXVYudHycI4BTZOZb2X8eFt2ZoyAvQNGieQlBZ+sA1PULL7Gle+uf+KkwHTzrxSC/qW
         HjSw==
X-Gm-Message-State: ANhLgQ3GNFZQDgVG5W7oeWvZQbqWlrlRZgg9VIclN08Rmei+WIgrS2aN
        b5vE9PyrnqXj6Be9i3XWmOF2mbzRzTNwyovC5UMh2A==
X-Google-Smtp-Source: ADFU+vsgrX3M9ZUTt8zNbjVtAO9AoVvwrrtdDDH13N7+Fbkq+KCJfEoKR4CXqN5VR9tlf56RJTCEgxF3RkYjr11VXSc=
X-Received: by 2002:a67:e195:: with SMTP id e21mr2608876vsl.159.1583512735838;
 Fri, 06 Mar 2020 08:38:55 -0800 (PST)
MIME-Version: 1.0
References: <1583509356-8265-1-git-send-email-Anson.Huang@nxp.com> <1583509356-8265-5-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1583509356-8265-5-git-send-email-Anson.Huang@nxp.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Fri, 6 Mar 2020 22:08:44 +0530
Message-ID: <CAHLCerPXZD_qpacWuQ51Fu5RGgq1NG-FUhzgKdxND7-t460Kfg@mail.gmail.com>
Subject: Re: [PATCH 5/5] thermal: add COMPILE_TEST support for IMX_SC_THERMAL
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        wim@linux-watchdog.org, linux@roeck-us.net, daniel.baluta@nxp.com,
        linux@rempel-privat.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, m.felsch@pengutronix.de,
        andriy.shevchenko@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        ronald@innovation.ch, Krzysztof Kozlowski <krzk@kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, Linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 6, 2020 at 9:19 PM Anson Huang <Anson.Huang@nxp.com> wrote:
>
> Add COMPILE_TEST support to i.MX SC thermal driver for better compile
> testing coverage.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 91af271..55c7641 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -254,7 +254,7 @@ config IMX_THERMAL
>
>  config IMX_SC_THERMAL
>         tristate "Temperature sensor driver for NXP i.MX SoCs with System Controller"
> -       depends on IMX_SCU
> +       depends on IMX_SCU || COMPILE_TEST
>         depends on OF
>         help
>           Support for Temperature Monitor (TEMPMON) found on NXP i.MX SoCs with
> --
> 2.7.4
>
