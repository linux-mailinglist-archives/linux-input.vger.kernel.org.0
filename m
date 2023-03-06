Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1646AD211
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 23:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjCFWyU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 17:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjCFWyU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 17:54:20 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEE83770B
        for <linux-input@vger.kernel.org>; Mon,  6 Mar 2023 14:54:18 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id i6so9807873ybu.8
        for <linux-input@vger.kernel.org>; Mon, 06 Mar 2023 14:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678143258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbmLnGKrG3nA18MfvK9iBAHGPLTSeiBIXaYitNv/z88=;
        b=tlraTyXREqtAP2UrVSR6YS/Kz1st5VpBCWQiVkWr3o5QUqtqy/SE+L6dqVLVmSr1JY
         ZuRVOS3QTiuNHyIg6DhWv3LfolS1cl2JBLtWx96+el26Envpv0LZzQP2dv6EdDjdheqa
         YcK/SCMWOtntTOomOIo0zQ+aP8lvu+wK2c/Db9f7oDgSehascET3tHrjTJVrhh9WVMJx
         PrOMqEgEd3AFBCnRxVSOtCSHy06HvYQKO/5kXzFgQoMoc7Hbz9yCYpyVk8pxgUhKXC9O
         CB46JteCnI/3BFNHfYCkVN3aOwoIJufPgZZOU7Nhz3VoV6ZUJcIyDHYMLtJWudXzO6Yq
         cgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678143258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbmLnGKrG3nA18MfvK9iBAHGPLTSeiBIXaYitNv/z88=;
        b=03CLqRO3C/cjDeIMyMdFnXAxD8pZSdSH1DtZYOdIhPJ2UuwkIopMwRMDhSimM/+Mqq
         xoBlNyqin6dZJb4D22cFygjcRDrEjHaDYA/3pjIjJuSom5XpunVB3blGV5j6PLUZGfrT
         iSJ/JPNFt9EEKeTxuy84P1jw/8ykZDvVmYQtagBNDlgvlepeOs904nf1MsI1szGxnspR
         s2A9h2y8Vu5VlyJiPK3tB2kRiryKwr9sAe6BXyb9U/WqJmeYJ8IY93L0W/wBJ/kjTTw7
         xtpiadA+FpQ9wPz1ck47QApVvEUcNyAKrJeyJVJLU0bSQTKUyNO80IeX68jZx60ohvIG
         xopA==
X-Gm-Message-State: AO0yUKUkm06JhErc108slBAu7l6XAhhjhFG6oQg50ZEegsLGc9ieFe60
        L7EcCarZG4zKT4BMNGLH7ZqfXhNuL3AWR0c4WKOKYY3NDkH6TUvs
X-Google-Smtp-Source: AK7set+PS9GBBwkHRVoZNv3pbU3OyN55f5gv4I3Y/ZR1+5llyDjFZ1dQaKRUlmphEgQ/suPEtbmkMn19NMB2E4n+G7Y=
X-Received: by 2002:a5b:b84:0:b0:ab8:1ed9:cfd2 with SMTP id
 l4-20020a5b0b84000000b00ab81ed9cfd2mr7420988ybq.5.1678143257824; Mon, 06 Mar
 2023 14:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20230227205035.18551-1-git@apitzsch.eu> <20230227205035.18551-2-git@apitzsch.eu>
In-Reply-To: <20230227205035.18551-2-git@apitzsch.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 23:54:06 +0100
Message-ID: <CACRpkdbZCO556z0WvR81KU-07kt5h6no4gvEh0HxvqSwY47Sbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: atmel_mxt_ts - support capacitive keys
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 27, 2023 at 9:50=E2=80=AFPM Andr=C3=A9 Apitzsch <git@apitzsch.e=
u> wrote:

> Add support for touch keys found in some Atmel touch controller
> configurations.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

Looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
