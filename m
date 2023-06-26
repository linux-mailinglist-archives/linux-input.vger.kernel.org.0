Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 162B773D847
	for <lists+linux-input@lfdr.de>; Mon, 26 Jun 2023 09:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjFZHOf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jun 2023 03:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjFZHOc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jun 2023 03:14:32 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F275E75
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 00:14:26 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-765a651a3b6so78661085a.2
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 00:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687763665; x=1690355665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUSGWbCXntBTkO9sHXbN7XbI0NcyxewHoKY9x8+FCk8=;
        b=w3kVtyCJ4ESUpPms38IJ30YO6oVYBMt0UEKIlCatn9cTvC7xC8K+wv6U4swkyfoQ9+
         3K2suYs6a1ErbqyeTSMcn5Xi3Y7tpNgOvIN7oPdi91jPlcYOHaFf8Bdbdz4+iupUtMiU
         /mlPzoFtxaHuhMa2wKMNuHtV8jRuC62mZNPzaMbQNLPuV7zl+AC/7mDwEh/JTJuIWQvR
         pWT9GV4rKv/bu6X+SEiRJDkIxqfF+ONHj6WFvBnR52L4ZC4jBdE/ug7z/pxlwxMVTSiq
         3SregEObJ9zB+JtXUB+4FX1bIAJ0F3h5TDiW3NKT3F6zep1HLwKhAT8geDiu1WwYjmHR
         Ltxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687763665; x=1690355665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUSGWbCXntBTkO9sHXbN7XbI0NcyxewHoKY9x8+FCk8=;
        b=VjyIylPYP1iLuzsTza834iPXOqoS+enEUuDWUIb3FL/hSTrIZMmM7AlrGWVs1YVfx/
         Nl6PT43Zqci6evOFJa0Sh1+ta4zsY1TmYHXzghfZQWkCp2G+SFX4plQzDPQ6ZYxzzraE
         vuJTjp1Cfp7ZLjjDzdrqHjTBZyyZLu41keww0+w8m1C4ulAreQGTs0oLdG0as3Hmonma
         RoOKA+pbZb35aAdNwNIUURWsDa2h6Lv1fwDDHImkcOfBvcA3vaqbWNxqTZktEzhGeC1n
         ysuTWvWiuaMMJptJmxG5OsU/EM/JdwhHX50j0GH69jfbsp1OBJtzoVrm670yZyPvmkRH
         +tVg==
X-Gm-Message-State: AC+VfDyHAbtG00Hew8NW1h5jRpmiGxNy75QcS3RHw58JOtjDSVW8Ir8i
        Q2aTAUHrvZ//JynBnW/DViNFtyib1YpBLdgNepJEGg==
X-Google-Smtp-Source: ACHHUZ7Yi47S0NNvpHTlPpY242vz1Sc33NqGJQi5jVb+lJAPeo7W02dKbmeBe32LQ8HnC9fNVcvXrI+GtETdyJy0gTI=
X-Received: by 2002:a05:6214:c6c:b0:626:15bb:f57b with SMTP id
 t12-20020a0562140c6c00b0062615bbf57bmr30736446qvj.26.1687763665174; Mon, 26
 Jun 2023 00:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org> <20230625162817.100397-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230625162817.100397-3-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Jun 2023 09:14:14 +0200
Message-ID: <CACRpkda2maO-dM9F=6pZnpDh9LtPGqeSTUbh1AAMeDiG27yY9A@mail.gmail.com>
Subject: Re: [PATCH v4 02/24] Input: gpio-vibra - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Sun, Jun 25, 2023 at 6:28=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
