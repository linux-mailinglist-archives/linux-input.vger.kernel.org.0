Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E0445EB3
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 15:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbfFNNos (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 09:44:48 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39077 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfFNNos (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 09:44:48 -0400
Received: by mail-ed1-f67.google.com with SMTP id m10so3582337edv.6;
        Fri, 14 Jun 2019 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FyXT1/kbK0Pc0+G6zGZqye5FjmJZlP77pOonEO/PaPQ=;
        b=KTLc22d+VHdXQX9yTHxxeZAKtARZ/ECZeI8Z+jiZgBfad0n3CwWYhhZglbRBJI+gcq
         /EbAZfHMUJDvxkK1SDjadK8v69gz1WzZ9in05yZ+MTOAonOXYCimuSmuqGBcIwPtB3MO
         VdQiNupNkxbgQaTcFAFq0VFESHr7WPE0G/p/5t+s15VmKyqHeVIm7YLZ1OnGwe0FUhw4
         DJDNryNbIjkjXP9m/XXHxkkC30iZjaeqpqaJhaQDY+hPjJgVgnfZ1Ftq0c1z6xBYefLs
         F02wlMEyaWx6gw/ZtrTafxwV0lMSLL29SZ7q3lD7Ia84KhwxIaOO0eUfVlju0RvKyTzR
         dwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FyXT1/kbK0Pc0+G6zGZqye5FjmJZlP77pOonEO/PaPQ=;
        b=cR36R51wqbZsxIxos7hSGYu6pkTsEqDhIbxLvHXGk7BNabq1YbOEzZvsQT0dPS1owU
         WqktvObca587vpv3hvH03Ai20aWl6N5KsdhNQOjAfEBWKCD1dGQIYT2l3o1k+R8jQnip
         ud3U8W2M4gVh6PncoySi3/JzrAnWNbVF2BYY+c8Ele1abVomffDkc2VHMV1eijEO2R3H
         YlhOrOjVrIssGsofjchGj6JMITk9F7xWn2oIZSNr7+JofQR9zueKNluOPEq8B3SnQKXU
         V6o432/77g61A4rnN53LNISK17MnoKn6U0VGdtBGD0JZsGRo7ZTPuGeE2KyhmQ5ZZiBn
         lIDA==
X-Gm-Message-State: APjAAAVlJ3cloju1PAm0HpTumzA/kzFThnr6hCY8momIs3TZgr4fuBEd
        6GAbyRkzfS8ADSRYReQ4mENiC6oTCXXNRi0/gIw=
X-Google-Smtp-Source: APXvYqyS7dvDPfKGWqFi8rhkMR2nmF7A7n7GP/bNJ2bxTRiaVtMdcYXXV3XZ1yOe+WxfGspubCcyJKhSVkzEO54Hrso=
X-Received: by 2002:a17:906:951:: with SMTP id j17mr56132952ejd.174.1560519885436;
 Fri, 14 Jun 2019 06:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com> <20190612212748.32246-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190612212748.32246-1-jeffrey.l.hugo@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 14 Jun 2019 06:44:31 -0700
Message-ID: <CAF6AEGvAkCqNXg-NwxfpYJteWs6hfBnOb0yJN6vQOnmMck-HDQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: Add Lenovo Miix 630
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, jikos@kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Lee Jones <lee.jones@linaro.org>, xnox@ubuntu.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 13, 2019 at 10:17 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> functionality includes USB (host), microSD-card, keyboard, and trackpad.
>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

[snip]

> diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> new file mode 100644
> index 000000000000..407c6a32911c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
> +
> +/dts-v1/;
> +
> +#include "msm8998-clamshell.dtsi"
> +
> +/ {
> +       model = "Lenovo Miix 630";
> +       compatible = "lenovo,miix-630", "qcom,msm8998";
> +};


So, I'm not sure if there is some precedent for this (but maybe we
haven't really had this problem before).. but as I mentioned on
#arch64-laptops, I think we should put vendor/product/board-id strings
from SMBIOS table in the dts files.  That could be used by grub to
find the correct dtb file to load in a generic way.  (Ie, look for a
match of all three strings, and maybe fallback to a match on just
vendor+product??)

At any rate, how the strings are used can be refined later.  But I
think we should include the strings from the beginning for anything
that is booting via UEFI.  It's perhaps more useful than the
compatible string.

BR,
-R
