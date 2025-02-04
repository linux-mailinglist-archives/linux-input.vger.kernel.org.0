Return-Path: <linux-input+bounces-9756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F4CA27590
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 16:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 502EB1884C66
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 15:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E33213E69;
	Tue,  4 Feb 2025 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M0xwYc4A"
X-Original-To: linux-input@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B8433DE;
	Tue,  4 Feb 2025 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682284; cv=none; b=B1nU/GXQjdFPgGMEKBIXWBZVYTPs/1a5o4HDUV5eemPsnE4uc9XrHfZFGsUDYH+CoM05YgifE/hmuonSNs8sYh+AXb0Ps4SHhdXWh+0wKKKeqZherOLuSd41AMFJXPzyCXEZ0jywCoR/OW4PfMaowyTy9V4gs5GwqP6w7UHIsDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682284; c=relaxed/simple;
	bh=F19h605MFAvaGFZKRxZNpLpKV3oES6t/2bBqSUwaF60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eBlb+0MzXfVs7UrN26hvBlDbbP9ODSMNHP1iRKs8SSixpVBBW8NbNurmwjXHFXgG4YtFFVmriQrUAp4v5HNQ1nsX5RTcBvf7WMlahMOBijSVypkXM1fU+9JhiBF0fKz51pgVCL/vKSjzFfGeS4uBKluGXQYkiu0Vy3oYwO/CjRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M0xwYc4A; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 96381404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738682270; bh=wVW8lBMIEEpdr0xbjPu2zI/effX4O8LeVMC5veSkfi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M0xwYc4AzH2N7+A+jv59tJS/lYaX4CncIBjdLa0vTEMgmmcSo40Pq4yzemaZ6IkUg
	 GHfAkMgC0ExjTkFHjHwgh1S17aJ14V/MAdze0q4JhzzQ2TlgWvbsEaa47bVQ9l20lz
	 PVy0jxTMuLb87dfi6GGc+ONahkP2zTuigCfx88XY6KQ5H4iUfC2AezbhrDZoTz7vys
	 gfRTMuK4EBgeBlfoKgGDbtz67ypWm+0yKaddHwnQSr5WrrEY4tjWt/hlTJuG4BbI7Z
	 T5D8g354eJdRwasTzRt0U0J9TQ/WAUjwhZi7ZM2tvCF54/BmegYCYILobXmNkyIVGh
	 40VhpYcuHrLvg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 96381404FA;
	Tue,  4 Feb 2025 15:17:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Guenter Roeck <linux@roeck-us.net>, Purva Yeshi
 <purvayeshi550@gmail.com>, jikos@kernel.org, bentiss@kernel.org,
 jdelvare@suse.com
Cc: skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] docs: Fix spelling and grammatical issues
In-Reply-To: <1b32dfcb-5966-495a-ad48-903650888ee9@roeck-us.net>
References: <20250204134806.28218-1-purvayeshi550@gmail.com>
 <1b32dfcb-5966-495a-ad48-903650888ee9@roeck-us.net>
Date: Tue, 04 Feb 2025 08:17:49 -0700
Message-ID: <87jza5hh7m.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Guenter Roeck <linux@roeck-us.net> writes:

> On 2/4/25 05:48, Purva Yeshi wrote:
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
>
> Is US spelling now mandated in the Linux kernel ?

No, from Documentation/doc-guide/contributing.rst:

> Both American and British English spellings are allowed within the
> kernel documentation.  There is no need to fix one by replacing it with
> the other.

Thanks,

jon

