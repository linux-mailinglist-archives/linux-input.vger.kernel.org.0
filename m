Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBEE6650A6
	for <lists+linux-input@lfdr.de>; Wed, 11 Jan 2023 01:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbjAKAyO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Jan 2023 19:54:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbjAKAyL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Jan 2023 19:54:11 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A58820B
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 16:54:11 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id 17so15106635pll.0
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 16:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gEM4JE4kCw4fTl/KRFqWgZ4QCNRMBcVd4mzXnH0+Xoc=;
        b=Tkzh0SFWPlBqwXThDApsk9VcMjOR7xniHIqYDn9KQ9BSUBCpUTc2iV/IXFxNvlkXLJ
         vyspzlYYWvM4Y+sz8UDX6WwsmTvp7lYE4NPBfRtiEn0hbi1s6Db0IISgfC4GlvZUfioC
         LJwCQpXVXvgvQPv2jxo/qaESBdmpXIj7qMXA5TSAeoYgDuMXtIf5tV7hVL5Ugjj4QUl8
         folxShEnm2kpio4iEovmaieNfLc2IuREC32WUYogOsdl+zynVlxIEYv34CmMxk5KtxQb
         eA09DjpQj02VOXxBhhWNHgydEGOKiGI1DNTVJnOLyesl7WDw9R6WPHbc/DOf+uaVGo70
         Aymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEM4JE4kCw4fTl/KRFqWgZ4QCNRMBcVd4mzXnH0+Xoc=;
        b=1xq0KLf+lNdTqkM4iBTc4/SjW27wA/Zf4EYMsUSIYxyY7nluPxrOnm9PAEM5P9wKO1
         mX1Hf8R7TOyUtawbnHEGcizz5mLE4KIfitMM3sNFs8PbKTp1rDnKYqAh6kUk7fIzQksj
         fe2X1Ho0/I2sLmO/Dc1/K97VEizHj9tPYpzFJAGQs3/BTew7oN7ouJ3bzuv2aa/aqH1I
         2f30L7XKz0cKnojtzIoUe2NX2v9k7Kv1r3rohI2m5TF6/b+bpG38vxfm9g5OENEhzE0m
         Qj2fENHzapnlMSsAjfnSw0qlPJc9fG0clYhFrt+ZMDYxwFs1fFSpsSAh4XYnvnhbS8/J
         D2gg==
X-Gm-Message-State: AFqh2krnhHhn0mYgb2mN0t2Yzy6cyPQ1iZw3NvW0GGROMm+oHXOZmCPe
        eL2Gji9oJOyiThjAPb3G0ss=
X-Google-Smtp-Source: AMrXdXsRDrq5oYYpMIQ3aOsrGFiUftEo0M4hwFItUxWQF1Ck0n8ho1wKXgv4f4LzdPHmcsUmorMPjw==
X-Received: by 2002:a17:902:b58a:b0:186:def0:66f2 with SMTP id a10-20020a170902b58a00b00186def066f2mr71259579pls.11.1673398450161;
        Tue, 10 Jan 2023 16:54:10 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3f43:2598:9756:e3b])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902e1d200b001783f964fe3sm2043953pla.113.2023.01.10.16.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 16:54:09 -0800 (PST)
Date:   Tue, 10 Jan 2023 16:54:04 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Roy Im <roy.im.opensource@diasemi.com>,
        Moritz Fischer <mdf@kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
        Jeff LaBundy <jeff@labundy.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Stephen Boyd <swboyd@chromium.org>,
        Damien Riegel <damien.riegel@savoirfairelinux.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pascal Paillet <p.paillet@st.com>,
        Tony Lindgren <tony@atomide.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhu Yi <yi.zhu5@cn.bosch.com>,
        Mark Jonas <mark.jonas@de.bosch.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Daniel Mack <daniel@zonque.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Douglas Anderson <dianders@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Anthony Kim <anthony.kim@hideep.com>,
        Joe Hung <joe_hung@ilitek.com>,
        Markuss Broks <markuss.broks@gmail.com>,
        Haibo Chen <haibo.chen@nxp.com>,
        Sangwon Jee <jeesw@melfas.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Fabio Estevam <festevam@gmail.com>,
        John Keeping <john@metanate.com>,
        Stephen Just <stephenjust@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dario Binacchi <dariobin@libero.it>,
        Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 00/69] Input: Switch to DEFINE_SIMPLE_DEV_PM_OP() set 2
Message-ID: <Y74IrPjXeU42jpr7@google.com>
References: <20230102181842.718010-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102181842.718010-1-jic23@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 02, 2023 at 06:17:33PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> This 2nd set is a continuation from:
> https://lore.kernel.org/all/20221204180841.2211588-1-jic23@kernel.org/
> 
> A 3rd set (maybe more than one) will cover the remaining more
> complex cases in Input that go beyond a straight forward switch.
> Those will need more careful review than this (hopefully) simple
> set.
> 
> As part of recent changes to the macros in linux/pm.h, the
> SIMPLE_DEV_PM_OPS() macro is deprecated in favor of the combination
> of DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> More details in the relevant commit message.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1a3c7bb088266fa2db017be299f91f1c1894c857
> 
> The main advantage of the new versions is that they allow the compiler
> to 'see' the callbacks registered, thus avoiding the need to either
> protect them with ifdef guards or to mark them __maybe_unused.
> The compiler then removes the structure and the callbacks as dead code
> in event of !CONFIG_PM_SLEEP.
> 
> Ultimately to clean up the old macros the change needs to be done to
> all instances of the SIMPLE_DEV_PM_OPS() in the kernel. There are similar
> changes to be done for runtime PM macros and more complex PM handling.
> This set is just meant to switch over some of the low hanging fruit in
> a bite sized chunk.

Applied the lot, thank you.

-- 
Dmitry
