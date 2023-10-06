Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B487BB1D8
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 08:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbjJFG7x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 02:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjJFG7v (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 02:59:51 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F92EA
        for <linux-input@vger.kernel.org>; Thu,  5 Oct 2023 23:59:50 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4526c6579afso1227632137.0
        for <linux-input@vger.kernel.org>; Thu, 05 Oct 2023 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696575589; x=1697180389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYvSHxBG2dgNXVlRR25mBsYFXb3dSQ0zb3U7unZUfqw=;
        b=g4hHlfjRXYHesQJbBjTFAv9bKftD7PeNg9WUEZH2FwwgjbyaEPwoJzwidKDRWQW1qO
         WDn7vV1XDeK2XietdXcWuFLDg+u5vJu/BmtILeWHDGO1k42eCl1KbtjtOnaDQ78K+W4R
         RaeAN09GlD7/Tozj6+VIO5dSOZ7p8nRFIleo2Iqus5c9mYMAz79IJfu5RbM5h8WXjRU7
         rhyncxEMDpitlvT15/xgNmNE6T075UG0xpksVWNgob1VA3MuAzHZZnDeEToSxjmyAQVB
         dE9jYlLSFoThywxfzIYLwPcZYe6tfpIp8Sy13bH90xgqHqaoWNuKTOWOTcgyhgsoIxJa
         MC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696575589; x=1697180389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYvSHxBG2dgNXVlRR25mBsYFXb3dSQ0zb3U7unZUfqw=;
        b=egkpAwt8onG1GnyKXd5w78tie/51T5Eawu9Mhl1KlUhS/iVZ+/NFwm7Q8ZPN6LctLj
         7q5oVUmX2LdVfomyz01nGgZBQOqRPsUsmMUztqNFTzDUw2hMIFL9HMAE/9slXdsW4Yry
         YXym8d/txodo4/CPkxTy8ZAU7DdSn43UUlpTMril9kN4Q9DjaeEY4dN1/4mHe3nKIjjI
         52MBavUX31N65SY3K5wyZ1ygNjbooy59kx+1dL1lEE4qhbH7esgwUvw+I3Tpm8l6Zu5d
         wYJJxJUoGPw/S4Q/GpTtB+tGmT48GFN9KVp5Eji2OlcFbC596IsEb0hETyxPgv5eixmY
         ZXLg==
X-Gm-Message-State: AOJu0YyDxcMBs4/5YZab4749PyaVtm30tN8DT7S83euMTGuxtAnxd1Tf
        cdqFIYKWOOWBn0M4TpihFFuEG+hFcSy6cARRHd9HFw==
X-Google-Smtp-Source: AGHT+IEFQXqpGHLnM1FoYxvyZhgGdxF+IAsWxgHanS/EWlcNwUGbusUbSG2isF3zOwbEIeEijyGpNXRzW8TZusWDy4M=
X-Received: by 2002:a05:6102:41a2:b0:452:7341:a098 with SMTP id
 cd34-20020a05610241a200b004527341a098mr2236364vsb.0.1696575589168; Thu, 05
 Oct 2023 23:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231004-pxa-gpio-v5-0-d99ae6fceea8@skole.hr> <20231004-pxa-gpio-v5-3-d99ae6fceea8@skole.hr>
In-Reply-To: <20231004-pxa-gpio-v5-3-d99ae6fceea8@skole.hr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Oct 2023 08:59:38 +0200
Message-ID: <CAMRc=Md5A5Ki-TKTYbv=nLcgLtwxxUAQaU99ijkatoomMgS31w@mail.gmail.com>
Subject: Re: [PATCH RFC v5 3/6] ARM: pxa: Convert Spitz CF power control to
 GPIO descriptors
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
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 4, 2023 at 4:56=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> the power supply to its CF and SD card slots.
>
> Convert it to use the GPIO descriptor interface.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
