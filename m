Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDAD35A365
	for <lists+linux-input@lfdr.de>; Fri,  9 Apr 2021 18:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbhDIQax (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Apr 2021 12:30:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231402AbhDIQaw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Apr 2021 12:30:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68496610A8;
        Fri,  9 Apr 2021 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617985839;
        bh=Xkjercz/hq4GmvpK05+vyrFQNh5WLnisdeifh7tH6Bk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aIxbm0mcFMDnnMeFT7/xulDk8/8HYh95/ArKZV1X/H2Otdyr48Nx8tmkHIVlMlv8P
         6XNvX8fo/DE1JwhUK8GvVLNFmdwDDk1KnSBFI6AUQ9J2fBCYbtnoPM6fgALFA11Bbz
         R8vRhxNulaJis0HkamYwYKGKQC4cXih1hIQTOlpt1CZ7xtQ/FqLM6kM2ryQbi+VFdV
         hRsTNYSSpHi3o+MO9J/17W4PvrI0g71GvD2GYd6IpxVVeHmK8NfsyQOe+8C9UQWb7c
         RJdeNf6csGEVthmYCBOd2oxKD9DHqjfle+IIS4gAZm7ojLZRI7Xfk0E0MSTfLoNu8c
         LhY2zKXN4LF+g==
Received: by mail-ej1-f52.google.com with SMTP id u17so9631346ejk.2;
        Fri, 09 Apr 2021 09:30:39 -0700 (PDT)
X-Gm-Message-State: AOAM530p8enCGZskD4G3yiBlZg1rHuBjav0igBjxJA1Wf1XNwmjXTd1v
        vvGeq4FCL60BD28HrQ0qKXM0XeEie673hryYVA==
X-Google-Smtp-Source: ABdhPJwGEVWzzVecPBd+7a3HX05g77wYJU6JHjdILuAJkWbOZmCNlInJjUAnK8yMq5ZUN3L5OM30AAIyOkFUnveu+R0=
X-Received: by 2002:a17:907:9614:: with SMTP id gb20mr16650915ejc.108.1617985837992;
 Fri, 09 Apr 2021 09:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617972339.git.mchehab+huawei@kernel.org> <68d3a1244119d1f2829c375b0ef554cf348bc89f.1617972339.git.mchehab+huawei@kernel.org>
In-Reply-To: <68d3a1244119d1f2829c375b0ef554cf348bc89f.1617972339.git.mchehab+huawei@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 9 Apr 2021 11:30:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKwo3J2rmqKJHaxg7d8sqgcG3L5sKUi0UpxayF-4yMXRQ@mail.gmail.com>
Message-ID: <CAL_JsqKwo3J2rmqKJHaxg7d8sqgcG3L5sKUi0UpxayF-4yMXRQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: don't use ../dir for doc references
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 9, 2021 at 7:48 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> As documents have been renamed and moved around, their
> references will break, but this will be unnoticed, as the
> script which checks for it won't handle "../" references.
>
> So, replace them by the full patch.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../input/touchscreen/resistive-adc-touch.txt    |  2 +-
>  .../devicetree/bindings/mfd/motorola-cpcap.txt   | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
> index 51456c0e9a27..fee0da12474e 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
> @@ -5,7 +5,7 @@ Required properties:
>   - compatible: must be "resistive-adc-touch"
>  The device must be connected to an ADC device that provides channels for
>  position measurement and optional pressure.
> -Refer to ../iio/iio-bindings.txt for details
> +Refer to Documentation/devicetree/bindings/iio/iio-bindings.txt for details

There's a downside to this in that the DT only repo[1] will have wrong
paths, but we no doubt already have lots of those. I guess a
consistent path is better and we can transform it if needed.

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/
