Return-Path: <linux-input+bounces-11000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8EA6A04F
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 08:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C4B488301F
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 07:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E5A1EDA3A;
	Thu, 20 Mar 2025 07:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="CRdyK9wK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cJSzbvPj"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ACD1E378C;
	Thu, 20 Mar 2025 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742455167; cv=none; b=nM/Qumoz7l4dO8+AgBoTXKfoOqOiZu/iSUcdoPRsy2Elfk1R+BefZQO5LIw3vdd1uyY5LRJlWfcELP/5VLctCyZ4YI033AVuJwIeZbz+9iW4f4wSIOLQphysU9tUXgqioPt+yOPv/yyqZSg9lC7WCUObnbeKvUNwzxd/osfWakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742455167; c=relaxed/simple;
	bh=MNehgo02ZIvB+dbmKeh2z24IAu7gyZTIbDWlF8uNuvA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jxYdbE5Hg6OVKqTpPMBmdZtKAGWzJiqXBKz59b5uItp1ikkYD5eZHQVMeJm1OlIINJb8d/PdvNW7ORu4hxZY1m1AZ0v5w0ld23EA8KZj3qCWIDHdW/0vTq6JRTjMINvjGkNJwNChH5b1FDBe0TJfezbsJVwBQdcbHSffW4QiCX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=CRdyK9wK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cJSzbvPj; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 7DDF0114019E;
	Thu, 20 Mar 2025 03:19:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 20 Mar 2025 03:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742455164;
	 x=1742541564; bh=IkKR4Il8czP7aKXMKTYH7NqaSmhXxthO7I0PorMEqeY=; b=
	CRdyK9wKzKBMuJPeT/5YepbJMBM2OIVTnW8QErCxOBxNI4jtc+Eloa0LvNSpAmR4
	tnzyAsThLQ6RzWgoxJ7o7dceBY9sjh/cIU1yO3pQTFnvPAo1aT4BWCZ2QlgzpveS
	cRXtcpYT7tCSS6TZ242tnLz4p0/i+OQaDeuGfHMOVYiB8Jx+DwPIAlFaN2I0bzD3
	x6Td5MbfFesd9Qn+qpTFOaEv1U6BcU1zMD1asCU7D8Tj+9D56fv3bzWtzwSQpkih
	qXBCRFq7lHlHeUda3tg2B7PF7sd/WEwNdfsLgx+rhmREVVAPqpLcSSBhhq+4xlk7
	yWT/iGwheQGfqKMzmopQkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742455164; x=
	1742541564; bh=IkKR4Il8czP7aKXMKTYH7NqaSmhXxthO7I0PorMEqeY=; b=c
	JSzbvPjkI4yEqy8KV8C20V0i9psQ1SYbBS5wNu7M9KGXigbkoMyhPg22iCyiSZax
	hYqsGiC7vkehYKpJkpUEwyM4ucM5BAcrcBDz/a3s2G638tKSi6haCthhpWTrncf8
	0txyBUzLCBQf5HZ9+dE9bUddJfPBrIoaOphWz9HD0L06nWdMKV+XtVzLB/A/5xFv
	FKDEaj3We7qX5nEtj4/7Ot21Z6O8IRHaZAC5RuEZJfui1lgIPfMS1hdT7fFb7gIM
	0zJenxzOzB+1lgoYJTv+cXTAJfkc+xyMY1768sW/cG+tBzYr49qytmy6/SPJXxhA
	d966q5Q7vr9ynKkcF3QIQ==
X-ME-Sender: <xms:fMHbZ8Mhl01U-F8XJR4LZdIkHhTaYGZx2pIiiAyvRKZ6H6anzgw-pw>
    <xme:fMHbZy-uaFP1AAZbOapaJn9YrsjYiIHgjGK1Uuw74iXNpvcDm3ycdHbFzwFujoC4d
    p1IiYIsmTr94Nb87Ik>
