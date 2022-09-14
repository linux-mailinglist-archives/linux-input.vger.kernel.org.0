Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7755B8BC1
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 17:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiINP04 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 11:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbiINP0w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 11:26:52 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA307E31E
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 08:26:51 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id s9so8874408qkg.4
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8sVnRYf4lRZtHclJFM/PYgijezwVHsVwJUa/M1F9Nfw=;
        b=aU+pRvep+sXGVRr01+jPV7M1KGeUuIOdGm/7Imgv2e35rdbyXzmARUq1pX7NbUK31d
         P7JnZtuwOHE1Y3V+NSrCkrjcfy/IVgYVBkLzYROVFEJ2rN4QRKzlug+IhDRBgsnblfD/
         z6gvdEo890XqggiMeBDVIPT5KAcHLF/iLDo5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8sVnRYf4lRZtHclJFM/PYgijezwVHsVwJUa/M1F9Nfw=;
        b=OS1f/Jc9Sdm96nNOs1Hnjx/wbggi5dqedp3vpmB0H2mUztFLd9/QD11Ki7ifLqpNyz
         EA8GLpf+3RPV/AUl6eFs2SF5NV79ZZ/e+dJTGUVYPnbnKxxhqsXeM2VLSTwoDcr2zqEv
         3bv+rqyp1deSYwmVhGldGvRe+thXd3JbQnHLQO1s5HeiIAiZPHtw2GDbVUA2LmGk6UgC
         gCj4esN0sJPRlE53lW+y4GPJTl082Dyk6gHVCrKvU101BxKYEgvx0XsoopU0oHbtH4Fm
         +s6U6QJpGkegFCtr5u4KI+Zt0ClatFdnZIUAwsbaHbwE3PYTsoHopcNRADC7YVM/pBqe
         OkAg==
X-Gm-Message-State: ACgBeo2NShqprvZ9xgttS9822vCi4FZkwDvvKoHIFIFkCaR65P44eff1
        lbpesGmqFgBkj1chf1aG1iCjdqtSVi0x+w==
X-Google-Smtp-Source: AA6agR6CyM0RS0qCkTyButesq8TnTyIH0EolyWFEb7kz8gdG9PwgtX69vkjRNqdmN188o5Uyvun9Cg==
X-Received: by 2002:a05:620a:254f:b0:6bb:dcb6:4279 with SMTP id s15-20020a05620a254f00b006bbdcb64279mr27736361qko.79.1663169210039;
        Wed, 14 Sep 2022 08:26:50 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id w4-20020ac86b04000000b00343057845f7sm1728619qts.20.2022.09.14.08.26.49
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 08:26:49 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id g2so8295889qkk.1
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 08:26:49 -0700 (PDT)
X-Received: by 2002:a02:9509:0:b0:349:b6cb:9745 with SMTP id
 y9-20020a029509000000b00349b6cb9745mr18869971jah.281.1663168880396; Wed, 14
 Sep 2022 08:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.5.I4ff95ba7e884a486d7814ee888bf864be2ebdef4@changeid> <YyFs5q67RYR2aAy7@black.fi.intel.com>
In-Reply-To: <YyFs5q67RYR2aAy7@black.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 14 Sep 2022 09:21:08 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CU2-YtOfGYXJq3c=-1ttyw=hKZvViOfWGAKkxXO1C5Gw@mail.gmail.com>
Message-ID: <CAHQZ30CU2-YtOfGYXJq3c=-1ttyw=hKZvViOfWGAKkxXO1C5Gw@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] gpiolib: acpi: Add wake_capable parameter to acpi_dev_gpio_irq_get_by
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "David S. Miller" <davem@davemloft.net>,
        David Thompson <davthompson@nvidia.com>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>,
        Lu Wei <luwei32@huawei.com>, Paolo Abeni <pabeni@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        netdev@vger.kernel.org
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

On Tue, Sep 13, 2022 at 11:55 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Sep 12, 2022 at 04:13:09PM -0600, Raul E Rangel wrote:
> > +int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name,
> > +                          int index, int *wake_capable)
>
> Here too bool.

I've incorporated both of your suggestions. I instead added
`acpi_dev_gpio_irq_wake_get_by` as the basic function and left
`acpi_dev_gpio_irq_get_by` the same. THis way I don't have to update
any of the callers.
