Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0CE32A586
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350776AbhCBMub (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:50:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345001AbhCBJBf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 04:01:35 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDC1C061788
        for <linux-input@vger.kernel.org>; Tue,  2 Mar 2021 01:00:18 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id dx17so6181962ejb.2
        for <linux-input@vger.kernel.org>; Tue, 02 Mar 2021 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OlQhZo66tdfixj0c2XUayC5dC48cYkknFAh4g2s0VB8=;
        b=VVhxRPrsIbUWjeeEIAfPVav1chwuvvW2ogpbLjn/vg1vGxAANoefHJJk8ETghcW2De
         KXXv2FUZAzBm01C5763rsWLGWfldabW7sEwRxOVBkTM0nCNK5OFf0iVmQyzj+AMMwDyl
         ivHp8ULnyNeFH5o010LZ31o2PvxbUekoKg9411FrKaCLYRv3RTaBzeTqPNiQjiDOKzTg
         39Q9rPMbz9L8K5HwSuS0ixqrts6QVmuKTBwmeoWkMMc76kZQTkznuTfqeM6p0sT7/2Mn
         QlnS8dfgA/t4gYFKo/O0ODB6obPSs8UmC2bOdfcOWLLd0c0hpCP5YjLDwkHYNv9y1y3T
         3MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OlQhZo66tdfixj0c2XUayC5dC48cYkknFAh4g2s0VB8=;
        b=mYFU8w3d37XYZ6n+hX9Ui81RaqYZdDUyNmSAC+O3ooNFOtwORRvpT6bWbVKxfJKx1v
         0FjZAU/E42pkmfIK6kGbl2YwAYFfCSfirPiI0zyEKdOOo2OJB5SRYTSUgzHP5F5oMEwI
         Fj2gdSVFoJ6bAiM0Hg90KXGNa0GaZIlkWIkQp2ryiAcDx1XY1hljpjRKJSxFdcvPHsby
         OQHrf6eVOaEWlLXSVveUiXDK88bCnwZTLlT/KRxu8bei6gi+pCOHjNf2ODuxppJzJKp+
         FUyksW4TVyODyIUgsnItyyJwHYFCYPQz9an2zZC8eqg6e44d18De+PpdXOVHurCxHJ/Z
         FJ6A==
X-Gm-Message-State: AOAM530VCaR2P+jPtqVi+7dPvZ1U2SGdwIeWy1VMQRlFVv5BTc6xXrKL
        2jk24woVztV+t+I2OBVHxAOLnfO0FS58LXtFhjpz4w==
X-Google-Smtp-Source: ABdhPJzbcdp9yM+SANcB02A7Piji7QgRmHuVFYC2ehQOoZpWEmfM8Re/BPYo+miajM5iedjeo+7jPk+12Cf5EkxQtgE=
X-Received: by 2002:a17:906:1d44:: with SMTP id o4mr18660019ejh.130.1614675616685;
 Tue, 02 Mar 2021 01:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20210216163647.34264-1-vincent.knecht@mailoo.org> <20210216163647.34264-2-vincent.knecht@mailoo.org>
In-Reply-To: <20210216163647.34264-2-vincent.knecht@mailoo.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 10:00:05 +0100
Message-ID: <CACRpkdaLJzG3_M7fNC-MHOdQ6HMsqHqVccK7XkvL=PvJnycCHQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Input: add MStar MSG2638 touchscreen driver
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vincent,

thanks for your patch!

On Tue, Feb 16, 2021 at 5:38 PM Vincent Knecht
<vincent.knecht@mailoo.org> wrote:

> Add support for the msg2638 touchscreen IC from MStar.
> This driver reuses zinitix.c structure, while the checksum and irq handle=
r
> functions are based on out-of-tree driver for Alcatel Idol 3 (4.7").
>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changed in v5:
> - use gpiod_set_value_cansleep() (Stephan G)
> - use msleep/usleep_range() rathen than mdelay() (Stephan G)

(...)

> +#include <linux/delay.h>
> +#include <linux/gpio.h>

Please only include
#include <linux/gpio/consumer.h>

> +#define CHIP_ON_DELAY                  15 // ms
> +#define FIRMWARE_ON_DELAY              50 // ms
> +#define RESET_DELAY_MIN                        10000 // =C2=B5s
> +#define RESET_DELAY_MAX                        11000 // =C2=B5s

Rename the defines with _MS and _US suffixes so you don't
need the comments, CHIP_ON_DELAY_MS etc.

> +static int msg2638_init_regulators(struct msg2638_ts_data *msg2638)
> +{
> +       struct i2c_client *client =3D msg2638->client;
> +       int error;

I usually prefer a short name like "err" (cognitive load) but your choice.

> +static u8 msg2638_checksum(u8 *data, u32 length)
> +{
> +       s32 sum =3D 0;
> +       u32 i;
> +
> +       for (i =3D 0; i < length; i++)
> +               sum +=3D data[i];
> +
> +       return (u8)((-sum) & 0xFF);
> +}

Interesting checksum algoritm.

> +static int msg2638_start(struct msg2638_ts_data *msg2638)
> +{
> +       int error;
> +
> +       error =3D regulator_bulk_enable(ARRAY_SIZE(msg2638->supplies),
> +                                     msg2638->supplies);
> +       if (error) {
> +               dev_err(&msg2638->client->dev, "Failed to enable regulato=
rs: %d\n", error);
> +               return error;
> +       }
> +
> +       msleep(CHIP_ON_DELAY);
> +
> +       msg2638_power_on(msg2638);

Maybe move enable_irq() here from power on to mirror
the stop() function below?

> +#ifdef CONFIG_OF
> +static const struct of_device_id msg2638_of_match[] =3D {
> +       { .compatible =3D "mstar,msg2638" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, msg2638_of_match);
> +#endif

I think these #ifdefs are not needed anymore. We just have struct of_device=
_id
available at all times.

Yours,
Linus Walleij
