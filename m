Return-Path: <linux-input+bounces-11082-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1389A6C890
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4BE1B62DA0
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 09:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6711B6CE0;
	Sat, 22 Mar 2025 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="dRe46BMg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Er9UOR4T"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC06D155A30;
	Sat, 22 Mar 2025 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742634967; cv=none; b=fMBjQj/FOzznNW1irwM0zbcqVtjV7+0oZoB8qHAk0n0l/nK1hVgblypnNM8DshorXRf114WzXofasSBlCLgL660clU6ulY1eBDcnNnmfLEbdvCdVGM0ineolO7VB9R1dG8TIpF6nDM/uYVntCXnse1ij6vuQy07xQvOmP+2gQTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742634967; c=relaxed/simple;
	bh=2b2RIuJ9BKzPrR5JHaNGWY25O2QcLpeB3BGid21wCxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CunaGkdC83FgnSsdUujIo0jd41n5Ytp01XlVKeocOHv+Mm8aflMz6YmK2UqT26/wDEdi7Qx8ziO/PYl67OOW9JAAgfkgGWeeyDpyP5aE6jAbh7ru5dCFoIYJfeSKSHBxw0/qgAkf8U57rcKcfoilHz0OXI7yZ2WiGFQ8cmj5EsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=dRe46BMg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Er9UOR4T; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 86EB81140184;
	Sat, 22 Mar 2025 05:16:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 22 Mar 2025 05:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742634962;
	 x=1742721362; bh=csSxBraXxWQnYxyjkyp3aIlK3AEF7WKAVfmyigKW3x4=; b=
	dRe46BMgu5KhHaKWxzrMHyV07G5vKSf83LNJVTbZEOtGS0gOeJPt9Pi+HRFXOmg8
	pJYWQBDEmFzuqbPye/4AUly2IOGeY9/LV6eoErYRAKgPKSS1dR1pIt5c3CVgc6ti
	v2AH790x8avuMwSMBG3AOqYjP93B3st71fLZnAuQF62mFz2B7z7gOIa7BCyfDrU8
	6OhJt8JdWmBhOXOHxN0o1VVoTXkKtPQlf4hp/u/qlGaZMByLzkrA+4kXry6cjuyV
	v/822a+1ALo2dcwdCORhRdP+DXO1A41pYVPOoxWCBThhpGpaU3JWuxShB9ybrNTv
	UrNs2bt8n04HsteJLgL9QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742634962; x=
	1742721362; bh=csSxBraXxWQnYxyjkyp3aIlK3AEF7WKAVfmyigKW3x4=; b=E
	r9UOR4TwBctSp2pu1gvueQiqxvEithudDrI78E5CaSTNT2mDSiUV9eK3wLeyfmbP
	SSPpS6ZksCSdrFEp1BQFCtYKs576LY5Hi6nolG09a9w1E/HLZZGV8WYzTKQaVbfO
	85/wMRLmfXnhMlAYecprxLOfNDVSqUDNgMUNEye61lJD6Z6eBOZF9VALqTO4+KCD
	PZOp/u+VEtnStekWSJbTEkhYUKTmMFUoRCvdPEo8UQPO6I72xpcT2z00tuVzgPte
	XIJOWfkHow69r0lLQz38mlVpXImzTfVgRGzHPqXjmptiQn89NWufCvOBg+amwPpl
	cXWdeKt2hFy3vwz+SVxvw==
X-ME-Sender: <xms:0X_eZ-77q435CWyV6dxOD8zI2L1YP4yf5drHNKeBvhqgcJcz45q-gw>
    <xme:0X_eZ3408MEoLn-8qeZKqccME1v5fVQIl-5YHdhjKAJuJuXFOJMGzjXM2TDuAQbp7
    cQKGar94qGPHW2dzNk>
X-ME-Received: <xmr:0X_eZ9fl9wGh-grJBGtbMMkK8hUitkOvE4EyldbaQ0X09DLV4p7PDK2ZPgeB38jxGgAfoKYb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheefheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepveduueevtdetgfehfeeliedvvdfhtdei
    hfdtkeejuddvgeeivddtkeffgeekueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthh
    gvrghsrdguvghvpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekiees
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    ephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:0X_eZ7JyIyipjuZSC8AuxLqApyWhNjuMDVbvDivSSrH747ob81_50w>
    <xmx:0X_eZyKGf0QT2vTftXRSBEBpeT-fXMOux3CRn8ai4Gwg5gH-sSKy8A>
    <xmx:0X_eZ8xEDWGTFTWrP7xlU29-UWWCZUi__OV0oXD7ADptdyvMELQcLw>
    <xmx:0X_eZ2IkIwV-A7oxmDbb9wHVEg5NagheDLAFNp7Z9TdXKdys-DJMYg>
    <xmx:0n_eZx_y12yMoBEkUnWz_utdD4iWl9qNpbqSXatAwBURDCiAVwb7ivU3>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 05:15:58 -0400 (EDT)
