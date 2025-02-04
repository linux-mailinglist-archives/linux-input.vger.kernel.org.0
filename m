Return-Path: <linux-input+bounces-9758-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8EAA2796B
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 19:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8AD01613F9
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 18:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CB1217654;
	Tue,  4 Feb 2025 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oEz92f3f"
X-Original-To: linux-input@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EE4216E2C;
	Tue,  4 Feb 2025 18:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692711; cv=none; b=S49nd/GvwakZ+A14LS9124QKo1sf/7U9ovlKlp2uFR0maDvoXyFY6++NMqNilRAVj0QCRiOmsM3tkidutgVgAqJ2Ex3NiWhif+/sLT1PE2sHAq2JLPjKFtVWMNEbSK9S+t2ZocXsvdnTTgjQFvAgU3ERUZFzCLZTGIYVNZFGwNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692711; c=relaxed/simple;
	bh=lZohJvru0wEAeyjk9++6ixRpPfyvCVVloXV+qroa98o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWmoSoodnm1KBNaDg0zxo9CDqDOWkaJ80HqpduOT/v0nYvbq/ScCw2yQpsySeZMP7Xu/hGVj54moVfSa/HmSPkiQGVPHiSO9pIzujpjoUcZ5fq4ZdIvdCsRPRBNe5lkjq1nAQMhOobA1mqbjypbc1vxvGKyzDfMq8cx4nQZbf74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oEz92f3f; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I1Z6vtjWwNt9llagECDSFKTWccFi8I5yGC2RHidsKD4=; b=oEz92f3fyA0Ss/NdcE97bUjLj7
	OAkmAJz6Lm0uLTBPZ6NxPswyu24HgtJT3+lIvNB1KDfju9+OckM+zZ0bvj48Di2E9Qs26rkxXs+P0
	D1ixidxJdxeV3lz+IEYoxAx246oSyeP7DBLmBywGESvSw2BL2ie+W0nUAqzkojYTVSJAk1Kr8ztjZ
	nJGbJHJPFDyLijvKrNvcYxuBYz6PwgWMMGKzyK4mCyNotBk+elhrjdmPiXkvl2fb/QU439pBevdGi
	n/eGJbtd5v6HkYkk/+RYUtcrevhJjHHwJwdjCzFwe9y+k6ICPVCcqAuCpzLCR64y/Dkrg9bxu0MMI
	ARAa7TXg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNOj-0000000GNKa-0CSH;
	Tue, 04 Feb 2025 18:11:45 +0000
Message-ID: <460e7278-440d-47a1-bbf3-7b7fbbe2f20d@infradead.org>
Date: Tue, 4 Feb 2025 10:11:40 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix spelling and grammatical issues
To: Purva Yeshi <purvayeshi550@gmail.com>, jikos@kernel.org,
 bentiss@kernel.org, corbet@lwn.net, jdelvare@suse.com, linux@roeck-us.net
Cc: skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250204134806.28218-1-purvayeshi550@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250204134806.28218-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/4/25 5:48 AM, Purva Yeshi wrote:
> Fix several spelling and grammatical errors across multiple
> documentation files.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  Documentation/hid/hiddev.rst                | 4 ++--
>  Documentation/hid/intel-ish-hid.rst         | 2 +-
>  Documentation/hid/uhid.rst                  | 2 +-
>  Documentation/hwmon/abituguru-datasheet.rst | 8 ++++----
>  Documentation/hwmon/abituguru.rst           | 2 +-
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
> index 9b82c7f896aa..073485f84793 100644
> --- a/Documentation/hid/hiddev.rst
> +++ b/Documentation/hid/hiddev.rst
> @@ -15,10 +15,10 @@ To support these disparate requirements, the Linux USB system provides
>  HID events to two separate interfaces:
>  * the input subsystem, which converts HID events into normal input
>  device interfaces (such as keyboard, mouse and joystick) and a
> -normalised event interface - see Documentation/input/input.rst
> +normalized event interface - see Documentation/input/input.rst
>  * the hiddev interface, which provides fairly raw HID events
>  
> -The data flow for a HID event produced by a device is something like
> +The data flow for an HID event produced by a device is something like

Not needed IMO, since I think ("say") the word "hid" when I see HID.

