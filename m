Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5FA6CDC0
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 13:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbfGRL5R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Jul 2019 07:57:17 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43244 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbfGRL5R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jul 2019 07:57:17 -0400
Received: by mail-qk1-f194.google.com with SMTP id m14so20121595qka.10;
        Thu, 18 Jul 2019 04:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NH8U6z/3WFnwwAsxn4XDJr2j+izhLMQCadsEWO8uu4E=;
        b=ZIV9cRPWUjLFoIgO1uJuFHYji2ICPErmjgs+2wpYge9Cg/uOZ4ptRYSETA//5qVkKJ
         TgwZwcRaEBFkYwZ/6hcq2x6aI0mnKx3vH/zd23+/HnMfegZOUdv6+YHOrqV33XpN+1J2
         V6M1qkIAipgcYQHFxY1yVsSkeHOhrigldC5Yql5jSOl42zqdegRAUx86vGl36sZEG5IP
         tS1BbRghVvMRWO3NOVnqsfW6BvYnZSiR6Lf02Vlb7ueBaDy+/OSwr/PCcS679RKdBtl+
         lHWxKbhtulvEtbvUo9LK59skBXYPOOWi11q9Y6uulVTtndTHAJcSb8erGauTlI1PyrAC
         muzg==
X-Gm-Message-State: APjAAAVk2nbXbxYQ7vMLF6eu77iTycM0KocexkWvq+v7jmHTY6ruKNpk
        NDrfsbBLdt2QhJ9422QRgVA2lOuwTUh1yklkoLg=
X-Google-Smtp-Source: APXvYqxQ9C/JnmJyFQi0GXtKlkextuLSVmtsdGHQNMmF8Nb212n8eZuydmXGRGVaTzvFHRv9VbMcmGqeA1t1UYTqj1M=
X-Received: by 2002:a37:4ac3:: with SMTP id x186mr29240532qka.138.1563451032534;
 Thu, 18 Jul 2019 04:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190718020654.39860-1-yuehaibing@huawei.com> <20190718114036.GA2872@innovation.ch>
In-Reply-To: <20190718114036.GA2872@innovation.ch>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 18 Jul 2019 13:56:55 +0200
Message-ID: <CAK8P3a09paRwS2ZEfvhxOdPAgjBz+9ZJ3Mv_kMaO5kSMV_Kadg@mail.gmail.com>
Subject: Re: [PATCH] Input: applespi: Fix build error without CONFIG_PCI
To:     "Life is hard, and then you die" <ronald@innovation.ch>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Rob Herring <robh@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 18, 2019 at 1:40 PM Life is hard, and then you die
<ronald@innovation.ch> wrote:
> On Thu, Jul 18, 2019 at 10:06:54AM +0800, YueHaibing wrote:

> > @@ -74,7 +74,7 @@ config ATARI_KBD_CORE
> >  config KEYBOARD_APPLESPI
> >       tristate "Apple SPI keyboard and trackpad"
> >       depends on ACPI && EFI
> > -     depends on SPI
> > +     depends on SPI && PCI
> >       depends on X86 || COMPILE_TEST
> >       imply SPI_PXA2XX
> >       imply SPI_PXA2XX_PCI
> > --
> > 2.7.4
>
> I think this is more properly fixed by Dmitry's suggestion of making
> SPI_PXA2XX_PCI depend on PCI, since it's that module, not applespi,
> that actually needs PCI - see
> https://www.spinics.net/lists/linux-input/msg62351.html

I'll put that into my randconfig setup to see if it's sufficient. I'm
a little bit
suspicious as the circular dependency was not avoided by the 'depends
on X86' for MFD_INTEL_LPSS_PCI.

        Arnd
