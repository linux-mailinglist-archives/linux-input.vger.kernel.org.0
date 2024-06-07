Return-Path: <linux-input+bounces-4199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 706538FFFDE
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 11:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25B5C1F28279
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 09:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1767F61FD3;
	Fri,  7 Jun 2024 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PG9irXft"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69949200A0
	for <linux-input@vger.kernel.org>; Fri,  7 Jun 2024 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717753616; cv=none; b=PC0AxkTwXWAmAT9Oyg6wdH715W9vQNwx6GG8em5afXc7ad7EQGdvPTPb/WiYUA20Emg/V+Doap2T7rJECU2xAO5LkhCt5P650GNLgAND8qAVXukp0eObvtpA2hCBFmXxZ2GfDD6oMQCj4gw5L0Ewz09KzBLuIdXoOvGFdLe510w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717753616; c=relaxed/simple;
	bh=geJsdnnB8vocn1hNk5TZnKdTIp90hB9sTIstXRRcKpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n/fGXMIXM2YozSg6h6etQq5U3bXa8JCqwTaNFVXQIMz5ayWd450bdD0qQrIJ76JKjCw51MYmDeE85ym/KxvZmUNo/HJ31+KHMpRGD0D+U9lbzrL4bMRt/D63YglONDJc5UaK+hWhdeOzA9vU47ndeSMhbKgDVkqCm9rfkJixvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PG9irXft; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42166eb31b2so4533195e9.0
        for <linux-input@vger.kernel.org>; Fri, 07 Jun 2024 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717753612; x=1718358412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZTaK/zqk7WWKF+8+1u5yyeVNslNsfISH2CfJHGN/xE=;
        b=PG9irXftNlCsXdRQHNH95N08usMjszyv90ZsTQAzOTiBRvxsvBBUSgh2UJN5ljzTnb
         1M1hG/KUWQG0iCaIctPAZKsJn4cYYh1zFwVTQPqmLskEBpkRQvxbSfpDFn0NZm5mVgxp
         DZcyytCd58h7ELqATDdNdrSsV8hsaXAL6Q8DNGudp1aG5I6ETluec7bo7R0viLG2iV44
         Mu4Y0W44ixXkqUI8FNB5evV/pwsQEjCbbTH4D1ZpbpS90vLvnP7k28goPsjhiWGmyayc
         uH5yKatovkRsYf1xyB4vDRAgTHcnomFiCX/t4avvgMC5FYJRpGp2OJqu3EgkCh1vRYke
         M26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717753612; x=1718358412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZTaK/zqk7WWKF+8+1u5yyeVNslNsfISH2CfJHGN/xE=;
        b=OMis8ifczrbHsbtgFsQ+TTqCMij3cWaMw/3ZjwIJ/Bo8z6kOC+CyU0Y9Je4qpihreu
         DoiBHHtAboTotxWAqFgosJK8hnv7A85FQFHNRq/ygl5Z5xP4kTnwLMvg/z06RPTIgacG
         KfD1SrUyzg+ybhgxIk7YVXEFd2q7N0A94Ui6aCt4Ayvvoiss+w41bPAhlvLxTja33G4g
         AnctSg1ZOh7nGW+H4z0SM58E2au7EepIEkOwjftmIaBIZTjA+2WPJBD8WeqzFFSlDZF2
         8Rbv2X8Yv42rkuRfHF7aC3LZmZFZPEzAfaBBQXAJCHiIS7Dz50qj/b+nqjzOB8yq9Rpm
         i1KA==
X-Gm-Message-State: AOJu0Yzw7KO41kZI3+8Ac+8rMW5paTrXhVZeXbWGpkvL+WFYPteQGq6M
	WfJt8cd/AuXG1BvNCKdd+EfP4t3x7/kYZ3Lx1ypkBJTnyT0rPg2f3rmo6lE3I7M=
X-Google-Smtp-Source: AGHT+IEb6ui/fVgZkJDUdw7n6nmMjo4RKTrNdjAmnDut2YxmY/PpVzbLBWHQsKPA7GAsznZe81lK0Q==
X-Received: by 2002:a05:600c:4ec7:b0:421:73e6:faee with SMTP id 5b1f17b1804b1-42173e6ff15mr3452355e9.34.1717753612075;
        Fri, 07 Jun 2024 02:46:52 -0700 (PDT)
Received: from yuki-p.localnet (2a01cb080b6cd900a25451af8350d755.ipv6.abo.wanadoo.fr. [2a01:cb08:b6c:d900:a254:51af:8350:d755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490cesm81239305e9.31.2024.06.07.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 02:46:51 -0700 (PDT)
From: Louis Dalibard <louis.dalibard@gmail.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org
Subject:
 [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and 4116 on ASUS
 Zenbook 14 OLED (2023) and ASUS Zenbook Pro 14 OLED (2023)
Date: Fri, 07 Jun 2024 11:46:51 +0200
Message-ID: <12465690.O9o76ZdvQC@yuki-p>
In-Reply-To: <2747286.mvXUDI8C0e@yuki-p>
References: <2747286.mvXUDI8C0e@yuki-p>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hello!
Is the whitespace damage still an issue on the latest email?

On Tuesday, June 4, 2024 11:57:44=E2=80=AFAM GMT+2 you wrote:
> The touchscreen reports a battery status of 0% and jumps to 1% when a
> stylus is used.
> The device ID was added and the battery ignore quirk was enabled for it.
>=20
> Signed-off-by: Louis Dalibard <ontake@ontake.dev>
> ---
>   drivers/hid/hid-ids.h   | 2 ++
>   drivers/hid/hid-input.c | 4 ++++
>   2 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 61d2a21affa2..72d56ee7ce1b 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -423,6 +423,8 @@
>   #define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG  0x29DF
>   #define I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN 0x2BC8
>   #define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82
> +#define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C
> +#define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116
>   #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN 0x2544
>   #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN 0x2706
>   #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN 0x261A
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index e03d300d2bac..0d21590e2d2c 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -377,6 +377,10 @@ static const struct hid_device_id
> hid_battery_quirks[] =3D {
>     HID_BATTERY_QUIRK_IGNORE },
>    { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN,
> I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN),
>     HID_BATTERY_QUIRK_IGNORE },
> + { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN,
> I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN), +  HID_BATTERY_QUIRK_IGNORE },
> + { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN,
> I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN), +  HID_BATTERY_QUIRK_IGNORE },
>    { HID_USB_DEVICE(USB_VENDOR_ID_ELAN,
> USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
>     HID_BATTERY_QUIRK_IGNORE },
>    { HID_USB_DEVICE(USB_VENDOR_ID_ELAN,
> USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),





