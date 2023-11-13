Return-Path: <linux-input+bounces-42-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA67E9EB5
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 15:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89FD31C20929
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 14:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D466921108;
	Mon, 13 Nov 2023 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tSW75R4W"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FEE210E7;
	Mon, 13 Nov 2023 14:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1D9C433C7;
	Mon, 13 Nov 2023 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699885783;
	bh=rNE2QrdjIdpu7UFsTQxx90lK9l5ol0pX7lsm3WH4CMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSW75R4WJBQ9NPl33UBWSBmNMIFvCcsUWCTM9NLS8EzqN4hZc35yJ+Nk0xGqGifNj
	 dXrH917eivkzjrbD7oZ2KIzm66QA2cPMJPcEwEM5LaFREMHFT/gv/TX1hX3F/EaMOk
	 OT0D2OcZrsK09FsKS68/BgnjCfNhGWWcwDcxwUPs=
Date: Mon, 13 Nov 2023 09:29:39 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <2023111307-payer-retiring-0d72@gregkh>
References: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113111249.3982461-1-andriy.shevchenko@linux.intel.com>

On Mon, Nov 13, 2023 at 01:12:49PM +0200, Andy Shevchenko wrote:
> The SPI_MASTER_HALF_DUPLEX is the legacy name of a definition
> for a half duplex flag. Since all others had been replaced with
> the respective SPI_CONTROLLER prefix get rid of the last one
> as well. There is no functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/input/rmi4/rmi_spi.c             | 2 +-
>  drivers/mmc/host/mmc_spi.c               | 2 +-
>  drivers/net/ethernet/micrel/ks8851_spi.c | 4 ++--
>  drivers/usb/gadget/udc/max3420_udc.c     | 2 +-
>  include/linux/spi/spi.h                  | 2 --
>  5 files changed, 5 insertions(+), 7 deletions(-)

This should go through the spi tree, right?  If so:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

For the USB portion.

thanks,

greg k-h

