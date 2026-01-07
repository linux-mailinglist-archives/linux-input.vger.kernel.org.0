Return-Path: <linux-input+bounces-16823-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F8CFDE22
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 14:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E6AD3080A8E
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 13:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C039B304BB8;
	Wed,  7 Jan 2026 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMyWLgQC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394E31AABF
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791415; cv=none; b=iE5RrU6WBbuiQjRICEdX62D31+pNgIDVFL3fDeNXJbE8klZzNvTDGPX0IZYBGA2Os+YWlHptu3Y9rfnWB1n8eQ2+fTsVy0sCaLHKs0Uu1U7iLsRoDApz/aPCEetk748kO5x/aOe7bFR3l02RZR5AizgbcSeg/lehCTX7QQuLWSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791415; c=relaxed/simple;
	bh=eV+EDoC0l6wGC1MRmV/RapSE0Ou62N/jqGCbPY7ZKDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nokjumK+Lqdgf0Or3g8NoV9TepGmBA6zclIeLzFDWrHHvLqcdKGTqYV3M46faU1X2/Hangpzz7dew0SEc5crn/2/TVxwjaIUXJPnxZ2pnhBb2mc8fXdesqZbDXT2IeLhNLhqs2KgEJUpguftzd0WM0OZbvlxLWBiLZvrtzRjeus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMyWLgQC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so1046105f8f.2
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 05:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767791412; x=1768396212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnKtvUYe9BJ5kgd6N+FlxVPmwPAbUwh54oUkFRRNNgQ=;
        b=JMyWLgQCubtIfTuh4Ss3pAg8432eQC9mXU/eAu5QyNOy/Xum7UnpKfTcGZ1H8FOzIK
         nDbK5e4bG1ScbW9FiLdmHtdWNIVnWxFsZoG753lFNK/9xhjaJLjEKrd74XL8Ew/qZpls
         bRKrI26pASE5nmJlGDp+A2i0qgtvMeFLfJAz2/sK0ZwK1cTF4qHy8TLMapluH6IMsRFJ
         Qf8caiSaGRHJvtqqwY8vFXZ74ouydT1nY6VQq6SI//Gs87thomSJ+YWbMxokvbjEz4v8
         IbJvZmMS2d5cOXpaE6vq1HWJuss4FYsk523N7izR4Dy7QijqiKTf8cxX4MrqEde7gHkp
         0LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767791412; x=1768396212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnKtvUYe9BJ5kgd6N+FlxVPmwPAbUwh54oUkFRRNNgQ=;
        b=QYdtp5Zd8gHokXlFEZ6uQFPrI1kjPvujaCI0Y9c/L45crSXwqGdb0mW+KIKnp0itTY
         FW0/WYzJzkDOgC47YqnneAA6774uvBnhwXFOwBI1x5CG36mf/m7TgJE9QhVyLySZUzA+
         i8GhF2gT5D5B8+omYN7GEc6vHa9EjgVMVJC49nmskaDRKOJtwkXVYYDcmFJo/yseZHMb
         6wwdFfdcK4s0h8UiSx3JDZBnYiMkzASG8ga6jrspXSJKn0CzGCLGlD4vRVs8AjxkhZfb
         k8uEjnCI/BcLC7E17ghDS/Ptsx0VCU+sqKNzaHQDBPLfus7K38mwAOEFGKylPMXsUYFd
         oT3w==
X-Forwarded-Encrypted: i=1; AJvYcCXuWyseCHhyl8j/QagMAzOF/oTGRcRdLta4sqo9HiKfq2mu9pImsrG52NKjQCmbyXAqiRiC382GaI6KTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwceyyYGFgf8P6JqBKo/mRg4HuBLQHYPx5ZcfGmMq0CNdmsFNHg
	vJtNsbURAu7+AcNmK5n5aOhTBMDySoIbzxDFhvnXafG0x930iFbVKFA6
