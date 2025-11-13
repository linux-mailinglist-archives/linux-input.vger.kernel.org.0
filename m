Return-Path: <linux-input+bounces-16105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2B1C5949A
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 18:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B7514F9D33
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88863587A9;
	Thu, 13 Nov 2025 17:45:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DB6350A04;
	Thu, 13 Nov 2025 17:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763055919; cv=none; b=EKyWEcqukRZ1k4v6B8tWOuJYRhzxhswRAIoZIfOWid+IvUh1z6hG7vJH9MRMNxTR2Gnp51bCoWRcD+895gl3vce4Efrzqma1xqzdVIdkLy/cDEAfBrAphr8Pn0aKUWLqJCdXmH2xy0oQ1AlihPEFdMopIgbm5roaaDL3o8AfmRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763055919; c=relaxed/simple;
	bh=+1WwX0s7K2vuXYrIdfOrJCiJLFxASeJtUL1P7cKEVRI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KCpkBrwO1AGti97r911qDU59YCzTCp/yPXYZ8zqGB6JE9g+qFfKZ2hC3jJzAH5IiLofKOa923NQtLK/Evl3LvrQD1QEK4GN3CbVr8eA8WgIZXQpE3pb81cGiq21OkM8dss7C9iUobPL7ySpaAWk02MjV2i1WsWxwuKAuT/0UD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 8967724DB66F;
	Thu, 13 Nov 2025 09:45:09 -0800 (PST)
Message-ID: <cfbc29ee-5da4-4ff0-840a-e6e5722eb544@cosmicgizmosystems.com>
Date: Thu, 13 Nov 2025 09:45:08 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier
 QR30 (2d99:a101).
To: The-Luga <lugathe2@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: michal.pecio@gmail.com, bentiss@kernel.org, dmitry.torokhov@gmail.com,
 jikos@kernel.org, linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
 <20251112015356.1919586-1-lugathe2@gmail.com>
 <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>
 <58edd03a-a7a7-40af-8228-18004dc6e737@rowland.harvard.edu>
 <CALvgqEBVQsoQ3wewP+37u5Ms398O5gC8YaELm0UJdZSDBHzPPw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALvgqEBVQsoQ3wewP+37u5Ms398O5gC8YaELm0UJdZSDBHzPPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/2025 7:45 AM, The-Luga wrote:

>> Vendor ID 0x2d99 belongs to Edifier International Limited not Jieli
>> Can you change to USB_VENDOR_ID_EDIFIER instead and move to the
>> alphabetically correct location?
> 
> Could you kindly tell me where this info is?
> Searching the internet I only found this website with this info:
> https://the-sz.com/products/usbid/index.php?v=0x2D99

The official list of valid USB Vendor IDs can be found here:

https://www.usb.org/developers

currently:

https://www.usb.org/sites/default/files/vendor_ids10282025b_1.pdf

> 
> I just checked the vendor from `lsusb`, and I was hesitant whether to
> write Jieli or Edifier.
> I also decided to write QR30 instead of Hal0. Should I add a comment
> mentioning Jieli as I did with the device?

The product was made using the Jieli SDK which supports Jieli chips. The 
manufacturers string "Jieli Technology" is the default value in the SDK 
and should have been changed by Edifier.

No need to mention Jieli at all. The bottom line is that the product is 
not 100% USB compliant and does not support suspend mode reliably so 
requires the HID_QUIRK_ALWAYS_POLL quirk.

Regards,
Terry

