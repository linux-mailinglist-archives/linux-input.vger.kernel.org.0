Return-Path: <linux-input+bounces-11102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C4A6CD35
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82CB5189B05F
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 23:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0FF1E9B34;
	Sat, 22 Mar 2025 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="KGreoEXz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1mV6f3BM"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0658318A6C1;
	Sat, 22 Mar 2025 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742685704; cv=none; b=OaxkTXFh86crAGQccdU9nISwcFECkY9YNWtdRMR3NJswPdHika01HGHsZdzXH3UAEgwfQWV7NYe+nK/NCVB7If7QmWt+1NyIPoBfevLmrcHUeIrtHjA0M8X2DX7++rAJzXaXL82lUJ91H3FqfPFtYbi7wRz1nWtTuy/E9W4HOH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742685704; c=relaxed/simple;
	bh=WagACbzFFu8bUIcdElllzcDC8dZ786upd8t6DwsDGaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEu7qOgBCXWq2sNQ4J7TjNguN+5THGvFhnWPGSDFfRoJTdgS5IN0VER9M8s4JWmirHtXksyS1r7FRyGGNSWkqRufFAhLn0+uLdDCJB1/HFvgGPJpfDKU6v285QwRFvKNtAXwt0pncHEFnv4hoo0Sn3hGBrDcaNlPw8qq4GlfS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=KGreoEXz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1mV6f3BM; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.stl.internal (Postfix) with ESMTP id B034311400AC;
	Sat, 22 Mar 2025 19:21:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-13.internal (MEProxy); Sat, 22 Mar 2025 19:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742685700;
	 x=1742772100; bh=U1OunPpkFvFWAIq46gjgVKAwFRLEYiiaC3EIDu9bhQY=; b=
	KGreoEXzCq9nK/QYWxBQ4slIajfiDtLzhFj5T5dhebqucBjhsvYnQLmG/CKIOKnj
	w6aB//t8a8EoL72a/CSFuhgw/lWtr3wFZ6rQ/Vzd09tr1ApnLNeirGgXoJxTZ8Y9
	C56hApMuAKRb5pJubkBa5xRXwcC39vSvAaGkvTlBciWAIFVIlwLxUq4YF8CqrsMT
	pIqf8ZORG968DRIw5MOA30Xq5jLljB4gAbS5KzSR1cwvydSmulJgTTDZuD2Pp4wH
	JlMxT780CROopMSP6kIhsimFniB0rA/m1K/rkyAksOJSXNzjLN+XGUpWyV3YB4vS
	xCswRZTNt3WNEDT+JqJh2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742685700; x=
	1742772100; bh=U1OunPpkFvFWAIq46gjgVKAwFRLEYiiaC3EIDu9bhQY=; b=1
	mV6f3BMg/q6X3qX5FhazJ3kFem7TQOYAsyNUtxhLubW+zLCIKw9p3kX4oDTGLPee
	F+a4mlYJ3/8Az9Rb2qcSjAelYmk/sT450VlT3rB05L/GaXPntD3TKh5UfurChcVw
	dP/EuIRCQWW0BzMerpR67yUSZM4NEQ51w3P/8ZAhAjdzn4AcwftLce57khw3ybhZ
	ThqFn/+tKWkXZ2LilfrgT+DVKowiEszgCvUU3uGCTgR8EoobYWWnMsPpSh0lKcAf
	QgBoRE5pjc73EsGCXKRtf3zWseuMCLzerL9BWhie7O/MSGCHkvfu73USb2zinM3C
	XEb+KgAQ+9iW4DaogJWlg==
X-ME-Sender: <xms:BEbfZ95onivUFrW6go6WjmPfX8vpt4eu4_koUf3_Vn3-sS-CySsPCA>
    <xme:BEbfZ642SF0AWjKGnkPE4t2Z-r-9vzWJtuXXSuPSe_nCPBzs4eRyl-Bl3Y9BDWfHD
    XQLvabKWbw-O_puLAs>
X-ME-Received: <xmr:BEbfZ0f0p9xKTottzZolKY8TLRwhnZg8Lbs9hu7igxPaRvHtfFtUYQdAH8WYaf9yvgf_AcTc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehvdelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:BEbfZ2I4UuHZk3YnQNwzW6o-0MFRy7077QnqYazqQAayfGpgl8DfPg>
    <xmx:BEbfZxLSRQG1rxW-pOtGgnd-GsJZfKtERZEONQoKVM8DUQNtYjQkRQ>
    <xmx:BEbfZ_w59QowZsqeYDugqChCVfGP0545SLwwvoeZfMkNlKeSMrhsCw>
    <xmx:BEbfZ9Kpb2vW7HwnanS6GSFXOEVaIdW69MFnvqm8euqaUatBmp1uiA>
    <xmx:BEbfZ498aN7GoEoaQRhZtWR33LsNvbx5LXBtfjqok2UgepAHnq5hYiJb>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 19:21:36 -0400 (EDT)
