Return-Path: <linux-input+bounces-9533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C92A1C45F
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 17:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA993A45B8
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 16:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D623B45C18;
	Sat, 25 Jan 2025 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1hVWOaM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C618E2A;
	Sat, 25 Jan 2025 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737822934; cv=none; b=BVegWqEo39M2UCDBsSlCpQTmt+tAnXtgTazfIVe0Pj+S9iqKWPy2o55RU0UuOW+0Lr0YNqy+WB10YqIEtf2CTmH5TxD9n2G5Un0Jj0tqZjmybXtc6whEB4Fvh8spT3IF4xeA+v+KpBNbuhxj+Jt+Hh7FO9d0SEwqym9g8lJiXEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737822934; c=relaxed/simple;
	bh=p5EJWKD8ak23bp+HeUIufdIj3xy/+4mUn8kIYLXg3zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBPOrqxDzNGNPlXrGi09//9Vyk9nnsirnNsT5LLQihygP/Ir9FktmHhPaN5wxDGtIGYxm5+3Exh6R1kAuKMIStJ6MJUUi7CCSRraBiTjQaQKyEEjPKmYI5hy/AwZpjzDFJWrgoSRlYGz8pVrGKcOn/0xPedjTrnGzG5J9SogGcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1hVWOaM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso5551365a12.0;
        Sat, 25 Jan 2025 08:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737822931; x=1738427731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/FahYzXHFws6E83YCURwB1y9+tA8pq2I3CNEAgyGM0=;
        b=Q1hVWOaMYhE7zFg7mpbv+DQ7ef+Q40AhYwP3iyomjuriszVy8PfhRE6mrjG4CHie2S
         er8ddxN6Pgp04zgQ3aERg6FYQ1/miXxsg4jVDv7QTOlpU4BCEJJ26zNUQiDCtdEfBFgs
         XtoI9NjFfJa0uD0wVJU1k4gtHYQN2Jxo6IxyOiy+TwiT8FDHBjjzfBbfNfEjdd9oP6RL
         vaELV6cnXQghbWfKX8/lFN2rVCudPgaJXuxd9pOu083/VzCYW7VtQ+3X2dgMvzkv8SCK
         yayumpZLwKwo3QLbVHzFP/JjV/Jb3fRWKyZ99v8UM2/20bMkAdf6Mz/5LXNHLjDmsKC3
         aSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737822931; x=1738427731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/FahYzXHFws6E83YCURwB1y9+tA8pq2I3CNEAgyGM0=;
        b=eboz/zAVIoWolzVp8kU/RvT4lbbGy0DtnxMmhCDbuKpMSmVYOsMRE2KBGdyBVJQXwu
         kvyXEVYvbrhzLqEIiZaDueMEs7ysXC2tqWaB3KFrnRXxn5czKAoOn/i7t5ZaQPdaQ9xd
         A1A2eJ1PeygyLZ9LeM7xBLnN99O/VxszRn+H0riCcsW6mHeCZ6BtqgmKL0VdqLCJfUfe
         dgmo7o3p8V44VtNGt+qeTd9TH/tJ+6omSF7N2kkW/2+szqZw4sVa1kNjGZ6heCgkv6ws
         N2Qvb0PGZJGaXwPItSg9uIQWQItaofqezRQWsUkqbz45uO3KQO/Ds5rf6GQi4qTbMHwA
         sswA==
X-Forwarded-Encrypted: i=1; AJvYcCUBYGvS3mkMSflWgxUdk+mmFAUDTK/0dUS57X2+HBWgZfkxyGVFo0WqjYu5oLr8eRY6Ms2pj9msQWkiXvPy@vger.kernel.org, AJvYcCVojk90mcwxVyDc3vRDHoC6ArY6YJsyl/crb+ezbNRkmWOMsQsZmr+0uTIflwWJW7NvEGyusCwnCvL6JQHOtio=@vger.kernel.org, AJvYcCW+ZXf1EjnSsHPOS27wRWlvPGO4BuFADwhwjd9YvMS+ecukKDns/qD0vS2U5MoMtlFRIWeagxcdJSP3@vger.kernel.org, AJvYcCWTHWGrijxzxoiqcuZSZ2orSxyMphUiLXPWMzOVr1NZFfsUXLycnhjZvLUT40HotaAASHYZbavFgCjmz/A=@vger.kernel.org, AJvYcCWjOQew5cqBkpZFFLBgUOjghK/tIha4wyI/mCc5SqFx0yYHQlxRQDt9647hQHVzB1mTu4r0QryTgJB1aSaTsKKcm7PW2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT5IKMH6iHtuPlFWeFtnkSaJRKcI9nyQiQEFHvpgRjEznebiJr
	fKc1sNtqHPVTONjJYRlWu+A+522xk7qlF4YLh1KalH7ZAFBNRAZE
