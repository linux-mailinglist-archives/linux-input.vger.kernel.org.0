Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7866CD80
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 13:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbfGRLkh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Jul 2019 07:40:37 -0400
Received: from chill.innovation.ch ([216.218.245.220]:59668 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRLkh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jul 2019 07:40:37 -0400
Date:   Thu, 18 Jul 2019 04:40:36 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 9CF5C640133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1563450036;
        bh=/Gd8UQZ1mrsbeFBwUzjuWBFXOklRWeccLWlERV4HCYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QxWCrGsREfcpGjSPjb6uZmuVfvnYglXNoI1h6LgYGvF6xZucl7XZdI+nQgBlwDJDG
         TN2qGDXqYc9tIvRAcesBm2273zbWB7oeoA/z/UbSUti7j7YPSWzcFdFNEatm2ks1PC
         R248Lzr6LEJlKe+aLHz4KV2XBsAPH+w3l6mB7IAyaOEF8in/NOoL8QDkc+PUzM/bcN
         KecaUybx3wUzj1N+H1+SmluHtWrCaikhOTZuGS+lWzZTrhsV5uOLJWacMQygEeRBmj
         j4GdUI6HIWDLGwjpQovMNtdNAevRfI4sHmrBBEFh56p1SNAZ8RJgNeZ6gDTuyHM3ZB
         brM9HGDYtwn7A==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     dmitry.torokhov@gmail.com, hsweeten@visionengravers.com,
        robh@kernel.org, arnd@arndb.de, andriy.shevchenko@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: applespi: Fix build error without CONFIG_PCI
Message-ID: <20190718114036.GA2872@innovation.ch>
References: <20190718020654.39860-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190718020654.39860-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Thu, Jul 18, 2019 at 10:06:54AM +0800, YueHaibing wrote:
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
> ---
>  drivers/input/keyboard/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index dd934c4..fefcc46 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -74,7 +74,7 @@ config ATARI_KBD_CORE
>  config KEYBOARD_APPLESPI
>  	tristate "Apple SPI keyboard and trackpad"
>  	depends on ACPI && EFI
> -	depends on SPI
> +	depends on SPI && PCI
>  	depends on X86 || COMPILE_TEST
>  	imply SPI_PXA2XX
>  	imply SPI_PXA2XX_PCI
> -- 
> 2.7.4

I think this is more properly fixed by Dmitry's suggestion of making
SPI_PXA2XX_PCI depend on PCI, since it's that module, not applespi,
that actually needs PCI - see
https://www.spinics.net/lists/linux-input/msg62351.html


  Cheers,

  Ronald

