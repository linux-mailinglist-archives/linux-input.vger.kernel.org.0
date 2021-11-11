Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E5144D8FF
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 16:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbhKKPTl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 10:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhKKPTj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 10:19:39 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FBBC0613F5
        for <linux-input@vger.kernel.org>; Thu, 11 Nov 2021 07:16:50 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so9391970otf.2
        for <linux-input@vger.kernel.org>; Thu, 11 Nov 2021 07:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FhB8iItBejzwjrEa1loJueZ9ZXnRDY7hXmZta29xgJ4=;
        b=RHhhmajT9R6bgHbRESc2fgGIJLv2CWFiaAkYb1xPPG+nNOQf6SpbKlUAhc5IufiRDY
         BU7qnZ6QjGBz57yN5sG5Sv9pkFHUKy8UAZDWTsBRmPn0wcv7vfBPaIfQ4OpqYMcnbFZ/
         wnxZubBSMhKfY1ILz9ikdxOvzGUNqtZTIBgAvTqI8JIamxhHi3KkMmZZOQiaqhkHqKL6
         ql6hLDx8Za/XsD5qQzjpDOvGZeRpSBm5LQlBMqBxxc2MyDhf9metgDRpPNJsafGIkpb/
         +LRDXHoJoRF3Aw0MB4odMuCncLgN7Ws/hK8JaZnSoTn+y1q0yKjdzUPD1sCTTlF4wFeO
         sJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhB8iItBejzwjrEa1loJueZ9ZXnRDY7hXmZta29xgJ4=;
        b=Xu2RPy2UY5ykEdzf90ALaIv67PgEOiKuOdL+aCH4hPMe9EbtQddMvUXUDFnTQBA8tG
         9cs+fvYVgt4EQartaKaEeulfnFaGb5x2l3fbim9NMjY7rf+DdJgv4ed/BDg4H2vSeP+K
         xD99BofBI0V/DpVJMxWXJqUNLnk0A06QVjJTLmxFG505AZGi8Q6kHaJCkjK+3rVg9Wc8
         /hyr5K8NsgF4mRwt09v0/j3g0hDdC7SyVMzkaRTnDwlVykrarrpRFMBJQBCsiUtv1ELS
         TR0pVSBXf1QwtI1vxRKUuX0b5QIeli8/ZBeZTuucFTztGCaroOGPOQQX1/uFFoGNNDOl
         9AIQ==
X-Gm-Message-State: AOAM530KLPmntDrkSMGWhO8nRGoqSBvrDcnV2xFOwgcb1fjTIljOfccu
        oI1viC96WjIP6r+gb0oA+10qPw7lANVp/srs9OELww==
X-Google-Smtp-Source: ABdhPJxYcwHKiOWs+DTPgi9NESiPf7NVzw/HdlcpYLb2qQtA0XFzifD249u7EjiXWMyo/n0b8DRsmXxQk9rPwf2aPd4=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr6611657otk.179.1636643809760;
 Thu, 11 Nov 2021 07:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20211103114830.62711-1-alistair@alistair23.me>
 <20211103114830.62711-3-alistair@alistair23.me> <20211105152154.20f5cbd1@aktux>
 <CAKmqyKNx00ecsAyOjtLk8i6r75WD0uw=nd=fd9z44yBuau+Vdw@mail.gmail.com> <20211110183654.61328998@kemnade.info>
In-Reply-To: <20211110183654.61328998@kemnade.info>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 16:16:37 +0100
Message-ID: <CACRpkdbrf8a7B-J=3s9x7JCyGgDk9VcsTd_-9o484MtfapVzHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Documentation: DT: bindings: input: Add
 documentation for cyttsp5
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Alistair Francis <alistair23@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mylene Josserand <mylene.josserand@free-electrons.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 10, 2021 at 6:37 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> Alistair Francis <alistair23@gmail.com> wrote:

> You have a kind of double inversion here, so things are automagically fixed.
> IMHO to describe it correctly would be to set GPIO_ACTIVE_LOW here
> and in the driver
>
>         /* Reset the gpio to be in a reset state */
>         ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>         if (IS_ERR(ts->reset_gpio)) {
>                 rc = PTR_ERR(ts->reset_gpio);
>                 dev_err(dev, "Failed to request reset gpio, error %d\n", rc);
>                 return rc;
>         }
>         gpiod_set_value(ts->reset_gpio, 0);
>
> That is the way how other active-low reset lines are handled.

Correct.

This is a source of confusion, I contemplated just changing the name
of GPIOD_OUT_HIGH to GPIOD_OUT_ASSERTED etc to indicate
what is going on.

gpiod_set_value(ts->reset_gpio, 0) should similarly be interpreted
as "de-assert this line" no matter the polarity.

Yours,
Linus Walleij
