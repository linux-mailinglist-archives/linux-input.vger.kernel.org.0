Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CD1287D24
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 22:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730345AbgJHUar (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 16:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgJHUar (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Oct 2020 16:30:47 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5EAC0613D2;
        Thu,  8 Oct 2020 13:30:47 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 13so7751781wmf.0;
        Thu, 08 Oct 2020 13:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FTbqlGFvhgZ6bH2B5iw3WBigT5tQeWMYA6WjQ/SSBmc=;
        b=tpE5I38J1MAKh2K1b6ATm7O7RJLI/T/Oe7m4EkK4C87f21i9ENQCiPW9wu/dihkjPV
         a69So7t5zrTzH7xQMyCMMd/L7F0ykz/WA2dMJVpyEeog3aYTH0GCOQbAa7ibO7iB1nLy
         MEOU4eiMsDoytEOju1TU8dwME6Pl6fvpN4RwboK0VHMeFoYsfaFXLj9DiQf4QE+mGr4n
         y9eGV76KzR6pkKbocHdJJHoK+AxccDmwZBaVYwMQl668J+VhZMJCuMBlSwVWQ0Hk1pMh
         +KPNOMEhfopZ/ChX4ayRE0me1qv7s7iypWfh/pOvu3FK9cTxqzBxhF+n8r55YSYfrvY1
         2Q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FTbqlGFvhgZ6bH2B5iw3WBigT5tQeWMYA6WjQ/SSBmc=;
        b=NJRCQhysXfoCUp9jPv0KVTi/lRgYDPIHqO01GgbPTSW24OgVo0B16nWfSbwb7I1rHn
         44HAnkEJz7FsSElkaxvUf2sCh8qm71N5aHKR7/vchrn2d78Ax46PEKYy+4+kjEAXGFZz
         J2CD1eSlj9kTYvRPUrat9Y25KYT3BtIfnBTFAST3ao023dTfehRWxLbMi1N+XF0cXFTk
         QnwENpf8u1xAxytlrkwfs8VNLx3qmvunK/gduPSv8HSnqhsVS5r/iYoGRKIQgQJvGgvt
         loJmdJmVztO/lkuJvmfoPTbdAwI874+FFmHw8T5KkMBVrLWbUZEdI321UGMMhN9V7VmU
         ExIw==
X-Gm-Message-State: AOAM5306vuovzP+X2Wl4uNgTrKIigcSTIRoapSCxRaIL0bUbefKmi+cc
        TnOKJIdzYlNFC1CrMDnrKuMHfFz+0tI+vlD8uPo=
X-Google-Smtp-Source: ABdhPJwXiPFomUDsqa24JmwvN1oUSiMK/NTuoyM4K9e35X66nNBFb066ZiPJ8D6Rx6A1GBT8GxS/j4Mhsl13P6kSkWI=
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr10247720wmj.166.1602189045971;
 Thu, 08 Oct 2020 13:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201008181514.668548-1-kholk11@gmail.com> <20201008181514.668548-4-kholk11@gmail.com>
 <CAJKOXPdZ_zo0bPwQd=_dKHhA2KWHgsH4KTH=+cX8hNxSVrqrig@mail.gmail.com>
In-Reply-To: <CAJKOXPdZ_zo0bPwQd=_dKHhA2KWHgsH4KTH=+cX8hNxSVrqrig@mail.gmail.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Thu, 8 Oct 2020 22:30:35 +0200
Message-ID: <CAK7fi1ZJN=AbkusWqDEbAkZ=AgKEPCvWH43hBpX0-EUDJWOC5g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     dmitry.torokhov@gmail.com, Rob Herring <robh+dt@kernel.org>,
        rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Il giorno gio 8 ott 2020 alle ore 20:21 Krzysztof Kozlowski
<krzk@kernel.org> ha scritto:
>
> On Thu, 8 Oct 2020 at 20:15, <kholk11@gmail.com> wrote:
> >
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > Add binding for the Novatek NT36xxx series touchscreen driver.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  .../input/touchscreen/novatek,nt36xxx.yaml    | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> > new file mode 100644
> > index 000000000000..e747cacae036
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/touchscreen/novatek,nt36xxx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Novatek NT36xxx series touchscreen controller Bindings
> > +
> > +maintainers:
> > +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > +
> > +allOf:
> > +  - $ref: touchscreen.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: novatek,nt36xxx
>
> Thanks for the changes, they look good except this part here which I
> missed before. The compatible should not contain wildcards. If all
> devices are really compatible, just add here one const, e.g. "const:
> novatek,nt36525". If they are different, you could add multiple
> compatibles in enum.
>
> Best regards,
> Krzysztof

They are all managed the same way, but the page addresses are
changing between all of them... the driver is reading the chip ID
while the TS MCU is in "boot mode", then checking in a ID table
if the chip is supported and finally assigning a page address table.
This is done for the entire NT36*** series.

If wildcards are not permitted, perhaps I can change it to something
like "novatek,nt36" or "novatek,nt36-ts"... as then specifying the
specific IC model into the DT means that I would have to logically
change the driver itself to also crosscheck a DT-specified model
with whatever gets recognized by reading the chip (which then would
be a triple check of what's going on, imo overcomplicating the logic).

What would you propose, at this point?
