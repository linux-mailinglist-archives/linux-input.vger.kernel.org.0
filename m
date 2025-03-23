Return-Path: <linux-input+bounces-11126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07980A6D112
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 21:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 627BA16C7A5
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 20:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E140919C54A;
	Sun, 23 Mar 2025 20:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="h1vJfn/7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TsSTu5jC"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC64136E;
	Sun, 23 Mar 2025 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742762368; cv=none; b=hclic/gHHdS4lKwJrUSY0w76X3681KVE2+IzeVdGUnO+YQHE+C4iNJPSMBlnUEXZyMtgMdDEsvTR6dgwthIJaVRktilwJjPB8ik7Q5E5YYpzUuzdcva+E5Lfc/rfi3GapVmBrVJLcXK0mjj/dQwuLEnv2zY4Z15dUzNbHIMetvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742762368; c=relaxed/simple;
	bh=0e7vfa7/eaBWAb3Onc60Bw1a2L/d26cBWFEDO26huos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJXLoO4Fx5vrWdWQBtpSYMbVfia6hCJd/K1NZBcHgICVQRLtkNDp1+RRHQh++zVxdECyV1PZacgpWWPj+0eGrv0WVG4jBxG+Bc1ZvBQm9shldpxG5cteX2meRLANHekrYjWEJpqBbcy73dwdFAEcG/94CUF/fVukrNNDFBCEMQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=h1vJfn/7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TsSTu5jC; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9C3112540150;
	Sun, 23 Mar 2025 16:39:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 23 Mar 2025 16:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742762364;
	 x=1742848764; bh=QbU6nT5MOPfr/Omnn6a5IIfDp7GGEivGuHww4zSp+D0=; b=
	h1vJfn/7E0rXK1dRsecwdHuvqHLQ3n0f0iQN4ZNA8lnXPzEnMCwHKJwujuWqu155
	/p+GOp1yTz/k9kqa8Pml/oY/Ct9P7J96/YNgoe88iFCJeq8sSM5yvFMgcWPdEEvW
	lmyShbNEcICeh72Nw+C/7u83lLE/ExRd6yy1BpDGmQOmUZTHg2T+BkiQbeueyjer
	OvvzD7EWTFXd0/GJ66i+PXU3zP/HVUgkCeArNN4ubtYWkrET3BJcwiDnUgnSyh+3
	97boYwAxo+iiXj2eoeJ7FHFipy2qDGEwn3FRfZ2eTomaXuvsCOof3Ob28cr0ODdT
	mxcxxz6CeAVoRxKbhjKWKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742762364; x=
	1742848764; bh=QbU6nT5MOPfr/Omnn6a5IIfDp7GGEivGuHww4zSp+D0=; b=T
	sSTu5jCEgerISeMFXZAAQVDQIQOd0GOKmx/tWTr0Hoc0ofEMBk/nPsFXtvkC9aE9
	TI0wPlyClmbO+rbAHK6+Fo2X8fuVh9S23/D+GYFq/8EgFlhbbC8501L9Wn5pb/CG
	7VTFX8EfeSj6PmKgBERct+1VagLNDKKeZK0BOW1YwOHh7/PClRLwx4bp7HvwoTZN
	5niOpga2+x2H2GdU26v4rPOdXtKDIHYkYRqcZQ3I0J55gSueHrgMNT7hdiKRU6zf
	v9TeCWSfurSbNB19IHWvjONq/oQmGzGdO69yr56V7Dw+tZdSy/7s+jEqbZeSxuo/
	CwY3U2EG7DvADoBIGAaUA==
X-ME-Sender: <xms:fHHgZ-xjaJMy_F5ZsJvGtuurJ0NDCThJZIoMuBF_5t3eeaEseRWpUQ>
    <xme:fHHgZ6Svvpq53VAvwb6KnFAOs0VYkND1Y_Zwob9049se_-h2CS2zOAzgrWB3UfxHb
    cLdj0TLYCkXm_y-1Es>
