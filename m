Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E6125ED7E
	for <lists+linux-input@lfdr.de>; Sun,  6 Sep 2020 11:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgIFJWa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Sep 2020 05:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgIFJW3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Sep 2020 05:22:29 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E2AC061573;
        Sun,  6 Sep 2020 02:22:26 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id a8so3120728plm.2;
        Sun, 06 Sep 2020 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2vkgR5dUUAZhFpQFp7rxz8yLYngUnHbdC4QEfSe7qDo=;
        b=rEcG5nEzpysALM3uG6dVN6kct7/Q9MWJt0kd8zTfLXU+W/MC/RGvHepA/TKoeQGrIJ
         GByz7HwxuVgOHKWcCpZRX7fZIv65POTu8fXl1htfI6eo3gXePZ54p/mRPIaqps/hxTYv
         2RFHObeHh0NmeiZHerDUsG7FOL7B7bl0ja27+EnX7s0AYoenjuocuL6vYOOzfVPVr3PC
         GWhgYwxYVFyG/Gysgl2Gwp7FxXyGGuGkvoVUblE/ijl7Dj+ulA+JGiVYhu0q12J35aL/
         tZN1AXociNgP2jKNSWaerjSkDFHYQ9TdiN9hUTBAu9YL3GWnxfhVuVBbB0Sf4Pi0XX17
         06Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vkgR5dUUAZhFpQFp7rxz8yLYngUnHbdC4QEfSe7qDo=;
        b=nObdgeb+awHJg22Ql5CqRKZdnAFO218cK5alQiMWKBko2Mkl0qo/u4RFzeachyWXRF
         do/wOUml4VdqtTiR+up1HMNzKBhH5H+4yR9viWD+2MZmWnffEFz/zNWETpGxk8fzhLEl
         gxMmqXMPwm+t0vnuj/JzyLSNzqGWWWasmESx9Y2VX+JuyTUkynNEpcvIYyfzi+PMQTB0
         /ZqjZLs7/15Rcwj28spIyBDNabFofz0+2IEm8pftPZbMHU+QbdX1FbkZ8HDMww45gYT4
         QXZsal+DgJX5K/J8hpyVzK//6tXJWRWBvhrMFBdOnpjg3pS10jIFI+77XGLgA2Knm2fy
         8Etg==
X-Gm-Message-State: AOAM531S1zeYJWL4p2urNQOjxebWwXRGYW24IggLtvJ9T8+2/iMyP1HC
        ID8AQrMbyJB56lsPZveUOyDo7Ch1KDESEscvoXA=
X-Google-Smtp-Source: ABdhPJxCuYyktptzh0ODw4/TZzFlYBqNM9DOeE902E3MNTK6i4pe5z89kye7j6hvyGcRUnuu0d6O3sddEgAf9YuBxdY=
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr15420981plr.226.1599384145747;
 Sun, 06 Sep 2020 02:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200905163403.64390-1-contact@artur-rojek.eu> <20200905163403.64390-2-contact@artur-rojek.eu>
In-Reply-To: <20200905163403.64390-2-contact@artur-rojek.eu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 6 Sep 2020 12:22:09 +0300
Message-ID: <CAHp75VfixOwpVSXoG1MqaZR2nmgEKumyKW8etLsRj1g=YjgiKw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] input: joystick: Add ADC attached joystick driver.
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 5, 2020 at 7:34 PM Artur Rojek <contact@artur-rojek.eu> wrote:
>
> Add a driver for joystick devices connected to ADC controllers
> supporting the Industrial I/O subsystem.

...

> +static int adc_joystick_handle(const void *data, void *private)
> +{
> +       struct adc_joystick *joy = private;
> +       enum iio_endian endianness;
> +       int bytes, msb, val, idx, i;
> +       bool sign;
> +
> +       bytes = joy->chans[0].channel->scan_type.storagebits >> 3;
> +
> +       for (i = 0; i < joy->num_chans; ++i) {
> +               idx = joy->chans[i].channel->scan_index;
> +               endianness = joy->chans[i].channel->scan_type.endianness;
> +               msb = joy->chans[i].channel->scan_type.realbits - 1;

> +               sign = (tolower(joy->chans[i].channel->scan_type.sign) == 's');

Redundant parentheses.

> +               switch (bytes) {
> +               case 1:
> +                       val = ((const u8 *)data)[idx];
> +                       break;
> +               case 2:

> +                       if (endianness == IIO_BE)
> +                               val = be16_to_cpu(((const __be16 *)data)[idx]);
> +                       else if (endianness == IIO_LE)
> +                               val = le16_to_cpu(((const __le16 *)data)[idx]);
> +                       else /* IIO_CPU */
> +                               val = ((const u16 *)data)[idx];
> +                       break;

Hmm... I don't like explicit castings to restricted types. On top of
that is it guaranteed that pointer to data will be aligned?
As a solution for the first two I would recommend to use
get_unaligned_be16() / get_unaligned_le16().
The last one is an interesting case and if data can be unaligned needs
to be fixed.

> +               default:
> +                       return -EINVAL;
> +               }
> +
> +               val >>= joy->chans[i].channel->scan_type.shift;
> +               if (sign)
> +                       val = sign_extend32(val, msb);
> +               else

> +                       val &= GENMASK(msb, 0);

It includes msb. Is it expected?

> +               input_report_abs(joy->input, joy->axes[i].code, val);
> +       }
> +
> +       input_sync(joy->input);
> +
> +       return 0;
> +}

...

> +static int adc_joystick_open(struct input_dev *dev)

> +static void adc_joystick_close(struct input_dev *dev)

Just wondering if this is protected against object lifetime cases.

...

> +err:

err_fwnode_put: ?

> +       fwnode_handle_put(child);
> +       return ret;

...

> +       /* Count how many channels we got. NULL terminated. */
> +       for (i = 0; joy->chans[i].indio_dev; ++i) {
> +               bits = joy->chans[i].channel->scan_type.storagebits;
> +               if (!bits || (bits > 16)) {
> +                       dev_err(dev, "Unsupported channel storage size\n");

> +                       return -EINVAL;

-ERANGE?

> +               }
> +               if (bits != joy->chans[0].channel->scan_type.storagebits) {
> +                       dev_err(dev, "Channels must have equal storage size\n");
> +                       return -EINVAL;
> +               }
> +       }

-- 
With Best Regards,
Andy Shevchenko
