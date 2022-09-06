Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF0FD5AF267
	for <lists+linux-input@lfdr.de>; Tue,  6 Sep 2022 19:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbiIFR2E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Sep 2022 13:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233857AbiIFR1s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Sep 2022 13:27:48 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4803A470
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 10:19:05 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id h14so6307316ilh.10
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 10:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QfDvYdUdYp4IWhbJI3qOuZcjPKjhP7sYkjgPDUO+zHo=;
        b=WILT073FsTIu6roPPSq54BECUHVQJG+F4mk0L2/x7YxNrmkK+A71YpbAlPcFHowp/C
         76/s8aERPHUUhMle/CPWdkByS3hcrKfXf5kl+XetUWj6yefOIq3LFrM5Xw4rnTqtzXnt
         D+XwhZ/9x+8z92Y2QxWWSxJ8dWF2QEbV7X134=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QfDvYdUdYp4IWhbJI3qOuZcjPKjhP7sYkjgPDUO+zHo=;
        b=l7bIqMP4Yfbq985m6K676sA/YLDf0FPxrFsR2gHEgE7NdhHd88zs00rLX8+AivxJWZ
         Dg17sRqChiwy+yHF1cxy/+xud5kXO9AL0Z1mMnF2e4mxWzqelsPS9fWVu6pVoSFOHIEU
         PWOZ3L7rrgospSWutjUtCEjoP1KqSBLg+iz4gp7wXrUp60cMP/yodtotci3pGdPDUo6E
         l15HHH29FqcVTZkbibQ2G/80gwSTg5AFdkqc0ylT53On0wCrj5oTAjan0+uxRjUI+ESi
         0Gk+La5jdPB1Oz09JVBAwodmK76zmmg4abvN6oOf5Oavc1RDPT7cyfSbVAuLHEYHVFHv
         3abw==
X-Gm-Message-State: ACgBeo318w6a0tbvGUP+qsmuXAVXpMtYXrzSn5Ag3MXCiarlQCOFxY+V
        BTwokbJn1vQ9WihTpeH140wHS/Y/1HXrAA==
X-Google-Smtp-Source: AA6agR4geR242HEiNZEZM8qtUNkGQEBeKiTg+Rns5sg5dNVbpT58cgRx+tkUX5+xua6BYWITBzU+nw==
X-Received: by 2002:a05:6e02:198d:b0:2ec:d6c5:49e8 with SMTP id g13-20020a056e02198d00b002ecd6c549e8mr14022336ilf.187.1662484744541;
        Tue, 06 Sep 2022 10:19:04 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id v10-20020a056602058a00b006883f9641bbsm6150038iox.19.2022.09.06.10.19.01
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 10:19:01 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id y187so9530998iof.0
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 10:19:01 -0700 (PDT)
X-Received: by 2002:a05:6602:3cc:b0:678:eb57:5eb with SMTP id
 g12-20020a05660203cc00b00678eb5705ebmr24073719iov.125.1662484740728; Tue, 06
 Sep 2022 10:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220830231541.1135813-1-rrangel@chromium.org>
 <20220830171332.1.Id022caf53d01112188308520915798f08a33cd3e@changeid>
 <CAJZ5v0h10wrurjYG50dA+pCfRtNDqN=c8odQ0p6HJRnOyJh7KA@mail.gmail.com>
 <Yw+yqbaTi04Ydgkq@google.com> <Yw+zo9eUQM+T1eYZ@google.com>
 <CAHQZ30C0Q39cSxTcfu3+6ZNj7iuRE6pJpc9aPdreFt4MNHqZRQ@mail.gmail.com> <YxLg7t2wyPajh/rY@google.com>