X-ME-Received: <xmr:fHHgZwV5jk_1PloGWm-H4Ki-Vi8FIp1iY5LVuO-9VuRtADS7Lml0Vb7k67CDfdytvKAj-Hs_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheejkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepjeelteffieehueduvddvjeejgfekjeeh
    heevkeeiieejvdfhfeeluefggedvfeefnecuffhomhgrihhnpehlvggupggtuggvvhdrnh
    grmhgvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    lhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthhgvrghsrdguvghvpdhrtghpthht
    ohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    sggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgvnhhtihhnrd
    gthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvggu
    hhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrd
    hinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:fHHgZ0hx4wtbjR9I-oyd8owwe1gPt7EEG4rsOJLQGSfdHmGvH19MsQ>
    <xmx:fHHgZwCwQYJpjfk5O8mbOLggzKNGrYiO92izaXVrQ5L_Z1wKa0lGZQ>
    <xmx:fHHgZ1KM_joQV2kJLvyF6PTwvk6h_cfeShq7i_HMBE24W1cj5WwT1Q>
    <xmx:fHHgZ3D8qLpdVvLqqYopdoBhDwVMtNgNYvuCjYO6Aao0WI-D92GqnA>
    <xmx:fHHgZ82sET51m2u57cQkRIqZxqwB2eZiDXpIYzkcQsp2z_eGh6PVuE69>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 16:39:20 -0400 (EDT)
Message-ID: <7796b0dc-22a4-40d5-a55b-64969283761c@ljones.dev>
Date: Mon, 24 Mar 2025 09:39:18 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] HID: asus: add basic RGB support
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-10-lkml@antheas.dev>
 <bb3071d4-7910-46c2-ab48-aed574bcd758@ljones.dev>
 <CAGwozwFZAenLmmDC8tVChQMfzHo7NVuxOeqVmE9OVfY+-tAByA@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwFZAenLmmDC8tVChQMfzHo7NVuxOeqVmE9OVfY+-tAByA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/03/25 00:37, Antheas Kapenekakis wrote:
