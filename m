Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C161C3874
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 17:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389361AbfJAPDa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 11:03:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:45932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732232AbfJAPDa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Oct 2019 11:03:30 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF39E20679;
        Tue,  1 Oct 2019 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569942208;
        bh=4kV82kjMjJZ3wcjI4ESWLuxVaA+TlzuvX1ml8xlyHAA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tYSv6ceB/nYUaAX/If8UgLhBTz1FGDDIqHLgNnnojKZASJzUgLWCmAh2GAb8tzHcP
         RfgiG/gd1ukopKDsdhh8nNW1ulbfZDiMfdn4pMeWxKrjUDvDOxyAuxjdgE79Rqpog1
         QWcsvuQxYHPt7ba3l+bL8FF1vSPesXPzomCQfjio=
Received: by mail-qk1-f171.google.com with SMTP id x134so11569007qkb.0;
        Tue, 01 Oct 2019 08:03:28 -0700 (PDT)
X-Gm-Message-State: APjAAAV38aSqBZxiL8KopgGUHaWSqq9df3ueYBhphGBPXYkLHY0r67bL
        uDUybMIk9W79UH+BRZVOFZo2EC18yi9NohBXvw==
X-Google-Smtp-Source: APXvYqx0fyHnwN4L3YZkpqItcFav8rUVQJC9X+gMStopgCudPHBp5OildzjhaMeNXHsc02CUjGUKEy0fZBfNZnVtbs0=
X-Received: by 2002:a37:be87:: with SMTP id o129mr6681750qkf.254.1569942207991;
 Tue, 01 Oct 2019 08:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <1569940180-11417-1-git-send-email-michal.vokac@ysoft.com> <1569940180-11417-2-git-send-email-michal.vokac@ysoft.com>
In-Reply-To: <1569940180-11417-2-git-send-email-michal.vokac@ysoft.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 1 Oct 2019 10:03:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJHexWRNPPP-+Vv43CYOJmD0X9aqEtn2djMgfqzyBVy5w@mail.gmail.com>
Message-ID: <CAL_JsqJHexWRNPPP-+Vv43CYOJmD0X9aqEtn2djMgfqzyBVy5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: input: Add common input binding in json-schema
To:     =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 1, 2019 at 9:29 AM Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.c=
om> wrote:
>
> Create schema for the common input properties.
>
> Signed-off-by: Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.com>
> ---
> Changes since v1:
>  - New patch in the series.
>
> Rob, you suggested to extract the common properties from
> fsl,mpr121-touchkey.yaml into this file. In the meantime I realized that
> the linux,keycodes property is already documented in keys.txt.
>
> What do you suggest to do? Some possible options:
>  - Just remove the linux,keycodes propery from keys.txt.
>  - Merge this input.yaml with all content of keys.txt. How to name the re=
sult?

Yes. input.yaml is fine. Looks like there's only 3 references to
keys.txt to update.

>  - Something else?
>
>  Documentation/devicetree/bindings/input/input.yaml | 25 ++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/input.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documen=
tation/devicetree/bindings/input/input.yaml
> new file mode 100644
> index 000000000000..494e7d031ea3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/input.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/input.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common input schema binding
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +properties:
> +  linux,keycodes:
> +    description:
> +      Specifies an array of numeric keycode values to be used for report=
ing
> +      button presses. The array can contain up to 12 entries.

12 is specific to your device.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - items:
> +          minimum: 0
> +          maximum: 0xff
> +
> +  autorepeat:
> +    description: Enable autorepeat when key is pressed and held down.
> +    type: boolean
> --
> 2.1.4
>
