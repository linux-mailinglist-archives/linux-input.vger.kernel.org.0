Return-Path: <linux-input+bounces-13834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E460B1C16B
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 09:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A81F3181AA2
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 07:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D3521859A;
	Wed,  6 Aug 2025 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4Cz4PzC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616DA1FC8;
	Wed,  6 Aug 2025 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754466135; cv=none; b=qMQjs0Jejnedi6ZyrI94f8prnhaidVd4S/cb+dckeeMiBjLuObfAiqfbBR3kE4CaemFIoz4Ayv39ndEioWaSkKjzFd7KsOuDXMYCEPDUo4uJsbgyFzMKf3o2QYQGmwKigpT+JNj8yK2AO2GExdkT4mEw4nhsmUCsrjq7P1CQOE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754466135; c=relaxed/simple;
	bh=ki+85WZZErf2h8qeAmHmY+ki0OS4XjOJXt0lI5UvJA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvfWNAYSbMN9mh/3dADi4gZ9RzCCCV1CDXJl8ccdcrXiu6KeTu7Rc0IQWDx+YpOKSLQIgRtml0N86NvvGsgxzoueQRde7k/Ww7vcP4aRQ8Wc/DGPyKdrpDZlgQCq+8SjqMMgL5dqgAsmHQeFUZfhcDdhaTzSQA1sdrOU7O+CPN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4Cz4PzC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so46347785e9.3;
        Wed, 06 Aug 2025 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754466132; x=1755070932; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6FT24UNbMHeaORvKTfTuqFUto6VDI1Q4PAbvNaBHL8w=;
        b=X4Cz4PzCGgzU/Roq5UJaJtxvgflW4CtJQn5S7Oeh7gzzc/qO85yoz7hnzkitUP6zbF
         cyUd0hkBPrG54S95pZ62V0gsZyDYwmsyjaEOGBQliyV/BRDo9hkvp7EHt38PofmtZw/+
         E/H1gQs9Bcq3+5qax9C7NMjg7NaYK5+r7AlFQ6kkeCbF/aFxrH9Dw9t2yvVY+1Vu8icV
         etduZINKlhcvKX3coBRhvnJF3X75A8ELFbdBcLAcgtO2GVb4I2agWKlYqmBGjAtFkHa7
         5E28J42ySnIZHkDZCNikM5FW1XYrFNxDFMaGlr5WDQBU8qYkioPbCPgbvHk75HnNWmyW
         sUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754466132; x=1755070932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6FT24UNbMHeaORvKTfTuqFUto6VDI1Q4PAbvNaBHL8w=;
        b=epk/Z9dFnWmfPgPj7+HEgZjRdlcznkVaTqpbkZ21H1zy5jIbEa/3r4t/NncFhgp+y9
         xypkMbtNxuv9JlYPDarPTjnsPPXj7b+d+Gw0Xc3TslmndCa/5O5/pJWMDtZo8+XBRgZF
         5mMumWcHlqSL11dDLhHn2td//RfDukgdf1pXrSxxtVk6fGaNM/U5CfOF39gQCfNYpo4a
         TuGnyj9fDLvvXV6YJSNh+s5UfreCV0G7aKolD12gcv4DEG9uHkSgLFzJcINHu4pHQkWN
         /gxt3TWtVzEhOoKAqiLCaTqbSYSXWWApvhLtLVmJvkJroYMLw6p+jwdc3VDhmgidZGCj
         8JKw==
X-Forwarded-Encrypted: i=1; AJvYcCVmvFcIT2G9KSWGLgWFgdpVNX2Eb7JO8wXV3JdzjFGZuxKlpSPeOkqaw8wYOrJjUUQm5Ogx2dPC4zTmMA==@vger.kernel.org, AJvYcCXqutZQ4jmlT0n1o+nhDnNPLSDpIPFuibMwnELTmlwlZHqAMMwTpE5i7CTv0W5S63EJQtBk4x65bK2rTKG8@vger.kernel.org
X-Gm-Message-State: AOJu0YyOpjN4vU7rfZD57GLbkDrnW+jdBiMcz3tNZELqGAVswfaLbIrg
	H7NjGOiFKffzr1GHNpjq3b4wrP9MikUYCWigeA+AyN/Mv0hg2S6jyvZ1k564HA==
