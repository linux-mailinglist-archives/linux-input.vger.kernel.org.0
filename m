Return-Path: <linux-input+bounces-13817-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C04B1B059
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 10:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979BA1897217
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 08:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0742494C2;
	Tue,  5 Aug 2025 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX8Kz4N/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8DC2E370A;
	Tue,  5 Aug 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754383366; cv=none; b=iEwQdtwUlKfH8FfJX8fODRHgCSw1EJc9dchYDovS/O5mSCJ8xHBlFP/yXfN6nslF+RQy+C53c+zArGzE4LFAirX+GRnslS5/b6Ur62KwAT+egLX8aWRVGUMZXkkBBPGB2r3ejD5gsYozbRQDusfD7tnCIm2QqVHMDBOafJRNaqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754383366; c=relaxed/simple;
	bh=9MV0fLG/9rPTHXzN+3ED/uPvUp3BVcQYRwg+YJ0ssXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXTmB16sLJ4AWpTKjqp5FGp7hMdPsz2OnJYhrx7XIWycd6f7xL8Xx7uPMiglD9kM2Oo0wqUCXzb0ZMjLyiYE/qeoTZVoeizpoSq2i+L5wedJ727uVZuTW930/cc5mOzFlo9G4oJ2wuXhj5z0isY1cQbga+FovC8POkr6tgdcadU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX8Kz4N/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so4819832f8f.1;
        Tue, 05 Aug 2025 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754383363; x=1754988163; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=985lZQvPasprBppovaA5jG0NjqVVVc0fs4m90Wwylyg=;
        b=EX8Kz4N/vvoUty//B9WAwkRZWFJPTCOXQzQ6LMyoLZVds4RhWtwBOPrEtsCRaYQJ5H
         KQc8QN8r+QXUlKBRHLwGPhUHzm+YcXMNVdUNQM/uFmUQFSBY6hi0moSMlUNnp30PuXS9
         0WHtSkYLO73DXJGx5Up4qDJsWEQPZD6Bsxx6pDMCPWtAxkxqwwE69ZxML8h09mSwxeOn
         ZuFZaq47PPoDknz3MxKELPRA3AqVE2+fENNFuc5qHRZa3dyBELbzl3zYWmdTBKkDcUjs
         kqtu5rUlDU+sqOP0hjoKD3FUMW0VORltsNMGzhyZ9aopxh9Y0brJ7orEXgbOH+5sAJ79
         EtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754383363; x=1754988163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=985lZQvPasprBppovaA5jG0NjqVVVc0fs4m90Wwylyg=;
        b=VIgIwX8/HRSYg2vuceMccyklpzQdS6CSkj87KpTW12ZHmcYFIFpESolao6eqRnr2EV
         rX/m6MBvEHAoJYA/E/4C4p03gUhpCwOqYHPJg/qNdvZKTFxM1jXwxwd0EeFIUOLQsKXB
         FTGQG2/A5l3zp0ffhpoFVfIEEii0zssBS01dTgf9VBDkrLAd4M3DnKNBYw07DmKrs+qx
         /K3h/VkX7FuvTFqx5O/Ecl1vV6hJdYP0zuTr1lMPF0rhdGXK3lmkT1db0kmUMXADlt3x
         pQRtAT4h5K6jDZCQj2+x2mZCNJj3myQnLA62iUqolEC88abk2VPDQknlGJCjsRNfLyXB
         9p6g==
X-Forwarded-Encrypted: i=1; AJvYcCVqTY8wePul+BpB73tO5lj6NiiN0TjZU1FuJzlFSoStrR/ba9Nnv5gqsTpoAc9aRdsZLrXxhqNIX+UwHA==@vger.kernel.org, AJvYcCWio6JsWpcdxXbAfr0KC3zxR0UyuskZBplLezBj+/XFWbE1TK18CxcutvixSLeN4qurviFQFENk++kaD4HP@vger.kernel.org
X-Gm-Message-State: AOJu0YykvJa+BchK7sIUphtvTQxBpHfsVbUe84sabbECa6IzsePndq8H
	mnRKXWOIe3/t8NEU7e0bwHd2ZE4cWK/hIEgyeIK3bJiNvdZIZLOLB3BYUPh4RkX6
X-Gm-Gg: ASbGncvNNwinx5TPKIqhC6/GkVblxtz7wS/ZQkxWtskRP62iA2ZmSmwdL7ej1TU0tAX
	ZGBLcYj+PjUa6yF93p2om1p2NwGZ8SfZhIO/rtkoNVmmLXWha/pj5Rmbm0kgwNGvcd0aaQLphYY
	wt3wZnu+oc5HkN1o+O8PLuMEbFBNBtqj10puZDmJ29G0Z5xQQ7MhB1qaKDbS7O9H2+TonpPSF7w
	3glUURmuu7J6YOTFDiKaVzMlR+wy/tyIe5VsZ4uM2C+dOKX1rCAkkt8uTZ/KcapWRZd41H+PFnP
	Mpj4W5gQdg8bP1fIf3nBGlvAra0dB9HO8wRfKwHFAZD0P19jwCLB8KhZuCGK1crcwBGWaub1pZ8
	QohiyzrM5yzNfcWb7eiM=
