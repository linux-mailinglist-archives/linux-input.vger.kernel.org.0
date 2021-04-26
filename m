Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E2B36B2C9
	for <lists+linux-input@lfdr.de>; Mon, 26 Apr 2021 14:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbhDZMOa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Apr 2021 08:14:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231550AbhDZMOa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Apr 2021 08:14:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 009BE61178;
        Mon, 26 Apr 2021 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619439229;
        bh=3jTHsaN6ohRdOgJEHP9SWTgo6GOAMiOIw+coUfFMB6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EE4JGHF9yusSCOW1/++ZdJIBj33EDn3bHr1UzDxz5uuqO9S1me5qfJrBts4VmQtZb
         hyPwP53XqKJDoD0mzg52RrBURcZH2OIjU0PhSRb6uK2hIHdc9v65NADPHOAG9GTNLe
         PAR09iM1oriu09Ybk2+ZCb8iww8MbYWJitb+rzknZSN2yJquRUf3sd2Z4Ska19fkhb
         RUYyAP5xRYFvPxtRy1nfqy+zQRALtqwCioJ4n/LtRcG6evtFpVkR9lYDFsb4OaMZRW
         PgVGSoH7kjtegpV3xnQ9Aj5uTThlf3KINgPsmAoJTNi87leEeUIJSlQSYUd99MC5Ki
         kJS8El89cWo0Q==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lb07i-0006G9-V9; Mon, 26 Apr 2021 14:13:59 +0200
Date:   Mon, 26 Apr 2021 14:13:58 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hiddev: return -ENOMEM when kmalloc failed
Message-ID: <YIauhinYt+USHmaB@hovoldconsulting.com>
References: <1619429726-54768-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619429726-54768-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 26, 2021 at 05:35:26PM +0800, Yang Li wrote:
> The driver is using -1 instead of the -ENOMEM defined macro to
> specify that a buffer allocation failed. Using the correct error
> code is more intuitive.
> 
> Smatch tool warning:
> drivers/hid/usbhid/hiddev.c:894 hiddev_connect() warn: returning -1
> instead of -ENOMEM is sloppy
> 
> No functional change, just more standardized.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/hid/usbhid/hiddev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
> index 45e0b1c..88020f3 100644
> --- a/drivers/hid/usbhid/hiddev.c
> +++ b/drivers/hid/usbhid/hiddev.c
> @@ -891,7 +891,7 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
>  	}
>  
>  	if (!(hiddev = kzalloc(sizeof(struct hiddev), GFP_KERNEL)))
> -		return -1;
> +		return -ENOMEM;

Please try to understand the code that you're changing based on feedback
from some tool.

All other error paths here return -1 and the return value of this
function is only compared to zero.

How is changing only one of these paths an improvement in any way?

>  
>  	init_waitqueue_head(&hiddev->wait);
>  	INIT_LIST_HEAD(&hiddev->list);

Johan
