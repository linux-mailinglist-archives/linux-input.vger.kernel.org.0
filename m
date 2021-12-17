Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AF2478E91
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 15:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237614AbhLQOx5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Dec 2021 09:53:57 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:42566 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237613AbhLQOx5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Dec 2021 09:53:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8960CB828A1
        for <linux-input@vger.kernel.org>; Fri, 17 Dec 2021 14:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6B0C36AEA
        for <linux-input@vger.kernel.org>; Fri, 17 Dec 2021 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639752835;
        bh=WX/w0GI+tdcOl+rwdlQQFE74jZDb6imi/Sa9xysvhSo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C5Ko/6WP1fgrfXUPJawX+ZGyD0Q+Zjgoqb3romp4/D3cNVnp7aGRh7e/Ie/Ik9crA
         h0ubkcwlG4XLfshaO4Kp2+XuCkxlOry9Bzq3VszSYDF4LDwTo788dENba8jVewFV69
         qmVecCE2/SrEspdqsVkLK3Zk3cxUQJsBkyaoVQ3IGqMAs2UhyA9VdYMN30US9ELzJ+
         msc/o1neUT9O5YZObvSqxpIrQbd5ArW1tEmUsGIdpDaG70C05S3owTq/WSDWHRE0eM
         sGcTyn1x0a9HfyBP2PfqJZ2SBXMMtPUByFH+AlUemhtTSHBMF5A3eDFo6EbFn6x3SV
         BuEPPmrdCu/hw==
Received: by mail-ed1-f52.google.com with SMTP id y22so8862489edq.2
        for <linux-input@vger.kernel.org>; Fri, 17 Dec 2021 06:53:55 -0800 (PST)
X-Gm-Message-State: AOAM533kRyDEko38ECAElA+pNhYXaJBmK5ESJiIVV4MzkohupBccEnDC
        gzsRiIfGXML5uEksaScnaLWxvphgWoR0sdEyWA==
X-Google-Smtp-Source: ABdhPJx4Sw1UBpaP+7VleoOo6T9BBScAxd6GshHmWebG24z0KGCgNEDH7mgmjKpIkt+ZhSzJq8cKfNGyC7hMkhYv114=
X-Received: by 2002:aa7:cc82:: with SMTP id p2mr3149955edt.201.1639752833704;
 Fri, 17 Dec 2021 06:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20211216233041.1220-1-tharvey@gateworks.com> <20211216233041.1220-2-tharvey@gateworks.com>
In-Reply-To: <20211216233041.1220-2-tharvey@gateworks.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 17 Dec 2021 08:53:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJTWK=MdswGDUv3OBvCm+O5pwFHM+2MP=pjfbMYG4QVdg@mail.gmail.com>
Message-ID: <CAL_JsqJTWK=MdswGDUv3OBvCm+O5pwFHM+2MP=pjfbMYG4QVdg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: input: touchscreen: edt-ft5x06: add poll-interval
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 16, 2021 at 5:30 PM Tim Harvey <tharvey@gateworks.com> wrote:
>

Please CC the DT list.

> Some devices might not provide an interrupt line for the touchscreen.
> In that case the driver defaults to using a polled interface.
>
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml   | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> index 2e8da7470513..a0d4dabf03b8 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> @@ -47,6 +47,11 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  poll-interval:
> +    description: Poll interval time in milliseconds, only relevant if no
> +                 interrupt was provided.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Reference input.yaml so we aren't redefining this property.

> +
>    reset-gpios:
>      maxItems: 1
>
> @@ -99,7 +104,6 @@ additionalProperties: false
>  required:
>    - compatible
>    - reg
> -  - interrupts
>
>  examples:
>    - |
> --
> 2.17.1
>
