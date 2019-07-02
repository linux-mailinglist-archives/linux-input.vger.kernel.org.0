Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62AF55CBF0
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 10:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfGBISo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 04:18:44 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:36293 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbfGBISo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 04:18:44 -0400
Received: by mail-yb1-f193.google.com with SMTP id t10so1023712ybk.3;
        Tue, 02 Jul 2019 01:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HAdClOUcHZ3IYsbl5G0rdG7nEVZII6d9JlEQ/5XRWdk=;
        b=FwZV5NXMNI5saJ1G6bx15kCv6z1R0kIQ/OlYpnallmC4052OFYRIMUdar2Pnl7GUFT
         Q3bKhIRB0X9PALZKZh8ZbQGLPGGBaGTdk3nXfc/IZuBhK2i3ge+qe8vSc+czhI9SiGWm
         oqj+2aBO/F6z9BoxoDfIJI37e9B7gRULfaQsthCZfuUL5r7pwHHCxQ/nspoLDRVJzrCZ
         f2aJRey0bxy9ncHKWSneF8WW4QPHPrgarhs9/N/Zwy1bziHC/quawgJGgzu61s5nIMiO
         RRGAi91FpAYcHZZbHGNcMElnzDj+5BIK9LJpBavEQoVi9ZmQx/vPu4FwOhh1Dk6UfHqV
         XUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HAdClOUcHZ3IYsbl5G0rdG7nEVZII6d9JlEQ/5XRWdk=;
        b=I2KJ2vC9VrqspMTsQUK6WWHE+4O7upxJTNilMq8vAyXEp8H8apt0hSyV/YK4ep7JCU
         nomP2noIZFcAGnwnFCtd9RSBj3sxjfUiRW/ehxdlNw+QvgKboDxGRofT/OYbn7tMLKFq
         tJeSG+RMcUdxpSf72fZDJWH1egvc5ssFAZ9Hg3iqcf832ARSkB3VkRVDPFcv453/e8EU
         MBuw8IgAN12xcM2QlTbUdACIXFpUS5plAy1k+ZRwWpLK0J7FFiLA21JKdoUXCa3R/PHP
         2P3AMXrjVHZcdy/koHXKGVb475CfxQOtq65ugx3X2/ZSIGh75cMeQOKe9IEClwcxLAc5
         Zp7A==
X-Gm-Message-State: APjAAAUz1sC/srvOzg1VYacCvPxU52+gDG/wW6NLGlnLMDGXTe4kmBJF
        JgP0ym/X/4gyKwQDDc3HytYZqoaNA/pQN8fJHiw=
X-Google-Smtp-Source: APXvYqwClpSzv6om5yiHw+9Sq3JuKWwAJ3+EDe4nfSlCRU988YJhWO0Q93wVfyW/7gxXqZfMBwixd3t50uVQ5DNxGB4=
X-Received: by 2002:a25:9347:: with SMTP id g7mr5943206ybo.277.1562055523517;
 Tue, 02 Jul 2019 01:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190701032342.25971-1-huangfq.daxian@gmail.com> <20190701075255.GD172968@dtor-ws>
In-Reply-To: <20190701075255.GD172968@dtor-ws>
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Date:   Tue, 2 Jul 2019 16:18:32 +0800
Message-ID: <CABXRUiSO2Fos1V3hR5t3AviZ9Hit_y+E-Tp3PNOQj6-FKUBJBw@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: keyboard/mouse/touchscreen/misc: Use dev_get_drvdata()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
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
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I am not an expert on this. I just write a coccinelle script to search
this kind of misuse and fix it in a naive way.
Could you tell me about how to use the proper bus accessors? Then I
will fix it up and resend a v2 patch set.

Thanks.

Dmitry Torokhov <dmitry.torokhov@gmail.com> =E6=96=BC 2019=E5=B9=B47=E6=9C=
=881=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi Fuqian,
>
> On Mon, Jul 01, 2019 at 11:23:12AM +0800, Fuqian Huang wrote:
> > Using dev_get_drvdata directly.
> >
>
> I prefer using proper bus accessors.
>
> Thanks.
>
> --
> Dmitry