X-Gm-Gg: ASbGncsrWRWdJ7bMG5MH8RNVShbkDC/N66VSV9Mp6UIhJ8W82yi+zUf4fQVb0OP9WxC
	9DXteskJFkSWl9vLDoKC60kSLKtmpXLTLJ5kvTHFSe4t/cI8hweHu6PgcjwnOtRlzqZUn3qI5DZ
	H1Mcc1yVwNy7j57LgJ0FuEZC9PbT4KqPEEPO3dcuSwHS04CsFA6/aaT82p3S+VqUM5+yMfN96pL
	qR30M55M3l40Z4mHV/PaysmfDkxe8chFNAUgQMbxw3yJmRFp5IKIyKgqaebcVrWb6SzRu2s1yH+
	tyrKN4dGNl+Saa4j4j4IFTcA5fX1wfuOIypsdKcFVFkcy0CcJNSCPgmK8odSw81gopZ/LOzfVGx
	N5rTIQGLrL+llhqnV+Hk=
X-Google-Smtp-Source: AGHT+IHPYrArLENkrYpyT+ebS9Hl1NiNdjOvdG5F1ChQY+7/LnRIlSa14LZSdOIcB3sE1c1D6Bz6+w==
X-Received: by 2002:a05:600c:4689:b0:458:bfb1:1fb6 with SMTP id 5b1f17b1804b1-459e7440b43mr12701065e9.2.1754466131400;
        Wed, 06 Aug 2025 00:42:11 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e588144fsm34288725e9.28.2025.08.06.00.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 00:42:10 -0700 (PDT)
Date: Wed, 6 Aug 2025 09:42:09 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Fei1 Jiang =?utf-8?B?6JKL6aOe?= <jiangfei1@xiaomi.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBbRXh0ZXJuYWwgTWFpbF1bUEFUQw==?= =?utf-8?Q?H?= 2/2] HID:
 input: report battery status changes immediately
Message-ID: <aJMHUTyeaE0Q_yUA@fedora>
References: <20250804091215.6637-1-jose.exposito89@gmail.com>
 <20250804091215.6637-2-jose.exposito89@gmail.com>
 <a235549c5cf24205bb7ce7f05737c403@xiaomi.com>
 <aJHEAHH6KCAGxs8N@fedora>
 <b5aa18342f42420093db90ee2ead88ba@xiaomi.com>
 <aJH7T7_8p0GT3f2L@fedora>
 <6454c36ced0140df978f29a7b4208f4a@xiaomi.com>
 <9dbdee5aa8fa4b899bfbb8be3b4cd6c5@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dbdee5aa8fa4b899bfbb8be3b4cd6c5@xiaomi.com>

Hi 卢国宏,

On Wed, Aug 06, 2025 at 07:03:05AM +0000, 卢国宏 wrote:
> 
> Hello, Jose!
> I've completed testing on our devices. Your patch works fine for charging status reporting.
> Below is the switching log between partially charged state and uncharged state：
> 
> ...
> Xiaomi handler POWER_SUPPLY_STATUS=Charging
> ...
> Xiaomi handler POWER_SUPPLY_STATUS=Discharging
> ...
> Xiaomi handler POWER_SUPPLY_STATUS=Charging
> 
> In addition, the handle battery level can also be reported normally.
> Now you should be able to submit your patch to the Linux kernel. After submitting,
> please send me a copy of the official patch so I can contact Google to merge it into
> their GKI and enable this feature in our products first. Thank you very much!

Thanks a lot for testing it. Here is the link to the patch:
https://lore.kernel.org/linux-input/20250806073944.5310-1-jose.exposito89@gmail.com/T/

Best wishes,
Jose

