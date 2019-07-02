Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF635CEB1
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 13:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbfGBLr3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 07:47:29 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:41911 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfGBLr2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 07:47:28 -0400
Received: by mail-yb1-f193.google.com with SMTP id y67so1180780yba.8;
        Tue, 02 Jul 2019 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iYZrmys3/TfpaazA2XWiT/TSEbAAksLqlj6ZynD2xWk=;
        b=lcJQMmt6baOOctsuGbaQsTWjGgM7s7CKLXoYb0+CQzOpJsTRHYREzkd/8Q/dfuuOUZ
         HX5qKdQrVQcWelEAVhoj8ZHzlvUJbmFcgX3J17+3GeWR6DYYZ3u3vNuHEmeJQTLpZRiW
         dwNVl6CnmpahWLTAJDUTCqo7ttR0m18gI69RjBhI1/mklFkd4L0UQj7VyvSur4gONpgV
         6cvlO1adRD0gqNnpmOv//P9QnnH87CTmkgwz/7N8MRqRrdH8DHEaEJJbJkakHFbx8dsU
         6u3/iJ1+gJQXn4un5aUg806xORKwn1LVi4nP95gxS17fO8lZ+tXKBIEO/H7CPTsrcu1j
         SVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iYZrmys3/TfpaazA2XWiT/TSEbAAksLqlj6ZynD2xWk=;
        b=fkAntDWSWP7ptNrIKaLl8YNAaDFN69Fi/eMUAMJgZHyavkF96AOkENAxN7RPkRb3vT
         a8BynrgkYf9vOBzqGdsHbSPFW4Wykrqc+2t7sdi+uUHonZ/tgqKQDLZ7SKnJY5delE0f
         +VMd1urJ5SrdvoswE+ST+U9NGz9Vxo+i1pzooM11u0FuxZoMZ5GuMdrHqiNtQnPQVkzi
         OX8/w6s8LO7RV9YSXqx00t/CftuSs/4CqVkxG2cSMMPz1g89PJWtLa9QDtALoa8n/3bf
         AGU7aH0ebEEeQmWArLxbMn9c3FO2xFbekIh8rjkasJxiA8xkBZJ4PbK6Eo59SYvODEiL
         TtPg==
X-Gm-Message-State: APjAAAWYEmsva+HLu3SwPBcznM+7ptwbM6zh7LRT9gK8fm+0sWAKfGQK
        jtieHnKKpYd2GMFkP1HQdpXbrFFzjt1brPfzTUQ=
X-Google-Smtp-Source: APXvYqyFfoChK3rqQLCksZ9VPYQx8ymAFP/2n5xhyywi4ep5LxSGcw3v0w5ozKJd6MUYJVOjINhiPlBbnXX9M9M2A+g=
X-Received: by 2002:a25:9347:: with SMTP id g7mr6440701ybo.277.1562068047954;
 Tue, 02 Jul 2019 04:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190701032342.25971-1-huangfq.daxian@gmail.com>
 <20190701075255.GD172968@dtor-ws> <CABXRUiSO2Fos1V3hR5t3AviZ9Hit_y+E-Tp3PNOQj6-FKUBJBw@mail.gmail.com>
 <CAHp75VeUo2Au66tETo3zneBpeaVU+Y+-h5zghpo+hPuB=a6-eA@mail.gmail.com>
In-Reply-To: <CAHp75VeUo2Au66tETo3zneBpeaVU+Y+-h5zghpo+hPuB=a6-eA@mail.gmail.com>
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Date:   Tue, 2 Jul 2019 19:47:16 +0800
Message-ID: <CABXRUiQ77feNzEdQ7GqNxLS9YAMybVG3eAWWSDPFdGvERaxCyg@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: keyboard/mouse/touchscreen/misc: Use dev_get_drvdata()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Olof Johansson <olof@lixom.net>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Arnd Bergmann <arnd@arndb.de>, Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Christian Hoff <christian_hoff@gmx.net>,
        Tony Lindgren <tony@atomide.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Gabriel Fernandez <gabriel.fernandez@st.com>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Brian Masney <masneyb@onstation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2019=E5=B9=B47=E6=9C=
=882=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:51=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Tue, Jul 2, 2019 at 11:20 AM Fuqian Huang <huangfq.daxian@gmail.com> w=
rote:
> >
> > I am not an expert on this. I just write a coccinelle script to search
> > this kind of misuse and fix it in a naive way.
> > Could you tell me about how to use the proper bus accessors? Then I
> > will fix it up and resend a v2 patch set.
>
> First, don't top post.
> And answering to this, simple drop the patch.
> Proper bus accessors is exactly what it's used in the current code.

But why not use dev_get_drvdata directly.
It simplifies getting the 'driver_data' from 'struct device' directly.
And the platform_device here is not required.
Replace it can remove the unnecessary step back and forth. (dev -> pdev -> =
dev).

Just like the commit
ed835136ee67 ("mfd: Use dev_get_drvdata() directly")
1948d498dcf6("thermal: intel: int340x: processor_thermal_device:
simplify to get driver data")
and many other similar commits in the Linux git log.
