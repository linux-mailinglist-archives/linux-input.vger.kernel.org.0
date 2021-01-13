Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F4B2F4BF4
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 14:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbhAMNEs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 08:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAMNEs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 08:04:48 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAA7C061786;
        Wed, 13 Jan 2021 05:04:08 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id h18so1048709vsg.8;
        Wed, 13 Jan 2021 05:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D8lh1l6ZLQaTdOGk6daqASYfqhv/iz1lSmX/JechmhY=;
        b=uPzOhwF2vqlNK184Al+jGmiwNMBMZJKSwCTqX2FydGcIlv4Qc6FupcXoz058JWTfaS
         il28OO3LTFnM3dGLEfDV7VPOq4OT7AcTVQAvMur6w53JKQaccDjE61X1AHjq3V7Az1+H
         4c3eraOST0UKez3/JeXcK3Xj1RjnynYznFsK+lHsNkMhily5i8XTgJmlWkEAfuUh/NgX
         nkjkjbi5qQ+3ux4uWt42NUA/1zRYi6sYnBUac+4zR3Wk6XQgTz+z/EDULs3+n5To9tS9
         PpfHD/hZY3c3T325BHOqNeYNm4Z+ptt54YNh2x+Jbh+gh0hEQScIJbhBVLwAcvHMpYRq
         IwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D8lh1l6ZLQaTdOGk6daqASYfqhv/iz1lSmX/JechmhY=;
        b=OnZgqltD/NlRpc3RbpcKiBGZ7rPHiMKzNjfKuXQnOfzpD7H/ON5VgweAZXWqa1DzLn
         uFYEhD5uL88yqllKfzipD58+j1kpaE+InmoG5L3X3JoyhwdZDbTY3b44FGa/bUfAUmmp
         kOxnxEzZmvQcweiah8voC7NNRohw5sUbBSofq4ITcABihmp54KygWofZepgEdTmwxOkv
         B7V6qKKxDtwbzoBx7GOpX+s6/bvX7muAEcjiS+gWpu3tQQtN0GM9YL8zSGKvYHT8Ld9Q
         LdCIpS/yWhEEAkQoKBz+6IwBlBXZnKeNSJxa+ADk+IMUX0ch8zZKvfsDvUEpCeZltf4/
         hxbg==
X-Gm-Message-State: AOAM532woUj7v2PfMOGBfCN+2TMNqZY7wPhqmTNqXalEP+ZJeIVZ4a3E
        jvLhRfkfltovDzFm4tZIiFLgfPlMLs8dOCAVREDPWP4a
X-Google-Smtp-Source: ABdhPJxH4pUKl3HjC4qDdhMbscxyVzUV6v+3zgFfTI+63OdVYs19Au57LoQPJO5Nog4B3Hsls09YfBfGPNcqvypURvA=
X-Received: by 2002:a05:6102:93:: with SMTP id t19mr1610961vsp.57.1610543047338;
 Wed, 13 Jan 2021 05:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20201028221302.66583-1-kholk11@gmail.com> <20201028221302.66583-3-kholk11@gmail.com>
 <X83PDBKOq9bwSI0N@google.com>
In-Reply-To: <X83PDBKOq9bwSI0N@google.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Wed, 13 Jan 2021 14:03:56 +0100
Message-ID: <CAK7fi1Y62YhoQvsU++_u=Z5Y3d6KC1_C4bWr6R8QZmDgyVV86g@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] Input: Add Novatek NT36xxx touchscreen driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>, martin.botka1@gmail.com,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Il giorno lun 7 dic 2020 alle ore 07:43 Dmitry Torokhov
<dmitry.torokhov@gmail.com> ha scritto:
>
> Hi AngeloGioacchino,
>
> On Wed, Oct 28, 2020 at 11:13:01PM +0100, kholk11@gmail.com wrote:
> > +/**
> > + * nt36xxx_set_page - Set page number for read/write
> > + * @ts: Main driver structure
> > + *
> > + * Return: Always zero for success, negative number for error
> > + */
> > +static int nt36xxx_set_page(struct nt36xxx_i2c *ts, u32 pageaddr)
> > +{
> > +     u32 data = cpu_to_be32(pageaddr) >> 8;
> > +     int ret;
> > +
> > +     ret = regmap_noinc_write(ts->fw_regmap, NT36XXX_CMD_SET_PAGE,
> > +                              &data, sizeof(data));
> > +     if (ret)
> > +             return ret;
> > +
> > +     usleep_range(100, 200);
> > +     return ret;
> > +}
>
> Regmap is supposed to handle paged access for you as long as you set it
> up for paged access. Why do you need custom page handling here?
>
> Thanks.
>
> --
> Dmitry

Regmap's page handling is using regmap_update_bits, hence calling a
regmap_read for each page switch and this is not always possible on
this MCU: especially, but not only, in the CRC reboot case, calling
a regmap_read before the page-switch will result in invalid data.

Hacking through the invalid data, we would still be able to set the
page at this point, but then in the reset-idle sequence handling the
CRC failure, we are setting page again: keeping in mind that this is
a i2c connected MCU, calling a regmap_read while sending the "special"
reset sequence is not in the likes of this MCU SW design, as it is
expecting a specific, precise command sequence.

If that happens, the MCU won't recognize the CRC reset-idle sequence
and will never recover from the error.

This can surely be solved by setting up a FLAT regcache and resetting
the register cache in (many) strategic places but, in my opinion,
that's going to be seriously messy, as I would have to do that in
basically every place - but the CRC reboot loop function, so we'd have
a register cache for *only* one special case in one function (which is
not even supposed to be ever called during regular functionality,
unless the MCU firmware panics somehow).

There is also another reason why I dislike using the paged access that
comes from the regmap API here: as you see, the event buffer address
is different for some ICs (probably for MCU FW differences) and this
would require me to dynamically set the regmap_range_cfg structure in
the probe function, then casting it to a const and setting it into the
regmap_config before registering regmap (which, by the way, is another
const struct).

Ah, also, as you can see the set_page function is doing:
        u32 data = cpu_to_be32(pageaddr) >> 8;
clearly, using the regmap page switching, I would have to change the
pages definitions *and* the nt36xxx_mem_map at least partially (because
"win_page << range->selector_shift"), and all of these definitions,
right now, are representing the same addresses that are referenced into
the MCU firmware, other than being basically 1:1 with what the downstream
driver provides.
Changing them around would not only, in some way, "hide" precious infos
on a series of MCUs that are not publicly documented, but would also make
the eventual porting of new ICs/MCUs that would be compatible with this
driver harder for who knows what's going on and *way harder* for other
"casual" developers.

So, for the aforementioned reasons, all summed together, I chose to not
use the regmap paged access.

Yours,
-- Angelo
