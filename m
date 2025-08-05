Return-Path: <linux-input+bounces-13819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB306B1B390
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 14:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 164FA181B4C
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 12:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EE7270565;
	Tue,  5 Aug 2025 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZKrzEaP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B826FA58;
	Tue,  5 Aug 2025 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754397526; cv=none; b=eOM/htAg/NNUNurzDAsqp0BCICqsLGmk6GIBOM3BZV7CROIn+Kbf0kCI7a8FDgMbzblXgm8cz0BHeM5FC2ZnASntmTRBVbUnnW9MnXJM6dNWjOsSe6fwWW8DrRh4mYkVoh9e1T9znzm8lfslHMkwFsjFmYB5akLTThctOm/Y0J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754397526; c=relaxed/simple;
	bh=fCIplKjYYvhpVdE9ZwS6nVUEDINPUMXvXSNU7sUfpLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cH8wa/e4gplFdBiaRkmtcKU8+FxzPByYzLgtVGivpQaWd7yB8jC4I/ugyKj3mlVLOwNuX+WuHSsDKpNs+NOApIBz5nnYaHiykiZXISRDexTjBIWgHfmu5ODmNA95Ii22M5ED5nj9y6npM0G6FA9UyE4i13uE7uClo2J1FJVL9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZKrzEaP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-459d44d286eso10072065e9.0;
        Tue, 05 Aug 2025 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754397523; x=1755002323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BJ14w+qzAAQEnx9IRn2IhM8wMVTsftHc0WzBxA+b8MU=;
        b=EZKrzEaPOi/pBA/t0HWHIYHN356tT/qJzXpd2ec9CWQLyofoT9iM7Dq7A74GhvWKD8
         Z4ugeBGvbRm/lrUg0vtqloGwdslSQZdnjhjoTqR5SDiCkU67cRSzU6Gev0yWOBg7PLQI
         8Zvlk5TlMMxLYD9vdbkLf3aHlVeMkqR9jhNMStNCBSBjM8tbbevuQtaWSYnoE7LUOUvZ
         GmYt+MQokKApMzEFoI13bTu8lSgVMLIYaaa14jfbSXd/kc07WcxVyS2EKsa5j5vgazeY
         spbPdwbYVWaBAeh+wwQsx8bqXZPeYgHyFbXUQ4/jGvYAcVGE1oIY/TO/aHaUvZ3bM7Iy
         WTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754397523; x=1755002323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ14w+qzAAQEnx9IRn2IhM8wMVTsftHc0WzBxA+b8MU=;
        b=MFX8Z8kHP2zkJmG5wlo2CGAUzqK5zuRAssUHoU6IVDY4uAissXv9z+W25WWhvnXb8x
         i9luBbY16la8hbLSoxmodUKQf9Dglmd6qSH8I2yYkW5pmquT/NAqxJSzwhP20ujCocIU
         Xw0BNUmhA4YandeXiVtyy5hGcdhvHxzktGHDLzaLX/Zbaulg7qNeM/y5slVHAeEtmXzU
         gIHQa05i9MuphcWfHhjUPU99HnjjCw80mo6OkXN1Wq0dtKWXZpNQ1MiwzvK+GXn1a6Ic
         +Bd1UBOYtp1KT5Zyz5eWVoKUJCEyKKJaIpaQ8WMy5q7jKEivvEMezCKka8pNpO5KgSd0
         2VAw==
X-Forwarded-Encrypted: i=1; AJvYcCVy/zUjVipg0QZAI5HQqw5pvDGdgcF3ht96a6dFZG3KfvhS9adoYhq/Tk6HOLK+2yLzSfgLG//slo8olQ==@vger.kernel.org, AJvYcCWrh/z2ahwNRTmlOpSoQtybW86niPHJ0EG+S3JgzUVHeGhWtBcDLohwzUrIL3xPJ9oJCPWK3x/MRdUYGSi6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Sv9pTCe6JIrT5hicGiS5OuW3KOY4eT8Txu//z+b86HsqpJJq
	pFhBk2aUQzH+FYC8QKjIm2FG6dKKddvdhVTYHZYaMdfOa8xE1Dl7m7eb
X-Gm-Gg: ASbGncvnM0iiFueYw2XX1/r3sRB7GAOx5SYFTKU7IFIZTLRAcUMeehXMznCJTvH0GI+
	7j1vUyjGi0TsZmGZJDG7lIEyKY3O+OBfpT14JLOSMc956hVbvUrgEP1PnJcE69OWsp27/MrsgD1
	d+vM8JygCq+MK8gCY8BFA3bysrUO+MTe0iX/5j8m6tGxDU0QhkFXM6evz+LLJQiHZszETN+fzUz
	n7vkIVQ0eRoGVrpLcoWK6Nnl63T1ENpaIXNXtcetwA/9QUHjTGQJHKBibE8kZB86/jOOId1VZHc
	3pAJ1smCSWPBMerdgUOwREhG3fE0sXeO/EJhQkbVh0hoXqRXA/SeN0wAq9xAKc+L5smRL+j04y1
	wwT3mOxAH2C1XPFMNu4U=
X-Google-Smtp-Source: AGHT+IGCTUpgIyHYb6qNCft/zvHNNGTnRYA97DL8RwHs7vdamwEDZwqquWmTekfjImPiYPPqyjqpZA==
X-Received: by 2002:a05:600c:3590:b0:456:942:b162 with SMTP id 5b1f17b1804b1-459e0cc270dmr34334525e9.11.1754397522618;
        Tue, 05 Aug 2025 05:38:42 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458f713eb44sm111257425e9.14.2025.08.05.05.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 05:38:41 -0700 (PDT)
