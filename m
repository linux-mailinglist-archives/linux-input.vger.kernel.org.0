Return-Path: <linux-input+bounces-14104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D52B2AE55
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 18:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F89416E965
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB54F3375AE;
	Mon, 18 Aug 2025 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1REn+abr"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5835A293;
	Mon, 18 Aug 2025 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755534995; cv=none; b=Q2RfUUmeqXQafoPIhTazgLGcJnHroIokGz8sulwQbgIpV+gm8h91FtLtihEutT0oVmiyjmgmDnnPWF3Txd5eMnqvPA7DZO2I6LGbcaLxYZ+kEIIIdnCpg29I0D5aSZKy0enSp3ljQXwPRNcUY5AW4J2gVI1SFs0ju9+qt+UlP0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755534995; c=relaxed/simple;
	bh=S2odiuAWwf4l/aBcoEJweUAHkgf1oRU7Yp4RQ7lelfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFgF9oB09Ll7sOiD6i/QK751Z0VksCyk7H18wIaIKp4S+qiX6oyCx518stt1twfG2cH9u3ynSelR78Q7NZmcM87e9NWvHtH5gFTmyricFB9ZGj/YASnoboJXmbT4lzrALGo/oDZ2yBMymmRb421ssFJkPl5/KG2qr5XTovlURGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1REn+abr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=t+B3FIwTPUwvyJsUkYQ9oCKexdILGN0DuGzoxe3tROs=; b=1REn+abrd6DnvmxauV2/cuRsYy
	LKKXI5B+UwlT5Eg5kTmYvv0ArKNbmCbhMqExXVGvkFtAE2C2Flly7+hIV+UhdFZPQ764yIgGxHk6S
	IEI8v77s7LbXbjPYK35ITpaXuHpFS57QuTiQw8Uqpr/vqtX33UnYYbcjSVUTTYGWrkiKi3KbGWZMR
	6Wlu/2sWaLJe8tC25xEtKL9ijWDXNbw1Z6o6wWC0cWzrShu+65x4Kaobuz6QFt/VpVufuThNQTRks
	EMuq2s6SWKHnHJ3+s/4biGjwygI3WTa3URFz+uhqQ8kFkbiF5wO6CnCielRQoYR6/qurBmdavBHzd
	6tCih5xA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2qW-000000082UQ-2pDq;
	Mon, 18 Aug 2025 16:36:32 +0000
Message-ID: <67156238-7915-4725-a030-d0b422a2aedc@infradead.org>
Date: Mon, 18 Aug 2025 09:36:31 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] HID: haptic: introduce hid_haptic_device
To: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
 <20250818-support-forcepads-v2-4-ca2546e319d5@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250818-support-forcepads-v2-4-ca2546e319d5@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/18/25 7:28 AM, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> Define a new structure that contains simple haptic device configuration
> as well as current state.
> Add functions that recognize auto trigger and manual trigger reports
> as well as save their addresses.
> Verify that the pressure unit is either grams or newtons.
> Mark the input device as a haptic touchpad if the unit is correct and
> the reports are found.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>  drivers/hid/Kconfig      |  11 +++++
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-haptic.c |  72 ++++++++++++++++++++++++++++++++
>  drivers/hid/hid-haptic.h | 105 +++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 189 insertions(+)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 43859fc757470caf6ad43bd5f72f119e9c36aea7..cbbe82a0a2ba257e45f77ca014fb5f08b71fc62f 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -92,6 +92,17 @@ config HID_GENERIC
>  
>  	If unsure, say Y.
>  
> +config HID_HAPTIC
> +	bool "Haptic touchpad support"

Why bool instead of tristate?

> +	default n
> +	help
> +	Support for touchpads with force sensors and haptic actuators instead of a
> +	traditional button.
> +	Adds extra parsing and FF device for the hid multitouch driver.
> +	It can be used for Elan 2703 haptic touchpad.
> +
> +	If unsure, say N.
> +

I do wish that hid/Kconfig indentation didn't vary so much from coding-style.rst.

>  menu "Special HID drivers"
>  
>  config HID_A4TECH



> diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b729f8245aa60c3d06b79b11846dccf6fcc0c08b
> --- /dev/null
> +++ b/drivers/hid/hid-haptic.h
> @@ -0,0 +1,105 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  HID Haptic support for Linux
> + *
> + *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
> + */
> +
> +/*
> + */
eh?

> +
> +
> +#include <linux/hid.h>
?

-- 
~Randy


