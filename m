Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E776F3B0F
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 01:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbjEAXgI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 May 2023 19:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjEAXgH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 May 2023 19:36:07 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6047035A8;
        Mon,  1 May 2023 16:35:56 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-44087536177so2209442e0c.2;
        Mon, 01 May 2023 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682984155; x=1685576155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euxSyMvxBFyU9RLP6ccGBusb8Si0wVd55ZcdPkCQZxI=;
        b=C+HMyk7l4JobKewVRJyJq75E65vjXaQp1ZmZBI7gxJO/4f+MUkJQrm5CixkS7nh8jp
         A5zV1Zwhxhw84SK1O+AZb3Sw1TVUFB9lSoNzvM1V0EUO84edmsBd29EU5Dl97rZH2Yxx
         8Sfncl3HmFHNbA6o2iFUsbTfdeDNJ3OVQaQDx5sGRJuiW2TrEN/r5Lz8dPCbdHtTM+aX
         0OmncX6OOWyl14kXcXYHj6O48RLmFcPGLw4HslsMj+zWIaZ521Fn7Ls1gTKXOHymknMj
         3ZCIMBe3PFL6OlMtsuMJr6LyQjoPDZKgW9mTB1DQRKi/ZU1t0wi23X5nfn1SBXZ93bGh
         3WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682984155; x=1685576155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euxSyMvxBFyU9RLP6ccGBusb8Si0wVd55ZcdPkCQZxI=;
        b=AESqhoabF0CARGuLPoXOQYR430z5wVgOcuiCgY02POE4mQkYkZBtRALfkNwxUkpPW0
         ZxDKexrmUMLImBPNldbCZ0/L/tw0EqYQvR875svTX3D2yNCau1C8it6UuDHctAAqIHMn
         Cw4cWyyl8OwmjxFd1Uulwwz8/T+9G6S+J4RW4VmerEswzuxpQzVQscaWkaC5kU1qDjiU
         E169cLKwozRMXv26/WYzs/nz9c6I4WXgqH1eJPrTkGyYNx/EOntr5GEdV4aLYHVXu3SM
         73BgxSFf3WFBi02c/Wc7St/AwI8J/ksoMyh0tF4kBaL397jIX/gqBqvwKiizAflvsxyb
         w5dA==
X-Gm-Message-State: AC+VfDz44upk0zzc9P/GSpk+vzUm471bBxcnEhD2hvV0gZLkj9znjYrJ
        Wq4DmJe26NCA7RxFUPbKONaFles4KYO2GQb2X7PzQDVBAxU=
X-Google-Smtp-Source: ACHHUZ4nr6WXy6xT+Lrj/Z0tBTYDVspcNiIsIZ8mOL+r+epNJJgeoyQWHUrPYe+TTCBYFymNVg/KBt3VNNf/++WqzXE=
X-Received: by 2002:a05:6102:3bd3:b0:42e:29f4:cba6 with SMTP id
 a19-20020a0561023bd300b0042e29f4cba6mr6048156vsv.29.1682984155305; Mon, 01
 May 2023 16:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230319204802.1364-1-kaehndan@gmail.com> <20230319204802.1364-4-kaehndan@gmail.com>
 <ZBhYXwjPeRiZwxMT@smile.fi.intel.com> <ZBhY5Gp88gVK7q/g@smile.fi.intel.com>
 <CAP+ZCCc=q_=d18UHEZ9N8HVQ6AYQsTfNgS1r93UCJOB-OEodSw@mail.gmail.com> <ZBhoHzTr5l38u/kX@smile.fi.intel.com>
