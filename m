Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E582F40C2
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 01:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393651AbhAMAnG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 19:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392049AbhALX4U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 18:56:20 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1638C061575
        for <linux-input@vger.kernel.org>; Tue, 12 Jan 2021 15:55:39 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id y4so469439ybn.3
        for <linux-input@vger.kernel.org>; Tue, 12 Jan 2021 15:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JVS5gta/W5fKENcKMVtSED2Xmo0P+djwZKSnAxC5LLw=;
        b=TTztE3sDUeLh5WEJC9RSYJ3JJP2AZ4SmKSVyaKKsG1l6YRRhOwenfSBR5gK2ccQf39
         1J1hdW7e85EaRv1MAKm8frV9ic+n9TdJOxHqfrkTjzmmbJCajOw31jc/8rWGJgwA5M/P
         oCUwgEaL/Gdllspkc76F3GGIVOzBPXIs9XXRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVS5gta/W5fKENcKMVtSED2Xmo0P+djwZKSnAxC5LLw=;
        b=Gs5KKU5AiSgyKiG0qksxgyGtjf3u8h1+NMQhELSOtRGD1nORM1SFctRgSEnnxIKdkA
         kEjQbY7oeCuZVBvPmYO1CKvC/05citPv9oJEgzGeq5+ScL1iwzgxJelJ5QCj3ovQHPZh
         f4bqxM3sVPcMPx5Nl9V4IxYsSu9tj3t2zUUwnUkr7NW8K7ZfWMYDCGWezgAQMc2VVSE4
         1qoaziRNC96zLp/JQn1/TTBvVp4+HESSkaVgSfdln6DABpvQEc6kWpoFI75Tk0nrjGWZ
         q/0rTH3W4hFVy4Jouvd8i9VsPTFgQOOnNR2qU7liD5Vhdc8nDZs0wPZchQHjOuhHmP1/
         v3yg==
X-Gm-Message-State: AOAM5325UBmWMK6RuhXBT02DP0woGpSnC0a8hn2Ea2xNAox63zmxmZII
        NRb73CU0zC/fhI2QnFGCzK5Fp48A29K1zAo5ZPEn+Q==
X-Google-Smtp-Source: ABdhPJwnnOZbBZWkjzImc2GwItpOeZbkk5ZIgsHeBXyOCLzlNkqRdx60gxPzKjI0RO1KM8JkgoKG+MPmzzPaE8G3BYs=
X-Received: by 2002:a25:1104:: with SMTP id 4mr2721504ybr.476.1610495739211;
 Tue, 12 Jan 2021 15:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <20210107154200.v4.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid> <161041827643.3661239.17919996906733477213@swboyd.mtv.corp.google.com>
