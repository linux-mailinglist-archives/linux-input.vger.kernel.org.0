Return-Path: <linux-input+bounces-10409-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E1A47C5A
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 12:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0769C167505
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 11:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6800422A4E4;
	Thu, 27 Feb 2025 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5j54+y6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E1C225768;
	Thu, 27 Feb 2025 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656210; cv=none; b=r7zRWZl2l/143vfkSV4RVgiczd+9jppVJNwadW2I8DU2pICVQ4xo4vxSx+GE0o9jBLIXQo1bhLz9wiEBdWdzRlWPsKIJCr1wgDMJkIUxvoiELKFAMXFwjdVzmI8+Q4hDbEH21L1bwW5wFmyB2zLjmJDDnG4vbuSpxquhe7vRei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656210; c=relaxed/simple;
	bh=SK7C1wR+223vTw6fz3CYEXOMqqXVNPB/pYbSBDfK82c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOGiMZThcCngdqSKh/R9kNYhgZDQQxibGUMqBM0C3EWFbqNjCAVyJmJiB1hzWNnuXyI/3Fxk/9BEfGgI05ROV4hKZs5SDqravZY5nQFsz2HAHkrehM9pAt5ruw6wPaPrKCoVwA6L6fYOTXLIpE4PXf287/88ekXCvU1TscuWmMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5j54+y6; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6fb95249855so6922297b3.2;
        Thu, 27 Feb 2025 03:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740656208; x=1741261008; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RtBAPKD3XK83R8i65OmKGMzzBFFEwVKmzFcLLy5aZGQ=;
        b=K5j54+y6opcdWZm0/0H7Ih2Eu8a6w8XXAEz3tnMXJT79J1y1FoZsOd8PwQ/sKG3FE2
         O+ttUwOjuz+VZUM2z9NCfvotQzGdjQZnnbPZ5GYctbEieq9W1vJPFrzdmEygW+8QuGwP
         SnlALI736wJjgOAXoKpqg+/PVKke5Lf/iV7AZ4CsLjjuaWmJhBgfwVPyNp9Vndj5P9d/
         qF1z6d9S2IJRE473IrwLKdx50U84BQk4z82Sts61MqFDGJ9ZoXQFyBLjaWQhKp+4zAWQ
         zmzLhgFuCRjnbJ8V0gg8HR17lR21oGZzor2rxnXm55Waw60J/WGBaE15ALsmbtPSEQ5w
         YnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740656208; x=1741261008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtBAPKD3XK83R8i65OmKGMzzBFFEwVKmzFcLLy5aZGQ=;
        b=ov2addbyammyHOIH6p5CcZHvZ7KxfQFVTEz7hAbqP2W8clQ8bkQHQjvtWxArPcPDgS
         R0BH7lglmxt4BmsYF+oDVMv4cle5gkfeZpHRsvFhSyTSAfs2TmjA8xokMup0UyK5kreu
         QYAtSYId7cUedYV3gJkKCIkTSKDblMtA62TLt0i6aR6UuVnhYKNYbuB60XbnNOCOi1qD
         9MKi/pN+hSZ+Mt6mPKE/BxZ94X5pgoz3+pCocxb48G+yXprutnxM13smZvkKzkB5fglH
         WEBfoxjfmtpH4WBDNrOtNtob6rBzAcmB0d3CZE7sVt981QhCMznRWAdGDnXujAJhLWR4
         aNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3r7BXcHvM8AqTyulwiACfjzKTtxMwRTzO5E5VR+6CH6dvzTxpyHxKOhpmCQ7ldT/jXezlixxM7eikBQ==@vger.kernel.org, AJvYcCV/hCjLbg0HHYO0HL12VAah6u1ODdzELEJeXdSxFGOW+PRXdbsdxlTLWgc605pa1IqCFdMii6OG7qD5gYZj@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMquwFwymp4qf3jQ17/oMxwEF9u17ncimUF6N+xtq4z+v9bA3
	MeKJIqBkRR+yP2bgd/iTQ2piEgb6fsj/xd2UxrVVcJ1JwRQKRVDwjxnNbvB3AbTcgmHJzs0H2Yw
	3fAQmf/h9A29n6unxd9aebmavQsY=
X-Gm-Gg: ASbGncvH42TVPEfjjWNkMBBBTtH8JXIJCKwVKyKQ3CcBSQgE9O86r+ezMX7dD510pyL
	tp9DPF+Cx6oyzKe7nvpSGl+jw0GByONX3T248MdB9K7Jyda5uxwR+9C1bIbyWZN+lm8M+w1gDYw
	kRICYGjcSI
X-Google-Smtp-Source: AGHT+IE0YXWUJrOQP/whLUbSbu0atHebXPWF8VyMOIanwDeeFKtc/TN1gSO1eAzsOWaKnLYWJUV/YWbiWyU5EcvwH50=
X-Received: by 2002:a05:690c:308a:b0:6f9:7ec7:3879 with SMTP id
 00721157ae682-6fd10a17360mr111629047b3.18.1740656207806; Thu, 27 Feb 2025
 03:36:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOm6qnnhR9++REgtjhZpqNXkBbBAZsGAY8Oy89cXUF9S=Vy-9Q@mail.gmail.com>
 <8c7b5560-27d0-42bc-8f25-0797500fb889@redhat.com>
In-Reply-To: <8c7b5560-27d0-42bc-8f25-0797500fb889@redhat.com>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Thu, 27 Feb 2025 19:36:12 +0800
X-Gm-Features: AQ5f1JoJYu-IQEePUUC20ZQlGAK0XOqrT4v5dCo2E1-zdVVleednN_PEwgkJHIM
Message-ID: <CAOm6qnmYSQz_YVaWw1c-fMm3NCVV9MoQhLQ0XGzK9o2RybLHmw@mail.gmail.com>
Subject: Re: [QUESTION] Plans for GDIX1003 Support in Goodix Touchscreen Driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bastien Nocera <hadess@hadess.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Hans

On Tue, 25 Feb 2025 at 20:09, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi WeiKang,
>
> On 25-Feb-25 3:04 AM, Weikang Guo wrote:
> > Hi Bastien, Hans, Dmitry,
> >
> > I am currently working on the Ayaneo Flip DS device, which I installed Kali
> > Linux with kernel version 6.8.11-amd. This device has two touchscreens,
> > but only one is functional. After investigating, I found that the second
> > touchscreen has the device ID GDIX1003(confirmed by exporting the results
> > through acpidump), and upon comparing with the current driver, I noticed
> > that only GDIX1001, GDIX1002, and GDX9110 are supported.
> >
> > I have also reviewed the ACPI description and can provide the details if
> > needed. Any guidance or updates on this would be greatly appreciated.
>
> I think this might just work with the existing goodix driver, just
> add the new GDIX1003 HID to the goodix_acpi_match table:
>
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index a3e8a51c9144..4b497540ed2d 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1519,6 +1519,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
>  static const struct acpi_device_id goodix_acpi_match[] = {
>         { "GDIX1001", 0 },
>         { "GDIX1002", 0 },
> +       { "GDIX1003", 0 },
>         { "GDX9110", 0 },
>         { }
>  };
>
> Note I'm not sure this will work, but is worth a try.
>

It works, thank you very much.

> Also please run:
>
> sudo acpidump -o acpidump.txt
>
> and send me a private (off-list) email with acpidump.txt
> attached,
>
> Regards,
>
> Hans
>

Regards

WeiKang

