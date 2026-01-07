Return-Path: <linux-input+bounces-16822-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 123F3CFDD4B
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 14:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 794AC3000DFC
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 13:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2929F2EF64D;
	Wed,  7 Jan 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0JHb/KA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66055315D2A
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791248; cv=none; b=UtBFmAcoxKJ2rxkC819DZZHKQTQMXjVa7w6yaNx+VJqZQ9yMf5dC1030VnLJYwVNS8SLwJex0SMD2wblzrQoYoXFumHysEgg5RPFrCGHb8UcQXbGCd7+JQUNO/OUjFRnQ0hkhtN+JG9co7nN5hC8+wOcnyzCUZu2r0CRSeYz/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791248; c=relaxed/simple;
	bh=xH5gsgBfQEiWzo9DK/QLt3Wevh4y8Ssxnpw6/48yjAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTUfyeepuRJAykLWpwypf9hjKlIX97bA+R/3WrIavboRAvdu+L8JPP5hBF30o/8SToOGmBSct0uZlKjvaWp3EVITD5YS34pfPhBXUzJPWjYktKPxCR5NXvMsBNdBMZpDk1Th7qAp2toAiJVxg+46iCUy6QmkRFT5Oorpv1/mVBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0JHb/KA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so1115183f8f.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767791245; x=1768396045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1dCT+1pQQT3kPiOBouJUS5kwiz8+OJWFQGBn0ExSps=;
        b=K0JHb/KACwdMsLQjHR2odNXscTJsw4/znuC3NftJZRcHNdVIcI4uriQshwKRL1PKFA
         gIMDLlNOgfKMI1fSYaPFMjUMyGZQ3W586aQ6cPtVhaJAhsXwf61cl76ZFOkjENyefb8F
         NTWqJFgUfZjpBxBsbfYiXePR/H/aiTSzOPTl5VH7BpLP/OXH3aAkatBcrcGEPRjzmfzB
         GsPenkgkjNKwDoayy7imelACZugRlwBgGg9ZhBPud3hjo6xQcCcf17wAyC712GvF+/fA
         THicZruLhfqvYt5wgh+vHMFRSKQxQxGzCTGmxGYMFi16XbyXPnsg3zc5CQu5TZJtGZMZ
         M/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767791245; x=1768396045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1dCT+1pQQT3kPiOBouJUS5kwiz8+OJWFQGBn0ExSps=;
        b=XxIwuI69cAc3vM/qjYuWua1/LPwAjeiKnqCfDwahG7XHr6Pb+5FJIn2V6M6tvyf4o4
         g8NfGXhqK1ybCHXGdWd6z//gDxcGBDusFp9k2LlRzRbytUWQJsh3UkQSmE5u0ORgySVs
         A9K0tVOOM1YLq59Lr1Ymgc9p4eC1AuXEk5BQYOksbP8hdb7MJoOCQ9JLIbe9543U3WF+
         t85H3uWCk/+3jj9OA8BqZBVYFGo983gmOj9qMUSFKrwgbr1GXz49WXTxE6JveV/ab7RC
         ypRsmW8zf3Am7GOfjDdk/MT+ahpDfqMEE84o98/BUOMMxra8h9+uqUI0T4p3llkYPjVP
         lJOA==
X-Forwarded-Encrypted: i=1; AJvYcCVMnjojytNK5i1lg5FP4x68GtxxPTfQQiAYtQXSPEECbuNjWPOD2Rtnfl3ejgM6jwBzSlgwaHNeFD7EGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTh05hXU4of65SyKjy3i2fmZnYnQPNdSJBIyiDoubRUMejUUl5
	r3kBCoIKusYdtTHeJHM4wkdXfYGi9PoV8i+iB7KyZ93GEuGTlQBqIYk/
X-Gm-Gg: AY/fxX4BmMCwGYqCIbEzdz1GjAd5u9U60gQh1E9gU3Sl0kjaD9m7CI9hR1uMHpDET37
	6PByZaCMAuhHDAZXC7ArUeHo1+vI8b1LLbm+cpExTJDqcNN+ptJtditkcxm9YrY3a+ZfLNQ/FqK
	6w5TM6YPkvpGMs9UIKgTw3a7XMCMlhfq3yPaKNJ1JvBC2nEWC461yrlQnR4XBeFvkwCfbAgqSF8
	gleuLrlETmlaG6L9/qxAgn1e5IivWPT5r0X8eWGwJ/B2uPqDzMHnKK5FLnSGkDAOIdKXpVMjX2c
	T4hMyP+lKCLnj6ajiqX3umzRnxLCG2Q8Vwl7IrjsF9CEVB63Z7ymSghjON9EBfgli4Tb0rRnZYh
	oPMzZAbxC3eKUKyYN822rXv3rFn0LCnMkraRWlHPPf7xQgfcCXIMDuammIIQuVi68HsqNeedm20
	BjSMKXxKoKHJBirFZb835HNGg=
X-Google-Smtp-Source: AGHT+IGMLiGjctUR1u4VgmKiFKVSg8Zkg/xuA+6Dv30gxx/utHS+cxKm946CvtACHdR9GGnVu7m0+Q==
X-Received: by 2002:a05:6000:2584:b0:42f:ba09:aa7c with SMTP id ffacd0b85a97d-432c3765636mr3850488f8f.54.1767791244424;
        Wed, 07 Jan 2026 05:07:24 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm10233823f8f.4.2026.01.07.05.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:07:24 -0800 (PST)
Message-ID: <088286f0-3469-4b2a-87bb-56440d40fb82@gmail.com>
Date: Wed, 7 Jan 2026 14:07:21 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] HID: asus: Add WMI communication infrastructure
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: superm1@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
 <20260107111945.48018-8-sunlightlinux@gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260107111945.48018-8-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/7/26 12:19, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
>
> Add the infrastructure needed for the HID driver to communicate with
> the asus-wmi driver:
>
> - Add linux/acpi.h include (in alphabetical order)
Mentioning the addition of acpi.h seems a bit too specific
for a commit message, but wait for hid maintainers to
tell.
> - Define ASUS_WMI_METHODID_NOTIF method ID in asus-wmi.h
> - Implement asus_wmi_send_event() function to send events to asus-wmi
>
> This infrastructure will be used to handle special keys that require
> WMI communication.
>
> Change-Id: Ic4d9b35f8b1f2b48c7c26e7259b4d05951021b58
> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
> ---
>  drivers/hid/hid-asus.c                     | 24 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 25 insertions(+)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 06cd3d3b74af7..05fa35489258d 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -23,6 +23,7 @@
>  /*
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/hid.h>
>  #include <linux/module.h>
> @@ -321,6 +322,29 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>  	return 0;
>  }
>  
> +/*
> + * Send events to asus-wmi driver for handling special keys
> + */
> +static int asus_wmi_send_event(struct asus_drvdata *drvdata, u8 code)
> +{
> +	int err;
> +	u32 retval;
> +
> +	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> +				       ASUS_WMI_METHODID_NOTIF, code, &retval);
This code is based on the fact asus-wmi driver is available:
are you sure this doesn't make the kernel compilation fail
if such driver is not enabled?
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
> +
>  static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  		      struct hid_usage *usage, __s32 value)
>  {
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 419491d4abca1..516538b5a527e 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -29,6 +29,7 @@
>  #define ASUS_WMI_METHODID_KBFT		0x5446424B /* KeyBoard FilTer */
>  #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
>  #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
> +#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method */
>  
>  #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
>  

