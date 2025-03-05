Return-Path: <linux-input+bounces-10562-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F763A4FE84
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 13:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E82B4167350
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 12:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D5724397B;
	Wed,  5 Mar 2025 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="UPWebGGY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151FA214818;
	Wed,  5 Mar 2025 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741177112; cv=none; b=TCOutC049vTftPkKRg1lh43wce4SEvquwVV1ZEI695x6GlUaQrLEXsli8yhUmYiA7Yl7RfK0OTM6BS8FXQO8k6B7z/UNub9u3ALXT6PCT+3chBc0fRBOMH2rWozgQFOQ+RPV0AcUbRs+ocmxPkthXQVl5wo9EDC/7EowsSk2vaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741177112; c=relaxed/simple;
	bh=cHCNQkRlbbJCycq/FOXZKuwItO75piOrRI8svoO7IeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQpGEuM62m9hEWLSYhxs7v9XZwnyshWJ1ty6dTK4EC35Ruw9FiErjMF9Rsw9RdbgM+l3PLPCvryy2wLW3+byHaRz4iJKF5ejcRoWUMdgvzgXYsaTOHXCN3RJbPeIVjlf62KI5WcPYJ6Zirb/rBkzuWQcghAnTpQjOaafYvaxxaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=UPWebGGY; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id DBDE72FC0048;
	Wed,  5 Mar 2025 13:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741177106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nN9wsZwsCAYB5Tf9dubdxQ4GyUYF8whMsNAQF81IBK0=;
	b=UPWebGGYdQFJAiSjzIeqvXo49cpPs0X1ucZTQMCY95D8HOPxezDEvZhrRkF7lpSbwwYH7N
	Ah5MfHjQkltsLDl7a0n2JNGCLKCep1lVwV4bm9DwLWC3+oVltez0JsG6asN6AVNzfUS8VP
	SRHrzjEzQs0m6hG3lNDd4yJbmv0GrSI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <9f3e1a77-246d-4880-af99-dcbfc94a573f@tuxedocomputers.com>
Date: Wed, 5 Mar 2025 13:18:25 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Input: atkbd - map F21 key to support touchpad
 toggle keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mario.limonciello@amd.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250303190442.551961-1-wse@tuxedocomputers.com>
 <Z8f1EzASdCfa2h_7@google.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <Z8f1EzASdCfa2h_7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Am 05.03.25 um 07:54 schrieb Dmitry Torokhov:
> Hi Werner,
>
> On Mon, Mar 03, 2025 at 08:04:34PM +0100, Werner Sembach wrote:
>> In the default xkeyboard-config used by both X11 and wayland touchpad
>> toggle is assigned to F21.
> We have dedicated KEY_TOUCHPAD_TOGGLE that is being used by several
> platform drivers:
>
> dtor@dtor-ws:~/kernel/work $ git grep -l KEY_TOUCHPAD_TOGGLE --
> drivers/platform/x86/
> drivers/platform/x86/acer-wmi.c
> drivers/platform/x86/asus-laptop.c
> drivers/platform/x86/asus-nb-wmi.c
> drivers/platform/x86/eeepc-wmi.c
> drivers/platform/x86/fujitsu-laptop.c
> drivers/platform/x86/ideapad-laptop.c
> drivers/platform/x86/msi-wmi.c
> drivers/platform/x86/toshiba_acpi.c
>
> Instead of piling on F21 hacks we should be using it.
Afaik KEY_TOUCHPAD_TOGGLE is not implemented in userspace, but a patch for 
xkeboard-configs could probably be enough to change that ... have to look into it.
>
>> This patch is in preparation for i8042 filter patches to be able to remap
>> bogus scancode(-combinations), produced by notebooks uppon pressing a
>> touchpad toggle key.
> Since you already creating a vendor-specific platform driver I think it
> would be better for it to register a separate input device and have it
> emit KEY_TOUCHPAD_TOGGLE instead of involving atkbd.

Thought of that also, but since the scancode was unmapped and unused anyway I 
thought this could be a much simpler and therefore more elegant solution.

Learning question: What actually is the reason why F13-F24 are not fully mapped 
in the default config?

Best regards,

Werner

>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: <stable@vger.kernel.org>
>> ---
>>   drivers/input/keyboard/atkbd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>> index adf0f311996c9..2ba3493de88cc 100644
>> --- a/drivers/input/keyboard/atkbd.c
>> +++ b/drivers/input/keyboard/atkbd.c
>> @@ -88,7 +88,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>   	  0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
>>   	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>>   	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
>> -	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>> +	  0, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
>>   	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>>   	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>   	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>> -- 
>> 2.43.0
>>
> Thanks.
>