Message-ID: <76365fc3-3430-4efb-b44e-3457b8cd530b@ljones.dev>
Date: Sun, 23 Mar 2025 12:21:34 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] HID: asus: prevent binding to all HID devices on
 ROG
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-3-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:27, Antheas Kapenekakis wrote:
> ROG keyboards are HID compliant and only care about the endpoint that
> produces vendor events (e.g., fan mode) and has the keyboard backlight.
> 
> Therefore, handle all of the endpoints of ROG keyboards as compliant,
> by adding HID_QUIRK_INPUT_PER_APP and, for devices other than the vendor
> one, by adding QUIRK_HANDLE_GENERIC to stop mutating them.
> 
> Due to HID_QUIRK_INPUT_PER_APP, rgb register is moved into probe, as
> the input_* functions are called multiple times (4 for the Z13).
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 69 ++++++++++++++++++++++++++++++++----------
>   1 file changed, 53 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 8d4df1b6f143b..96461321c191c 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -84,6 +84,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define QUIRK_MEDION_E1239T		BIT(10)
>   #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>   #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> +#define QUIRK_HANDLE_GENERIC		BIT(13)
>   
>   #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>   						 QUIRK_NO_INIT_REPORTS | \
> @@ -120,7 +121,6 @@ struct asus_drvdata {
>   	struct input_dev *tp_kbd_input;
>   	struct asus_kbd_leds *kbd_backlight;
>   	const struct asus_touchpad_info *tp;
> -	bool enable_backlight;
>   	struct power_supply *battery;
>   	struct power_supply_desc battery_desc;
>   	int battery_capacity;
> @@ -326,6 +326,10 @@ static int asus_raw_event(struct hid_device *hdev,
>   {
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>   
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		/* NOOP on generic HID devices to avoid side effects. */
> +		return 0;
> +
>   	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
>   		return asus_report_battery(drvdata, data, size);
>   
> @@ -774,6 +778,10 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
>   	struct input_dev *input = hi->input;
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>   
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		/* NOOP on generic HID devices to avoid side effects. */
> +		return 0;
> +
>   	/* T100CHI uses MULTI_INPUT, bind the touchpad to the mouse hid_input */
>   	if (drvdata->quirks & QUIRK_T100CHI &&
>   	    hi->report->id != T100CHI_MOUSE_REPORT_ID)
> @@ -827,11 +835,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
>   
>   	drvdata->input = input;
>   
> -	if (drvdata->enable_backlight &&
> -	    !asus_kbd_wmi_led_control_present(hdev) &&
> -	    asus_kbd_register_leds(hdev))
> -		hid_warn(hdev, "Failed to initialize backlight.\n");
> -
>   	return 0;
>   }
>   
> @@ -851,6 +854,10 @@ static int asus_input_mapping(struct hid_device *hdev,
>   		return -1;
>   	}
>   
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		/* NOOP on generic HID devices to avoid side effects. */
> +		return 0;
> +
>   	/*
>   	 * Ignore a bunch of bogus collections in the T100CHI descriptor.
>   	 * This avoids a bunch of non-functional hid_input devices getting
> @@ -901,15 +908,6 @@ static int asus_input_mapping(struct hid_device *hdev,
>   			return -1;
>   		}
>   
> -		/*
> -		 * Check and enable backlight only on devices with UsagePage ==
> -		 * 0xff31 to avoid initializing the keyboard firmware multiple
> -		 * times on devices with multiple HID descriptors but same
> -		 * PID/VID.
> -		 */
> -		if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
> -			drvdata->enable_backlight = true;
> -
>   		set_bit(EV_REP, hi->input->evbit);
>   		return 1;
>   	}
> @@ -1026,8 +1024,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
>   
>   static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
> -	int ret;
> +	struct hid_report_enum *rep_enum;
>   	struct asus_drvdata *drvdata;
> +	struct hid_report *rep;
> +	int ret, is_vendor = 0;
>   
>   	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
>   	if (drvdata == NULL) {
> @@ -1111,12 +1111,45 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   		return ret;
>   	}
>   
> +	/*
> +	 * Check for the vendor interface (0xff31) to init the RGB.
> +	 * and handle generic devices properly.
> +	 */
> +	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
> +	list_for_each_entry(rep, &rep_enum->report_list, list) {
> +		if ((rep->application & HID_USAGE_PAGE) == 0xff310000)
> +			is_vendor = true;
> +	}
> +
> +	/*
> +	 * For ROG keyboards, make them hid compliant by
> +	 * creating one input per application. For interfaces other than
> +	 * the vendor one, disable hid-asus handlers.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		if (!is_vendor)
> +			drvdata->quirks |= QUIRK_HANDLE_GENERIC;
> +		hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> +	}
> +
>   	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>   	if (ret) {
>   		hid_err(hdev, "Asus hw start failed: %d\n", ret);
>   		return ret;
>   	}
>   
> +	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> +	    !asus_kbd_wmi_led_control_present(hdev) &&
> +	    asus_kbd_register_leds(hdev))
> +		hid_warn(hdev, "Failed to initialize backlight.\n");
> +
> +	/*
> +	 * For ROG keyboards, skip rename for consistency and
> +	 * ->input check as some devices do not have inputs.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +		return 0;
> +
>   	if (!drvdata->input) {
>   		hid_err(hdev, "Asus input not registered\n");
>   		ret = -ENOMEM;
> @@ -1167,6 +1200,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>   {
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>   
> +	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
> +		/* NOOP on generic HID devices to avoid side effects. */
> +		return rdesc;
> +
>   	if (drvdata->quirks & QUIRK_FIX_NOTEBOOK_REPORT &&
>   			*rsize >= 56 && rdesc[54] == 0x25 && rdesc[55] == 0x65) {
>   		hid_info(hdev, "Fixing up Asus notebook report descriptor\n");

Ilpo might have some feedback. I'm otherwise happy with this.

Reviewed-by: Luke D. Jones <luke@ljones.dev>


