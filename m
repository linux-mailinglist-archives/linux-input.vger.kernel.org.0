Return-Path: <linux-input+bounces-13764-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA62B18F67
	for <lists+linux-input@lfdr.de>; Sat,  2 Aug 2025 18:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 689D017D083
	for <lists+linux-input@lfdr.de>; Sat,  2 Aug 2025 16:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39371B7F4;
	Sat,  2 Aug 2025 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyYtJDfl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33DA48
	for <linux-input@vger.kernel.org>; Sat,  2 Aug 2025 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754152232; cv=none; b=cIhtK6Csb7BE4+BztNEp2rsyReKKMncmMtsf9gcBnknFuhnDjYdYzjHDl+Yk5gvwPP1OBFV6GJSp2O5jLNcdhoH8PSRm/2hJb9Heq4qeATpYQ/dGvAhps94mN7NsW0wm+hV7pBJm5W28jqftkx0wksjwutkH5O4jVInJiJLqP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754152232; c=relaxed/simple;
	bh=76USa+cWQwkmgJIaVn7el8T1qWdWXAaoHuXVd3CGGas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8ty8x5qkCoJUwI0P+n1kWXZSRANhkqJtHSeenMks1uL9+DUgWwXDSl5rMGzmgqg1+sUSdkAiDbVyNa+WdZdKnqwtE70HV+tCdSTM5Kge4SCW0RmFA9vB1oemcV3UFScSm8kkjcgMcOopGBPt5Wfv5F3/wEAc3XHFcN1fKQ0QZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyYtJDfl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so19501855e9.1
        for <linux-input@vger.kernel.org>; Sat, 02 Aug 2025 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754152229; x=1754757029; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5A4mEcHsHite00EqK96cBB7wAaikEY7thFthdZTAO/c=;
        b=IyYtJDflYEW9Ij8CCY0e27WVyTSTiiFNMCzCorPml1EEO1qC6Pu2PCnlGpyU+qwNh8
         8l0iHlPAJjYZI+RS0zf3VsktWVRWBKzMmizWQIk/wH+g6EyR2cbfrfB3WZ57d89aTADQ
         MWsyLkhcYznrE6a1+68kp4Q21JtG9uU3G5nTzGIAx3KvzWvixF1k0wjZLBr6/nOVk+Gq
         bwxNSGBX3UySnGzgOGDKfeN8Moq8n7Fq32/fzGB/jOf/RY1Va77zpDc8WN3ZxbGXdaA1
         p5choG6eMdN/aZK7gB5P87QPxjHOT4KnNXxG4KE7VHjSPQyMazj83eyf8ruQJx1spvHO
         20gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754152229; x=1754757029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5A4mEcHsHite00EqK96cBB7wAaikEY7thFthdZTAO/c=;
        b=Rh0wcqOnTCyyJkO+eXM8H9pFeeKTsSF9BOLpCt5Cx/mbKJuApiJupo7js+QCl3wUWm
         CIIimdfJGb56YdnkcIXT3F+51ZV2W+TamMo8uVCxTyyhvzsG5re/dCJ4nJ5ntjtIA5hr
         /jPgQgyS/N0y1rSJd/jPlUDCOrw7GNn8pwOPye8muU4Zfjfb8p3PM8aWJ8Y0dSiswsxZ
         pSlGmYndCdZYcIVBGVEF56Fr4srir+vdDoU0HGpktnH6Bc3NcNY+28BPXYv+z/+cDRge
         u3hEVFUbH0Y7FzcCv21vnP3LWllwKDOZS8rQHB6xWIgmIgTTsteWx1L4VZ5CAvQRNJ09
         7V1w==
X-Forwarded-Encrypted: i=1; AJvYcCWiW0c5qlMEbzFWMKnoMi74leb7PlS21LezH2mFylsZS8yPCJ1V6k5tbZEJs2NOjMcuzkVhzcsIg+tfSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyIE1Gx5qXTw3uVQSAhGnEDNk8IGj0kmWh13na7/bB0+BoMcXP
	giz0vePkeQeNG4ZJn6CpxAoJlNEVbfQgVcPJQnPvFL9SETZLLMrYX74R
