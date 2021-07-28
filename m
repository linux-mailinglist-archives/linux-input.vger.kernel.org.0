Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF893D8AF5
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhG1Jma (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:42:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231408AbhG1Jma (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:42:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC89060F9D;
        Wed, 28 Jul 2021 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627465348;
        bh=VZ4nuzu7jAy+8jU0B3ANq2x2GkmAKRJmZDAGE5IMJb8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=HACUT0BYikOpdBcL487VulSuuDq/eOsQ9aDIDix3jUv0jHosw4sLOzRFNxR/6S+Tv
         3t46kH3gak4PFyVpcjK0/GccovYK7W0eXS2I20LFHKFQ/2rOhNZJZf+ox7FxhgFaqr
         tDuLdGj7XW7YDNGHGL2F8KzsKk5n3mjjZykJshkf7Njjj/loHZmpnNI/tKwQ1aaGIY
         vdD997j/UZJr7saHQysWuoy6nWdn/SS5S/wA3QfQrLzISXC4dJ3sI02PzOBrs0eXOe
         OAAbxhZR+bEsAwTQqP+vgfAVf2ekrU12JlkCH5sYlH8Sdpz7WTIip9U4/kGDGpXeY4
         jAGMvuj5P5vMw==
Date:   Wed, 28 Jul 2021 11:42:25 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB HID: Fix spelling mistake "Uninterruptable" ->
 "Uninterruptible"
In-Reply-To: <20210719102731.15107-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.2107281142210.8253@cbobk.fhfr.pm>
References: <20210719102731.15107-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 19 Jul 2021, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/usbhid/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/usbhid/Kconfig b/drivers/hid/usbhid/Kconfig
> index dcf3a235870f..7c2032f7f44d 100644
> --- a/drivers/hid/usbhid/Kconfig
> +++ b/drivers/hid/usbhid/Kconfig
> @@ -38,7 +38,7 @@ config USB_HIDDEV
>  	help
>  	  Say Y here if you want to support HID devices (from the USB
>  	  specification standpoint) that aren't strictly user interface
> -	  devices, like monitor controls and Uninterruptable Power Supplies.
> +	  devices, like monitor controls and Uninterruptible Power Supplies.
>  
>  	  This module supports these devices separately using a separate
>  	  event interface on /dev/usb/hiddevX (char 180:96 to 180:111).

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

