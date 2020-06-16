Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89891FB5D9
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 17:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729227AbgFPPRO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 11:17:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728183AbgFPPRN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 11:17:13 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 124DA207C3;
        Tue, 16 Jun 2020 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592320633;
        bh=m8KMGIhi8TwpzFZcPdaAHpApXMmafeRrM3MfBbC2yy8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=m7jemaBrZWRJ7wdnW1byQq8GLTQQlD6rxa8Uk4825fuOC5N+aIyQZbObaRuvu1rNq
         aDTueKcRq/4zbnXVM9CUbD7A/B0ayYIonIBqY6/mrk779x6kk7mB8PLSBV0cZXx7r+
         36o4VH9YRLps+IUz4PaHCvqiGd6b8lBFf/1ptYj0=
Date:   Tue, 16 Jun 2020 17:17:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: remove redundant assignment to variable
 retval
In-Reply-To: <20200610123101.1133117-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.2006161717030.13242@cbobk.fhfr.pm>
References: <20200610123101.1133117-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 10 Jun 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable retval is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/usbhid/hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index 17a638f15082..17a29ee0ac6c 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -1667,7 +1667,7 @@ struct usb_interface *usbhid_find_interface(int minor)
>  
>  static int __init hid_init(void)
>  {
> -	int retval = -ENOMEM;
> +	int retval;
>  
>  	retval = hid_quirks_init(quirks_param, BUS_USB, MAX_USBHID_BOOT_QUIRKS);
>  	if (retval)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

