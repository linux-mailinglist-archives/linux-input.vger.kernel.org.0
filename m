Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902006D8D95
	for <lists+linux-input@lfdr.de>; Thu,  6 Apr 2023 04:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234707AbjDFCku (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Apr 2023 22:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234853AbjDFCkt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Apr 2023 22:40:49 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BB58A42
        for <linux-input@vger.kernel.org>; Wed,  5 Apr 2023 19:40:34 -0700 (PDT)
Received: from [192.168.0.22] (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 6AC8CA028;
        Wed,  5 Apr 2023 19:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1680748833; bh=s+bbXjZIrEEut75wHSf1pB1XJv/VztAZAaJiufe4t+M=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=igku181S1D7Pnu7XEfvQzFDlOHWoWfl4M5m3ln/q1SW0LiC1xB1m3OY/Vf8HKDTXg
         u7470/DjuQWm3quPw77hDvDb0tkhAmo6MoSnTz8SMCOVADNWXWe/BKe2tgMNUFO62M
         EWn55jw0ujQiOsvbMCOeHTKnOpQHsX9ZnSMqgf5zGMHYt49cVc8ekPSPirFlJUN/Cy
         amPUAN0a4impLAc/LmhhrZNqbAdn2o86g0Zr4vaySfye74pBfEDTL25vUkEeH3fiAl
         VFWxy/wVGQZGcC9l+ezUin+bcE7bW0jn909bpa2TrDa9YkwBAyumgBgHOT2j/yDug7
         d6FED2ql/bNMw==
Message-ID: <a02e0ba4-4ea7-40a0-1d33-8f87f2fe8f2f@endrift.com>
Date:   Wed, 5 Apr 2023 19:40:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] Input: xpad - fix PowerA EnWired Controller guide
 button
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
References: <20230330024752.2405603-1-vi@endrift.com>
 <20230330024752.2405603-3-vi@endrift.com> <ZCilF4RM5LY85aHP@google.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <ZCilF4RM5LY85aHP@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 4/1/23 14:41, Dmitry Torokhov wrote:
> On Wed, Mar 29, 2023 at 07:47:52PM -0700, Vicki Pfau wrote:
>> This commit explicitly disables the audio interface the same way the official
>> driver does. This is needed for some controllers, such as the PowerA Enhanced
>> Wired Controller for Series X|S (0x20d6:0x200e) to report the guide button.
>>
>> Signed-off-by: Vicki Pfau <vi@endrift.com>
>> ---
>>  drivers/input/joystick/xpad.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
>> index 698224e1948f..c31fc4e9b310 100644
>> --- a/drivers/input/joystick/xpad.c
>> +++ b/drivers/input/joystick/xpad.c
>> @@ -1396,6 +1396,14 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
>>  	unsigned long flags;
>>  	int retval;
>>  
>> +	/* Explicitly disable the audio interface. This is needed for some
>> +	 * controllers, such as the PowerA Enhanced Wired Controller
>> +	 * for Series X|S (0x20d6:0x200e) to report the guide button */
>> +	retval = usb_set_interface(xpad->udev, GIP_WIRED_INTF_AUDIO, 0);
>> +	if (retval)
>> +		dev_warn(&xpad->dev->dev,
>> +			 "unable to disable audio interface: %d\n", retval);
> 
> I would prefer if we first validated that the interface is in fact
> present. Can we do something like:
> 
> 	if (usb_ifnum_to_if(xpad->udev, GIP_WIRED_INTF_AUDIO)) {
> 		error = usb_set_interface(xpad->udev, GIP_WIRED_INTF_AUDIO, 0);
> 		if (error)
> 			...
> 	}
> 

Yup, that makes sense. Wasn't sure what the cleanest way to do that was, though I'm unconvinced that the first party driver would work without this interface. It can't hurt to add the check.

Should I resubmit both patches in the series, or just this one?

>> +
>>  	spin_lock_irqsave(&xpad->odata_lock, flags);
>>  
>>  	/*
>> -- 
>> 2.40.0
>>
> 
> Thanks.
> 

Thanks,
Vicki
