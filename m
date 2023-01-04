Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2A465CA98
	for <lists+linux-input@lfdr.de>; Wed,  4 Jan 2023 01:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjADABf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 19:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbjADABd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 19:01:33 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC28B13CC5
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 16:01:31 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 203so34880877yby.10
        for <linux-input@vger.kernel.org>; Tue, 03 Jan 2023 16:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EmeAqMlx4L3WLQ8RZqFVt/XYKi/d1WbnpMqC2/w5QUU=;
        b=cBeeXkGH1jRynX3HLWx/o22mKuCPnKgwOhtgvbPH2esBlSBW32PGy+CI8A/RcYvknk
         ItjzdyeQEqIKsZqk7jmUqMqVipSpjkNg6ddH0i5APUXHhblUxKU1WFABmCi+2cOvTQ1A
         FQ0kmoKlCugH0Favt7KFeZebShpOgtm849HBry+Xyyw83ocowQfpvfjEeYP0FKXMXazF
         BOs9Z/cGDLqHQ54WA0/nJa/tB31F/zdTZM0Rx87RXOg9++voRPWAh0/FTUSfNBD5SYye
         s6rS+MOz4t7K3qTAWgqzBybfjb8jxUW/DAd399NjVylMQnS1g+J99upRFW31RWvQN2uP
         0EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmeAqMlx4L3WLQ8RZqFVt/XYKi/d1WbnpMqC2/w5QUU=;
        b=MVwInGLp27bQjuKUacOUiiBeHeu+sX7iC4D4C4Yte/PF4+oLNejx8ja9HeO5YenPfN
         jtyxRGcRvDuBjV1U9frxRoi01VCEALqWs4xrs2eqH+iNdOcscolrN+8qOUKaNFytWr33
         zhPbuNHBYeZNgof1dR8Q8gPvW/jRCjxljQ6E7nKLCpkQ8Wz9iO0QN4Jg4aAaSopg+XDL
         xiXkfPwD7zAGs9eVFA6xzfGKO0zQB2NQbYBo9fMKjTXxk0k8Ye8HOa9v5b0UJg0BSSZD
         tGjTSc3nSNG1kwb7D8IVWxjis91S+MKPTbEXDfmrb3INcis0UJqnfRWe43QfSuKobhup
         LMKg==
X-Gm-Message-State: AFqh2kqJy+/qbFRxedYqurWyAl3M2ZzaClN3VZxBkgzwz6V9sfeXHxcs
        vF9axID+mTXo7ymw2KqZ9EF/EiMlH3gQ4+/k7GGi2w==
X-Google-Smtp-Source: AMrXdXumH+8gxqAYhL5cDvddfZF+dgwx8XvxJpIUqzI2Bg7Vqt81S6Fc+l8wZsU/YaHmGU60qO2uV2rllYnPRDBKX/0=
X-Received: by 2002:a25:6d02:0:b0:6f9:d605:92d1 with SMTP id
 i2-20020a256d02000000b006f9d60592d1mr4704656ybc.341.1672790491026; Tue, 03
 Jan 2023 16:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20230102181842.718010-1-jic23@kernel.org>
In-Reply-To: <20230102181842.718010-1-jic23@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Jan 2023 01:01:19 +0100
Message-ID: <CACRpkdaRsGzD8_oDgedj_Ogc64ACXL0DLtPDSzLdJ6nTH5kcCw@mail.gmail.com>
Subject: Re: [PATCH 00/69] Input: Switch to DEFINE_SIMPLE_DEV_PM_OP() set 2
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
        Zhu Yi <yi.zhu5@cn.bosch.com>,
        Mark Jonas <mark.jonas@de.bosch.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Daniel Mack <daniel@zonque.org>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 2, 2023 at 7:05 PM Jonathan Cameron <jic23@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> This 2nd set is a continuation from:
> https://lore.kernel.org/all/20221204180841.2211588-1-jic23@kernel.org/

This is nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