X-Google-Smtp-Source: AGHT+IFJl45zUrEgd5UE4SIRZuQuSmUZT3zO6SNUYY8DLGIV7lCZVPJY7vTO3mVXyNmPCJ3LAJpsqA==
X-Received: by 2002:a5d:5d0e:0:b0:3b7:89c2:464b with SMTP id ffacd0b85a97d-3b8d946ac69mr9937477f8f.5.1754383362787;
        Tue, 05 Aug 2025 01:42:42 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a6f6fsm18841119f8f.74.2025.08.05.01.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 01:42:42 -0700 (PDT)
Date: Tue, 5 Aug 2025 10:42:40 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Fei1 Jiang =?utf-8?B?6JKL6aOe?= <jiangfei1@xiaomi.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWwgTWFp?= =?utf-8?Q?l=5D=5BPATC?=
 =?utf-8?Q?H?= 2/2] HID: input: report battery status changes immediately
Message-ID: <aJHEAHH6KCAGxs8N@fedora>
References: <20250804091215.6637-1-jose.exposito89@gmail.com>
 <20250804091215.6637-2-jose.exposito89@gmail.com>
 <a235549c5cf24205bb7ce7f05737c403@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a235549c5cf24205bb7ce7f05737c403@xiaomi.com>

Hi!

On Tue, Aug 05, 2025 at 01:43:30AM +0000, 卢国宏 wrote:
> ________________________________
> 发件人: José Expósito <jose.exposito89@gmail.com>
> 发送时间: 2025年8月4日 17:11
> 收件人: jikos@kernel.org
> 抄送: bentiss@kernel.org; 卢国宏; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; José Expósito
> 主题: [External Mail][PATCH 2/2] HID: input: report battery status changes immediately
> 
> [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> 
> When the battery status changes, report the change immediately to user
> space.
> 
> Fixes: a608dc1c0639 ("HID: input: map battery system charging")
> Reported-by: 卢国宏 <luguohong@xiaomi.com>
> Closes: https://lore.kernel.org/linux-input/aI49Im0sGb6fpgc8@fedora/T/
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/hid/hid-input.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 262787e6eb20..277538a17b57 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -609,13 +609,19 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
>         return false;
>  }
> 
> -static void hidinput_update_battery(struct hid_device *dev, int value)
> +static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> +                                   int value)
>  {
>         int capacity;
> 
>         if (!dev->battery)
>                 return;
> 
> +       if (hidinput_update_battery_charge_status(dev, usage, value)) {
> +               power_supply_changed(dev->battery);
> +               return;
> +       }
> +
> 
> > Hi, José. Shouldn't the return statement in this code be removed?
> > Otherwise, if both the battery level and the charging status change
> > simultaneously, the code following the if statement that updates the
> > battery level won't run, and the battery level won't be updated.
> > Thanks!

At least on the hardware I have access to, changes are reported independently.

I added a log at the beginning of this function to illustrate it.
This is the output when the battery of my device goes from 99% to 95%:

    New EV_PWR report:
        usage = 8716389
        value = 99
    New EV_PWR report:
        usage = 8716356 (HID_BAT_CHARGING)
        value = 0       (POWER_SUPPLY_STATUS_DISCHARGING)
    [...]
    New EV_PWR report:
        usage = 8716389
        value = 95
    New EV_PWR report:
        usage = 8716356 (HID_BAT_CHARGING)
        value = 0       (POWER_SUPPLY_STATUS_DISCHARGING)

If we remove that return, then "value" (0 or 1) would be used as battery level,
reporting wrong battery levels to user-space.

Isn't your device reporting its battery information in a similar way?

Jose

PS - I'll fix the warning in v2 and add a Tested-by: 卢国宏 tag once
     this is confirmed to work on the affected hardware.

> 
> 
>         if (value == 0 || value < dev->battery_min || value > dev->battery_max)
>                 return;
> 
> @@ -648,7 +654,8 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
>         return false;
>  }
> 
> -static void hidinput_update_battery(struct hid_device *dev, int value)
> +static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> +                                   int value)
>  {
>  }
>  #endif /* CONFIG_HID_BATTERY_STRENGTH */
> @@ -1515,11 +1522,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>                 return;
> 
>         if (usage->type == EV_PWR) {
> -               bool handled = hidinput_update_battery_charge_status(hid, usage->hid, value);
> -
> -               if (!handled)
> -                       hidinput_update_battery(hid, value);
> -
> +               hidinput_update_battery(hid, usage->hid, value);
>                 return;
>         }
> 
> --
> 2.50.1
> 
> #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#

