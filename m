Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D13C5CFA0
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 14:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfGBMjd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 2 Jul 2019 08:39:33 -0400
Received: from mailout02.agenturserver.de ([185.15.192.33]:38720 "EHLO
        mailout02.agenturserver.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726636AbfGBMjd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 2 Jul 2019 08:39:33 -0400
X-Greylist: delayed 409 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Jul 2019 08:39:30 EDT
Received: from mail02.agenturserver.de (mail02.internal [172.16.51.35])
        by mailout02.agenturserver.de (Postfix) with ESMTP id 64F3112614C;
        Tue,  2 Jul 2019 14:32:38 +0200 (CEST)
Received: from localhost (ac02.internal [172.16.51.82])
        by mail02.agenturserver.de (Postfix) with ESMTP id 1818180753;
        Tue,  2 Jul 2019 14:32:37 +0200 (CEST)
X-Spam-Level: 
Received: from mail.agenturserver.de ([172.16.51.35])
        by localhost (ac02.mittwald.de [172.16.51.82]) (amavisd-new, port 10026)
        with ESMTP id wKItvphULAwB; Tue,  2 Jul 2019 14:32:36 +0200 (CEST)
Received: from karo-electronics.de (unknown [89.1.81.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: lw@karo-electronics.de)
        by mail.agenturserver.de (Postfix) with ESMTPSA;
        Tue,  2 Jul 2019 14:32:26 +0200 (CEST)
Date:   Tue, 2 Jul 2019 14:32:25 +0200
From:   Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>,
        Richard Fontana <rfontana@redhat.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Brian Masney <masneyb@onstation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-input <linux-input@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Hoff <christian_hoff@gmx.net>,
        Enrico Weigelt <info@metux.net>,
        Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH 2/4] input: keyboard/mouse/touchscreen/misc: Use
 dev_get_drvdata()
Message-ID: <20190702143225.12b0fe07@karo-electronics.de>
In-Reply-To: <CABXRUiQ77feNzEdQ7GqNxLS9YAMybVG3eAWWSDPFdGvERaxCyg@mail.gmail.com>
References: <20190701032342.25971-1-huangfq.daxian@gmail.com>
        <20190701075255.GD172968@dtor-ws>
        <CABXRUiSO2Fos1V3hR5t3AviZ9Hit_y+E-Tp3PNOQj6-FKUBJBw@mail.gmail.com>
        <CAHp75VeUo2Au66tETo3zneBpeaVU+Y+-h5zghpo+hPuB=a6-eA@mail.gmail.com>
        <CABXRUiQ77feNzEdQ7GqNxLS9YAMybVG3eAWWSDPFdGvERaxCyg@mail.gmail.com>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, 2 Jul 2019 19:47:16 +0800 Fuqian Huang wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> 於 2019年7月2日週二 下午5:51寫道：
> >
> > On Tue, Jul 2, 2019 at 11:20 AM Fuqian Huang <huangfq.daxian@gmail.com> wrote:  
> > >
> > > I am not an expert on this. I just write a coccinelle script to search
> > > this kind of misuse and fix it in a naive way.
> > > Could you tell me about how to use the proper bus accessors? Then I
> > > will fix it up and resend a v2 patch set.  
> >
> > First, don't top post.
> > And answering to this, simple drop the patch.
> > Proper bus accessors is exactly what it's used in the current code.  
> 
> But why not use dev_get_drvdata directly.
> It simplifies getting the 'driver_data' from 'struct device' directly.
> And the platform_device here is not required.
> Replace it can remove the unnecessary step back and forth. (dev -> pdev -> dev).
> 
Did you check whether the compiler generates different (better) code
with and without your patch? My guess is it won't.


Lothar Waßmann
