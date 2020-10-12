Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E0F28B3D4
	for <lists+linux-input@lfdr.de>; Mon, 12 Oct 2020 13:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388027AbgJLLcV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Oct 2020 07:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388126AbgJLLcU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Oct 2020 07:32:20 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DBCC0613CE
        for <linux-input@vger.kernel.org>; Mon, 12 Oct 2020 04:32:18 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id o18so15651732ill.2
        for <linux-input@vger.kernel.org>; Mon, 12 Oct 2020 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GEZ30uHcB4gCYRY0Kw4S2qBnDEZMtJM9Qds8fZDfV58=;
        b=PIxiqA82MKwMjvjnTpP57/qULsHVcYMxitmp2tTL675MT7MO7bRwKzet10nOXG4vU6
         QQyskwjqsZv5tNdE2SqKpNrRPFQhRMIbKKB1LdH4Fs4Ud9zz78ReTAyaCmbk5La0HoI4
         X2aWZQNsPT9VqkjEaapaVqMcpqD11yZLdLHzGvgj7gkC0iV/z0CDAGgE9m05aEdSF5hb
         77kgR01/EP6sJwbe+GuHZ7H6qCJBd2Xhyz/u7ItTf0Y2OAb9xbTlpJnCNHF8J/RjLew5
         q91TcKOT8S1+b1yRI9oPdf4aNuJylngkRo+qxAgoSemK57OZzKx516iRx544kuGLlWYu
         UaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GEZ30uHcB4gCYRY0Kw4S2qBnDEZMtJM9Qds8fZDfV58=;
        b=HPIx8AmUDtL61p4H07wFhzsd7NMOOclwEKPh3kxmptz7RSS2qSh0x5nL6wUNS4aXrR
         WVArTE0Mek+XV4sOYmonliDYUSM06Qe5e1jRg+FVruP6sOm8mNJuoK6oNkhiz1mVi2bB
         DlFURYfDRqjJB8mWusxhobqKitYdp2oDTZaDNjj4MxZPzafPMlUaq+vDJjlimUiBWpg7
         AhGC51/00BdjIEtEfhTllP/j6JwOncE4pQ0tq1pbQi8lraXegK/vji5xix/kMtUQQmMT
         RDTOBhqwOSSPsk3EIz84A/rkPpEhSedfaJakz7/7ZnFF/Dw0EBBH0cBzMrhioIWmIwA/
         E6Ng==
X-Gm-Message-State: AOAM530+KmfKg8k6M03pKTcRWFxFn03sdi7/EW0hBzlBYDt2LgTGXaSx
        F72QRYktQg4L8n3lGSOAV6NRJEN6rAn6GWXebawNaA==
X-Google-Smtp-Source: ABdhPJyLLBEcCZs4P83L/eK/Huyr0D8kfmUyrJn6qQR0sEJb8lZ7fK2Cxa8gnX00UsaMx46oJJ7XjmD0vGP0+z6QDRs=
X-Received: by 2002:a92:7914:: with SMTP id u20mr18587223ilc.203.1602502337364;
 Mon, 12 Oct 2020 04:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200907103311.1601907-1-fparent@baylibre.com>
 <20200907103311.1601907-3-fparent@baylibre.com> <20200908135337.GU4400@dell>
In-Reply-To: <20200908135337.GU4400@dell>
From:   Fabien Parent <fparent@baylibre.com>
Date:   Mon, 12 Oct 2020 13:32:06 +0200
Message-ID: <CAOwMV_znW_g38X4VRDAJCxmNhwHUh0yO1fxEhKbt6Ge+NtseHw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] mfd: mt6397: Add support for MT6392 pmic
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>, linux-input@vger.kernel.org,
        hsin-hsiung.wang@mediatek.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 8, 2020 at 3:53 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Mon, 07 Sep 2020, Fabien Parent wrote:
