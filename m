Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492C6243828
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 12:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgHMKAk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Aug 2020 06:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgHMKAk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Aug 2020 06:00:40 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48665C061757;
        Thu, 13 Aug 2020 03:00:40 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 2so2543687pjx.5;
        Thu, 13 Aug 2020 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lr+XPSui9MVitN/YHK0a7wRgaRs8jhxh1g6LAoEgFFI=;
        b=mgQJdDhFJsY+4ZZX7nEd7PUwFxnI/GND9MTZddYsJCzitgcZ8MJKOwXL8SWS8NZDjY
         R3WQ0U7ZX6RWtqId3eSKxzrexiVUkm2RMXbUo5ZS1MN3yIse3C5RWZVhXDKYtP/GuldE
         mgF1hswi5xwPoWYi3izh0o7+NrQ5IYVWkka5O99Ga5km9xVUt8hYGWD0FOWJj10lyO0b
         8B1ajYPiFpCYyMoGEfYJOVJdE8b9GuCrYYoF6wwfPEJq+HWjmJLHJGB7GhGKLpDXgCtg
         cdp0MyDny9Xmw6tbbDHfgqlm6hkES9WGQrf1WUbgF4aHv7BGVPCOlR7iJy1eubUGuXiv
         tFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lr+XPSui9MVitN/YHK0a7wRgaRs8jhxh1g6LAoEgFFI=;
        b=GDjo2O1wdhWqYcaZvuVzIuHGKODOOGhWimoklPRQOXXNReBJjSwiDuvg1WO0ARkmp/
         VvJ6+ZUAkaHLavrYVnlmbyafrhdp3g9vWHy74KZwfjGPLNVti54oQJXXVL0ZC+sSl3bU
         +5sQKG1IqfBblAVLedikSnvu36oPbFsGPDVbGaTWx1K8vH/anv6F6/8DC6u39a1zzSqC
         c96zWOTZ/FD53H31DeDf4elNdmT9/8GDOfuS6JVFQBaqkIuqcK5pGNbnO3cvBU/agq+m
         BcucrvB7hC/OBRg1yVraZMM6kFigHPHLMq10dcMiDBFto9AuYkuADEhH6HYOD6JjNBDy
         lAHQ==
X-Gm-Message-State: AOAM531guplY+wkgjDHeGbw4p/96/5cv773OZ6et45RdIR8qOzazcLDo
        89vMdHtUJdM4LTaZos8tQ4BLHUrPOLzZNxgcmA+HwaKO1Kw=
X-Google-Smtp-Source: ABdhPJz38GeLmThoezC6lraEWn1MkImxxv3Tn3zbkSqQi3x5qtMSX50ThTooPvM8JHxj3dDmc1o23Vd8TYq7Iec2SNE=
X-Received: by 2002:a17:902:d3cb:: with SMTP id w11mr3178004plb.255.1597312839745;
 Thu, 13 Aug 2020 03:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200810065128.3324-3-fengping.yu@mediatek.com> <20200813005509.GU1665100@dtor-ws>
In-Reply-To: <20200813005509.GU1665100@dtor-ws>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 13 Aug 2020 13:00:24 +0300
Message-ID: <CAHp75VfKckoK4facC3nMDLLUYUtd5Y66+E5xgkVpVYfyTTa9Hg@mail.gmail.com>
Subject: Re: [PATCH v17 2/3] drivers: input: keyboard: Add mtk keypad driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 13, 2020 at 3:57 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Aug 10, 2020 at 02:51:28PM +0800, Fengping Yu wrote:
> > From: "fengping.yu" <fengping.yu@mediatek.com>
> >
> > This patch adds matrix keypad support for Mediatek SoCs.

...

> > +static irqreturn_t kpd_irq_handler(int irq, void *dev_id)
> > +{
> > +     struct mtk_keypad *keypad = dev_id;
> > +     unsigned short *keycode = keypad->input_dev->keycode;
> > +     DECLARE_BITMAP(new_state, MTK_KPD_NUM_BITS);
> > +     DECLARE_BITMAP(change, MTK_KPD_NUM_BITS);
> > +     int bit_nr;
> > +     int pressed;
> > +     unsigned short code;
> > +
> > +     regmap_bulk_read(keypad->regmap, MTK_KPD_MEM,
> > +                     new_state, MTK_KPD_NUM_MEMS);
> > +
> > +     bitmap_xor(change, new_state, keypad->keymap_state, MTK_KPD_NUM_BITS);
> > +
> > +     for_each_set_bit(bit_nr, change, MTK_KPD_NUM_BITS) {
>
> Should we be explicit:
>
>                 if (bit_nr % 32 >= 16) // or "if ((bit_nr / 16) % 2)"
>                         continue;
>
> so that we sure we do not trip over garbage (if any) in the unused
> bits?

Shouldn't we rather rely on the fact that bitmap API explicitly takes
a bit number as an argument. What garbage are you thinking of?
If you are talking about gaps, then probably existing
for_each_set_clump8() or free size analogue (not yet in upstream,
though) should be used instead?

> > +             /* 1: not pressed, 0: pressed */
> > +             pressed = !test_bit(bit_nr, new_state);
> > +             dev_dbg(&keypad->input_dev->dev, "%s",
> > +                     pressed ? "pressed" : "released");
> > +
> > +             /* 32bit register only use low 16bit as keypad mem register */
> > +             code = keycode[bit_nr - 16 * (BITS_TO_U32(bit_nr) - 1)];
>
> This will give index of 16 for (0,0).

I was also puzzled by this in one of the review rounds, but I don't
remember what was the explanation.

> Is this what we want? Hmm, this is
> all weird... I think we need:
>
>                 row = bit_nr / 32;
>                 col = bit_nr % 32;
>                 if (col > 15)
>                         continue;
>
>                 // set row_shift in probe() as:
>                 // keypad_data->row_shift =
>                 //              get_count_order(keypad_data->n_cols);
>                 code = keycode[MATRIX_SCAN_CODE(row, col,
>                                                 keypad_data->row_shift)];
>
> This will properly unpack the keymap built by
> matrix_keypad_build_keymap().
>
> > +
> > +             input_report_key(keypad->input_dev, code, pressed);
> > +             input_sync(keypad->input_dev);
> > +
> > +             dev_dbg(&keypad->input_dev->dev,
> > +                     "report Linux keycode = %d\n", code);
> > +     }
> > +
> > +     bitmap_copy(keypad->keymap_state, new_state, MTK_KPD_NUM_BITS);
> > +
> > +     return IRQ_HANDLED;
> > +}

-- 
With Best Regards,
Andy Shevchenko
