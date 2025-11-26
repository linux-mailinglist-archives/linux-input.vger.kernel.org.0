Return-Path: <linux-input+bounces-16374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD0C8BDAA
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 21:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82EE54E2660
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 20:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733D9342CB8;
	Wed, 26 Nov 2025 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feJ7B9X0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA1D340285
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188849; cv=none; b=cTZlPnotSR+zZmNbEOqH65fYGodwqa6hF+DTKBHsQhjoMYbnToZonsofFFNUn9LhRYUutKhbrP1ZZXSssxCvo+kqzdr5bQW0PACUzRnpeLVYjKAKlfcsXnG/pwWtDulv8kLHL3M/+SH+jmYb/4ZYW9zh2JQvSz0oOsOFhdD6HYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188849; c=relaxed/simple;
	bh=HKIM2XDlOtvCtdXcaqehs0suX2nO2L/FZMa8sZTYwVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjYFT2V9PPtW338XY1W0XGjibAECCAH2qhTUkJwJAXtajsHfVrpTsnJ21459thTJlvO2okrGqU1tAG/swQ5ldGBa3RVf3xlNznn0PVjk1xH0uCDUXb4lW/U4is1UI2a/8pzJbOV6BpgWSNPYsuFMhiC5N2AZq74teL658qCw/F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feJ7B9X0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b566859ecso193091f8f.2
        for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 12:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764188845; x=1764793645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZ8dEFu4Kwk+BNf08Ffe5YWG7kcopfid5SLE5GDJ9VI=;
        b=feJ7B9X0fUWnYAEjKy0+CLdsG2hP5AUItwIUPe2OMecOeEvgmrxIE+MUYTwsxmu98l
         zoqau4urfa+QP7H13/A2L6ZLIFbieOPGyIw8VEdDdMHwE+bbzwPhfiDzUmjiDvc9qlMr
         lS1i0IkGa7JWFh+d+n2BktH+4bNqIu0PEzDiRIUSBHbo0nMCUYjxeXD0RtEhf8zwj4p5
         YcDYNBDUojxo6pp2Q8TuYzzDqGqjc/SqlaGmGdN5vVwAf9NcLOLsrPV624RZKwyzasZF
         zzJf5E+YGs6A4rgcA8QjIBP0+vi9FrKnJ3KRRodXYyZ8qKa3mc8Wkk6XYLl+nZ8D007c
         MrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188845; x=1764793645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZ8dEFu4Kwk+BNf08Ffe5YWG7kcopfid5SLE5GDJ9VI=;
        b=SFEoMZdtXXcW6ieyipRBF7HzSaTfOEgPLgIE6/USuF3ughfG6UqOYFzjCH8cXdXr/d
         Kv1Io8Jv0OH/esLEaZaIQXQOXNAHLlRSexdEXkXXCFd97h7XwSjhwW6dqdfCjIJ0XOJh
         Z5OOkiltR18ZqmMLai9gQGHswtqFOk6HDQfqplbBW3KrkbLyW+YRT80cHen6biNaNTjN
         vUfSE9sZOr6ueIAaOwfrq6pJ37i0B0X5aht7FRIaJhdeaOWeW+dJE3bRGQUGmONXkHpN
         B5lwkStq4EIl/tGTU4mD8fn3a5VQJmETl+a+/mFtIr6J+syaYPgGOj7c1AUsDVlZCMsA
         cczg==
X-Forwarded-Encrypted: i=1; AJvYcCWVKPUagndWB/Df/YTG3GXDW0dWLbWroJv+xrBdvswPrz9CacnZ5xpooTV/rcaDJ1X0fjDO7NEXwSj8QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnyX6jyPT9gGkKtkBy9b30R7SZWobt0XMh0RfYmqkoHovewNq+
	dRJMmRy5+uk8XxuS/XrZ4F+GvyiMDH9m/T1eYYSaT84+cb9j4/o2fU9k
X-Gm-Gg: ASbGncs85PAFl/QxKvQ0N+i58zhXgW4cQFkkTGzZt87sGifZ7lW4+c5oT2hIhDJT8cQ
	Wr3PCBsrCZ6Tix6GbQc4jqGpz16sp0IJXYMaJdr+qfmNcypCAGSidZDvupC6Gt1zPw9dXaC+Jur
	xz8lkq60Sq0yBZwD+3oFrTY02km4V5GeRPlKOg2QgB/+sUT8Ri6zeE9b8l97E5D3bcsuG8BR/ZK
	dVWTpoDaj6kEyEh/tyNR+Cbh2VaQAapTcDkvuKHuORsfjJpK0z4skYJM4mIR4yODHuWwHD+6HsN
	pbrtpgg3013OfiP2PdmlR56+/H7wezHx5ZFhcSpPYPpmaw/IOP6KENg8KhZgmS6wcGZOvtBFKfl
	DlZScmFRBFKUSG4ubC3XMo20InNcUhF7XHSzhUfyzairJ9PyS/Hn2jf/Jo+IC17m6R1TU9l5VYU
	MdCimL6lMBygqQejPquFuLGHx9Rb3oGokHyw==
X-Google-Smtp-Source: AGHT+IFTYDrylDG61uHyZO6/gRHuthjRBFqmgEiPn9uOZLoUbhfE7iVNC9MC3qLEfOeTbADm3HWnrA==
X-Received: by 2002:a05:6000:2c0c:b0:42b:2c61:86f1 with SMTP id ffacd0b85a97d-42e0f34a082mr8842552f8f.35.1764188844984;
        Wed, 26 Nov 2025 12:27:24 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cc231dc6esm33031198f8f.7.2025.11.26.12.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:27:24 -0800 (PST)
Message-ID: <400c681d-a841-4bfd-a7a3-b8d4c6683124@gmail.com>
Date: Wed, 26 Nov 2025 21:27:24 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/11] HID: asus: initialize additional endpoints only
 for legacy devices
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-3-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251122110032.4274-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/25 12:00, Antheas Kapenekakis wrote:
> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> However, ID1 initializations are only required for RGB control and are
> only supported for RGB capable devices. ID2 initializations are only
> required for initializing the Anime display endpoint which is only
> supported on devices with an Anime display. Both of these
> initializations are out of scope for this driver (this is a brightness
> control and keyboard shortcut driver) and they should not be performed
> for devices that do not support them in any case.
>
> At the same time, there are older NKEY devices that have only been
> tested with these initializations in the kernel and it is not possible
> to recheck them. There is a possibility that especially with the ID1
> initialization, certain laptop models might have their shortcuts stop
> working (currently unproven).
>
> For an abundance of caution, only initialize ID1/ID2 for those older
> NKEY devices by introducing a quirk for them and replacing the NKEY
> quirk in the block that performs the inits with that.
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index a82286a427b8..9004814fb0d3 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
> +#define QUIRK_ROG_NKEY_LEGACY		BIT(14)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -652,7 +653,7 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>  		return -ENODEV;
>  
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
>  		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>  		if (ret < 0)
>  			return ret;
> @@ -1376,10 +1377,10 @@ static const struct hid_device_id asus_devices[] = {
>  	  QUIRK_USE_KBD_BACKLIGHT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },

