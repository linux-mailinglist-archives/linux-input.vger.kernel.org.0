Return-Path: <linux-input+bounces-11120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD5FA6CE19
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 07:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 822221887BDC
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 06:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCE34501A;
	Sun, 23 Mar 2025 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="WdIubfdO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i32AoKlH"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35163201035;
	Sun, 23 Mar 2025 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742712066; cv=none; b=Y7HLyXQl4+LZ+N0mI9iStjWCpZSx0y86RGcoqb3EfAr62JgqHQrk73rZ1fwNYNQ5EuP4JrwgUig6zg0ytTMsgPzIa7xXSHaABPmOPV4eRs1MOi55M+VBdDzS9/1rrvDid8phsOwCrXrczHSJeJ6Msk1hm2/ATJJlI0yIHigWhIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742712066; c=relaxed/simple;
	bh=7L8sZAbOnvyNOZSIOo8UtLtNUrXrQXc4Nv5pCPsdY08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUaK2BdxNOXRnF11HId6LR1jdhz84n9CIljJnK+C3b+C6UQsf2xzGUVKjvyYmvWr1Q5JJCKKVQJanwYt4igW/tttudJiEAPLxiAYlKRJmJkI4Q3KWbDL9/MDJ4viB0HJEIyyC+bIpwCAJ88WmRqyuQvQ0Q61krBb5Yp2u7MP7XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=WdIubfdO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i32AoKlH; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 54D03114012E;
	Sun, 23 Mar 2025 02:41:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sun, 23 Mar 2025 02:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742712064;
	 x=1742798464; bh=3FnL12l10lxt+jXMNKcqv9QwAHvXWqIJA3zw8akgneY=; b=
	WdIubfdOUmayQposbP82Xn5fGnLxve8EGBnn0VSnelUbP1B0NkI2jTxKy8i/QQHn
	OSB7jSSNS4m7TlufL3UBvVG9aawXp4ht3puZBd4eVBfTFq7oemtl5Eq2UrAlFNbV
	wTQL7YiWESj/pIRl5sCNNAwjnxUkVFX7jGxBScNgqI607M9P8PR5rGGiknkf+20+
	IvBVbxglvdV27WHf95129qaiPEUlB81SclHTRZ/XZzmM623fN+YOn5/RNJeS6fix
	jB656cm0JDtVMK/sh0y/2XsS3uSzNoEizzH2THs9wB81hvB9cynbGSTm38Gi2uDL
	GjeU8PEfEr/qAaPsKJb8wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742712064; x=
	1742798464; bh=3FnL12l10lxt+jXMNKcqv9QwAHvXWqIJA3zw8akgneY=; b=i
	32AoKlH67eLpkEj/M9Fu9TK6mYtKHhfVdn9kUHcYvF81TGTZDPWOAU1nfDIxstOd
	vu3kST+k2DShklukpSZTTPmkQXTi8BiOucGBCApqSYyg0FuspxADhhCZae0BrLxi
	eVtLma7Q1jRArcluU4ic7vlsbgSdE1Jhj4q9EC3950JwPG6TDi5uMpOjwjPxSVpJ
	GQNogP5sLu/gxr9DKNU7xTgJoBE07cTK6vx5NiFbczFAtImJpIWRwDTDomBASEGk
	djpgArdG3Bz1mpKtFROLaeSU0emFhqCW2VK2fPnEMDeNrxZlVDZnYSxJAE/57QYN
	omD4yzyYq4h59hA6g983g==
X-ME-Sender: <xms:AK3fZ2CH4mkmxsWIPodEkKdh8JXOMj02nlQBLmKOSWhX0PrkLAXenA>
    <xme:AK3fZwgAiu9OzW5Aa_DCfFhzt4fCl5mWNxMuaAldIXUxYhd5KzcWrr9oQ0wo-Nawq
    tT4WNh9946ReBj_yn0>
X-ME-Received: <xmr:AK3fZ5mLieh1RGrIExBj5pYgrjV9Iy8i26MrN22LRkPHX341kO0IUhYF96cjMfBdttg6SHcP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheeiudejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:AK3fZ0xS6znRwp98HxxZYtlHbxxpuLFg4-Od7G0brEt5kuBEbqHtMA>
    <xmx:AK3fZ7QWdhcilmIyDHN8lwgVaPMtGW-aWj1BsjcqJKWLUi80NU5EfQ>
    <xmx:AK3fZ_b-g5z-cnDa0DXwMTWll8XugGPGsJkScgo2GQsEqYSSDcO85A>
    <xmx:AK3fZ0QkqgytrLVNMHLLB81AREITCQtV_-6BBb9Qi_yJ1zM41idyLg>
    <xmx:AK3fZ2GMBveZLnpWdNUmIDZK9G3JGfda_1eweTLtj0jc4zDx20BNX4Nm>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 02:41:00 -0400 (EDT)
