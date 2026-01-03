Return-Path: <linux-input+bounces-16774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9166FCF04F1
	for <lists+linux-input@lfdr.de>; Sat, 03 Jan 2026 20:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 640D43007DA6
	for <lists+linux-input@lfdr.de>; Sat,  3 Jan 2026 19:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97832F5A13;
	Sat,  3 Jan 2026 19:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8jjDAg4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB1A2F39A4
	for <linux-input@vger.kernel.org>; Sat,  3 Jan 2026 19:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767468422; cv=none; b=cgWXitCI1dTzYNSVycjWN4L1ZGf1uHeonGtK+bkbt+1bjo0pQqUWBMF2FPs+wKd1PAFCvMRhy9nOygPEVR0A66Q8/SjaWQ2AmZSJI0YQMpzobDCLzth3Em5J3i0hXFn5SVH9YSRqfk5yPxqnBTOKXdWiWymXofcSXqb8/PiuPrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767468422; c=relaxed/simple;
	bh=USUr402xky8qZKtLXl+S8nXqb7lMmdeZ2bTnihERaK4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VQRPc4aeecrvLLRor1jNZS9a00vPDuhMq8gR7QI6pAtQ7zugWn/38UN3mSI2q9HVRojwEr6HHlDhnxfvGR8h+AZ82zvizzGqa4xX9/x+xkKdn/8+1nTkWvFjDYCaJdRYx+LMJg58S9+Ax+6E34Jvwq2TcufnNxV30tjSfNjPwhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8jjDAg4; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64b5b68a9bdso3034066a12.3
        for <linux-input@vger.kernel.org>; Sat, 03 Jan 2026 11:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767468419; x=1768073219; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0YIpUGyjZeQ1hIu17wUUibrHabtf3OYqJ9BhBNRsf4I=;
        b=R8jjDAg4/pIYNwipd4KylgXg3grDlD0uP40jDlVbm3+EkXGAcgSMXKnaa63EYcLzdZ
         fVY09jvhgaXpxJEXe2mg76vzJPaR84yniLxlvkzt+5JAcEfeEqoVDZkUOuOzNggs+6e+
         l7Y2THTXZ4T6Q3SD7fo4t37IATLiS3iwk1K993c4zVCFjvi8oYl0WqXVv8JFbFEsneq/
         T2rWqv2dPfKX1mCgXKnPaR0rRdwR/C2qWHFI7oB+RyLqJDtZrGx18bFBSwtPJ5Rx5xFF
         bzAWeCIo6HBSvCWgpmqapxGqVtsEtU9XJ3NYOaQsoMSSffLSbU6+8DE63JRhsLdjS9gJ
         4q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767468419; x=1768073219;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0YIpUGyjZeQ1hIu17wUUibrHabtf3OYqJ9BhBNRsf4I=;
        b=oA7E/Oy76UNZrp7JEWXsgXRf/Hn716ingL33Dr1OGx22/R/d/x/dBfVYYgToAdBkHg
         KpGzdPHUe63Tp//+KYx9blbFhk2rdrt2EsNzVJwWvn3HLe4vVtiXKEvZjP1GxkMzoq6m
         SmmF4d7Ap2H4kJ4qYgXJoJu8PCRudKtq4NEFpvfmjIX56E/23dZG4eRhvanh1Af8GuFo
         pus9XPQpaG1JWCiZwr2UeobSW3BwfJUqqDLsUyNTv3EA/C8Lhf71Yxfa+6ncaunKkjd1
         fUGjxvFCq6uQkoe8p4/0n0Fhe+IGKa9FYxQuZn+L+bc10rwrumHFvuU4kE7upBNNjBhB
         AdNQ==
X-Gm-Message-State: AOJu0YweR13Tyf4ElgAX+89S50WRod0HR1lnet8b/xO2EF4jYBvIQUxl
	x/gUwFTRntWSGTY3u93ZrCq93lMio632u74eVj56qH8eVc/YgJvEpeBS