X-Gm-Gg: ASbGncso1uR1cbWU8MyN1g/xwW7+5Z5kiHxj9+lM8RvOIQM7K86BlYWSJHoWIUbxbXW
	TG+IjNAVxowY4xeV5TAjtk6M1fd6whHRNhHH3St7d9yC4LzNnSR8w0yDqc+g1/MNtVW5U223oRd
	ukdByrKXj19NjKM2JTfFpoumOpOF/0W8pUsEEU4CDAVJbsdtIMUuw2G/MD3IblIaHENPcKIYIPt
	PEWBwmJRVWKijHsM988mvrZvc/XVgGf9TeSIFPYezejg+8o9yRBBYl+r0aJNrd0F4jPL+joBVLX
	7VAR5FnFDQ8rk5iveo2x4BDCm/aBDSyDe2kYq/nZANEvPN1T8jIJNNSwmtADkjzoDKOYpVcqxyS
	cs3asVA6KQJ01Jx9e9+2F6GCO2Akmzfw8d9pyVGQ=
X-Google-Smtp-Source: AGHT+IHSXvZBEGFG4YxJvO+lAzZJxOBQijeOBPdaImXY4YXO2AU6G3opmRqGOJ1xuFZzdW8IKJeO6g==
X-Received: by 2002:a05:600c:1554:b0:456:1442:86e with SMTP id 5b1f17b1804b1-458b6b3308emr27499115e9.21.1754152229173;
        Sat, 02 Aug 2025 09:30:29 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458f713eb44sm3842085e9.14.2025.08.02.09.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 09:30:28 -0700 (PDT)
Date: Sat, 2 Aug 2025 18:30:26 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"linus@linuxfoundation.org" <linus@linuxfoundation.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>
Subject: Re: =?utf-8?B?6L2s5Y+ROiBjb21taXQ/YTYwOGRj?=
 =?utf-8?Q?1c06397dc50ab773498433432fb5938f92?= (patch)  has a bug
Message-ID: <aI49Im0sGb6fpgc8@fedora>
References: <51055c7ae10e40319473938f831d0af8@xiaomi.com>
 <b3cf760898054fb1adb4285e84f4a702@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3cf760898054fb1adb4285e84f4a702@xiaomi.com>

Hi 卢国宏,

Thanks a lot for reporting this issue.

On Sat, Aug 02, 2025 at 12:23:54PM +0000, 卢国宏 wrote:
> Hello, José and Jiri!
> I've discovered that the patch you submitted to the Linux community,
> "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.3.y&id=a608dc1c06397dc50ab773498433432fb5938f92"
> contains a bug. Even with your patch, the charging status of HID
> devices is still not reported to upper layers in a timely manner.
> The reasons are as follows:
>
> [...]
> 
> if function hidinput_set_battery_charge_status() return true, That is,
> the charging status of the HID device has changed，This charging status
> will not be reported，Because, only when handled is false,
> "hid input update battery(hid, value);" will be called.

I wrote this patch a while ago and I can't remember the exact reason
why hidinput_update_battery() is only called by hidinput_hid_event()
when hidinput_set_battery_charge_status() returns false.

The devices I have change their status, for example, discharging to
charging, when they are connected via Bluetooth and I switch them to
USB. This reconnection reports the status to user-space, so there is
no need for additional synchronization.
Does your device work in the same manner?

However, before we try to fix the problem, it would be nice if you
could provide a reproducer.

What device is affected by this bug?

By using "sudo hid-recorder" and selecting your device, you will be
able to capture and replay (with "hid-replay") the HID events sent
by your device.
Could you share a recording of your device changing from the charging
to discharging status and back to charging so we can reproduce the
issue, please?

If the recording is too long, please upload it to a server.

> Therefore, the function "hidinput set battery charge status" can be
> changed to the following:
> 
> static bool hidinput_set_battery_charge_status(struct hid_device *dev,
> + unsigned int usage, int value)
> +{
> + switch (usage) {
> + case HID_BAT_CHARGING:
> + dev->battery_charge_status = value ?
> + POWER_SUPPLY_STATUS_CHARGING :
> + POWER_SUPPLY_STATUS_DISCHARGING;
> + power_supply_changed(dev->battery);
> + return true;
> + }
> +
> + return false;
> +}

Could you test if this patch also solves your problem, please?

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91eb..bce580beb5c6 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1515,11 +1515,8 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
                return;

        if (usage->type == EV_PWR) {
-               bool handled = hidinput_set_battery_charge_status(hid, usage->hid, value);
-
-               if (!handled)
-                       hidinput_update_battery(hid, value);
-
+               hidinput_set_battery_charge_status(hid, usage->hid, value);
+               hidinput_update_battery(hid, value);
                return;
        }

Thanks a lot in advance,
José Expósito

> Because we have encountered this problem in our project, and this
> method can solve it.
> I hope you can solve this problem as soon as possible, otherwise,
> we will encounter this problem again in our future projects.
>
> Thank you so much！

