Return-Path: <linux-input+bounces-9806-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32920A29BD5
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 22:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A651B167BC2
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 21:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B03F20FAB9;
	Wed,  5 Feb 2025 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV7XxIQW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A31FECAC
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738790705; cv=none; b=dart6O08lq5Diyn7vbBSHnLUCEIC5mcVTY4br0YhSqwAUuBO9LC10RZ+nh1mzcKp629XHIpHdI2sNpqJdy7Gk3z2oRhN9sfEtg6y7lOzi1r/0S8c6OY6uRhoBfSPfoFT81so/Zf25dfVT2zfkQlSIvOeg68tw+B8VR7Cmg3uGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738790705; c=relaxed/simple;
	bh=VAcLtyqgTNLAXIPeg6L/B73KD3vZrEgmnhOmKANnVd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uAt0zTUujQyBFjthXCCTf0goUURdzE9hCvxYzGy8p8jqwKM6xmyugKhL6Ft06s2PW8H05+VaTc+9WqvugK233Sj4rkCiG7tOlf3Zub56rKUYuRpxEWrNuxaAbuZVIIoQW6lXxE/lH/K5L65OzGEuBLFGfZ+jDRaROniTSJD0UYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV7XxIQW; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e43a496908so1705826d6.3
        for <linux-input@vger.kernel.org>; Wed, 05 Feb 2025 13:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738790703; x=1739395503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da+EG8NDrxbR/ciSC9tOMhiRW26wRXI5KW/H9EvF5Mw=;
        b=cV7XxIQW7QCSwdqAItohtb5/Xrf6j/hIxEgy0qeo1yOD7SPUxt7TNvREW/9vv8AN1F
         q4SAZIMVQsmXC6KmxAPtPJFJhnZdaa5UngAl/PoViUepl38JkMXtfpXQ1+F9wEy2Mm3b
         G4bvBIqol35NKjfMakjCbR+hcwd+bhykIcx0B1NKXwy1qbKPwyLJvsaVc3/23okViSU8
         NJM245T0JdnqH1asQNOg0PExTvQ/NSs3iKagMpthDJWc9sHKpOih3r9rS2+6Kv6/zLuv
         bU+WRacNcLPRFo4zydALJZ3Ld/fhDWrrq5qpOlo2UuWIaX2eBJ4f3Zs0RJsFFrTvLNuz
         7wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738790703; x=1739395503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=da+EG8NDrxbR/ciSC9tOMhiRW26wRXI5KW/H9EvF5Mw=;
        b=ZbvuYgpVssMMxRYUu+siB4VU9YpgL1gJO7HKgFQK40BnA7V6M4jKDrczOD0Z5Iat4v
         VcDLlGiwGPuTjBmalteowfLNo89/ZkLIbrx8lxUUMn+tHiKToy4griuI1rqZ1PEWGNLc
         2BlV4tSEDBijWZj3RZBAR4MRpEtVOl8eGt3E1sZRM8ZhpyrN6Whpa234YRFV5pUUunY2
         BheZ2CoPaMDhI4DjL5SGiUaDTAlsU9IcyQh0SOK/iu50ZMeVSuef/GuBjjTHsk34NCYI
         cVrjdmg+0pl374ASr4nZ1e+dIjS65Diuc7QzUJa4vpboZwFDSoJIt5otOZYsWVgnSi6L
         yTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQtc3sghitQQvxwPzzutLxLa0PN3UzUXj2fO1kK1n5wfZ/rTMSIARbk5b3hshwKknCPrzq/3R3RC6SWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzECZnNTS0Qba0Sh/4tDXR3Rsb9IXPOUUVftMDJG16SEScG6QVn
	L0yyCctsX9jqYvvw2PnXnkRC4VLJ+uGE1577DG3AOfhHlYfv69xCJxf9z3p64yNkiD64hNLskdu
	/J+ixk4Cry6dqtj2BKpwvjGFLZG8syg==
