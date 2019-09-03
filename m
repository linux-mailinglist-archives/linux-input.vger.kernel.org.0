Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4627AA6115
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 08:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfICGM1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 02:12:27 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43679 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfICGM1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 02:12:27 -0400
Received: by mail-io1-f65.google.com with SMTP id u185so29482191iod.10;
        Mon, 02 Sep 2019 23:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZ5aGUxM1e1yAxeiEBXNgI8jjZDu1KoSilHhJTQM1zk=;
        b=Wep3juTmL73l+HU2tDif3J1tPbmROfBh6z6wBs94tp5cxNJLrGZxFgQlSGpnSSRPPH
         oTkMvyeCpeMI5ECRFaSvjc9HiQJEfMCTk/lrFOVPmYGQXwyKcc8CUmRCFzIIrhLaKNyD
         3z2XRvdXF3fItuYEDCvcBCCLPjkFafM2rG2rMtVyUOlLRyLgiYWpW4GYClUyepfweeaz
         b3+lKyAmSHAcLNppvm3AGZEOMUfXrcl2ixluW/2FhVQ07TRYZoTjzrKw5MojHYEW53lB
         3DjQQ0aVOgb8yJ7gxDI9GPt5lRBBDtqtJrH5EjLGIn+IEeWGL90mvoGz6Fa4Gxa0xoPo
         xKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZ5aGUxM1e1yAxeiEBXNgI8jjZDu1KoSilHhJTQM1zk=;
        b=KmJlZl5H009KsSueieKeqo9izO0IV16u7UhVBzzQUM0y3ZIaB7Y01cDQoyd5cRrYfr
         8PW+BkZ4/W8IzUknXm33VBHoRbRwNJm2dutv4VBbeX6t3YMKOe4dbmaYD3P2ycF69HT6
         ldPxBdouu0FuRHv9buZRG0OoeA/4TDuzyCxKD/YP1Z9xKWMkSVUd6fk9N2v3O7YRZg7y
         v0XGKCjB5GFK4+cuUsxX/gSae5/AYqFwmqHlxgYNuiu46ivnomN82WvfQEhmNy2aFVS7
         3Ccs/ofTicaf4VxFsz/BRiyxyU1GkqLleQs6e/9qB2eqZygQ3cigCR9w/4tPLodOsXt3
         iZeg==
X-Gm-Message-State: APjAAAV0KH86GaeZi3GQy9HAfYez7OkIF/o8/rkysIQ0zkuYcLY9Tmkc
        LONJZIdYk+A6T4+KSTkCN02O2jsCyzvPm7x6WAo=
X-Google-Smtp-Source: APXvYqx2QRjbzZ7hc5y/0wPXxc2BOsqW7rYBr5/+9NPVJBc9aypHeg6RUiCGJe8eAjajGn857PgZlmUrG9vDjyGLKMk=
X-Received: by 2002:a5d:974d:: with SMTP id c13mr11863170ioo.87.1567491145896;
 Mon, 02 Sep 2019 23:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <1567519424-32271-2-git-send-email-Anson.Huang@nxp.com> <CAOMZO5CHmvrbVG_h8hOb7hMjXasV_QwtNoXpEw9kqY=4Jj5HAg@mail.gmail.com>
 <DB3PR0402MB391636D31F486639FB8B3BA6F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB391636D31F486639FB8B3BA6F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Mon, 2 Sep 2019 23:12:14 -0700
Message-ID: <CAKdAkRRX4Cs1m7iwTuM0dpNr+xjp3qAZ1fo1pqreE7rR8KFgQQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andy Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 2, 2019 at 8:11 PM Anson Huang <anson.huang@nxp.com> wrote:
>
> Hi, Fabio
>
> > On Mon, Sep 2, 2019 at 11:05 PM Anson Huang <Anson.Huang@nxp.com>
> > wrote:
> >
> > > +       ret = input_register_device(input);
> > > +       if (ret < 0) {
> > > +               dev_err(&pdev->dev, "failed to register input device\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       pdata->input = input;
> > > +       platform_set_drvdata(pdev, pdata);
> > > +
> > > +       ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE,
> > SC_IRQ_BUTTON, true);
> > > +       if (ret) {
> > > +               dev_warn(&pdev->dev, "enable scu group irq failed\n");
> > > +               return ret;
> >
> > Better do a 'goto input_unregister' here instead and call
> > input_unregister_device().
>
> Agreed, will fix in V3 later.

Not needed actually as input device is managed by devm.

Thanks.

-- 
Dmitry
