Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C973F6B771
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 09:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfGQHnI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 03:43:08 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37919 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfGQHnH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 03:43:07 -0400
Received: by mail-lf1-f65.google.com with SMTP id h28so15669426lfj.5
        for <linux-input@vger.kernel.org>; Wed, 17 Jul 2019 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ju3cL7oPgFYBjy9f1SYco9JQ/kN3d2LtPNOreo+1j70=;
        b=ZXmrrr8ufnEvIEHhA354twE8WaD92/IuZ59iIWMECuJwi2nE2WW0Ju6iC8tzg/Ti1g
         fapiDlaymmlrgF+Ipynit5dFdptMtK52QouHW0Wfa328i6AvR5ErMkuJoJhg50hgGMRT
         JIvSWd7cmaFcuOMbsq49XXz3WUEpUbfzD6hLC47fTYrJSjq+zV1OKcnp0mLEcs5GDkNH
         SMEcIVwOGd2f5kHO6pqglXWZQbQlJUdupyRAas4ROmitrQ6bm1JVOCUm/jHYFwqmcGZk
         ll5fUhPiU94bNkTJQOBXFJycjrza4ducZKBSHdNAb462ISSscaZu8Crx5EKH0Q4FKz0u
         EAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ju3cL7oPgFYBjy9f1SYco9JQ/kN3d2LtPNOreo+1j70=;
        b=la3y2+XTnJErO0lUsScpk2agKI24AxoEJKeYBtdmtAa3CBSNgrxc8nMx/QYmJax8EK
         eMXelpnGIXC1PWgg/u/iTrsdiFDhsQWR/bPGkF/IfAMkPqKEsBGbZHZkvx+kFGngOq4g
         xft6/knleUNdIG3Ez7h+doU/WDxTjKTefvH+9BC+tAO8hblNFK7Qdt4lef9tGB3GpC0b
         D/ElkXoc/3tvuEYrGeJzuPTH2dtKHy89psKwuTvZad5GH/nJn8ieDYaTaYtFVttb2fnO
         xjeihsAa4f28H2b96Mn+z8LRzb/YKcGJc5KOVLCob50EYzxjduGpmdQFRE87BzxbGIOl
         Am7w==
X-Gm-Message-State: APjAAAVN8Qz91tbKBI97IkXJozaTwKn0luUcHd5egW0uYg3fp4BCaWAs
        a/vHrjX/ySN4s3y6bqPtEI/gHULTr5Q=
X-Google-Smtp-Source: APXvYqyuKlhQ2Z6PmW0En1EqlberVM/NI3f3PZ/was0kJt7e03XyN5TgbFB6/0vFK3DZSDSysljrpg==
X-Received: by 2002:ac2:596c:: with SMTP id h12mr17407008lfp.101.1563349385578;
        Wed, 17 Jul 2019 00:43:05 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id m10sm3247902lfd.32.2019.07.17.00.43.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 00:43:04 -0700 (PDT)
Date:   Wed, 17 Jul 2019 06:53:58 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     kbuild test robot <lkp@intel.com>
Cc:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>,
        kbuild-all@01.org, linux-input@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Chew, Chiau Ee" <chiau.ee.chew@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Brown <broonie@linaro.org>
Subject: Re: [input:next 2293/2295] drivers/spi/spi-pxa2xx-pci.c:245:11:
 warning: assignment makes pointer from integer without a cast
Message-ID: <20190717035358.GD621@penguin>
References: <201907170739.DKX3eBF6%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201907170739.DKX3eBF6%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 17, 2019 at 08:03:13AM +0800, kbuild test robot wrote:
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/dtor/input.git next
> head:   5a4cee7b28ed3ce4ce5980503926d5bc23c9c8d1
> commit: b426ac0452093da54206e021af72c979d01aa417 [2293/2295] Input: add Apple SPI keyboard and trackpad driver
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout b426ac0452093da54206e021af72c979d01aa417
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=ia64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/spi/spi-pxa2xx-pci.c: In function 'pxa2xx_spi_pci_probe':
>    drivers/spi/spi-pxa2xx-pci.c:245:13: error: implicit declaration of function 'clk_register_fixed_rate'; did you mean 'pci_register_io_range'? [-Werror=implicit-function-declaration]
>      ssp->clk = clk_register_fixed_rate(&dev->dev, buf , NULL, 0,
>                 ^~~~~~~~~~~~~~~~~~~~~~~
>                 pci_register_io_range
> >> drivers/spi/spi-pxa2xx-pci.c:245:11: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>      ssp->clk = clk_register_fixed_rate(&dev->dev, buf , NULL, 0,
>               ^
>    drivers/spi/spi-pxa2xx-pci.c:260:3: error: implicit declaration of function 'clk_unregister'; did you mean 'class_unregister'? [-Werror=implicit-function-declaration]
>       clk_unregister(ssp->clk);
>       ^~~~~~~~~~~~~~
>       class_unregister
>    cc1: some warnings being treated as errors

It looks to me that SPI_PXA2XX_PCI dependency is not strong enough, and
it should be

	def_tristate SPI_PXA2XX
	depends on PCI && COMMON_CLK

since if wither of those is off the driver is not going to work.

Thanks.

-- 
Dmitry
