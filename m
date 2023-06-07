Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCA372734F
	for <lists+linux-input@lfdr.de>; Thu,  8 Jun 2023 01:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbjFGXuP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 19:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbjFGXuL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 19:50:11 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0382115
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 16:50:10 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-33d0b7114a9so10474365ab.2
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686181807; x=1688773807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh1qTh2owhTw6iheqxXCV3Jh42E0lrVswaTb+2hzc4w=;
        b=LA5jKQInySScvXJZt7de3SoBHewGLlQl8I2Dlp5XsX5fWzbH03w+SBSmZWIUrw6l9C
         u8HazKhuc6q5WMscROqd9jjrkgq5JohKWGX05MJ0EbhpThT6n9w9bfdT2YXf3hiFrnEu
         3UgHM/D27JYSChhgASP46qj0/dUjiKZi5Fp0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686181807; x=1688773807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zh1qTh2owhTw6iheqxXCV3Jh42E0lrVswaTb+2hzc4w=;
        b=KAvXWdpeFiq0xWnw3eNmCTqwc301CCFhzPEQ4B5fSIh8JbKvZI7IqAPiA9yHg/5OR5
         KkysxpcoZzWXBu9VyMpgjYP87w4sW8Dzakq4J5htWacZ2kVbhecmR88iBnkuWTG/2shH
         4OX9gxVrplm9fqMZczNfZVgzk1oLtdrXOVQc7GGDDmK0jyA7U/+nRiaeb1AWbq1bB/dC
         vFvKfRYEo1fYEsazcJ58aCUYEmLHqE2lzKgvurgEqBfep9In1xN4eSV2SwJ6pN82sSro
         GDNgKDydq8uUTxCuKMVerJTshyVjMjZPlL85a73AW5ud8qaLlfRvBA/f0sbD40JPeXAK
         1QtA==
X-Gm-Message-State: AC+VfDxhQctCTcEGafGqF72zET5X9aIH4RmUCR9vCIugquDN/qH0KPJj
        k7fbk4zZTRxY5+5waBUB4wRQfT83pkjPCttR598=
X-Google-Smtp-Source: ACHHUZ6FBYVby6UjJUmk5Y+rZ5XtcKYon/ZQ5eQt2DnJJuBtrprJQzc4NFFtTRKyocEKLtKoAqkg2g==
X-Received: by 2002:a92:c011:0:b0:33b:1060:aff with SMTP id q17-20020a92c011000000b0033b10600affmr9474603ild.24.1686181806987;
        Wed, 07 Jun 2023 16:50:06 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id t7-20020a028787000000b00418a5e0e93esm3705193jai.162.2023.06.07.16.50.02
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:50:05 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-777a4c8e8f4so268236139f.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 16:50:02 -0700 (PDT)
X-Received: by 2002:a5e:8c15:0:b0:763:5a8f:fe6 with SMTP id
 n21-20020a5e8c15000000b007635a8f0fe6mr9992800ioj.21.1686181802445; Wed, 07
 Jun 2023 16:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230607133458.4075667-1-yangcong5@huaqin.corp-partner.google.com>
 <20230607133458.4075667-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230607133458.4075667-3-yangcong5@huaqin.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 7 Jun 2023 16:49:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uy=UNKDEhqeguhVGn_aTPk5+MppsXChpNOinVc4HJjYg@mail.gmail.com>
Message-ID: <CAD=FV=Uy=UNKDEhqeguhVGn_aTPk5+MppsXChpNOinVc4HJjYg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: i2c-hid: elan: Add ili9882t timing
To:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, hsinyi@google.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Jun 7, 2023 at 6:35=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The ili9882t is a TDDI IC (Touch with Display Driver). The
> datasheet specifies there should be 60ms between touch SDA
> sleep and panel RESX. Doug's series[1] allows panels and
> touchscreens to power on/off together, so we can add the 65 ms
> delay in i2c_hid_core_suspend before panel_unprepare.
>
> [1]: https: //lore.kernel.org/all/20230523193017.4109557-1-dianders@chrom=
ium.org/

FWIW: I posted v2 today:

https://lore.kernel.org/r/20230607215224.2067679-1-dianders@chromium.org


> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/=
i2c-hid-of-elan.c
> index 76ddc8be1cbb..411d7ea2725d 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
> @@ -18,7 +18,8 @@
>  #include "i2c-hid.h"
>
>  struct elan_i2c_hid_chip_data {
> -       unsigned int post_gpio_reset_delay_ms;
> +       unsigned int post_gpio_reset_on_delay_ms;
> +       unsigned int post_gpio_reset_off_delay_ms;
>         unsigned int post_power_delay_ms;
>         u16 hid_descriptor_address;
>  };

I would prefer it if you would add something to the
"elan_i2c_hid_chip_data" indicating the name of the main supply. Set
it to "vcc33" for the elan touchscreen and the NULL for your new one.

It's probably worth adding a comment next to where you set it to NULL
that this touchscreen is tightly integrated with the panel and assumes
that the relevant power rails (other than the IO rail) have already
been turned on by the panel driver because we're a panel follower.
Otherwise someone is going to be super confused about how this could
work.
