Return-Path: <linux-input+bounces-10033-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD8A35736
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 07:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 175CA3A4DD5
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 06:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED442200BA8;
	Fri, 14 Feb 2025 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SK4r6WDf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0817E;
	Fri, 14 Feb 2025 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739515012; cv=none; b=q4iHmiYN8uhZHNwFFlYbzjAkciinwdASnHijDeu13yuhsqbtvuOP85INzjnN7FWg+3h2QBhqve2vyYE6gGGO3n2gsI2MMEnXTNEPPx+I+KppN4bJdAwqC/Qayf8Bxs7s4nY9EPGIkoQa11KvtCe6nqp9BR5FQGAESCuiRNBg34Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739515012; c=relaxed/simple;
	bh=L4J8LFwop0QLpIHC9H15nA1SToDohIpHtDHezJWRFNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lb9g+bRJA0+BxOnh33ozJAML6Nfvc94gg3dvskzUGSVDqGc7UglkOLGRykPMPdkkbnwujojBL/oPO3flDTpbmthswJU/NK3RtZfRFTJtGCd+sXI5/olHaVSd3a5jw75LToeKDqJLxBr5kYk3IKPQWilfs0gHRV1X6kBWBtMIGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SK4r6WDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002BEC4CED1;
	Fri, 14 Feb 2025 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739515012;
	bh=L4J8LFwop0QLpIHC9H15nA1SToDohIpHtDHezJWRFNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SK4r6WDf3RGRJENQ0qi4RtuzIc1w9Eg869eREJ5U87IHHY1GJUUaV43fkEM9koun2
	 2OSWW24UrBllR2JEGv56BHxuqiDuiN82PrImoiZx6D3PhbeHeoeVJ7hkKYp8g872Js
	 YYp49AOPZZFoN89LN3tOHlH8U0tIQp3RpXbG18pkkR0tX+I179bcPA37z99EwM22r7
	 rjCVvM4HK2psCz800ympBjsnGrkOEl6VwqXB6rxetQTBTLkdG8G/py+TdTDeMKe5JR
	 zj/w5xkTz2+ZFRsNq42sma/M3hi6vUaz+rzQgS30qZ7inovPkCoIs5an8WgGpIv84b
	 F87yw3GANDGkQ==
Message-ID: <d1e07053-8f0a-40b2-a473-941e8180c570@kernel.org>
Date: Fri, 14 Feb 2025 07:36:49 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: corsair-void: Update power supply values with a
 unified work handler
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250213133854.100866-3-stuart.a.hayhurst@gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250213133854.100866-3-stuart.a.hayhurst@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13. 02. 25, 14:38, Stuart Hayhurst wrote:
> corsair_void_process_receiver can be called from an interrupt context,
> locking battery_mutex in it was causing a kernel panic.
> Fix it by moving the critical section into its own work, sharing this
> work with battery_add_work and battery_remove_work to remove the need
> for any locking
> 
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1236843
> Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> ---
> 
> v2 -> v3:
>   - Use an enum instead of a define for battery flag values
>   - Use an integer instead of BIT() for the bit index
>   - Drop unhelpful comments
>   - Simplify corsair_void_battery_work_handler logic
>   - Remove extra newline in commit message
> v1 -> v2:
>   - Actually remove the mutex
> 
> ---
>   drivers/hid/hid-corsair-void.c | 83 ++++++++++++++++++----------------
>   1 file changed, 43 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
> index 56e858066c3c..afbd67aa9719 100644
> --- a/drivers/hid/hid-corsair-void.c
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -71,11 +71,9 @@
>   
>   #include <linux/bitfield.h>
>   #include <linux/bitops.h>
> -#include <linux/cleanup.h>
>   #include <linux/device.h>
>   #include <linux/hid.h>
>   #include <linux/module.h>
> -#include <linux/mutex.h>
>   #include <linux/power_supply.h>
>   #include <linux/usb.h>
>   #include <linux/workqueue.h>
> @@ -120,6 +118,12 @@ enum {
>   	CORSAIR_VOID_BATTERY_CHARGING	= 5,
>   };
>   
> +enum {
> +	CORSAIR_VOID_ADD_BATTERY	= 0,
> +	CORSAIR_VOID_REMOVE_BATTERY	= 1,
> +	CORSAIR_VOID_UPDATE_BATTERY	= 2,

BTW numbering these explicitly is superfluous.

-- 
js
suse labs

