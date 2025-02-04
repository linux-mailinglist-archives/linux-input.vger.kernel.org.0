Return-Path: <linux-input+bounces-9765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31399A27CE1
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 21:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF3F81883052
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 20:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5050521A426;
	Tue,  4 Feb 2025 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwAbA/IT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859832046B1;
	Tue,  4 Feb 2025 20:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738701644; cv=none; b=S5GAVUBrDuS184DW6rWPFTO4Y9kCng2tOD4esGxn65J14r+Il0NWnV+NdEqvcArYR5b0MupIZgmN7GSCGHIGTvSHjnJUElr+r44DLrACLQOb/QDFBhWXwk2kxFJdmmmqvYkhGvSV5mBfuN/T9/v93DXmRLYS0mxMj/9vAED0AVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738701644; c=relaxed/simple;
	bh=SRzMGSmtEpDXjUNmYyZL8fks6sLAEiToYs7/QGOqyV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBWz+6Ic9f1v4hMLd+3ZO9JsDjqFd1rsOqOee5tEFh3SLX3ON336j8pRfo+LVoYpO4pEHAAw0TUO4PTnBFcdnFAANDBe0XX8g+rFNBj4Umoj3qpufnnu1VVZVrTKNPajjryrniAmzRhJwbHgKs3ytJO1l+V9Dg/KBv5BgzFhfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwAbA/IT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215770613dbso83050665ad.2;
        Tue, 04 Feb 2025 12:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738701642; x=1739306442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+oFMBIcsMhdHIl+irdZsSx263bXUd1INL92x0rjbcI=;
        b=WwAbA/ITuF6Co3/ndOdDBHmXef/fBf3fFn1xUPr1mo1eZK2lftRbVc60Yi20tQp9EJ
         DYfu7+sfYWYOnEZTbrLs+bSqX1zpFs8/iKHSvqLNkyBZKl8pzsE+PJrqSw2xTsPPLwAo
         AAc6pQL4d27Mg6MtMD91MkhikR97CfKapVdC8p/oFdoFCaFS1hTHYcIrq9M3/IPN9MSD
         MuKxgsVPerHm8r8KiYyhaE10IR5jCDNziN6WykAIP2yPygxaWZ5oHltohsTqYEcGvrsN
         1ZTVbSnPsGVAYzff4xJ6kU9EpAejEr/bwa56sIo3R3RfTHn04C+zv1D3UO2u5CKHSGV3
         KNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738701642; x=1739306442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+oFMBIcsMhdHIl+irdZsSx263bXUd1INL92x0rjbcI=;
        b=P0JF2akW5r70h3oX0A/8UjBBjrt9fglBi4Y9BF6iSsXJSpRSaVr83jUJvsoCFlUjbi
         G/TxIkER3xJWL99CjUWOTO0+MtWGVt6bf6WTHrjOXW/r7L5eE7QeS7lsBgasVL9mjG17
         rA3ZotlZy4giJd3wPB72BZxunoD0hrt7zKA5Gw85kx0jvbU45+ScvWJgy+DPozSm+tII
         IsuNYZX1qqRHGQqYHXLCcLlrKDUP1p5CrrD6o+jtAkCvb0k2rdHlOe5sXc6QMLwLy/r/
         9hi153mucUggOWuh708O5ZZSPD8YC9NJijloX7VzHYGe/0EY/E0/H0SDetoAPfDE+AXb
         iRxg==
X-Forwarded-Encrypted: i=1; AJvYcCUhT4O0RiwnOX88uhFrXQctWOcNJXTwFc3r5FkB/uhHHouLe6edIQmtOpk14SIQAG6Ss6VG26vAhepmZTg=@vger.kernel.org, AJvYcCVh0S5xAmbqAsHMCKYZQY2hgPy4EGRBx0gaMT2mJSha8UWkpJn5eXZDPWiAWEynrpZRO2pYnfmw9613a4H6@vger.kernel.org, AJvYcCW/V6ZxyKDK5uNh2rrNE5mWJEp3DcYotVDo3HieIAGlb4jj+ZvyR7aVT6yQVLZPbJLH0oe+jREcg4TSLcM=@vger.kernel.org, AJvYcCW5A6XUN++V0QEQE8lCfVLeH2SLqUOBbucoVVsWV9bqWm60vfLf82QI56lOvto4aEnQ4a9z1rYkzlur@vger.kernel.org, AJvYcCXMjZznjsycTgaVNNFZYPC7Rm8sOKy+I3mPbVOv99YaTVjpYq8+5nduPRrHWPXMlFYQixUxKKh3FEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUixCGw9bq0XNO9pFlqbVZSMr5eMfe90vIFIfPMfScA99DT0a4
	Lxh3cgR4jyZkQO2pY46DJtGpPxJ6nBdjaprMKP2SpWEZ8XqhITiv