Date: Tue, 5 Aug 2025 14:38:39 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Fei1 Jiang =?utf-8?B?6JKL6aOe?= <jiangfei1@xiaomi.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtFeHRl?=
 =?utf-8?Q?rnal_Mail=5D=5BPATC?= =?utf-8?Q?H?= 2/2] HID: input: report
 battery status changes immediately
Message-ID: <aJH7T7_8p0GT3f2L@fedora>
References: <20250804091215.6637-1-jose.exposito89@gmail.com>
 <20250804091215.6637-2-jose.exposito89@gmail.com>
 <a235549c5cf24205bb7ce7f05737c403@xiaomi.com>
 <aJHEAHH6KCAGxs8N@fedora>
 <b5aa18342f42420093db90ee2ead88ba@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5aa18342f42420093db90ee2ead88ba@xiaomi.com>

Hi,

On Tue, Aug 05, 2025 at 12:25:17PM +0000, 卢国宏 wrote:
> ________________________________
> 发件人: José Expósito <jose.exposito89@gmail.com>
> 发送时间: 2025年8月5日 16:42
> 收件人: 卢国宏
> 抄送: jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Fei1 Jiang 蒋飞
> 主题: Re: 答复: [External Mail][PATCH 2/2] HID: input: report battery status changes immediately
> 
> [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> 
> Hi!
> 
> On Tue, Aug 05, 2025 at 01:43:30AM +0000, 卢国宏 wrote:
> > ________________________________
> > 发件人: José Expósito <jose.exposito89@gmail.com>
> > 发送时间: 2025年8月4日 17:11
> > 收件人: jikos@kernel.org
> > 抄送: bentiss@kernel.org; 卢国宏; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; José Expósito
> > 主题: [External Mail][PATCH 2/2] HID: input: report battery status changes immediately
> >
> > [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> >
> > When the battery status changes, report the change immediately to user
> > space.
> >
> > Fixes: a608dc1c0639 ("HID: input: map battery system charging")
> > Reported-by: 卢国宏 <luguohong@xiaomi.com>
> > Closes: https://lore.kernel.org/linux-input/aI49Im0sGb6fpgc8@fedora/T/
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >  drivers/hid/hid-input.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 262787e6eb20..277538a17b57 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -609,13 +609,19 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
> >         return false;
> >  }
> >
> > -static void hidinput_update_battery(struct hid_device *dev, int value)
> > +static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> > +                                   int value)
> >  {
> >         int capacity;
> >
> >         if (!dev->battery)
> >                 return;
> >
> > +       if (hidinput_update_battery_charge_status(dev, usage, value)) {
> > +               power_supply_changed(dev->battery);
> > +               return;
> > +       }
> > +
> >
> > > Hi, José. Shouldn't the return statement in this code be removed?
> > > Otherwise, if both the battery level and the charging status change
> > > simultaneously, the code following the if statement that updates the
> > > battery level won't run, and the battery level won't be updated.
> > > Thanks!
> 
> At least on the hardware I have access to, changes are reported independently.
> 
> I added a log at the beginning of this function to illustrate it.
> This is the output when the battery of my device goes from 99% to 95%:
> 
>     New EV_PWR report:
>         usage = 8716389
>         value = 99
>     New EV_PWR report:
>         usage = 8716356 (HID_BAT_CHARGING)
>         value = 0       (POWER_SUPPLY_STATUS_DISCHARGING)
>     [...]
>     New EV_PWR report:
>         usage = 8716389
>         value = 95
>     New EV_PWR report:
>         usage = 8716356 (HID_BAT_CHARGING)
>         value = 0       (POWER_SUPPLY_STATUS_DISCHARGING)
> 
> If we remove that return, then "value" (0 or 1) would be used as battery level,
> reporting wrong battery levels to user-space.
> 
> Isn't your device reporting its battery information in a similar way?
> 
> > --->>>
> > Hello, Jose!
> > You're right, this return can't be removed. I had previously only
> > theoretically assumed they would be reported simultaneously, but
> > that turned out to be incorrect. It seems your solution should be fine.
> > Finally, when will your patch be merged into the Linux kernel?
> > We're looking forward to using this feature. Thank you very much!

Would you be able to test that the patches work on your device?

I assume there won't be surprises, but better to double check if
you have access to the affected device.

Once you test it, I'll send a second version of the code fixing a
warning and adding you as tester of the patch. Then it is up to
the maintainers to merge it.

Looking forward for your testing,
Jose
 
> 
> Jose
> 
> PS - I'll fix the warning in v2 and add a Tested-by: 卢国宏 tag once
>      this is confirmed to work on the affected hardware.
> 
> >
> >
> >         if (value == 0 || value < dev->battery_min || value > dev->battery_max)
> >                 return;
> >
> > @@ -648,7 +654,8 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
> >         return false;
> >  }
> >
> > -static void hidinput_update_battery(struct hid_device *dev, int value)
> > +static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> > +                                   int value)
> >  {
> >  }
> >  #endif /* CONFIG_HID_BATTERY_STRENGTH */
> > @@ -1515,11 +1522,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
> >                 return;
> >
> >         if (usage->type == EV_PWR) {
> > -               bool handled = hidinput_update_battery_charge_status(hid, usage->hid, value);
> > -
> > -               if (!handled)
> > -                       hidinput_update_battery(hid, value);
> > -
> > +               hidinput_update_battery(hid, usage->hid, value);
> >                 return;
> >         }
> >
> > --
> > 2.50.1
> >
> > #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#
> #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#

