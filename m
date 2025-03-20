Return-Path: <linux-input+bounces-10999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919BA6A03E
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 08:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BDCA3BDC16
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 07:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD9E1EE02A;
	Thu, 20 Mar 2025 07:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="lsk8i3SG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g4lv+eJH"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987D22744D;
	Thu, 20 Mar 2025 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742454770; cv=none; b=OEcZne+oRh8758rL4W6+wCxTgKn2jrXGkJGsgBIKJ/B4Evi0bmdDEkeov9iIaHETIQSecnqONuaZU76QQR3e2wl7uwrXkYEPpKlRECQyP6kBeGczLhwMYVU6fltvvoW9obO+RYGpRPAR7bKdv145r8d5f0LOS6D57giMFW5l0lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742454770; c=relaxed/simple;
	bh=MT8nyD/PfCAM9gUqtSHMNqQZ0kDztWEnrBz2Pr4SGXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pk8UsGBvoG3k9QMqHWc1oQrnhjFovSuYt0YKTamNcOCfBuKYRsDCodIekbDpPlysZXrEBb+AQYYc+ITXdsRYWpzuqKKefIJZiUurvccnM8uzfvd16xKNsom5myLyV8XK/yFP5DlVyQqIUIlGTA74yT6kKgO9SkfCa/8Di6d38w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=lsk8i3SG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g4lv+eJH; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5F45225401C2;
	Thu, 20 Mar 2025 03:12:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 20 Mar 2025 03:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742454767;
	 x=1742541167; bh=FpSAft60jR4u85D2Ofi92uo7DV6nNJ7rZp7/7M7RMyc=; b=
	lsk8i3SGgHUJIHysM82NMPaELSCSl1p/OjESSiiUOttf4A1eLtctceAmVn5KV1BE
	6zoHRLIMQw0Qw6cCrUjzwX/hrbK+FSbzpHhI+wutpXo+eKZSptjOUgDNSjciqoyZ
	MHDhM/J7F5kDCoh/7v+1g+Qm1sq9OaA8VdoTOyy601Omw1v2hwcEGoL03nBHQHV/
	RCzK8rWu9ejGFL3H2prAv8rnJ30qgPZzoXesW6nSeI2qU6TSK2mai8xMf+RhX8QC
	gKGuBeEuC9tZLBhnPK6xqxUE9aBkKUJvsAM/EdRP2BunxqrAxsRUoKeNsTGsgzQV
	5ye5u39cT0Ld/+3cjUgyoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742454767; x=
	1742541167; bh=FpSAft60jR4u85D2Ofi92uo7DV6nNJ7rZp7/7M7RMyc=; b=g
	4lv+eJHHGVvy8rUnqq8XXQd/kw+CDo0gOvR+M/XAZgfdJl9fbwBxjgCi9KuCpcI3
	hMr6B4j4rOoqm4f2mRj8FD5dznK2ZDBKB4Sx2EhKBcN/cvGFWuaDYvyUsxJww0UU
	WQSJnAoBPRPep39bABFr49jVAR3Q7J9iU/4Rcgq20zULP0P3ArfnW3Z4QJvsVp5p
	Fsm+ba3QwKIEblscAaS/ShUSChV0JzL7h+d83Nwfw058rskKp0nta/+33wk57Gtf
	P1mAYkqz/CN3Yo4voxIUIyaNyc0Z9VqeviExdzdvKOmTr2gPOpH2gGofqQIX1yZx
	jCb6q+cMpTs5SIwnMaxBA==
X-ME-Sender: <xms:7r_bZ2vkYMBbvYAHsBYs2luisYO35iCe0U-GjjWZZEoatxec6uHlSg>
    <xme:7r_bZ7d_E5sHrOK3zvAn0PiwfORW9uvbX6UEkkqudghUOfqjU67zWtcqByCnJZ_jO
    aNqmozdu6d6y9N91oA>
X-ME-Received: <xmr:7r_bZxwjIPK-H4452ydptXPev090JuLc4V1B20QzZrwz0-NeGSJtRrxX0fVH_9MXtcyWq_7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepveduueevtdetgfehfeeliedvvdfhtdei
    hfdtkeejuddvgeeivddtkeffgeekueffnecuvehluhhsthgvrhfuihiivgepudenucfrrg
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
X-ME-Proxy: <xmx:7r_bZxOH7eE7v3qMLMwrmkUWqCEvurfNc8KsNnCow8eqVSX4KYE_Ag>
    <xmx:7r_bZ29ZRdUlfacIYxEvhWHFMae-FQTeJl6htacE8mqyFUwhlRknYw>
    <xmx:7r_bZ5VqG1LoPcvKwzBurDJVPgUAdcQQNTmbe6S4KS2mvVNdHiSywg>
    <xmx:7r_bZ_fQZ4GxNlThJ2mw9IiFX4G7Fd1G4InHND3L8kqRq-QHM9u-3g>
    <xmx:77_bZ6QKzlpNM-AZie8x67crhEl5neFdJdoFrBsnG71vt6b2qhQiCm7V>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 03:12:42 -0400 (EDT)
Message-ID: <51c78ba6-9518-4259-85da-d761b031df7f@ljones.dev>
Date: Thu, 20 Mar 2025 20:12:39 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] HID: asus: introduce small delay on Asus Z13 RGB
 init
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-7-lkml@antheas.dev>
Content-Language: en-NZ
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250319191320.10092-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/25 08:13, Antheas Kapenekakis wrote:
> The folio keyboard of the Z13 can get stuck in its BIOS mode, where the
> touchpad behaves like a mouse and the keyboard start button is not
> reliable if we perform the initialization too quickly. This mostly
> happens during boot, and can be verified to be caused by hid-asus
> through simple blacklisting. A small delay fixes it.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 85ae75478b796..5b75ee83ae290 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -571,6 +571,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>   	unsigned char kbd_func;
>   	int ret;
>   
> +	/* Wait a bit before init to prevent locking the keyboard */
> +	if (dmi_match(DMI_PRODUCT_FAMILY, "ROG Flow Z13"))
> +		msleep(500);
> +
>   	ret = asus_kbd_init(hdev);
>   	if (ret < 0)
>   		return ret;

See my comment on patch 1 about trying a loop with the init 
request/response as a hopeful way to test readiness.

Cheers,
Luke.

