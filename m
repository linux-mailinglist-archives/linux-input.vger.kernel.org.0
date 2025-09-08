Return-Path: <linux-input+bounces-14540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E501CB4833B
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 06:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A37E97A3DBD
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 04:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A45F1FF1B5;
	Mon,  8 Sep 2025 04:18:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCC20B22;
	Mon,  8 Sep 2025 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757305087; cv=none; b=nQVlKLYh8srHa0nUi1+F4nFsDM+PuaeSC1QXZhBFvQkql78ZEgYU7hASuC1G+6bIuqWlGIwGUZmA5SS1q2qk+DDobmcv6jAL3iL687K8IIWqJQRyIQCInv42QOrTR1DI6FEFJoEEntVG+M+JtueJ6bGIwym1wSDpAYVLCF+rhS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757305087; c=relaxed/simple;
	bh=ou0gE7+TsdyUBbyMu7e+ekHhAilR/umQ1iDwnhJpy/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQ2nTZM+dBO1WmNqLABjQQh1AGJYwpFWbA9vu+qk5rQ9ukBfkgdibK8ptyzzr0ve9iAdvwr/me2aNFzpidYJWBoFoE4glFJe5byOZtLdyU2NBlqel3jcppaXiczUHNMv1wI+m30UP8VmoALtgpxYvqRuR1xhehO9YA2z/C3CFHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 6D4761D4966A;
	Sun,  7 Sep 2025 21:10:30 -0700 (PDT)
Message-ID: <36f58d1b-8afe-4895-bef6-59edc791ef0d@cosmicgizmosystems.com>
Date: Sun, 7 Sep 2025 21:10:28 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
To: Salvatore Bonaccorso <carnil@debian.org>,
 Zhang Heng <zhangheng@kylinos.cn>, Jiri Kosina <jkosina@suse.com>,
 Staffan Melin <staffan.melin@oscillator.se>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, 1114557@bugs.debian.org
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <aL2gYJaXoB6p_oyM@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/7/25 8:10 AM, Salvatore Bonaccorso wrote:
> Hi Zhang, hi Jiri,
> 
> In Debian Staffan Melin reported that after an update containing the
> commit 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY"),
> the input device with same idVendor and idProduct, the Jieli
> Technology USB Composite Device, does not get recognized anymore.
> 
> The full Debian report is at: https://bugs.debian.org/1114557
> 

The root of the issue here is that two devices have bootlegged the same VID:PID.

0x4c4a is not a valid VID that has been assigned according to the latest list from USBIF (vendor_ids072325_1.pdf) so conflicts like this could surface at any time.

[   10.188336] usb 3-3: device descriptor read/64, error -71
[   10.439533] usb 3-3: config 1 interface 0 altsetting 0 has 2 endpoint descriptors, different from the interface descriptor's value: 1
[   10.451534] usb 3-3: New USB device found, idVendor=4c4a, idProduct=4155, bcdDevice= 1.00
[   10.451540] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   10.451543] usb 3-3: Product: USB Composite Device
[   10.451545] usb 3-3: Manufacturer: Jieli Technology
[   10.451546] usb 3-3: SerialNumber: FFFFFFFFFFFFFFFF

Can anyone supply the Jieli descriptors, including the Report Descriptor? It clearly has problems but not bad enough to fail enumeration.

The commit 1a8953f4f774 should be reverted and SMARTLINKTECHNOLOGY should either bootleg a different PID, get a valid VID, or fix their device so a quirk is never required.

Thanks,
Terry

> The issue is not specific to the 6.12.y series and confirmed in 6.16.3
> as well.
> 
> Staffan Melin did bisect the kernels between 6.12.38 (which was still
> working) and 6.1.41 (which was not), confirming by bisection that the
> offending commit is 
> 
> 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")
> 
> #regzbot introduced: 1a8953f4f774
> #regzbot monitor: https://bugs.debian.org/1114557
> 
> So it looks that the quirk applied is unfortunately affecting
> negatively as well Staffan Melin case.
> 
> Can you have a look?
> 
> Regards,
> Salvatore
> 


