Return-Path: <linux-input+bounces-7596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999049A9127
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 22:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9DD51C22386
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 20:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BD71FCF5B;
	Mon, 21 Oct 2024 20:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HBnoie6+"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ACF1C8FDB;
	Mon, 21 Oct 2024 20:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542440; cv=none; b=mNBavwrokGaxgAoSVvXEg9eFKErf7Gd4cWEVOAlNJp3c5eQU+AMNF1B0bjyG5zYq7WKPGUs6i19WHAXrkFMHWyHEqHTUHaYDuMjkO0fM3wNATXpwBqVppw6BxtnUmNvpuxJxQPv8tm0DkgEVcG4a08/kxDhz9hl2ypIYfoh7cN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542440; c=relaxed/simple;
	bh=3g3ulzUEILj6Ab6SKjBWHtGnUwVU/KgosIKltudjBYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjZvV0b/rNh+AWjEpcA90arMcLEZxefOs3AD7PJLnP4o+uIKAPEcaX7gXy4FxG04/okvBuIJEccVNfR1N3QCsXoM0p/KkTsMInlNRCTnRnHL1uvPPgsqeOYLXb97B05nU9mppgDNr79nZqTUEmo5kIqjT7tnHtQpPi59QZIkKNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HBnoie6+; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729542416; x=1730147216; i=w_armin@gmx.de;
	bh=e9QbNuLAuXgzKvnSaHT2dAq3xYZ/W2rd0vmM7cmicmQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HBnoie6+Eni1+RAqebH7JvbR6KXTStsKsuLhcPhUNN/HBs5M4bMHPQ3O7Yy4f8aW
	 2OyTuvfMadMULQBvI8s0b68cbFcL3um2IOhiSRpDA+7KeNJ/V44slXuQsTIltiLr5
	 y9G+lHvF7TM1E+sADntfaz7vcFOsOCTFxpGR2Urh7j5OBOD6nX1WC/FlUadBFKAk9
	 BJyZugpNBkj0nSHG/hikbExCkoa2dbfeWXuVF36W3HQZKyCB9GtBQPohuBuac7UuZ
	 h8yqGTjU5ijpRIZClm89OJafN+Ze8hIlJcHc8Rr/5P0vT9r6VGhMAIAJAKlXruGcP
	 bAH/TDavJlSK0KAHiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1tokLq117a-00w12Z; Mon, 21
 Oct 2024 22:26:56 +0200
Message-ID: <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
Date: Mon, 21 Oct 2024 22:26:54 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 jelle@vdwaa.nl, jikos@kernel.org, lee@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
 <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
 <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZwlDpCPhieF3tezX@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3UMk7ZMRiG7KwkFqWRpMUf9HSa5Kej0YUjCRMm78uvohH0r57Db
 NagZcni7LAn/QyXuhwv5M3Mj7tDVTx0RNnEkYnM7QOeBRscIkVx4Y7n0AjicHLNAuRDYi45
 qrbUQd6FzewuS90QL4lsQBE7ApYx4+uzWisL9H8/gokYmwXheZ3PYed9n0raiMHbXj4S3aU
 q/QhfvfTgh9FFsvxOIvZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YkNcCmVhFIg=;TW3OJSZTcOHLE/RkcCQciQ7OVw9
 CFIxdo5Aoe6bYbK5ID+klKg7e5S6efm7oiCgvmUItL835L5FAD1ncJWdBVAEvwxnKYxA6aj6r
 hHfKJhwr02GhQ/XJ4HNOA+Bf+DD5Lvs8zZU6NYNEJXwNR99zA/QpcT0cLfM4luIWaHvvNhbL5
 Qj34WGp/1Ajq0SotkyOyfYu5X0KRSrkooA5ySIppPj6ghSmESgsml0ge1cf828seXOhWzgwfP
 LTUDb7+TlttV5+PQlRF8llDbg2z+sNHYI8iFXmQZe7H7iEkpAGcF6c6EnwzF08Cmhm0PuVlZ+
 8r/yrBXlKQcc6djkb9vzXC7v4WSWdrGi5PL1JSWpi2+9cJU6WkLjsWZ9v4hU+HIuY0RnkFCov
 JjTpYL/2RlRhack6g8VE1CjJxO5TrHVlUXIX2SpknhxsVVazTBk2g+TQwPDnjUtCQb5dye+LC
 K9kDF7OXxe+hkqv2OvLsJy8WmhAXBkIwW66ah+Rm3WwaWhw9RQ5NRlXi6CLj7M6gkgX1M4Snh
 VaY0BvQVh33Q44U79yLehRyb3rkcJaeQP8x4Uby4+q9Jg+pb+Uamda/edV8eqN583lgawOdGK
 m2pozh0n9hwLla2Ip83zigs/DGdBSVUVb0P2ac5MKTHecUMh2wwZaiRVkWVuGzy7iZyWjGtIi
 Ct2EooV5PGaoXBlWFVtPzY9Xlp26h7/G5pLkPBmpxAZ3UuDF1ubVNaixfToBxOexSCbzWlJ+n
 6OieTfsdUkhAWvfmbGEQZjEtsNX9KC+wElfjei3HwgE+Ifrq4deEy3F6Sfq07SGHy0NeqhDDw
 7AkxX6ZRe8wg96COrLhplymqFwLN0Unw2M+teLY76xe3s=

Am 11.10.24 um 17:26 schrieb Pavel Machek:

> Hi!
>
>>> 1.
>>> https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/
>>> -> Should be no problem? Because this is not generally exposing wmi
>>> calls, just mapping two explicitly with sanitized input (whitelisting
>>> basically).
>> It would be OK to expose a selected set of WMI calls to userspace and sanitizing the input of protect potentially buggy firmware from userspace.
>>
> I don't believe this is good idea. Passthrough interfaces where
> userland talks directly to hardware are very tricky.
>
>> Regarding the basic idea of having a virtual HID interface: i would prefer to create a illumination subsystem instead, but i have to agree that we should be doing this
>> only after enough drivers are inside the kernel, so we can design a
>> suitable interface for them. For now, creating a virtual HID
>> interface seems to be good enough.
> I have an RGB keyboard, and would like to get it supported. I already
> have kernel driver for LEDs (which breaks input functionality). I'd
> like to cooperate on "illumination" subsystem.
>
> Best regards,
> 								Pavel

Sorry for taking a bit long to respond.

This "illumination" subsystem would (from my perspective) act like some sort of LED subsystem
for devices with a high count of LEDs, like some RGB keyboards.

This would allow us too:
- provide an abstract interface for userspace applications like OpenRGB
- provide an generic LED subsystem emulation on top of the illumination device (optional)
- support future RGB controllers in a generic way

Advanced features like RGB effects, etc can be added later should the need arise.

I would suggest that we model it after the HID LampArray interface:

- interface for querying:
  - number of LEDs
  - supported colors, etc of those LEDs
  - position of those LEDs if available
  - kind (keyboard, ...)
  - latency, etc
- interface for setting multiple LEDs at once
- interface for setting a range of LEDs at once
- interface for getting the current LED colors

Since sysfs has a "one value per file" rule, i suggest that we use a chardev interface
for querying per-LED data and for setting/getting LED colors.

I do not know if mixing sysfs (for controller attributes like number of LEDs, etc) and IOCTL
(for setting/getting LED colors) is a good idea, any thoughts?

Thanks,
Armin Wolf


