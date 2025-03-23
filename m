Return-Path: <linux-input+bounces-11110-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A804DA6CD5F
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 01:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC5B1755BE
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A6A17E;
	Sun, 23 Mar 2025 00:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="ope/CtZz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="naDFG9Z0"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3520BDDC3;
	Sun, 23 Mar 2025 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742688419; cv=none; b=QXjejLnn1dIwHrY7c7/53GLJjP3VHjyhtOikoGkV+aXFofQy0d1UN12bUgihh5cpd9dFiBixsNLKhASBZcVr0YI/YXsPZPg1TSo5v8wLyFC4yBuuktBKIgNydjROoWhU/1QG5XGRgQUJTeNSuRhB7VnFyoF+NY3asHyL2RpFq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742688419; c=relaxed/simple;
	bh=lhUrfd8H6vHi6di/rHRJyMzjmW3AgYZF8Dgxcwvuct4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eheHblvqSc4BRGDoWzvSsrEwlB5ch29HMUEUUKDKQC21kFVQSeYwJkAE2/XJN8BhfzQk4BxIFacix4EKTYCPQH8iZdUpriB7lUCfqpyCiQ/a6RkTpmdmuf+5XYxo2Xhdk8Uta3e0fQsN4fSKTDaRsdkuNRd5ZC7tqgnMT+tYjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=ope/CtZz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=naDFG9Z0; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 14B7E254010A;
	Sat, 22 Mar 2025 20:06:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 22 Mar 2025 20:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742688416;
	 x=1742774816; bh=hfhgSi68xCvi9/zFuvQNpTE36G5ISlwOobkM2E1Lq24=; b=
	ope/CtZzBW3SCjhOGaf4Jk4X8uVUeFFCTi4q8DoG3LxMiFMLExSFKj6FmyLrw5wE
	UMHftoglxqTQjQw8+rEgWMhk9UZhpmyTZ6JLUAddNJtYY93bdmx92kxKhHlNsepe
	yeBoRYahaG6/ZJMnT2eXayhOg1GqhNLF0Qzw2s8F+DPBRxhu1l5BRFDeII4eDchy
	AmJrmNzxxsXt605R2a61Wf5gjsrzL5pXPvFgsV6BrjyfPC2/WQW697pimo45lhUJ
	seO4N13F0Nzei0uCSQKiqWp2WS+t5CGm59lkRed9BO9eUp9VjcE4boed0b/keMqT
	PxT44DjJietjiWK2QRORNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742688416; x=
	1742774816; bh=hfhgSi68xCvi9/zFuvQNpTE36G5ISlwOobkM2E1Lq24=; b=n
	aDFG9Z0PnyC3/MzPVdPA1+D5FIsBAOPOualaW29D1huidzfaShkecZvoxC1S0H1c
	+6c+U9623HMb9cklengdnRRBWcfZ9kGMyf4jttGp5t+3vjm1dNMEknYlP7IdOmlq
	R8F+zXY08nhaQlXtkoNfWTqkrEhpMKHdU/8oZbPKxVsEC5wCZabd2RT1KflbyDIn
	WkVAwa36OT7F6NaowTHUN0fgoI13skoYgf8V8F/ambxiov5tEqmLiIlAY93mgVIg
	w33K7q6TWwmBhNEVd53c3PGvWfOHDLDE1p4Y3fORCkltPtRMKyMIDwPUWwKwtwzL
	Cy1TopWNiZY+tDq8tHExA==
X-ME-Sender: <xms:oFDfZ9mwI55E7Z-WYSNu7aSW5ZUZddMUJwwkceK4-HhWJ-ewR32WFQ>
    <xme:oFDfZ41eF-QgLRaJJuVcCcBowYcDOm4zliXlS09rUlDn85GvnAmlFClVyw9moeUnU
    vdOOQENCvFptniX9SA>
