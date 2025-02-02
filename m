Return-Path: <linux-input+bounces-9668-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B9A24D5E
	for <lists+linux-input@lfdr.de>; Sun,  2 Feb 2025 10:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2520F162BCE
	for <lists+linux-input@lfdr.de>; Sun,  2 Feb 2025 09:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41671D517E;
	Sun,  2 Feb 2025 09:55:58 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB8DF58;
	Sun,  2 Feb 2025 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738490158; cv=none; b=hBGjypVCB2ywE05AxFNMy4pGgSPNRJZ35XcdjBcqKNbUhn9OkxRyA26LrDU1y4DIVHqXSaqws0RT2XVf0tgY+W7wmzSuRn0YCy/gvzlqugdXRyR/IIe65P83PZhxHrHq5TS/AJOmJCNxvUKfdrvN3z1gPuN7dNg1S9xSYb7e7Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738490158; c=relaxed/simple;
	bh=1XCb2JMptTgcj17b+YSKVYvQ7breD1kezbibJgXhQRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NoaJ4DkGrms30woIucu2ig0CfGzdh8RB+6gqSPKkIPJSG6Fsg3leIWNG0LtTcmV/OiIWtmM1L6KP1VEpDuPRXr0K+Nvjw0RlxdZtGtTV4DAywzCl/qsRdaaO0u+ooWNsKW613ZCXG5ba5jNXGix11ZzN4j2F4i2e48TXgLveKCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sun, 2 Feb
 2025 12:55:43 +0300
Received: from [192.168.211.132] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sun, 2 Feb 2025
 12:55:43 +0300
Message-ID: <27f8c5a1-6671-4e23-862f-4c5bf888684a@fintech.ru>
Date: Sun, 2 Feb 2025 12:55:43 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
To: Kees Cook <kees@kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
	Benjamin Tissoires <bentiss@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Terry Junge <linuxhid@cosmicgizmosystems.com>, <linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>, syzbot
	<syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>, <lvc-project@linuxtesting.org>
References: <20250131151600.410242-1-n.zhandarovich@fintech.ru>
 <202501311205.DB75F95@keescook>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US
In-Reply-To: <202501311205.DB75F95@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)



