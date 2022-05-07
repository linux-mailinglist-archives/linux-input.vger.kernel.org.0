Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428C151E6F1
	for <lists+linux-input@lfdr.de>; Sat,  7 May 2022 14:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384716AbiEGMlU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 May 2022 08:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbiEGMlT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 May 2022 08:41:19 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C987D40900
        for <linux-input@vger.kernel.org>; Sat,  7 May 2022 05:37:32 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id w17so17189846ybh.9
        for <linux-input@vger.kernel.org>; Sat, 07 May 2022 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUhgclDR3XBkbKooh+LIAZ5rgGQDmCxwnx2kPnqoYMA=;
        b=KCyiITVKgMi69PaUxMUe8kgt1g0I/YT1BNqXQ8g8jDYzoI10RIuW4XJdIAw+WABgPz
         sIoqAXB0wg2Fv4K4xa+UIk01I93aMUAh5zwWez9Y9woJgUGlFSInLIx46fZ5Gg1s601e
         a5i4HOw7TQkJg5Maw+WvNt0vTtgrsC6dMYDUfidiIqwE2Susa4bkzpuGE1IWxOsZTINs
         CB1T7vFcyxbamcJuoqj4cYj6aPJPj79FjZ60m16yN0qOI1to8EcKMqSlW8ohYQOIT3XX
         Y47JhHbhAM6byKlmpEHLlDWi3VANQBbeKYdvgbjI2HE4GR8wATeJNEQhXZFHSEQQgNal
         1RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUhgclDR3XBkbKooh+LIAZ5rgGQDmCxwnx2kPnqoYMA=;
        b=BB5ttCvdZAnUa/Xw1rGAZ8DvoMnnkLr20KAUVOP1vpmZZV+9B5CeJnJoAXTh7/qpRH
         GrwDlAco4bGGROUKm015MWfyIjOqNzzfcuYLFkvLahQKxc53EcmRHKPDFa3N+8LMjnwY
         pAmqdsNGJmlGPECjjh4e+OAr9MAh6ksZmsPmFhFBD+i+UMLPkeiXQUzPNb0dIMCiHb+l
         Pr88XXSWL5dFTPF1LaFrMJPwtF0cnbr+zpIK5THHQMWpFK7AmhNklx66Sc01yQ2vT+p6
         YmYhIP0OV2R5pjDmGRFQj9jvQkm5C2+A57Vwva9awKfOhOPN4RlVSSn/5qImhun68Xdn
         evlg==
X-Gm-Message-State: AOAM5320hQ1zJZZQUPhYUO0b+h4UDeadZ1qVMIxceOKHZE9ZX8EQnCWT
        ufgtOna7Owo/aITWlEJlbzGRVoRiGdT9qPMU0ydwWA==
X-Google-Smtp-Source: ABdhPJzwJpXEUtAZEUc6bZUPoenoZ5sebSG72if0MOZ/TMe4dt5l953VkaeLr4GysoaOw6EpMxKFJUOEIy1GTdxXArc=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr6256768ybh.369.1651927052069; Sat, 07
 May 2022 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-41-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-41-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 7 May 2022 14:37:20 +0200
Message-ID: <CACRpkdbHGXfAKiN1sNTrLzRd5Qk-jerhcfvDo8FG=Zq94Dv19g@mail.gmail.com>
Subject: Re: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org, Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 19, 2022 at 6:44 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The battery driver uses a lot of GPIO lines, hardcoded from a
> machine header file.
>
> Change it to use a gpiod lookup table instead.
>
> Reviewed-by: Sebastian Reichel <sre@kernel.org>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oh, I've been iterating a patch for the Tosa charging code
going down in MFD ans ASoC and all:
https://lore.kernel.org/linux-arm-kernel/20220125003741.492954-1-linus.walleij@linaro.org/

I just rebased this on v5.18-rc1 and resent with collected ACKs.

Please take a look at it, and see if you rather take that patch,
at some point I realized I had to go pretty deep around the
legacy code in different subsystems because the MFD device
us spawning a GPIO chip...

Yours,
Linus Walleij
