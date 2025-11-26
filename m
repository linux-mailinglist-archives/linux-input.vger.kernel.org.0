Return-Path: <linux-input+bounces-16359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8870C8B356
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 18:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51A4F4E36DE
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 17:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF5D27A907;
	Wed, 26 Nov 2025 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/JrmdNi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F0219A81;
	Wed, 26 Nov 2025 17:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178449; cv=none; b=gzq3Od5Pke4VXI+H1pIlvhRbAkh+e33SVlxW/2PL5CmIau/YMSd/bGB2Auz0XI3cDCZvdq71HcyCqEHe/XoxEnaCqxX6ige33n1guXsrTn+rNcDoJDE82YVoZCHe9PORPeW2o9L9cqNePwlrPBVCQqIYj6VWnSakh65iUzeGSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178449; c=relaxed/simple;
	bh=dlVMMDnyIB7QnRLlQRgXzJiIyoXcNt1w0wU3moj+IEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMEfjftbH7ZgMYc/7lUdutsEEVFZXUsgWZzINArRtiOY+ol3CvP8ZpCTgW6hYeWtZiVa1CwdGNkURzC0bA49y0e5yCcL7ui/+mT5uRenGw0K1n27UUQXX+Kma0xRJXLGNd1qUqQ+7gMM9iBdLkJJdn1cOR+Ks9mvL/ot7ns9kws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/JrmdNi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46229C4CEF7;
	Wed, 26 Nov 2025 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764178447;
	bh=dlVMMDnyIB7QnRLlQRgXzJiIyoXcNt1w0wU3moj+IEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b/JrmdNiE4X1fMMuXwrA+Ry1jtCJYKcT/NYA8zGNT69Z3DhlCfUp9Z0fCP/JnuuBh
	 LSsDqlqW8n9HuAX7IJdskgp9VWbYkSdFbiVezbXSi5ZVTQcXrJI5vIU2ueA9MkdUCm
	 BgiCTmnSnLRnugLnggZrhGCPdhfAV30q6dsB7gfEZSQhGpaj2+tssJVthLc41i78Lj
	 xDnGWIJKYKRlAyLpYCI2WtJ2DjHtowuPfX4GaaVTHocgr2nXPguP464tqCiyVtlrgP
	 ESv7jZnFcSsXxJS0JOqfubgTmpsM1OXHggYEuukdIQrO/vHkdnvw9eHJ2B+au4TS+S
	 2I31RaC5Mbn3A==
Message-ID: <4bcc6708-77ff-403d-83cf-10a40934263a@kernel.org>
Date: Wed, 26 Nov 2025 18:34:03 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <CAGwozwGwkBH_03JvPQrevQiszwDZ5R4uDBnzWVeVXLo8xRmeug@mail.gmail.com>
 <b91fa2c8-e342-9e46-f401-8c3d0590cd38@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <b91fa2c8-e342-9e46-f401-8c3d0590cd38@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 26-Nov-25 4:23 PM, Ilpo Järvinen wrote:
> On Wed, 26 Nov 2025, Antheas Kapenekakis wrote:

...

>> As for "HID: asus: early return for ROG devices" changing the name of
>> the devices of this driver, I will veto backporting it if it happens,
>> so inputplumber will have the two full months to remove the name
>> match. This is not a breaking change in the sense that software cannot
>> be made to work on both previous and latter versions and there is no
>> other software to my knowledge relying on name matches for Asus
>> keyboards.
> 
> Did Hans give some opinion about this rename earlier, at least I don't 
> remember nor could find from lore archives?

I don't remember commenting on this myself either.

So generally speaking there are plenty of cases where /dev/input/event#
nodes for a specific device have their name changed by some kernel patches.

Typically HID input devices are matched in userspace by their
bus:vend-id:prod-id triplet not by the name. The name might even
change by a fwupdate of the device itself.

So I'm not overly worried about this and inputplumber seems nice
enough and already is very much not a plug-and-play tool.

One possible concern with laptop keyboard input-device name changes
though is hwdb entries to fixup scancode -> ev-key-code mappings.

See: /lib/udev/hwdb.d/60-keyboard.hwdb on any standard Linux systems
an then the big comment at the top.

An input-device name change might break this match pattern:

#  - Input driver device name and DMI data match:
#      evdev:name:<input device name>:dmi:bvn*:bvr*:bd*:svn<vendor>:pn*
#    <input device name> is the name device specified by the
#    driver, <vendor> is the firmware-provided string exported
#    by the kernel DMI modalias, see /sys/class/dmi/id/modalias

As well as the extended version of this and for laptops with USB
keyboards this is the only match type which allows a DMI match
which is what we want for laptop kbd mappings. Looking at the Asus
section of the upstream 60-keyboard.hwdb I do not see any such
matches though.

There not being such matches kinda make sense since for USB-HID
devices any special scancode -> ev-key-code mappings are typically
handled in a vendor specific HID driver like hid-asus.

TL;DR: I think that the input-device name should be fine.

Regards,

Hans






