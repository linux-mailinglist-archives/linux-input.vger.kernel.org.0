Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1F9D6C9D6
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 09:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfGRHQR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Jul 2019 03:16:17 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33301 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfGRHQR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jul 2019 03:16:17 -0400
Received: by mail-qt1-f193.google.com with SMTP id r6so21926247qtt.0;
        Thu, 18 Jul 2019 00:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RR4IHlcwE85yecXmrTCej2oXAVqCKbGwHCp8nhmDW4Y=;
        b=NKn3GtkYQlsABVSCpr7uTadbRTuivVx4YRC51zbUB2eb8X12hpTE2Afdpd7mcghqHv
         +LE9zURAgJHkwBYsI3pTNjXdQqTwgVC71S6R6KlIn7s+h+uFTY0g8ofTEVJHDH4B5BvQ
         L83PU+bys5zbIqQi/yVLKJpHUEUhYhILRZIOXGjvudRI5Y9qltGR58lDQi3FUqSaWB47
         CDtVhr4ToCIO9SqIHm5RoMPSkGI1Dlk7gIu2ute0meXXgzePshdQgqTKjcg0dxkCaEv8
         Ziy8epIigKBHOIoxp2GA38XPiwTn/irI3E0GTYFac/NKWR2thQP9mfrA1DVPQUuW5IdJ
         QQLA==
X-Gm-Message-State: APjAAAXL9zmWoYGPuWF7K/fbMVGfhXrtRtN9sdz1fQyTksvQhkzfHxAk
        vcCzkjRqZSgOPznNJfNUEUcymhClrypVq/YC0QU=
X-Google-Smtp-Source: APXvYqy7dbGYABNGq46GfBjA+X/S2QLqF2sY4C+onadlvy8TAv+zFIrFUXk5/sx3VHjT8YkH0GxSuMKkKdtPY2g/d98=
X-Received: by 2002:aed:3e7c:: with SMTP id m57mr31097101qtf.204.1563434176445;
 Thu, 18 Jul 2019 00:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190718020654.39860-1-yuehaibing@huawei.com>
In-Reply-To: <20190718020654.39860-1-yuehaibing@huawei.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 18 Jul 2019 09:15:59 +0200
Message-ID: <CAK8P3a2H0o+_3Y_J3r=D5_hGCArTYeHPfPPjY3dJ+ArmqYrOfQ@mail.gmail.com>
Subject: Re: [PATCH] Input: applespi: Fix build error without CONFIG_PCI
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Rob Herring <robh@kernel.org>, ronald@innovation.ch,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 18, 2019 at 4:07 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> If CONFIG_KEYBOARD_APPLESPI is set to y, but
> CONFIG_PCI is not set, building will fails:
>
> drivers/spi/spi-pxa2xx-pci.c: In function pxa2xx_spi_pci_probe:
> drivers/spi/spi-pxa2xx-pci.c:208:8: error: implicit declaration of function pcim_enable_device;
>  did you mean pci_enable_device? [-Werror=implicit-function-declaration]
>   ret = pcim_enable_device(dev);
>         ^~~~~~~~~~~~~~~~~~
>         pci_enable_device
> drivers/spi/spi-pxa2xx-pci.c:239:8: error: implicit declaration of function pci_alloc_irq_vectors;
>  did you mean pci_alloc_consistent? [-Werror=implicit-function-declaration]
>   ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
>         ^~~~~~~~~~~~~~~~~~~~~
>
> Make CONFIG_KEYBOARD_APPLESPI depends on CONFIG_PCI
> to fix this.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: b426ac045209 ("Input: add Apple SPI keyboard and trackpad driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

I found the same build bug, plus another issue:

    arch/arm/Kconfig:1942:error: recursive dependency detected!
    arch/arm/Kconfig:1942:  symbol XIP_KERNEL depends on KASAN
    lib/Kconfig.kasan:15:   symbol KASAN depends on SYSFS
    fs/sysfs/Kconfig:2:     symbol SYSFS is selected by CONFIGFS_FS
    fs/configfs/Kconfig:2:  symbol CONFIGFS_FS is selected by USB_LIBCOMPOSITE
    drivers/usb/gadget/Kconfig:145: symbol USB_LIBCOMPOSITE is
selected by USB_ZERO
    drivers/usb/gadget/legacy/Kconfig:17:   symbol USB_ZERO is part of
choice <choice>
    drivers/usb/gadget/Kconfig:486: choice <choice> contains symbol USB_G_WEBCAM
    drivers/usb/gadget/legacy/Kconfig:479:  symbol USB_G_WEBCAM is
part of choice VIDEO_V4L2
    drivers/media/v4l2-core/Kconfig:7:      symbol VIDEO_V4L2 depends on I2C
    drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
    drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
    drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
    drivers/gpu/drm/Kconfig:75:     symbol DRM_KMS_FB_HELPER depends
on DRM_KMS_HELPER
    drivers/gpu/drm/Kconfig:69:     symbol DRM_KMS_HELPER is selected
by DRM_ARMADA
    drivers/gpu/drm/armada/Kconfig:2:       symbol DRM_ARMADA depends
on HAVE_CLK
    arch/Kconfig:314:       symbol HAVE_CLK is selected by CLKDEV_LOOKUP
    drivers/clk/Kconfig:3:  symbol CLKDEV_LOOKUP is selected by COMMON_CLK
    drivers/clk/Kconfig:10: symbol COMMON_CLK is selected by MFD_INTEL_LPSS
    drivers/mfd/Kconfig:600:        symbol MFD_INTEL_LPSS is selected
by MFD_INTEL_LPSS_PCI
    drivers/mfd/Kconfig:614:        symbol MFD_INTEL_LPSS_PCI is
implied by KEYBOARD_APPLESPI
    drivers/input/keyboard/Kconfig:74:      symbol KEYBOARD_APPLESPI
depends on EFI
    arch/arm/Kconfig:2031:  symbol EFI depends on XIP_KERNEL

Your patch correctly solves the spi_pxa2xx issue, but I'd prefer to instead
drop the three 'imply' statements altogether, they seem to do more harm
than good.

(the circular dependency I saw might only happen when applying the
arm32 KASAN patches, but I expect to see them merged for linux-5.4)

      Arnd
