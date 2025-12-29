Return-Path: <linux-input+bounces-16730-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 733D5CE6552
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 11:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16B3430053F9
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 10:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1141DE887;
	Mon, 29 Dec 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1g8X/TF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC021C860A
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767002682; cv=none; b=fZNyjBszVfnAGO/wdpywijy+6yGT3vMYD/T+QQ7z5k98+YOZfSOmUeAjnudKyoX60MrOu7UlAFPT8XWQ7gjezJNV9a2+0daCBjicDwmqFOV2QX74O7K4BQEuKvlFB8ZpyFLq6WZxzjIpLxtLm22KMUZVP994jdtfi+KitMuVv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767002682; c=relaxed/simple;
	bh=zoEuQGXPMMXitXwAFkHeFEupjOW1LaW2f278aNeNSBs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX93pJ7QSWdPyTQaEWxQIDsKT0Rh19Ufwpm8cVPE9DGXaFY3NJmNzYtL7Lzp8fuuGj+7GL8179MqHd3dYkCZcGojQdhTa2/GvJBNEHoj2RiqSl0OSlYWJ0uM6ofWdDGMFNf//hF20p6Z4Ciif/MLr2KLL4aaHf21Yzt1fjmhBnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1g8X/TF; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7ade456b6abso7234160b3a.3
        for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767002680; x=1767607480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JtstqOKN0zrVxrw+u7EGCgxzHxV1W0OEMkNNZDMIw3c=;
        b=f1g8X/TFlgGDzQQmRhER6WwUV6nJneuIlID1D8+wVAV9HOo+xdVp0Q1ow0rzwUjltB
         x/YXefvMeEtSHUlJfUuCQJAYoLplboluXjxjH/jQmZd5TOB2IbLZJTA7FRKEklkik5FG
         /E34MI4cAcfiuutz1dAZB2os4uKjjoWi/IfCLj1RrK3YHzrejy/bcMbVqAMiH6RhbCoP
         YNXCSwC6l8bFsnBloncFKh15AxCu9pRDAiMczmYQWPHCxXUT/CqL/dOFL0h7bagjq1lP
         Mz25ykiYIYZyVAtw4p78BbfJMumuXZx2vhYW6vi3VAwcooCXxiCQ+2NPXO42GD/ByQAS
         TqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767002680; x=1767607480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JtstqOKN0zrVxrw+u7EGCgxzHxV1W0OEMkNNZDMIw3c=;
        b=FGV/Smg1eUQhc0VAUuQiEDetaeZCO5Wnb0LRI+NtoOJMtXYBtvhRKHQBfjOLBWnr8P
         79RM8OQET7ZoMI7xgDt8KI9Y2pncnoEWms9BkQN3kQSuo3Tcd9OYNjooDHMToceAXywX
         Q2ozannvMAZxaAMvqRdlFoFIfUOto1ZaxNWE3i8JdvXz+nHG3CQVHFSvB94v4Dh+IEdk
         a8kyjMpyhOlgauEZANPCBmG0mTNURAvnR+NFT0RyNJQMfTlSUFTvNkv9CYcBLSxlppM2
         JuxfW7HFeSMkjhVNvVlHw5tQKGEDHE2Zt+B7U0ozlWlHv4eyPNepiERCsX7aXwgGeKEW
         P96w==
X-Forwarded-Encrypted: i=1; AJvYcCX7b9eMXXkqTFOChkHlp3N+KvPuH0i2TW74A3vknoTpfnXObQg+46+nA53IN9DJqLV2zc7fHMzNlvyd8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD1KNvIF4mCjsTJSkGCEfN1AyQ5qcEX6AF2uzQMcazTQywOZp8
	xaIATd0VqfnXL/wPZlB40jippIFWQlf6WY3WMz3HVFPLKUDWSrkiNfyUSkFMOX46Y2w=
X-Gm-Gg: AY/fxX7E8N5CtlgEm+44TG1tmsmBjlx98HYZyvuME9xOr3WHMhlJUk2df0VpcVHZoOa
	fR8qXIkFiYmzqch7+ZyH0zcMrqN9wDRSQyhp4n8YuVsKjFwT7HwQV9uS1FYq1Z3KP/mJORw/Gpz
	F6iDvvZHnVmyk2cq61WVDyDoNYENNy2kVrPgiFBIOB/Rr/EgctKn4APgxCoMmkk7x7OdKuLJdyO
	ICQO1x6fgWCbl6TsWZPsRROpF6WuqJtOpuBsLMLhajvM1sXSNcOgejUhObRWWsd2ENovY66QbLA
	VSjB5QQA79QIlIyZCnNTRdDa0T1U/WsGGf2S7z4jlvPA3pY501XAWtP4JfLpOn2PDj8BGqYOOp/
	lwGGErSWqoYdKVSzLtt2z1pZiI1eHoMCZ0Bf54vB8gidxyQETSQDcdvT6ul/pg2Jn6aVUF3JjHk
	IoXaL6LLmLxLU=
X-Google-Smtp-Source: AGHT+IEb8KXgnKL06RP3XdpiMN27G3eyF9IhReRnvUvZkLi+n8blQK0wsxaHTWEcVLtyAoDG9rnJQw==
X-Received: by 2002:a05:6a00:90a2:b0:7e8:4471:8ce with SMTP id d2e1a72fcca58-7ff6687188amr25324957b3a.47.1767002680024;
        Mon, 29 Dec 2025 02:04:40 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b22536esm28713816b3a.23.2025.12.29.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:04:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C8D3342A31AA; Mon, 29 Dec 2025 17:04:36 +0700 (WIB)
Date: Mon, 29 Dec 2025 17:04:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sriman Achanta <srimanachanta@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] Documentation: ABI: Document SteelSeries headset
 sysfs attributes