In-Reply-To: <161041827643.3661239.17919996906733477213@swboyd.mtv.corp.google.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Tue, 12 Jan 2021 15:55:28 -0800
Message-ID: <CA+cxXhm45emyg-9j99U=UWY8QuhzWifh+VvsFBaTOTWs81tvUQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Input: cros-ec-keyb - Expose function row physical
 map to userspace
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 11, 2021 at 6:24 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-01-07 15:42:09)
> > The top-row keys in a keyboard usually have dual functionalities.
> > E.g. A function key "F1" is also an action key "Browser back".
> >
> > Therefore, when an application receives an action key code from
> > a top-row key press, the application needs to know how to correlate
> > the action key code with the function key code and do the conversion
> > whenever necessary.
> >
> > Since the userpace already knows the key scanlines (row/column)
> > associated with a received key code. Essentially, the userspace only
> > needs a mapping between the key row/column and the matching physical
> > location in the top row.
> >
> > This patch enhances the cros-ec-keyb driver to create such a mapping
> > and expose it to userspace in the form of a function-row-physmap
> > attribute. The attribute would be a space separated ordered list of
> > row/column codes, for the keys in the function row, in a left-to-right
> > order.
> >
> > The attribute will only be present when the device has a custom design
> > for the top-row keys.
>
> Is it documented in Documentation/ABI/?
Not yet.
Is it proper to add the documentation to `testing/sysfs-driver-input-keyboard`?
>
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > ---
> >
> > Changes in v4:
> > - replace sysfs_create_group() with devm_device_add_group()
> > - remove an unused member in struct cros_ec_keyb
> >
> > Changes in v3:
> > - parse `function-row-physmap` from DT earlier, when we probe
> >   cros_ec_keyb, and then store the extracted info in struct cros_ec_keyb.
> >
> > Changes in v2:
> > - create function-row-physmap file in sysfs by parsing
> >   `function-row-physmap` property from DT
> > - assume the device already has a correct keymap to reflect the custom
> >   top-row keys (if they exist)
> >
> >  drivers/input/keyboard/cros_ec_keyb.c | 78 +++++++++++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >
> > diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> > index b379ed7628781..75d1cb29734ce 100644
> > --- a/drivers/input/keyboard/cros_ec_keyb.c
> > +++ b/drivers/input/keyboard/cros_ec_keyb.c
> > @@ -27,6 +27,8 @@
> >
> >  #include <asm/unaligned.h>
> >
> > +#define MAX_NUM_TOP_ROW_KEYS   15
> > +
>
> Ah, the binding could say max is 15 then.
Yes, I'll add the documentation to PATCH 1/2.
>
> >  /**
> >   * struct cros_ec_keyb - Structure representing EC keyboard device
> >   *
> > @@ -42,6 +44,9 @@
> >   * @idev: The input device for the matrix keys.
> >   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
> >   * @notifier: interrupt event notifier for transport devices
> > + * @function_row_physmap: An array of the encoded rows/columns for the top
> > + *                        row function keys, in an order from left to right
> > + * @num_function_row_keys: The number of top row keys in a custom keyboard
> >   */
> >  struct cros_ec_keyb {
> >         unsigned int rows;
> > @@ -58,6 +63,9 @@ struct cros_ec_keyb {
> >         struct input_dev *idev;
> >         struct input_dev *bs_idev;
> >         struct notifier_block notifier;
> > +
> > +       u16 function_row_physmap[MAX_NUM_TOP_ROW_KEYS];
> > +       u8 num_function_row_keys;
>
> Why not size_t?
I usually try to use the minimal required bytes for variables, even
for local ones.
In this case, we only need one byte for num_function_row_keys.
Are there any reasons why size_t is better?
>
> >  };
> >
> >  /**
> > @@ -527,6 +535,8 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
> >         struct input_dev *idev;
> >         const char *phys;
> >         int err;
> > +       u32 top_row_key_pos[MAX_NUM_TOP_ROW_KEYS] = {0};
> > +       u8 i;
> >
> >         err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
> >         if (err)
> > @@ -578,6 +588,22 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
> >         ckdev->idev = idev;
> >         cros_ec_keyb_compute_valid_keys(ckdev);
> >
> > +       if (of_property_read_variable_u32_array(dev->of_node,
> > +                                               "function-row-physmap",
> > +                                               top_row_key_pos,
> > +                                               0,
> > +                                               MAX_NUM_TOP_ROW_KEYS) > 0) {
> > +               for (i = 0; i < MAX_NUM_TOP_ROW_KEYS; i++) {
>
> Can we deindent this once with of_property_for_each_u32()?
Sure, will do.
>
> > +                       if (!top_row_key_pos[i])
> > +                               break;
> > +                       ckdev->function_row_physmap[i] = MATRIX_SCAN_CODE(
> > +                                               KEY_ROW(top_row_key_pos[i]),
> > +                                               KEY_COL(top_row_key_pos[i]),
>
> And then have a local variable for top_row_key_pos[i] so this is
> shorter.
Sure, will do.
>
> > +                                               ckdev->row_shift);
> > +               }
> > +               ckdev->num_function_row_keys = i;
> > +       }
> > +
> >         err = input_register_device(ckdev->idev);
> >         if (err) {
> >                 dev_err(dev, "cannot register input device\n");
> > @@ -587,6 +613,52 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
> >         return 0;
> >  }
> >
> > +static ssize_t function_row_physmap_show(struct device *dev,
> > +                                        struct device_attribute *attr,
> > +                                        char *buf)
> > +{
> > +       ssize_t size = 0;
> > +       u8 i;
>
> int i? Why u8? Surely the size of a local variable isn't important.
The same reason as "u8 num_function_row_keys".
Is int better in this case?
>
> > +       struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
> > +
> > +       if (!ckdev->num_function_row_keys)
> > +               return 0;
> > +
> > +       for (i = 0; i < ckdev->num_function_row_keys; i++)
> > +               size += scnprintf(buf + size, PAGE_SIZE - size, "%02X ",
> > +                                 ckdev->function_row_physmap[i]);
> > +       size += scnprintf(buf + size, PAGE_SIZE - size, "\n");
> > +
> > +       return size;
>
> I'd rather see
>
>         ssize_t size = 0;
>         int i;
>         struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
>         u16 *physmap = ckdev->function_row_physmap;
>
>         for (i = 0; i < ckdev->num_function_row_keys; i++)
>                 size += scnprintf(buf + size, PAGE_SIZE - size,
>                                   "%s%02X", size ? " " : "", physmap[i]);
>
>         if (size)
>                 size += scnprintf(buf + size, PAGE_SIZE - size, "\n");
>
>         return size;
>
> And I wonder if hex_dump_to_buffer() works for this?
It seems to work? I'll give it a try.
If hex_dump_to_buffer() doesn't work, I'll fall back to the
implementation you suggested above.
Thanks!
