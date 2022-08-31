Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED8655A7D8F
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 14:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbiHaMh7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Aug 2022 08:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiHaMhz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Aug 2022 08:37:55 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BABCD34C4
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:37:53 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b16so18201434edd.4
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=Fuu2JI5A+wpqBRcbGTVNrKjUHyua0GPAJlLMkrI8qfM=;
        b=DncXsye6bDUGM3ZIlLj8XaqyFahtrLvWtKE5nsSgLN9rz+zuBJr8w2nCpnng1T7Ull
         HGATaLn6yjkxmIGp9wf1ULad1lWWo59GbeZV7/Xa4IWOtpa8AahuoTZltyQvyK4k5Kz3
         qsXuN3+8mCqPoRtcd3cLOzs01jdB4GHRnNMHbJAt+bhPEP+0p8ABJfvoL63QGX1Tz8YF
         G21U5UD92CSv9NIb6NAk41FKefscQhcq+CP4V/YabLsp0ux5sjk6kwXAhgwZ1T63MVd/
         lw3sTwerL9dFL1hk0QymcSLvcY+bKvu9UZw3Z0V366w4964qiIdpDuylQEvmqfPe+9tU
         j3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Fuu2JI5A+wpqBRcbGTVNrKjUHyua0GPAJlLMkrI8qfM=;
        b=nUyy3AdCuqy//ty+bJBXhWiGaEsVjK7E6Y8T3oVcCwwmkWURcJGb13Uv9lEPfRR+aU
         /0Fd/hKi3HKZJNU5Kjdh6geOfGHqGuBzBDaFzUgcH0pcXLqvVCH75QgPrMjcFab9eCcD
         swVn0DXubCGfWHx/ErjgJyHic2tFUYACMM/dFXTLiAfKyLBZ3pfQcUyAAOv2UoHCEP+s
         ZxzP4wC9eydwaqZ6shsG8aAdlx407wS/E53AS5Y/gLbEbqYd3Cs549POVXPPw++KvTIG
         YcCq+d4jk4kTGiFHBRhUduTP0206yEgJ4pZzHmfHbZmMQWOX7JzzK8h0r6upmMSDztBk
         fGzA==
X-Gm-Message-State: ACgBeo29iKOI+QEG7y9ac/ZgXUytsqRXM8Xk2kzF+3VdfZUkr34JoSaa
        T5nU0pypHdWQaWQTTNoTSKWVcoUlZnBboDGe13NbYA==
X-Google-Smtp-Source: AA6agR6omxyBZo7cfhMeYIlGj9RWba4kt4+v9Lqw1rabWR1KY7hd2NaWUKr76TcAnNwZ6YcyK7Qa6NIvNPVVvf0g0aQ=
X-Received: by 2002:aa7:c84f:0:b0:446:2bfb:5a63 with SMTP id
 g15-20020aa7c84f000000b004462bfb5a63mr24625165edt.172.1661949471929; Wed, 31
 Aug 2022 05:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220829131553.690063-1-nuno.sa@analog.com> <20220829131553.690063-2-nuno.sa@analog.com>
In-Reply-To: <20220829131553.690063-2-nuno.sa@analog.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:37:40 +0200
Message-ID: <CACRpkdaxfgf6T4EcWKG8_y4LmZPggQHGjHcq6f_5YkgGWv5vcA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Hennerich <michael.hennerich@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 29, 2022 at 3:15 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> This change replaces the support for GPIs as key event generators.
> Instead of reporting the events directly, we add a gpio based irqchip
> so that these events can be consumed by keys defined in the gpio-keys
> driver (as it's goal is indeed for keys on GPIOs capable of generating
> interrupts). With this, the gpio-adp5588 driver can also be dropped.
>
> The basic idea is that all the pins that are not being used as part of
> the keymap matrix can be possibly requested as GPIOs by gpio-keys
> (it's also fine to use these pins as plain interrupts though that's not
> really the point).
>
> Since the gpiochip now also has irqchip capabilities, we should only
> remove it after we free the device interrupt (otherwise we could, in
> theory, be handling GPIs interrupts while the gpiochip is concurrently
> removed). Thus the call 'adp5588_gpio_add()' is moved and since the
> setup phase also needs to come before making the gpios visible, we also
> need to move 'adp5588_setup()'.
>
> While at it, always select GPIOLIB so that we don't need to use #ifdef
> guards.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Makes the world simpler so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
