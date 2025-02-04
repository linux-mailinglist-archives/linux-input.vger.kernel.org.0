Return-Path: <linux-input+bounces-9764-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9FA27CD3
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 21:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDE3C3A2A5D
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 20:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C800219E8D;
	Tue,  4 Feb 2025 20:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUzglQYo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87457203710;
	Tue,  4 Feb 2025 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738701151; cv=none; b=mO920sVNhvy1PGwdz8dbh3EPjjX4rn3RGtu7dxEHS6IldE+vs8T/YRzegtCjFx9gRRs0oeqzVWPEI0sjc3rOpI8hrlvmZpND/sZNcWU5anur8M8eY5h9YN3YAUOKd22uQ4FaCwTk8J7uVf90PCaKwz/05qqgAqZGy7jX2wJXFy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738701151; c=relaxed/simple;
	bh=vTfPONvK7ayFJ8eU+XqhCBrsr4nb8pYIh817466m6BU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlcp/MKSWwLp052fcFWKbtRqT967Ep98Tv1ui3CaZiWaTj1lDc1TbrLK3ab/p2/b+O/pQGy20UoibPtwPFKCyL9T1eCPbAtab9GEgr+APCCQvQ2YVOCuX4Js1p9YG+iV5ll4mbOr89FyLukvkjhd67l4IyPb7GPJkUHIfUkcfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUzglQYo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f16af1f71so1767585ad.3;
        Tue, 04 Feb 2025 12:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738701149; x=1739305949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2j8Dx8Ru7MD5MBVXKqE84EDUBcHnRqlEmlwGEtbluM=;
        b=IUzglQYo19L8II8JvXlH+57xsrpk0dVnCKJSorqMCVA1PeODKg/46eb5c744+6nhA1
         J5gxRxTZwOJwE4s0juRQYD61c7Vl8hrgg3CNzgYq67cvOd9954xasljdTRgcXE7sZ48/
         mjwTIticEpvyGG1IYltEcSTH4vHqBjIrfd80jLU5V9SutI2UtL2FBssVxoXW6ka+LMe1
         6E34hRDaCSXv7c5M4CM1F9/Sfo3/Ks+N4ZWxAgGULaBJfd2M/08NYNy86vRc+8J7udrN
         VjxM4m9inGM81/Un9whLw9KV43PITFyYSi5uvSHJpMYDU4laww1jDFzacTb9ERvQIgtY
         zKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738701149; x=1739305949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2j8Dx8Ru7MD5MBVXKqE84EDUBcHnRqlEmlwGEtbluM=;
        b=d3CY0Nn4thzzYbZf96RbGLq3XJmEjocSMLkDs10bmH9K52pByBcVeffM1XjhtasUcc
         FzXga9WfeZqaZPsW7ExIcZk6ouGbpG09M1fYNdLO9+rC763v0r1BNvbgPWZL3Z7pSE5F
         sv0wCy9u+f+KNlDilmJKWwVAgvmmM2IUpm0vMHlzFvw2s0gb1qb6YhgzmpjB8mgdauTo
         qSO3sZOiolUjDz/eQcdQcO/N1w6n5G4PJQRODL5Je7tn8pPL6ktzaqZgmgY1jGGa4WR0
         oN0Ll+5amjbl9Qq0WV5o/sNgWFBv7GkZgP9cJjWbhDDKTCG1PUnXbwGHB36pJgh3n28J
         Ivnw==
X-Forwarded-Encrypted: i=1; AJvYcCU7VN/J6F5v9q6dFMd8iLT5IqVDROG1LOnF/TiBLX01ScVCa068euQs81m0gDWucHeu8G7aH2CwBn3O9Hho@vger.kernel.org, AJvYcCVPAG6Q1JNERHpeq0XdP05G58lL519rdZ24jOnkf5lZKdvG82d+b5ts+CiJbMgdA9ihYtHtQwu537jwz3g=@vger.kernel.org, AJvYcCVUx8rRVru8r2AzGgkBRzaAJOZRa9xRGJES1xoBZ1aBAXzO+bNd8AcYwOLd4dNL8VpFyvZZwAc1ze016oM=@vger.kernel.org, AJvYcCW/gR760sYDZnd+/ttgD3hHfomRd5MFSjcT4RGOLgIU7C64hNTs2QVDmfRSoaVMvyUjNEIOUccK0q7k@vger.kernel.org, AJvYcCX0uYtcQybKDfGEuqTEcKilsbaHfWtXIsmuwPR/10NXF8k7jE5p6wpctwxZSp+ekPwXLzgW28k2P+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws5aQsWUB+CIDc+vJQVNhlVCaCNsWEHbLO71j09A6OyMLhc0mN
	bL1FupUttaMe1Wr1FTskWZfIWMk/SN+myJ3/qYUWXpY0fL3RLcDe
