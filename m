Return-Path: <linux-input+bounces-16831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5507CFFAF0
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 20:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EDDF32494EE
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 18:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D086339872;
	Wed,  7 Jan 2026 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ua8BjEEf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158093396E6;
	Wed,  7 Jan 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798783; cv=none; b=DF/LlZtGrjhCIGH5WF+Lqc0PJsDQkLz9aP3OXLzIYRVbL1MOa7yi9l4BA52SQOZgnhkhSdOls59c/mbVS7BgQ1D1tlqo/fPlyhjfgwKnzimsIYbGCSy2ikj3Y/887TreQwumuW2COhfujrXLbFG5i/A0tXlMiXD6/xmSPR080q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798783; c=relaxed/simple;
	bh=DMl0RaybYMeNCnaWZHnwaVdaIEToRvR2p7ttK0cevR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j7t1Pjy6CTPn7KUsLyM1334qNbDdmB+GXs7Lz3iTe0ACxjqkueMSh5UeLNT1j37Ki5VM3+DuEOI94vHcjLcPz+4fbZn1dgMlMdxxXkNRQuSDnCPvhXWYGqcVZfIRn1TPTeQmBy8YIpWDNMr0rMfJh4MSjL1GldSV0GF22KBgcyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ua8BjEEf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B161C4CEF1;
	Wed,  7 Jan 2026 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767798782;
	bh=DMl0RaybYMeNCnaWZHnwaVdaIEToRvR2p7ttK0cevR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ua8BjEEfJ5LsvPOeBDfytDH5Tq+VzcSMIcoO5jPXopAFEeZLJmdxhMghn7bQS9gWf
	 IyUjDqPQx76xsQBTRjDWJAbrs05PFqMFasykMsmBWOqU3YW3Wrc3u/Ira5n9nAnR2W
	 KTw9Y0Y1I7rD3rXYnftE3u1qRApxTq2CS3/oO6Hz0/X4NtN8epuxMp2l5Vpl8BghL3
	 NadqeZlFygxFH8PMB7XN1HBKJ6rx9pEY/u5mtETA7mvcGhFZyOxGBPHMIA2uzuLijK
	 9fdHdEyaxTXr34BiUVeJBjT0hLd3DqfllrbxaPklSfMvV7fHshbLZsPlXhR2z7lM5Y
	 bM0aS1d2QcNVA==
Message-ID: <db79a083-6810-44f8-bf5a-70469138bf82@kernel.org>
Date: Wed, 7 Jan 2026 09:13:01 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] HID: asus: Replace magic number with
 HID_UP_ASUSVENDOR constant
To: Denis Benato <benato.denis96@gmail.com>,
 "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
 <20260107111945.48018-4-sunlightlinux@gmail.com>
 <6550db38-e5a5-49f5-ac60-02d0374dd553@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <6550db38-e5a5-49f5-ac60-02d0374dd553@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 7:00 AM, Denis Benato wrote:
> 
> On 1/7/26 12:19, Ionut Nechita (Sunlight Linux) wrote:
>> From: Ionut Nechita <ionut_n2001@yahoo.com>
>>
>> Use the existing HID_UP_ASUSVENDOR constant instead of the magic number
>> 0xff310000 for better code clarity and maintainability.
>>
>> Change-Id: I65cf58cd0cd47acc39b755fa9a5fb7f2ad271046

Please strip change-id.

Otherwise LGTM and add to next version:
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> Reviewed-by: Denis Benato <benato.denis96@gmail.com>
>> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
>> ---
>>   drivers/hid/hid-asus.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>> index 472bca54642b9..eb14b9d13823b 100644
>> --- a/drivers/hid/hid-asus.c
>> +++ b/drivers/hid/hid-asus.c
>> @@ -317,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>>   static int asus_event(struct hid_device *hdev, struct hid_field *field,
>>   		      struct hid_usage *usage, __s32 value)
>>   {
>> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
>> +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
>>   	    (usage->hid & HID_USAGE) != 0x00 &&
>>   	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>>   		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",


