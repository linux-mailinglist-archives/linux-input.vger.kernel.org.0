Return-Path: <linux-input+bounces-13797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB360B19EB1
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 11:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81FA63A826A
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 09:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A3022259E;
	Mon,  4 Aug 2025 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtPClQki"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339A1E25ED
	for <linux-input@vger.kernel.org>; Mon,  4 Aug 2025 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299249; cv=none; b=rUS7gga4w5raVzQF3VbS96K88wJf5PM0r3suwdJmrsGTtNzM3QRx7DFYF0cY5lQbQa5gpZJAg1R2OeE/krW7GDNiwWlK/FYZQlzNewuDLuolk2dQHaEG01NgcJMChRlHMTZQgRqerUyU66pAkNr0ZWNdtcmwMfY7QwELobV0lzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299249; c=relaxed/simple;
	bh=J8xIYJzlVGQJmfbMLJvudA3jCe114irI/N/x1M8hinY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRyfL0nm2oDqPvrk/062BhDZd9g0Iy6GiCZy6f1elV5cWORoHgB7HW33YpieKtamd+nxnJPS8QqWVCXuXvb0wGVDMu6Zx/DmiPuXOs50ycSgG82C99W8tOPZ8Rz2SphOK23Qy4ssC2/7mNO5PYCwm086cRhsJWRtdiiCX4NdwL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtPClQki; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458bf6d69e4so14903995e9.2
        for <linux-input@vger.kernel.org>; Mon, 04 Aug 2025 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754299246; x=1754904046; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MMTvAUQg1p9Y0Xvw3rsVBX4BezwZLeSLXUTwFwxHBhs=;
        b=EtPClQkiU84WGZO96q0HNwu1C7oYVj6HFLFollARAztpYGMJIkcoB6ogz+4slDbehZ
         LKqmiPGy3g4CLYNMxovDs6jscl2N8tqZC5Y4fhx6odYb1egv5xCI3WvyFKl7iCJ+i9zq
         OSHDMyp6bBuDgTwzlKVgLBDqsgLO0UKh0MHLVKB4fRG2KftISDpk9CWpCkX+MHabxidK
         R4dwqOiS9N0SJIUKEK4cCgWBLPUobkIxfKm8TGVeXsCeXaQn38sjUhFN4n/eYzr3PSvh
         IQa0oVner+6upqPtmcjzCYFuT/UR7ne3vIpYi2bwe6tDS3/Rydk5qSfcZ3q9MVHOUNCE
         FQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754299246; x=1754904046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMTvAUQg1p9Y0Xvw3rsVBX4BezwZLeSLXUTwFwxHBhs=;
        b=VzxVg8Nlun/IJGfistcZoLgOtwJ9gVy366VKd1a0Y06L0eg1oO74JH6NyPQ4j/COkW
         z0Gp8URjWwqkHvPIUO6eH+3Lv3k7cxNmWEnc+oD/kKSwxQJcAf0SgeMu1L+GQjObxfk5
         WugKKSvFXCg0gy7xTqBDvPvZnmJtellGyrC2vKvKW49JnBjZZJSnk/j06dYDSwlOhBEy
         2xh/SsOFVZfkMamr0PVD6mZqYEWy7z+JAp9fSnMOV+c27sOpBgQWOPGTW7pStIQun9Ur
         UjGNryFLKA/1Q1ftwA6s/oiN7djcsImGqUOuVGooJLHYrPPAL2BvwtaW5/KcBYjq9HZ2
         hQaA==
X-Forwarded-Encrypted: i=1; AJvYcCWfgrFmApjT9FRCXUI9Pf2QNqgTGj6naY1k15lUr50uLg7Rx7WT8TPPhWMTt1qKaFKCbgcHhESZELWW7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qEM7CKeZWtnnoqdibaJRcVzbiEz3nfKrUSAP0tUgl5HT+rNT
	AHDuoLMRZMcdNanuFvmXHq0OeI727zsN6ZfudyFZgKh3zvw7q7xnU58F