> 
> luguohong
> 
> ________________________________
> 发件人: 卢国宏
> 发送时间: 2025年8月6日 9:41
> 收件人: José Expósito
> 抄送: jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Fei1 Jiang 蒋飞; 卢国宏
> 主题: 答复: 答复: 答复: [External Mail][PATCH 2/2] HID: input: report battery status changes immediately
> 
> 
> 
> 
> OK! I'll use your patch and finish testing it soon and let you know the results, thanks!
> 
> 
> ________________________________
> 发件人: José Expósito <jose.exposito89@gmail.com>
> 发送时间: 2025年8月5日 20:38
> 收件人: 卢国宏
> 抄送: jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Fei1 Jiang 蒋飞
> 主题: Re: 答复: 答复: [External Mail][PATCH 2/2] HID: input: report battery status changes immediately
> 
> [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> 
> Hi,
> 
> On Tue, Aug 05, 2025 at 12:25:17PM +0000, 卢国宏 wrote:
> > ________________________________
> > 发件人: José Expósito <jose.exposito89@gmail.com>
> > 发送时间: 2025年8月5日 16:42
> > 收件人: 卢国宏
> > 抄送: jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Fei1 Jiang 蒋飞
> > 主题: Re: 答复: [External Mail][PATCH 2/2] HID: input: report battery status changes immediately
> >
> > [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> >
> > Hi!
> >
> > On Tue, Aug 05, 2025 at 01:43:30AM +0000, 卢国宏 wrote:
> > > ________________________________
> > > 发件人: José Expósito <jose.exposito89@gmail.com>
> > > 发送时间: 2025年8月4日 17:11
> > > 收件人: jikos@kernel.org
> > > 抄送: bentiss@kernel.org; 卢国宏; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; José Expósito
> > > 主题: [External Mail][PATCH 2/2] HID: input: report battery status changes immediately
> > >
> > > [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> > >
> > > When the battery status changes, report the change immediately to user
> > > space.
> > >
> > > Fixes: a608dc1c0639 ("HID: input: map battery system charging")
> > > Reported-by: 卢国宏 <luguohong@xiaomi.com>
> > > Closes: https://lore.kernel.org/linux-input/aI49Im0sGb6fpgc8@fedora/T/
> > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > ---
> > >  drivers/hid/hid-input.c | 17 ++++++++++-------
> > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > > index 262787e6eb20..277538a17b57 100644
> > > --- a/drivers/hid/hid-input.c
> > > +++ b/drivers/hid/hid-input.c
> > > @@ -609,13 +609,19 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
> > >         return false;
> > >  }
> > >
> > > -static void hidinput_update_battery(struct hid_device *dev, int value)
> > > +static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> > > +                                   int value)
> > >  {
> > >         int capacity;
> > >
> > >         if (!dev->battery)
> > >                 return;
> > >
> > > +       if (hidinput_update_battery_charge_status(dev, usage, value)) {
> > > +               power_supply_changed(dev->battery);
> > > +               return;
> > > +       }
> > > +
> > >
> > > > Hi, José. Shouldn't the return statement in this code be removed?
> > > > Otherwise, if both the battery level and the charging status change
> > > > simultaneously, the code following the if statement that updates the
> > > > battery level won't run, and the battery level won't be updated.
> > > > Thanks!
> >
> > At least on the hardware I have access to, changes are reported independently.
> >
> > I added a log at the beginning of this function to illustrate it.
> > This is the output when the battery of my device goes from 99% to 95%:
> >
> >     New EV_PWR report:
> >         usage = 8716389
> >         value = 99
> >     New EV_PWR report:
> >         usage = 8716356 (HID_BAT_CHARGING)
> >         value = 0       (POWER_SUPPLY_STATUS_DISCHARGING)
> >     [...]
> >     New EV_PWR report:
> >         usage = 8716389
> >         value = 95
> >     New EV_PWR report:
> >         usage = 8716356 (HID_BAT_CHARGING)
> >         value = 0       (POWER_SUPPLY_STATUS_DISCHARGING)
> >
> > If we remove that return, then "value" (0 or 1) would be used as battery level,
> > reporting wrong battery levels to user-space.
> >
> > Isn't your device reporting its battery information in a similar way?
> >
> > > --->>>
> > > Hello, Jose!
> > > You're right, this return can't be removed. I had previously only
> > > theoretically assumed they would be reported simultaneously, but
> > > that turned out to be incorrect. It seems your solution should be fine.
> > > Finally, when will your patch be merged into the Linux kernel?
> > > We're looking forward to using this feature. Thank you very much!
> 
> Would you be able to test that the patches work on your device?
> 
> I assume there won't be surprises, but better to double check if
> you have access to the affected device.
> 
> Once you test it, I'll send a second version of the code fixing a
> warning and adding you as tester of the patch. Then it is up to
> the maintainers to merge it.
> 
> Looking forward for your testing,
> Jose
> 
> >
> > Jose
> >
> > PS - I'll fix the warning in v2 and add a Tested-by: 卢国宏 tag once
> >      this is confirmed to work on the affected hardware.
> >
> > >
> > >
> > >         if (value == 0 || value < dev->battery_min || value > dev->battery_max)
> > >                 return;
> > >
> > > @@ -648,7 +654,8 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
> > >         return false;
> > >  }
> > >
> > > -static void hidinput_update_battery(struct hid_device *dev, int value)
> > > +static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> > > +                                   int value)
> > >  {
> > >  }
> > >  #endif /* CONFIG_HID_BATTERY_STRENGTH */
> > > @@ -1515,11 +1522,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
> > >                 return;
> > >
> > >         if (usage->type == EV_PWR) {
> > > -               bool handled = hidinput_update_battery_charge_status(hid, usage->hid, value);
> > > -
> > > -               if (!handled)
> > > -                       hidinput_update_battery(hid, value);
> > > -
> > > +               hidinput_update_battery(hid, usage->hid, value);
> > >                 return;
> > >         }
> > >
> > > --
> > > 2.50.1
> > >
> > > #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#
> > #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#
> #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#