> On Sun, 23 Mar 2025 at 07:40, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 22/03/25 23:28, Antheas Kapenekakis wrote:
>>> Adds basic RGB support to hid-asus through multi-index. The interface
>>> works quite well, but has not gone through much stability testing.
>>> Applied on demand, if userspace does not touch the RGB sysfs, not
>>> even initialization is done. Ensuring compatibility with existing
>>> userspace programs.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/hid/hid-asus.c | 169 +++++++++++++++++++++++++++++++++++++----
>>>    1 file changed, 155 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 905453a4eb5b7..9d8ccfde5912e 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -30,6 +30,7 @@
>>>    #include <linux/input/mt.h>
>>>    #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
>>>    #include <linux/power_supply.h>
>>> +#include <linux/led-class-multicolor.h>
>>>    #include <linux/leds.h>
>>>
>>>    #include "hid-ids.h"
>>> @@ -85,6 +86,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>    #define QUIRK_ROG_NKEY_KEYBOARD             BIT(11)
>>>    #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>>>    #define QUIRK_HANDLE_GENERIC                BIT(13)
>>> +#define QUIRK_ROG_NKEY_RGB           BIT(14)
>>>
>>>    #define I2C_KEYBOARD_QUIRKS                 (QUIRK_FIX_NOTEBOOK_REPORT | \
>>>                                                 QUIRK_NO_INIT_REPORTS | \
>>> @@ -97,9 +99,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>
>>>    struct asus_kbd_leds {
>>>        struct asus_hid_listener listener;
>>> +     struct led_classdev_mc mc_led;
>>> +     struct mc_subled subled_info[3];
>>>        struct hid_device *hdev;
>>>        struct work_struct work;
>>>        unsigned int brightness;
>>> +     uint8_t rgb_colors[3];
>>> +     bool rgb_init;
>>> +     bool rgb_set;
>>> +     bool rgb_registered;
>>>        spinlock_t lock;
>>>        bool removed;
>>>    };
>>> @@ -504,23 +512,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>>>        spin_unlock_irqrestore(&led->lock, flags);
>>>    }
>>>
>>> -static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
>>> +static void do_asus_kbd_backlight_set(struct asus_kbd_leds *led, int brightness)
>>> +{
>>> +     unsigned long flags;
>>> +
>>> +     spin_lock_irqsave(&led->lock, flags);
>>> +     led->brightness = brightness;
>>> +     spin_unlock_irqrestore(&led->lock, flags);
>>> +
>>> +     asus_schedule_work(led);
>>> +}
>>> +
>>> +static void asus_kbd_listener_set(struct asus_hid_listener *listener,
>>>                                   int brightness)
>>>    {
>>>        struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
>>>                                                 listener);
>>> +     do_asus_kbd_backlight_set(led, brightness);
>>> +     if (led->rgb_registered) {
>>> +             led->mc_led.led_cdev.brightness = brightness;
>>> +             led_classdev_notify_brightness_hw_changed(&led->mc_led.led_cdev,
>>> +                                                       brightness);
>>> +     }
>>> +}
>>> +
>>> +static void asus_kbd_brightness_set(struct led_classdev *led_cdev,
>>> +                                 enum led_brightness brightness)
>>> +{
>>> +     struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
>>> +     struct asus_kbd_leds *led = container_of(mc_cdev, struct asus_kbd_leds,
>>> +                                              mc_led);
>>>        unsigned long flags;
>>>
>>>        spin_lock_irqsave(&led->lock, flags);
>>> -     led->brightness = brightness;
>>> +     led->rgb_colors[0] = mc_cdev->subled_info[0].intensity;
>>> +     led->rgb_colors[1] = mc_cdev->subled_info[1].intensity;
>>> +     led->rgb_colors[2] = mc_cdev->subled_info[2].intensity;
>>> +     led->rgb_set = true;
>>>        spin_unlock_irqrestore(&led->lock, flags);
>>>
>>> -     asus_schedule_work(led);
>>> +     do_asus_kbd_backlight_set(led, brightness);
>>> +}
>>> +
>>> +static enum led_brightness asus_kbd_brightness_get(struct led_classdev *led_cdev)
>>> +{
>>> +     struct led_classdev_mc *mc_led;
>>> +     struct asus_kbd_leds *led;
>>> +     enum led_brightness brightness;
>>> +     unsigned long flags;
>>> +
>>> +     mc_led = lcdev_to_mccdev(led_cdev);
>>> +     led = container_of(mc_led, struct asus_kbd_leds, mc_led);
>>> +
>>> +     spin_lock_irqsave(&led->lock, flags);
>>> +     brightness = led->brightness;
>>> +     spin_unlock_irqrestore(&led->lock, flags);
>>> +
>>> +     return brightness;
>>>    }
>>>
>>> -static void asus_kbd_backlight_work(struct work_struct *work)
>>> +static void asus_kbd_backlight_work(struct asus_kbd_leds *led)
>>>    {
>>> -     struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
>>>        u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
>>>        int ret;
>>>        unsigned long flags;
>>> @@ -534,10 +586,69 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>>>                hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>>>    }
>>>
>>> +static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
>>> +{
>>> +     u8 rgb_buf[][7] = {
>>> +             { FEATURE_KBD_LED_REPORT_ID1, 0xB3 }, /* set mode */
>>> +             { FEATURE_KBD_LED_REPORT_ID1, 0xB5 }, /* apply mode */
>>> +             { FEATURE_KBD_LED_REPORT_ID1, 0xB4 }, /* save to mem */
>>> +     };
>>> +     unsigned long flags;
>>> +     uint8_t colors[3];
>>> +     bool rgb_init, rgb_set;
>>> +     int ret;
>>> +
>>> +     spin_lock_irqsave(&led->lock, flags);
>>> +     rgb_init = led->rgb_init;
>>> +     rgb_set = led->rgb_set;
>>> +     led->rgb_set = false;
>>> +     colors[0] = led->rgb_colors[0];
>>> +     colors[1] = led->rgb_colors[1];
>>> +     colors[2] = led->rgb_colors[2];
>>> +     spin_unlock_irqrestore(&led->lock, flags);
>>> +
>>> +     if (!rgb_set)
>>> +             return;
>>> +
>>> +     if (rgb_init) {
>>> +             ret = asus_kbd_init(led->hdev, FEATURE_KBD_LED_REPORT_ID1);
>>> +             if (ret < 0) {
>>> +                     hid_err(led->hdev, "Asus failed to init RGB: %d\n", ret);
>>> +                     return;
>>> +             }
>>> +             spin_lock_irqsave(&led->lock, flags);
>>> +             led->rgb_init = false;
>>> +             spin_unlock_irqrestore(&led->lock, flags);
>>> +     }
>>> +
>>> +     /* Protocol is: 54b3 zone (0=all) mode (0=solid) RGB */
>>> +     rgb_buf[0][4] = colors[0];
>>> +     rgb_buf[0][5] = colors[1];
>>> +     rgb_buf[0][6] = colors[2];
>>> +
>>> +     for (size_t i = 0; i < ARRAY_SIZE(rgb_buf); i++) {
>>> +             ret = asus_kbd_set_report(led->hdev, rgb_buf[i], sizeof(rgb_buf[i]));
>>> +             if (ret < 0) {
>>> +                     hid_err(led->hdev, "Asus failed to set RGB: %d\n", ret);
>>> +                     return;
>>> +             }
>>> +     }
>>> +}
>>> +
>>> +static void asus_kbd_work(struct work_struct *work)
>>> +{
>>> +     struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds,
>>> +                                              work);
>>> +     asus_kbd_backlight_work(led);
>>> +     asus_kbd_rgb_work(led);
>>> +}
>>> +
>>>    static int asus_kbd_register_leds(struct hid_device *hdev)
>>>    {
>>>        struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>>>        unsigned char kbd_func;
>>> +     struct asus_kbd_leds *leds;
>>> +     bool no_led;
>>>        int ret;
>>>
>>>        ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>> @@ -565,21 +676,51 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>        if (!drvdata->kbd_backlight)
>>>                return -ENOMEM;
>>>
>>> -     drvdata->kbd_backlight->removed = false;
>>> -     drvdata->kbd_backlight->brightness = 0;
>>> -     drvdata->kbd_backlight->hdev = hdev;
>>> -     drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
>>> -     INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
>>> +     leds = drvdata->kbd_backlight;
>>> +     leds->removed = false;
>>> +     leds->brightness = 3;
>>> +     leds->hdev = hdev;
>>> +     leds->listener.brightness_set = asus_kbd_listener_set;
>>> +
>>> +     leds->rgb_colors[0] = 0;
>>> +     leds->rgb_colors[1] = 0;
>>> +     leds->rgb_colors[2] = 0;
>>> +     leds->rgb_init = true;
>>> +     leds->rgb_set = false;
>>> +     leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
>>> +                                     "asus-%s-led",
>>> +                                     strlen(hdev->uniq) ?
>>> +                                     hdev->uniq : dev_name(&hdev->dev));
>>
>> A quick note. This breaks convention for LED names. The style guide is
>> at Documentation/leds/leds-class.rst. Per my parallel email to this one
>> I would like to see the mentioned naming scheme `asus:rgb:kbd_backlight`
>> adopted.
> 
> Perhaps. It would be the first kbd_backlight driver to have "rgb" in
> it. It is a bit out of scope for this series as I do not touch the
> functionality of it but I can add a patch for it and a fixes
> e305a71cea37a64c75 tag.
> 

