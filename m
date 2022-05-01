Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 805FF516831
	for <lists+linux-input@lfdr.de>; Sun,  1 May 2022 23:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355439AbiEAVpt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 May 2022 17:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355499AbiEAVpr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 May 2022 17:45:47 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4CDAE4E
        for <linux-input@vger.kernel.org>; Sun,  1 May 2022 14:42:17 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f7d19cac0bso131322417b3.13
        for <linux-input@vger.kernel.org>; Sun, 01 May 2022 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MwcGhzUMzuQB5fGeykDG23vjACySyYiqBWBdUcZ2GFk=;
        b=GsyTsXTnDN4CY7AA1wrUQT+Y1CVIulHFr4oTp0Tg20CKmvaI7383RxQl+UgGOv+N+2
         7ou2YNXArVG+yi2/xmhm3RwrSr3D5kp2Qgn4DGjh7X2FOJT6wCnWESaCleX/OA9RyV1j
         bwVae0byfjRjtxi5dpkNZn4RfOZ4A1Dd5ugrXFBMXK6tcItRBG80t8J5dKLVZDkoSscm
         wLvaYka4x9i1J8J19EMXqtisuJV8Y/+IS/CbNSohuvWMsp4QiDVXj73xIQP7ss5xnIhF
         n2lEDjG6braJDzS8nQh1+rl3rM6D4gPTo91/XI5EArn82a4AseinskiVs5gU1UTGg9+F
         pAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MwcGhzUMzuQB5fGeykDG23vjACySyYiqBWBdUcZ2GFk=;
        b=w4lBbIFTwP0CqyA61Da0TkcpqZfgIntHv37QANLv+ont78l5cIUN5A77bol67xr/1U
         3k8cSTrioT9ZXVn1kyrcp0IP0UPxpGRqYZK9X9I+IUR5E3W2Fa8kkJh8o2DyeZ+/FoUu
         bspM2NzfiEubGMgLLyEnRERGC0Xf0K7/feR1CSRRvTsV/T8SFoQTi31zwFP/ckevf1o/
         fozD9vn6g/8dhZgShfsXmh6Dw0MWb/8tfOy844RBnqhVqc6ZAVe5UkEIkQNx1DBwJ4/P
         Ktu1deQcFMZBPPINNKCv5lsfQEYjN2OdiDL9Uhgp4aW+ObgWbKn0/c9HXzamOUo1nIpd
         uCeA==
X-Gm-Message-State: AOAM531wvlayZhA9yByQyFtc1TfJgPkVKXqAZhor7GnevNxEvyYgXD4T
        KkarqoQjX9/IFKGNpLUiGLEHSMM8FSQgGUH6jotqrQ==
X-Google-Smtp-Source: ABdhPJweSDfNcHOc9BYhAdVgxvU92j70ljyyRr/zhBZuYvLYJv5UF4MYF8uqkqj6NhL3p2ezG4XOpBAT8/G/pJAvCNA=
X-Received: by 2002:a81:2108:0:b0:2f5:6938:b2b8 with SMTP id
 h8-20020a812108000000b002f56938b2b8mr9549829ywh.151.1651441337159; Sun, 01
 May 2022 14:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-21-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-21-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 23:42:05 +0200
Message-ID: <CACRpkdY3krNDWcGznSB5fNGM9NXw6xA2qWduDidS1KNM-hbynQ@mail.gmail.com>
Subject: Re: [PATCH 20/48] ARM: pxa: spitz: use gpio descriptors for audio
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
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 19, 2022 at 6:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
