Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF0E4F676F
	for <lists+linux-input@lfdr.de>; Wed,  6 Apr 2022 19:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239052AbiDFRjm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Apr 2022 13:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239370AbiDFRj2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Apr 2022 13:39:28 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74689101C9
        for <linux-input@vger.kernel.org>; Wed,  6 Apr 2022 08:48:22 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id kd21so2531156qvb.6
        for <linux-input@vger.kernel.org>; Wed, 06 Apr 2022 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zGdgUK4jNHwqfdRCFRkwVREFJalXJYUylajhPK5QZ6w=;
        b=E/kYbe9uEI4bxo8Z1C07w6IovZN3EzABGF7iGKsC2dSZwCjjWLDcaijASGjQo8BqkP
         v0gDuVjSdL2BZX8kRWlOzr8T4vxI+hTNhts2OuQjg8iXddqxdNljw0ph2r6KgDlE3tro
         96fXQaEeNh3KKKC8zrDa776oplF14tUnfoqTdnH4EW5GfZIqfYURzDFcP8Or4NntoC9Y
         E/ICQOkH/DzNP6mNdf9vcnvONtclAaGsau75zqZFZb8TMfZA2hEY6i1+MDogjs60GUQB
         5zFrWGnvco4UcDjGCHZwFmc3S91118Dp3UGQNFZgUdnAJgFCJ4O/sWeD/GamzXVsgsUS
         6l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zGdgUK4jNHwqfdRCFRkwVREFJalXJYUylajhPK5QZ6w=;
        b=L7x50d9shOTwAlwK+r3pn2y1jFh2r0mlg9TkeTq+PLfIRB8nEZishYkZyVXrzxrAWi
         UUFBxd3sap7dl96Nbc/tDQUFQeVwSJpZB1fHart7wV1WRX414uNrvih5elEQ9LDNKH11
         buKE1KbRWlEaMYBcEhkunrgNNA4DHRZ4LTvU4YdO12xG5yVKRR//hATuFuSh5rQ0c+YO
         V3Ig21QXodwIdjWbj3Xd+5fWILy2HmJpGzzHWcfwoGMxa9yNLQruWEGwklXSbz7+kbmm
         aPwqD1ZQpNM91joLCKU7BLK2c8Lc6zlI52NmiHk1fvXNHX09KOtf7oJLLM/9scEy19Uh
         ln9A==
X-Gm-Message-State: AOAM530uRW1KlY99AK9/iipF3Ru+x1HMxiMnw5cMIOydqQuk2vloHh/E
        t2CM6W2J3OUjou3Vm2HPirVeBBEdIfCUZnHhUtU=
X-Google-Smtp-Source: ABdhPJwYFIqXtDtO2dGHagjU8ckePixUX2zvhu0aUeXtrLTqLH4Pes5wOmC/6xsDi2pDV5ijqXwGqM9QObKd0pJFg10=
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id
 dk1-20020a056214092100b00443ce3d577bmr7927675qvb.122.1649260101467; Wed, 06
 Apr 2022 08:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210818092503.16653-1-tobias.junghans@inhub.de>
In-Reply-To: <20210818092503.16653-1-tobias.junghans@inhub.de>
From:   rishi gupta <gupt21@gmail.com>
Date:   Wed, 6 Apr 2022 08:48:10 -0700
Message-ID: <CALUj-gve2uN=c_daDM8bJ4gZqxQ_jV4BMyuzk3gywbYqjLsVkA@mail.gmail.com>
Subject: Re: [PATCH] HID: add missing dependencies on HIDRAW
To:     Tobias Junghans <tobias.junghans@inhub.de>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Tobias!

Reviewed-by: Rishi Gupta <gupt21@gmail.com>


On Wed, Aug 18, 2021 at 2:26 AM Tobias Junghans
<tobias.junghans@inhub.de> wrote:
>
> hid-led, hid-u2fzero and hid-mcp2221 unconditionally access the hidraw
> member of the hid_device structure to obtain the hidraw minor number.
> Building without HIDRAW causes a NULL pointer dereference in the
> corresponding probe handlers.
>
> Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
> ---
>  drivers/hid/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 160554903ef9..00416b3091e7 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -522,6 +522,7 @@ config HID_LCPOWER
>  config HID_LED
>         tristate "Simple RGB LED support"
>         depends on HID
> +       depends on HIDRAW
>         depends on LEDS_CLASS
>         help
>         Support for simple RGB LED devices. Currently supported are:
> @@ -1093,6 +1094,7 @@ config HID_UDRAW_PS3
>  config HID_U2FZERO
>         tristate "U2F Zero LED and RNG support"
>         depends on USB_HID
> +       depends on HIDRAW
>         depends on LEDS_CLASS
>         depends on HW_RANDOM
>         help
> @@ -1213,6 +1215,7 @@ config HID_ALPS
>  config HID_MCP2221
>         tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
>         depends on USB_HID && I2C
> +       depends on HIDRAW
>         depends on GPIOLIB
>         help
>         Provides I2C and SMBUS host adapter functionality over USB-HID
> --
> 2.25.1
>