>
> > Update the MT6397 MFD driver to support the MT6392 PMIC.
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >
> > V5:
> >       * Rebased
> >       * removed mt6392-regulator compatible. This will be send in anoth=
er
> >         series to make this series easier to merge.
> >
> > V4:
> >       * Use DEFINE_RES_* macro to define RTC ressources.
> >       * Use PLATFORM_DEVID_NONE instead of -1 value when registering de=
vices.
> >
> > V3:
> >       * No change
> >
> > V2:
> >       * Pass IRQ comain to fix invalid MFD devices IRQs.
> >       * Remove resources and mfd cells for device we don't support.
> >       * Rename IRQ names to follow what's done for MT6397.
> >
> > ---
>
> You shouldn't need to add your own '---' marker.
>
> Just place the changelog under the existing one.
>
> >  drivers/mfd/mt6397-core.c            |  40 +++
> >  drivers/mfd/mt6397-irq.c             |   9 +
> >  include/linux/mfd/mt6392/core.h      |  42 +++
> >  include/linux/mfd/mt6392/registers.h | 487 +++++++++++++++++++++++++++
> >  include/linux/mfd/mt6397/core.h      |   1 +
> >  5 files changed, 579 insertions(+)
> >  create mode 100644 include/linux/mfd/mt6392/core.h
> >  create mode 100644 include/linux/mfd/mt6392/registers.h
> >
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index f6cd8a660602..6ba3585b1b36 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -13,9 +13,11 @@
> >  #include <linux/mfd/core.h>
> >  #include <linux/mfd/mt6323/core.h>
> >  #include <linux/mfd/mt6358/core.h>
> > +#include <linux/mfd/mt6392/core.h>
> >  #include <linux/mfd/mt6397/core.h>
> >  #include <linux/mfd/mt6323/registers.h>
> >  #include <linux/mfd/mt6358/registers.h>
> > +#include <linux/mfd/mt6392/registers.h>
> >  #include <linux/mfd/mt6397/registers.h>
> >
> >  #define MT6323_RTC_BASE              0x8000
> > @@ -27,6 +29,9 @@
> >  #define MT6397_RTC_BASE              0xe000
> >  #define MT6397_RTC_SIZE              0x3e
> >
> > +#define MT6392_RTC_BASE              0x8000
> > +#define MT6392_RTC_SIZE              0x3e
> > +
>
> Nit: Why aren't these (all) in the header files above?

Not sure, I just followed what people did previously here.