Message-ID: <fed995c3-5591-43d3-ac82-dcb6fe1c0c61@ljones.dev>
Date: Sat, 22 Mar 2025 22:15:56 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] HID: asus: add RGB support to the ROG Ally units
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-12-lkml@antheas.dev>
 <d2746ddf-92d5-4ac8-b361-60d1ec9aabb5@ljones.dev>
 <CAGwozwGMNchNXckSZ=HPyi=sFEjrLDzayqjHDSOwwb8MQ=rJPg@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwGMNchNXckSZ=HPyi=sFEjrLDzayqjHDSOwwb8MQ=rJPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 20:56, Antheas Kapenekakis wrote:
> On Sat, 22 Mar 2025 at 03:30, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 21/03/25 11:09, Antheas Kapenekakis wrote:
>>> Apply the RGB quirk to the QOG Ally units to enable basic RGB support.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/hid/hid-asus.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 5e87923b35520..589b32b508bbf 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -1449,10 +1449,10 @@ static const struct hid_device_id asus_devices[] = {
>>>          QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>            USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>            USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>            USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
>>>          QUIRK_ROG_CLAYMORE_II_KEYBOARD },
>>
>> I need to NACK this one sorry, if only because I added the RGB control
>> in hid-asus-ally as a per-LED control and it works very well. You'll see
>> it once I submit that series upstream again.
> 
> Depending on when your driver is ready to merge, it might be
> beneficial for this to merge ahead of time for some basic support.
> Then you can yank it after your driver is in. For your driver, I think
> it would be good to make it separate from hid-asus and yank ally
> completely from here.

The driver is fully standalone and that is what I do yes.

I do think it would be better for you to do the RGB part separate to the 
main lot of patches as those can definitely be signed off and merged a 
lot quicker. You still have the bazzite kernel right? I hope it's 
acceptable to carry just the RGB there for a tiny bit longer.

>> The distinction between MCU mode and Software mode for RGB is frankly a
>> pain in the arse. For Ally we will want software mode (per-led) as that
>> allows just one USB write for all LEDs, and no need to do a set/apply to
>> make the LEDs change. The benefit being that the LEDs can change rapidly
>> and there will be no "blink".
> 
> The blink happens when the B4(/B5) command is sent. If they are not,
> it is perfectly fine. B4 just needs to be sent initially, as it
> switches the controller to solid mode if it is not there already. Then
> B4/B5 could be sent on shutdown to save the color to memory. I
> purposely did not do it as it would break the driver if userspace
> controls the leds inbetween led switches and it is needlessly
> complicated for what this support is meant for (basic RGB).

Hmm, I thought the colour wasn't actually applied until at least a "set" 
was sent. Maybe it's on older devices.. I haven't looked at that for a 
while now.

> Also, multizone is expected to be of little utility, so it is not
> worth making concessions over. I never found a use for it or anyone
> ask for it. If single zone has performance benefits, it should be used
> instead. A lot of devices do not support multizone, and when they do,
> it is in different forms, so it is not something that can be
> intuitively put into a kernel driver imo.

Would you like to know how many varieties of single, multi, and per key 
there are? I have a rather large spread sheet tracking everything so 
far. Per-key + bars is something like 12-13 packets to send :|

> Aura mode is especially buggy during boot and resume, since the
> controller briefly switches from the MCU mode to that, so it uses a
> stale color which is ugly. Even when you try to match the colors, as
> you did, it is not 1-1. You know this too. In addition, Aura mode will
> break userspace Aura programs running through Wine. Although they are
> already broken due to the hiddevs merging which I had to revert for
> V2. But we could fix that, and I will try to for V3.

Aura programs can set the device back to MCU mode. Or they should be 
able to. The RGB setup is done only when called through the mcled class, 
and on suspend (to colour match and set static).

Cheers,
Luke.

>> I'll write more on patch 10
>>
>> Cheers,
>> Luke.


