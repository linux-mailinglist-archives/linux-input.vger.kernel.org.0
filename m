Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02BC3D1575
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 19:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237668AbhGURIR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 13:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237542AbhGURIO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 13:08:14 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84620C061575
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 10:48:50 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id bc26so689515vkb.13
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 10:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ETYWsBqUp3S3auaGLRtgQ7yu3TO0BudUXwxuYoMHvU=;
        b=pbEg9CR3HkC6HU1nQfVIfxIQ/fpsVbZ8/mkCuoBF78SMjYClGKt0UrECoXjdjjXUrp
         fyRunqy1WIh2bMAluG2N9LCAweqOFlvFXCIbCQY1b8hL3+mHLj6a6ozk/0YcHdiH5OpD
         XfcjwlX+MOowWhJtWFIcs2YD/oH3Waf1T2J3MHpq07IDsUFV03DojeBtjJxbM0QrN7no
         uM+KorMbv2EBb074NkuaVMYUHUyw//wXICEU7tLzpIpp75mUdb0vO8xxrgeoMmtRT2mo
         Gkp4HGN08PoHIH9eNvxTJzij5+K+yUSkyds6nv92w5gFDtAl0OXe77WulUymzsYy1buu
         8TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ETYWsBqUp3S3auaGLRtgQ7yu3TO0BudUXwxuYoMHvU=;
        b=KNhm4xs/7pFhdUSKNAxgmy9yesocK8f6fUvKPV7yth6E9bUPks/IZZph0Pokyc9AIX
         euoAFoza/bjiISwz+AaAsiDzy+ayaRkYUjHltC/40CoQF+5tbD99t3xlVzlywyF+13dp
         z5bsPrRWKUYBMMlZ4H78YG6L0OXuAMr2tY1wCnvLvZ5pqE9/28IYIuNNN50q4fXvSeyN
         rD+lUVYmbYHNjaak2Pnm4Kvg9OZ3Lst8oXEp/6wntB0mnXP/bcOM00VqrvacJsl5BO3g
         vcVM4JaKaIdik7JleOqSkW8lq5ASHKar6VE/c8G8NTKS6EZbDroKQAZv6LCq1ZwYF+SI
         UElQ==
X-Gm-Message-State: AOAM530cBeMr5tTuR3jpdaybyaBEVF2c5kv1ADOPtTcr6rDXI2VwgjD2
        VjGN4DAZy20FhcRo2AnwumuQpA4Kn+V+gGp4iFI=
X-Google-Smtp-Source: ABdhPJzI+l51DqKPXYY585S/r0UhMioC3D4ybCu+9GiOd4dVaNb1bHoOkWVuPa3ZJJFbOjbEl3aic07UKGrqk+rO7jI=
X-Received: by 2002:a1f:3a4a:: with SMTP id h71mr32709178vka.20.1626889729627;
 Wed, 21 Jul 2021 10:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <f35f6472fddcf552076f40190f8f1d74888d0b4a.camel@webspeed.dk>
In-Reply-To: <f35f6472fddcf552076f40190f8f1d74888d0b4a.camel@webspeed.dk>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Wed, 21 Jul 2021 10:48:37 -0700
Message-ID: <CAKdAkRRe0GkdOEQhb7WV6CtOw_1D0bbxCcDKadivc+uQrAvBhw@mail.gmail.com>
Subject: Re: Elantech touchpad not working on mainline kernels
To:     Hans Schultz <hans.schultz@webspeed.dk>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Sun, May 30, 2021 at 2:12 AM Hans Schultz <hans.schultz@webspeed.dk> wrote:
>
> Hello,
> I have a problem getting my Elantech touchpad to work with the mainline
> kernels, and I need some assistance with the code to resolve the
> problem.
> The kernels that have tried are 5.9.11 and 5.11.11.
>
> With boot parameters i8042.notimeout i8042.nomux, the touchpad is
> detected but does not work. There is absolutely no response from it
> with any hid modules loaded.
>
> It is reported and seen working on a Lubuntu distro (bionic kernel)
> when inserting the i2c_hid module. The insertion of the i2c_hid module
> pulls in the hid_multitouch module when it works, no boot parameters
> necessary.
> In the case where it does not work, insering the i2c_hid module does
> not pull in the hid_multitouch module.
>
> I have the bionic kernel code, but I have not as of yet been able to
> detect what makes it work in contrast to the kernel.org kernels.
>
> This I think should lead to a kernel patch.

There is not much to go on with. What is the hardware, your kernel
.config, dmesg from unsuccessful boot? If you have logs from the
working kernel that would help too.

Thanks.

-- 
Dmitry
