Return-Path: <linux-input+bounces-16833-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AFCFE97A
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E37830161D9
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE76334D3BA;
	Wed,  7 Jan 2026 15:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UG6a0vJj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E334D3B6;
	Wed,  7 Jan 2026 15:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798892; cv=none; b=V/jKcww9G7TOB0bdgp4qxBX3m5ZoGo1j/58mRDl81lwej/Y559SVMvMjQJDKkp6PorS3Kz5lnKtnLzPbLiAZ1ia7noSRlp75QR752ufQnwktasi9yfXgv/bXZ9tjUDSzBskheZfeNnvhGzUjyV+j+QLdZBLYByOinGHP5b9Ocrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798892; c=relaxed/simple;
	bh=G8QsxD9Z/jZ7//cEyWZE4Nh+mBwuwpv4mbpJuO7zn5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMmEnPjewGc1Ya0bcQP7/+cFj96t9Q1EZunJQeVlwV+OiBA7UMVjs3/2Q1hI0xMLZjZzr37E58mYMJ9g1naotHszTSY30zx01YXVH10rOiDqvmy9PAm3vfmX2GQOuL9iSdf75Kned+1pqWOHBIyFYgXFAchUUjwV71ZNYyCE3AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UG6a0vJj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE92C19424;
	Wed,  7 Jan 2026 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767798892;
	bh=G8QsxD9Z/jZ7//cEyWZE4Nh+mBwuwpv4mbpJuO7zn5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UG6a0vJjBrtmq6oRk9lc6/8VS7J1toQR7VDi0MJXlkPl4kFAkgiISe4CADSHe4NWG
	 sCx5/cd/CM5QwnVF5Ggxsj3rEGDmD4dQATVAAhX9Btgl5uzK1eq7ePDhCvOuZq7UTu
	 WMqblfrg8QpCWdyfTacVKSjrsjwTB6tEcr3Ss0G6R9nSppmCxpYT2RfDj+Su5zpgwD
	 Sf3tCNMtrKv2GZtRLod/h7nawC74RLhst0/kpYaExd5WqpmdCoNtzDWKeGFymoDMZR
	 IJqBRWgBOY6XdKOdIbkYuXz683wDy4kLLSTms2XOz4+ltqQ/CD9/BmbvG4RLIJlIPx
	 qNGE8ZTAWpi7g==
Message-ID: <58414ae4-59e4-4f3b-ba19-dd706e4ae1a9@kernel.org>
Date: Wed, 7 Jan 2026 09:14:50 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] HID: asus: Add WMI communication infrastructure
To: Denis Benato <benato.denis96@gmail.com>,
 "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
 <20260107111945.48018-8-sunlightlinux@gmail.com>
 <088286f0-3469-4b2a-87bb-56440d40fb82@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <088286f0-3469-4b2a-87bb-56440d40fb82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 7:07 AM, Denis Benato wrote:
> 
> On 1/7/26 12:19, Ionut Nechita (Sunlight Linux) wrote:
>> From: Ionut Nechita <ionut_n2001@yahoo.com>
>>
>> Add the infrastructure needed for the HID driver to communicate with
>> the asus-wmi driver:
>>
>> - Add linux/acpi.h include (in alphabetical order)
> Mentioning the addition of acpi.h seems a bit too specific
> for a commit message, but wait for hid maintainers to
> tell.
>> - Define ASUS_WMI_METHODID_NOTIF method ID in asus-wmi.h
>> - Implement asus_wmi_send_event() function to send events to asus-wmi
>>
>> This infrastructure will be used to handle special keys that require
>> WMI communication.
>>
>> Change-Id: Ic4d9b35f8b1f2b48c7c26e7259b4d05951021b58
>> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
>> ---
>>   drivers/hid/hid-asus.c                     | 24 ++++++++++++++++++++++
>>   include/linux/platform_data/x86/asus-wmi.h |  1 +
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>> index 06cd3d3b74af7..05fa35489258d 100644
>> --- a/drivers/hid/hid-asus.c
>> +++ b/drivers/hid/hid-asus.c
>> @@ -23,6 +23,7 @@
>>   /*
>>    */
>>   
>> +#include <linux/acpi.h>
>>   #include <linux/dmi.h>
>>   #include <linux/hid.h>
>>   #include <linux/module.h>
>> @@ -321,6 +322,29 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>>   	return 0;
>>   }
>>   
>> +/*
>> + * Send events to asus-wmi driver for handling special keys
>> + */
>> +static int asus_wmi_send_event(struct asus_drvdata *drvdata, u8 code)
>> +{
>> +	int err;
>> +	u32 retval;
>> +
>> +	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
>> +				       ASUS_WMI_METHODID_NOTIF, code, &retval);
> This code is based on the fact asus-wmi driver is available:
> are you sure this doesn't make the kernel compilation fail
> if such driver is not enabled?

asus-wmi.h has conditional behavior already:

#if IS_REACHABLE(CONFIG_ASUS_WMI)

>> +	if (err) {
>> +		pr_warn("Failed to notify asus-wmi: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (retval != 0) {
>> +		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int asus_event(struct hid_device *hdev, struct hid_field *field,
>>   		      struct hid_usage *usage, __s32 value)
>>   {
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 419491d4abca1..516538b5a527e 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -29,6 +29,7 @@
>>   #define ASUS_WMI_METHODID_KBFT		0x5446424B /* KeyBoard FilTer */
>>   #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
>>   #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
>> +#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method */
>>   
>>   #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
>>   


