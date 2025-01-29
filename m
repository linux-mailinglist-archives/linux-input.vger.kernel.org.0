Return-Path: <linux-input+bounces-9604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E620DA2248B
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 20:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E65B13A5E2D
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 19:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E3C1DFE2C;
	Wed, 29 Jan 2025 19:26:58 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF0D2C9D;
	Wed, 29 Jan 2025 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738178818; cv=none; b=ODKC7bZq+r8rxbsPqYSx1+1YItpgk5X4/nDKFDmYo69zobgmDcD/T0+mcic0GmqkdNZu8KCk6in8U8+kxy3oGJlP3gBXfbUymBMiAvUQZclRRq1L7e4o/1jW5+h1StL2jFV0KdNVxOBdBXEPNiIhQdgFIv2aJytB8y/nyh9SYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738178818; c=relaxed/simple;
	bh=cTXIpFUJ72rQ6X+qiqfdqHAIWXIwKPIqlawAGwvmTSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M7uWEkg4uUlYQNDCRB7kd52dUxPzlXgvAkOSvcXs0+eTBGoUL7mZlxN2kTHx97MKtO35wBZKcuuTRIKk7szVqHryCXpa487M7BvWFPxGtUVrgnyiTrRQ6sR59G+HxpxvJ4DQofUZv6zpWlOZ8K69ZM2L1AAqoZhiVGN07Y1WND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id E96F62463008;
	Wed, 29 Jan 2025 11:21:25 -0800 (PST)
Message-ID: <f7963a1d-e069-4ec9-82a1-e17fd324a44f@cosmicgizmosystems.com>
Date: Wed, 29 Jan 2025 11:21:25 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
To: Kees Cook <kees@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com,
 linux-hardening@vger.kernel.org
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
 <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
 <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
 <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
 <2a38e355-af5c-4b3d-81be-0cc97376c1f5@fintech.ru>
 <202406041019.BCD0A93C@keescook>
 <d1ad84e3-7da9-4dc8-a095-b9fbe191eb56@rowland.harvard.edu>
 <807cfa6f-5863-4fe4-8294-76d5cdbc3aac@fintech.ru>
 <649f5c1c-f3a7-420d-b727-f904d58f491f@rowland.harvard.edu>
 <202501281747.9690B3B@keescook>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <202501281747.9690B3B@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sorry to join late and top post but I want to propose a direction change for this.

According to the HID 1.11 specification section 6.2.1, the first element of the desc array must be the type and size of the mandatory report descriptor. There is no need to scan through the array to look for it. So the for loop can be collapsed to:

	if (hdesc->desc[0].bDescriptorType == HID_DT_REPORT)
		rsize = le16_to_cpu(hdesc->desc[0].wDescriptorLength);

and the out-of-bounds bug goes away.

I would be happy to submit a patch if you like.

Thanks,
Terry

On 1/28/25 5:53 PM, Kees Cook wrote:
> On Tue, Jan 28, 2025 at 12:00:41PM -0500, Alan Stern wrote:
>> On Tue, Jan 28, 2025 at 05:45:21AM -0800, Nikita Zhandarovich wrote:
>>> Hello,
>>>
>>> On 6/4/24 10:45, Alan Stern wrote:
>>>> On Tue, Jun 04, 2024 at 10:21:15AM -0700, Kees Cook wrote:
>>>>> On Tue, Jun 04, 2024 at 10:09:43AM -0700, Nikita Zhandarovich wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 6/4/24 07:15, Jiri Kosina wrote:
>>>>>>> On Tue, 4 Jun 2024, Kees Cook wrote:
>>>>>>>
>>>>>>>> This isn't the right solution. The problem is that hid_class_descriptor 
>>>>>>>> is a flexible array but was sized as a single element fake flexible 
>>>>>>>> array:
>>>>>>>>
>>>>>>>> struct hid_descriptor {
>>>>>>>> 	   __u8  bLength;
>>>>>>>> 	   __u8  bDescriptorType;
>>>>>>>> 	   __le16 bcdHID;
>>>>>>>> 	   __u8  bCountryCode;
>>>>>>>> 	   __u8  bNumDescriptors;
>>>>>>>>
>>>>>>>> 	   struct hid_class_descriptor desc[1];
>>>>>>>> } __attribute__ ((packed));
>>>>>>>>
>>>>>>>> This likely needs to be: 
>>>>>>>>
>>>>>>>> struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
>>>>>>>>
>>>>>>>> And then check for any sizeof() uses of the struct that might have changed.
>>>
>>> Alan, I finally got around to preparing a revised version of the
>>> required patch and encountered a few issues. I could use some advice in
>>> this matter...
>>>
>>> If we change 'struct hid_descriptor' as you suggested,
>>
>> I didn't make that suggestion.  Kees Cook did.
>>
>>>  which does make
>>> sense, most occurrences of that type are easy enough to fix.
>>>
>>> 1) usbhid_parse() starts working properly if there are more than 1
>>> descriptors, sizeof(struct hid_descriptor) may be turned into something
>>> crude but straightforward like sizeof(struct hid_descriptor) +
>>> sizeof(struct hid_class_descriptor).
>>>
>>> 2) 'hid_descriptor' in drivers/hid/hid-hyperv.c remains innocuous as
>>> well as only 1 descriptor expected there. My impression is only some
>>> small changes are needed there.
>>>
>>> However, the issue that stumps me is the following: static struct
>>> hid_descriptor hidg_desc in drivers/usb/gadget/function/f_hid.c relies
>>> on a static nature of that one descriptor. hidg_desc ends up being used
>>> elsewhere, in other static structures. Basically, using __counted_by
>>> requires a lot of changes, as I see it, out of scope of merely closing
>>> an UBSAN error.
>>
>> The hidg_desc structure needs to contain room for a single 
>> hid_descriptor containing a single hid_class_descriptor.  I think you 
>> can define it that way by doing something like this:
>>
>> static struct hid_descriptor hidg_desc = {
>> 	.bLength			= sizeof hidg_desc,
>> 	.bDescriptorType		= HID_DT_HID,
>> 	.bcdHID				= cpu_to_le16(0x0101),
>> 	.bCountryCode			= 0x00,
>> 	.bNumDescriptors		= 0x1,
>> 	.desc				= {
>> 		{
>> 			.bDescriptorType	= 0, /* DYNAMIC */
>> 			.wDescriptorLength	= 0, /* DYNAMIC */
>> 		}
>> 	}
>> };
>>
>> Or maybe it needs to be:
>>
>> 	.desc				= { {0, 0} } /* DYNAMIC */
>>
>> I'm not sure what is the correct syntax; you'll have to figure that out.  
> 
> Either should work.
> 
>>
>> You'll have to be more careful about the definition of hidg_desc_copy in 
>> hidg_setup(), however.  You might want to define hidg_desc_copy as an 
>> alias to the start of a byte array of the right size.
> 
> For an on-stack fixed-size flex array structure, you can use:
> 
> 	DEFINE_FLEX(struct hid_descriptor, hidg_desc_copy,
> 		    desc, bNumDescriptors, 1);
> 	*hidg_desc_copy = hidg_desc;
> 
> and then adjust the "hidg_desc_copy." instances to "hidg_desc_copy->"
> 
>>
>>> Is this approach still worthy pursuing or should I look into some neater
>>> solution?
>>
>> I think you should persist with this approach.
>>
>> Alan Stern
> 


