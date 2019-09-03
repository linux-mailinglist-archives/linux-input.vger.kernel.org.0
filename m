Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD52A5F62
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 04:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbfICCjB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 22:39:01 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38949 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfICCjA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Sep 2019 22:39:00 -0400
Received: by mail-lf1-f68.google.com with SMTP id l11so11610985lfk.6;
        Mon, 02 Sep 2019 19:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bypCdtkGCzTYBLw17U+HKNiJ2TPW1+aSuUx/xJPZIZo=;
        b=Tw2YiN+HIU2vOIqjXQvLB1Aaa7OR8piST1fyAxnRATGJ7xPFti8tvGrk+Q1W2IfFwh
         3is/D+npGDgCVdQZk8KI89Cjs03qBDMuqpAVhR3qD/Be2CZozOGXWYP9/jvB7cG8oMsy
         GbynC5WW+g/omkxFMfkzATGJm9qsXdKbZOQkYg6aQjgrEpCDczgIO+Sb+egz6jrHvtku
         H/cmrwxJ22Flcr0ha+YNU9ZYGDqCRkPIZ90JirjlV7Mkie/dqQePYO3CNN3UkcLszKyS
         JtmmL/T2kErBT9Xi0cimYGOuKfbsuMEWvlf/Icz1yKur63PrmdWLqpXQXShH+bE1P4O+
         4QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bypCdtkGCzTYBLw17U+HKNiJ2TPW1+aSuUx/xJPZIZo=;
        b=aQY4HZyLdI6Wkl1Ol+VY8CobOk0ExCOfbW1TrXEleIyARNdnsPI68e3jtqX1WgFRID
         NkhfIa9YnestnnACioreRwC2341ZvgTNBDEvYga1Jiwnu0Muqnz1U8eI8bcWiACN1a5p
         yK0UOfBbUb8WoJOKRLaSvpgn/hZE+dgELxgIhRTEjhE0MbP5M1mjQY4A1cqEYBrNvbR5
         theyqNDY/mPYekrliimPB0rFD6nsj0STEl7nf2dkM2xWuvuKs4+Tbr2nag2WIGBQ9hlf
         mdu430cmWWLJVbDYJjyWH2VI1QC1hScukKApU0EpBeYYHDGEpoX0WxNcgCPHZDcDRfs3
         Fv8w==
X-Gm-Message-State: APjAAAUVECIpGcmDIWYm2jb9OkDnd5BuvWfzxVDwzhsGocXnxO7iYvvo
        +rY/37T/3TPKsPbvkDu+0nKS055ghmAsCzWiaYk=
X-Google-Smtp-Source: APXvYqwGGeSGkPpuwW5dwm7rAyPowBBe7Ix/KIQ0UDaaZQ+Ir4C6sIN/uDqrUD6hZZwmSAh0xU9ocevalRVs66GAl1c=
X-Received: by 2002:a19:f11c:: with SMTP id p28mr8434160lfh.44.1567478338404;
 Mon, 02 Sep 2019 19:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com> <1567519424-32271-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1567519424-32271-2-git-send-email-Anson.Huang@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 2 Sep 2019 23:38:54 -0300
Message-ID: <CAOMZO5CHmvrbVG_h8hOb7hMjXasV_QwtNoXpEw9kqY=4Jj5HAg@mail.gmail.com>
Subject: Re: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Fugang Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>, mripard@kernel.org,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        marcin.juszkiewicz@linaro.org, Stefan Agner <stefan@agner.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yuehaibing@huawei.com, Thomas Gleixner <tglx@linutronix.de>,
        ronald@innovation.ch, Marco Felsch <m.felsch@pengutronix.de>,
        Ping Bai <ping.bai@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-input@vger.kernel.org, NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Anson,

On Mon, Sep 2, 2019 at 11:05 PM Anson Huang <Anson.Huang@nxp.com> wrote:

> +       ret = input_register_device(input);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to register input device\n");
> +               return ret;
> +       }
> +
> +       pdata->input = input;
> +       platform_set_drvdata(pdev, pdata);
> +
> +       ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, true);
> +       if (ret) {
> +               dev_warn(&pdev->dev, "enable scu group irq failed\n");
> +               return ret;

Better do a 'goto input_unregister' here instead and call
input_unregister_device().
