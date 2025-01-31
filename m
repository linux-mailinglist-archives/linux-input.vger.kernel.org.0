Return-Path: <linux-input+bounces-9634-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B521A24109
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 17:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C126918844CF
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 16:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3052F1898F2;
	Fri, 31 Jan 2025 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R598+GO/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183D3335C7
	for <linux-input@vger.kernel.org>; Fri, 31 Jan 2025 16:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342259; cv=none; b=p+869B4Uv5p/3nXH09hlAMgNZyrdrbXOEonG37waW9DWskFNVHBB2aKyPgZ+k1KFgdbkYxMCnpevJnO8mnzbnikGh86uUD9nz5o6/GAsyulpx5YFTXYd4emzrU4JDr4QRlVJPiUSrYxXeBCheMkaOSofYGp2B837oyvk/Cygu2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342259; c=relaxed/simple;
	bh=DZglw2xZvkHRFQ9IietiiVAvR9LNjMK6g3KH/6/z37w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pjHBcc9lV2TaCa+WqMy6h65Z7ZPTO9l0P/jDSYiTphgMknmJDc8ARkeAhXmCUfp0lpLTx1YUAcdEWVL7S0YdUgMOLPbW61UNXulc6IvjD5RLxa9yUNDUhBHwf6n4M/vnxppy4pY2udftVml9+x+V+gLHZ1QGy21KsFzapj3+W3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R598+GO/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaeef97ff02so381687466b.1
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2025 08:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738342255; x=1738947055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wlo1XDXgB7QmkNyLqb4pJiZuZmFIQpYWfJ+cFEsjg2U=;
        b=R598+GO/LIH9QgBruN6TX57wcV+lFOmRTxKx9Q5nJqG/JFXKJq7IKfx+B87YhezlOk
         yH/Krm9rvJGxwyPWXRRNGGLhwbC0XoxBZa0k/nPGmc/EaboLMVGfOFkrnEZYQJFGEuxj
         QYQjxffhtfyRNHhUAj594+JDNRGWCZloGZLTrBrCMP006w7G//pKheNIuhm88UT1VbjB
         9ffsO/hL6nyYIF+SfBTsvjP6pSKjATw2booiULTSHHIDvUTS9ncG9v37ROWHFzVAIEh4
         bnjFjwh1+ajLge1wzIP+7llpwj+xyX3oDhW3Qb4O0NT24aK6wUK7Q9aNAJlboSVk3ncn
         F9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342255; x=1738947055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlo1XDXgB7QmkNyLqb4pJiZuZmFIQpYWfJ+cFEsjg2U=;
        b=LodItLsEaadJr7gCNCMbXKK1lyq4ShEiXkKRgAcKPDvA/kA6lt0y5cyB6JVFRSfKGk
         FB7S5+Kj0D5m0kBJYMgFe/kfgWoz2spOe1VeaOAjJklRnOP3dQ+kWBrGgG7OKmc9DCI7
         wbTQ3zVFZN7Hzil4A3X3f0nkgy+vKIi+O683O7a7Z9Zu7A6CJDXDIAga7Yeo02z15O3Z
         /+PaFwLQ66oF5d4x4ohiIypDDenkfyRKyKitzL0aL+7Hgu+y24P2u3JgS9s/r+PVym6U
         ciiT9dJ85QUxtqecrMyaboMJb6jtufXlm+sylfN3HXdqI+l9ihBs00inb/tal7vysibO
         0xUw==
X-Gm-Message-State: AOJu0Yx9g8tfdON1XzQESCLBSJosogVmYX4zC9I1v9c1sZdzTDuJLyCN
	fL4pdYuExnUTU5OqZ727VjWCs3VCWeXexilineWuVAoKp1DIACP4AqIRl7lb
X-Gm-Gg: ASbGnctSewTIZVIPDNiYji/vyRbSLAAS8BbfqwisQyR54aZ6WwsrrIOIFWwx6EW3z3L
	ORfy4qalxybBKGh7ojYU09+zq5pyS5JOyRDyLBbcaNkMlIgPuVWpdQ7vVEx6hX7DDsizVPHoLXE
	9We2xbEkJ1JGaB0NqPSeOVh7fQJUTUsn5dKxDmWOBu3Wko9BTcS1FKTKkuYdlqNfUJ0FcGZovzJ
	ELiJQHBKeQTAi7bWfmBr838R+irwLGZD+2Ea/UsH+msB1oCu6fGkNQlgQaUrFPqvwqf6KacNDC9
	eO78mGJAoiIj9gCj45LktFm+xJwnDUWb3xdTu3tkMJufUw+IhtHp2LerXncR