X-Gm-Gg: ASbGnctrZR+/LSKWca3Lw7cQZ8g5RDCYkJw819gAivOObW6nzMfig7UAFN9xZKul/NK
	YBCUNJWSrO+21hYlVcjJ++wkoyATGDzpGYs7jr9H/Lt6tVVzUuZ8pAdYPxCxRpaasvqXhUMS4Wr
	/WvNHsxtelDXR1dzbiwC3KAkcuZN/11WS4crLa/FksTOaarafw8RZeg1qsF+pYCRh/wfscHfa2z
	3AXWPaZYufl48rPraNdoVE0ycJWPV/M1stVwkyiHWg4Jccg6U5mUXWQ1f/3jbGUFRVfRdr9KRaO
	ThoyiE6hSag9S3o1+TKCHcik0YtlG6xeOjYBqdtEqZDBykr3ZZn9Rzq47Q==
X-Google-Smtp-Source: AGHT+IE0l33AfoHI66TN6iSEh6cHfV4bv5YbU8j+wngbD0FHIOg4JI0vW9q/O3d+Vi7EpMsol14qpg==
X-Received: by 2002:a17:906:c1b:b0:ab6:99b2:ad0c with SMTP id a640c23a62f3a-ab699b2b46fmr9989366b.50.1737822931039;
        Sat, 25 Jan 2025 08:35:31 -0800 (PST)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676116b23sm310984466b.178.2025.01.25.08.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 08:35:30 -0800 (PST)
Message-ID: <e95456ba-6407-4e75-9cb1-a27bdb806b78@gmail.com>
Date: Sat, 25 Jan 2025 17:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hid: intel-thc: fix CONFIG_HID dependency
To: Arnd Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Even Xu <even.xu@intel.com>,
 Xinpeng Sun <xinpeng.sun@intel.com>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org
References: <20250123134908.805346-1-arnd@kernel.org>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20250123134908.805346-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/25 2:48 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In drivers/hid/, most drivers depend on CONFIG_HID, while a couple of the
> drivers in subdirectories instead depend on CONFIG_HID_SUPPORT and use
> 'select HID'. With the newly added INTEL_THC_HID, this causes a build
> warning for a circular dependency:
> 
> WARNING: unmet direct dependencies detected for HID
>    Depends on [m]: HID_SUPPORT [=y] && INPUT [=m]
>    Selected by [y]:
>    - INTEL_THC_HID [=y] && HID_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y]
> 
> WARNING: unmet direct dependencies detected for INPUT_FF_MEMLESS
>    Depends on [m]: INPUT [=m]
>    Selected by [y]:
>    - HID_MICROSOFT [=y] && HID_SUPPORT [=y] && HID [=y]
>    - GREENASIA_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_GREENASIA [=y]
>    - HID_WIIMOTE [=y] && HID_SUPPORT [=y] && HID [=y] && LEDS_CLASS [=y]
>    - ZEROPLUS_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_ZEROPLUS [=y]
>    Selected by [m]:
>    - HID_ACRUX_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_ACRUX [=m]
>    - HID_EMS_FF [=m] && HID_SUPPORT [=y] && HID [=y]
>    - HID_GOOGLE_STADIA_FF [=m] && HID_SUPPORT [=y] && HID [=y]
>    - PANTHERLORD_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_PANTHERLORD [=m]
> 
> It's better to be consistent and always use 'depends on HID' for HID
> drivers. The notable exception here is USB_KBD/USB_MOUSE, which are
> alternative implementations that do not depend on the HID subsystem.
> 
> Do this by extending the "if HID" section below, which means that a few
> of the duplicate "depends on HID" and "depends on INPUT" statements
> can be removed in the process.
> 
> Fixes: 1b2d05384c29 ("HID: intel-thc-hid: Add basic THC driver skeleton")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

For hid/surface-hid:

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>


