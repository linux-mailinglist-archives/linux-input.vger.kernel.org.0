Return-Path: <linux-input+bounces-7622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4929AB196
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 17:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCE21C217C2
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 15:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518471A00C9;
	Tue, 22 Oct 2024 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bz7VkP3a"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AC85C5E;
	Tue, 22 Oct 2024 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609396; cv=none; b=b02jaEDY7DwvqrKbnZnM4ybkGeH+/V3lXMcdmQM9JpKa3P/+iacedslKaOf+rBIl46iD3tEvo/ieGkqN8AUMKK/seixdjFgdFuzhhQV9UKrA6Bexchs08+C9I2j7vMZpd1EltVr3s8H1mmPwGSMp8sJS5fG7A1yDc3RXGYd3CmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609396; c=relaxed/simple;
	bh=h4PzYrDPgx/dA0UY/qsvB8n6XSfdbkTqKIvL1amIuCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoxwHtJ/bL/9Gtb9gDCopGxKuKgeyWcWsQPCS2GCsCxlE1BKj2aBD/lj+2JRlQUxqeJbpTiPxzdu7DML5lcsIFYCAY2Y67QzngDK9t6Jww+F/UkdHcV3ExFxn0E83imsKkTjnMbYp1mjVfk2quy8mr8ezyylnGnKX54+ros0gRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bz7VkP3a; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729609372; x=1730214172; i=w_armin@gmx.de;
	bh=iyTVaz4YZToxUrhmRQO6zFXlT9G5B63Ll4lLI9zE4as=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bz7VkP3a3IQVdIp3zlcVTsy+Ja1vxLRTaOt9Fk6ClTJ1jpnjcsoNPOrvLaNhyTs+
	 A2F9oLpIlpDa/tdYxImMp4FOmwDKjL15ggnt200F0MICpkkpuU7DXkfdWxUugsPeO
	 t40x9EfYHiCLv29siKCJxN2SSaiI4rt5v2FBg7v97e23grsEZoOb8cw/w6GASQvRK
	 CNuI12DRduFj9ij+V2lj9BOpGFlDpL/2YoNNgF8MEuiOW24WhCY+xhwc48QUwH4Uk
	 +GwzZn1G1pn3clezQi86lycWLqNu91MQJnZP2CGv7GIL7es354gLIoAhFBEsQEgEt
	 NU5xfR5aLeT2t+Lc/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYPY-1ta67A18Qq-00fzBl; Tue, 22
 Oct 2024 17:02:52 +0200
Message-ID: <eb829c6c-cee0-4d65-b9d6-3df7fd1096a7@gmx.de>
Date: Tue, 22 Oct 2024 17:02:50 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>
 <ZxdyQFMRIRusMD6S@duo.ucw.cz>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZxdyQFMRIRusMD6S@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:buvMcpt7UqADbxglDvv1br4rnAVjoyNl6mJL2vRW0OAmw2ePwSV
 rf6Ll7E5y7hUFY8h+S69VdRzhAK6FJrBDkWuDKXKFhK77jdPTHe+NE9ZqHnHvQECtmI0F2z
 /KWGhRaUwogFJg9BTpU9CdYsCV78RW+7xsu2ADL9LGmqFtOwmybulAE7KneqNomdp2w37N/
 je1oxtigOzTX0vHYyiSYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WfBvh+JhZ4Q=;OXt0JGNMGHC98/Pjb7oNflPVIwA
 NVlBkaUMMzTEewvxxYGDTpVYglg1VJCqXHe9BqwG4fHQezZ1TE0NWxbUlXY5p19/Nbw7SzCHq
 b664sJ6NDXBtMF8OD/C+mHMsPFsf/KRc2zztj+KNysD30jG/W7itgAgMp8UgzD3FSf3uP2Q/+
 CIHLlkSBrskBey2D8UBbuZoD3JPSDtdOF2bv/TIoMnJe72Fb17VKbV1WLqaPlCQ18LSst4DYu
 Md0nmKdIDcCqIAizHoSPe9x9a4dy+zm7AMzqdabac8Lm/gheA+RE9QK8kXiEUnUlFeXHxane/
 YzqtWr7tyTI6gBc2k9eBCQU5KSJ5p9RI5vVaZkCHDqA8SNYsV0dp2lOBJ2/QFXNt1iRE0exPd
 ilHSLTz/CqNRWXhbh7Q7p6OKxNU1ZNV7fjz10dk0hlNdPpUFdqJb2XqFHuJmY4bZ6ZM4bAuso
 gcueega+td3x34j0oWL9AqohaDbhndfRIBdzAnURMrhJRLhcA5wBtmI0tpbu9NweZ+NHivSIs
 f7ZePNOodMo99Qf2RdXph2GzeJVGsSZllc+bBp36Ad6zIz1Z8tuEq0bcxTH0ptHqXZveXxvi7
 IKN3C+1cqTBM906T7RRnqv11FZE43F0Z+w5OM6NiKXF9tTrOhzfnrHpFWDccQglbkPevoMyry
 0mlCoiKGA1PrVUvS+kkxasRUtyuq1/jud3OSMdop8sYZdYDRRLgBEHjtG/gYdj3Hvcj0VrYNX
 /jX758Mck6PLhrlispKzHqTU2ssPSdfSzu5CcIDHC03I1ZmJO47WH1bZTvYfhk9uc2xPzOaDx
 kX8r3zY3z6MIAiJ7bZ6fyYEBmnYuLnVUSFRXRfDF7MImM=

Am 22.10.24 um 11:37 schrieb Pavel Machek:

> Hi!
>
>>> Personally I really like the idea to just emulate a HID LampArray device
>>> for this instead or rolling our own API.  I believe there need to be
>>> strong arguments to go with some alternative NIH API and I have not
>>> heard such arguments yet.

Using a virtual HID LampArray already creates two issues:

1. We have to supply device size data (length, width, height), but the driver
cannot know this.

2. It is very difficult to extend the HID LampArray interface, for example
there is no way to read the current LED color from the hardware or switch
between different modes.

A sysfs- and/or ioctl-based interface would allow us to:

1. Threat some data as optional.

2. Extend the interface later should the need arise.

Looking at the tuxedo-drivers code, it seems that the WMI interface also reports:

- preset color
- device type (touchpad, keyboard, ...)
- keyboard type (US/UK)

Making this information available through the HID LampArray protocol would be
difficult (except for the device type information).

>> Agreed on everything Hans said.
>>
>> I'll personnaly fight against any new "illumination" API as long as we
>> don't have committed users. This is the same policy the DRM folks
>>> are
> Well, and I'll personally fight against user<->kernel protocol as
> crazy as HID LampArray is.
>
> OpenRGB is not suitable hardware driver.
> 								Pavel

I agree.

The point is that we need to design a userspace API since we cannot just allow
userspace to access the raw device like with HID devices.

And since we are already forced to come up with a userspace API, then maybe it would
make sense to build a extendable userspace API or else we might end up in the exact
same situation later should another similar driver appear.

Since the HID LampArray is a hardware interface standard, we AFAIK cannot easily extend it.

Also i like to point out that OpenRGB seems to be willing to use this new "illumination" API
as long as the underlying hardware interface is properly documented so that they can implement
support for it under Windows.

I would even volunteer to write the necessary OpenRGB backend since i already contributed to
the project in the past.

Thanks,
Armin Wolf


