Return-Path: <linux-input+bounces-14929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5BB8A2A7
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 17:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4581A1893AAC
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 15:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA49253B64;
	Fri, 19 Sep 2025 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeskXYlD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA481C862E
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758294299; cv=none; b=AAe+lXAeahgHh9G+RFAPBE+4PQ9hwFeaoSEVHge9mREJEfnWO7GeWWtY2qaI0XZUtMjyt3hPWM3TVWGU9v6oeEyH5VGS0XePTAcTczfjsindmEAP4wwSWz04vlDN95Q7zqk4AxwcOuO9oEdR92ANDPB1/WaIsM+4GE732RtIixY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758294299; c=relaxed/simple;
	bh=FjiAFTxi8jODCJ+bHLXvv3TSer1xCrhWr1iU5kYCg4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAc5uoTsZ3KDjfwVSy2IwM1MmLw3EOqKEcOP2M1Ema92cARVVdiL8yV3BMgx0dycKImTn64e/5RaMsACdOb2jlTyXUDmvyERA/U8PPLhELo++Y/EAkNav+RNVwBpOwpZieviCg0WLg4CO8hnPosqpQdI8obmBCFI45hNdFaVChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeskXYlD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7761578340dso2942467b3a.3
        for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758294297; x=1758899097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sGq779JduiMFVPFNRcpvBXJsIWGjn1vuBo47AZWt1KU=;
        b=BeskXYlDOmQ6BCHi0nKmLFlKmb1AsAVOE1aV2Nbwst7up85x6XO8FHZ/hSMQ5l+JmT
         JzxeqGjU+q0wWyucvOwHSwV1Z1PblYKbdyiy8V81Mz5zHjdyH/khHTEyd2yzv1YKDvRO
         STZaIptn4hq82WjaE5SULmwApqRk/VysvFro9q+x9UIWnhO89avhaO55/nv5e7i2jJdu
         jsWmyTLInO7cKCVBlSKovrT/mSghm9RbdPsyGTDigSK19DGkZvZGB9n5cR5/u7OnvSB4
         JSXz9seAle711v5i2eZ9HrgIUfDPIU1uX25TkXn3aaG4fZ4OTJ6pwWArsor4vYGJVVBT
         uZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758294297; x=1758899097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGq779JduiMFVPFNRcpvBXJsIWGjn1vuBo47AZWt1KU=;
        b=kU0ltQPhBHF2elpOIoe2X/A9lUpeUERjlUGm6bY/fn0BHUgQd1jAKowO3NcuRO8ksD
         v0rUQkhSwi7bd9ZlCJQhqCuZ2NnXLStN9AFdPzVHQiRhIFBdxyakl15rc2enebDTE7YZ
         YBSQWL1MCK1PEoSKWeZkByhGe71JaGxhfCk0rmdxBcSIMYqjdocE6QBoa87247GpYEpk
         zUmII3dH3odkd73akkLAGbozrlLtf8+HOxu+oKQg8dcktZjJSjmSk62riHzH4aMmBu5b
         vXECmtKpVXo6eTwVSRB4ZZOuvRESjxUNSOO4c3YftI+okXkXE07Vmd7zjlmwyTNN38hm
         qgrw==
X-Forwarded-Encrypted: i=1; AJvYcCVR/KlDRPbh3+SmnhbjBzI/QLDsjWAP9auDc/wdr5aRqK/E5HqYlXw5lxBKhddpZJqB75LxpOnHGCMQwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3+NcvzCNhH9iqXNnEGStFuRp5/X5ycsnN6xwJG0xd8Z44HXR
	bg1Wn/pM0aNK9Ko1SyKf1C4KB24lP1YvS6Gc0L9CxOhQksBAv9KadJXzUa2SJA==
X-Gm-Gg: ASbGncu7i2wyPTEmIn/mrzfaBv+XGDdsv5/v17BJYgZvhfQYT69z/NPtdKYpYvOaWDa
	+Hw/v+8ZgTH+zqjLlkRA4FGYe+X9sIfCE8hosh/hqfXJntfkyFJm70xo+RIBKBI2yqkpUyG60VK
	3iDOD7DgTiOvCPcJ8FlFmtfFDceX1lLnaETPf6GGq4fiat+AJMv9Gn0pAE0698b/wOncyy7c+i0
	J22NewqereiKN+C27ikDEaKh3YFkMlUI3gQs0U/8cJricxLJtUjhwb1rpwdhBOAYBB/+q7R+Pl1
	pQnVGSHeFYlDhxViGtZFoGqTPCw/7trrZBkzztzy4N562sdW2TXBDsOcBggmZFLgHWCl/qJFbL8
	biaqzdem6ahrpgSZrkxHrXQg=
