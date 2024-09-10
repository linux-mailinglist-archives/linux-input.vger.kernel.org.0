Return-Path: <linux-input+bounces-6396-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 372D5973AEA
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 17:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00529285A45
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 15:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1744A194088;
	Tue, 10 Sep 2024 15:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNMxBdNa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F16F305;
	Tue, 10 Sep 2024 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980620; cv=none; b=hAKr09DDRffdHskRsA4EpD/HTOhDN/5t8ecGrO36ZOcyKux0flEa2nn/ZJQw/JPvUFEMYSvrJEq09QQKHBA59DRFCpRW60+t8CypKFgBXa1sBL5glmbjEhpEq9LwMOKn/0iGZ06RZu3sI7gJYDvw3s6rE2KRU3McIr5qfFXlWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980620; c=relaxed/simple;
	bh=L4uVWHewif7qzcQrq8ke8AqdN3RuOOwwjsQJmh9d2I0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azzh9qI6IpOZ0cbYhp/OEX7sXbXThLAedWol4iTHaUWaxxr896IGMyhJIzAWVG/8LftUswsPaqFBpNbaA+texgWvT1PJxdCOtp8aSEFpyJeR4+XnSmi4O2yR5VzcFDXbpvVvnpaJYgTbqwek/HOXn/IsrsZMiFd8s1GOc3hZ4Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNMxBdNa; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d892997913so3698931a91.3;
        Tue, 10 Sep 2024 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725980618; x=1726585418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNWaH4HKBOq49FBNQe4vZska6uLQn9xVcwCe6JAOGWg=;
        b=eNMxBdNaGjWe7qimLEMUwpEzlb02UV82DwHFscFcp9iKSByv8vCUyjh92PZYnXtb9X
         Zw7XRnP//fn2MLnyVxMLsc/B/zNB4bILLr1F7l418LljvuZYYQA/bExleKxJsaNfEBS4
         yqd9N0iz9f9BvwXJgFkTVr8qc1H9lafnLRyHHtp3Iob/ldqZWAOcsOqvgtcFbr1ERENI
         eykKjuVVDxFZd+m/XjMuV6tJSDe8S6g714kMVc513DQhtLRUZTlTvuxZ5G+ZyJARM8yb
         rBdZ+TaUfK8pBTW7vr99VxSwdt+JawQpG9fWHOu4nGCEeT0dpcHTew6CLtfCZzNz6ojN
         yLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980618; x=1726585418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNWaH4HKBOq49FBNQe4vZska6uLQn9xVcwCe6JAOGWg=;
        b=h/mLRccW8+U+Y9T2Na58WxHNuXKaKmx89kCDwGM7n5KO4xbkt69MySj00LO/0W813o
         s/GUIFjDNTy9ak2OBqrnBvY2V+8kler5aakUfgXHEQ3OR31xZRxt/ADexDwkIp8+zIlL
         ba5H6lSSt8lue/TVKiGIcGAT9Jitooq8z2Z3uRji3cFNA5lLj+5wfhclVHfSiLYdjAUF
         hNYlq5cxwhwqMvw9dGvjrNnHofbPkV407GhJ33Psi4+mXcebVXD62QSKN3fJ42ccYzvF
         M2qGJAmVyi4WiEr6aVdSWOQdntmo2PIM+0CKJUecpijM7cUQG0JH9kIShHh23XOMD8T8
         P1Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUndLorfr70CWjLYGRPmiUT9xit+IojyGUZrSLqzhjhtsWAAKnvxhBjUz0CfENgNR5TZUm0qqM1UCb3Sg==@vger.kernel.org, AJvYcCXy5JXK0d2QG1cvSsZlqmN0YxMfX+vdEFQSYIdYs7uc4cET8w6VXBlEtxQu7NHS1gI/kWxhGjOqFHE/leRV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt3kc3VVCwnLQRHShdg4MQcF7aa1yObXdLmNsPK54KdAVrTZ2E
	ZxOaK9wejr0gdjWwTGZro7ZbtQLOyoWoJdlX8AcKzdj6Kbhirl9F7Ws8ZF9Rp6Ns/u6+dHnjdIO
	Ct8+U6H6N2BxV3r3ZB2hM/wQun+U=
X-Google-Smtp-Source: AGHT+IEGAO/Dg9wsVdVbp4+vDShy2K9pi0gQQlwcHc6RFdBbXAXHWnYFbjiCb6W+eEC6ggoJOwHfuC3bOJQd70uGkPE=
X-Received: by 2002:a17:90a:77ca:b0:2c9:df1c:4a58 with SMTP id
 98e67ed59e1d1-2dad5018dbfmr17962928a91.23.1725980617510; Tue, 10 Sep 2024
 08:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818072729.33511-1-vishnuocv@gmail.com>
In-Reply-To: <20240818072729.33511-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 11 Sep 2024 00:03:01 +0900
Message-ID: <CABxCQKvFPoh5eiYJeN4moWLB83+BOnN5_iO0NVmMhkwQjh1ojw@mail.gmail.com>
Subject: Re: [PATCH] Adding Support for Thinkpad X12 Gen 2 Kbd Portfolio with
 0x61AE as PID
To: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,

Do we have any comments or feedback on this patch?


On Sun, Aug 18, 2024 at 4:28=E2=80=AFPM Vishnu Sankar <vishnuocv@gmail.com>=
 wrote:
>
> This applies similar quirks used by previous generation device, so that
> Trackpoint and buttons on the touchpad works.
> New USB KBD PID 0x61AE for Thinkpad X12 Tab is added.
>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/hid/hid-ids.h        | 1 +
>  drivers/hid/hid-multitouch.c | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 72d56ee7c..981813f50 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -807,6 +807,7 @@
>  #define USB_DEVICE_ID_LENOVO_X1_TAB    0x60a3
>  #define USB_DEVICE_ID_LENOVO_X1_TAB3   0x60b5
>  #define USB_DEVICE_ID_LENOVO_X12_TAB   0x60fe
> +#define USB_DEVICE_ID_LENOVO_X12_TAB2  0x61ae
>  #define USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E    0x600e
>  #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D     0x608d
>  #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019     0x6019
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 56fc78841..1b0844ffa 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -2081,6 +2081,12 @@ static const struct hid_device_id mt_devices[] =3D=
 {
>                            USB_VENDOR_ID_LENOVO,
>                            USB_DEVICE_ID_LENOVO_X12_TAB) },
>
> +       /* Lenovo X12 TAB Gen 2 */
> +       { .driver_data =3D MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
> +               HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
> +                          USB_VENDOR_ID_LENOVO,
> +                          USB_DEVICE_ID_LENOVO_X12_TAB2) },
> +
>         /* Logitech devices */
>         { .driver_data =3D MT_CLS_NSMU,
>                 HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
> --
> 2.43.0
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