In-Reply-To: <ZBhoHzTr5l38u/kX@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Mon, 1 May 2023 18:35:44 -0500
Message-ID: <CAP+ZCCe3G_b3o=zWcqJNSFbs26yH6wzBbfHjkg2JuPeWgujfiQ@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 20, 2023 at 9:10=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 20, 2023 at 08:40:07AM -0500, Daniel Kaehn wrote:
> > On Mon, Mar 20, 2023 at 8:00=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Mar 20, 2023 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > > > On Sun, Mar 19, 2023 at 03:48:02PM -0500, Danny Kaehn wrote:
>
> ...
>
> > > > > +   device_for_each_child_node(&hdev->dev, child) {
> > > > > +           name =3D fwnode_get_name(child);
> > > > > +           ret =3D acpi_get_local_address(ACPI_HANDLE_FWNODE(chi=
ld), &addr);
> > > > > +
> > > > > +           if ((name && strcmp("i2c", name) =3D=3D 0) || (!ret &=
& addr =3D=3D 0))
> > > > > +                   device_set_node(&dev->adap.dev, child);
> > > > > +           else if ((name && strcmp("gpio", name)) =3D=3D 0 ||
> > > > > +                                   (!ret && addr =3D=3D 1))
> > > > > +                   dev->gc.fwnode =3D child;
> > > > > +   }
> > > >
> > > > Please, make addresses defined explicitly. You may also do it with =
node naming
> > > > schema:
> > > >
> > > > #define CP2112_I2C_ADR                0
> > > > #define CP2112_GPIO_ADR               1
> > > >
> > > > static const char * const cp2112_cell_names[] =3D {
> > > >       [CP2112_I2C_ADR]        =3D "i2c",
> > > >       [CP2112_GPIO_ADR]       =3D "gpio",
> > > > };
> > > >
> > > >       device_for_each_child_node(&hdev->dev, child) {
> > > >               name =3D fwnode_get_name(child);
> > > >               if (name) {
> > > >                       ret =3D match_string(cp2112_cell_names, ARRAY=
_SIZE(cp2112_cell_names), name);
> > > >                       if (ret >=3D 0)
> > > >                               addr =3D ret;
> > > >               } else
> > > >                       ret =3D acpi_get_local_address(ACPI_HANDLE_FW=
NODE(child), &addr);
> > > >               if (ret < 0)
> > > >                       ...error handling if needed...
> > > >
> > > >               switch (addr) {
> > > >               case CP2112_I2C_ADR:
> > > >                       device_set_node(&dev->adap.dev, child);
> > > >                       break;
> > > >               case CP2112_GPIO_ADR:
> > > >                       dev->gc.fwnode =3D child;
> > > >                       break;
> > > >               default:
> > > >                       ...error handling...
> > > >               }
> > > >       }
> > >
> > > Btw, don't you use "reg" property for the child nodes? It would be be=
tter from
> > > de facto used patterns (we have a couple of mode drivers that have a =
common
> > > code to read "reg" or _ADR() and that code can be split into a helper=
 and used
> > > here).
> > >
> >
> > Named nodes _seem_ to be preferred in DT for when there isn't a logical=
 /
> > natural numbering to the child nodes. A.e. for USB, reg is used to spec=
ify
> > which port, for I2C, which address on the bus, but for two parallel and
> > independent functions on the same device, it seems named nodes would ma=
ke
> > more sense in DT. Many examples exist in mainline where named nodes are=
 used
> > in DT in this way.
>
> Okay, I'm not an expert in the DT preferable schemas, so I believe DT peo=
ple
> should answer on this.
>

Hello,

Thanks for all the time spent reviewing this thus far. Following up to
see what my next steps might be.

It sounds like we might want some DT folks to weigh in on the strategy
used for identifying the child I2C and GPIO nodes for the CP2112
device before moving further toward applying this.

Since the DT list is on this thread (as well as Rob+Krzystof), and
this has sat for a little while, I'm assuming that the ball is in my
court to seek out an answer/opinion here. (I know folks get a lot of
email, so apologies if the correct move would have been to wait a bit
longer before following up! Not intending to be rude.)

Would it be appropriate / expected that I send a separate email thread
to the DT mailing list on their opinion here? Or would that create
more confusion/complexity in adding yet another thread? I did create a
separate email thread for the initial DT vs. ACPI conversation we had
about accessing children by name or index in a unified way due to the
differences in upper/lower case and use-cases, but that
(understandably) didn't seem to gain any traction.

Thanks for any insights!

Thanks,
Danny Kaehn

> > One example is network cards which provide an mdio bus
> > bind through the child "mdio". One example of a specifically a
> > child i2c controller being bound to "i2c" can be found in
> > pine64,pinephone-keyboard.yaml.
> > But it's certainly possible this isn't the desired direction moving for=
ward
> > in DT -- my opinion should definitely be taken with a grain of salt. Ma=
ybe
> > this is something I should follow up on with DT folks on that DT vs. AC=
PI
> > thread made earlier.
> >
> > One thing I did notice when looking at the mfd subsystem is that most D=
T
> > drivers actually match on the compatible string of the child nodes, a.e=
.
> > "silabs,cp2112", "silabs,cp2112-gpio".  "silabs,cp2112-i2c". We could
> > implement that here, but I think that would make more sense if we were =
to
> > actually split the cp2112 into mfd & platform drivers, and additionally=
 split
> > the DT binding by function.
>
> IIRC (but might be very well mistaken) the compatible strings for childre=
n
> are discouraged.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