X-Gm-Gg: ASbGncvKusV1qdwZBzlAUzWuCA8Yghl+8BNa+MAcYDGg9PAUNSdlx/ljxK9pyR3PiDA
	7hEZgp3JZE3aDUldPHrbddUSec/q3c6jiQgF9dZvy1bP8/JTwOmj6B1ZJffgEzpPsWNh1AIV/o5
	15e5+pJk33m+AcCxl2jhqp4iMolOmIr3JqLXnZIcxJB/FUqKTZgm4MGOwRmt1sG6pM1H731TZCj
	huKeE9Iw5rXQeln6IZf3FyfXPhnSCQiaa90KqJpMLfS9EZ4riJ8/aChsTIrFuFnHVc9YMkHzert
	+P5TFah45gJvOEuhFGFSlEPhHgzw6vrMnJAB5xujWZpvNTCtUJVtCQGDQeB+dLo0oqQ=
X-Google-Smtp-Source: AGHT+IEMgnRd6zWWmWT3HAYd1ONtSs7GdV2ZgW3hwM5xuZtT2hsOXMfDalCcWZHgvFKbWOnzb2sGgg==
X-Received: by 2002:a17:902:cf05:b0:216:4e9f:4ebe with SMTP id d9443c01a7336-21f17ecbc46mr3078125ad.42.1738701641447;
        Tue, 04 Feb 2025 12:40:41 -0800 (PST)
