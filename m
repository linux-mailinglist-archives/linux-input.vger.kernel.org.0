Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADD865CF8A
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 14:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfGBMe5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 08:34:57 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35144 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfGBMe4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 08:34:56 -0400
Received: by mail-pl1-f193.google.com with SMTP id w24so327616plp.2;
        Tue, 02 Jul 2019 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jokG8y7pGP2+UWx7IWucDqOqprFGw3L7LysoH2ndPPk=;
        b=QfZYXZ7feC/e+gYdXOs2JA4AM/I1wxZBQRu5H5BgIt0t195g9UcDFz7Uj/hLMc3Oyg
         J+hKy0Lf5pwPl6dKDZd4fQ/s0jc8R1wWGUiMvck0lMW9hpxHhBZBsdxhzMbuzQNQf60G
         pewif1bLaGPE6sZx5mjxVKnfsZ3mXS5l+i8WBOalZVORTZuMtcyYU7bbcBSg6fh9W2Rl
         l4IalWd7tfFFceLc+uPmCDNQFHNJeNmnNrhHZKmYZlrohaRnkDA4ESOrwclwibELzEDk
         9ktNk56ksCafz8CgLft8+XvtgsdGOAnAhHKpKw62aM3XY/xsveaSXJ0YTntJVku2s97i
         rNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jokG8y7pGP2+UWx7IWucDqOqprFGw3L7LysoH2ndPPk=;
        b=nfiI0KMTPiknhtf5gHvgOyQBxLuR5gtR/idYer90n7qSzcD2ZMQz2r6JnEAfuG6FHe
         aO+pQQWYOyHAiqsgfgHhrXXFjLVoDLQBfH5GB6JaPAkTrEdX9cV0lCiLUXYhXQbtfHeo
         yT+CJZbfI8cmeGuOWIS649W5I7GhOhGafmcAA0HHnhy/T4ihRdsSu7g6J7MPGe7J1m1V
         r2NCIb0j6/qX+iR1NcXMw8sEIbNrnQYY1mX873sWxSRfbIVj9zjTwq+WetlAQivAfbOC
         KKDFFDkkwTsYPefU6Bps+xRRbBdLaqV3BUyILyVDTI6A5wl7TNKmnTRIzONPpdmJrj8c
         khzQ==
X-Gm-Message-State: APjAAAU63fXk21kl3n1bChAwrBh82GHxxAGmw0REgWS3AG70c4hZJyyv
        PKz44p84/PgjQCsZ3huufRGKFa0n0RnurfXz+jA=
X-Google-Smtp-Source: APXvYqziILDu4WGQDw+R/UG1FckXLxR/PCpLHn/GWKNMFPxPSAKS+R2u6XB44qkhaHx36v7Mh2CmIGdRE7aMEkjyxuI=
X-Received: by 2002:a17:902:934a:: with SMTP id g10mr35770980plp.18.1562070895967;
 Tue, 02 Jul 2019 05:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190701032342.25971-1-huangfq.daxian@gmail.com>
 <20190701075255.GD172968@dtor-ws> <CABXRUiSO2Fos1V3hR5t3AviZ9Hit_y+E-Tp3PNOQj6-FKUBJBw@mail.gmail.com>
 <CAHp75VeUo2Au66tETo3zneBpeaVU+Y+-h5zghpo+hPuB=a6-eA@mail.gmail.com> <CABXRUiQ77feNzEdQ7GqNxLS9YAMybVG3eAWWSDPFdGvERaxCyg@mail.gmail.com>
In-Reply-To: <CABXRUiQ77feNzEdQ7GqNxLS9YAMybVG3eAWWSDPFdGvERaxCyg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Jul 2019 15:34:43 +0300
Message-ID: <CAHp75Vf-_me0HxTZ5cm7Tc_Y5oVqO7qOQvKycjjDv_7C91+Q+g@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: keyboard/mouse/touchscreen/misc: Use dev_get_drvdata()
To:     Fuqian Huang <huangfq.daxian@gmail.com>
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

On Tue, Jul 2, 2019 at 2:47 PM Fuqian Huang <huangfq.daxian@gmail.com> wrot=
e:
>
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2019=E5=B9=B47=E6=
=9C=882=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:51=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > On Tue, Jul 2, 2019 at 11:20 AM Fuqian Huang <huangfq.daxian@gmail.com>=
 wrote:
> > >
> > > I am not an expert on this. I just write a coccinelle script to searc=
h
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
> Replace it can remove the unnecessary step back and forth. (dev -> pdev -=
> dev).

Like just now Lothar gives a good idea for you to sell is to check
compiler output.

But the question itself is addressed to subsystem maintainer.

> Just like the commit

> 1948d498dcf6("thermal: intel: int340x: processor_thermal_device:
> simplify to get driver data")

Side note: this example is not good, since the macro is bus agnostic.

> and many other similar commits in the Linux git log.

--=20
With Best Regards,
Andy Shevchenko
