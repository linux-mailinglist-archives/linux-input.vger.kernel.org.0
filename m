Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C97F132D63
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 18:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgAGRsA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 12:48:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:40514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbgAGRsA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 12:48:00 -0500
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8CD42087F;
        Tue,  7 Jan 2020 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578419278;
        bh=kTXZQjN173fCqmgTGewLyg98W69N0GpFT+kNBfLzEDI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HR3USh9sYG0VnEHrfsPVmJUywzTogMyMYEoiNpLU76gdgueuJ+hqo4f+x0mdgy3ez
         a955S7kulz4m4Aw8Cz8VcHYLtd0Y+CG7ab1Eo59tMeOLC1h8hYoPndsAytRDkOYrwG
         l6KSatU+wBe8syQ3hDKKaOYpHyelebkEduEGuKo4=
Received: by mail-qv1-f47.google.com with SMTP id z3so239583qvn.0;
        Tue, 07 Jan 2020 09:47:58 -0800 (PST)
X-Gm-Message-State: APjAAAVCPKd0dHXDscERiZkbv9AS3Wcn/3TQDxN31a7UakC2nYQN6HiG
        PGm11aPYg8P1YqrfM1U2xxj0S1UOM7vQegqFWg==
X-Google-Smtp-Source: APXvYqy2gvndoftu+Svzdtgi4ocpDnEG+xgfxqRliZPMO1eJIZNuzlk7B27b+jq5NQ2EWa4xSJ8ybWKNGOelefYwehQ=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr518790qvn.79.1578419277767;
 Tue, 07 Jan 2020 09:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20200107130903.14421-1-benjamin.gaignard@st.com> <20200107130903.14421-2-benjamin.gaignard@st.com>
In-Reply-To: <20200107130903.14421-2-benjamin.gaignard@st.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 7 Jan 2020 11:47:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKDqea2r-ocsj4U6Uv8p4zoANzWgq6a49F3EvBEeRqD0w@mail.gmail.com>
Message-ID: <CAL_JsqKDqea2r-ocsj4U6Uv8p4zoANzWgq6a49F3EvBEeRqD0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: touchscreen: Add touchscreen schema
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 7, 2020 at 7:09 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Add touchscreen schema for common properties
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/input/touchscreen/touchscreen.yaml    | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

Don't just add schema. Remove the old definitions. To avoid updating a
bunch of references to touchscreen.txt, I just put a 'see
touchscreen.yaml' in it.

> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> new file mode 100644
> index 000000000000..f6e7c73ef14e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/touchscreen.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common touchscreen Bindings
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +properties:
> +  touchscreen-min-x:
> +    description: minimum x coordinate reported (0 if not set)

You need a type reference on a bunch of these. And "(0 if not set)"
sounds like a 'default' constraint.

> +
> +  touchscreen-min-y:
> +    description: minimum y coordinate reported (0 if not set)
> +
> +  touchscreen-size-x:
> +    description: horizontal resolution of touchscreen (maximum x coordinate reported + 1)
> +
> +  touchscreen-size-y:
> +    description: vertical resolution of touchscreen (maximum y coordinate reported + 1)

I don't think it makes sense if both of these aren't present, so you need:

dependencies:
  touchscreen-size-x: [ touchscreen-size-y ]
  touchscreen-size-y: [ touchscreen-size-x ]

> +
> +  touchscreen-max-pressure:
> +    description: maximum reported pressure (arbitrary range dependent on the controller)
> +
> +  touchscreen-min-pressure:
> +    description: minimum pressure on the touchscreen to be achieved in order for the
> +                 touchscreen driver to report a touch event.
> +
> +  touchscreen-fuzz-x:
> +    description: horizontal noise value of the absolute input device (in pixels)
> +
> +  touchscreen-fuzz-y:
> +    description: vertical noise value of the absolute input device (in pixels)
> +
> +  touchscreen-fuzz-pressure:
> +    description: pressure noise value of the absolute input device (arbitrary range
> +                 dependent on the controller)
> +
> +  touchscreen-average-samples:
> +    description: Number of data samples which are averaged for each read (valid values
> +                 dependent on the controller)
> +
> +  touchscreen-inverted-x:
> +    description: X axis is inverted (boolean)
> +    type: boolean
> +
> +  touchscreen-inverted-y:
> +    description: Y axis is inverted (boolean)
> +    type: boolean
> +
> +  touchscreen-swapped-x-y:
> +    description: X and Y axis are swapped (boolean)
> +                 Swapping is done after inverting the axis
> +    type: boolean
> +
> +  touchscreen-x-mm:
> +    description: horizontal length in mm of the touchscreen
> +
> +  touchscreen-y-mm:
> +    description: vertical length in mm of the touchscreen

Same dependencies here.

Rob
