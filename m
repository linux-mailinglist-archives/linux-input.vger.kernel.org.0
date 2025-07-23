Return-Path: <linux-input+bounces-13658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201B1B0E9BB
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 06:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1B9B7A6B77
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 04:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502CB211479;
	Wed, 23 Jul 2025 04:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pr+RUXbZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2479C42A8C;
	Wed, 23 Jul 2025 04:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753245656; cv=none; b=glPM3Nc2XxHeKDHft2zO64jN/39CWbVHyMDM8oD3jkMe24SMI/Iisapjhccm/WiHcvrjcpf5mlFEz18ON4Q0PArgb8BtYYvvOaHqS363/W4EfaE023B5VVQAY+imEf3dprfq1SKpsUIc23R9VNGN1Cr58vZTDuQz+LAJC08SGhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753245656; c=relaxed/simple;
	bh=bEV3xQsbqa9RtUVmL1vuV+XnEDHTVKPCd1/rOUW8jBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnd5w+MbXllSyMQ54GwW6LGjLjCoa3WpTzQ4fVQNYV9JijEWzMU/SPwe2LOJFyhjIkxzAr1U/TYdTTL0yBKoFpa7xYVwDlhXbKokE8YTd/Bm9nDWNuuNd6wrxiy0zKuqJjBc4Ird1gHFc/iBHJ+wERR0LDlrSjxk3445pkP15pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pr+RUXbZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32797C4CEE7;
	Wed, 23 Jul 2025 04:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753245655;
	bh=bEV3xQsbqa9RtUVmL1vuV+XnEDHTVKPCd1/rOUW8jBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pr+RUXbZEPa9Cgha8L4zNJ6qHrrogoJGcqB79vL9oNlQ+FsxfYuz/4HgpiI64dshF
	 wxsT62nmifJh2D9Sg1SW6aiK1UQB05zvf56I86JzhvV4MeQ5lai9S/1Cwiny74I2S0
	 OABtWaE3nalnk6VeV1BznejNWdS/AeSLMWfTss10E1lhBw04tqJeqmQxvE7FLZG4bk
	 DmwdxUz2BhdywGB7E6zayOkwMD/VErYpV6wEgBB5fM6RP07Lz097zQ9Hi6BEOMLgs6
	 BJVaQQZn7qyZbGgEF8zMoBzm+645/g8q835EHXHpC/q3pgpwCXfc1wcQrEB8xafDpE
	 AxxRZ0UOGB4gQ==
Message-ID: <1a2d0220-5862-4cba-8d0f-2eb7556c9620@kernel.org>
Date: Wed, 23 Jul 2025 06:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] HID: multitouch: fix slab out-of-bounds access in
 mt_report_fixup()
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Dmitry Savin <envelsavinds@gmail.com>
References: <20250722080003.3605-1-qasdev00@gmail.com>
 <c90e88a4-7fff-49fa-8a6f-24f3671d9390@kernel.org>
 <aH9zl18IqvL7l9pX@gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <aH9zl18IqvL7l9pX@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22. 07. 25, 13:19, Qasim Ijaz wrote:
