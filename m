Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D739A6CDC3
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 13:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfGRL62 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Jul 2019 07:58:28 -0400
Received: from chill.innovation.ch ([216.218.245.220]:59910 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfGRL61 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jul 2019 07:58:27 -0400
Date:   Thu, 18 Jul 2019 04:58:27 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 4891B640133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1563451107;
        bh=ik0okPy9JA/b0aUoSm3HKYQLFraB8wAkbCLvHmB/+30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cb1k3R1EGs763vCFTXUSVAvExrN7vDSZsoB1uBp2szmudiRlNULCeDaXYWf3t3naz
         gzk6+xx0o2eg1yBr1s091UhCYP+xNaisNFakufwO5Votp/j88L4QUdZZonBTqNS7LU
         QWQlE+mNW+pIzwwTpIAKUD7VcTs2St32qgIZl8YWLU4bEF/lIrbSwqXr4vzWekgi4o
         cN67ny9hApTpSsJWJOdGM25baJUWFKmiMEEKxNTJWi64J+ypqL/iSrFv9YRJiGSvaJ
         DGCE081FQ3KEShy9Mjlq23Q1eZ0AUMGjDsPwuGcrv1DKTEmb+fr/3Rmr1D7GSq2T+2
         EX1ykPKjjsqYg==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Rob Herring <robh@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: applespi: Fix build error without CONFIG_PCI
Message-ID: <20190718115827.GB2872@innovation.ch>
References: <20190718020654.39860-1-yuehaibing@huawei.com>
 <CAK8P3a2H0o+_3Y_J3r=D5_hGCArTYeHPfPPjY3dJ+ArmqYrOfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a2H0o+_3Y_J3r=D5_hGCArTYeHPfPPjY3dJ+ArmqYrOfQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


  Hi Arnd,

On Thu, Jul 18, 2019 at 09:15:59AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 18, 2019 at 4:07 AM YueHaibing <yuehaibing@huawei.com> wrote:
> >
> > If CONFIG_KEYBOARD_APPLESPI is set to y, but
> > CONFIG_PCI is not set, building will fails:
> >
> > drivers/spi/spi-pxa2xx-pci.c: In function pxa2xx_spi_pci_probe:
> > drivers/spi/spi-pxa2xx-pci.c:208:8: error: implicit declaration of function pcim_enable_device;
> >  did you mean pci_enable_device? [-Werror=implicit-function-declaration]
> >   ret = pcim_enable_device(dev);
> >         ^~~~~~~~~~~~~~~~~~
> >         pci_enable_device
> > drivers/spi/spi-pxa2xx-pci.c:239:8: error: implicit declaration of function pci_alloc_irq_vectors;
> >  did you mean pci_alloc_consistent? [-Werror=implicit-function-declaration]
> >   ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
> >         ^~~~~~~~~~~~~~~~~~~~~
> >
> > Make CONFIG_KEYBOARD_APPLESPI depends on CONFIG_PCI
> > to fix this.
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Fixes: b426ac045209 ("Input: add Apple SPI keyboard and trackpad driver")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> I found the same build bug, plus another issue:
> 
>     arch/arm/Kconfig:1942:error: recursive dependency detected!
>     arch/arm/Kconfig:1942:  symbol XIP_KERNEL depends on KASAN
>     lib/Kconfig.kasan:15:   symbol KASAN depends on SYSFS
>     fs/sysfs/Kconfig:2:     symbol SYSFS is selected by CONFIGFS_FS
>     fs/configfs/Kconfig:2:  symbol CONFIGFS_FS is selected by USB_LIBCOMPOSITE
>     drivers/usb/gadget/Kconfig:145: symbol USB_LIBCOMPOSITE is
> selected by USB_ZERO
>     drivers/usb/gadget/legacy/Kconfig:17:   symbol USB_ZERO is part of
> choice <choice>
>     drivers/usb/gadget/Kconfig:486: choice <choice> contains symbol USB_G_WEBCAM
>     drivers/usb/gadget/legacy/Kconfig:479:  symbol USB_G_WEBCAM is
> part of choice VIDEO_V4L2
>     drivers/media/v4l2-core/Kconfig:7:      symbol VIDEO_V4L2 depends on I2C
>     drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
>     drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
>     drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
>     drivers/gpu/drm/Kconfig:75:     symbol DRM_KMS_FB_HELPER depends
> on DRM_KMS_HELPER
>     drivers/gpu/drm/Kconfig:69:     symbol DRM_KMS_HELPER is selected
> by DRM_ARMADA
>     drivers/gpu/drm/armada/Kconfig:2:       symbol DRM_ARMADA depends
> on HAVE_CLK
>     arch/Kconfig:314:       symbol HAVE_CLK is selected by CLKDEV_LOOKUP
>     drivers/clk/Kconfig:3:  symbol CLKDEV_LOOKUP is selected by COMMON_CLK
>     drivers/clk/Kconfig:10: symbol COMMON_CLK is selected by MFD_INTEL_LPSS
>     drivers/mfd/Kconfig:600:        symbol MFD_INTEL_LPSS is selected
> by MFD_INTEL_LPSS_PCI
>     drivers/mfd/Kconfig:614:        symbol MFD_INTEL_LPSS_PCI is
> implied by KEYBOARD_APPLESPI
>     drivers/input/keyboard/Kconfig:74:      symbol KEYBOARD_APPLESPI
> depends on EFI
>     arch/arm/Kconfig:2031:  symbol EFI depends on XIP_KERNEL
> 
> Your patch correctly solves the spi_pxa2xx issue, but I'd prefer to instead
> drop the three 'imply' statements altogether, they seem to do more harm
> than good.
> 
> (the circular dependency I saw might only happen when applying the
> arm32 KASAN patches, but I expect to see them merged for linux-5.4)

Isn't there more generally a problem here that this is selecting
MFD_INTEL_LPSS_PCI even though that depends on X86? I.e. are both ARM
and X86 selected at the same time? (sorry if I'm being naïve, but I
assumed only one arch can be selected at a time)


  Cheers,

  Ronald

