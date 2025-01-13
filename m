Return-Path: <linux-input+bounces-9165-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A2A0ACD8
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 01:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BD047A311B
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 00:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91209479;
	Mon, 13 Jan 2025 00:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Ow9Mi6Hp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SdAbfa2n"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF1BA49;
	Mon, 13 Jan 2025 00:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736728659; cv=none; b=IrM8DIZLUr8ESAUrbIz0F0IizRH7d4sZEWjcngBSRjonLAMxS3Tl7DGfpXPc1SHyS4mTAwqB4Srj972utnOrGICY/Px1F31D0zbgjdW2VoxVcCXvdDDmYGHoDFMS8rqCFVIcBHjj0FZyrUKxmkyizKHdA/gbTcvdzY1vJpYddWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736728659; c=relaxed/simple;
	bh=D05GE/uaydZDBM7mlvThqZo2Wqb9DN57caE4NQINcGY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VQ8asikrj+o7xR2YjEel36MDXw60+HJOWTNoWoA/EMcLTOqmfw6KUooYAH5Hln3NSvquDZcat0V4xKB7GLYDxg32lLsgrtzXQRUycTf4wvN5J9PvjkEcBjN4GflpKI/1zjW+tXZIo8dqI9Fk/5RgWR5Ou/1ib8zq/3mhjPcJ2P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Ow9Mi6Hp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SdAbfa2n; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B435F2540191;
	Sun, 12 Jan 2025 19:37:35 -0500 (EST)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-08.internal (MEProxy); Sun, 12 Jan 2025 19:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736728655;
	 x=1736815055; bh=0sU1ohH9aw1nDqsWtIobVQn7I3580cqOd9ibDXWCHZo=; b=
	Ow9Mi6HpADiSdMOxhn1op1rryjxqyB7GDa37agBH+DTlezWS8CwVJqxZw4ZBBEXV
	XunoCLlChWM8z36epnW+LNlMdVeVFrCKgQ+lQS4Zon9bmaRwKipbliAeIM+qR3hW
	xqIw/xQtKY9x2MGY25bDvXgTvzOS9VlPknJ0EpXMY+J66QUUYv0Sr7s9SMxBTMtt
	BQO2U9XshRdiYwtvz7D6Oi9kh0yQ5yQKC8eDUe8MmOQmTO36BJ1+wztLN9Vd7vKK
	SjSEPaRam9UQDqhFxGssKy0e0gihiTLr18jHiTGas6Gr9jA+Xl8FfbNx22xpVLSF
	LBzdH6hVMSputX0LRndLnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736728655; x=
	1736815055; bh=0sU1ohH9aw1nDqsWtIobVQn7I3580cqOd9ibDXWCHZo=; b=S
	dAbfa2nUagwDl5BlYkvVzISMBjMWfxPEOr403JzMtWGWXzn3xMakfgnlFcAMMPjb
	PkIzj3rvzvN3cRM/036PtdjyYdoVJFTFwHfnJfxx8/CwjO1gXIZ2sAvoUNRfD9HO
	eQALtVglxhEEdYwgy2B7ybd1NCG0lBVwB1+Ysu0kOk0fibDpgZoP3o+RaYUTQePD
	wk2ESj6nE2KW8dwSHDtqAeWd9csTT6mqCUHC8AeWKoZCQJuvgOoNRalWHECEi0mg
	DKN08JckyBYhViCzzh/B71+LS/tSjXyfLG+JsPbDa6K8on0XGUng/upBukTB9NuD
	RlQZGrby3+2Ms0Uj1UAzg==
