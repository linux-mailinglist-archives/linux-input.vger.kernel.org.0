Return-Path: <linux-input+bounces-11100-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E97F1A6CCF2
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 23:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ACC03B1D62
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 22:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1DF1CD1E1;
	Sat, 22 Mar 2025 22:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="DerPFC6N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="10HaxQFD"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004E99443;
	Sat, 22 Mar 2025 22:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742680881; cv=none; b=sEnxfKYSdCSTwODT+fi/g8dmlbIIbRVf3sHD9x0Jr8EmqpGj3kHGzbpHJCAT1vWWtyylRycXXtUB0/kt5r4WBZnd+xispGk6gRRyxlZHl7NV2EGdzeK1xfv5G6WG3LYCAmSJhwBgwX6inMVAlghyA9ukNDrddCq78zvgTOB+kis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742680881; c=relaxed/simple;
	bh=3buA4TT5WtkCj8YNcdCuzgzVxO8yTtASR+L1YCzTgP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKLOt1xkx0qsGpZR+xcNGi+naWCz2FIyvh6GE1MIptchiNqfaHE+FsKKuQJDINDmJZ2GEP1CIoJ56ExKFAHixVO8Ac7rb4PGd2hqXZmjoorACXU7grHB2EKGMM4bP9b45/vfMJ+wA+DxFm8gkqETPYOe67q0JV0hbCFI1kcDgTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=DerPFC6N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=10HaxQFD; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C792C25400DC;
	Sat, 22 Mar 2025 18:01:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 22 Mar 2025 18:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742680877;
	 x=1742767277; bh=P3xFpyv0gCb9wzDVYDJhwa1BdDKslKXJ0dz6aEI5A4k=; b=
	DerPFC6N7XzjtOgcxa3FcjCCtFT7LxN0aggpZhtxmgINsW4qAgM3zp30UzvDhcW+
	pckqHlKneOLqGS1fxxG8SfiBFZbn6Vxyf8AtkPgbOTKB1li5y98BTizpu5aHI+wR
	g38/9rc6Sf+OB6iMO0lRvgPFtTWE0dUYR1zOJ4nqrV7go8T6Hs0lk/XW+7YnpauJ
	2bl+oWVGmjsl+Dx3CJ2Huaz+swWUdDNWDYYuPwRhNCLBm8mnWy8bwx6gHpiyFGF6
	iAzAkyXL8ncOU/idTybkoil6eZgQ5bxUSJv+yMDaaHzpHaXR7XoVQ5HhzAjugVGT
	fQxALBy4PCqY1tkCYuJNng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742680877; x=
	1742767277; bh=P3xFpyv0gCb9wzDVYDJhwa1BdDKslKXJ0dz6aEI5A4k=; b=1
	0HaxQFDfapTMHQ6hCBI9ypjXA67Yy7A3BoSNG2I/s9tv4cFlsgAaZVvcMQSPpHlI
	JyV+CUaCFbabIEzIpzAeVPPnK4k4PUbWEalqR297jQHGAfXarH7rTwkFZqg5BZjU
	TeTF5kX6+LLOh7kNKrmEf79FzwCyyu0yehOHt1rYlYGIDfPSNsc7WdaanX9neaPK
	ROU35ASkrO4ntmvZNdNBRvlX7bYFW0WeT0h98k7xbVdd2j3slh+LkLpfqp83GEb6
	5cWU9d1JwQVGzXUCYDg4jgyhoJGBYvuiJJ+YHjkDT75Iu4AI6kpQKDmhcqxLYq0z
	cevEm+sySziCckLyP0kHg==
X-ME-Sender: <xms:LDPfZ2YHZ9IjzpAhdOH_z69fxnuSZKs5oCIgN8nopbeusQLJCpM0Xw>
    <xme:LDPfZ5bmgbRlhIWDmIVvVsHc4Ja47sOOEtYg1Cdg_KD9mCO4SrTCu7_b_BYZ2eWXL
    HfJZHyNVvmf1Bu4bHg>
X-ME-Received: <xmr:LDPfZw9KIi4juxKfi2Qq_G-BMBYUrdE8srUAU8rCLfiD9bsbbI4vcw_i4HOIzFbzeWIwUeEa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehudefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:LDPfZ4pu2v8ZC4Y6yjPfJV7nAwIl0UqNDvlEADyEVQEZLXr7EQXbCg>
    <xmx:LDPfZxrRzP5TRckgYEmTUoXWNqoXGyR7cwXs4tO3ugVO3ruge5JiXA>
    <xmx:LDPfZ2QA8VEFCniLlzZJEpNlLe4jIGbt52xZCFSQ89AC-d0rJ83Ygw>
    <xmx:LDPfZxqUxPCSIxEnCBKtrAYibRVVv9KBz5QfqugFn4bJQ5IHy14HwQ>
    <xmx:LTPfZ1fUw2FhayYy2Ag5JwI5l_raDpLYaDjSojWN9oo92x0FqjBAWnGu>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 18:01:12 -0400 (EDT)
