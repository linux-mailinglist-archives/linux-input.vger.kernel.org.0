Return-Path: <linux-input+bounces-235-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992A7F8845
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 05:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D7F11C20B92
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 04:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EC06138;
	Sat, 25 Nov 2023 04:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWZCWA0g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3DA10E2
	for <linux-input@vger.kernel.org>; Fri, 24 Nov 2023 20:30:25 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ce627400f6so19516335ad.2
        for <linux-input@vger.kernel.org>; Fri, 24 Nov 2023 20:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700886624; x=1701491424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dBV7FTTa4C7DYRfQyVA/Dly+0RIGJ0E/WGvdvsfhzUs=;
        b=MWZCWA0g1CuPbcwZ9yNSnGsn3lWXNCVhCOsR8steiy8rxYhnVbYIuNX90P6EpjI8id
         Rq6ScfBKjBnexlHvk1+aLyPcOK2v7kUj+iU4XWEWVGea52u1l7JY+bUKEIPqnPBmU1hQ
         FDY8whWV8zaagiUJjy2NEMhqQv62nvfnPakCFuF997AggEzGWeCcCvgjhNdpRtYrJcMF
         vgSyHgFyCbPxn15+s/C7v+/Grui0c1/T/2LRqOCeNS4jCmrGWUInpvvZ+3ddTVAuoX0O
         /1TR7Tna7dKTxirvaVnzrCfagNwbyN+zjbLHzqAfhyU/3FtWM8mtM/xtisBzzlWzV0SB
         YXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700886624; x=1701491424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBV7FTTa4C7DYRfQyVA/Dly+0RIGJ0E/WGvdvsfhzUs=;
        b=HZ45mV44TDBhoyN6MGPF0HT6opHqlRpNHPvZhZoAGi8DmUSu1LxyV9YasZOyfUcXyI
         fQh1iUbEPqi34qO9jjiJWEav/Q7sbSOINIyV4nT/AtgT9suXfftGykM4sV25FhiTI8a3
         ddw0xxU+yFP4WGNqMguVGbLzIe6cmWwc5GYbw4zHrRyaEcZ6S5yv5cXXxicEife3eIIl
         TRbRnlWBbk0kmhs+YP81v/qZ2lsuPoPk3xbEZAMmK5nrhSccwofEDwxMEWxHqzALrKYk
         8gAaX3AMceJUXcp/Zoyrq9QX+eYmXRqBV26CAnNHKncdE9gH1P9om/MkdWV4Ud3tFAL5
         7q7w==
X-Gm-Message-State: AOJu0Yx2F5bEONjxpAEh6tQF2tc5KdbU3rKAhOWHdzZ559wN56vg7NH2
	REPqHHGp9y9tIUdJ72Z1iUw=
X-Google-Smtp-Source: AGHT+IEYaausxpqRuWTJYqdIhboK7f3RRk+BDfmiY+R23r0NPU0AvBcUfSAppPA9F0FYJ9yAYmrW7w==
X-Received: by 2002:a17:902:ab06:b0:1cc:3bfc:69b1 with SMTP id ik6-20020a170902ab0600b001cc3bfc69b1mr4885098plb.24.1700886624240;
        Fri, 24 Nov 2023 20:30:24 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:8b5c:82d0:578f:d0])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001b8b2b95068sm3600617plj.204.2023.11.24.20.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 20:30:23 -0800 (PST)
Date: Fri, 24 Nov 2023 20:30:20 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>,
	gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>,
	Anton Zhilyaev <anton@cpp.in>
Subject: Re: [PATCH v2] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
Message-ID: <ZWF4XDFDBTEvIOrV@google.com>
References: <20231115174625.7462-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115174625.7462-1-hdegoede@redhat.com>

Hi Hans,

