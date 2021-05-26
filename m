Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33C539153C
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbhEZKpU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:45:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:53410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234034AbhEZKpT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:45:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8275613D3;
        Wed, 26 May 2021 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622025828;
        bh=XRJzbP0F2T6dGLVWdrRJRmZqSOX/XFTUkR8WZOHpvJI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Pyp7pq2CJoXIYdHTjVHDdRnQxRtSrMXj6R0Nxkdhjmt5xSesET3h0rsrgvuTyHfCO
         AohLOXcw48UNqP9R0TIjzhv6pJh802C+2R0Of8BOpQnhQy8Osg+SEHX1+VJFt0cd7N
         dBsWmrp1Hae3EICoXYBiiuJYjUciMOSc085aOqtQYpPLJZHv3EheqsU/h/SR5x2TSS
         KXEbHuuJSuFgVDs0FZ6In16PW14ZdA4lVqOSUnR538db6Z5qYqDhxXBuUo8PMhQNtF
         doqDF406lDyN+ZTQOthmqpM1qBuJVyU2jg1RNQtd930Za7+PHB4CPvSLXZncRj8W4k
         2RmENB5eFcoMA==
Date:   Wed, 26 May 2021 12:43:45 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] HID: gt683r: add missing MODULE_DEVICE_TABLE
In-Reply-To: <20210508031448.53445-1-cuibixuan@huawei.com>
Message-ID: <nycvar.YFH.7.76.2105261243400.28378@cbobk.fhfr.pm>
References: <20210508031448.53445-1-cuibixuan@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 8 May 2021, Bixuan Cui wrote:

> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/hid/hid-gt683r.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-gt683r.c b/drivers/hid/hid-gt683r.c
> index 898871c8c768..29ccb0accfba 100644
> --- a/drivers/hid/hid-gt683r.c
> +++ b/drivers/hid/hid-gt683r.c
> @@ -54,6 +54,7 @@ static const struct hid_device_id gt683r_led_id[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI, USB_DEVICE_ID_MSI_GT683R_LED_PANEL) },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(hid, gt683r_led_id);
>  
>  static void gt683r_brightness_set(struct led_classdev *led_cdev,

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