X-Google-Smtp-Source: AGHT+IHHcMV2N/II71EljOa9GN5fNQJq+YIm51L7Ojo0UiWzA7YiSqKriRoWdVdGhiCgc1jxrgbZUA==
X-Received: by 2002:a05:6a21:9984:b0:252:525c:2c2c with SMTP id adf61e73a8af0-292605d38cemr5694626637.14.1758294297086;
        Fri, 19 Sep 2025 08:04:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8e3e:e1c9:1151:50c3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55156734a4sm2968810a12.4.2025.09.19.08.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:04:56 -0700 (PDT)
Date: Fri, 19 Sep 2025 08:04:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, jikos@kernel.org, 
	bentiss@kernel.org, =?utf-8?B?5p2O6bmP?= <lipeng43@xiaomi.com>, 
	Fei1 Jiang =?utf-8?B?6JKL6aOe?= <jiangfei1@xiaomi.com>, =?utf-8?B?5a6L5a+G5a+G?= <songmimi@xiaomi.com>
Subject: Re: The zero power level of the HID device in kernel 6.12 is not
 reported from the kernel to the upper layer.
Message-ID: <px5t2iedrrqhcrpdvmu5pznp53d3e5jp55dm72phlsti2rmt4j@rj2pajkavuir>
References: <d2cada7efe8d4436b6e638fa1e0aaefb@xiaomi.com>
 <aM0XBudxlXuzALbg@fedora>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aM0XBudxlXuzALbg@fedora>

Hi,

On Fri, Sep 19, 2025 at 10:40:38AM +0200, José Expósito wrote:
> Hi 卢国宏,
> 
> Thanks for reporting this issue.
> 
> In the furure, when reporting bugs, it is prefered to send them to the
> mailing list (linux-input@vger.kernel.org and linux-kernel@vger.kernel.org)
> to discuss them in public.
> 
> Let me forward your email to the mailing list and also CC Dmitry, the
> author of that code, who might help us understand the problem.
> 
> On Tue, Sep 16, 2025 at 12:29:32PM +0000, 卢国宏 wrote:
> > Hi, jose!
> >
> > We encountered a problem where the zero battery level of the HID device
> > in kernel 6.12 was not reported from the kernel to the upper layer.
> > I checked the HID protocol and it doesn't say that there is no need to
> > report the zero power of the HID device. For details, see page 381 of
> > the HID protocol, 31.4 Battery Measures. "Absolute State Of Charge DV
> > The predicted remaining battery capacity expressed as a percentage of
> > design capacity. (Units are %. The value may be greater than 100%.)".
> > However, in the file hid-input.c in kernel 6.12, the following code：
> > 
> > static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
> >                                     int value)
> > {
> >         int capacity;
> > 
> >         if (!dev->battery)
> >                 return;
> > 
> >         if (hidinput_update_battery_charge_status(dev, usage, value)) {
> >                 power_supply_changed(dev->battery);
> >                 return;
> >         }
> > 
> >         if (value == 0 || value < dev->battery_min || value > dev->battery_max)
> >                 return;
> > 
> >         capacity = hidinput_scale_battery_capacity(dev, value);
> > 
> >          ......
> > 
> > }
> > 
> > The parameter value is the power level. When the value is 0, the above code
> > returns without reporting.
> > Is this a problem?
> > We're currently experiencing this issue on Android 16. The upper layer of
> > Android needs to receive a zero battery level before it can take appropriate
> > action.

What kind of action are we talking about? Section 31 of the HID
specification defines events for "Smart Battery" ("To comply with the
Smart Battery Specification, the Battery System must support the
functions defined in the Battery and Charger usage tables. For details,
see Section 4.2, “Battery System Page (x85).”) and is typically used for
"battery pack for cellular phones (principal source), the battery
pack(s) for notebook computers (auxiliary source), and the sealed
batteries in uninterruptible power supplies (auxiliary source)."

Is your use case main battery or battery in a stylus or some other
peripheral?

> > Could you please help me evaluate whether we should remove the behavior of
> > returning to zero battery?
> >
> > Thanks!
> > #/******本邮件及其附件含有小米公司的保密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本邮件！ This e-mail and its attachments contain confidential information from XIAOMI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!******/#
> 
> It indeed looks like it could be problematic.
> 
> Values are allowed ot be grater than 100, however, I didn't find
> any references to negative values. Since it is a percentage, it
> make sense to limit it to 0%, i.e., not allowing negative values.
> 
> I think that removing the "value == 0" check, or replacing it with
> "value < 0" should fix the issue.

If we are dealing with peripherals (stylus for example) - for which this
piece of code was written - how a battery powered peripheral that is
fully discharged can communicate it's battery state of 0?

I think we have observed bogus reports with 0 values (IIRC trying to
query battery strength when stylus is not in proximity would yield
responses with 0 strength).

Thanks.

-- 
Dmitry

