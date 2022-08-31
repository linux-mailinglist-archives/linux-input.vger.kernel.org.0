Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201435A7D2D
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 14:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbiHaMWv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Aug 2022 08:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiHaMWu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Aug 2022 08:22:50 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62BED2779
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:22:45 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bj12so27954626ejb.13
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=s8MYTRyURyvJAWeVUKCjiLvHOGuujwI4X7v0OftBbSA=;
        b=bCj8f8OX2CyOZiIpq8J8A/Ifd7bsDf/xNLsrjZ8V4EOdYAPVNVWDa6zeMCuytSBBSp
         KYztvO1x9Nykquj7sde5MgS9FVjLgrENEvoDtDNwe6KCZbsdgWGW6tV+2Rsu2qCK58jS
         ducpWhhNzD+1XNHFQ4bbCa6CT3kuPhX8Gw1MUWKGF34TMRLX6vftiJd93LuD/VLEWUTd
         j221YKuf+LWL1TND5OunKsjJsmYjze+Swfx/6Bf4pljSK2V5x/hXGFh5BwmJwt+jttoW
         t5mGxQFpjegqZ4QFXtd3Wjafc2RHR7qwO+dVpOPDekBl1SGz/YV3B1IayQuXxWbE3Mt/
         x2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=s8MYTRyURyvJAWeVUKCjiLvHOGuujwI4X7v0OftBbSA=;
        b=ERf9G0K0ugSyq/jD9Wcxj1Ws0QAeh08fMojnFdvq7S9c5jaB6+xwhVR9vGjcKtanQx
         jO9a5OUUi8ddPEAv5XpOSIzxdg9DmBw8zmD7xTWRCnzJErwMmmnxluDN95AYbA/FVlKm
         fC7LtjyNFGuHTBqDOq0ho9Ir4dc/LrJVLK1NTGnVvf0xKQKQ4H+ISriQ9P5aJh/SdwRO
         ybFHFHqMHy23LrlzsxbpWtpwlN1w4oiIgPNvMoqe8e/W/5uPNLP8lvrpgniCRMaS39GV
         Y7DUWqDqdAlOuMB4CuT0pG6XrqhDHntZ/XDk2BoRlnCruhaw6RWhw+JDZ+UBcLs/AKvJ
         ZezQ==
X-Gm-Message-State: ACgBeo1F2fLYEBZm13IELWdB7RErIGf3LNjIkECyAA1OuqPIJPl33Hp/
        BwPK2BO981LFL4NoJLPyE8MDUZTcKozLQJ8kFg3how==
X-Google-Smtp-Source: AA6agR7hE2pVJv1Px0ddBlK4AIprmiIxvrzf1e3G6G/qNrWzbzKTCPLpdSrH4NFZ+2kAiFXgpCB6TyrjxpVWP7fBJl8=
X-Received: by 2002:a17:907:2707:b0:741:7c18:4e76 with SMTP id
 w7-20020a170907270700b007417c184e76mr10005539ejk.690.1661948564196; Wed, 31
 Aug 2022 05:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220829131553.690063-1-nuno.sa@analog.com> <20220829131553.690063-3-nuno.sa@analog.com>
 <CACRpkdZYNhmqGPED0ghcT+y9uCeEVsPzHRxG9GyXt=r2pAPQKg@mail.gmail.com>
In-Reply-To: <CACRpkdZYNhmqGPED0ghcT+y9uCeEVsPzHRxG9GyXt=r2pAPQKg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:22:32 +0200
Message-ID: <CACRpkdYL=-mny=tqmMmQVNKpPHVmQheEtVOd1uLKBaTbhjdAbA@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] gpio: gpio-adp5588: drop the driver
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

On Wed, Aug 31, 2022 at 2:21 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> On Mon, Aug 29, 2022 at 3:15 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> > With commit 70466baac3de
> > ("input: keyboard: adp5588-keys: support gpi key events as 'gpio keys'"=
),
>
> This commit isn't in the upstream kernel.
>
> Are you using some Analog devices internal tree? Upstream
> those changes first.

Aha I see that is patch 1, OK the hash will change all the time so you
can't include that when doing a patch series. Just use the title of
the previous patch if you need to.

Yours,
Linus Walleij