On Wed, Nov 15, 2023 at 06:46:25PM +0100, Hans de Goede wrote:
> There have been multiple reports of keyboard issues on recent laptop models
> which can be worked around by setting i8042.dumbkbd, with the downside
> being this breaks the capslock LED.
> 
> It seems that these issues are caused by recent laptops getting confused by
> ATKBD_CMD_GETID. Rather then adding and endless growing list of quirks for
> this, just skip ATKBD_CMD_GETID alltogether on laptops in translated mode.
> 
> The main goal of sending ATKBD_CMD_GETID is to skip binding to ps/2
> mice/touchpads and those are never used in translated mode.
> 
> Examples of laptop models which benefit from skipping ATKBD_CMD_GETID:
> 
> * "HP Laptop 15s-fq2xxx", "HP laptop 15s-fq4xxx" and "HP Laptop 15-dy2xxx"
>   models the kbd stops working for the first 2 - 5 minutes after boot
>   (waiting for EC watchdog reset?)
> 
> * On "HP Spectre x360 13-aw2xxx" atkbd fails to probe the keyboard
> 
> * At least 9 different Lenovo models have issues with ATKBD_CMD_GETID, see:
>   https://github.com/yescallop/atkbd-nogetid
> 
> This has been tested on:
> 
> 1. A MSI B550M PRO-VDH WIFI desktop, where the i8042 controller is not
>    in translated mode when no keyboard is plugged in and with a ps/2 kbd
>    a "AT Translated Set 2 keyboard" /dev/input/event# node shows up
> 
> 2. A Lenovo ThinkPad X1 Yoga gen 8 (always has a translated set 2 keyboard)
> 
> Reported-by: Shang Ye <yesh25@mail2.sysu.edu.cn>
> Closes: https://lore.kernel.org/linux-input/886D6167733841AE+20231017135318.11142-1-yesh25@mail2.sysu.edu.cn/
> Closes: https://github.com/yescallop/atkbd-nogetid
> Reported-by: gurevitch <mail@gurevit.ch>
> Closes: https://lore.kernel.org/linux-input/2iAJTwqZV6lQs26cTb38RNYqxvsink6SRmrZ5h0cBUSuf9NT0tZTsf9fEAbbto2maavHJEOP8GA1evlKa6xjKOsaskDhtJWxjcnrgPigzVo=@gurevit.ch/
> Reported-by: Egor Ignatov <egori@altlinux.org>
> Closes: https://lore.kernel.org/all/20210609073333.8425-1-egori@altlinux.org/
> Reported-by: Anton Zhilyaev <anton@cpp.in>
> Closes: https://lore.kernel.org/linux-input/20210201160336.16008-1-anton@cpp.in/
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2086156
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note this supersedes my previous atkbd series:
> https://lore.kernel.org/linux-input/20231005201544.26983-1-hdegoede@redhat.com/
> ---
> Changes in v2:
> - Add DMI check for laptop chassis types and only skip ATKBD_CMD_GETID
>   on laptops with the i8042 in translated mode
> ---
>  drivers/input/keyboard/atkbd.c | 61 +++++++++++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index c92e544c792d..5667f1e80839 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -765,6 +765,59 @@ static void atkbd_deactivate(struct atkbd *atkbd)
>  			ps2dev->serio->phys);
>  }
>  
> +#ifdef CONFIG_X86
> +static const struct dmi_system_id atkbd_dmi_laptop_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible */
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32"), /* Detachable */
> +		},
> +	},
> +	{ }
> +};

Thank you for making the changes, however I wonder if we should
open-code check for the chassis type, as DMI can be quite bloated and
here we are dealing with exactly one field. Something like this:

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 5667f1e80839..786f00f6b7fd 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -766,39 +766,24 @@ static void atkbd_deactivate(struct atkbd *atkbd)
 }
 
 #ifdef CONFIG_X86
-static const struct dmi_system_id atkbd_dmi_laptop_table[] = {
-	{
-		.matches = {
-			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
-		},
-	},
-	{
-		.matches = {
-			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
-		},
-	},
-	{
-		.matches = {
-			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
-		},
-	},
-	{
-		.matches = {
-			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
-		},
-	},
-	{
-		.matches = {
-			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible */
-		},
-	},
-	{
-		.matches = {
-			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32"), /* Detachable */
-		},
-	},
-	{ }
-};
+static bool atkbd_is_portable_device(void)
+{
+	static const char * const chassis_types[] = {
+		"8",	/* Portable */
+		"9",	/* Laptop */
+		"10",	/* Notebook */
+		"14",	/* Sub-Notebook */
+		"31",	/* Convertible */
+		"32",	/* Detachable */
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(chassis_types); i++)
+		if (dmi_match(DMI_CHASSIS_TYPE, chassis_types[i]))
+			return true;
+
+	return false;
+}
 
 /*
  * On many modern laptops ATKBD_CMD_GETID may cause problems, on these laptops
@@ -812,7 +797,7 @@ static const struct dmi_system_id atkbd_dmi_laptop_table[] = {
  */
 static bool atkbd_skip_getid(struct atkbd *atkbd)
 {
-	return atkbd->translated && dmi_check_system(atkbd_dmi_laptop_table);
+	return atkbd->translated && atkbd_is_portable_device();
 }
 #else
 static inline bool atkbd_skip_getid(struct atkbd *atkbd) { return false; }


It gives me slightly smaller output:

dtor@dtor-ws:~/kernel/work (master *)$ size drivers/input/keyboard/atkbd.o.old
   text    data     bss     dec     hex filename
  28407    1512      37   29956    7504 drivers/input/keyboard/atkbd.o.old
dtor@dtor-ws:~/kernel/work (master *)$ size drivers/input/keyboard/atkbd.o
   text    data     bss     dec     hex filename
  26107    1512      37   27656    6c08 drivers/input/keyboard/atkbd.o

Please let me know if this works for you and I can combine on my end.

Thanks.

-- 
Dmitry