X-ME-Received: <xmr:oFDfZzpIQoRvCWZKcStjVt4FSQcFWTUYi4lKTt0a80XX-JwXMKWYAoFyyPAh8BzyH9SRhrTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehfeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:oFDfZ9lIeAPGwdZ8LpgWWQjP4iVJgE54-XbU81FWWBNE5mC1-xHzlg>
    <xmx:oFDfZ72--R2ZpaFqelKHz7rS6qgWEGfDJ1M2ROZv0MW5vOnGpkLR7w>
    <xmx:oFDfZ8ug1mEknWouTmtjXfnLT3p-CvV0H22gX6yuQJToJQcGDZyK3Q>
    <xmx:oFDfZ_VpmjSWXgeJ35XwlqqPjKI81mfH-F6GdTNYc4zpwoLirGtGXQ>
    <xmx:oFDfZ0KzW8vslfmHKg7WTdRxEY3bm41hdx0Is39icA3lW7Y37jNptdEx>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 20:06:53 -0400 (EDT)
Message-ID: <a43a24e7-c86c-41d4-863d-686df5224913@ljones.dev>
Date: Sun, 23 Mar 2025 13:06:51 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-8-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-8-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:28, Antheas Kapenekakis wrote:
> Currenlty, the keyboard brightness control of Asus WMI keyboards is
> handled in the kernel, which leads to the shortcut going from
> brightness 0, to 1, to 2, and 3.
> 
> However, for HID keyboards it is exposed as a key and handled by the
> user's desktop environment. For the toggle button, this means that
> brightness control becomes on/off. In addition, in the absence of a
> DE, the keyboard brightness does not work.
> 
> Therefore, expose an event handler for the keyboard brightness control
> which can then be used by hid-asus.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/asus-wmi.c            | 39 ++++++++++++++++++++++
>   include/linux/platform_data/x86/asus-wmi.h | 11 ++++++
>   2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 95ef9b1d321bb..5ebe141294ecf 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1536,6 +1536,45 @@ void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
>   }
>   EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
>   
> +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
> +
> +int asus_hid_event(enum asus_hid_event event)
> +{
> +	unsigned long flags;
> +	int brightness;
> +
> +	spin_lock_irqsave(&asus_ref.lock, flags);
> +	if (!asus_ref.asus || !asus_ref.asus->kbd_led_registered) {
> +		spin_unlock_irqrestore(&asus_ref.lock, flags);
> +		return -EBUSY;
> +	}
> +	brightness = asus_ref.asus->kbd_led_wk;
> +
> +	switch (event) {
> +	case ASUS_EV_BRTUP:
> +		brightness += 1;
> +		break;
> +	case ASUS_EV_BRTDOWN:
> +		brightness -= 1;
> +		break;
> +	case ASUS_EV_BRTTOGGLE:
> +		if (brightness >= 3)
> +			brightness = 0;
> +		else
> +			brightness += 1;
> +		break;
> +	}
> +
> +	do_kbd_led_set(&asus_ref.asus->kbd_led, brightness);
> +	led_classdev_notify_brightness_hw_changed(&asus_ref.asus->kbd_led,
> +						  asus_ref.asus->kbd_led_wk);
> +
> +	spin_unlock_irqrestore(&asus_ref.lock, flags);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_event);
> +
>   /*
>    * These functions actually update the LED's, and are called from a
>    * workqueue. By doing this as separate work rather than when the LED
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index c513b5a732323..9adbe8abef090 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -162,11 +162,18 @@ struct asus_hid_listener {
>   	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
>   };
>   
> +enum asus_hid_event {
> +	ASUS_EV_BRTUP,
> +	ASUS_EV_BRTDOWN,
> +	ASUS_EV_BRTTOGGLE,
> +};
> +
>   #if IS_REACHABLE(CONFIG_ASUS_WMI)
>   int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>   
>   int asus_hid_register_listener(struct asus_hid_listener *cdev);
>   void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> +int asus_hid_event(enum asus_hid_event event);
>   #else
>   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>   					   u32 *retval)
> @@ -181,6 +188,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
>   static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
>   {
>   }
> +static inline int asus_hid_event(enum asus_hid_event event)
> +{
> +	return -ENODEV;
> +}
>   #endif
>   
>   #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */


Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>

