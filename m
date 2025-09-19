Return-Path: <linux-input+bounces-14895-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A3B8873A
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 10:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C8F14E16D8
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 08:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0D8304BD7;
	Fri, 19 Sep 2025 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RO8C8x6O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4870A2D9491
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758271245; cv=none; b=H/9y4lq/P/LXDuGAcki3upwRiTfqQGx7jrp2IkCIODILBZxFq3zzi1/fLzc4bciXSDAn3lVw8YWdDNQlUf4K27ft/he3KX9dHq70hjVIAGpbKfn78pww8OH5Jatoj2pFQT4h0NY61wDC2HAqWd/V9V/B4OP+e+Mpn8Zl0wyqKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758271245; c=relaxed/simple;
	bh=gOYz3v1eddbzcvjAoeR9HIWwqh5JC+Thv7UoJi6Li0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIKIalhe8hIx0ob/B0q79MVw1hGgqNiOlojFGSMXQCRKEyVe7zfl2swnZ3MjkYP+XBQN6ol5dwwU0C1HpIk1ruD0CjjmNpn6J6cAJ4xZkN1DPhS01mHrURsGvGR1ppa2ARlcc8jy6X6ZKmgLDeenltH8Hv21dsg/vptgHSZUb6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RO8C8x6O; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ece1102998so1006473f8f.2
        for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758271242; x=1758876042; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NIAnBB06MyVX2wfnshlvf6atnYBrAR2jdzzUU6RYVAU=;
        b=RO8C8x6OMtOnBx6CIqZrKOI4C+VIscg7yyr5YI7I8yiSDY7ygRUXryx/LZlZHF5XEI
         C2fw/onf1nKOUBdA5OSdN22vOXuTHgyyhMsNdoXZx4TkZWPteyolM9a1ZECpmCENdurb
         n5QO5KFcK987jidC4MuSsNMmuCPips16n9Sa+1/zHoLoDI7ehE+KwHAI5RbF5bA+lawZ
         CyE3zpj4snUfEOGoE6W0AQfdw2X6oibxocPl8+tIbSkFgNsMS2uTdszFp4G3HYZSZtTB
         PY14drlCKiDNs0tYOoLGx23AiDnlSraIhqoc6uC3LF+neyY0euBcbUpa+5gesAhZ0o8E
         zyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758271242; x=1758876042;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIAnBB06MyVX2wfnshlvf6atnYBrAR2jdzzUU6RYVAU=;
        b=EoulgG+Vy5lZ7eHrdTWMu1TO2OT/uJQ4RpKr15IaFU5fSZ/dtBfP5hdBBoFtxPSV+l
         dLYQIIxwepNLCXylZBRFCxjmEkp4iQb7velwNRnMoVxtfU9VEMDP5wV5qE8wDIM0/9iE
         JBdjK1tf1TanN0xadjYaG94HCXNVlSmr5y9XC1ahLnIb9pcT1PciexUOKNeReRybAaVN
         gSoVd+TyweTFfO/v2rO0zynQ6lmiu9Th2eNkWEnsdDrHfpaWd3Uy8Liigc/Ekg4mPoL6
         /JzbMbsuuto48K9gebPoeju2qzGhe2+9ouOo/aQqQFrrJlJQi6y7Kyaef530XV9f5pDy
         NTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQOLQGZlPy+vuw8QaJrsZ7jTzm+2TnNpgyIBmG32tFhj7IehIP8C1Thne1VphoTSyd1iYFxqUBuyv7Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PXS4a7SzfjuH+xQDp8O3x7STQL4ztXyzNweK3rtJcWj1YBuo
	ME8GyRbM1CEUXyZNZgSlubzKZhEshHsr1BAxMfEQHlCnxgOhFl79+1QG