Your proposal for naming in other reply is good :)
If the intent is to keep 0-3 brightness and RGB controls separated the 
kbd_backlight doesn't need adjustment in naming, particularly if the RGB 
is *not* inside `asus:rgb:kbd_backlight`.

>> Expanding further on one of the points there you might need to
>> move the led_classdev_mc in to asus-wmi to fulfil having the single
>> sysfs endpoint. Since you're using the listner pattern it shouldn't be
>> much work.
> 
> I only want the brightness to sync, not the color. Only the brightness
> between Aura devices needs to be the same. In this case
> asus::kbd_backlight if it has a color controls the wmi color, and the
> asus- devices control the usb.
> 

Hmm, what about multicolour brightness? Otherwise yeah, understood and 
I'm fine with that. Given you now ustilise the kbd_dill<up/down> 
directly I don't see any issues there either.

> Also, groups are not dynamic so this is not possible. E.g., if you
> setup a WMI listener that does not have RGB, and then the USB keyboard
> connects you can no longer change the groups unless you reconnect the
> device.

That's a shame. Oh well.

I would have preferred RGB and brightness combined. At a glance I would 
have stored RGB in a global or similar, then if a listener has mcled 
available that value would be applied.

But userpsace should be using udev libs and similar to find devices like 
this, so naming is more of a hint alongside the attributes. Meaning name 
changes or including mcled inside standard led shouldn't break things. 
Neither should keeping them separated as you have.

