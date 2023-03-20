Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63736C13A6
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 14:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjCTNkZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 09:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjCTNkT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 09:40:19 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A504227;
        Mon, 20 Mar 2023 06:40:17 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id s1so10504127vsk.5;
        Mon, 20 Mar 2023 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679319616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkAa9Rg7+gEbROnuFiTTZXiHSDa+ELHN4dq6sNy3AKQ=;
        b=jKN/xoRyF0HlH8OOc8+S5NXT1KIhaiP+9ht7qHJ5kvAw3GFPT52UOEQx74qXwqnT77
         DqnkmHfZGVH9yqRVB9KxVUZI+Ei3tFktEPVu+fESzSroIw3Q+5Ydno5wU8mxw6NiRHDe
         2o3FbOyAZKNRgJ6Nn+Amat7i/y960EHIeg5g3BKCJvhOfP23dakGRVXKmsLcHZqYwItC
         fW/ZO8ZYiyONP5jwW3mik0jrHRPHUJzOloKjeTWa9ba+9pjFw98UPGOMZ4Agh7y7mnPa
         jQKLNENQdMobStbnsC99Vlx8l5Ha7EyvFBILe4min9m/P/i7mMg3XzQj2lIqpvJyQdv8
         29Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679319616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkAa9Rg7+gEbROnuFiTTZXiHSDa+ELHN4dq6sNy3AKQ=;
        b=fSwQdRHKfLOtV30OheNAV7BF5j+K0MEkFOP14+HAHfWHyQ5FgmEMe0CAi9UIWiDmwE
         CoD6+8hCcEg3xWX/mQZZ5pVB28JSV0QUW1C+JjE4Lwas+YIZnIOMMPqzGkmigMJrc9+P
         wfDCGiHhQOVlIbTQome7C11SxSuNFrE6/e1ZI/Af7U9KFRX0Z7Z/4rV/INcIIBzNFVNT
         lpq2CWHs0pQ71GsZDMiyO4Vk9yz7O2BOvYNRINAYfabDRoh58hzupIv85Sgu00gPVRmN
         Wz1Xah346xsuzArrBhiDRx4sgYX+30sgpeDQ/4IVNqE1IvJxBcpc5S10hUATViP0popq
         3M1Q==
X-Gm-Message-State: AO0yUKWoiLyihLL7KSNv8LJKXKYsHR03ifFGzDJrSV+nvQH0Ol4lbCtO
        rc5IN0hNTWUfahIFyRE6pL6fc+8L5HKtBtnPssY=
X-Google-Smtp-Source: AK7set/0jW9R/bupB56Gi6g9rdP22UBRhR09j+GWuEbHj5WU4WJTWmoBMjPhlvRTC4PCfGwYOlnmmHKlYsREMqUB5LU=
X-Received: by 2002:a67:d508:0:b0:412:5424:e58e with SMTP id
 l8-20020a67d508000000b004125424e58emr4166830vsj.0.1679319616409; Mon, 20 Mar
 2023 06:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230319204802.1364-1-kaehndan@gmail.com> <20230319204802.1364-4-kaehndan@gmail.com>
 <ZBhYXwjPeRiZwxMT@smile.fi.intel.com> <ZBhY5Gp88gVK7q/g@smile.fi.intel.com>
In-Reply-To: <ZBhY5Gp88gVK7q/g@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Mon, 20 Mar 2023 08:40:07 -0500
Message-ID: <CAP+ZCCc=q_=d18UHEZ9N8HVQ6AYQsTfNgS1r93UCJOB-OEodSw@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] HID: cp2112: Fwnode Support
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 20, 2023 at 8:00=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 20, 2023 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > On Sun, Mar 19, 2023 at 03:48:02PM -0500, Danny Kaehn wrote:
>
> ...
>
> > > +   device_for_each_child_node(&hdev->dev, child) {
> > > +           name =3D fwnode_get_name(child);
> > > +           ret =3D acpi_get_local_address(ACPI_HANDLE_FWNODE(child),=
 &addr);
> > > +
> > > +           if ((name && strcmp("i2c", name) =3D=3D 0) || (!ret && ad=
dr =3D=3D 0))
> > > +                   device_set_node(&dev->adap.dev, child);
> > > +           else if ((name && strcmp("gpio", name)) =3D=3D 0 ||
> > > +                                   (!ret && addr =3D=3D 1))
> > > +                   dev->gc.fwnode =3D child;
> > > +   }
> >
> > Please, make addresses defined explicitly. You may also do it with node=
 naming
> > schema:
> >
> > #define CP2112_I2C_ADR                0
> > #define CP2112_GPIO_ADR               1
> >
> > static const char * const cp2112_cell_names[] =3D {
> >       [CP2112_I2C_ADR]        =3D "i2c",
> >       [CP2112_GPIO_ADR]       =3D "gpio",
> > };
> >
> >       device_for_each_child_node(&hdev->dev, child) {
> >               name =3D fwnode_get_name(child);
> >               if (name) {
> >                       ret =3D match_string(cp2112_cell_names, ARRAY_SIZ=
E(cp2112_cell_names), name);
> >                       if (ret >=3D 0)
> >                               addr =3D ret;
> >               } else
> >                       ret =3D acpi_get_local_address(ACPI_HANDLE_FWNODE=
(child), &addr);
> >               if (ret < 0)
> >                       ...error handling if needed...
> >
> >               switch (addr) {
> >               case CP2112_I2C_ADR:
> >                       device_set_node(&dev->adap.dev, child);
> >                       break;
> >               case CP2112_GPIO_ADR:
> >                       dev->gc.fwnode =3D child;
> >                       break;
> >               default:
> >                       ...error handling...
> >               }
> >       }
>
> Btw, don't you use "reg" property for the child nodes? It would be better=
 from
> de facto used patterns (we have a couple of mode drivers that have a comm=
on
> code to read "reg" or _ADR() and that code can be split into a helper and=
 used
> here).
>

Named nodes _seem_ to be preferred in DT for when there isn't a
logical / natural
numbering to the child nodes. A.e. for USB, reg is used to specify
which port, for I2C,
 which address on the bus, but for two parallel and independent
functions on the same
device, it seems named nodes would make more sense in DT. Many examples exi=
st
in mainline where named nodes are used in DT in this way. One example
is network cards
which provide an mdio bus bind through the child "mdio". One example
of a specifically a
child i2c controller being bound to "i2c" can be found in
pine64,pinephone-keyboard.yaml.
But it's certainly possible this isn't the desired direction moving
forward in DT -- my opinion
should definitely be taken with a grain of salt. Maybe this is
something I should follow up on
with DT folks on that DT vs. ACPI thread made earlier.

One thing I did notice when looking at the mfd subsystem is that most
DT drivers actually
match on the compatible string of the child nodes, a.e.
"silabs,cp2112", "silabs,cp2112-gpio".
"silabs,cp2112-i2c". We could implement that here, but I think that
would make more sense if
we were to actually split the cp2112 into mfd & platform drivers, and
additionally split the DT
binding by function.

Thanks,

Danny Kaehn
