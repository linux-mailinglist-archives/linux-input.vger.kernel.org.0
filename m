Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEED65EFF33
	for <lists+linux-input@lfdr.de>; Thu, 29 Sep 2022 23:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiI2VUa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Sep 2022 17:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiI2VU1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Sep 2022 17:20:27 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4F24F697
        for <linux-input@vger.kernel.org>; Thu, 29 Sep 2022 14:20:26 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d24so2318949pls.4
        for <linux-input@vger.kernel.org>; Thu, 29 Sep 2022 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVuUBdHRNun2PF1xzmThnbMizdtrsxsLtgkxiMk9ltY=;
        b=W+2EuiiJpqD/S2h8tV/F6pXSQKY+JUj+Vneixxc62ca+jIwCSRL0WQWdUXYadGg80b
         Y1OwBqrTPzS1SR00oFZx0dsVjbzSdVSMoDQCcx7C5dbUvFQxq/SMsLCcM79OLEM4Y7uD
         JZwZF1e6iquZYjlkdPOzpWGIvlJgtu+wY6SsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVuUBdHRNun2PF1xzmThnbMizdtrsxsLtgkxiMk9ltY=;
        b=VrrIsOtzf8nDWGQzpIbvNHNyeVkOe8HPFghlo3pHdYpBkaf0G2G2YIY9MU6zrHV3bO
         sPVXxuJgeooXPI1ny0t0TNSx2hhlfv6fI3IktccOo5H1E7LczCjVrBYbhctTp3zF5sPh
         XV9GZYKEH4XPrxXaedGh5bPG7QRF3AsQwNUUwzoLnaG1a6NMaiz2ZTEjQx7N1oWCZzMk
         DzZLS4esmjkc4jasy5G0evnn8aYAhQ31pcj1ypL0/WbdL2IxI/y76Yww5Vr+6cH6I+MU
         daI0ujZB4XR8aD9YJa8V9pKPnm2XdRrkP1IEmWGTFREC0bodxZTPoPX/Q0vfAntx+f/B
         xWFw==
X-Gm-Message-State: ACrzQf3B1KqwvHkjkeX3ZfGPaU8cfc8ljEfSQc3bDN/bTJ51OHmOCbNJ
        7ZuDUV7cxC1kt0IQaKbar9HKGkWpftvlQg==
X-Google-Smtp-Source: AMsMyM6hSvgj0z3nYl61/CLKSr0AWFJyXM44xjEwwqN2XAbye/2lE/QhFaxmwd2W4r/CCR2/aStpmg==
X-Received: by 2002:a17:90b:90c:b0:205:f650:21ae with SMTP id bo12-20020a17090b090c00b00205f65021aemr10484649pjb.43.1664486425990;
        Thu, 29 Sep 2022 14:20:25 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id z125-20020a623383000000b0053e38ac0ff4sm104499pfz.115.2022.09.29.14.20.24
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 14:20:24 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id i6so2547646pfb.2
        for <linux-input@vger.kernel.org>; Thu, 29 Sep 2022 14:20:24 -0700 (PDT)
X-Received: by 2002:a63:ff1b:0:b0:43c:e4ee:e5e0 with SMTP id
 k27-20020a63ff1b000000b0043ce4eee5e0mr4439543pgi.540.1664486423681; Thu, 29
 Sep 2022 14:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220929161917.2348231-1-rrangel@chromium.org>
 <20220929093200.v6.6.I8092e417a8152475d13d8d638eb4c5d8ea12ac7b@changeid>
 <CAJZ5v0izHjb8vE0ALyYo9yMOExdpCzG8f7-d5SpQnftqJfTEig@mail.gmail.com>
 <CAHQZ30CJyhPK-OriZ5NZ=GjwNbofaCW6GZ_CvPsL0WiJGsxs-Q@mail.gmail.com> <CAJZ5v0gcJRoMSODbTevRdK1zaEZHJcPxvG6XMy9-T_jvwxPFBw@mail.gmail.com>
In-Reply-To: <CAJZ5v0gcJRoMSODbTevRdK1zaEZHJcPxvG6XMy9-T_jvwxPFBw@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Thu, 29 Sep 2022 15:20:12 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CQd-0YnQgYG_OJVWn9_aUjvDAuT_DRGsxQF-q+bjr5BA@mail.gmail.com>
Message-ID: <CAHQZ30CQd-0YnQgYG_OJVWn9_aUjvDAuT_DRGsxQF-q+bjr5BA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 29, 2022 at 1:38 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 9:27 PM Raul Rangel <rrangel@chromium.org> wrote:
> >
> > On Thu, Sep 29, 2022 at 1:18 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Thu, Sep 29, 2022 at 6:19 PM Raul E Rangel <rrangel@chromium.org> wrote:
> > > >
> > > > ACPI IRQ/Interrupt resources contain a bit that describes if the
> > > > interrupt should wake the system. This change exposes that bit via
> > > > a new IORESOURCE_IRQ_WAKECAPABLE flag. Drivers should check this flag
> > >
> > > I would call this IORESOURCE_IRQ_WAKE which is (a) simpler and easier
> > > to read and (b) it sort of matches the "wakeirq" naming convention.
> >
> > It was Dmitry who originally suggested the name. I personally like the
> > CAPABLE in the name. It makes it clear that it's capable of acting as
> > a wake source, not to be confused with being enabled as a wake source.
>
> Well, so be it then.
>
> As I said elsewhere, I can apply this patch too if that's useful at this point.
>

We just need to make sure the ACPI patches 5-8 land before the i2c
patches 9-13. The i2c patches 1-4 can land before or after the ACPI
changes. I'm not sure how things get coordinated across subsystems.

> > >
> > > This is not a big deal if you insist on this name and for a good
> > > reason, but just something I would do differently.
> > >
> > > The patch LGTM otherwise.
> > >