X-ME-Received: <xmr:fMHbZzS8xNwqxbnDtAagrCO5ZskCSlXRAmmRpAZ15ARJUA_u08JESga2-ImrAs_qWvyw0y4R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepkeetheevveetleelhfdugeevudefhfet
    ledtteffgfegueeiteeludeiveffveffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
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
X-ME-Proxy: <xmx:fMHbZ0tGrp3IWPVuStuaC3J5bdWR70wDU5xixhiiwZ8wn-40h8NihA>
    <xmx:fMHbZ0cUw8nNl4F4iKOGxyAhirbQ0NgMP6_OFvrmwlxPfn0Z9W750g>
    <xmx:fMHbZ40IovCdXqS0T5aPDrbF5JNTz1YowKlM1Javm7mHiWMSRo_N5w>
    <xmx:fMHbZ4_jRaM2BYq6l5CWl1bPo3yvE8NqIlSCOQchfFVqTjQxUoIGbw>
    <xmx:fMHbZ7wZq5aez5EXA4O5aj5BvMjnrQ1XekpSzoan2u5-gWhmHdTd8N2F>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 03:19:19 -0400 (EDT)
Message-ID: <567b2056-8687-4f92-b4d2-7f289321275e@ljones.dev>
Date: Thu, 20 Mar 2025 20:19:16 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Luke D. Jones" <luke@ljones.dev>
Subject: Re: [PATCH 01/11] HID: asus: refactor init sequence per spec
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-2-lkml@antheas.dev>
Content-Language: en-NZ
In-Reply-To: <20250319191320.10092-2-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20/03/25 08:13, Antheas Kapenekakis wrote:
> Currently, asus_kbd_init() uses a reverse engineered init sequence
> from Windows, which contains the handshakes from multiple programs.
> Keep the main one, which is 0x5a (meant for drivers).

0x5A is also used for Ally setup commands, used from userspace in 
Windows. Only a nit but I don't think stating it's only for drivers is 
accurate but then again asus kind of blurs the line a bit.

> In addition, perform a get_response and check if the response is the
> same. To avoid regressions, print an error if the response does not
> match instead of rejecting device.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
>   1 file changed, 46 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 46e3e42f9eb5f..aa4a481dc4f27 100644
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
> @@ -386,16 +386,43 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>   	return ret;
>   }
>   
> -static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> +static int asus_kbd_init(struct hid_device *hdev)
>   {
> -	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> -		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +	/*
> +	 * Asus handshake identifying us as a driver (0x5A)
> +	 * 0x5A then ASCII for "ASUS Tech.Inc."
> +	 * 0x5D is for userspace Windows applications.

0x5D is the report ID used for commands such as RGB modes. Probably 
don't need to mention it here, and only where it is used.

> +	 * The handshake is first sent as a set_report, then retrieved
> +	 * from a get_report to verify the response.
> +	 */
> +	const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0x41, 0x53, 0x55, 0x53, 0x20,
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
> +	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> +				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> +				 HID_REQ_GET_REPORT);
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> +		hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
> +			FEATURE_KBD_REPORT_SIZE, readbuf);
> +		// Do not return error if handshake is wrong to avoid regressions

I'll have to test this on the oldest model I have. Hopefully it's a 
non-issue and this can return error instead.

Side-note: I notice you're using a msleep to try and work around an 
issue in a later patch - it might be worth trying replacing that with a 
retry/count loop with an inner of small msleep + a call to this init, 
see if it still responds to this during that critical period.

> +	}
> +
> +	kfree(readbuf);
>   	return ret;
>   }
>   
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

Ah, I recall now. Some devices like the Slash or AniMe Matrix required 
the 0x5E and 0x5D report ID (device dependent) however these are 
currently being done via userspace due to not being HID devices.

There *are* some older laptops still in use that require init on 0x5E or 
0x5D for RGB to be usable, from memory. It's been over 5 years so I'll 
pull out the laptop I have with 0x1866 PID MCU and see if that is 
actually true and not just my imagination.

> +	ret = asus_kbd_init(hdev);
> +	if (ret < 0)
> +		return ret;
>   
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

I've left only small comments on a few patches for now. I'll review in 
full after I get testing done on a variety of devices whcih I'm aiming 
for this weekend. Overall impression so far is everything looks good and 
this is a nice improvement. Thank you for taking the time to implement it.

Cheers,
Luke.