X-Google-Smtp-Source: AGHT+IHzFUzP3hbfPr4DxTx+bYZ92O3AAoAiIoDyIVrYjlqFqlTA8fLXVsfF1c5If+fMm7py0LAkag==
X-Received: by 2002:a17:907:2d8f:b0:aaf:117f:1918 with SMTP id a640c23a62f3a-ab6cfcb35a6mr1391364966b.5.1738342254935;
        Fri, 31 Jan 2025 08:50:54 -0800 (PST)
Received: from ?IPV6:2001:16b8:b49f:f600:30a7:137b:c10c:d47? ([2001:16b8:b49f:f600:30a7:137b:c10c:d47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab6e47d0fa3sm320486566b.47.2025.01.31.08.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:50:54 -0800 (PST)
Message-ID: <95f1f209-4b97-417b-b0f6-2245458fa1f5@gmail.com>
Date: Fri, 31 Jan 2025 17:50:53 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: xpad - add multiple supported devices
To: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
 gregkh@linuxfoundation.org
References: <20250123175404.23254-1-rojtberg@gmail.com>
Content-Language: en-US, de-DE
From: Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <20250123175404.23254-1-rojtberg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 23.01.25 um 18:54 schrieb Pavel Rojtberg:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> This is based on multiple commits at https://github.com/paroj/xpad
> that had bouncing email addresses and were not signed off.
> 
> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index b434a465bf72..0399fbf33835 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -140,6 +140,7 @@ static const struct xpad_device {
>  	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
> +	{ 0x044f, 0xd01e, "ThrustMaster, Inc. ESWAP X 2 ELDEN RING EDITION", 0, XTYPE_XBOXONE },
>  	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
>  	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
> @@ -177,6 +178,7 @@ static const struct xpad_device {
>  	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
>  	{ 0x06a3, 0x0201, "Saitek Adrenalin", 0, XTYPE_XBOX },
>  	{ 0x06a3, 0xf51a, "Saitek P3600", 0, XTYPE_XBOX360 },
> +	{ 0x0738, 0x4503, "Mad Catz Racing Wheel", 0, XTYPE_XBOXONE },
>  	{ 0x0738, 0x4506, "Mad Catz 4506 Wireless Controller", 0, XTYPE_XBOX },
>  	{ 0x0738, 0x4516, "Mad Catz Control Pad", 0, XTYPE_XBOX },
>  	{ 0x0738, 0x4520, "Mad Catz Control Pad Pro", 0, XTYPE_XBOX },
> @@ -238,6 +240,7 @@ static const struct xpad_device {
>  	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
>  	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
>  	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
> +	{ 0x0e6f, 0x015d, "PDP Mirror's Edge Official Wired Controller for Xbox One", XTYPE_XBOXONE },
>  	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
>  	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
>  	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
> @@ -276,12 +279,15 @@ static const struct xpad_device {
>  	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>  	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
> +	{ 0x0f0d, 0x0152, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
> +	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
>  	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
>  	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
>  	{ 0x102c, 0xff0c, "Joytech Wireless Advanced Controller", 0, XTYPE_XBOX },
>  	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
>  	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
> +	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
>  	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
>  	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
>  	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
> @@ -366,6 +372,7 @@ static const struct xpad_device {
>  	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
>  	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
> +	{ 0x24c6, 0x581a, "ThrustMaster XB1 Classic Controller", 0, XTYPE_XBOXONE },
>  	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
> @@ -376,8 +383,10 @@ static const struct xpad_device {
>  	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
>  	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
>  	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
> +	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
>  	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
>  	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
> +	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
>  	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
> @@ -385,9 +394,14 @@ static const struct xpad_device {
>  	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
> +	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
>  	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
> +	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
> +	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
> +	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
>  	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
>  	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
> +	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
>  	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
>  	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
>  };
> @@ -486,6 +500,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
> +	XPAD_XBOXONE_VENDOR(0x044f),		/* Thrustmaster Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
> @@ -532,10 +547,13 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
>  	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
>  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
> +	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
>  	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
>  	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
> +	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
>  	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
>  	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
> +	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
>  	{ }
>  };
>  
> @@ -688,7 +706,9 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
>  	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
>  	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
> +	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_led_on),
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
> +	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_auth),
>  	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
>  	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
>  	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),

are there any further changes that need to be made here?


