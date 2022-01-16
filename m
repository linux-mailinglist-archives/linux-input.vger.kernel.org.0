Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB35C48F9FE
	for <lists+linux-input@lfdr.de>; Sun, 16 Jan 2022 01:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbiAPAem (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Jan 2022 19:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiAPAem (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Jan 2022 19:34:42 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC95EC061574
        for <linux-input@vger.kernel.org>; Sat, 15 Jan 2022 16:34:41 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id 60-20020a9d0142000000b0059103eb18d4so14958223otu.2
        for <linux-input@vger.kernel.org>; Sat, 15 Jan 2022 16:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZzvCLaxte6t1+ns9ZlRppkBkDjsfJFHHvFmlzKogF6Q=;
        b=hUFil8u8LU6GPrMUqmFlfmRZGj7f4UwgoZLx152kmtl7i7SoEMgSYZ4dlmkhmvXKCx
         RIF7PbEWdXly4mEPcLmwxmAVq1XP4pAS+jNbub1RyfWY/l6Bv2S0z95fit/eTVXZP2h4
         DsRzXSBKTOzRXrP37EtkfV1t5Ijwf45lFkp3D/9V5mvj/nbOuctS0klEsEMHNPY0ABrU
         X8cepU57/vNoN5xKMhWxooAgi01+5LZsulJEVNT6hwZAiHGjawusOAh1qkklgxXLh44u
         l3UPpzurWGxJc4fHv354hy/p3wkbjJXD3A33fd94boM03pYe1tdwsAdcomoiC+moGPTC
         FFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZzvCLaxte6t1+ns9ZlRppkBkDjsfJFHHvFmlzKogF6Q=;
        b=hQ4EEGkGFsp2/RYQTQJGpejN1JfkFS6EtPafA/YDAQsEF8IRy8/+kHj+AJxYY3GS2b
         YBEzDPptjQ6aQ0dB865aWTQQTSkGrbkcw5Bpeo4BcevKVLTjq5ARU0CC4lus1ZpSoZGF
         1ct36c0fxonvRlOvr6PtP75HbE7gy3z9XU7Y0emyn2112P1fSpCRZCASWYSpvIQHsV5A
         uZQoVrUr7F0tj0Uvmd6JeaklBlCXmk5TIlAnkqmM5Pp028+9tty9fhl1xyT5OsxIyYFj
         tMAd+NPo5DDshg22WYwm4SvyboPiKZe7jBavVDq4NOiTt+q66dAPEqzYoHg4+uIYf/HA
         0oZA==
X-Gm-Message-State: AOAM533PWEoVj7djvJLBhNlnKjbXNDPGydoVLc7gV4SYuWLUjKgHxe3Y
        4FzQcwFPmSjaYzmMKV2c1uSafovAG+qTaIJxRa7rAg==
X-Google-Smtp-Source: ABdhPJwJpGCm5V68sgM58qpJsDpihskxpQISyTShDKElb0SqKN6QicmPUUkLunpx2G+ZLVjrIcCx+8/2QJlNQHQRNHw=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr11992209otg.179.1642293281169;
 Sat, 15 Jan 2022 16:34:41 -0800 (PST)
MIME-Version: 1.0
References: <20220109115331.388633-1-alistair@alistair23.me> <20220109115331.388633-3-alistair@alistair23.me>
In-Reply-To: <20220109115331.388633-3-alistair@alistair23.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:34:29 +0100
Message-ID: <CACRpkdYQEBiSsnwrV1jMks3UYcbnwZLtN8dnUPdsKB3rLcwDjg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: input: Add Cypress TT2100 touchscreen controller
To:     Alistair Francis <alistair@alistair23.me>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        andreas@kemnade.info, alistair23@gmail.com, robh+dt@kernel.org,
        =?UTF-8?Q?Myl=C3=A8ne_Josserand?= 
        <mylene.josserand@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jan 9, 2022 at 12:53 PM Alistair Francis <alistair@alistair23.me> w=
rote:

> From: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com>
>
> Add the Cypress TrueTouch Generation 5 touchscreen device tree bindings
> documentation. It can use I2C or SPI bus.
> This touchscreen can handle some defined zone that are designed and
> sent as button. To be able to customize the keycode sent, the
> "linux,code" property in a "button" sub-node can be used.
>
> Signed-off-by: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com=
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