Message-ID: <aVJSNAB8AWpPAQFM@archie.me>
References: <20251228122025.154682-1-srimanachanta@gmail.com>
 <20251228122025.154682-4-srimanachanta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1cnivDY89T6isVm0"
Content-Disposition: inline
In-Reply-To: <20251228122025.154682-4-srimanachanta@gmail.com>


--1cnivDY89T6isVm0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 07:20:24AM -0500, Sriman Achanta wrote:
> +What:		/sys/class/hid/drivers/steelseries/<dev>/chatmix_level
> +Date:		January 2025
> +KernelVersion:	6.19
> +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> +Description:
> +		Reports the current balance between Game and Chat audio channels
> +		(ChatMix). This value changes when the physical ChatMix dial
> +		on the headset is adjusted.
> +
> +		Range: 0-128
> +		       0   =3D 100% Chat / 0% Game
> +		       64  =3D 50% Chat / 50% Game (Balanced)
> +		       128 =3D 0% Chat / 100% Game
> +		Access: Read

Sphinx reports htmldocs warnings:

Documentation/ABI/testing/sysfs-driver-hid-steelseries:47: WARNING: Definit=
ion list ends without a blank line; unexpected unindent. [docutils]
Documentation/ABI/testing/sysfs-driver-hid-steelseries:35: WARNING: Definit=
ion list ends without a blank line; unexpected unindent. [docutils]
Documentation/ABI/testing/sysfs-driver-hid-steelseries:62: WARNING: Definit=
ion list ends without a blank line; unexpected unindent. [docutils]

I have to fix up the bullet lists:

---- >8 ----
diff --git a/Documentation/ABI/testing/sysfs-driver-hid-steelseries b/Docum=
entation/ABI/testing/sysfs-driver-hid-steelseries
index 3066dbb486d363..5f6c703d40892a 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-steelseries
+++ b/Documentation/ABI/testing/sysfs-driver-hid-steelseries
@@ -30,6 +30,7 @@ Description:
 		the headset speakers.
=20
 		Range: 0-128 (mapped internally to device-specific values).
+
 		Access: Write
=20
 What:		/sys/class/hid/drivers/steelseries/<dev>/inactive_time
@@ -42,6 +43,7 @@ Description:
=20
 		Range: 0-90 (minutes).
 		       Some devices (e.g., Arctis 1/7X) map this to specific presets.
+
 		Access: Write
=20
 What:		/sys/class/hid/drivers/steelseries/<dev>/chatmix_level
@@ -53,10 +55,12 @@ Description:
 		(ChatMix). This value changes when the physical ChatMix dial
 		on the headset is adjusted.
=20
-		Range: 0-128
-		       0   =3D 100% Chat / 0% Game
-		       64  =3D 50% Chat / 50% Game (Balanced)
-		       128 =3D 0% Chat / 100% Game
+		Range: 0-128, where:
+
+		- 0   =3D 100% Chat / 0% Game
+		- 64  =3D 50% Chat / 50% Game (Balanced)
+		- 128 =3D 0% Chat / 100% Game
+
 		Access: Read
=20
 What:		/sys/class/hid/drivers/steelseries/<dev>/mic_mute_led_brightness
@@ -67,8 +71,11 @@ Description:
 		Controls the brightness of the LED on the microphone boom that
 		indicates when the microphone is muted.
=20
-		Range: 0-3 (off, low, medium, high) for most devices.
-		       0-10 for newer Nova series devices.
+		Range:
+
+		- 0-3 (off, low, medium, high) for most devices.
+		- 0-10 for newer Nova series devices.
+
 		Access: Write
=20
 What:		/sys/class/hid/drivers/steelseries/<dev>/mic_volume
@@ -80,6 +87,7 @@ Description:
 		This is distinct from the OS input volume.
=20
 		Range: 0-128 (mapped internally to device-specific values).
+
 		Access: Write
=20
 What:		/sys/class/hid/drivers/steelseries/<dev>/volume_limiter
@@ -91,8 +99,10 @@ Description:
 		When enabled, the maximum output volume is capped.
=20
 		Values:
-		0 =3D Disabled
-		1 =3D Enabled
+
+		- 0 =3D Disabled
+		- 1 =3D Enabled
+
 		Access: Write
=20
 What:		/sys/class/hid/drivers/steelseries/<dev>/bluetooth_on_power
@@ -104,8 +114,10 @@ Description:
 		when the headset is powered on.
=20
 		Values:
-		0 =3D Bluetooth must be turned on manually
-		1 =3D Bluetooth turns on automatically with headset
+
+		- 0 =3D Bluetooth must be turned on manually
+		- 1 =3D Bluetooth turns on automatically with headset
+
 		Access: Write
=20
 What:		/sys/class/hid/drivers/steelseries/<dev>/bluetooth_call_vol
@@ -117,7 +129,9 @@ Description:
 		a Bluetooth call is active.
=20
 		Values:
-		0 =3D No attenuation (mix both equally)
-		1 =3D Attenuate Game audio by -12dB
-		2 =3D Mute Game audio completely
+
+		- 0 =3D No attenuation (mix both equally)
+		- 1 =3D Attenuate Game audio by -12dB
+		- 2 =3D Mute Game audio completely
+
 		Access: Write

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--1cnivDY89T6isVm0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaVJSKgAKCRD2uYlJVVFO
o9asAP9NiMvKvaSG3GDjnwDvwraz5Li2WqbfE8yoyCZrrys4PwD/c6FxBqvETnJ/
owa7WY+sluPB8GqprtrO4nM64VfsGg0=
=qmZQ
-----END PGP SIGNATURE-----

--1cnivDY89T6isVm0--

