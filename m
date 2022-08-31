Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7915A7D21
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 14:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbiHaMVW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Aug 2022 08:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiHaMVU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Aug 2022 08:21:20 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79581CE48F
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:21:19 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id u9so28017524ejy.5
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=3deuHTbgt68FZtumNl8QakR6BCKlpcTobGFH5+SIwxQ=;
        b=WbC/jQehX0sc3K9UA1wtLvp69wnyLXnZSWUzYC9sQqcUUUYmekRudDvToByniNhWgM
         PJMpOc+DADLEb2mBDmHoFpl4SkOKDf7eFw7UrftOW6aZ8gaKbngMQ/wCdoEKehYn4+Hh
         XNc0R2nF1ZsFW/spP/+ZLuJvXVfZB6owJWDhsrIaideNqm3jTOflfE8VZm0yXo2QlRqe
         H156A/dmG177/dowVXfFewi2G16neuIXio5IuqGuSBFaUqf8J8S98Fu4BlQjSEu9YTiG
         rKAmUz6g/zzpv3GQ/NJ7+pdIXNu6pGAOHqobQksISRIJKVebLxNmuMib/LkH8Y9qzWa4
         ywdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=3deuHTbgt68FZtumNl8QakR6BCKlpcTobGFH5+SIwxQ=;
        b=G1XmazjLDpgR58+h61qxB5szwOghD/wQSoTx/Q3juKGyVKj5fui2uugXHwmkB2uYYN
         9WDgWHftOHKQV5VPYUe1blO04+CkyAeAts4n91aW6bDIcUCBAKasEoTzjw+eyyDXwlhY
         CqYhgO2TkzEPqpxxEdU6VWspP3Bp5zqdnq9jhLlxBcU/wmPFleOVF5z5NJZKkbpZdpzI
         UtNuiQOXZlj94AIAbZiVW9PIOx586RYKmrRRk2HjtOyJuf+UgpHvBqeznNl9dtZ/IJ4c
         CiJ5xJSPC8eewuYZAcGLbNWB7hHP0aWebxbcTakJwMFOFzaTBTV/dei9s2qqprxBt6WF
         bB3w==
X-Gm-Message-State: ACgBeo22mgS8ZZd/tdZLut076h6WApSnSd+R6YsNK3x5OVTm2/pixdrP
        qfN/Q7A7aZ4DzPpy1IdZdWxRjVlU8tdWH165Q9ZVcQ==
X-Google-Smtp-Source: AA6agR7nxBSRmXKCoQQUr1oF+8aqdDCvlAHX1BLSgaBGBA7fWJIA2GHZt1ecaCU1w9t3xRmG/zBQAqjqtkGjoN+7ruY=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr11166567ejc.203.1661948478103; Wed, 31
 Aug 2022 05:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220829131553.690063-1-nuno.sa@analog.com> <20220829131553.690063-3-nuno.sa@analog.com>
In-Reply-To: <20220829131553.690063-3-nuno.sa@analog.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:21:06 +0200
Message-ID: <CACRpkdZYNhmqGPED0ghcT+y9uCeEVsPzHRxG9GyXt=r2pAPQKg@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 29, 2022 at 3:15 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> With commit 70466baac3de
> ("input: keyboard: adp5588-keys: support gpi key events as 'gpio keys'"),

This commit isn't in the upstream kernel.

Are you using some Analog devices internal tree? Upstream
those changes first.

Yours,
Linus Walleij