X-Gm-Gg: ASbGnctYCrollEIaIH83J3+U7LXGwKsW/885+CwfiQd9FIQGfJmvvf5s4pxByjKkQ+w
	l4TidqzsiP5c3P9uit6y7JWWVhNo6a/9B7W67g9kzz4d7I7qU4pKsrBQEAgEH5iJoCES6ZqHmYE
	iTgaHC8D07BbFqfBVS99WLzUUrYJiF9O+0Oeoj7AmAjQtGNuSnEY76ZZEIhasQG4lpIijhIZphO
	jR/hkfZnP2RFJy4djYY/HYt2rU6TJhK5qKpB+TBMBVLZtBY27lOy4bvKUi/EyhSZ8cWE4CamMZG
	fK7oio0SUBbXZqtGhZYFLx/Rhjsjyp56FnjjIeW9x0lOra2KW2CBQ1cJpns++KcxOOU=
X-Google-Smtp-Source: AGHT+IEjiDX0kn5b2vYy1w8dCcDsaqDLbkVuQUL5oIYnUP0j0/oJTX+mkT1rkJXjIaaXR4Hww1g28g==
X-Received: by 2002:a05:6a21:8dc6:b0:1ea:e7e6:f94b with SMTP id adf61e73a8af0-1ede88b23aamr277303637.34.1738701148723;
        Tue, 04 Feb 2025 12:32:28 -0800 (PST)
Received: from ?IPV6:2409:40c0:1019:6a4a:444:3a1c:6970:6cad? ([2409:40c0:1019:6a4a:444:3a1c:6970:6cad])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebddbb069sm10452223a12.14.2025.02.04.12.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:32:28 -0800 (PST)
Message-ID: <d2271471-2601-41a2-aea3-b7de0ed78342@gmail.com>
Date: Wed, 5 Feb 2025 02:02:21 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix spelling and grammatical issues
To: Jonathan Corbet <corbet@lwn.net>, Guenter Roeck <linux@roeck-us.net>,
 jikos@kernel.org, bentiss@kernel.org, jdelvare@suse.com
Cc: skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250204134806.28218-1-purvayeshi550@gmail.com>
 <1b32dfcb-5966-495a-ad48-903650888ee9@roeck-us.net>
 <87jza5hh7m.fsf@trenco.lwn.net>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <87jza5hh7m.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/25 20:47, Jonathan Corbet wrote:
> Guenter Roeck <linux@roeck-us.net> writes:
> 
>> On 2/4/25 05:48, Purva Yeshi wrote:
>>> Fix several spelling and grammatical errors across multiple
>>> documentation files.
>>>
>>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>>> ---
>>>    Documentation/hid/hiddev.rst                | 4 ++--
>>>    Documentation/hid/intel-ish-hid.rst         | 2 +-
>>>    Documentation/hid/uhid.rst                  | 2 +-
>>>    Documentation/hwmon/abituguru-datasheet.rst | 8 ++++----
>>>    Documentation/hwmon/abituguru.rst           | 2 +-
>>>    5 files changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
>>> index 9b82c7f896aa..073485f84793 100644
>>> --- a/Documentation/hid/hiddev.rst
>>> +++ b/Documentation/hid/hiddev.rst
>>> @@ -15,10 +15,10 @@ To support these disparate requirements, the Linux USB system provides
>>>    HID events to two separate interfaces:
>>>    * the input subsystem, which converts HID events into normal input
>>>    device interfaces (such as keyboard, mouse and joystick) and a
>>> -normalised event interface - see Documentation/input/input.rst
>>> +normalized event interface - see Documentation/input/input.rst
>>
>> Is US spelling now mandated in the Linux kernel ?
> 
> No, from Documentation/doc-guide/contributing.rst:

Thank you for the clarification. I'll leave the spelling changes as they 
are.

> 
>> Both American and British English spellings are allowed within the
>> kernel documentation.  There is no need to fix one by replacing it with
>> the other.
> 
> Thanks,
> 
> jon


