Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F225F4963DF
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 18:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351702AbiAURZ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 12:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351592AbiAURZ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 12:25:56 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB581C06173B
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 09:25:55 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id x11so3352050plg.6
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 09:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=rQRGUzFdk5KQVDxHhjF4bDkVY8uo3Z8PPez9HQS1qt4=;
        b=JfTe1vL3qwLVRLYohG9ByLUv0ZXZF1W2ev2e20Unggb1yrlgvqGVEFZWiP12rc0jU+
         0Au1izuae2t8IBgjVSiEiKcTrkoIrVp4Y+UX49t4HZAk5YB8WXMEMpd4HzpySrO75moN
         sldzzrq1VfZjE6uq2mmXLuZrtJ0uEjWXU7qEg4QoR/rm4LaD7uDGGV48ucjHNnOb4SP7
         kk5dLOXr1MV+eHTGXWy/Y/pW40SGBNBjYvTrDJ5WdvwokgZjwbvuNWkCOqSH96ayAwxO
         YqTsx+RfoaCLYjNjVmcNK1x33q8HFxTEzhen/pEd5W+LdY9f+kWvFUERnZSROJpzPb8o
         36VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=rQRGUzFdk5KQVDxHhjF4bDkVY8uo3Z8PPez9HQS1qt4=;
        b=oGLFHWeSJWL+40WpkKnaXwVE5ODVsvlnGYJyazIN9kgFjgEFKJ3hx/gxCj+2rWPrxW
         M0lhD2WtfrFVzdnDZRSOXX8o5N/y9dYv+OQWmPI/aIK2Mr4nax+U076bNxaFwk50ldBI
         sUV1Vbfs/1QLyLYbNFVZNoYm0aAS9ou1b3y5CHnTYfyw94k0Z4EJv04JiHAUmQWNcu42
         qK+M1btsc+reUs/fJChE7wc3n/+ajTFWDyLjP+XJyuelSCF2zGJVvw1BcZf3eK83Pqmb
         3G+xvuytMl+VZ5XowokBP2GZGcZ1POvB6umt+9IokZa6hGfDQoy7HGrASE4OGAtAvFeE
         6oKg==
X-Gm-Message-State: AOAM532GXM9ArigbXCIqwnK2vyvlMBwoltd98lBRPW79QLfZzLJz3kVC
        Sy3k0wZlDezm+kI2omCNn+WYG6h15v9HkMogVwsFPkIKscWjtg==
X-Google-Smtp-Source: ABdhPJwWJxcoewgAEKOVMieQ4A1mbKtfIo2HtHS9LXH6jvaTysfkZxeCzXFjjMXatCQGxUGzCkXUJr7eC0WwV9b40hw=
X-Received: by 2002:a17:902:7d86:b0:14a:baa0:acf9 with SMTP id
 a6-20020a1709027d8600b0014abaa0acf9mr4601029plm.63.1642785954846; Fri, 21 Jan
 2022 09:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20211216233557.9393-1-tharvey@gateworks.com>
In-Reply-To: <20211216233557.9393-1-tharvey@gateworks.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 21 Jan 2022 09:25:42 -0800
Message-ID: <CAJ+vNU1RFLf4oeA07H8vc-gYNgO1WB7KsA0KbfdBi_V5J6OMuQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] input: add DFROBOT touchscreen controller
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 16, 2021 at 3:36 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> The DFROBOT DFR0678 [1] and DFR0550 [2] touchscreen displays are meant
> to be compatible with the official RaspberryPi 7in display. However
> instead of directly conntecting the FT5x06 touch controller to the I2C
> bus going to the host processor they route it through an MCU and emulate
> a virtual FT5x06 controller but don't do a very good job at it. The
> method the RaspberryPi firmware used to read the touch data is supported
> (which consists of reading R2 to get the number of touch points, then
> reading 4 bytes of data for each point in discrete I2C transactions. If
> you try to use the FT5x06 driver which reads all registers starting at
> R0 at once you will get invalid point data.
>
> This controller lacks an interrupt and does not send UP events so
> polling mode is used and event ID tracking is used to emulate UP events.
>
> This series adds dt bindings and a standalone driver for this touch
> controller as opposed to an RFC series I sent out that attempts to add
> support to the existing edt-ft5x06 driver.
>
> Tim
> [1] - https://www.dfrobot.com/product-2193.html
> [2] - https://www.dfrobot.com/product-1784.html
>
> Tim Harvey (3):
>   dt-bindings: Add vendor prefix for DFRobot
>   dt-bindings: touchscreen: Add dfr0550 bindings
>   input: touchscreen: add dfr0550 support
>
>  .../bindings/input/touchscreen/dfr0550.yaml   |  53 +++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   5 +
>  drivers/input/touchscreen/Kconfig             |  12 +
>  drivers/input/touchscreen/Makefile            |   1 +
>  drivers/input/touchscreen/dfr0550.c           | 208 ++++++++++++++++++
>  6 files changed, 281 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/dfr0550.yaml
>  create mode 100644 drivers/input/touchscreen/dfr0550.c
>

Any feedback on this?

The other approach I posted an RFC series for was to add support to
the existing edt-ft5x06 driver [1].

Best regards,

Tim
[1] https://patchwork.kernel.org/project/linux-input/list/?series=596977
