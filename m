Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96D7D6DE85
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2019 06:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732088AbfGSE3E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jul 2019 00:29:04 -0400
Received: from merlin.infradead.org ([205.233.59.134]:48560 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730095AbfGSEFx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jul 2019 00:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8rZP02MbRSBBbscvbeC9+WMvkdTaXb3OCI4XMXn4kxA=; b=CA7z7nXmYMd0B49HXCCyEP4B2t
        Tsl9LivcM+GTdLImucd8KdWVRv1OHB8+n+xmMbRNPPggzXoAK2bNPnVYKW+Yc+lxgrIHH2aL9JCni
        BYBpRaNV2HDW7Nfy6iSFkXk5oPJIJlOWALCCSzVZHEqXyVKmM8snhfilDtGFNpm0MY9AvDADPvyrn
        Hj5x9wwunkCmcUs2T+CwfiegCG71vpcJ+Pgs2pwOeA7il1P6Gn5jsEh3ccJqC553xVMKH6zn20qI+
        JzAPDrGfG9uc4bkEZs9ST6VxzVLjkRsTZlxSjzLqVIAMuT8xpzGlhmmxoBkLcqYtE3LSWRT1NHD+0
        tEDGckeg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=[192.168.1.17])
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hoK9V-0002w4-38; Fri, 19 Jul 2019 04:05:49 +0000
Subject: Re: [PATCH] Input: applespi: Fix build error without CONFIG_PCI
To:     "Life is hard, and then you die" <ronald@innovation.ch>,
        YueHaibing <yuehaibing@huawei.com>
Cc:     dmitry.torokhov@gmail.com, hsweeten@visionengravers.com,
        robh@kernel.org, arnd@arndb.de, andriy.shevchenko@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20190718020654.39860-1-yuehaibing@huawei.com>
 <20190718114036.GA2872@innovation.ch>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6a7111e2-3347-11fa-58d9-11d337a91c42@infradead.org>
Date:   Thu, 18 Jul 2019 21:05:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718114036.GA2872@innovation.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/18/19 4:40 AM, Life is hard, and then you die wrote:
> 
> On Thu, Jul 18, 2019 at 10:06:54AM +0800, YueHaibing wrote:
>> If CONFIG_KEYBOARD_APPLESPI is set to y, but
>> CONFIG_PCI is not set, building will fails:
>>
>> drivers/spi/spi-pxa2xx-pci.c: In function pxa2xx_spi_pci_probe:
>> drivers/spi/spi-pxa2xx-pci.c:208:8: error: implicit declaration of function pcim_enable_device;
>>  did you mean pci_enable_device? [-Werror=implicit-function-declaration]
>>   ret = pcim_enable_device(dev);
>>         ^~~~~~~~~~~~~~~~~~
>>         pci_enable_device
>> drivers/spi/spi-pxa2xx-pci.c:239:8: error: implicit declaration of function pci_alloc_irq_vectors;
>>  did you mean pci_alloc_consistent? [-Werror=implicit-function-declaration]
>>   ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_ALL_TYPES);
>>         ^~~~~~~~~~~~~~~~~~~~~
>>
>> Make CONFIG_KEYBOARD_APPLESPI depends on CONFIG_PCI
>> to fix this.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: b426ac045209 ("Input: add Apple SPI keyboard and trackpad driver")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/input/keyboard/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
>> index dd934c4..fefcc46 100644
>> --- a/drivers/input/keyboard/Kconfig
>> +++ b/drivers/input/keyboard/Kconfig
>> @@ -74,7 +74,7 @@ config ATARI_KBD_CORE
>>  config KEYBOARD_APPLESPI
>>  	tristate "Apple SPI keyboard and trackpad"
>>  	depends on ACPI && EFI
>> -	depends on SPI
>> +	depends on SPI && PCI
>>  	depends on X86 || COMPILE_TEST
>>  	imply SPI_PXA2XX
>>  	imply SPI_PXA2XX_PCI
>> -- 
>> 2.7.4
> 
> I think this is more properly fixed by Dmitry's suggestion of making
> SPI_PXA2XX_PCI depend on PCI, since it's that module, not applespi,
> that actually needs PCI - see
> https://www.spinics.net/lists/linux-input/msg62351.html

Dmitry's patch works for my failing test case.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

-- 
~Randy
