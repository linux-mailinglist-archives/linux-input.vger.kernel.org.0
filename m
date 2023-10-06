Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235AC7BB1FE
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 09:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjJFHKe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 03:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjJFHKc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 03:10:32 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0289CE4
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 00:10:30 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7a8b5ec9a6fso677135241.2
        for <linux-input@vger.kernel.org>; Fri, 06 Oct 2023 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696576230; x=1697181030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4Pz6V+l7g1fDRYkyErgWlYbtoLKmeqMrzbk272HU6I=;
        b=DVbrAv/OhKHORSxdsS3e5euO2Z1vQWa+xc8b/wOAkbX9s1Q4i0rbCXanOzgWcML8tF
         FwPobV/Yskf0wQz793l01oRnLguLoGd/nKmTZy1TkSmqGvUnIbooAJlctrjzf8h3DadK
         cT0gRMAWzlzNQ3trpjrvVQ7wl89AlIftknFL9iksHDdNki+XFrAKNFiBYBjcbb5QOaCz
         66nHlqTjK0egyeIvdBBSnhUxPPSkRaFfJihI3wrX3CVaGkyC1LNOGGyXG5d2e+qmzzcw
         mD3+mbax2JJ5pfiQOKvL+l9DgJUdzqMXCcJZa0PYKua7vlRCNrHzJ3+mDIpGIPkou/6z
         hrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696576230; x=1697181030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4Pz6V+l7g1fDRYkyErgWlYbtoLKmeqMrzbk272HU6I=;
        b=D54oVGCfUY1IWzzmaT3179e5pX7uiEL7BuQaPl6hWE/Fdx2GaLYe4oMRSFlskWx7Ha
         NO6etBM4fuL4qUCwfcAtaDivg2WiGgQsOgJLOUO/tt+/WtPrf8Jx8xq2d4fdVi7pkARA
         +IWTWGoLQZuIXGMefvuoaoZA1Tu/H20V33VMQmlP8lHOP+8NUht20Sjfk8JIY15Uei9d
         03fyRz38DcxdFZJvXZv4z8q9tKBbqkXSwrp/dlZgqkYUz7lULToUOjslmohwdmuso9WY
         SW98g4YOIyzultPVY4keSKaQniwvm+kxC+48GfcInIeeNAhMY/fGmOworOgiP5rSiNZs
         8ifA==
X-Gm-Message-State: AOJu0Yy+6BFoCAU2tAr6Kxg/F/w7Mo0Inc7ToCxyavwIdVznmd5wXGSS
        +abVOJDDgSW0Sc8LqyteJ89dfsRn/vfz7ItATnyjhQ==
X-Google-Smtp-Source: AGHT+IElekYbONyUWUDSEziCQbS03+r3xAaUoSu1bVKXQLUSAIno+7zsmOgB0alZ0ADMgfjFwh9TNpN3RIIBLTKJWkY=
X-Received: by 2002:a1f:e246:0:b0:48f:8533:3cda with SMTP id
 z67-20020a1fe246000000b0048f85333cdamr6331515vkg.11.1696576229965; Fri, 06
 Oct 2023 00:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231004-pxa-gpio-v5-0-d99ae6fceea8@skole.hr> <20231004-pxa-gpio-v5-5-d99ae6fceea8@skole.hr>
In-Reply-To: <20231004-pxa-gpio-v5-5-d99ae6fceea8@skole.hr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Oct 2023 09:10:19 +0200
Message-ID: <CAMRc=Mf47F7GgLyp+DkRQp2H7+JiqjczVHSQwZoYJg8455n_bA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 5/6] ARM: pxa: Convert gumstix Bluetooth to GPIO descriptors
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 4, 2023 at 4:56=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Gumstix still uses the legacy GPIO interface for resetting the Bluetooth
> device.
>
> Convert it to use the GPIO descriptor interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
