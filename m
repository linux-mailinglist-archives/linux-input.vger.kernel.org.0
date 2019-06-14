Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6050846013
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 16:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbfFNOJJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 10:09:09 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37311 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfFNOJJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 10:09:09 -0400
Received: by mail-ed1-f66.google.com with SMTP id w13so3711520eds.4;
        Fri, 14 Jun 2019 07:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQTbMofHx6ihnY6hv/q/Pjtwumkc7ogl2iTrngkVtvc=;
        b=V0fqh/ToYT65uEuFt6uNfdklxYbXJW90bygOIQrCOe1G5s+fy3oUGD74h+NjAMMeB3
         BBZHRgx1vzsnOGS/nstZAzpBV7gMG0ZqrG/36RAfHZAgQocOeBa+sTuLgU3VgU2uZDx/
         Ffc98er/pmLyyxcYbLRUsx5q+p08rd6mpMEXDvxojsXq52XzYDiIBVtGRLUo3ITFouNL
         M176HRXmPGUyjFRBy8Od7R31GNWv1JpggyPfrQuUSA2puNj7aoLcdfFpOkJQ1unGJQKM
         ufptnveFLuUASMzZsWdjoRvGXL0xkEoz9+krC3mBJgiKGhYisySboo8jK/71mutI3Sd9
         jK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQTbMofHx6ihnY6hv/q/Pjtwumkc7ogl2iTrngkVtvc=;
        b=GXV9zdCp0xNYIXemUahFfhLV2jbDmg9afQAFzQe1GnWCMg+owRdkgTT3xj3foekTLO
         hReEpc4a7wcVtdPDyYsaeWoSqJvce8KlIVcvaK+Uv64iJ3w//5b83jNkA1SsSHLvU1ET
         qZjiXHhnywXO4xTgQw8rbpVBiRi5SP5Ko0Nt7ELmb1U0vvg1fJtUOu7JsOEW6nQC+yu2
         X+kl3JCaZy0IuVi2YRxqp1RxhXBjyxRhsOh+kEgkvjaNukOGeoZe1dfoF3rg+lg/Uizf
         0nn7LJlv0a7XmJchnhUlJp02Vdk4rykJBlXI8FY564ZYx09TCQp1k0ttz+WYPpObs+DV
         lUIg==
X-Gm-Message-State: APjAAAXCRCBbY1zJoo00o1UjkGvSxV74oj/6XcL8OOT2DaaVnlvIJ4nd
        hhCR/GsQYbF8odAECSryHp/UNAJPXFCy/3TgHsI=
X-Google-Smtp-Source: APXvYqxLabx2dayIi0z0mrk5mYOCWKcsBoXZf+gdfmFIbIEppEoh4K9PusScfsC/Ujb/OusUUWU5Okr0/cgVa9nC+zE=
X-Received: by 2002:a17:906:583:: with SMTP id 3mr14648315ejn.278.1560521346837;
 Fri, 14 Jun 2019 07:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
 <20190612212748.32246-1-jeffrey.l.hugo@gmail.com> <CAF6AEGvAkCqNXg-NwxfpYJteWs6hfBnOb0yJN6vQOnmMck-HDQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvAkCqNXg-NwxfpYJteWs6hfBnOb0yJN6vQOnmMck-HDQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 14 Jun 2019 07:08:52 -0700
Message-ID: <CAF6AEGtUjxuL3y5pyzKz5HJV7KyXmKxmVxqcm3DraAKvkB0xmw@mail.gmail.com>
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

On Fri, Jun 14, 2019 at 6:44 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jun 13, 2019 at 10:17 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> > functionality includes USB (host), microSD-card, keyboard, and trackpad.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
>
> [snip]
>
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> > new file mode 100644
> > index 000000000000..407c6a32911c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> > @@ -0,0 +1,30 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
> > +
> > +/dts-v1/;
> > +
> > +#include "msm8998-clamshell.dtsi"
> > +
> > +/ {
> > +       model = "Lenovo Miix 630";
> > +       compatible = "lenovo,miix-630", "qcom,msm8998";
> > +};
>
>
> So, I'm not sure if there is some precedent for this (but maybe we
> haven't really had this problem before).. but as I mentioned on
> #arch64-laptops, I think we should put vendor/product/board-id strings
> from SMBIOS table in the dts files.  That could be used by grub to
> find the correct dtb file to load in a generic way.  (Ie, look for a
> match of all three strings, and maybe fallback to a match on just
> vendor+product??)
>
> At any rate, how the strings are used can be refined later.  But I
> think we should include the strings from the beginning for anything
> that is booting via UEFI.  It's perhaps more useful than the
> compatible string.
>


perhaps something like:

   dmi-compatible = "LENOVO 81JL/LNVNB161216", "LENOVO 81JL";

??

(well, those are the strings from my yoga c630, not sure what they are
on the miix 630.. but you get the idea)

BR,
-R