X-Gm-Gg: AY/fxX7RNLS6dwco/D1M9wr5lf7k7agOSV2ffQ7QsxKS3lETmC0nca7pPkPo1DEbYJl
	f0NaYaSVOqnxyo5tzuSQLzKjfKhVEOcULLCh8ap5zzaF7YoGI8dl8I+pqTVTRchlN4fxgg2tLCw
	7urF82oGNvkx8ueFTZ0UnbohB45L5w9TUyrDjLJKNWomlCRpNjfacTqPpOBNLm8HBbaJhgGOyB1
	0e/aiR6ILKKYDfnGYzrwltb9DTbC2rlGylGHCwne0Zov4A+FnqrpKIj1qLwjxGT/wlxgB1rF5sU
	ZQzCsFLaVAVGjZGeTNUDvUrac3Lz5wSgRXHYao49a0m6mVPINQFf/mYMkVb/JJgM9HADAwwuNff
	pFXEekhGP9Pp3zxUuQHhlBaHLCf41Hl2NOfvEiGxAP9rNMaZf9dYIQza1Gh02jCuPNqZYJ+Wvol
	vNnI6bbbq0hoksBfWsiNIvsCk=
X-Google-Smtp-Source: AGHT+IF4CHDyjSjwQgBk6ePUGOBYVzOVlv1SdVoNnaqn4ns3mxMBwb/tacgYBL2hVznkXYbAIEGb4A==
X-Received: by 2002:a05:6000:2dc2:b0:432:851d:217e with SMTP id ffacd0b85a97d-432c37d2fc4mr3098095f8f.44.1767791412349;
        Wed, 07 Jan 2026 05:10:12 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm11146044f8f.24.2026.01.07.05.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:10:12 -0800 (PST)
Message-ID: <71f10925-3bb3-4c82-8bb9-244846221680@gmail.com>
Date: Wed, 7 Jan 2026 14:10:11 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] HID: asus: Implement Fn+F5 fan control key handler
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: superm1@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
 <20260107111945.48018-10-sunlightlinux@gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260107111945.48018-10-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/7/26 12:19, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
>
> On Asus ROG laptops, the Fn+F5 key (HID code 0xae) is used to cycle
> through fan modes. This key press needs to be forwarded to the asus-wmi
> driver to actually change the fan mode.
>
> Add ASUS_FAN_CTRL_KEY_CODE define and implement the handler in
> asus_raw_event() to send WMI events when this key is pressed.
>
> Tested on Asus ROG G14/G15 series laptops.
>
> Change-Id: Ic03df877b71e34c421e992a06e5e706d954e7dbf
> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
> ---
>  drivers/hid/hid-asus.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 05fa35489258d..d93c8f030b239 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -65,6 +65,9 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define ASUS_SPURIOUS_CODE_0X8A 0x8a
>  #define ASUS_SPURIOUS_CODE_0X9E 0x9e
>  
> +/* Special key codes */
> +#define ASUS_FAN_CTRL_KEY_CODE 0xae
> +
>  #define SUPPORT_KBD_BACKLIGHT BIT(0)
>  
>  #define MAX_TOUCH_MAJOR 8
> @@ -379,12 +382,21 @@ static int asus_raw_event(struct hid_device *hdev,
>  	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
>  		return -1;
>  	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		/*
> -		 * G14 and G15 send these codes on some keypresses with no
> -		 * discernable reason for doing so. Filter them out to avoid
> -		 * unmapped warning messages.
> -		 */
>  		if (report->id == FEATURE_KBD_REPORT_ID) {
> +			/* Fn+F5 fan control key, send WMI event to toggle fan mode */
> +			if (data[1] == ASUS_FAN_CTRL_KEY_CODE) {
> +				int ret = asus_wmi_send_event(drvdata, ASUS_FAN_CTRL_KEY_CODE);
> +
What if asus-wmi is not compiled with the kernel?

Would it make sense, in that situation (or in case of a failure)
to tell userspace (via evdev) about the button press?
> +				if (ret < 0)
> +					hid_warn(hdev, "Failed to trigger fan control event\n");
> +				return -1;
> +			}
> +
> +			/*
> +			 * G14 and G15 send these codes on some keypresses with no
> +			 * discernable reason for doing so. Filter them out to avoid
> +			 * unmapped warning messages.
> +			 */
>  			if (data[1] == ASUS_SPURIOUS_CODE_0XEA ||
>  			    data[1] == ASUS_SPURIOUS_CODE_0XEC ||
>  			    data[1] == ASUS_SPURIOUS_CODE_0X02 ||