X-Gm-Gg: AY/fxX6c/Wrx3TerlCfrAjC+rJXIojOKDdOZJ2mecWtHiNO2ZdkbOF8vowYHitWdLK2
	ViX1sIrzkle1EBHAMaCuvzY0nd2bg5zXjg1mvXmYg9aJtWVdEx5Wt7DqWlZkQXyO0uBtfPYuNwX
	UfG6qjvrZANG5hPDnkkFQVQnwlrnZ0X3vYBVyd2rDe8H7dz2oig69Tru4cljbPKVHfdVXV44qPU
	z0rQjmLjVDS6O1TcuSmTGmS3ubpOsaygNfr2pYBkREWoH+zZ9QkpZX1RJqbvfRfLN9Q5nCF5roZ
	nRSDBMuvtCxvEkfaPfUI2ExLU5sGXFouDsff2ScjhhjSk3QfunrYyfLR4yx0cgse0Ryv10RRpZ7
	iVr6Iz2TgOmWznL8QFAc6uvdJek/f9lZzJyhmC9S6jAnCOASBNJRFRNizB05dmuCvdinSJRRHXX
	25hiwCRotIFNbWbADHXekfxKwuiJmp4hfLnUjX7lN+CfD16Yr5L89vhneGxt2EVeVnzfGxR3Y=
X-Google-Smtp-Source: AGHT+IEiN9Ud/fpsuQoca5F9zZaed0a70Qr1os9Rvjp+82tI4/y/EQrC7dOQ9bc79+wQPVmYiLuDAw==
X-Received: by 2002:a17:907:7209:b0:b76:3548:c34c with SMTP id a640c23a62f3a-b80372602eamr2410663366b.8.1767468418981;
        Sat, 03 Jan 2026 11:26:58 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de0deesm5047840866b.37.2026.01.03.11.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 11:26:58 -0800 (PST)
Message-ID: <aa40f6010c721863c09673fc8801e0a382619d89.camel@gmail.com>
Subject: Re: [PATCH] HID: input: Increase maximum number of joystick buttons
From: tomasz.pakula.oficjalny@gmail.com
To: Ivan Gorinov <linux-kernel@altimeter.info>, Jiri Kosina
 <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 03 Jan 2026 20:26:55 +0100
In-Reply-To: <20251220194100.GA12646@altimeter-info>
References: <20251220194100.GA12646@altimeter-info>
Disposition-Notification-To: tomasz.pakula.oficjalny@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-12-20 at 19:41 +0000, Ivan Gorinov wrote:
> This patch increases the limit from 80 to 112 key codes.
>=20
> If a joystick has 80 or fewer buttons, mapping stays the same.
>=20
> If a joystick has more than 80 buttons:
>=20
>   Map buttons [  0 ..  15 ] to key codes starting with BTN_JOYSTICK;
>   Map buttons [ 16 ..  47 ] to key codes starting with KEY_MACRO1;
>   Map buttons [ 48 .. 111 ] to key codes starting with BTN_TRIGGER_HAPPY.
>=20
> Signed-off-by: Ivan Gorinov <linux-kernel@altimeter.info>
> ---
>  drivers/hid/hid-input.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 2633fcd8f910..c6159f96de04 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -763,7 +763,13 @@ static void hidinput_configure_usage(struct hid_inpu=
t *hidinput, struct hid_fiel
>  				if (code <=3D 0xf)
>  					code +=3D BTN_JOYSTICK;
>  				else
> -					code +=3D BTN_TRIGGER_HAPPY - 0x10;
> +					if (field->maxusage <=3D 80)
> +						code +=3D BTN_TRIGGER_HAPPY - 0x10;
> +					else
> +						if (code <=3D 0x2f)
> +							code +=3D KEY_MACRO1 - 0x10;
> +						else
> +							code +=3D BTN_TRIGGER_HAPPY - 0x30;
>  				break;
>  		case HID_GD_GAMEPAD:
>  				if (code <=3D 0xf)

As stated previously by Dmitry when I tried to increase the KEY_MAX for
the same reason, the defined usages have their place and shouldn't be
misused. I finally understood that and I have to say that this is just
more confusing and a dirty hack, certainly used by some drivers because
it still works with SDL and Wine (they only care about the usage index).

I'm working on a proper solution with a new event type that will only
send button number (starting from 1 as does plain HID) and it's value.

This will support up to 65535 (u16) buttons and should be enough for
years to come :D I'll make sure to CC you when I'll send RFC.

