Return-Path: <linux-input+bounces-43-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D27EA00B
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 16:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88299B208C8
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 15:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0744219E2;
	Mon, 13 Nov 2023 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2Pzoa88"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A7521358;
	Mon, 13 Nov 2023 15:33:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A306DD63;
	Mon, 13 Nov 2023 07:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699889618; x=1731425618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=traB1khJAcOjJDjDW0iULSetW36qB0wE8R68eicfZN8=;
  b=S2Pzoa88/5HcnA1uGLzcvHrs0Q9CcsoYdggKtQ3b8S3VU7KhZeuXbZ4K
   DrNxFOSmxnwDbmIdAcVn8eB5HKjMbCHMphYexkpsl7j65woT+Ov3njpAb
   ru1al5eAkFtUgDRmDYdXoNcHF2KNJG8ZxI2d2s1dbIHi3JeFaasQHjhqv
   tGH9eYAZumNFjpz625HbgLlPJr5SZYIDinQd0o86ObEZWVxFexrhm1YvI
   vI3Y84XIsYTr4GYgoa3OqX6DTH87SZC6tB/U5hu2NWA5ypd8XAEFdqX1T
   TIzvfoZGRJlGRONpggrX6+CmMn4Ipy7qOpYteb4zhPW5G8zFUafP9lX76
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369791859"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="369791859"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 07:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="830265088"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="830265088"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 07:33:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2YwD-0000000Daff-0esz;
	Mon, 13 Nov 2023 17:33:21 +0200
Date: Mon, 13 Nov 2023 17:33:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Mark Brown <broonie@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v1 1/1] treewide, spi: Get rid of SPI_MASTER_HALF_DUPLEX
Message-ID: <ZVJBwFYO7nHHAcli@smile.fi.intel.com>
References: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
 <2023111307-payer-retiring-0d72@gregkh>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023111307-payer-retiring-0d72@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 13, 2023 at 09:29:39AM -0500, Greg Kroah-Hartman wrote:
> On Mon, Nov 13, 2023 at 01:12:49PM +0200, Andy Shevchenko wrote:

...

> >  drivers/input/rmi4/rmi_spi.c             | 2 +-
> >  drivers/mmc/host/mmc_spi.c               | 2 +-
> >  drivers/net/ethernet/micrel/ks8851_spi.c | 4 ++--
> >  drivers/usb/gadget/udc/max3420_udc.c     | 2 +-
> >  include/linux/spi/spi.h                  | 2 --
> >  5 files changed, 5 insertions(+), 7 deletions(-)
> 
> This should go through the spi tree, right?  If so:

Correct.

> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> For the USB portion.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



