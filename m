Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E525B8EF6
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 20:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiINSkn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 14:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiINSkm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 14:40:42 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B37786DA
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 11:40:41 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id d16so8460872ils.8
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vSj623uSHxO0oVI/Q9wO/OKZArt2x1BaVoPyjdenhVw=;
        b=be+8kTLNJULJ2PK8PDlYNxkvOH9mMmtB2rahv3H4TKnEDphAAkmXCOE/IJeod6Hn7s
         5bfrqzY55uo+WMDgfUuRTLnl3LQV0KqxaKo9Hoaec6URvxcr4+Uuej3n9eNHdHp4OrQy
         hhupSd3M3qkMCC7pUEhaLICCpyPOIsfS/nENA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vSj623uSHxO0oVI/Q9wO/OKZArt2x1BaVoPyjdenhVw=;
        b=M7q4S/CHG3pvNCRZjKdmeonkLjALv0TyLUuQsHCKnjy4oFUMMVs7JDXaUP74ivvaVY
         fqT5pehZzhiVxhNSqugAK3guLg6t7gGh9tH1hqQONjAqXNlrUvmWrRTHS/hK6VdwiD4k
         zoNW4cOGBWClkX32MHtR+Rc0JkMDZ14luuobFpjHx1tpqJQbemDx8XhbBlNEGdKG8hqk
         Hxumy8RbBsPvPAllBcTdl5i7w5avhCVlcUCAAalYF0ctc3mRvDfvub3BAL0Uyfy/9oS8
         W/SNMxcJIe7zMFqqHL7pBiBf7IRL01DjbBJZzbdB3bOfBsGxzk2Q11KF4H3KY8pO3ifp
         Wvdg==
X-Gm-Message-State: ACgBeo3PORIEmCzrHYxYFxokDGGzYme5nSvqCk2BRRU+lUMaqXbdfA1P
        ebr7Xj9+oiMrym92zE+i0sCD4E79cL27+Q==
X-Google-Smtp-Source: AA6agR4gH/pK3RxT+OvbZSDBAwKtvXmJzKHq8ig4VbS1OIynOAbx2/0Evi56vOMnu75Ulm406XlsiA==
X-Received: by 2002:a05:6e02:1448:b0:2f3:6087:128c with SMTP id p8-20020a056e02144800b002f36087128cmr12512315ilo.196.1663180840851;
        Wed, 14 Sep 2022 11:40:40 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id c66-20020a029648000000b0035670a71fcbsm7499934jai.64.2022.09.14.11.40.40
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 11:40:40 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id x2so2198363ill.10
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 11:40:40 -0700 (PDT)
X-Received: by 2002:a05:6e02:2189:b0:2f1:92d4:6b22 with SMTP id
 j9-20020a056e02218900b002f192d46b22mr14224475ila.210.1663180409089; Wed, 14
 Sep 2022 11:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YyC9N62JaMGaeanf@smile.fi.intel.com> <CAHQZ30DAr_BwH03=bG9tfCSGW+-he-c-4PPeJMOqH28cVcKDoA@mail.gmail.com>
 <YyDNAw+ur177ayY0@smile.fi.intel.com> <CAHQZ30DP1asiMj7hoebQQvGqE36sBDjaFmp3ju3eUEF1PruFeg@mail.gmail.com>
 <YyGh6Yjbb/5rkh35@smile.fi.intel.com>
In-Reply-To: <YyGh6Yjbb/5rkh35@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 14 Sep 2022 12:33:17 -0600
X-Gmail-Original-Message-ID: <CAHQZ30Dsk2ikhctYSk_eP=1qcOOn_tjgtCftPOqQFkHNfQwBsg@mail.gmail.com>
Message-ID: <CAHQZ30Dsk2ikhctYSk_eP=1qcOOn_tjgtCftPOqQFkHNfQwBsg@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> > > This is similar to what of_i2c_get_board_info() does, no?
> > > Note: _get_ there.
> >
> > `*info` is an out parameter in that case. Ideally I would have
> > `i2c_acpi_get_irq`, `acpi_dev_gpio_irq_get_wake`,
> > `platform_get_irq_optional`, and `i2c_dev_irq_from_resources` all
> > return a `struct irq_info {int irq; bool wake_capable;}`. This would
> > be a larger change though.
>
> Seems the ACPI analogue is i2c_acpi_fill_info(). Can we do it there?
>

So I originally had that thought, but decided against it to avoid
changing too many things,
but since you brought it up, I thought I would try it.

So I moved the GPIO lookup into `i2c_acpi_do_lookup`, but it failed
spectacularly.
I've linked some logs of both cases. grep for `RX:` to see my logging messages.

* https://0paste.com/393416 - Logs with IRQ lookup happening in
`i2c_acpi_do_lookup`
    * We can see that `i2c_acpi_do_lookup` gets called in three cases
         1) Early on from i2c_acpi_notify when the I2C ACPI nodes are
first created
         2) From `i2c_dw_adjust_bus_speed` as part of `dw_i2c_plat_probe`
         3) From `i2c_register_adapter` as part of `i2c_dw_probe_master`.
    * What happens is that all of these calls happen before the GPIO
chip has been registered.
      This means that `acpi_dev_gpio_irq_get` will return `-EPROBE_DEFER`. This
      messes something up in the i2c init sequence and the devices are never
      probed again.
    * You can see the `amd gpio driver loaded` message after all the
i2c probing.
* https://0paste.com/393420 - Logs of a normal boot
    * Here we can see the GPIO controller registers early
    * We can see the i2c devices being probed by `__driver_attach_async_helper`.
      I'm guessing the device was enqueued as part of `i2c_acpi_register_device`
      early on and it gets probed later.

I could try moving the gpio lookup into `i2c_acpi_get_info`, but I
think that suffers from the
same problem, the stack can't handle a PROBE_DEFER. So I think we need to keep
the lookup in `i2c_device_probe` for the PROBE_DEFER logic to work correctly.
