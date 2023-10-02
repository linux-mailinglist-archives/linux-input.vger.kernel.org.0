Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3E57B4E5E
	for <lists+linux-input@lfdr.de>; Mon,  2 Oct 2023 10:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbjJBI7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Oct 2023 04:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235945AbjJBI7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Oct 2023 04:59:17 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C17DD
        for <linux-input@vger.kernel.org>; Mon,  2 Oct 2023 01:59:14 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a4c073cc06so5807727b3.1
        for <linux-input@vger.kernel.org>; Mon, 02 Oct 2023 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696237153; x=1696841953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQY2i+vSoxbuYAF7vQ9wW6HahcEbMKsvXUOSPTlVVRU=;
        b=IY5UKajNFvwmmEPjpibdfnt0QLYRQiMwvTxFJ2vIDWUJjWV4ZLE4mcTWGKnlQ65IgK
         y8o8MMaItd1KfF8tV2Nm7qjHKathxhHul4MrT3FlluCHXwNY0JAtN5GdjgiEf2kVq+Op
         qXHN4JMMIuJgLMqGvd7LioqDNIOxA+2zqXUF1YWlB7B1OnOzn5+fAk0BOQQgQKy/SEYj
         qICzC1jxH6TlEPxrsZKaySloQ/qnBuS5jICxQwiiF9Wkoanj98q59tfGxcLagsFLTNrq
         0SQlBbI2h3ljqehAVPtqKALYZaLIW4A/Aw7K5b0TMdeGtqN2ev+LE9x/5xVlX8P4HKA3
         3Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696237153; x=1696841953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQY2i+vSoxbuYAF7vQ9wW6HahcEbMKsvXUOSPTlVVRU=;
        b=af+eOwzwUe3KWidfPerazp7C3/lyxu2QUyNwUblBgxkIfkc4JVf8byDJ+QLT+C25CS
         jvS5aqGtVKF3DB+Ik0La+9JHTFDznbs9EToyWS1A2KtW0Ayo1zdTCgJTUUVeqmVrTzoM
         s/0uzVRY22CZpj+CK8t8sBu7POrWhSj1GIea3Cu0XOXac7Fgz6N9kiIwLI+CYjD+P3nh
         BGC+rWdD0mzloKfEoWn81AmKLHeT2x77FIJuF52Sk6oPAYfQdAH0Ysa29dpTkmnJgXnF
         SZKEOXAMVntWPBPX7lYseIckdDiZMq1Ja0NQrMh8UVLzAQfx0S4mvtUsmWwTiRoLcyHr
         C+ng==
X-Gm-Message-State: AOJu0YxWxVSD8r8dn6XwEL5jbtL73vTcVKvlyl0YZnFWj47fJ9HbWRYt
        AxrBoayo4mdu1cBhosaFlM9j2ptRf8iTyoXZiJQm3g==
X-Google-Smtp-Source: AGHT+IHu7jVJIVYaIv2Y16+cRGZmCmi3JuaxpOSYzxyCnuQB60ryryVMNDLdUrNxQRUoYHifLfyBCyLQpVp3lUiLmp8=
X-Received: by 2002:a81:4e52:0:b0:59f:6440:7eff with SMTP id
 c79-20020a814e52000000b0059f64407effmr11888090ywb.15.1696237153462; Mon, 02
 Oct 2023 01:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231001-pxa-gpio-v4-0-0f3b975e6ed5@skole.hr> <20231001-pxa-gpio-v4-6-0f3b975e6ed5@skole.hr>
In-Reply-To: <20231001-pxa-gpio-v4-6-0f3b975e6ed5@skole.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Oct 2023 10:59:02 +0200
Message-ID: <CACRpkdZJ_hVZTELbjPdfpmHdQBC8jcuLhxyzV=Zs=8NuVaU+8g@mail.gmail.com>
Subject: Re: [PATCH RFC v4 6/6] input: ads7846: Move wait_for_sync() logic to driver
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Oct 1, 2023 at 4:13=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:

> If this code is left in the board file, the sync GPIO would have to be
> separated into another lookup table during conversion to the GPIO
> descriptor API (which is also done in this patch).
>
> The only user of this code (Sharp Spitz) is also converted in this
> patch.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Looking good!
With Andy's nits fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