X-ME-Sender: <xms:TmCEZxxzkjNPXulSysU0agFvwSH4GgWnVcwWCHsQRtwZOrNEJxTSSw>
    <xme:TmCEZxRHjDbW-9lnwc7Ecr-q4VSxllnlP4jwbnT1np4HExPwB8DbUFFYNje8w-1V8
    1Mylog6JqJFpMHotaI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehfedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeehffehheeiteeffeejtddtudffieeutdejiedvjedv
    leefjeeljedvveeugfelveenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegtohhrvghnthhinhdrtghhrghrhiesghhmrghi
    lhdrtghomhdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepjhhoshhhlh
    gvihhvvghniihonhesohhuthhlohhokhdrtghomhdprhgtphhtthhopehhuggvghhovggu
    vgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvg
    hrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:T2CEZ7WTZhd-w1_5dwc5leYWWKOeIgPvq2ekUWSJJsBrjsooMW1u2g>
    <xmx:T2CEZzjuIIVBs1aR6RgUS7x4LDzRAu3xkR-qmtiEj5gz1G8k_fNn5A>
    <xmx:T2CEZzCC76yI3bxR4Lec7E1s8GoMVBp5y6XxfRvmFCnXJxx_xCkLrw>
    <xmx:T2CEZ8IqGPY8_lefPuCDlCEJ0vH7rsT2yIU1wrjus3K60ZxZHudXcQ>
    <xmx:T2CEZ1C-pZngVEsNfPzoK-uiqPKan4zhQhjDFDRAp1qLH_yQT0UNh9Nh>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DED0529C0072; Sun, 12 Jan 2025 19:37:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 13 Jan 2025 13:37:13 +1300
From: "Luke Jones" <luke@ljones.dev>
To: "Josh Leivenzon" <joshleivenzon@outlook.com>
Cc: "Benjamin Tissoires" <bentiss@kernel.org>,
 "corentin.chary@gmail.com" <corentin.chary@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jiri Kosina" <jikos@kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <e5091e50-a023-405d-a8f1-058f6a17f9e7@app.fastmail.com>
In-Reply-To: <20250112121811.434552-1-hacker1024@users.sourceforge.net>
References: <20240713074733.77334-2-luke@ljones.dev>
 <20250112121811.434552-1-hacker1024@users.sourceforge.net>
Subject: Re: [PATCH v3 1/1] hid-asus: use hid for brightness control on keyboard
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 13 Jan 2025, at 1:18 AM, Josh Leivenzon wrote:
> Hello,
>
> Thanks for this patch. I'm looking at doing something similar for the Zenbook 
> Duo 2024 keyboard, which, I'm discovering, is similar to the ROG_NKEY_KEYBOARD 
> devices in a number of ways.
>
> Something unique about the Zenbook Duo keyboard is that it has an external 
> data-capable USB-C port, meaning it can be used as a regular USB keyboard for 
> any device. This means that even if WMI features work, it is highly preferable 
> to use HID alternatives where possible in order to allow those features to work 
> on any Linux device that the keyboard is plugged in to.
>
> This leads me to my question: Why the DMI check on the HID side? This is a 

It's because I couldn't see a good way to both disable the WMI backlight and use HID. On some laptops both WMI and HID work, but on some WMI methods exist but don't work at all. The DMI check ends up being something of a blanket check across those family or models as they all used different generations of the MCU at one point but all have HID brightness control.

The key part is we need to tell asus-wmi not to use WMI for brightness on those product ranges. I have at least 4 years of data in this rather disorganised repo if you're curious about other models (And I always take contributions) - https://gitlab.com/asus-linux/reverse-engineering

> little problematic for me, as it blocks functionallity on other devices. Would 
> it be sufficient to use quirks only in that case? The important part, to my 
> understanding, is that the WMI module disables itself properly, which is still 
> covered by its own DMI check.

asus-wmi is still used for many things, so it's really only the LED handling that needs disabling when required.

> Are there devices that use the ROG_NKEY_KEYBOARDs where HID doesn't work?

Not that I know of, and I think this goes right back to 2019 with the:
#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866

These ones span 2015-2019 I think, and are rare to find in use still, but from what I've managed to find and from the odd report back they also use HID:
#define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
#define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
#define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822

I would love to have someone withe the hardware help to make this device better for all users. Some issues that may be useful or related are here:

https://github.com/flukejones/asusctl/issues/25

https://github.com/alesya-h/zenbook-duo-2024-ux8406ma-linux/pull/12

I also have a WIP branch here https://github.com/flukejones/linux/tree/wip/ally-6.13 (ignore name, it covers all asus)

If there is anything I can do to further help you please ping whenever you need.

