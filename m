Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D49A6CD4FD
	for <lists+linux-input@lfdr.de>; Wed, 29 Mar 2023 10:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjC2IoF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Mar 2023 04:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbjC2IoD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Mar 2023 04:44:03 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EDC1FE7
        for <linux-input@vger.kernel.org>; Wed, 29 Mar 2023 01:43:57 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-545ce8e77fcso203441127b3.1
        for <linux-input@vger.kernel.org>; Wed, 29 Mar 2023 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680079437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CegZ5vVv6kJxCs8hNZgqdih7fCUT9OKWR/JwpUfpd1E=;
        b=DGnf81C3BsPVhC5KHLluKcMK5MSu1l5ceOFyxcA0yVeVaVfTJTefBWGKeoOBVuf0wi
         9m+MtdP47utqpSbfCjhMOuZALh5ejCsQPrIYfqftW6VHRP6iqO9IMeP63BBd3bJnrusk
         KcEFZGVARw+Kq+gSBd1c+hJ3syj6s3qiMAi+eHaG+VK/KqWXmkvGz05GsGouMMLUV6b6
         oEII3+P9AfpocecQ4HrWrhJYBzifVIRbGh7DiZuneXn1EdbifWMElUj6Dneux3ptWNg+
         FFE0hI5xFOMyzrdkFkzt4fAavyeA9FovjHoNnGgscThaJf6R8QCnz68+QvRxh3ltCenI
         E26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680079437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CegZ5vVv6kJxCs8hNZgqdih7fCUT9OKWR/JwpUfpd1E=;
        b=3t7WnRtR05AZuQR2voeqtkmtK+KjAyRR0N0NXZ4t6KP85JHi8naLMjpHNUm1rdBhtx
         Ci8l382gh2VOJG7Oa0tuuBzcGeDii3yj4hloo6awpCH5v75TDdUnlv5P85KILftbdEjZ
         /z7eq/8hQAfklqsL6P3s9bkTsvSlm7tvfOkpKZwCpFOjuMGuUdt6GySoG2R7wTKr7V0p
         1oFxcRAyqrB6/7iz5x3NwyiilmOqcbnJYJ2UAsaRKDfyHeWXo1aJrb+d0omYUcgutqLI
         50UAoQzXmg3aHGOops4EwWbEtGUfh/2y3cuzNJLYMj2UumTXF6Ef4UkI0oYPstDxI/Ff
         sPsA==
X-Gm-Message-State: AAQBX9eQtcDjxIHgwAfjorO2oUupAob4Ew+DolxvsKrp9UzbQBbYnuur
        JYBMi/0AaD2QAT5I2tMVwW47i3RZ76FF+QvY78dm/g==
X-Google-Smtp-Source: AKy350aKg1VyVMCRW6Rr+1J4IAsnJAed3lhLPPR8BgApAQBPxXtGvhxNeVVfJJSXkL2NoGvIOJ3Jacas5QN01FxmsN0=
X-Received: by 2002:a81:de0d:0:b0:541:a0ab:bd28 with SMTP id
 k13-20020a81de0d000000b00541a0abbd28mr914507ywj.4.1680079437001; Wed, 29 Mar
 2023 01:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230323135205.1160879-1-mweigand@mweigand.net> <20230323135205.1160879-6-mweigand@mweigand.net>
In-Reply-To: <20230323135205.1160879-6-mweigand@mweigand.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Mar 2023 10:43:45 +0200
Message-ID: <CACRpkdbx2x6jJhLmTee7SvnU2jOh30e8ktj6PMVrGgu3_8q-bQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] devicetree: input: cypress,tt21000: add wakeup-source
 entry to documentation
To:     Maximilian Weigand <mweigand@mweigand.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 23, 2023 at 2:52=E2=80=AFPM Maximilian Weigand
<mweigand@mweigand.net> wrote:

> The touchscreen can be used to wake up systems from sleep and therefore
> the wakeup-source entry should be included in the documentation.
>
> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
> Reviewed-by: Alistair Francis <alistair@alistair23.me>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