> On Tue, Jul 22, 2025 at 11:16:15AM +0200, Jiri Slaby wrote:
>> On 22. 07. 25, 10:00, Qasim Ijaz wrote:
>>> A malicious HID device can trigger a slab out-of-bounds during
>>> mt_report_fixup() by passing in report descriptor smaller than
>>> 607 bytes. mt_report_fixup() attempts to patch byte offset 607
>>> of the descriptor with 0x25 by first checking if byte offset
>>> 607 is 0x15 however it lacks bounds checks to verify if the
>>> descriptor is big enough before conducting this check. Fix
>>> this vulnerability by ensuring the descriptor size is
>>> greater than or equal to 608 before accessing it.
>>>
>>> Below is the KASAN splat after the out of bounds access happens:
>>>
>>> [   13.671954] ==================================================================
>>> [   13.672667] BUG: KASAN: slab-out-of-bounds in mt_report_fixup+0x103/0x110
>>> [   13.673297] Read of size 1 at addr ffff888103df39df by task kworker/0:1/10
>>> [   13.673297]
>>> [   13.673297] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-00005-gec5d573d83f4-dirty #3
>>> [   13.673297] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/04
>>> [   13.673297] Call Trace:
>>> [   13.673297]  <TASK>
>>> [   13.673297]  dump_stack_lvl+0x5f/0x80
>>> [   13.673297]  print_report+0xd1/0x660
>>> [   13.673297]  kasan_report+0xe5/0x120
>>> [   13.673297]  __asan_report_load1_noabort+0x18/0x20
>>> [   13.673297]  mt_report_fixup+0x103/0x110
>>> [   13.673297]  hid_open_report+0x1ef/0x810
>>> [   13.673297]  mt_probe+0x422/0x960
>>> [   13.673297]  hid_device_probe+0x2e2/0x6f0
>>> [   13.673297]  really_probe+0x1c6/0x6b0
>>> [   13.673297]  __driver_probe_device+0x24f/0x310
>>> [   13.673297]  driver_probe_device+0x4e/0x220
>>> [   13.673297]  __device_attach_driver+0x169/0x320
>>> [   13.673297]  bus_for_each_drv+0x11d/0x1b0
>>> [   13.673297]  __device_attach+0x1b8/0x3e0
>>> [   13.673297]  device_initial_probe+0x12/0x20
>>> [   13.673297]  bus_probe_device+0x13d/0x180
>>> [   13.673297]  device_add+0xe3a/0x1670
>>> [   13.673297]  hid_add_device+0x31d/0xa40
>>> [...]
>>>
>>> Fixes: c8000deb6836 ("HID: multitouch: Add support for GT7868Q")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
>>> Reviewed-by: Dmitry Savin <envelsavinds@gmail.com>
>>> ---
>>>    drivers/hid/hid-multitouch.c | 25 ++++++++++++++++---------
>>>    1 file changed, 16 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>>> index 7ac8e16e6158..af4abe3ba410 100644
>>> --- a/drivers/hid/hid-multitouch.c
>>> +++ b/drivers/hid/hid-multitouch.c
>>> @@ -1461,18 +1461,25 @@ static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>>>    	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
>>>    	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
>>>    	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
>>> -		if (rdesc[607] == 0x15) {
>>> -			rdesc[607] = 0x25;
>>> -			dev_info(
>>> -				&hdev->dev,
>>> -				"GT7868Q report descriptor fixup is applied.\n");
>>> +		if (*size >= 608) {
>>> +			if (rdesc[607] == 0x15) {
>>> +				rdesc[607] = 0x25;
>>> +				dev_info(
>>> +					&hdev->dev,
>>> +					"GT7868Q report descriptor fixup is applied.\n");
>>> +			} else {
>>> +				dev_info(
>>> +					&hdev->dev,
>>> +					"The byte is not expected for fixing the report descriptor. \
>>> +					It's possible that the touchpad firmware is not suitable for applying the fix. \
>>> +					got: %x\n",
>>
>> This is wrong. You have all the spaces/tabs in the string now. Drop all the
>> backslashes, and open and close the string on every line.
>>
>>> +					rdesc[607]);
>>> +			}
>>
>> As this is superlong and superindented, perhaps introduce a new function for
>> these devices?
>>
>>>    		} else {
>>>    			dev_info(
>>>    				&hdev->dev,
>>> -				"The byte is not expected for fixing the report descriptor. \
>>> -It's possible that the touchpad firmware is not suitable for applying the fix. \
>>> -got: %x\n",
>>
>> This was horrid too, yeah.
>>
>>> -				rdesc[607]);
>>> +				"GT7868Q fixup: report descriptor only %u bytes, skipping\n",
>>
>> A predicate missing. Eg. "has only", or "is only".
>>
> 
> Thanks for the feedback Jiri, I took the advice on board, is something
> like this better?

Definitely.

>   static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> 				   unsigned int *size)
>   {
>            if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
>                (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
>                 hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
> 		 if (*size < 608) {
> 			 dev_info(
> 				 &hdev->dev,
> 				 "GT7868Q fixup: report descriptor is only %u bytes, skipping\n",
> 				 *size);
>                            return rdesc;
>                    }
>   
> 		 if (rdesc[607] == 0x15) {
> 			 rdesc[607] = 0x25;
> 			 dev_info(
> 				 &hdev->dev,
> 				 "GT7868Q fixup: report descriptor fixup is applied.\n");
> 		 } else {
> 			 dev_info(&hdev->dev,
> 				 "GT7868Q fixup: offset 607 is %x (expected 0x15), "
> 				 "descriptor may be malformed, skipping\n",
> 				 rdesc[607]);
> 		 }
> 	  }
>   
>   	  return rdesc;
>   }
> 
> the key changes I made are:
> 
> - Move size check to the top, this way the indentation level is decent
> - get rid of message backslashes
> - shorten the fixup failure message when rdesc[607] is not 0x15 and make
>    it a bit clearer since this message was the longest - just a minor
>    cleanup
> - added "is only %u bytes" as you suggested
> 
> if this is all good I can send v2.

I would invert the conditions. So the code would look like:

static bool goodix_needs_fixup(hdev)
{
   if (hdev->vendor != I2C_VENDOR_ID_GOODIX)
     return false;

  return hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
                  hdev->product == I2C_DEVICE_ID_GOODIX_01E9;
}

static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
  				   unsigned int *size)
{
   if (!goodix_needs_fixup(hdev))
     return rdesc;

   if (*size < 608) {
     dev_info(&hdev->dev,
              "GT7868Q fixup: report descriptor is only %u bytes, 
skipping\n",
  	     *size);
     return rdesc;
   }

   if (rdesc[607] != 0x15) {
     dev_info(&hdev->dev,
  	 "GT7868Q fixup: offset 607 is %x (expected 0x15), descriptor may be 
malformed, skipping\n",
          rdesc[607]);
     return rdesc;
   }

   rdesc[607] = 0x25;
   dev_info(&hdev->dev,
  	 "GT7868Q fixup: report descriptor fixup is applied.\n");

   return rdesc;
}

thanks,
-- 
js
suse labs

