Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79256A5F2C
	for <lists+linux-input@lfdr.de>; Tue, 28 Feb 2023 20:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjB1TGK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Feb 2023 14:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB1TGH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Feb 2023 14:06:07 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A33130EB5;
        Tue, 28 Feb 2023 11:06:06 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id s1so16847330vsk.5;
        Tue, 28 Feb 2023 11:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjD0ad3Fchgv49eB7byvv4ptPXNkvWx8OoZ16qhiOEI=;
        b=d1WfWZsih6OCFt5PRgycfEI0Ygo6YlWytmlQuZS+0OXQ8gj1ckQylG6wl6LfATfJ7L
         kA9xYWqnkhaPqm+hjxQeooUR3hLQg+TRCQ30e0Le0usDY9nu+BDa1kBuIJdtmBKqQhOX
         AaenYZ+KBBrVfEZ0P4kQ7MTsDzH6h0hoyF1BnEOytaJOBR2nHQ4VDZxGrAAYlA45+qUV
         tcbArj5sSFRT61s4WWJxukKCWPz33DoXEpZlax/z9y9aD6gnnwW9aRp2uuPf4OVrkx5w
         kiHvCtqGWH+SU217bJjGku5YjNKShUvinn0/ojxRA14L294L6rklpsuypUZyglby9u6r
         9vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjD0ad3Fchgv49eB7byvv4ptPXNkvWx8OoZ16qhiOEI=;
        b=1Ndnqf4phR+ivNPsPDpWriYd8utpOn/hbkxT42GsWSlCSx4AHq7gL93dA/BVAX+GtE
         /nKvTm2aE3Eql6lZCMcO6xpkMWg6tNRDw3cvIfz6tC73ttrdjtsX5oGWMEB1aXS7pfWS
         Ym/XEHpNuvBWc0sBfRwPDv4c1ZczN7OJuynkKA+B2t5TwiaN4u1RVA1HM/tiFwLhi+SM
         ZBXJ9DjQx3m9SNy6cWb0eApAd/HksGwY2e2wKr+pob4k1dej/l33n8ivtYpNCgsOom+q
         TLbWAFsC1u5joh/ohNZzaMIRxGnT22tM8HDimCd1d2W7qWK1sfwrqKAzM1K+GI9N+eFV
         wCgg==
X-Gm-Message-State: AO0yUKWcjFJd5QxjAK11TFZKNN703zJkmtWzKJuve77Do9dfbm76lX+9
        cr/JeGGELpMM5eaJ6A4fUkp93En95vaNr8tHh/k=
X-Google-Smtp-Source: AK7set+9lNwzPX+bxl5Sn1JRej1ibTbtrltjOP54CGq19xe9SwVzlsz7ZKodJLOMR5m+lINSoLb+m/t9qpEgZb9Zyvc=
X-Received: by 2002:a67:f715:0:b0:412:4e02:ba9f with SMTP id
 m21-20020a67f715000000b004124e02ba9fmr2751018vso.1.1677611165453; Tue, 28 Feb
 2023 11:06:05 -0800 (PST)
MIME-Version: 1.0
References: <20230227140758.1575-1-kaehndan@gmail.com> <20230227140758.1575-4-kaehndan@gmail.com>
 <Y/03to4XFXPwkGH1@smile.fi.intel.com>
In-Reply-To: <Y/03to4XFXPwkGH1@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Tue, 28 Feb 2023 13:05:54 -0600
Message-ID: <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 27, 2023 at 5:07=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 27, 2023 at 08:07:58AM -0600, Danny Kaehn wrote:
> > Bind I2C and GPIO interfaces to subnodes with names
> > "i2c" and "gpio" if they exist, respectively. This
> > allows the GPIO and I2C controllers to be described
> > in firmware as usual. Additionally, support configuring the
> > I2C bus speed from the clock-frequency device property.
>
> A bit shorten indentation...
>
> Nevertheless what I realized now is that this change, despite being OF
> independent by used APIs, still OF-only.

I assumed this would practically be the case -- not because of the casing
reason you gave (wasn't aware of that, thanks for the FYI), but because it
doesn't seem that there's any way to describe USB devices connected to
a USB port in ACPI, at least as far as I can tell (ACPI is still largely a =
black
box to me). But it seems reasonable that we should try to use the interface
in a way so that it could be described using ACPI at some point (assuming
that it isn't currently possible).

>
> Would it be possible to allow indexed access to child nodes as well, so i=
f
> there are no names, we may still be able to use firmware nodes from the c=
orrect
> children?
>

Sure, you mean to fallback to using child nodes by index rather than by nam=
e
in the case that that device_get_named_child_node() fails?
Would we need to somehow verify that those nodes are the nodes we expect
them to be? (a.e. node 0 is actually the i2c-controller, node 1 is actually=
 the
gpio-controller).

I don't see a reason why not, though I am curious if there is
precedence for this
strategy, a.e. in other drivers that use named child nodes. In my initial s=
earch
through the kernel, I don't think I found anything like this -- does that m=
ean
those drivers also inherently won't work with ACPI?

The only driver I can find which uses device_get_named_child_node and has
an acpi_device_id is drivers/platform/x86/intel/chtwc_int33fe.c

> P.S. The problem with ACPI is that "name" of the child node will be in ca=
pital
> letters as it's in accordance with the specification.
>

Knowing that this is the limitation, some other potential resolutions
to potentially
consider might be:

- Uppercase the names of the child nodes for the DT binding -- it appears t=
hat
     the child node that chtwc_int33fe.c (the driver mentioned earlier) acc=
esses
     does indeed have an upper-cased name -- though that driver doesn't hav=
e
     an of_device_id (makes sense, x86...). It seems named child nodes are
     always lowercase in DT bindings -- not sure if that's a rule, or
just how it
     currently happens to be.
- Do a case invariant compare on the names (and/or check for both lowercase
     and uppercase)
- Remove the use of child nodes, and combine the i2c and gpio nodes into th=
e
    cp2112's fwnode. I didn't do this initially because I wanted to
avoid namespace
    collisions between GPIO hogs and i2c child devices, and thought
that logically
     made sense to keep them separate, but that was before knowing
this limitation
    of ACPI.

What are your / others' thoughts?

Thanks,

Danny Kaehn


> --
> With Best Regards,
> Andy Shevchenko
>
>
