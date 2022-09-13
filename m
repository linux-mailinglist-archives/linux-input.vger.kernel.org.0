Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADEAC5B7725
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 19:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbiIMRBx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 13:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiIMRBK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 13:01:10 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F67E8D3C0
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 08:52:05 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id k2so6460798ilu.9
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=CGLCtRbWwRCAf6WmqGJBYksHAfnT5oX5xIBwMzUyvqg=;
        b=Gjb/1drlC0T1KT6qKQp+EOjvuce3jT3ddBuZmCIhUCD1JjfynIXluqq+ydAE0YYAmG
         p+5JnSpv26BEqUDuJzeFgV+cDv+pcrHfjXDLRRItnLSsP1xlI5YcJEZJ7pEhDX8zjIh3
         cRbSM6dRKjNE1AtZwiNsW22tXNeNU6ZbagvXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CGLCtRbWwRCAf6WmqGJBYksHAfnT5oX5xIBwMzUyvqg=;
        b=EPuwEMC00Mf3ogxuFIeVQhKUYOo5nPkFOigpj7XzKDZElRy07J9q/3Nznw8mbogBir
         7SvzEhAbajE4RoXFvSv7fHibSb22U1MWgBGc5LzdAo6BsFDerXElRHn4rJJqLQu6nnix
         ruNKVajN2k/dx7WChqjbuVRVQrXNMHdvzEFVg0AgLBDLpayalTpSrQPgGxZQnAu6jEq9
         68l31dfMCaEP7Kc/KxkVjLxN+Qa70NYBHLwXtUTrHCHVaoBoMBiWQc6jfC8ViLeh2/d2
         B0ryqR2+4hgey92paRQk00uxYxt2tOaSbVaYlrebosUlmuq97Kh6Dd+6SWp1Lbx8X5Xu
         RFFg==
X-Gm-Message-State: ACgBeo1mlA+x3m6j2MCWh63QoyMZKJeMlGsg+7kHCTR6pff4fH4hBoR8
        K9AmwlEDv6BvcuYAERm2O1ApQMijIhbD1w==
X-Google-Smtp-Source: AA6agR6YXK+2JiVJ+0O3FwRQG2IKK1+7mvCGH6jcdvdIgVLFkzMgzPrBuv+ec9IWtVkdEcDcbCxpiA==
X-Received: by 2002:a05:6e02:1b86:b0:2f1:76ec:4b91 with SMTP id h6-20020a056e021b8600b002f176ec4b91mr13172075ili.191.1663084321698;
        Tue, 13 Sep 2022 08:52:01 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id t9-20020a025409000000b003566ff0eb13sm5722744jaa.34.2022.09.13.08.52.00
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 08:52:00 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id x2so203792ill.10
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 08:52:00 -0700 (PDT)
X-Received: by 2002:a05:6e02:12a8:b0:2ea:f53a:2d06 with SMTP id
 f8-20020a056e0212a800b002eaf53a2d06mr12701463ilr.223.1663084320106; Tue, 13
 Sep 2022 08:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid> <YyAxBtAD2wL91quT@shikoro>
In-Reply-To: <YyAxBtAD2wL91quT@shikoro>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Tue, 13 Sep 2022 09:51:48 -0600
X-Gmail-Original-Message-ID: <CAHQZ30Dw8XvNyok-BJ=oQEROC+Z6hfK8D93YHS4v-KGZymNXZw@mail.gmail.com>
Message-ID: <CAHQZ30Dw8XvNyok-BJ=oQEROC+Z6hfK8D93YHS4v-KGZymNXZw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
To:     Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
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

On Tue, Sep 13, 2022 at 1:28 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Mon, Sep 12, 2022 at 04:13:11PM -0600, Raul E Rangel wrote:
> > Device tree already has a mechanism to pass the wake_irq. It does this
> > by looking for the wakeup-source property and setting the
> > I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> > ACPI interrupt wake flag to determine if the interrupt can be used to
> > wake the system. Previously the i2c drivers had to make assumptions and
> > blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > If there is a device with an Active Low interrupt and the device gets
> > powered off while suspending, the interrupt line will go low since it's
> > no longer powered and wakes the system. For this reason we should
> > respect the board designers wishes and honor the wake bit defined on the
> > interrupt.
>
> I'll let the I2C ACPI maintainers deal with the technical details
> because they are the experts here, yet one minor thing hits my eye:
>

> > +             irq_ctx.irq = acpi_dev_gpio_irq_get_wake(
> > +                     adev, 0, &irq_ctx.wake_capable);
>
> That line split looks weird with the open parens at the end of line 1.
>
Ah, looks like I missed `clang-format` on that line. I can fix it in
the next revision.

Thanks
