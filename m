Return-Path: <linux-input+bounces-9972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3EA31EA6
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 07:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3EB3A91F6
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 06:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAB61FBE8A;
	Wed, 12 Feb 2025 06:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBuV9ISy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B21FBC9B;
	Wed, 12 Feb 2025 06:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739341270; cv=none; b=RGZPS2yE2Bhj8ujtSMqSd5CMMZ0R/W2Opxj7ItESeLNO3y9BSarBOWVv1fi0mOnAV3gVMDalU+DkRGo1y46JnttsXg2P16RTR6/0Xmo1hR9Zo7ee2fHlNJDLg6FXmMXB+CZSe9867Z8jLjXkPoL4NTJzUBw1re5KPvsJ9+X2ONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739341270; c=relaxed/simple;
	bh=hUFRZ3/2nTYL00SOXKKlnbj0aavoCWScgajjbamPQDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uwz4xvFvWMu5pulZRttUilE71oXfRu+Y4Dz7sZ/NqLUyeRz+XsiONurEdcUxUF8MiUdfTAxnFyR0eZEbXadUE4ixSDQj1Y0zTE4ZJ1JUHWKBaQs8goMnld/oxU38EkhGG23gfCTqQIC3ZOmsk0VFan8iCik0sStrUBF3j6JgJxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBuV9ISy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D1AC4CEDF;
	Wed, 12 Feb 2025 06:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739341270;
	bh=hUFRZ3/2nTYL00SOXKKlnbj0aavoCWScgajjbamPQDc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZBuV9ISyt6Hv5bBoESuCD0ATGfFRij9LSG+q99ghFLcuN/356mHRwXW2zHX429XHx
	 gUkISxIQLqRs6APfoYmyBahdpBXGxL89xCT48W/gW7H6Z16rANAlJ/3VpmtV3ncWO0
	 jBRZk6o3QhLwzxBjaTjxIQif/zyFZtbMkvA1Z9En1QURY1yiEgkkEtiLeuzXyO+7Ia
	 IKQIdnXyOyO0QENXaEt5jR8Yr76Xg95O1QHcV1A0RlMFpJnMj10B4efWoy7VwJsWCy
	 9B7zFb/G4+vUS4f1LZvoBdsclOeeoJ52hZi54Eia1huToSdKiYqNkviCHlKHkoIaiE
	 qDHlyS6s1oqSw==
Message-ID: <49bc1a59-1f5b-456b-aba4-be056d091e26@kernel.org>
Date: Wed, 12 Feb 2025 07:21:06 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: corsair-void: Update power supply values with a
 unified work handler
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250211224705.13576-3-stuart.a.hayhurst@gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250211224705.13576-3-stuart.a.hayhurst@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11. 02. 25, 23:46, Stuart Hayhurst wrote:
> corsair_void_process_receiver can be called from an interrupt context,
> locking battery_mutex in it was causing a kernel panic.
> Fix it by moving the critical section into its own work, sharing this
> work with battery_add_work and battery_remove_work to remove the need
> for any locking
> 
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1236843
> 

No \n ^^ here.

> Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> ---
> --- a/drivers/hid/hid-corsair-void.c
> +++ b/drivers/hid/hid-corsair-void.c
...
> @@ -107,6 +105,10 @@
>   #define CORSAIR_VOID_SIDETONE_MAX_WIRELESS	55
>   #define CORSAIR_VOID_SIDETONE_MAX_WIRED		4096
>   
> +#define CORSAIR_VOID_ADD_BATTERY		BIT(0)
> +#define CORSAIR_VOID_REMOVE_BATTERY		BIT(1)
> +#define CORSAIR_VOID_UPDATE_BATTERY		BIT(2)

I would do an enum, but it's a matter of taste/preference.

> @@ -583,16 +565,48 @@ static void corsair_void_battery_add_work_handler(struct work_struct *work)
>   	drvdata->battery = new_supply;
>   }
>   
> +static void corsair_void_battery_work_handler(struct work_struct *work)
> +{
> +	struct corsair_void_drvdata *drvdata = container_of(work,
> +		struct corsair_void_drvdata, battery_work);
> +
> +	bool add_battery = test_and_clear_bit(CORSAIR_VOID_ADD_BATTERY,
> +					      &drvdata->battery_work_flags);
> +	bool remove_battery = test_and_clear_bit(CORSAIR_VOID_REMOVE_BATTERY,
> +						 &drvdata->battery_work_flags);
> +	bool update_battery = test_and_clear_bit(CORSAIR_VOID_UPDATE_BATTERY,
> +						 &drvdata->battery_work_flags);
> +
> +	/* Add, remove or skip battery */

What is to skip a battery? Anyway, the comments here seem to be 
superfluous as the code is obvious™.

> +	if (add_battery && !remove_battery) {
> +		corsair_void_add_battery(drvdata);
> +	} else if (remove_battery && !add_battery) {
> +		if (drvdata->battery) {

Perhaps '&& drvdata->battery' instead of the nested 'if'?

> +			power_supply_unregister(drvdata->battery);
> +			drvdata->battery = NULL;
> +		}
> +	}
> +
> +	/* Communicate that battery values changed */
> +	if (update_battery) {
> +		if (drvdata->battery)

Ditto.

> +			power_supply_changed(drvdata->battery);
> +	}
> +
> +}

Overall, LGTM.

thanks,
-- 
js
suse labs