X-Gm-Gg: ASbGncso7dHbQNxhYDOCAFdTtZfKEe1RpkCthIZki3F+JYrAilJcc/qUf9U2vpX1AzP
	GzV3wHNTAu6sQlysMuJMzgfwg8ejL+rvDEeHr6sSpVjoaYyC4Oupz5WG2eOqGtUiLSITU+vsIUV
	9e5UgQ0ZLgMQ==
X-Google-Smtp-Source: AGHT+IHnQ9o8xPQhLrjT/dSDsnOearueJoE2SI3ST89s4jpn9lYuWXtrkgi9FYWMZH7vElg1m8QYdlqt4rDc9b/FL4Q=
X-Received: by 2002:ad4:4ee8:0:b0:6d8:a754:9647 with SMTP id
 6a1803df08f44-6e42fbb8be9mr59517676d6.17.1738790702651; Wed, 05 Feb 2025
 13:25:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205202532.2586-1-dhenrale@amazon.com>
In-Reply-To: <20250205202532.2586-1-dhenrale@amazon.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Wed, 5 Feb 2025 13:24:51 -0800
X-Gm-Features: AWEUYZn1YBXqQvj9zHkLbVWg0juyinzE8bK6HVCBEb11bRJr8RRsePXXd9ayvpg
Message-ID: <CAEc3jaDtBwBdH2sqMFqR+0C+GeNJ5-p0JB7ruxwfmnB9CnfuZg@mail.gmail.com>
Subject: Re: [PATCH] HID: Enable playstation driver independently of sony driver
To: Alex Henrie <dhenrale@amazon.com>
Cc: roderick@gaikai.com, roderick.colenbrander@sony.com, jkosina@suse.cz, 
	linux-input@vger.kernel.org, alexhenrie24@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

The change in general looks good to me. It had been an oversight.
While add it, I guess also include the PS5 controllers in that list as
well.

Thanks,
Roderick Colenbrander

On Wed, Feb 5, 2025 at 12:28=E2=80=AFPM Alex Henrie <dhenrale@amazon.com> w=
rote:
>
> PlayStation 4 controllers use the hid-playstation driver now, but they
> are still not included in the hid_have_special_driver table unless the
> hid-sony driver is enabled. Split up that section of the table so that
> hid-playstation works even in the absence of hid-sony.
>
> Fixes: 4f1f391869ee ("HID: sony: remove DualShock4 support.")
> Signed-off-by: Alex Henrie <dhenrale@amazon.com>
> ---
>  drivers/hid/hid-quirks.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index e0bbf0c6345d..ff23a7ac7001 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -595,6 +595,13 @@ static const struct hid_device_id hid_have_special_d=
river[] =3D {
>  #if IS_ENABLED(CONFIG_HID_PLANTRONICS)
>         { HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
>  #endif
> +#if IS_ENABLED(CONFIG_HID_PLAYSTATION)
> +       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTR=
OLLER) },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4=
_CONTROLLER) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTR=
OLLER_2) },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4=
_CONTROLLER_2) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTR=
OLLER_DONGLE) },
> +#endif
>  #if IS_ENABLED(CONFIG_HID_PRIMAX)
>         { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, USB_DEVICE_ID_PRIMAX_KEYBO=
ARD) },
>  #endif
> @@ -664,11 +671,6 @@ static const struct hid_device_id hid_have_special_d=
river[] =3D {
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3=
_BDREMOTE) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_CONTR=
OLLER) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3=
_CONTROLLER) },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTR=
OLLER) },
> -       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4=
_CONTROLLER) },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTR=
OLLER_2) },
> -       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4=
_CONTROLLER_2) },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTR=
OLLER_DONGLE) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_VAIO_VGX_=
MOUSE) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_VAIO_VGP_=
MOUSE) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SINO_LITE, USB_DEVICE_ID_SINO_LITE=
_CONTROLLER) },
> --
> 2.46.0
>
>

