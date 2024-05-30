Return-Path: <linux-input+bounces-3971-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56078D53E0
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 22:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47B962834B5
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 20:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DC17406C;
	Thu, 30 May 2024 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHcwjo26"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095657316F
	for <linux-input@vger.kernel.org>; Thu, 30 May 2024 20:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717100974; cv=none; b=KKiLrdVF0aK4Tu4oYAkWZ2qR1vPN8WTWoCQJDb7mCXWtj3zORUWPEUnxb1AeLW0jeJ1yMVK+DAmAYZgnuVb+brXElcr8vv4TltsMRVE/AmwMAnrmClgf3Yv9PINVv6Y7oNJS1W85cfV0qtYrKDQCmcrneyLmDL6ET47WlYbZeBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717100974; c=relaxed/simple;
	bh=g5QgVVgh3mq1kHOyslN0CixT/eOHDuT3hNCbg/qABDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0W7mjmejg8y0ymw9TXSTHINZbrpj5B33H5W2C16PTwXnJxXGyEk72SMMbDBKfi30I/6FqRuqV0xKrWakwPMqlA2l76jNlWD3P87TgsJYwj/UgaSHUpq7/HcFC1hmRKBkJYUUUWd2uHh46SlqNrwmufasvKoraKLl/ett301II4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHcwjo26; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62a08b1a81bso10407597b3.3
        for <linux-input@vger.kernel.org>; Thu, 30 May 2024 13:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717100972; x=1717705772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sByVNTazrtLYaoeQYnfF36ldr/q+Uo9Euk+pI4wwpJk=;
        b=YHcwjo26Z+9XbHFdaRRGct0hmhpJ1/bre1OslAUVUQSrw9QZ5I7HQj4dtjKVTx697R
         kEVaZxoP/LlTcL8VSaESpPSJ/FT3xtoKMT3y8FFU+PFEjvknux0RwAXPQMVqeLwfdQRv
         VE0T7PgC+SxPQUwB2LUCqsE7gsK46FnAUkUb3mUUb7ehC/EdDLv9OQhOJUGzNxTX0ktH
         Ne1AvqadDNytYZUgY8/daD+68ITqiRFC1jVwL3dRbURrGgSI35KP+KX9E6hyhrY8ZiMG
         W4u1atRDLBK3LlexHDCPUzcBDf5g2fefldLiIfiAjis+J1JAFFYu3hBa9ZzkvDTSjAEv
         rVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717100972; x=1717705772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sByVNTazrtLYaoeQYnfF36ldr/q+Uo9Euk+pI4wwpJk=;
        b=pWY9F0JuERal64qDo49vcLceRP40KDmFvjTGITREdB4wJK7D2/kE0OtuX8BGnklSbK
         /XzoLIZ4c1Mrrf7oCZrUM3N3Rn3pmEkyQ4nYuTNGnCqLZbzuO6dTP5sWTfeIAcML9Vjx
         rRLoRGe/vGDarqSHzsobRmGZTiu9I0H5YsOsnBm9jOBRoV19ecp47Pw/1S7ZFb5bn+gX
         F/RFH8uz96fuXdtGHCYauY4tPfyCRyjYWsJqTckDMY/tV1JaRCLMVlEUKcMmus6t3PGi
         /C1n42KqSm3nVQ6AcyWzi+vKBtsYihi1WU8KwpwUIzeuGZOGfLKXk2w5WNS23UKQOX87
         jZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfhe1lv3yOb/JJq+WBd2YGru6qxHxIHZFcABVMXyBHm8/J0UV/O8zdg9PdJcbFKoYVbxBBbKznRAUHwVitxL6pA8iRH8hYO6JcunM=
X-Gm-Message-State: AOJu0YwK6LCPwhXEoic8ZAR0jyn9eJa/ye6JuhS41wem5LsQi8+6Rnx7
	I+Tae+HJZ5qOI8u2Qs0U5CwfQp++4Z4NGK6ZKhP7kE3jUC9SWRDd
X-Google-Smtp-Source: AGHT+IFz0HwZs3VSOCCjTQ6uT6L8pyhTkLJwYkH0NdWvSEhpLWjdKqJFljMd7XoPP4OX5sSfSHQSZQ==
X-Received: by 2002:a0d:fb85:0:b0:618:2f6d:ca80 with SMTP id 00721157ae682-62c6bbfa055mr33820167b3.12.1717100970375;
        Thu, 30 May 2024 13:29:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:509f:4b2e:3586:eb1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765b7ec1sm802877b3.10.2024.05.30.13.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 13:29:29 -0700 (PDT)
Date: Thu, 30 May 2024 13:29:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/2] input: Add support for "Do Not Disturb"
Message-ID: <Zljhp-u-s-RPPXDj@google.com>
References: <ZldxNQGXy4zWVPu1@google.com>
 <ZldzsCybMzSWnZaQ@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZldzsCybMzSWnZaQ@google.com>

On Wed, May 29, 2024 at 01:28:00PM -0500, Aseda Aboagye wrote:
> HUTRR94 added support for a new usage titled "System Do Not Disturb"
> which toggles a system-wide Do Not Disturb setting. This commit simply
> adds a new event code for the usage.
> 
> Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
> ---
> Changes from v2:
>  - Added underscores to make `KEY_DO_NOT_DISTURB`.
> 
> Changes from v1:
>  - Modified formatting to match existing code, ignoring checkpatch.pl.
> 
>  drivers/hid/hid-debug.c                | 1 +
>  drivers/hid/hid-input.c                | 8 ++++++++
>  include/uapi/linux/input-event-codes.h | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index 7749c81b6227..4ccfbd860bbe 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -975,6 +975,7 @@ static const char *keys[KEY_MAX + 1] = {
>         [KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
>         [KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
>         [KEY_ACCESSIBILITY] = "Accessibility",
> +       [KEY_DO_NOT_DISTURB] = "DoNotDisturb",
>         [KEY_DICTATE] = "Dictate",
>         [KEY_MICMUTE] = "MicrophoneMute",
>         [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 1ecc5ad57b56..31feb5e0714f 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -826,6 +826,14 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                         break;
>                 }
>  
> +               if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
> +                       switch (usage->hid & 0xf) {
> +                       case 0xb: map_key_clear(KEY_DO_NOT_DISTURB); break;
> +                       default: goto ignore;
> +                       }
> +                       break;
> +               }
> +
>                 if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
>                         switch (usage->hid & 0xf) {
>                         case 0x9: map_key_clear(KEY_MICMUTE); break;
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 7ff6eeef1af0..07038fd9682d 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -618,6 +618,7 @@
>  #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
>  #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
>  #define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
> +#define KEY_DO_NOT_DISTURB             0x24f   /* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Feel free to merge through HID tree.

Thanks.

-- 
Dmitry

