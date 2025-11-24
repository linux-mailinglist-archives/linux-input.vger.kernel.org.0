Return-Path: <linux-input+bounces-16320-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B618C82221
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 19:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 710C0349DA8
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 18:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA0A31987D;
	Mon, 24 Nov 2025 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTu/H58S"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B757E31985C
	for <linux-input@vger.kernel.org>; Mon, 24 Nov 2025 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764009772; cv=none; b=NIjZlS40ZZdJsFZlEtbD5TQZlkNmoRuyOy91gX1Egqxb0weMCgDjFaMQtmmYObxYbbFu6mRcQp6NFrwZjmOtayKJyG4M0z/kDrmI18tiT3IeNKFNPrGfhrfLADdx8uEzdrERiqVYvmQIWddYaKdz2ekDPCXDgAb9R+NMtbcZUSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764009772; c=relaxed/simple;
	bh=4zv3PdwVNkz56gSyrllnr44HRqaValL/E3kwYnLlhsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjUN/qmSTQIltwxyxTlnvH1UUuCHNOQ94M4Kpg2FMAsd1t+B1rZNhusLopgyezCLweYAnrPkWQPL/OQusVkBTPHyc58IaWnZHvKu9HfnwItfsiEbFqtnrGW/VF5diJqq0fdhRH+Ww9igIO0V4i3zfQS3LxbxVJTbafnjyeDTxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTu/H58S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F28C19423
	for <linux-input@vger.kernel.org>; Mon, 24 Nov 2025 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764009772;
	bh=4zv3PdwVNkz56gSyrllnr44HRqaValL/E3kwYnLlhsc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GTu/H58Sf+NJh68OhM1XK6L6r5knguL1+CJYWQ2J5WyszvD/M7/xt4b4SHCdwLEsp
	 Rb9f9C7NAz29LaIy/OG2gGl5msYTc820GQiqSsfBGCY9/IR3fM0Lf8j+Uz69/AEy+l
	 AYYjyTRkRcPL7gdfkCil0TVTVb7wXsQdOb9gHxYOG3vk4ghcRIqZzfcdDvhyOIWY5R
	 y5Br5PJcGJI6holWJc4jlyV21HNfhTuvDr2Ix6QqV8snoSeBPAgDwO8BXbIqwMvBfc
	 fqWvMEaSEUrOjb6r19k3AjkcU2XJQ/297N6z54gptC1b/+aPT5lYopZT2LwGMHtTMM
	 vmGopB9Bkbkig==
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-450b3f60c31so1572484b6e.3
        for <linux-input@vger.kernel.org>; Mon, 24 Nov 2025 10:42:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMfbJQmirku0edZ5Q+jX43CiUV6sY2LItvoc9L+gMPAKcBBLg6al76TsjRPX/kbQ98hXDklJ6Z+KcNDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTIIjJ08BXoFfbWlt8VAYFhV0ctCAZpsgOZ8NHYNCJztFgFITv
	337DCQQr6/bi0TF6wopvHo6wbKejgqcaWWhM/wkiWQ/zLDr33/U3fRsVtuqxlcrwKPQlJAsIfeq
	0VqHyniGnoKtddNqqQhM6FyLaRUzPr8k=
X-Google-Smtp-Source: AGHT+IEhM6N9TSqsWeJA5wThKBrxOGVdlq9voHQQxrdy06SWCCgEqKdIk4hEBWDZbNm2DTtkLyI6qo3u5V3dSm4XBII=
X-Received: by 2002:a05:6808:1481:b0:450:af35:8b1c with SMTP id
 5614622812f47-4514e7efee7mr65880b6e.38.1764009771841; Mon, 24 Nov 2025
 10:42:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107184438.1328717-1-usama.anjum@collabora.com> <20251107184438.1328717-3-usama.anjum@collabora.com>
In-Reply-To: <20251107184438.1328717-3-usama.anjum@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 24 Nov 2025 19:42:40 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iWCxXSw3fBbesoMEWqGrRL9xrD85pMoW8rPuBBwTayhw@mail.gmail.com>
X-Gm-Features: AWmQ_bltk1nKCTDeILyK8F-n51UW1Kksk-2_Q40QVBwGhl6mPDVhj8oD7VCItCU
Message-ID: <CAJZ5v0iWCxXSw3fBbesoMEWqGrRL9xrD85pMoW8rPuBBwTayhw@mail.gmail.com>
Subject: Re: [PATCH 2/4] ACPI: button: Cancel hibernation if button is pressed
 during hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-input@vger.kernel.org, kernel@collabora.com, superm1@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 7:45=E2=80=AFPM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> acpi_pm_wakeup_event() is called from acpi_button_notify() which is
> called when power button is pressed. The system is worken up from s2idle
> in this case by setting hard parameter to pm_wakeup_dev_event().

Right, so presumably you want to set it for hibernation too.

> Call acpi_pm_wakeup_event() if power button is pressed and hibernation
> is in progress.

Well, this is not what the code does after the change.

> Set the hard parameter such that pm_system_wakeup()
> gets called which increments pm_abort_suspend counter. The explicit call
> to acpi_pm_wakeup_event() is necessary as ACPI button device has the
> wakeup source. Hence call to input_report_key() with input device
> doesn't call pm_system_wakeup() as it doesn't have wakeup source
> registered.
>
> Hence hibernation would be cancelled as in hibernation path, this counter
> is checked if it should be aborted.
>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since RFC:
> - Use pm_sleep_transition_in_progress()
> - Update descriptin why explicit call to acpi_pm_wakeup_event() is
>   necessary
> ---
>  drivers/acpi/button.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
> index 3c6dd9b4ba0ad..e4be5c763edaf 100644
> --- a/drivers/acpi/button.c
> +++ b/drivers/acpi/button.c
> @@ -20,6 +20,7 @@
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <acpi/button.h>
> +#include <linux/suspend.h>
>
>  #define ACPI_BUTTON_CLASS              "button"
>  #define ACPI_BUTTON_FILE_STATE         "state"
> @@ -458,11 +459,16 @@ static void acpi_button_notify(acpi_handle handle, =
u32 event, void *data)
>         acpi_pm_wakeup_event(&device->dev);

The above is what you want to change, as this already reports the
event.  Reporting it twice is unnecessary and potentially confusing.

>         button =3D acpi_driver_data(device);
> -       if (button->suspended || event =3D=3D ACPI_BUTTON_NOTIFY_WAKE)
> -               return;
> -
>         input =3D button->input;
>         keycode =3D test_bit(KEY_SLEEP, input->keybit) ? KEY_SLEEP : KEY_=
POWER;
> +       if (event =3D=3D ACPI_BUTTON_NOTIFY_STATUS && keycode =3D=3D KEY_=
POWER &&
> +           pm_sleep_transition_in_progress()) {
> +               pm_wakeup_dev_event(&device->dev, 0, true);
> +               return;
> +       }

First, this will affect suspend too.

Second, this reports an already reported wakeup event.

Next, why KEY_POWER only?  Is KEY_SLEEP not expected to wake up?

And why event =3D=3D ACPI_BUTTON_NOTIFY_STATUS?  Isn't this what
ACPI_BUTTON_NOTIFY_WAKE is for?

> +
> +       if (button->suspended || event =3D=3D ACPI_BUTTON_NOTIFY_WAKE)
> +               return;
>
>         input_report_key(input, keycode, 1);
>         input_sync(input);
> --