X-Gm-Gg: ASbGncupvyvLjfySllI0RhgnXwjfdD/buvnDublNbmTMWLEWme1ZK8JnXbVYESVQIeo
	3uJcfqSLUfzNor7TvCUMQdDOWfHNJbhJEL6WmyZoEy7C7K3v6KGQlGG5xxxWFbb3zVxgtW/fHP0
	orttzmoFveIrNSutDIONFyJl7k0YBIXMD+fb6d/vDUcoPtTs7bKDYBfCLTR1HMNLgEskOEwPmny
	KiMJuFlMTS3Mg/8tN4P5sijfcDggH4LVhbuG+BHa4xhkCvKd2BUHRSAvVQy8L+V/oquamkyl9Q7
	0Jtv7N0kafpC5sTAa4gDdh9geKx6VXEOqMjLldKOtIywQG3/8wnGMjf5RxYwOmaMI2365FM9uIy
	MLMCwXxSfkU1NFyqLZnu4JD1DQpp+RA==
X-Google-Smtp-Source: AGHT+IGVKarTf9MmYLr1qao2mqcnFhqGl+h5QYQoxc27zk+/XhHEiAgy42O1OFMRwBvwmo3HmvXfZQ==
X-Received: by 2002:a05:600c:1c98:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-459d8c2833amr23773025e9.7.1754299245485;
        Mon, 04 Aug 2025 02:20:45 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4530b3sm15251948f8f.34.2025.08.04.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:20:44 -0700 (PDT)
Date: Mon, 4 Aug 2025 11:20:42 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>
Subject: Re: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWwgTWFp?=
 =?utf-8?B?bF1SZTog6L2s5Y+ROiBjb21taXQ/YTYwOGRjMWMwNjM5N2RjNTBhYjc3MzQ5?=
 =?utf-8?Q?8433432fb5938f92?= (patch)  has a bug
Message-ID: <aJB7au_IGod9uWBK@fedora>
References: <51055c7ae10e40319473938f831d0af8@xiaomi.com>
 <b3cf760898054fb1adb4285e84f4a702@xiaomi.com>
 <aI49Im0sGb6fpgc8@fedora>
 <db380722eb484dedbf77ec6304c6ca7c@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db380722eb484dedbf77ec6304c6ca7c@xiaomi.com>

Hi 卢国宏,

Forwarding your email to the mailing list and answering after it.

The mailing list won't accept your emails unless you send them in
plain text:

On Mon, Aug 04, 2025 at 01:55:37AM +0000, 卢国宏 wrote:
> ________________________________
> 发件人: José Expósito <jose.exposito89@gmail.com>
> 发送时间: 2025年8月3日 0:30
> 收件人: 卢国宏
> 抄送: jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; torvalds@linux-foundation.org; linus@linuxfoundation.org; jkosina@suse.cz
> 主题: [External Mail]Re: 转发: commit?a608dc1c06397dc50ab773498433432fb5938f92 (patch) has a bug
> 
> [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> 
> Hi 卢国宏,
> 
> Thanks a lot for reporting this issue.
> 
> On Sat, Aug 02, 2025 at 12:23:54PM +0000, 卢国宏 wrote:
> > Hello, José and Jiri!
> > I've discovered that the patch you submitted to the Linux community,
> > "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.3.y&id=a608dc1c06397dc50ab773498433432fb5938f92"
> > contains a bug. Even with your patch, the charging status of HID
> > devices is still not reported to upper layers in a timely manner.
> > The reasons are as follows:
> >
> > [...]
> >
> > if function hidinput_set_battery_charge_status() return true, That is,
> > the charging status of the HID device has changed，This charging status
> > will not be reported，Because, only when handled is false,
> > "hid input update battery(hid, value);" will be called.
> 
> I wrote this patch a while ago and I can't remember the exact reason
> why hidinput_update_battery() is only called by hidinput_hid_event()
> when hidinput_set_battery_charge_status() returns false.
> 
> The devices I have change their status, for example, discharging to
> charging, when they are connected via Bluetooth and I switch them to
> USB. This reconnection reports the status to user-space, so there is
> no need for additional synchronization.
> Does your device work in the same manner?
> 
> --->>> Our device is a pure USB-connected controller with a battery inside. The controller has two USB ports, one for connecting to a mobile phone's data port and the other for connecting to a charger. After the controller is connected to the mobile phone, and then the charger is connected to the controller's charging port, the controller will report the controller's charging status to the mobile phone through the HID protocol (Usage Page: 0x85 - Battery System Page, Usage ID: 0x44).
> 
> However, before we try to fix the problem, it would be nice if you
> could provide a reproducer.
> 
> What device is affected by this bug?
> 
> By using "sudo hid-recorder" and selecting your device, you will be
> able to capture and replay (with "hid-replay") the HID events sent
> by your device.
> Could you share a recording of your device changing from the charging
> to discharging status and back to charging so we can reproduce the
> issue, please?
> 
> If the recording is too long, please upload it to a server.
> 
> --->>>  When I debugged this issue, I checked the charging status of the USB controller device by using the Android uevents bin file in the Linux command line. For example, I executed the command "./uevents | grep AAA", where AAA is the device name. Then, when you unplug the charger, it will print "AAA POWER_SUPPLY_STATUS=Discharging", and when you plug in the charger, it will print "AAA POWER_SUPPLY_STATUS=charging".
> --->>> Because I am not familiar with the use of "hid-recorder" and "hid-replay" for the time being, if it is really necessary later, I will help you capture the reproduction records through these two tools.
> --->>> By the way, we previously approached Google directly to resolve the issue by adding the line "power_supply_changed(dev->battery);" mentioned in my original email to the Google Linux kernel code. We've already built two generations of this product, and this solution has proven to be feasible. However, when we requested this solution again for our third-generation product, Google disagreed. They said we should address the issue directly upstream! In other words, we should approach the Linux community to resolve the issue once and for all. They have a point, so I'm coming to you for help.
> 
> > Therefore, the function "hidinput set battery charge status" can be
> > changed to the following:
> >
> > static bool hidinput_set_battery_charge_status(struct hid_device *dev,
> > + unsigned int usage, int value)
> > +{
> > + switch (usage) {
> > + case HID_BAT_CHARGING:
> > + dev->battery_charge_status = value ?
> > + POWER_SUPPLY_STATUS_CHARGING :
> > + POWER_SUPPLY_STATUS_DISCHARGING;
> > + power_supply_changed(dev->battery);
> > + return true;
> > + }
> > +
> > + return false;
> > +}
> 
> Could you test if this patch also solves your problem, please?
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 9d80635a91eb..bce580beb5c6 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -1515,11 +1515,8 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>                 return;
> 
>         if (usage->type == EV_PWR) {
> -               bool handled = hidinput_set_battery_charge_status(hid, usage->hid, value);
> -
> -               if (!handled)
> -                       hidinput_update_battery(hid, value);
> -
> +               hidinput_set_battery_charge_status(hid, usage->hid, value);
> +               hidinput_update_battery(hid, value);
>                 return;
>         }
> 
> --->>> I am sure that your patch can also solve our problem, because we have used your method to solve this problem in our previous internal code. If you can submit this patch, our problem will be solved. Thank you very much!
> 
> Thanks a lot in advance,
> José Expósito
> 
> > Because we have encountered this problem in our project, and this
> > method can solve it.
> > I hope you can solve this problem as soon as possible, otherwise,
> > we will encounter this problem again in our future projects.
> >
> > Thank you so much！
> #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#


I sent a couple of patches that I think will solve your problem:
https://lore.kernel.org/linux-input/20250804091215.6637-1-jose.exposito89@gmail.com/T/#md9f4924a4a5817fe6c0ff9474f8a5c0e36c9ee3b

Please compile and test them and let us know if the solution works
so we can merge the fix upstream.

If you find any problems, please provide a reproducer so I can debug it.

Thanks a lot in advance,
Jose

