Return-Path: <linux-input+bounces-16840-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB68CFEFE3
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 18:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CA063001183
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 17:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB77376BC8;
	Wed,  7 Jan 2026 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eS2R/Zny"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C6376BC3;
	Wed,  7 Jan 2026 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799585; cv=none; b=i4BBw2MakvsOJW/y1RB4okOTik5NL/7D+KPeg+SdHAKzcC7360sPn3NhE0a/OKB7nZsxBWgQPNDaMb9gYR6WiUG5yRqpJ/xa+iJ2jdIj6JCCVMt5Z6YKOhClJrCI4wSvn6c0qel2EO/u3v3Ue9BjOucRpbJi3cAyO8FLD8BryoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799585; c=relaxed/simple;
	bh=L6owTKGz0u9dYcDT84vRewkdDiaEcRZCNDXmkRClD6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qExstzwyeembq8RCmgOcbqDcTd3jgeIuPq40Gd48tghp4ukfMLfppysnsT5rbowVMpJbm+oYEYW09d0EeeFHWZsIDLIQXJx03MXSGGCCPUnzhl5w56pjsSd8i51vDwlTHllNy1/GUwF13VAC+zZaVx28QzWVTvrAW9P3HUAiyIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eS2R/Zny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF23C4CEF1;
	Wed,  7 Jan 2026 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767799584;
	bh=L6owTKGz0u9dYcDT84vRewkdDiaEcRZCNDXmkRClD6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eS2R/Zny7K4FMy5qaEvGLeAbrv2Ed547kPSjnJRw+ar3HDPvpw8yVpm8yDNb6yYvY
	 u95+Pj98WQyJOIowQv3HNsP5syz8knkknsPrwm/ApTlp7CqTfwHJ6+rgWlJSTSec4x
	 BGJi2t+rrnmkukXrbp7V/lBo7OnhL4mPVtL+zTl5QGhb8ra/xNN9cCorV0qDJgmCzu
	 x3V+4YzV1Nld9lhRAr69uvLzO2N76t+bf3nFzYqkj55B0+94dWrpHDfA6pYdUfSB51
	 Klb5hvSvR5tq6VygNTQrfe31K55i8VPqnhIrrYG5hrIfVtIHUa9UM7YTwaKun0f0LB
	 WlALfD18wvPAw==
Message-ID: <a53dc574-2071-4ab0-b55b-5bab3b342851@kernel.org>
Date: Wed, 7 Jan 2026 09:26:23 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] HID: asus: Add WMI communication infrastructure
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 benato.denis96@gmail.com, jikos@kernel.org, bentiss@kernel.org
Cc: ionut_n2001@yahoo.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260107152213.143247-2-sunlightlinux@gmail.com>
 <20260107152213.143247-8-sunlightlinux@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260107152213.143247-8-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 9:22 AM, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
> 
> Add infrastructure for the HID driver to communicate with the asus-wmi
> driver for handling special keys that require WMI communication.
> 
> This includes:
> - Define ASUS_WMI_METHODID_NOTIF method ID in asus-wmi.h
> - Implement asus_wmi_send_event() function with proper conditional
>    compilation guards for when asus-wmi is not available
> 
> Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
> ---
>   drivers/hid/hid-asus.c                     | 31 ++++++++++++++++++++++
>   include/linux/platform_data/x86/asus-wmi.h |  1 +
>   2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 15c24d5812763..8828a3b3054fa 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -23,6 +23,7 @@
>   /*
>    */
>   
> +#include <linux/acpi.h>
>   #include <linux/dmi.h>
>   #include <linux/hid.h>
>   #include <linux/module.h>
> @@ -321,6 +322,36 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>   	return 0;
>   }
>   
> +/*
> + * Send events to asus-wmi driver for handling special keys
> + */
> +#if IS_REACHABLE(CONFIG_ASUS_WMI)
I think this specific IS_REACHABLE isn't needed.

asus_wmi_evaluate_method() will return -ENODEV in that case already.

I think the warning you have below is actually helpful too because it 
will be obvious to a user they forgot to enable asus-wmi in their kernel 
config.

> +static int asus_wmi_send_event(struct asus_drvdata *drvdata, u8 code)
> +{
> +	int err;
> +	u32 retval;
> +
> +	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> +				       ASUS_WMI_METHODID_NOTIF, code, &retval);
> +	if (err) {
> +		pr_warn("Failed to notify asus-wmi: %d\n", err);
> +		return err;
> +	}
> +
> +	if (retval != 0) {
> +		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +#else
> +static inline int asus_wmi_send_event(struct asus_drvdata *drvdata, u8 code)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
>   static int asus_event(struct hid_device *hdev, struct hid_field *field,
>   		      struct hid_usage *usage, __s32 value)
>   {
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 419491d4abca1..516538b5a527e 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -29,6 +29,7 @@
>   #define ASUS_WMI_METHODID_KBFT		0x5446424B /* KeyBoard FilTer */
>   #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
>   #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
> +#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method */
>   
>   #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
>   


