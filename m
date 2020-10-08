Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5309287B94
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 20:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbgJHSVv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 14:21:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:45822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgJHSVv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Oct 2020 14:21:51 -0400
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 478CE22227;
        Thu,  8 Oct 2020 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602181310;
        bh=WGF/TZ1nkI8y2sCipjYBo5yJN1HLBf0qcVvqUwRCh0c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SwQjAqsoHC/DdgUK/IN9/Hyy6eyDM+tRm0x8+tW2miMzdnNhQ/5cRhgrsh0QnCS13
         QA+pzq5nzyUF38MX7I/KWWMCE3db5gbQRoCHQpqtGS6DTgVGMEezlYE8hm0RrYq5eN
         Zb8YlDpoYynrXYt6TGvE8fLCe0es7D1KbVT5XtiU=
Received: by mail-ed1-f42.google.com with SMTP id l16so6820458eds.3;
        Thu, 08 Oct 2020 11:21:50 -0700 (PDT)
X-Gm-Message-State: AOAM531elAcJP0/Mshyj2rIlloXW3DctozBjrJBS+/ZT+vFBlKU88rBo
        stXdviVySjGFTChdJO4D00M82URYI8UGiKC1O/Y=
X-Google-Smtp-Source: ABdhPJyACnVTJ6UJhWn2Km8hbGiVwaCGmaPERJdA2hJ9ALKW1q8Llf0S//HE/E9dOdDHkmrq7GjJIVLFuCm36h5QwXM=
X-Received: by 2002:a50:a452:: with SMTP id v18mr10089568edb.143.1602181308616;
 Thu, 08 Oct 2020 11:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201008181514.668548-1-kholk11@gmail.com> <20201008181514.668548-4-kholk11@gmail.com>
In-Reply-To: <20201008181514.668548-4-kholk11@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 8 Oct 2020 20:21:36 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdZ_zo0bPwQd=_dKHhA2KWHgsH4KTH=+cX8hNxSVrqrig@mail.gmail.com>
Message-ID: <CAJKOXPdZ_zo0bPwQd=_dKHhA2KWHgsH4KTH=+cX8hNxSVrqrig@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
To:     kholk11@gmail.com
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 8 Oct 2020 at 20:15, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add binding for the Novatek NT36xxx series touchscreen driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../input/touchscreen/novatek,nt36xxx.yaml    | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> new file mode 100644
> index 000000000000..e747cacae036
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/novatek,nt36xxx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36xxx series touchscreen controller Bindings
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: novatek,nt36xxx

Thanks for the changes, they look good except this part here which I
missed before. The compatible should not contain wildcards. If all
devices are really compatible, just add here one const, e.g. "const:
novatek,nt36525". If they are different, you could add multiple
compatibles in enum.

Best regards,
Krzysztof
