Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B258243A810
	for <lists+linux-input@lfdr.de>; Tue, 26 Oct 2021 01:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhJYXVB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 19:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhJYXVA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 19:21:00 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D17C061348
        for <linux-input@vger.kernel.org>; Mon, 25 Oct 2021 16:18:37 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id n7so12584883ljp.5
        for <linux-input@vger.kernel.org>; Mon, 25 Oct 2021 16:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EozrZDVpg+ZP0Rw1M0YUESRPsOtGxy7zLet1izxV1R4=;
        b=smkFL/O/gJcaZSKKqa4eEGJTIQNWC5hvL6WmIzzicEXAnd6xy5Zj1Pn4gZaBtTGxDw
         ux6wm++UIxOiahhFFUcXJK84qOB/X80RwdCJJduBFS+Vi/Zay0u4r0+5gU4k6GzLU87J
         zayKzszoHgtdPUmlLWgL45Tl023sggUKeYuozYTFBtkpyR5/UMAA4jEMycgQXS6Tbum5
         68IjxW7GW/s3KA7fSAhG3hB9yiRJRJgRUXeY8iPwVajxWy+shY0KR5W1huKhK8UgR9Ly
         VkGXEEt1NoqULgv/HGRdr/FOzSxR6Zba5pFCMuZgRGUVmvFci5RUecpuQyhE95x6JXv7
         J7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EozrZDVpg+ZP0Rw1M0YUESRPsOtGxy7zLet1izxV1R4=;
        b=sGEhVMAt7UY3eXLqFPChJ5drz/tjcDdzvt+CgzAp8jwE/cBAbKhxgnH2LrxxsHneq+
         vlnVIlQhiP+ZKjiuDf9CLdMOGDoEMnxYd/jFjnzxPo2pnQxts9FgK+xpBPCnvOm0IHZk
         imOc/dod0zqJr+NA12810XQwXZ0164Z3agvz5sVfVuLTVjnh9g/J+1yisZZsyKBkfQh5
         jJBFaE1w25N2QDaIiWb2Xl39WqW8r6I18okb268t5wTUl/lzR4rwHiv+9HBwip1liGoa
         PxGzE3dUklGWkI87a5T+r9+srTybZsoq/vxku+OzOYcfMcPJOjb8dKKety10gg12P1ks
         3W5w==
X-Gm-Message-State: AOAM530FUnamBe+TkFYMMJYmdIxD63lPWk7ylqydBC7zinCXeJ7gs4oF
        cat4Bgq1BJ8AbGOoT+6e2lH1g2xDYqxgtZ1NQu04wA==
X-Google-Smtp-Source: ABdhPJz3oG+y2cwWCVoReGxh5LmFxBmvF15RmgJ5849Z41JjU1u1e8u5seAn+rX9J+/v6BBeGp3emvd7euqFBNzqq7M=
X-Received: by 2002:a2e:9e4e:: with SMTP id g14mr14444810ljk.261.1635203915755;
 Mon, 25 Oct 2021 16:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211025114214.44617-1-alistair@alistair23.me> <20211025114214.44617-3-alistair@alistair23.me>
In-Reply-To: <20211025114214.44617-3-alistair@alistair23.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Oct 2021 01:18:24 +0200
Message-ID: <CACRpkdYjBM9Pu=rO8SqfGvpP_fGeD=2YCqh+Rh-bOVq_k2S6CQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] Documentation: DT: bindings: input: Add documentation
 for cyttsp5
To:     Alistair Francis <alistair@alistair23.me>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>, alistair23@gmail.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Mon, Oct 25, 2021 at 1:42 PM Alistair Francis <alistair@alistair23.me> w=
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
> Message-Id: <20170529144538.29187-3-mylene.josserand@free-electrons.com>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

> +title: Cypress cyttsp touchscreen controller, generation 5
(...)
> +  compatible:
> +    const: cypress,cyttsp5

Is this the real product name? When I rewrote the bindings for
the original "CYTTSP", actually "Cypress TrueTouch Standard Product"
it came out that the actual product names were CY8CTMA340
and CY8CTMA341. "CYTTSP" was a marketing name for the
whole family.

See
Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml

If the actual products have some product names such as
CY8* then use these as compatibles instead and just write in the
decription that it is Cypress TrueTouch Standard Product series 5.

Yours,
Linus Walleij