On 1/31/25 23:12, Kees Cook wrote:
> On Fri, Jan 31, 2025 at 06:15:58PM +0300, Nikita Zhandarovich wrote:
>> Syzbot reports [1] a reemerging out-of-bounds bug regarding hid
>> descriptors supposedly having unpredictable bNumDescriptors values in
>> usbhid_parse().
>>
>> The issue stems from the fact that hid_class_descriptor is supposed
>> to be a flexible array, however it was sized as desc[1], using only
>> one element. Therefore, going beyond 1 element, courtesy of
>> bNumDescriptors, may lead to an error.
>>
>> Modify struct hid_descriptor by employing __counted_by macro, tying
>> together struct hid_class_descriptor desc[] and number of descriptors
>> bNumDescriptors. Also, fix places where this change affects work with
>> newly updated struct.
>>
>> [1] Syzbot report:
>>
>> UBSAN: array-index-out-of-bounds in drivers/hid/usbhid/hid-core.c:1024:7
>> index 1 is out of range for type 'struct hid_class_descriptor[1]'
>> ...
>> Workqueue: usb_hub_wq hub_event
>> Call Trace:
>>  <TASK>
>>  __dump_stack lib/dump_stack.c:88 [inline]
>>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
>>  ubsan_epilogue lib/ubsan.c:231 [inline]
>>  __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
>>  usbhid_parse+0x5a7/0xc80 drivers/hid/usbhid/hid-core.c:1024
>>  hid_add_device+0x132/0x520 drivers/hid/hid-core.c:2790
>>  usbhid_probe+0xb38/0xea0 drivers/hid/usbhid/hid-core.c:1429
>>  usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
>>  really_probe+0x2b8/0xad0 drivers/base/dd.c:656
>>  __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
>>  driver_probe_device+0x50/0x430 drivers/base/dd.c:828
>>  __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
>>  bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
>>  __device_attach+0x333/0x520 drivers/base/dd.c:1028
>>  bus_probe_device+0x189/0x260 drivers/base/bus.c:532
>>  device_add+0x8ff/0xca0 drivers/base/core.c:3720
>>  usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
>>  usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
>>  usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294
>>
>> Reported-by: syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=c52569baf0c843f35495
>> Fixes: f043bfc98c19 ("HID: usbhid: fix out-of-bounds bug")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>> ---
>> v1: https://lore.kernel.org/all/20240524120112.28076-1-n.zhandarovich@fintech.ru/
>>
>> v2: Instead of essentially forcing usbhid_parse() to only check
>> the first descriptor, modify hid_descriptor struct to anticipate
>> multiple hid_class_descriptor in desc[] by utilizing __counted_by
>> macro. This change, in turn, requires several other ones wherever
>> that struct is used. Adjust commit description accordingly.
>>
>> P.S. Since syzbot currently breaks trying to reproduce the issue,
>> with or without this patch, I only managed to test it locally with
>> syz repros. Would greatly appreciate other people's effort to test
>> it as well.
>>
>> P.P.S. Terry Junge <linuxhid@cosmicgizmosystems.com> suggested a
>> different approach to this issue, see:
>> Link: https://lore.kernel.org/all/f7963a1d-e069-4ec9-82a1-e17fd324a44f@cosmicgizmosystems.com/
>>
>>  drivers/hid/usbhid/hid-core.c       |  2 +-
>>  drivers/usb/gadget/function/f_fs.c  |  3 ++-
>>  drivers/usb/gadget/function/f_hid.c | 22 ++++++++++++++--------
>>  include/linux/hid.h                 |  2 +-
>>  4 files changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
>> index a6eb6fe6130d..eb4807785d6d 100644
>> --- a/drivers/hid/usbhid/hid-core.c
>> +++ b/drivers/hid/usbhid/hid-core.c
>> @@ -1010,7 +1010,7 @@ static int usbhid_parse(struct hid_device *hid)
>>  		return -ENODEV;
>>  	}
>>  
>> -	if (hdesc->bLength < sizeof(struct hid_descriptor)) {
>> +	if (hdesc->bLength < struct_size(hdesc, desc, hdesc->bNumDescriptors)) {
>>  		dbg_hid("hid descriptor is too short\n");
>>  		return -EINVAL;
>>  	}
> 
> I don't think you want this hunk in the patch. The existing logic will
> correctly adapt num_descriptors to a size that fits within
> hdesc->bLength. In theory, the above change could break a weird but
> working device that reported too high bNumDescriptors but still worked
> with what num_descriptors walks.
> 

Thank you for mentioning this and you are right about possibly breaking
a working device.

However, sizeof(struct hid_descriptor) doesn't count flex array sizes.
So, leaving this check as is will miss cases when hdesc->bLength >=
sizeof(struct hid_descriptor) but short enough to have a desc[0]
element. Maybe doing struct_size(hdesc, desc, 1) is better? Then we
make sure that at least one mandatory hid_class_desriptor is there.

>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 2dea9e42a0f8..a4b6d7cbf56d 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -2550,7 +2550,8 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
>>  	case USB_TYPE_CLASS | 0x01:
>>  		if (*current_class == USB_INTERFACE_CLASS_HID) {
>>  			pr_vdebug("hid descriptor\n");
>> -			if (length != sizeof(struct hid_descriptor))
>> +			if (length < sizeof(struct hid_descriptor) +
>> +				     sizeof(struct hid_class_descriptor))
>>  				goto inv_length;
>>  			break;
>>  		} else if (*current_class == USB_INTERFACE_CLASS_CCID) {
> 
> Same here, I think? This isn't needed unless I'm misunderstanding
> something about the fix.

Once again, sizeof(struct hid_descriptor) will not count struct
hid_class_descriptor desc[] __counted_by(...) so even correct and
predictable lengths will fail the check. We need to test length against
hid_descriptor with at least one element of its flex array.

I would prefer struct_size() here as well but it's not optimal in this
case.
> 
>> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
>> index 740311c4fa24..ec8c2e2d6812 100644
>> --- a/drivers/usb/gadget/function/f_hid.c
>> +++ b/drivers/usb/gadget/function/f_hid.c
>> @@ -139,13 +139,17 @@ static struct usb_interface_descriptor hidg_interface_desc = {
>>  };
>>  
>>  static struct hid_descriptor hidg_desc = {
>> -	.bLength			= sizeof hidg_desc,
>> +	.bLength			= struct_size(&hidg_desc, desc, 1),
>>  	.bDescriptorType		= HID_DT_HID,
>>  	.bcdHID				= cpu_to_le16(0x0101),
>>  	.bCountryCode			= 0x00,
>>  	.bNumDescriptors		= 0x1,
>> -	/*.desc[0].bDescriptorType	= DYNAMIC */
>> -	/*.desc[0].wDescriptorLenght	= DYNAMIC */
>> +	.desc				= {
>> +		{
>> +			.bDescriptorType	= 0, /* DYNAMIC */
>> +			.wDescriptorLength	= 0, /* DYNAMIC */
>> +		}
>> +	}
>>  };
>>  
>>  /* Super-Speed Support */
>> @@ -936,16 +940,18 @@ static int hidg_setup(struct usb_function *f,
>>  		switch (value >> 8) {
>>  		case HID_DT_HID:
>>  		{
>> -			struct hid_descriptor hidg_desc_copy = hidg_desc;
>> +			DEFINE_FLEX(struct hid_descriptor, hidg_desc_copy,
>> +				desc, bNumDescriptors, 1);
>> +			*hidg_desc_copy = hidg_desc;
>>  
>>  			VDBG(cdev, "USB_REQ_GET_DESCRIPTOR: HID\n");
>> -			hidg_desc_copy.desc[0].bDescriptorType = HID_DT_REPORT;
>> -			hidg_desc_copy.desc[0].wDescriptorLength =
>> +			hidg_desc_copy->desc[0].bDescriptorType = HID_DT_REPORT;
>> +			hidg_desc_copy->desc[0].wDescriptorLength =
>>  				cpu_to_le16(hidg->report_desc_length);
>>  
>>  			length = min_t(unsigned short, length,
>> -						   hidg_desc_copy.bLength);
>> -			memcpy(req->buf, &hidg_desc_copy, length);
>> +						   hidg_desc_copy->bLength);
>> +			memcpy(req->buf, hidg_desc_copy, length);
>>  			goto respond;
>>  			break;
>>  		}
>> diff --git a/include/linux/hid.h b/include/linux/hid.h
>> index cdc0dc13c87f..85a58ae2c4a0 100644
>> --- a/include/linux/hid.h
>> +++ b/include/linux/hid.h
>> @@ -739,7 +739,7 @@ struct hid_descriptor {
>>  	__u8  bCountryCode;
>>  	__u8  bNumDescriptors;
>>  
>> -	struct hid_class_descriptor desc[1];
>> +	struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
>>  } __attribute__ ((packed));
>>  
>>  #define HID_DEVICE(b, g, ven, prod)					\
> 
> Otherwise, this looks correct to me.
> 

Regards,
Nikita