Message-ID: <9578ac78-bc89-40e0-8ffb-82582bf594d2@ljones.dev>
Date: Sun, 23 Mar 2025 19:40:58 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] HID: asus: listen to the asus-wmi brightness
 device instead of creating one
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-6-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-6-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:27, Antheas Kapenekakis wrote:
> Some ROG laptops expose multiple interfaces for controlling the
> keyboard/RGB brightness. This creates a name conflict under
> asus::kbd_brightness, where the second device ends up being
> named asus::kbd_brightness_1 and they are both broken.
> 
> Therefore, register a listener to the asus-wmi brightness device
> instead of creating a new one.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 65 +++++++-----------------------------------
>   1 file changed, 11 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index e97fb76eda619..c40b5c14c797f 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -96,7 +96,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
>   
>   struct asus_kbd_leds {
> -	struct led_classdev cdev;
> +	struct asus_hid_listener listener;
>   	struct hid_device *hdev;
>   	struct work_struct work;
>   	unsigned int brightness;
> @@ -493,11 +493,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>   	spin_unlock_irqrestore(&led->lock, flags);
>   }
>   
> -static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
> -				   enum led_brightness brightness)
> +static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> +				   int brightness)
>   {
> -	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> -						 cdev);
> +	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
> +						 listener);
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&led->lock, flags);
> @@ -507,20 +507,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>   	asus_schedule_work(led);
>   }
>   
> -static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
> -{
> -	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> -						 cdev);
> -	enum led_brightness brightness;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&led->lock, flags);
> -	brightness = led->brightness;
> -	spin_unlock_irqrestore(&led->lock, flags);
> -
> -	return brightness;
> -}
> -
>   static void asus_kbd_backlight_work(struct work_struct *work)
>   {
>   	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> @@ -537,34 +523,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>   		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>   }
>   
> -/* WMI-based keyboard backlight LED control (via asus-wmi driver) takes
> - * precedence. We only activate HID-based backlight control when the
> - * WMI control is not available.
> - */
> -static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> -{
> -	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> -	u32 value;
> -	int ret;
> -
> -	if (!IS_ENABLED(CONFIG_ASUS_WMI))
> -		return false;
> -
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> -			dmi_check_system(asus_use_hid_led_dmi_ids)) {
> -		hid_info(hdev, "using HID for asus::kbd_backlight\n");
> -		return false;
> -	}
> -
> -	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
> -				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
> -	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> -	if (ret)
> -		return false;
> -
> -	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> -}
> -
>   static int asus_kbd_register_leds(struct hid_device *hdev)
>   {
>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> @@ -599,14 +557,12 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>   	drvdata->kbd_backlight->removed = false;
>   	drvdata->kbd_backlight->brightness = 0;
>   	drvdata->kbd_backlight->hdev = hdev;
> -	drvdata->kbd_backlight->cdev.name = "asus::kbd_backlight";
> -	drvdata->kbd_backlight->cdev.max_brightness = 3;
> -	drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
> -	drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
> +	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
>   	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
>   	spin_lock_init(&drvdata->kbd_backlight->lock);
>   
> -	ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
> +	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
> +
>   	if (ret < 0) {
>   		/* No need to have this still around */
>   		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> @@ -1000,7 +956,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
>   
>   	if (drvdata->kbd_backlight) {
>   		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
> -				drvdata->kbd_backlight->cdev.brightness };
> +				drvdata->kbd_backlight->brightness };
>   		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>   		if (ret < 0) {
>   			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> @@ -1139,7 +1095,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   	}
>   
>   	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> -	    !asus_kbd_wmi_led_control_present(hdev) &&
>   	    asus_kbd_register_leds(hdev))
>   		hid_warn(hdev, "Failed to initialize backlight.\n");
>   
> @@ -1180,6 +1135,8 @@ static void asus_remove(struct hid_device *hdev)
>   	unsigned long flags;
>   
>   	if (drvdata->kbd_backlight) {
> +		asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
> +
>   		spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
>   		drvdata->kbd_backlight->removed = true;
>   		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);

Reviewed-by: Luke D. Jones <luke@ljones.dev>