Message-ID: <51a02c2f-acf3-4cca-9514-73ca8b6de336@ljones.dev>
Date: Sun, 23 Mar 2025 11:01:10 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] HID: asus: refactor init sequence per spec
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-2-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-2-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:27, Antheas Kapenekakis wrote:
> Currently, asus_kbd_init() uses a reverse engineered init sequence
> from Windows, which contains the handshakes from multiple programs.
> Keep the main one, which is 0x5a (meant for brightness drivers).
> 
> In addition, perform a get_response and check if the response is the
> same. To avoid regressions, print an error if the response does not
> match instead of rejecting device.
> 
> Then, refactor asus_kbd_get_functions() to use the same ID it is called
> with, instead of hardcoding it to 0x5a so that it may be used for 0x0d
> in the future.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
>   1 file changed, 46 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 46e3e42f9eb5f..8d4df1b6f143b 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define FEATURE_REPORT_ID 0x0d
>   #define INPUT_REPORT_ID 0x5d
>   #define FEATURE_KBD_REPORT_ID 0x5a
> -#define FEATURE_KBD_REPORT_SIZE 16
> +#define FEATURE_KBD_REPORT_SIZE 64
>   #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>   #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>   
> @@ -388,14 +388,41 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>   
>   static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>   {
> -	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> -		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +	/*
> +	 * Asus handshake identifying us as a driver (0x5A)
> +	 * 0x5A then ASCII for "ASUS Tech.Inc."
> +	 * 0x5D is for userspace Windows applications.
> +	 *
> +	 * The handshake is first sent as a set_report, then retrieved
> +	 * from a get_report to verify the response.
> +	 */

This entire comment is not required, especially not the last paragraph. 
 From what I've seen in .dll reversing attempts there's no real 
distinction from driver/app and it's simply an init/enable sequence 
common to almost every ITE MCU that ASUS have used (slash, anime, Ally).

Please remove.

> +	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
> +		0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +	u8 *readbuf;
>   	int ret;
>   
>   	ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> -	if (ret < 0)
> -		hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> +		return ret;
> +	}
>   
> +	readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> +	if (!readbuf)
> +		return -ENOMEM;
> +
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
> +				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> +				 HID_REQ_GET_REPORT);
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> +		hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
> +			FEATURE_KBD_REPORT_SIZE, readbuf);
> +		// Do not return error if handshake is wrong to avoid regressions
> +	}
> +
> +	kfree(readbuf);
>   	return ret;
>   }
>   
> @@ -417,7 +444,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>   	if (!readbuf)
>   		return -ENOMEM;
>   
> -	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
>   				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>   				 HID_REQ_GET_REPORT);
>   	if (ret < 0) {
> @@ -540,42 +567,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>   	unsigned char kbd_func;
>   	int ret;
>   
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		/* Initialize keyboard */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* The LED endpoint is initialised in two HID */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> -		if (ret < 0)
> -			return ret;
> -
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> -		if (ret < 0)
> -			return ret;
> +	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>  

I don't have any non-ROG equipment to test. There have been some cases 
of Vivobook using the same MCU, but these otherwise used something else.
And the oldest hardware I have uses a 0x1866, which uses the same init 
sequence but works with both 0x5A and 0x5D report ID for init (on same 
endpoint). There are instances of other laptops that accept both 0x5A 
and 0x5D, and some that have only 0x5D.

I think you will need to change this to try both 0x5A and 0x5D sorry. 
The older models using 0x1854, 0x1869, 0x1866 PID may regress and 
although I'm reasonably confident there won't be issues due to age of 
those, it's not a risk I'm willing to take, I've spent all morning 
trawling through archives of info and I can't actually verify this other 
than from my memory.

I mentioned 0x5E being used for some of the oddball devices like slash 
and anime, don't worry about that one, it's a bridge that can be crossed 
at a later time. But it does illustrate that other report ID have been 
used for init.

Otherwise the cleanup is good.

No other comments required and I'll sign off with the above corrections.

Cheers,
Luke

> -		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> -			ret = asus_kbd_disable_oobe(hdev);
> -			if (ret < 0)
> -				return ret;
> -		}
> -	} else {
> -		/* Initialize keyboard */
> -		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> -		if (ret < 0)
> -			return ret;
> +	/* Get keyboard functions */
> +	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> +	if (ret < 0)
> +		return ret;
>   
> -		/* Get keyboard functions */
> -		ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> +	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> +		ret = asus_kbd_disable_oobe(hdev);
>   		if (ret < 0)
>   			return ret;
> -
> -		/* Check for backlight support */
> -		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> -			return -ENODEV;
>   	}
>   
> +	/* Check for backlight support */
> +	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> +		return -ENODEV;
> +
>   	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>   					      sizeof(struct asus_kbd_leds),
>   					      GFP_KERNEL);