In-Reply-To: <YxLg7t2wyPajh/rY@google.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Tue, 6 Sep 2022 11:18:49 -0600
X-Gmail-Original-Message-ID: <CAHQZ30BEksUMuwqkin8XtXxPpFR0havN-pqx6nSjzpA2wSdORw@mail.gmail.com>
Message-ID: <CAHQZ30BEksUMuwqkin8XtXxPpFR0havN-pqx6nSjzpA2wSdORw@mail.gmail.com>
Subject: Re: [PATCH 1/8] Input: elan_i2c - Use PM subsystem to manage wake irq
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,WEIRD_QUOTING
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 2, 2022 at 11:07 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Aug 31, 2022 at 08:17:23PM -0600, Raul Rangel wrote:
> > On Wed, Aug 31, 2022 at 1:16 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Wed, Aug 31, 2022 at 12:12:41PM -0700, Dmitry Torokhov wrote:
> > > > On Wed, Aug 31, 2022 at 08:01:12PM +0200, Rafael J. Wysocki wrote:
> > > > > On Wed, Aug 31, 2022 at 1:16 AM Raul E Rangel <rrangel@chromium.org> wrote:
> > > > > >
> > > > > > The Elan I2C touchpad driver is currently manually managing the wake
> > > > > > IRQ. This change removes the explicit enable_irq_wake/disable_irq_wake
> > > > > > and instead relies on the PM subsystem. This is done by calling
> > > > > > dev_pm_set_wake_irq.
> > > > > >
> > > > > > i2c_device_probe already calls dev_pm_set_wake_irq when using device
> > > > > > tree, so it's only required when using ACPI. The net result is that this
> > > > > > change should be a no-op. i2c_device_remove also already calls
> > > > > > dev_pm_clear_wake_irq, so we don't need to do that in this driver.
> > > > > >
> > > > > > I tested this on an ACPI system where the touchpad doesn't have _PRW
> > > > > > defined. I verified I can still wake the system and that the wake source
> > > > > > was the touchpad IRQ GPIO.
> > > > > >
> > > > > > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > > > >
> > > > > I like this a lot [...]
> > > >
> >
> > > > I also like this a lot, but this assumes that firmware has correct
> > > > settings for the interrupt... Unfortunately it is not always the case
> > > > and I see that at least Chrome OS devices, such as glados line (cave, chell, sentry,
> > > > ect) do not mark interrupt as wakeup:
> > > >
> > > > src/mainboard/google/glados/variants/chell/overridetree.cb
> > > >
> > > >                         chip drivers/i2c/generic
> > > >                                 register "hid" = ""ELAN0000""
> > > >                                 register "desc" = ""ELAN Touchpad""
> > > >                                 register "irq" = "ACPI_IRQ_LEVEL_LOW(GPP_B3_IRQ)"
> > > >                                 register "wake" = "GPE0_DW0_05"
> > > >                                 device i2c 15 on end
> > > >
> >
> > So the above entry specifies the `wake` register. This generates an
> > ACPI _PRW resource. The patch series will actually fix devices like
> > this. Today without this patch series we get two wake events for a
> > device. The ACPI wake GPE specified by the _PRW resource, and the
> > erroneous GPIO wake event. But you bring up a good point.
>


> Does this mean that the example that we currently have in coreboot
> documentation (Documentation/acpi/devicetree.md) is not correct:
>
> device pci 15.0 on
>         chip drivers/i2c/generic
>                 register "hid" = ""ELAN0000""
>                 register "desc" = ""ELAN Touchpad""
>                 register "irq" = "ACPI_IRQ_WAKE_LEVEL_LOW(GPP_A21_IRQ)"
>                 register "wake" = "GPE0_DW0_21"
>                 device i2c 15 on end
>         end
> end # I2C #0
>
> Doesn't in say that we have both GpioIrq and GPE wakeup methods defined
> for the same device?

Hrmm, yeah that is wrong and will cause duplicate wake events for the
device. I'll push a CL to clean up the documentation.

>
> >
> > I wrote a quick and dirty script (https://0paste.com/391849) to parse
> > the coreboot device tree entries. Open source firmware is great isn't
> > it? ;)
> >
> > $ find src/mainboard/google/ -iname '*.cb' | xargs awk -f touch.awk --
> > src/mainboard/google/eve/devicetree.cb
>
> ...
>
> > src/mainboard/google/sarien/variants/sarien/devicetree.cb
> > 1
> > chip drivers/i2c/generic
> > register "hid" = ""ELAN0000""
> > register "desc" = ""ELAN Touchpad""
> > register "irq" = "ACPI_IRQ_EDGE_LOW(GPP_B3_IRQ)"
> > register "probed" = "1"
> > device i2c 2c on end
> > end
> > Total Touchpad: 202
> > Total Wake: 195
> >
> > Out of all the touchpads defined on ChromeOS it looks like only 4
> > devices are missing a wake declaration. I omitted touchpanels because
> > ChromeOS doesn't use those as a wake source. chromeos_laptop.c already
> > defines some devices with i2c board_info and it sets the
> > `I2C_CLIENT_WAKE` flag. I'm not sure if this is actually working as
> > expected. `i2c_device_probe` requires a `wakeup` irq to be present in
> > the device tree if the `I2C_CLIENT_WAKE` flag is set, but I'm assuming
>
> No it does not. If there is no wakeup IRQ defined of_irq_get_byname()
> will return an error and we'll take the "else if (client->irq > 0)"
> branch and will set up client->irq as the wakeup irq.
>
> > the device tree was missing wake attributes.

Oh thanks for pointing that out. I might refactor patch #4 to just set
the `I2C_CLIENT_WAKE` flag when `acpi_wake_capable` is true.

>
> >
> > Anyway, patches 6, and 7 are the ones that drop the legacy behavior. I
> > can figure out how to add the above boards to chromeos_laptop.c and
> > get the wake attribute plumbed, or I can add something directly to the
> > elan_i2c_core, etc so others can add overrides for their boards there.
> > I'll also send out CLs to fix the device tree configs (not that we
> > would run a FW qual just for this change).
>
> My preference is to limit board-specific hacks in drivers if we can, so
> adding missing properties to chromeos_laptop.c would be my preference.

How should we handle non chromeos boards?

>
> Thanks.
>
> --
> Dmitry

Thanks!