>
> >  #define MT6323_PWRC_BASE     0x8000
> >  #define MT6323_PWRC_SIZE     0x40
> >
> > @@ -40,6 +45,11 @@ static const struct resource mt6358_rtc_resources[] =
=3D {
> >       DEFINE_RES_IRQ(MT6358_IRQ_RTC),
> >  };
> >
> > +static const struct resource mt6392_rtc_resources[] =3D {
> > +     DEFINE_RES_MEM(MT6392_RTC_BASE, MT6392_RTC_SIZE),
> > +     DEFINE_RES_IRQ(MT6392_IRQ_RTC),
> > +};
> > +
> >  static const struct resource mt6397_rtc_resources[] =3D {
> >       DEFINE_RES_MEM(MT6397_RTC_BASE, MT6397_RTC_SIZE),
> >       DEFINE_RES_IRQ(MT6397_IRQ_RTC),
> > @@ -50,6 +60,11 @@ static const struct resource mt6323_keys_resources[]=
 =3D {
> >       DEFINE_RES_IRQ(MT6323_IRQ_STATUS_FCHRKEY),
> >  };
> >
> > +static const struct resource mt6392_keys_resources[] =3D {
> > +     DEFINE_RES_IRQ(MT6392_IRQ_PWRKEY),
> > +     DEFINE_RES_IRQ(MT6392_IRQ_FCHRKEY),
> > +};
> > +
> >  static const struct resource mt6397_keys_resources[] =3D {
> >       DEFINE_RES_IRQ(MT6397_IRQ_PWRKEY),
> >       DEFINE_RES_IRQ(MT6397_IRQ_HOMEKEY),
> > @@ -99,6 +114,20 @@ static const struct mfd_cell mt6358_devs[] =3D {
> >       },
> >  };
> >
> > +static const struct mfd_cell mt6392_devs[] =3D {
> > +     {
> > +             .name =3D "mt6397-rtc",
> > +             .num_resources =3D ARRAY_SIZE(mt6392_rtc_resources),
> > +             .resources =3D mt6392_rtc_resources,
> > +             .of_compatible =3D "mediatek,mt6392-rtc",
> > +     }, {
> > +             .name =3D "mtk-pmic-keys",
> > +             .num_resources =3D ARRAY_SIZE(mt6392_keys_resources),
> > +             .resources =3D mt6392_keys_resources,
> > +             .of_compatible =3D "mediatek,mt6392-keys"
> > +     },
> > +};
> > +
> >  static const struct mfd_cell mt6397_devs[] =3D {
> >       {
> >               .name =3D "mt6397-rtc",
> > @@ -149,6 +178,14 @@ static const struct chip_data mt6358_core =3D {
> >       .irq_init =3D mt6358_irq_init,
> >  };
> >
> > +static const struct chip_data mt6392_core =3D {
> > +     .cid_addr =3D MT6392_CID,
> > +     .cid_shift =3D 0,
> > +     .cells =3D mt6392_devs,
> > +     .cell_size =3D ARRAY_SIZE(mt6392_devs),
> > +     .irq_init =3D mt6397_irq_init,
> > +};
> > +
> >  static const struct chip_data mt6397_core =3D {
> >       .cid_addr =3D MT6397_CID,
> >       .cid_shift =3D 0,
> > @@ -218,6 +255,9 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
> >       }, {
> >               .compatible =3D "mediatek,mt6358",
> >               .data =3D &mt6358_core,
> > +     }, {
> > +             .compatible =3D "mediatek,mt6392",
> > +             .data =3D &mt6392_core,
> >       }, {
> >               .compatible =3D "mediatek,mt6397",
> >               .data =3D &mt6397_core,
> > diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> > index 2924919da991..9bf95e2ddf02 100644
> > --- a/drivers/mfd/mt6397-irq.c
> > +++ b/drivers/mfd/mt6397-irq.c
> > @@ -12,6 +12,8 @@
> >  #include <linux/suspend.h>
> >  #include <linux/mfd/mt6323/core.h>
> >  #include <linux/mfd/mt6323/registers.h>
> > +#include <linux/mfd/mt6392/core.h>
> > +#include <linux/mfd/mt6392/registers.h>
> >  #include <linux/mfd/mt6397/core.h>
> >  #include <linux/mfd/mt6397/registers.h>
> >
> > @@ -181,6 +183,13 @@ int mt6397_irq_init(struct mt6397_chip *chip)
> >               chip->int_status[1] =3D MT6397_INT_STATUS1;
> >               break;
> >
> > +     case MT6392_CHIP_ID:
> > +             chip->int_con[0] =3D MT6392_INT_CON0;
> > +             chip->int_con[1] =3D MT6392_INT_CON1;
> > +             chip->int_status[0] =3D MT6392_INT_STATUS0;
> > +             chip->int_status[1] =3D MT6392_INT_STATUS1;
> > +             break;
> > +
>
> Nit: These line breaks seem superfluous.
>
> >       default:
> >               dev_err(chip->dev, "unsupported chip: 0x%x\n", chip->chip=
_id);
> >               return -ENODEV;
> > diff --git a/include/linux/mfd/mt6392/core.h b/include/linux/mfd/mt6392=
/core.h
> > new file mode 100644
> > index 000000000000..7575a79ea052
> > --- /dev/null
> > +++ b/include/linux/mfd/mt6392/core.h
> > @@ -0,0 +1,42 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
>
> This is out of date.
>
> > + * Author: Chen Zhong <chen.zhong@mediatek.com>
> > + */
> > +
> > +#ifndef __MFD_MT6392_CORE_H__
> > +#define __MFD_MT6392_CORE_H__
> > +
> > +enum MT6392_IRQ_numbers {
> > +     MT6392_IRQ_SPKL_AB =3D 0,
> > +     MT6392_IRQ_SPKL,
> > +     MT6392_IRQ_BAT_L,
> > +     MT6392_IRQ_BAT_H,
> > +     MT6392_IRQ_WATCHDOG,
> > +     MT6392_IRQ_PWRKEY,
> > +     MT6392_IRQ_THR_L,
> > +     MT6392_IRQ_THR_H,
> > +     MT6392_IRQ_VBATON_UNDET,
> > +     MT6392_IRQ_BVALID_DET,
> > +     MT6392_IRQ_CHRDET,
> > +     MT6392_IRQ_OV,
> > +     MT6392_IRQ_LDO =3D 16,
> > +     MT6392_IRQ_FCHRKEY,
> > +     MT6392_IRQ_RELEASE_PWRKEY,
> > +     MT6392_IRQ_RELEASE_FCHRKEY,
> > +     MT6392_IRQ_RTC,
> > +     MT6392_IRQ_VPROC,
> > +     MT6392_IRQ_VSYS,
> > +     MT6392_IRQ_VCORE,
> > +     MT6392_IRQ_TYPE_C_CC,
> > +     MT6392_IRQ_TYPEC_H_MAX,
> > +     MT6392_IRQ_TYPEC_H_MIN,
> > +     MT6392_IRQ_TYPEC_L_MAX,
> > +     MT6392_IRQ_TYPEC_L_MIN,
> > +     MT6392_IRQ_THR_MAX,
> > +     MT6392_IRQ_THR_MIN,
> > +     MT6392_IRQ_NAG_C_DLTV,
> > +     MT6392_IRQ_NR,
> > +};
> > +
> > +#endif /* __MFD_MT6392_CORE_H__ */
> > diff --git a/include/linux/mfd/mt6392/registers.h b/include/linux/mfd/m=
t6392/registers.h
> > new file mode 100644
> > index 000000000000..8858b58e3b67
> > --- /dev/null
> > +++ b/include/linux/mfd/mt6392/registers.h
> > @@ -0,0 +1,487 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
>
> This is out of date.
>
> > + * Author: Chen Zhong <chen.zhong@mediatek.com>
> > + */
> > +
> > +#ifndef __MFD_MT6392_REGISTERS_H__
> > +#define __MFD_MT6392_REGISTERS_H__
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
