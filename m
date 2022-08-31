Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BA25A7D53
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 14:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbiHaMbN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Aug 2022 08:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbiHaMbL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Aug 2022 08:31:11 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A0EA7AA8
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:31:08 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b44so18151118edf.9
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=y4Iko6VOfqdALqNvGe8IGVmEMQm/yOwNp3t6l5nVKpM=;
        b=KArPAOXPBne8d1PvagOV1OLuMcPiU5xdh98zr5jkpr3g/JY26DkqPeo0NCUhMQfwfN
         SwMj3jgY6nLaSom8b3pvzB6cmfDzG6DCe/TfT/HOJ8fmXD0ZmY8JX0rpN3KpddEPlflx
         6SBsKxPU+SmdSb5FoG/c8HNDo1qaO02GneUADXrLS76vO+50za/3htDAQMibgeOKq5a1
         Xk5tCfdtHEBR5lWbzscJSab3H2AM+LUv7nmBxK6tx6PAWazzvJb7rS7TbRZL7+AY8THZ
         G3ujWwFyPlpZxmwGx9/o5kHukuxcD4HeclBJRveIHl3/aHXgn1I95z1BU6iSoI//HIeu
         Pn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=y4Iko6VOfqdALqNvGe8IGVmEMQm/yOwNp3t6l5nVKpM=;
        b=5+gPswAMZ7kZeBtMK1Q7O6qvu/x9ubeL+McdbfIS1kxyh8X87T7gOD41gE2r0aTMMS
         TzCCnfrEYwGs8BQGPBDAdReFehELd7mtUFNBSf00EYfyVBRCQpOTAaQci/y+YRSWl+GA
         ZdQ9Q0DcPKNgMmHkpe/tNRqRUolTG/jscjVvQu8YXzZeqeM0CxnlH7lJppiMbtcrPCvr
         x4fH47i4WDREioDdpx0+fSbEBUoWH9/0MNsCkpvVr+T8fsGQ+H+4BS4XVKrSwYGkfg6k
         Cuc8VdpXF6FaCBoAujzZjxcGhbdX4+6nTn6ujtyhor4DRiv0g9feAHI3s9xdOxgIlgBe
         0QNQ==
X-Gm-Message-State: ACgBeo3qVlpn4VxYVOrrSeIdDjJ/4szhqoU5f1ak9NzCKW06rUWOrAxK
        N3aIqihZ9JiNEtz0Y3KAgOsM/8Pbv+LE5bcFsOTszg==
X-Google-Smtp-Source: AA6agR6txhvb9leWWF1AGPDaJnHg1dC+M4a6DSiKjvOAQLe5QXSqRRpHss+5ThXkn9C2E8ZFyNoCDWJ6lDjEibTPcRA=
X-Received: by 2002:aa7:c84f:0:b0:446:2bfb:5a63 with SMTP id
 g15-20020aa7c84f000000b004462bfb5a63mr24602948edt.172.1661949067558; Wed, 31
 Aug 2022 05:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220721080423.156151-1-nuno.sa@analog.com> <20220721080423.156151-2-nuno.sa@analog.com>
 <CACRpkdas=ENpdkQbc-1LOG_zRroo4dAFgMfmVzd4=ZK_6jRuRA@mail.gmail.com> <SJ0PR03MB67784611071F013DC8F904D199789@SJ0PR03MB6778.namprd03.prod.outlook.com>
In-Reply-To: <SJ0PR03MB67784611071F013DC8F904D199789@SJ0PR03MB6778.namprd03.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:30:56 +0200
Message-ID: <CACRpkdYAoSp_Sj=E-A8jEOgnse7ewYeoD_W-_rKYncjQVa9O9Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 31, 2022 at 2:28 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
>
> > From: Linus Walleij <linus.walleij@linaro.org>
> > Sent: Wednesday, August 31, 2022 2:24 PM
> > To: Sa, Nuno <Nuno.Sa@analog.com>
> > Cc: linux-input@vger.kernel.org; linux-gpio@vger.kernel.org;
> > devicetree@vger.kernel.org; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Hennerich, Michael
> > <Michael.Hennerich@analog.com>; Bartosz Golaszewski
> > <brgl@bgdev.pl>; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > Rob Herring <robh+dt@kernel.org>; Dmitry Torokhov
> > <dmitry.torokhov@gmail.com>
> > Subject: Re: [PATCH v3 01/10] input: keyboard: adp5588-keys: support
> > gpi key events as 'gpio keys'
> >
> > [External]
> >
> > On Thu, Jul 21, 2022 at 10:03 AM Nuno S=C3=A1 <nuno.sa@analog.com>
> > wrote:
> >
> > > This change replaces the support for GPIs as key event generators.
> > > Instead of reporting the events directly, we add a gpio based irqchip
> > > so that these events can be consumed by keys defined in the gpio-
> > keys
> > > driver (as it's goal is indeed for keys on GPIOs capable of generatin=
g
> > > interrupts). With this, the gpio-adp5588 driver can also be dropped.
> > >
> > > The basic idea is that all the pins that are not being used as part o=
f
> > > the keymap matrix can be possibly requested as GPIOs by gpio-keys
> > > (it's also fine to use these pins as plain interrupts though that's n=
ot
> > > really the point).
> > >
> > > Since the gpiochip now also has irqchip capabilities, we should only
> > > remove it after we free the device interrupt (otherwise we could, in
> > > theory, be handling GPIs interrupts while the gpiochip is concurrentl=
y
> > > removed). Thus the call 'adp5588_gpio_add()' is moved and since the
> > > setup phase also needs to come before making the gpios visible, we
> > also
> > > need to move 'adp5588_setup()'.
> > >
> > > While at it, always select GPIOLIB so that we don't need to use #ifde=
f
> > > guards.
> > >
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> >
> > Is there any input-related content in the driver after this or
> > should the whole driver just be moved over to drivers/gpio
> > and replace the old GPIO driver that you delete in patch
> > 2?
> >
>
> Hi,
>
> Yes there is... The main usage for the device is to use it as a
> matrix keypad. However, all the keys that are not used will be then
> exposed through a gpiochip to be consumed for example by gpio-keys

OK then, just checking. Let's keep it here for now, consider the MFD
approach suggested by Andy (splitting out the gpio chip and input
parts in two files in drivers/gpio and drivers/input) for the long run.

Yours,
Linus Walleij
