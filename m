Return-Path: <linux-input+bounces-9591-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE62A20B81
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 14:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3462188A10F
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C371A3056;
	Tue, 28 Jan 2025 13:45:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF591A9B27;
	Tue, 28 Jan 2025 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738071929; cv=none; b=D10NVVm6VQQmy/rOAb9rIl87hg8qPLeVCQw6UVRuQQvHkTasM9LQEvXFsq6hPvpE04Clm5ieTaloBL2KgVBt4Qv0+yhquNs4jbksIZnnK1xHXPR+NG7KDWvUUBi3uiJI4jMDq8P65vlAXuAlyXNn1AbarFz/UN9WKuPUS06103Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738071929; c=relaxed/simple;
	bh=EUsuGP9bWwQ6szFAe4jv0xP7A6dPxF3mOEJ24D/CzO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SyVdGiMdMUo31CDcEkpCOcWp5MxhNPBj0tZHKRBF81yQXzbLIr+2i+vkNNkY/qcbVi2rQ/BNFTUmbLu9E1NZ+RS4OImgexHEbzPT33hJ13BI9GUjv3GKSuR7PBmqL7ihK4OhJ2mA3tTvwrDcGswncariDdMYR2H+taS4CF2tOkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 28 Jan
 2025 16:45:22 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 28 Jan
 2025 16:45:22 +0300
Message-ID: <807cfa6f-5863-4fe4-8294-76d5cdbc3aac@fintech.ru>
Date: Tue, 28 Jan 2025 05:45:21 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
To: Alan Stern <stern@rowland.harvard.edu>, Kees Cook <kees@kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<syzkaller-bugs@googlegroups.com>, <linux-kernel@vger.kernel.org>,
	<syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>,
	<linux-hardening@vger.kernel.org>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
 <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
 <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
 <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
 <2a38e355-af5c-4b3d-81be-0cc97376c1f5@fintech.ru>
 <202406041019.BCD0A93C@keescook>
 <d1ad84e3-7da9-4dc8-a095-b9fbe191eb56@rowland.harvard.edu>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US, ru-RU
In-Reply-To: <d1ad84e3-7da9-4dc8-a095-b9fbe191eb56@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hello,

On 6/4/24 10:45, Alan Stern wrote:
> On Tue, Jun 04, 2024 at 10:21:15AM -0700, Kees Cook wrote:
>> On Tue, Jun 04, 2024 at 10:09:43AM -0700, Nikita Zhandarovich wrote:
>>> Hi,
>>>
>>> On 6/4/24 07:15, Jiri Kosina wrote:
>>>> On Tue, 4 Jun 2024, Kees Cook wrote:
>>>>
>>>>> This isn't the right solution. The problem is that hid_class_descriptor 
>>>>> is a flexible array but was sized as a single element fake flexible 
>>>>> array:
>>>>>
>>>>> struct hid_descriptor {
>>>>> 	   __u8  bLength;
>>>>> 	   __u8  bDescriptorType;
>>>>> 	   __le16 bcdHID;
>>>>> 	   __u8  bCountryCode;
>>>>> 	   __u8  bNumDescriptors;
>>>>>
>>>>> 	   struct hid_class_descriptor desc[1];
>>>>> } __attribute__ ((packed));
>>>>>
>>>>> This likely needs to be: 
>>>>>
>>>>> struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
>>>>>
>>>>> And then check for any sizeof() uses of the struct that might have changed.

Alan, I finally got around to preparing a revised version of the
required patch and encountered a few issues. I could use some advice in
this matter...

If we change 'struct hid_descriptor' as you suggested, which does make
sense, most occurrences of that type are easy enough to fix.

1) usbhid_parse() starts working properly if there are more than 1
descriptors, sizeof(struct hid_descriptor) may be turned into something
crude but straightforward like sizeof(struct hid_descriptor) +
sizeof(struct hid_class_descriptor).

2) 'hid_descriptor' in drivers/hid/hid-hyperv.c remains innocuous as
well as only 1 descriptor expected there. My impression is only some
small changes are needed there.

However, the issue that stumps me is the following: static struct
hid_descriptor hidg_desc in drivers/usb/gadget/function/f_hid.c relies
on a static nature of that one descriptor. hidg_desc ends up being used
elsewhere, in other static structures. Basically, using __counted_by
requires a lot of changes, as I see it, out of scope of merely closing
an UBSAN error.

Is this approach still worthy pursuing or should I look into some neater
solution?

Best regards,
Nikita

>>>>
>>>> Ah, you are of course right, not sure what I was thinking. Thanks a lot 
>>>> for catching my brainfart.
>>>>
>>>> I am dropping the patch for now; Nikita, will you please send a refreshed 
>>>> one?
>>>>
>>>
>>> Thanks for catching my mistake.
>>>
>>> I'll gladly send a revised version, hoping to do it very soon.
>>
>> I spent a little more time looking at this, and I'm not sure I
>> understand where the actual space for the descriptors comes from?
>> There's interface->extra that is being parsed, and effectively
>> hid_descriptor is being mapped into it, but it uses "sizeof(struct
>> hid_descriptor)" for the limit.
> 
> That's a lower limit, not an upper limit.  The hid_descriptor must 
> include at least one hid_class_descriptor, but it can include more.
> That's what the min_t() calculation of num_descriptors is meant to 
> figure out.
> 
>>  Is more than 1 descriptor expected to
>> work correctly?
> 
> More than one hid_class_descriptor -- yes.
> 
>>  Or is the limit being ignored? I'm a bit confused by
>> this code...
> 
> Does this explain it?
> 
> Alan Stern

