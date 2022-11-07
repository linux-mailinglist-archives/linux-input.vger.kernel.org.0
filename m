Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 989E761FDC7
	for <lists+linux-input@lfdr.de>; Mon,  7 Nov 2022 19:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiKGSmS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Nov 2022 13:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbiKGSmR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Nov 2022 13:42:17 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCBDCFB
        for <linux-input@vger.kernel.org>; Mon,  7 Nov 2022 10:42:15 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id v81so7299723vkv.5
        for <linux-input@vger.kernel.org>; Mon, 07 Nov 2022 10:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/yoRrsDL4rjZUsiXxqy6NkYQLHd5ebMM1o8RAy5KU7k=;
        b=Esfsrl296DK0gl8bWsolF/ZyGX0HPlftAEWIoja/4VX/5Q6Kcx1dlwnI5YXcw55HQP
         RXXZ9jJcIW+a7KYCQyZ9OE8qexU2K0Rz/STr7a0eVefP+Uhg6arVNVzfK17vesBxIsZf
         9xVhEy4I+4Gm4qroCe+CNKqgak+NCJAvddY8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yoRrsDL4rjZUsiXxqy6NkYQLHd5ebMM1o8RAy5KU7k=;
        b=beRmMbXOpjZqoHxZnui0QSCT1gV1gNWGffgYcYnO1YWgxIA0wwwPlRWBH4N+jMou89
         2O7HJpXBNsCbBYqW6QOjsn4+zgje76UsQdEufnGtn5mRj702y+gyNMY/fV4etSWhhCMP
         Ml1mv2Qhbx0lNKXp+yW8WGEXUiJ5CtL0o5D4ZnKthESyrztWoJDGAaulvxpGZGQj57xU
         wARLNswGGsL5zKFYWzQZ81NKOW1a8B7EqmcHGAGpcKPsdOt4AhloUDgGEbvau83JSL3T
         6q8VSf1aRIKjm0sT2YQWOxlO6hf/fRzuoQK9HzrC6pyZJZmSR3q4Mbukgyi937ezgIH7
         yZmA==
X-Gm-Message-State: ACrzQf0v0vOZ87qpSDZjGSEJ9R4ZtcF6vLnaASPNCajOnQO9lf7ejP/B
        dSB0/jY5ZzhgbMeVGinb9t5TJ1vW0nSuBg==
X-Google-Smtp-Source: AMsMyM7Pxcds2WlDTf2CmtPlddEd/9tcpIKE+N8msgu/5LjCItKsZXY5gi9yBqhHvpnCD8BipuULXA==
X-Received: by 2002:a1f:9fd3:0:b0:3ab:c8e4:f15e with SMTP id i202-20020a1f9fd3000000b003abc8e4f15emr27039611vke.1.1667846534529;
        Mon, 07 Nov 2022 10:42:14 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a77-20020a1f9850000000b003b24d546ed0sm948357vke.12.2022.11.07.10.42.14
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:42:14 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id e2so7295718vkd.13
        for <linux-input@vger.kernel.org>; Mon, 07 Nov 2022 10:42:14 -0800 (PST)
X-Received: by 2002:aa7:8d17:0:b0:560:485a:e242 with SMTP id
 j23-20020aa78d17000000b00560485ae242mr51617419pfe.31.1667846178911; Mon, 07
 Nov 2022 10:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20220929161917.2348231-1-rrangel@chromium.org>
 <20220929093200.v6.6.I8092e417a8152475d13d8d638eb4c5d8ea12ac7b@changeid>
 <CAJZ5v0izHjb8vE0ALyYo9yMOExdpCzG8f7-d5SpQnftqJfTEig@mail.gmail.com>
 <CAHQZ30CJyhPK-OriZ5NZ=GjwNbofaCW6GZ_CvPsL0WiJGsxs-Q@mail.gmail.com>
 <CAJZ5v0gcJRoMSODbTevRdK1zaEZHJcPxvG6XMy9-T_jvwxPFBw@mail.gmail.com>
 <CAHQZ30CQd-0YnQgYG_OJVWn9_aUjvDAuT_DRGsxQF-q+bjr5BA@mail.gmail.com>
 <YzYowYJpRTImmg4m@google.com> <CAJZ5v0i+QYcMuqsK9y6qy9qzJdUp503Sidr1e4V_ROyumLKCsw@mail.gmail.com>
 <YzcqdTxLMF5028yz@smile.fi.intel.com> <YzcthIfnpi8E6XVk@google.com>
 <CAJZ5v0iKXWBGYPmmg9__g3oHK2GhY+xFMnSA6c5KctOv2kTfNQ@mail.gmail.com> <CAHQZ30D0NmVytkmiVYYZdGMEOChsO93hYRrG6SNbFiRO4S=YGA@mail.gmail.com>
In-Reply-To: <CAHQZ30D0NmVytkmiVYYZdGMEOChsO93hYRrG6SNbFiRO4S=YGA@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 7 Nov 2022 11:36:07 -0700
X-Gmail-Original-Message-ID: <CAHQZ30D-vBHQG9tDXy_upKHzfFMA9ttUT72K4hqKNS+CtEek3w@mail.gmail.com>
Message-ID: <CAHQZ30D-vBHQG9tDXy_upKHzfFMA9ttUT72K4hqKNS+CtEek3w@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Len Brown <lenb@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Terry Bowman <terry.bowman@amd.com>, Tom Rix <trix@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev, Alexis Savery <asavery@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 17, 2022 at 8:53 AM Raul Rangel <rrangel@chromium.org> wrote:
>
> On Sat, Oct 15, 2022 at 10:56 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Fri, Sep 30, 2022 at 7:55 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Fri, Sep 30, 2022 at 08:42:13PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 30, 2022 at 07:13:37PM +0200, Rafael J. Wysocki wrote:
> > > > > On Fri, Sep 30, 2022 at 1:22 AM Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > ...
> > > >
> > > > > I think that patches [5-8/13] from this series are significant
> > > > > framework changes, so it would make sense to route them via the ACPI
> > > > > tree.
> > > > >
> > > > > If this is fine with everybody, I will queue them up for merging into
> > > > > 6.1 (probably in the second half of the upcoming merge window).
> > > >
> > > > I believe it's fine from GPIO ACPI perspective (there shouldn't be conflict,
> > > > but if you wish you always may take this PR [1] to your tree (it's already in
> > > > GPIO tree pending v6.1), it may be considered as immutable tag.
> > > >
> > > > [1]: https://lore.kernel.org/linux-gpio/Yym%2Fj+Y9MBOIhWtK@black.fi.intel.com/
> > >
> > > Yeah, having an immutable branch hanging off 6.0-rcN would be awesome -
> > > I could pull it and this would avoid any potential conflicts later.
> >
> > This material is in the mainline now, but the branch is still there in
> > case you need it:
> >
> >  git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
> >  acpi-wakeup
> >
> > It won't be necessary any more after 6.1-rc1 is out, though, I suppose.
>

>
> Awesome, thanks for merging in the ACPI patches!

Dmitry,
 What are the next steps to getting the I2C patches landed? Should I
push out a new series that's rebased on 6.1-rc1?
