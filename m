Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB8A6FAFD4
	for <lists+linux-input@lfdr.de>; Mon,  8 May 2023 14:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234077AbjEHMW6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 May 2023 08:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbjEHMW5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 May 2023 08:22:57 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F7A35DB3
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 05:22:56 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so24651181276.0
        for <linux-input@vger.kernel.org>; Mon, 08 May 2023 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683548575; x=1686140575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vo9ugVDZ3LWs9Bp7l5nNn9C7ow6+Gul+tAX6b+8R+3k=;
        b=Y5FGjUgiDJpsJNGmAYrAAipTXP2nQzzu6RRb7B6ceiuMiSSruzoPtDkIPzI3G+ORm4
         QrVziRakigRKtGQKP5cVIlt4X6RRFrJtCcvpiaGuoCqW6fid0ZHK3BQt9SSQ+UNC4VFM
         WMxWAr8yMoh0Lnz+QVJWtSwalalL68YkCkzsB2Xu247bTrnsSLbervot614Egr6YehVZ
         tML/cECJ1eWzfqiphTEXElnLnLGRqOKCtc9WEeRYa+YRtRgoDdhVlkGFjBIcxw7XJ/m9
         P/qNVnk0l0icoe2S4Y/9cv8lnL48dVTcRI9gczIN4RKWvVRtTSaeO7JLIvaPb8HTjmAi
         2dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683548575; x=1686140575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vo9ugVDZ3LWs9Bp7l5nNn9C7ow6+Gul+tAX6b+8R+3k=;
        b=RKUyocVMyV1aZzkxO3vSLGFRqgj9oOq8zFwJN+/odNiTDgk1AJP0BxFu+Ka5VYP74k
         vc/y1GyYve2wTlSmwh0qRly7Z15RZvclv8K21g14EGFuHxcAm3x8vimvfReXevQt5/IH
         po1x0Q94wlQx4rgnNnIGDAUSdKzlNiRPrH6Sz/flW+++5KWbib7qFMuvSlLMktOrbYnm
         rXJWceg69g4mhvam62xf5vE1Tk12iEnojhzzH6nwxCiyKjP2TRwvx/aKzvauGJ0EldZQ
         KbhT2YXqSZxzbMaunPIDM6vV5wk8UVV/SpVmTG8/dv/brEGKiFIVkEQ4p/RY4IYYOgzI
         bTCw==
X-Gm-Message-State: AC+VfDwv6smW1GhIy0gtsBOhtRVEgQlW3utLjM9Gegpwfdg7Ei/EgYs8
        NG+xH3I02LZ5K/Zu5Novx2SzXs4ooeBMzeewa+55BQ==
X-Google-Smtp-Source: ACHHUZ5St0RPuW2qGXSwhP1XWjDzIlC4kb3e/Mcd1xXIdae5y2Sn7WY7nRQZWD4VdnoGxGA1DYPy+fCe4Nat9Xa5n1s=
X-Received: by 2002:a25:51c7:0:b0:b9a:867b:462a with SMTP id
 f190-20020a2551c7000000b00b9a867b462amr12546796ybb.7.1683548575384; Mon, 08
 May 2023 05:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org> <a34b7181-e635-7fcc-2684-e1ee2efe7096@linaro.org>
In-Reply-To: <a34b7181-e635-7fcc-2684-e1ee2efe7096@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 May 2023 14:22:44 +0200
Message-ID: <CACRpkdZnkYizz0-g2sB3r8YQaDGgFNw=W3_bH-1wHAwT85fttw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] STMPE device tree bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>
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

On Mon, May 8, 2023 at 11:39=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 07/05/2023 23:19, Linus Walleij wrote:

> > This adds the missing GPIO bindings for the STMPE port expander
> > and converts the existing MFD binding to YAML.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Changes in v3:
> > - Update to review feedback
> > - Collected some ack/review tags
> > - I guess Bartosz should apply 1/2 and Lee should apply 2/2.
> > - Link to v2: https://lore.kernel.org/r/20230426-stmpe-dt-bindings-v2-0=
-2f85a1fffcda@linaro.org
>
> 2/2 depends on 1/2, so it must go via one tree.

Ah you're right. I hope Lee can take it all then. Or the DT tree.

Yours,
Linus Walleij