Apologies for the bikeshedding on this. I had been reluctant to add RGB 
myself for a number of reasons:

1. Windows uses LampArray for the dynamic LED (new)
2. Otherwise you need to use MCU software mode, that's what that mode is for
3. I don't know of a capabilities request for MCU software mode
4. Or you're forced to set MCU mode static/solid
5. Single colour keybaords vs RGB, on same PID :(

I considered adding attributes to mcled in sysfs for 
mode/speed/direction. But then I had to add an enourmous table of 
modes-per-model.

At the end of the day I think your solution is fine and we don't have 
much other choice beyond trying to introduce a new API better suited for 
RGB keyboards with many features. I suspect it will also be fine for 
other laptops since the mode is set on write to RGB, so hidraw is still 
open to userspace.

With the other changes in place I'll experiment a little with the 
laptops I have and see how it works. I have two that i will need to 
check HID and WMI on even though it's not an issue for the Z13 and Ally, 
it might highlight any pain points and improve things further. Could be 
a few days, or coming weekend sorry, I've got a massive amount of work 
on, besides my own kernel patches.

Cheers,
Luke.

>>> +     leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
>>> +     leds->mc_led.led_cdev.max_brightness = 3,
>>> +     leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set,
>>> +     leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get,
>>> +     leds->mc_led.subled_info = leds->subled_info,
>>> +     leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info),
>>> +     leds->subled_info[0].color_index = LED_COLOR_ID_RED;
>>> +     leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
>>> +     leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
>>> +
>>> +     INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
>>>        spin_lock_init(&drvdata->kbd_backlight->lock);
>>>
>>>        ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
>>> +     no_led = !!ret;
>>> +
>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
>>> +             ret = devm_led_classdev_multicolor_register(
>>> +                     &hdev->dev, &leds->mc_led);
>>> +             if (!ret)
>>> +                     leds->rgb_registered = true;
>>> +             no_led &= !!ret;
>>> +     }
>>>
>>> -     if (ret < 0) {
>>> +     if (no_led) {
>>>                /* No need to have this still around */
>>>                devm_kfree(&hdev->dev, drvdata->kbd_backlight);
>>>        }
>>>
>>> -     return ret;
>>> +     return no_led ? -ENODEV : 0;
>>>    }
>>>
>>>    /*
>>> @@ -1289,7 +1430,7 @@ static const struct hid_device_id asus_devices[] = {
>>>          QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>            USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>            USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
>>>          QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>> @@ -1318,7 +1459,7 @@ static const struct hid_device_id asus_devices[] = {
>>>         */
>>>        { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>>>                USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>>>        { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>>>                USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
>>>        { }
>>


