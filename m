Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2633D36EF0D
	for <lists+linux-input@lfdr.de>; Thu, 29 Apr 2021 19:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235685AbhD2RmJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 13:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbhD2RmJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 13:42:09 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C8BC06138B
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 10:41:22 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id u22so23142806vsu.6
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 10:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wo7qtIBe5Iy1CaOW+br7RSq7Xc5bnAGdn6RablMYxR8=;
        b=FpBgYWmGFQfzYavI/ukkpnT1P7QX/aHKstDvjUU0HUKO2wASA3Lz7UghFq9otTMMQ8
         GNBQJWCxTUsoTRmtG2RIQvvnNhpq9uoI57dpidm8hCyzgmxhF9z2H6WpyC3vD9eSuHMD
         Vw0PXe640CCS4zWSCKgM9tolLuGU+Vh++T6j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wo7qtIBe5Iy1CaOW+br7RSq7Xc5bnAGdn6RablMYxR8=;
        b=MPkARPbUULakmnazNKvUSv+1nkEq8s/lGR00+Eqx1wjdqErmh6a9mzceDaMY39orYG
         miA4nLHO1P9lZp8nyPrPEsyVDSegTsLqGimHQHiDFJCo6dmXS+Ya5+W24kXUONjcDQOi
         sBWP+FqqI8O65AtUppkgl23XCy7ZE/083BJdEAcH/xpgbXCaSuXj+KD3+XL2vQYDLLXI
         MoTrIUlgVZUB4Gm8go8Cmz0kk746zWbn16l1lafAzoVKtmnjfmY2hzEjo+yydfHtFhBu
         bg6pOnEPYYNcLCPGh/LX7kIburWW+BLq/MwinKHdD2Yskw7cf/+eErjbrG95xw08d3n6
         j7eQ==
X-Gm-Message-State: AOAM530eVoFXuMEpDcEvqEwOUP3gl0P7FwrFwSupJWuZj/1Eb9tIDtlV
        FcxuBqN+vPzopIz5IxMKX6FzsnGWyUIsYA==
X-Google-Smtp-Source: ABdhPJzX7lhD0FJ1wAbqcncqlm1k/gel9kqJoYjn3lbit7r5R8ior708akHmhaE4S0sG9g38PoZhgA==
X-Received: by 2002:a05:6102:127b:: with SMTP id q27mr1565733vsg.27.1619718080949;
        Thu, 29 Apr 2021 10:41:20 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id x28sm560615vkn.28.2021.04.29.10.41.19
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 10:41:20 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id z7so5324535uav.4
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 10:41:19 -0700 (PDT)
X-Received: by 2002:ab0:638e:: with SMTP id y14mr461069uao.82.1619718079327;
 Thu, 29 Apr 2021 10:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210429103548.1.If5f9a44cb81e25b9350f7c6c0b3c88b4ecd81166@changeid>
In-Reply-To: <20210429103548.1.If5f9a44cb81e25b9350f7c6c0b3c88b4ecd81166@changeid>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Thu, 29 Apr 2021 10:41:08 -0700
X-Gmail-Original-Message-ID: <CA+jURcvzh0AJ-Vszs21L9MhU5JWV1xKHkYm8x2nH1Djek9ueWw@mail.gmail.com>
Message-ID: <CA+jURcvzh0AJ-Vszs21L9MhU5JWV1xKHkYm8x2nH1Djek9ueWw@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - add support for Amazon Game Controller
To:     Matt Reynolds <mattreynolds@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 29 Apr 2021 at 10:36, Matt Reynolds <mattreynolds@chromium.org> wrote:
>
> The Amazon Luna controller (product name "Amazon Game Controller") behaves
> like an Xbox 360 controller when connected over USB.
>
> Signed-off-by: Matt Reynolds <mattreynolds@chromium.org>

Reviewed-by: Harry Cutts <hcutts@chromium.org>

Harry Cutts
Chrome OS Touch/Input team

> ---
>
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 9f0d07dcbf06..d69d7657ab12 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -268,6 +268,7 @@ static const struct xpad_device {
>         { 0x1689, 0xfd00, "Razer Onza Tournament Edition", 0, XTYPE_XBOX360 },
>         { 0x1689, 0xfd01, "Razer Onza Classic Edition", 0, XTYPE_XBOX360 },
>         { 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },
> +       { 0x1949, 0x041a, "Amazon Game Controller", 0, XTYPE_XBOX360 },
>         { 0x1bad, 0x0002, "Harmonix Rock Band Guitar", 0, XTYPE_XBOX360 },
>         { 0x1bad, 0x0003, "Harmonix Rock Band Drumkit", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
>         { 0x1bad, 0x0130, "Ion Drum Rocker", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
> @@ -440,6 +441,7 @@ static const struct usb_device_id xpad_table[] = {
>         XPAD_XBOX360_VENDOR(0x15e4),            /* Numark X-Box 360 controllers */
>         XPAD_XBOX360_VENDOR(0x162e),            /* Joytech X-Box 360 controllers */
>         XPAD_XBOX360_VENDOR(0x1689),            /* Razer Onza */
> +       XPAD_XBOX360_VENDOR(0x1949),            /* Amazon controllers */
>         XPAD_XBOX360_VENDOR(0x1bad),            /* Harminix Rock Band Guitar and Drums */
>         XPAD_XBOX360_VENDOR(0x20d6),            /* PowerA Controllers */
>         XPAD_XBOXONE_VENDOR(0x20d6),            /* PowerA Controllers */
> --
> 2.31.1.527.g47e6f16901-goog
>
