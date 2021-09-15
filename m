Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430FB40C7BA
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 16:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhIOOyC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Sep 2021 10:54:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:46348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230499AbhIOOyC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Sep 2021 10:54:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EE426103B;
        Wed, 15 Sep 2021 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631717563;
        bh=M7oJE+T8+P+pD4Bf+jPLtbq67TDG11/RekUc5MLVL/E=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=U/yKRqGgFtz1eT7tBiyqamtcw3587VgMzn+0/fY2Gk7/CRnog6uocvBHkvSd5KtSu
         6CsmRDeuEEzsHNl1jz2XVoB+hozh2PtjQf8m0/9KN1XympeZZO9m7DZlZtfO5U5z0W
         0aYlGskGYDubrJ4uZr4x9beDJXxPUojmf89xoIeoH61Cok/ZbAEOqnnWWOqbUkjpYQ
         d0BenOvjYHUJs9A0jvaori2+SEPZr/4Ofv5P50xc64oyn+9Do4V5TjkK7RduoqV25o
         yprcZWTxMhXWDL8Andv+0nOBm6H8qbVMuSBl5hD5JjcI1RWk5oLJxw41lRAkc7Dgkc
         KwaQXHg6Zhpiw==
Date:   Wed, 15 Sep 2021 16:52:40 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Joshua Dickens <joshua@joshua-dickens.com>
cc:     linux-input@vger.kernel.org, ping.cheng@wacom.com,
        Joshua Dickens <joshua.dickens@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL)
 support Added the new PID's to wacom_wac.c to support the new models in the
 Intuos series
In-Reply-To: <20210914172825.63335-1-Joshua@Joshua-Dickens.com>
Message-ID: <nycvar.YFH.7.76.2109151651440.15944@cbobk.fhfr.pm>
References: <20210914172825.63335-1-Joshua@Joshua-Dickens.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 14 Sep 2021, Joshua Dickens wrote:

> From: Joshua-Dickens <Joshua@Joshua-Dickens.com>

Thanks for the patch. Seems like you did put too much into your subject 
line and too little into actual changelog :) I can fix that on my part 
when applying, but let me first CC our Wacom maintainers for Review/Ack.

> Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
> ---
>  drivers/hid/wacom_wac.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index fd51769d0994..33a6908995b1 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -4746,6 +4746,12 @@ static const struct wacom_features wacom_features_0x393 =
>  	{ "Wacom Intuos Pro S", 31920, 19950, 8191, 63,
>  	  INTUOSP2S_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7,
>  	  .touch_max = 10 };
> +static const struct wacom_features wacom_features_0x3c6 =
> +	{ "Wacom Intuos BT S", 15200, 9500, 4095, 63,
> +	  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
> +static const struct wacom_features wacom_features_0x3c8 =
> +	{ "Wacom Intuos BT M", 21600, 13500, 4095, 63,
> +	  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
>  
>  static const struct wacom_features wacom_features_HID_ANY_ID =
>  	{ "Wacom HID", .type = HID_GENERIC, .oVid = HID_ANY_ID, .oPid = HID_ANY_ID };
> @@ -4919,6 +4925,8 @@ const struct hid_device_id wacom_ids[] = {
>  	{ USB_DEVICE_WACOM(0x37A) },
>  	{ USB_DEVICE_WACOM(0x37B) },
>  	{ BT_DEVICE_WACOM(0x393) },
> +	{ BT_DEVICE_WACOM(0x3c6) },
> +	{ BT_DEVICE_WACOM(0x3c8) },
>  	{ USB_DEVICE_WACOM(0x4001) },
>  	{ USB_DEVICE_WACOM(0x4004) },
>  	{ USB_DEVICE_WACOM(0x5000) },
> -- 
> 2.31.1
> 

-- 
Jiri Kosina
SUSE Labs