Received: from ?IPV6:2409:40c0:1019:6a4a:444:3a1c:6970:6cad? ([2409:40c0:1019:6a4a:444:3a1c:6970:6cad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eda31sm100872475ad.109.2025.02.04.12.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:40:41 -0800 (PST)
Message-ID: <dba648c4-416d-4c36-b93c-8a52f44be313@gmail.com>
Date: Wed, 5 Feb 2025 02:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix spelling and grammatical issues
To: Randy Dunlap <rdunlap@infradead.org>, jikos@kernel.org,
 bentiss@kernel.org, corbet@lwn.net, jdelvare@suse.com, linux@roeck-us.net
Cc: skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250204134806.28218-1-purvayeshi550@gmail.com>
 <460e7278-440d-47a1-bbf3-7b7fbbe2f20d@infradead.org>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <460e7278-440d-47a1-bbf3-7b7fbbe2f20d@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/02/25 23:41, Randy Dunlap wrote:
> 
> 
> On 2/4/25 5:48 AM, Purva Yeshi wrote:
>> Fix several spelling and grammatical errors across multiple
>> documentation files.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   Documentation/hid/hiddev.rst                | 4 ++--
>>   Documentation/hid/intel-ish-hid.rst         | 2 +-
>>   Documentation/hid/uhid.rst                  | 2 +-
>>   Documentation/hwmon/abituguru-datasheet.rst | 8 ++++----
>>   Documentation/hwmon/abituguru.rst           | 2 +-
>>   5 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
>> index 9b82c7f896aa..073485f84793 100644
>> --- a/Documentation/hid/hiddev.rst
>> +++ b/Documentation/hid/hiddev.rst
>> @@ -15,10 +15,10 @@ To support these disparate requirements, the Linux USB system provides
>>   HID events to two separate interfaces:
>>   * the input subsystem, which converts HID events into normal input
>>   device interfaces (such as keyboard, mouse and joystick) and a
>> -normalised event interface - see Documentation/input/input.rst
>> +normalized event interface - see Documentation/input/input.rst
>>   * the hiddev interface, which provides fairly raw HID events
>>   
>> -The data flow for a HID event produced by a device is something like
>> +The data flow for an HID event produced by a device is something like
> 
> Not needed IMO, since I think ("say") the word "hid" when I see HID.

Thank you for your feedback! I’ll revise the patch accordingly and keep 
it unchanged in the next version.

> 
>>   the following::
>>   
>>    usb.c ---> hid-core.c  ----> hid-input.c ----> [keyboard/mouse/joystick/event]
>> diff --git a/Documentation/hid/intel-ish-hid.rst b/Documentation/hid/intel-ish-hid.rst
>> index 2adc174fb576..fdabf6ec60db 100644
>> --- a/Documentation/hid/intel-ish-hid.rst
>> +++ b/Documentation/hid/intel-ish-hid.rst
>> @@ -21,7 +21,7 @@ mainly use HID over I2C or USB. But ISH doesn't use either I2C or USB.
>>   Overview
>>   ========
>>   
>> -Using a analogy with a usbhid implementation, the ISH follows a similar model
>> +Using an analogy with a usbhid implementation, the ISH follows a similar model
>>   for a very high speed communication::
>>   
>>   	-----------------		----------------------
>> diff --git a/Documentation/hid/uhid.rst b/Documentation/hid/uhid.rst
>> index 2243a6b75914..2681038cd526 100644
>> --- a/Documentation/hid/uhid.rst
>> +++ b/Documentation/hid/uhid.rst
>> @@ -106,7 +106,7 @@ UHID_INPUT2:
>>   
>>   UHID_GET_REPORT_REPLY:
>>     If you receive a UHID_GET_REPORT request you must answer with this request.
>> -  You  must copy the "id" field from the request into the answer. Set the "err"
>> +  You must copy the "id" field from the request into the answer. Set the "err"
> 
> That part of the patch is OK but just not worth the effort IMHO.

I will revise the patch and exclude the change in uhid.rst

> 
>>     field to 0 if no error occurred or to EIO if an I/O error occurred.
>>     If "err" is 0 then you should fill the buffer of the answer with the results
>>     of the GET_REPORT request and set "size" correspondingly.
>> diff --git a/Documentation/hwmon/abituguru-datasheet.rst b/Documentation/hwmon/abituguru-datasheet.rst
>> index 0cd61471d2a2..8c55874061d4 100644
>> --- a/Documentation/hwmon/abituguru-datasheet.rst
>> +++ b/Documentation/hwmon/abituguru-datasheet.rst
>> @@ -6,9 +6,9 @@ First of all, what I know about uGuru is no fact based on any help, hints or
>>   datasheet from Abit. The data I have got on uGuru have I assembled through
>>   my weak knowledge in "backwards engineering".
>>   And just for the record, you may have noticed uGuru isn't a chip developed by
>> -Abit, as they claim it to be. It's really just an microprocessor (uC) created by
>> +Abit, as they claim it to be. It's really just a microprocessor (uC) created by
>>   Winbond (W83L950D). And no, reading the manual for this specific uC or
>> -mailing  Windbond for help won't give any useful data about uGuru, as it is
>> +mailing  Winbond for help won't give any useful data about uGuru, as it is
> 
>            ^^ 2 spaces there also.
> 
>>   the program inside the uC that is responding to calls.
>>   
>>   Olle Sandberg <ollebull@gmail.com>, 2005-05-25
>> @@ -35,7 +35,7 @@ As far as known the uGuru is always placed at and using the (ISA) I/O-ports
>>   ports are holding for detection. We will refer to 0xE0 as CMD (command-port)
>>   and 0xE4 as DATA because Abit refers to them with these names.
>>   
>> -If DATA holds 0x00 or 0x08 and CMD holds 0x00 or 0xAC an uGuru could be
>> +If DATA holds 0x00 or 0x08 and CMD holds 0x00 or 0xAC a uGuru could be
>>   present. We have to check for two different values at data-port, because
>>   after a reboot uGuru will hold 0x00 here, but if the driver is removed and
>>   later on attached again data-port will hold 0x08, more about this later.
>> @@ -46,7 +46,7 @@ have to test CMD for two different values. On these uGuru's DATA will initially
>>   hold 0x09 and will only hold 0x08 after reading CMD first, so CMD must be read
>>   first!
>>   
>> -To be really sure an uGuru is present a test read of one or more register
>> +To be really sure a uGuru is present a test read of one or more register
>>   sets should be done.
>>   
>>   
>> diff --git a/Documentation/hwmon/abituguru.rst b/Documentation/hwmon/abituguru.rst
>> index cfda60b757ce..4a5ee16b1048 100644
>> --- a/Documentation/hwmon/abituguru.rst
>> +++ b/Documentation/hwmon/abituguru.rst
>> @@ -40,7 +40,7 @@ Supported chips:
>>   
>>   .. [2]  There is a separate abituguru3 driver for these motherboards,
>>   	the abituguru (without the 3 !) driver will not work on these
>> -	motherboards (and visa versa)!
>> +	motherboards (and vice versa)!
> 
> Ack.
> 
>>   
>>   Authors:
>>   	- Hans de Goede <j.w.r.degoede@hhs.nl>,
> 


