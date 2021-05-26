Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384F4391531
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbhEZKmP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:42:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:52936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233946AbhEZKmM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:42:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 356DF613D3;
        Wed, 26 May 2021 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622025641;
        bh=fgxtvK+VLmElnGTJt7fJtJ+g5hluXnrJ9ugzu78I4T8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=F7mffP8tCx5ArjCKqddjKqLgQ8A4agdIqWtTcrcJMywyjJNwJk29+NaKCN9sWdD6L
         6IFyHYzgoE9xUotWBjOqqhXwPyfeIKM2CZigNHYy6+aNxIW3559XWdhfJL7TOJmmrQ
         ykIm7cbvrhe5VMSps8I8I6e89doYxZs2HBOv5DkXGWCTAOBmXJH9THr1sFfeRnsAKZ
         piWmD32EBgnNhdRKXaNS0N7VTHY1c7fNlJFE6nMQHqWov5zEiaGN70cYOXcY8W/N4X
         OJ9HpcmN+g3U0x26RPwM5kpbKb7a5V+rQoVXP6bVXu8JGNbrCw+ByqdbOinb6o312T
         yuOOfvHfGFr1w==
Date:   Wed, 26 May 2021 12:40:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Anssi Hannula <anssi.hannula@gmail.com>,
        Dmitry Torokhov <dtor@mail.ru>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] HID: pidff: fix error return code in
 hid_pidff_init()
In-Reply-To: <20210508024737.1927-1-thunder.leizhen@huawei.com>
Message-ID: <nycvar.YFH.7.76.2105261240280.28378@cbobk.fhfr.pm>
References: <20210508024737.1927-1-thunder.leizhen@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 8 May 2021, Zhen Lei wrote:

> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 224ee88fe395 ("Input: add force feedback driver for PID devices")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/hid/usbhid/hid-pidff.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
> index ea126c50acc3..3b4ee21cd811 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -1292,6 +1292,7 @@ int hid_pidff_init(struct hid_device *hid)
>  
>  	if (pidff->pool[PID_DEVICE_MANAGED_POOL].value &&
>  	    pidff->pool[PID_DEVICE_MANAGED_POOL].value[0] == 0) {
> +		error = -EPERM;
>  		hid_notice(hid,
>  			   "device does not support device managed pool\n");
>  		goto fail;

Good catch, applied, thank you.

-- 
Jiri Kosina
SUSE Labs