X-Gm-Gg: ASbGncukAIlbIXyJpzxGh6sIjOr3tqdE9Zg/8kwPjv1mJc7HJj//bxJeYBPSV4TasOq
	IAkxSxVL0PAGNYGZ6y3jgGETc3yvUY5d/m2LKkVHbkGKF3IkO3Rl9T1bnsnpNfqjcc5pqopFxc+
	yy+TO6jt5y1VCdf8vt42U/MVv49cjP9LfCq0w+zRHMp3POuNAmCe3hnAUUwusEbB0SemU+CwEq/
	1QZigxDORpIm0olMuhb4JVL20/fRYLWaDyt/ll21G4Ln6yuuuM/T8gzS3nqDu07AZ4J8o4lt1O7
	+YkiK9LID7Vw2YEV7Ro2x/w9ZyNHRpDxSMDmSsYyZDyWXbIdNgxqhWpdNGnfkEO9xSlo60eXlVC
	vObqkDKwOVOJgjdqqzCo=
X-Google-Smtp-Source: AGHT+IEJEthob1/t3JTrPT5id9i8Ikn1uiw7mDfiwIHDS3ixRODVEHMflBCi71CdF90G3RL5ZGoFUg==
X-Received: by 2002:a05:6000:26c6:b0:3ec:d7eb:7d30 with SMTP id ffacd0b85a97d-3ee861f839bmr1589644f8f.49.1758271241312;
        Fri, 19 Sep 2025 01:40:41 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f320e2000sm80102345e9.1.2025.09.19.01.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 01:40:40 -0700 (PDT)
Date: Fri, 19 Sep 2025 10:40:38 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	jikos@kernel.org, bentiss@kernel.org, dmitry.torokhov@gmail.com
Cc: =?utf-8?B?5p2O6bmP?= <lipeng43@xiaomi.com>,
	Fei1 Jiang =?utf-8?B?6JKL6aOe?= <jiangfei1@xiaomi.com>,
	=?utf-8?B?5a6L5a+G5a+G?= <songmimi@xiaomi.com>
Subject: Re: The zero power level of the HID device in kernel 6.12 is not
 reported from the kernel to the upper layer.
Message-ID: <aM0XBudxlXuzALbg@fedora>
References: <d2cada7efe8d4436b6e638fa1e0aaefb@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2cada7efe8d4436b6e638fa1e0aaefb@xiaomi.com>

Hi 卢国宏,

Thanks for reporting this issue.

In the furure, when reporting bugs, it is prefered to send them to the
mailing list (linux-input@vger.kernel.org and linux-kernel@vger.kernel.org)
to discuss them in public.

Let me forward your email to the mailing list and also CC Dmitry, the
author of that code, who might help us understand the problem.

On Tue, Sep 16, 2025 at 12:29:32PM +0000, 卢国宏 wrote:
> Hi, jose!
>
> We encountered a problem where the zero battery level of the HID device
> in kernel 6.12 was not reported from the kernel to the upper layer.
> I checked the HID protocol and it doesn't say that there is no need to
> report the zero power of the HID device. For details, see page 381 of
> the HID protocol, 31.4 Battery Measures. "Absolute State Of Charge DV
> The predicted remaining battery capacity expressed as a percentage of
> design capacity. (Units are %. The value may be greater than 100%.)".
> However, in the file hid-input.c in kernel 6.12, the following code：
> 
> static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
>                                     int value)
> {
>         int capacity;
> 
>         if (!dev->battery)
>                 return;
> 
>         if (hidinput_update_battery_charge_status(dev, usage, value)) {
>                 power_supply_changed(dev->battery);
>                 return;
>         }
> 
>         if (value == 0 || value < dev->battery_min || value > dev->battery_max)
>                 return;
> 
>         capacity = hidinput_scale_battery_capacity(dev, value);
> 
>          ......
> 
> }
> 
> The parameter value is the power level. When the value is 0, the above code
> returns without reporting.
> Is this a problem?
> We're currently experiencing this issue on Android 16. The upper layer of
> Android needs to receive a zero battery level before it can take appropriate
> action.
> Could you please help me evaluate whether we should remove the behavior of
> returning to zero battery?
>
> Thanks!
> #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#

It indeed looks like it could be problematic.

Values are allowed ot be grater than 100, however, I didn't find
any references to negative values. Since it is a percentage, it
make sense to limit it to 0%, i.e., not allowing negative values.

I think that removing the "value == 0" check, or replacing it with
"value < 0" should fix the issue.

By the way, the "Fully Discharged" value (0x00850047), section 31.3.1,
is not handled by the kernel. Do you know if Android handles that
instead or in addition to a 0% battery?

Jose

