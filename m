Return-Path: <linux-input+bounces-16372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8187C8BCDB
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 21:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5EE6A359BF1
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 20:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896FB340A5A;
	Wed, 26 Nov 2025 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB9GXMCe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D833FE0D
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188382; cv=none; b=kZrDE5EMLsyz7oIb5vUAOmSn2fml4158w9QlWrKF1MDIhKX8eRQqh+VIiw4LFFz5n4rkkaZTXOvAqqpDzhuDS6W6KZCOMls+YOaX8+YRn3Ho8XIOAEFMhrfdpN2lK6l9GQnyXCHa8VIBUJI3Ho2LvyeI2l8TjtPv2msQdXQjF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188382; c=relaxed/simple;
	bh=+L92OgRzckF8lysBDUjzwD+rby1GBhwcu5vhVpsisw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXoHezKh5+gIh3OU+5e65kSd68FqbdrMzA2Woh/5yhFisHlgjGVfBSKsSJl6kG+fZCUK0pefz1qDJOMd3Qy/RIOITHy3kTBI5rZVdk+V4HFRW6qNb/x2IJCZBukHa1HH2BqIZmkvFegYnMQ/sYaDh7jONhwWGeBbBdMlho7ei20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB9GXMCe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so88365f8f.0
        for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 12:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764188379; x=1764793179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1Ghjj0om1Ay0qf6/KldkuwEcS8A6uUNI7dFPbMcUe8=;
        b=DB9GXMCeCTVUALIuNFw1Ep0JHUW3A1wMpWa/tVKMYxi6WclTKUVtFH8PJtC0Ub2pVi
         hoXl4nHWzPbarvA5gLhWk3pj/q469Xoy7jkG7SYmzlbCi3Tqe6AtTRVUpyj39vn7w44Z
         cQpXxY0jo8ldaQxKamoG9RKsCmr+KeTCeZKfJW/ZrMYZTgRXRVptfnCIBRolE9X4Szq3
         znmdowffpScJSXyK29MSjaspmYaPbM27AMPED+GIKSWO7C0XkoUGomO7AEt/xVOV6q/3
         dCwrB/hBEG6Lh2LOK1wPXhYNdr7P3hHu9PPcMuN7eIph8Ct2+vIe4o/znMyTwbHFb7DU
         RhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188379; x=1764793179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1Ghjj0om1Ay0qf6/KldkuwEcS8A6uUNI7dFPbMcUe8=;
        b=M0L26sk1jjsdw1Baf6t4r0VOK3PASl9eghGy7qpj/98moLolNbl0y7EjR2aPPBUgjS
         rcDZ/uTNxZL5zgf4MYQPkTkxjI5JYEqLZPQlsu78/xDSnRfWt5XHQkX2avZUJz5p49kn
         Skw2s0RHv572KVAQVZBjPbxEDoAxLp7E1KmJ5XujHlwZz3kb3GOxUGKGQoji+b5VxTD2
         Av98zWVTijxaRNLO8L0clSMzoxRCt+6PDFxp8Gmb7mymDTZVgUCtOvGyit6zLO3B2U15
         vDR8R5WiI/u3ST33qbVG7+0VJxaw5B3s26tYsRZN8A/WZfLsVV+XJ0OAUB3MUO+GPE0H
         cGNA==
X-Forwarded-Encrypted: i=1; AJvYcCW92bPh4zCfL3ITO19NE12/XZ9likLJsLkgDPAPgc9l5j+ioMKO9WzHSfzpSNigICaJ0Jvf4PIX5ihUGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxB5R162KuOJ/sg+IZ1TV5wNQBMoWDwmB8lQFVD+YWA0p1EpE9
	/qc3QBVzKsYM8msOvTueSpC93ynEDHOJz1eROB8yjHkZe9rjltqiXvJo
X-Gm-Gg: ASbGncsvaMV1qdb1JyG9bM4j6W2NVLd3Fxm/pLe8DQcAgTAkuVFf5OG6UTfxQdWJw06
	/SKgBb+wVl8ZJVMAFrG786Bq6AuCv52rbS8nyqnqjFHsAnh86UmVuYu0oCbANgiHp2ss8UgL2Ae
	q3+V51tX10ezENvIezXw2MHya+1AevWo+MibV6sYbF430ri9T31QY50bGVZagVSPH7puAwnuNAc
	dRFaZVWUmWPmXUqI9XPgXv9gTCdJkveTUaQbRkSRdrUbIrDRxHhR4rnylERMAfahSQWn5ZU3IaL
	0wneVFTHiTgfmdAWEvtta5F2A1qdESrolXPmVIRCvzx7YY+ru9QoI/tiwzMCKenQvr835PuFY49
	LNQqJ1CO0FIb8q9fLuH8AAf0f/CXxHX2TCCAEKQ1qqsDwuFQTWnHTl2I5or/rR97+0mpdn4dppZ
	yBhBzyzoa8YVzgPWBkbZnLm+Y=
X-Google-Smtp-Source: AGHT+IGqfsrj/1HHB7lKhCnVz1sW5u/XkYNSFM2KNvJF161TnGDhnm7/YvioNnjmR9vUKlqVT7PBFQ==
X-Received: by 2002:a5d:5d88:0:b0:429:bfbb:5dae with SMTP id ffacd0b85a97d-42cba7a8100mr27345858f8f.17.1764188378909;
        Wed, 26 Nov 2025 12:19:38 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8baesm42816445f8f.39.2025.11.26.12.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:19:38 -0800 (PST)
Message-ID: <f5220043-f685-4778-9fc7-9c3585c01fb3@gmail.com>
Date: Wed, 26 Nov 2025 21:19:37 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/11] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-10-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251122110032.4274-10-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/25 12:00, Antheas Kapenekakis wrote:
> The quirk for selecting whether keyboard backlight should be controlled
> by HID or WMI is not needed anymore, so remove the file containing it.
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  .../platform_data/x86/asus-wmi-leds-ids.h     | 50 -------------------
>  1 file changed, 50 deletions(-)
>  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
>
> diff --git a/include/linux/platform_data/x86/asus-wmi-leds-ids.h b/include/linux/platform_data/x86/asus-wmi-leds-ids.h
> deleted file mode 100644
> index 034a039c4e37..000000000000
> --- a/include/linux/platform_data/x86/asus-wmi-leds-ids.h
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H
> -#define __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H
> -
> -#include <linux/dmi.h>
> -#include <linux/types.h>
> -
> -/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> -#if IS_REACHABLE(CONFIG_ASUS_WMI) || IS_REACHABLE(CONFIG_HID_ASUS)
> -static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
> -		},
> -	},
> -	{
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> -		},
> -	},
> -	{ },
> -};
> -#endif
> -
> -#endif	/* __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H */

