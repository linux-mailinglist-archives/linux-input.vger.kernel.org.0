Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B94A97E16BF
	for <lists+linux-input@lfdr.de>; Sun,  5 Nov 2023 22:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjKEVI7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Nov 2023 16:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjKEVI6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Nov 2023 16:08:58 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A42CDE
        for <linux-input@vger.kernel.org>; Sun,  5 Nov 2023 13:08:56 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5ae143e08b1so44424437b3.1
        for <linux-input@vger.kernel.org>; Sun, 05 Nov 2023 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699218535; x=1699823335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0zXtrcqAa/SL+O0N/SakZQ4wpvBiPy922c2Sz5wrLU=;
        b=dvlPzyJumI9Dycy0PWlF8GCps3YDfCwEx3g2OlNS4WzIEC3LpYgzTFarLNkOqNvFwm
         YMZ5ZWkdN7RYDhu+Dc5GJLpuTW3IZsGKZOhVTz3BTACNtPRUjUCBhPAkuNSVELiz+yH5
         MKohNwfbB56LJQGHvudr4qFz9/ozVT7Eq8tk7csKCDZ586Ft6NN6SAOMW2kxu47rU9qW
         DpBrK6XfDWugupkjHJ/bWnpn8+aoLCOsxbOVgp48sY37uXtPJamYlpXaMEAZsveyrcGG
         8AMUYDGqQXQvYRV3UDtYfsRaA8J04LcfoLb8M8EGvg6Ymau9qNPjObnhXs6zESjZ689M
         gAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699218535; x=1699823335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0zXtrcqAa/SL+O0N/SakZQ4wpvBiPy922c2Sz5wrLU=;
        b=J7BFPFssDMXTi8I81QhxwYBYw0ue1qJyeelWb21kbmEhqYA2Ug07DUKpE5bXSZHIv6
         QBxSU8zhtB0p2yiAEF7f1anlGjYN3G7QpmSFxnddttjWU44DAX1Fe7fbzS0HJGIdn1K6
         AUd7DJoHoTHouebgaRSI7GncALwa1ffD5DEr2t69JRQ7SkqKMDyeXsfTy8ZJ5l1EMVPw
         bRla0Qn6tMhBcA9mK8Jp4UmJx2Nk8MOEJMkO5TAQJt4AiZTdVT6r0dowyFvOSK+saGPD
         abyQZcocdA2XAD0uay/lkjxsvsYsYMeVHezoeTgUs6GRT9xHNneP+xCl5XjvqP94uoKi
         Oi+g==
X-Gm-Message-State: AOJu0YyZpHpHArV/TmThrVTDSjN2XM5XwfCmD0EGJ09Ehvj3wORCf31Z
        4gplXpsGvzuLfYwFg67iC7XzANQPUcMCqGai9a/gHg==
X-Google-Smtp-Source: AGHT+IEEZy2W9vu4C1dVy/URpJcNjc6x40y+K42qvhhGfEz/dRPXDQ7B8b3lnlZoV7Hetr7t+cWm5mvTXbsynGi3xT8=
X-Received: by 2002:a05:690c:f8e:b0:589:c065:b419 with SMTP id
 df14-20020a05690c0f8e00b00589c065b419mr11425447ywb.34.1699218535408; Sun, 05
 Nov 2023 13:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20231105204759.37107-1-bryant@mai.rs> <20231105204759.37107-2-bryant@mai.rs>
In-Reply-To: <20231105204759.37107-2-bryant@mai.rs>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Nov 2023 22:08:44 +0100
Message-ID: <CACRpkdZxF=_5ejxmPB84MmrbJ+Tv4S+OKqfc3sou4HWmZCw8Ng@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: input: melfas,mms114: add MMS252 compatible
To:     Bryant Mairs <bryant@mai.rs>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 5, 2023 at 9:48=E2=80=AFPM Bryant Mairs <bryant@mai.rs> wrote:

> From: Luca Weiss <luca@z3ntu.xyz>
>
> Add a compatible for MMS252 touchscreen which appears to work fine with
> the MMS114 driver.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Signed-off-by: Bryant Mairs <bryant@mai.rs>

LGTM:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
