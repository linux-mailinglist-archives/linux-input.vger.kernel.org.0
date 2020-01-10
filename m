Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB2113685A
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 08:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgAJHhA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 02:37:00 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40995 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgAJHhA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 02:37:00 -0500
Received: by mail-pl1-f195.google.com with SMTP id bd4so519238plb.8;
        Thu, 09 Jan 2020 23:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yTj4OJccQHZ2BrF4urivSeZlUB6G0DA2jB2WOE566iw=;
        b=U9S1u6MURdSbih/awgcGfOrKcqm8Vkw7+33OoYTsoFVsWAOcNOyxVoIwr5xxwkDjfg
         GgNxv/WnxbAdFR1H68bnX2vI2cla0dT6WbZJb02XejnWHpKcOSOZRJ6OEau3nz4Fiz2+
         QTj/EpWng6qg/kdSWBMWoO3WUnb4/0a93XE0phpqok+ZuZDsw75BTlsjGbRE8D0X8get
         oC8r2haOMhnRRNIKOzbgGVehuNzhnpTDQlYXxwgez08WJNAQMhw7WgIe9L0TKOcYDdnN
         UfJn1M1CneOkhninJNPdVb40dtFJu1a7G5A51AUfaWE784PDwnPkIQQgpiFKFUxJOR43
         sIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yTj4OJccQHZ2BrF4urivSeZlUB6G0DA2jB2WOE566iw=;
        b=LA1+lR7AVCJ4iKW27+miDC3veDo7Ozq3Kk+2mIGkvKlrqngvBHdWnnX20saxLS14tr
         1005I/mnRGU7TNXVLfvo1MV9sMkjoDr5AHZaVqbGPL44HYTBMdQs6HUhcZl1Ctk85c22
         +vbC178kSp7tUt8i7GAQosBNUI1aSBpCBbNEzKJa2zYNfhBqmojf7dIUR9pI3k8x7XJM
         2VSPnM3X3fcN1ap4OIRuCHrRxobc/DLIT4EcI/HQazTaiXyRMpKuq9W3Z2rbJwb663cQ
         lEK0FMOJGeZBIVK66CEuuqmxfoKANla0hQxtxNuFQgV8JaGjodS6rL1Sn0+xOd8VCUvU
         iK7g==
X-Gm-Message-State: APjAAAUqK1NsddZvNkmf3t+ljD3jkK9ix6fzWY9JviV9rEVzsRTIvJWt
        fejlzlgAZRSovS9TABJjeypfghArSNoZJ5k1zEU=
X-Google-Smtp-Source: APXvYqzPmV7BK59xh7j+/AotZwJxnKvCKvDFyUX9AG5hXPOx5Bk8qmVEtPzgimgz8T9tDl1dzgD1mOB1nffV/fd5Xgo=
X-Received: by 2002:a17:902:8d96:: with SMTP id v22mr2634726plo.262.1578641819147;
 Thu, 09 Jan 2020 23:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-3-fengping.yu@mediatek.com> <20200110013230.GS8314@dtor-ws>
In-Reply-To: <20200110013230.GS8314@dtor-ws>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Jan 2020 09:35:30 +0200
Message-ID: <CAHp75VcELo3f5VYqGbgjgBzOZOj360+EPmRF5Oh3VqBAF8TeHw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drivers: input: keyboard
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     fengping yu <fengping.yu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <mripard@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stefan Agner <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input <linux-input@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        wsd_upstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 10, 2020 at 3:34 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Wed, Jan 08, 2020 at 02:29:23PM +0800, fengping yu wrote:
> > From: "fengping.yu" <fengping.yu@mediatek.com>

...

> > +static void kpd_get_keymap_state(void __iomem *kp_base, u16 state[])
> > +{
> > +     state[0] = readw(kp_base + KP_MEM1);
> > +     state[1] = readw(kp_base + KP_MEM2);
> > +     state[2] = readw(kp_base + KP_MEM3);
> > +     state[3] = readw(kp_base + KP_MEM4);
> > +     state[4] = readw(kp_base + KP_MEM5);
>
> Please use memcpy_formio() here.

Actually it's not an equivalent and may have side effects.
I already told somewhere that we lack of
mem*_*io{32,16,8}() implementation.

-- 
With Best Regards,
Andy Shevchenko