>  the following::
>  
>   usb.c ---> hid-core.c  ----> hid-input.c ----> [keyboard/mouse/joystick/event]
> diff --git a/Documentation/hid/intel-ish-hid.rst b/Documentation/hid/intel-ish-hid.rst
> index 2adc174fb576..fdabf6ec60db 100644
> --- a/Documentation/hid/intel-ish-hid.rst
> +++ b/Documentation/hid/intel-ish-hid.rst
> @@ -21,7 +21,7 @@ mainly use HID over I2C or USB. But ISH doesn't use either I2C or USB.
>  Overview
>  ========
>  
> -Using a analogy with a usbhid implementation, the ISH follows a similar model
> +Using an analogy with a usbhid implementation, the ISH follows a similar model
>  for a very high speed communication::
>  
>  	-----------------		----------------------
> diff --git a/Documentation/hid/uhid.rst b/Documentation/hid/uhid.rst
> index 2243a6b75914..2681038cd526 100644
> --- a/Documentation/hid/uhid.rst
> +++ b/Documentation/hid/uhid.rst
> @@ -106,7 +106,7 @@ UHID_INPUT2:
>  
>  UHID_GET_REPORT_REPLY:
>    If you receive a UHID_GET_REPORT request you must answer with this request.
> -  You  must copy the "id" field from the request into the answer. Set the "err"
> +  You must copy the "id" field from the request into the answer. Set the "err"

That part of the patch is OK but just not worth the effort IMHO.

>    field to 0 if no error occurred or to EIO if an I/O error occurred.
>    If "err" is 0 then you should fill the buffer of the answer with the results
>    of the GET_REPORT request and set "size" correspondingly.
> diff --git a/Documentation/hwmon/abituguru-datasheet.rst b/Documentation/hwmon/abituguru-datasheet.rst
> index 0cd61471d2a2..8c55874061d4 100644
> --- a/Documentation/hwmon/abituguru-datasheet.rst
> +++ b/Documentation/hwmon/abituguru-datasheet.rst
> @@ -6,9 +6,9 @@ First of all, what I know about uGuru is no fact based on any help, hints or
>  datasheet from Abit. The data I have got on uGuru have I assembled through
>  my weak knowledge in "backwards engineering".
>  And just for the record, you may have noticed uGuru isn't a chip developed by
> -Abit, as they claim it to be. It's really just an microprocessor (uC) created by
> +Abit, as they claim it to be. It's really just a microprocessor (uC) created by
>  Winbond (W83L950D). And no, reading the manual for this specific uC or
> -mailing  Windbond for help won't give any useful data about uGuru, as it is
> +mailing  Winbond for help won't give any useful data about uGuru, as it is

          ^^ 2 spaces there also.

>  the program inside the uC that is responding to calls.
>  
>  Olle Sandberg <ollebull@gmail.com>, 2005-05-25
> @@ -35,7 +35,7 @@ As far as known the uGuru is always placed at and using the (ISA) I/O-ports
>  ports are holding for detection. We will refer to 0xE0 as CMD (command-port)
>  and 0xE4 as DATA because Abit refers to them with these names.
>  
> -If DATA holds 0x00 or 0x08 and CMD holds 0x00 or 0xAC an uGuru could be
> +If DATA holds 0x00 or 0x08 and CMD holds 0x00 or 0xAC a uGuru could be
>  present. We have to check for two different values at data-port, because
>  after a reboot uGuru will hold 0x00 here, but if the driver is removed and
>  later on attached again data-port will hold 0x08, more about this later.
> @@ -46,7 +46,7 @@ have to test CMD for two different values. On these uGuru's DATA will initially
>  hold 0x09 and will only hold 0x08 after reading CMD first, so CMD must be read
>  first!
>  
> -To be really sure an uGuru is present a test read of one or more register
> +To be really sure a uGuru is present a test read of one or more register
>  sets should be done.
>  
>  
> diff --git a/Documentation/hwmon/abituguru.rst b/Documentation/hwmon/abituguru.rst
> index cfda60b757ce..4a5ee16b1048 100644
> --- a/Documentation/hwmon/abituguru.rst
> +++ b/Documentation/hwmon/abituguru.rst
> @@ -40,7 +40,7 @@ Supported chips:
>  
>  .. [2]  There is a separate abituguru3 driver for these motherboards,
>  	the abituguru (without the 3 !) driver will not work on these
> -	motherboards (and visa versa)!
> +	motherboards (and vice versa)!

Ack.

>  
>  Authors:
>  	- Hans de Goede <j.w.r.degoede@hhs.nl>,

-- 
~Randy


