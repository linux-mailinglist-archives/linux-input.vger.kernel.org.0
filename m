Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF6DA6AC373
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 15:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjCFOhT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 09:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbjCFOhO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 09:37:14 -0500
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7F730E95
        for <linux-input@vger.kernel.org>; Mon,  6 Mar 2023 06:36:48 -0800 (PST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-176d1a112bfso2707449fac.5
        for <linux-input@vger.kernel.org>; Mon, 06 Mar 2023 06:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678113376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxZOC/oFAJ7mVCTrB11HvO0wkDiTX72CDJEEOJC+H98=;
        b=WmEqHItcKayhl9H/GL/V+sL0EqWmQ9rvSYXvikTzv7SLyfeQsWRkn9pFFwXH2upxys
         ebAOez6IUyPM/QRuRQa3ownBaTORSrpUvoHhzVsXhR2MtJmIj4yHmW64qjZMqLjRxgxN
         gElzhAaR9xGPEnGtRtoPgQaKnL8A2AWGVl0gwbP3zL0K6UH64+HtaySrogyXEEuoRTu3
         Zc3V4Vky5Ff5a5Cz8a4Wkynhr0P17j/UwinnNHNTElus1/VYXMOOU4my0Vw+iGomlywK
         DaWuCB/aMR6DMVALIORQeRVgxqhYa4LFqy8OCw+zoa6T91CoKSZkRhuDCafyH59+fwvE
         97ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678113376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxZOC/oFAJ7mVCTrB11HvO0wkDiTX72CDJEEOJC+H98=;
        b=Sb2Wu9T5/LIZrGvweMjsSrefbZtfzw59HxER/oBVe8N0cYdcZHLTK0z4kBnSWZwMRR
         /nkBrgqNIEIBNgYTSvCnwjBQd0DPyAgfSg3mpVAg9sRu5xgHWdE0dA2OMmX/se+vOJEb
         wSuQOofDiMAx7+Q0yYXtCu1yUhvb0DkPmQNMO1AzME4w+Qqyw/dOuqqrtef6lnGHmnke
         UUU6n7UG3KzCFIGN4TtoUfav3V6+tSgGwo8Ms3ykVGl1zjydC+S2JvfH6xx1dmAAiJgB
         AUzOqbmV3cY3si9ONpWJPgPw/z6ZDNu8xnfok8+XaJX0iqy/5Kaf6iLzqN776MCEhxUn
         Gn0Q==
X-Gm-Message-State: AO0yUKW2o01A2BmN+PLZCIaFaKuGp66R5oL3FFMEPXjU6PVfnetG+6l+
        YLbdtzQOqQsB0d6BpACNssA3wPHo0BPaxpeFd0O1dJ55BzQaBn0c
X-Google-Smtp-Source: AK7set/FqB1a3gzaiHVXuJsE8H16TW/OMBYIdNp4jrArFvJtsJcWBeIdZQ/8vyZPwqyhO7+6BMYOgloJ+MUsrPAUvRU=
X-Received: by 2002:a25:9281:0:b0:b0a:7108:71e9 with SMTP id
 y1-20020a259281000000b00b0a710871e9mr2331645ybl.4.1678112380304; Mon, 06 Mar
 2023 06:19:40 -0800 (PST)
MIME-Version: 1.0
References: <20230227205035.18551-1-git@apitzsch.eu>
In-Reply-To: <20230227205035.18551-1-git@apitzsch.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:19:29 +0100
Message-ID: <CACRpkdZROb6q20yMJomhy4KF0R-vwNSwXPSkN7Tn8S-kf0wYKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: atmel,maxtouch: add linux,keycodes
To:     =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 27, 2023 at 9:50 PM Andr=C3=A9 Apitzsch <git@apitzsch.eu> wrote=
:

> In some configurations the touch controller can support the touch keys.
> Document the linux,keycodes property that enables those keys and
> specifies the keycodes that should be used to report the key events.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
