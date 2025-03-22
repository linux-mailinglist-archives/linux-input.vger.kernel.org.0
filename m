Return-Path: <linux-input+bounces-11077-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2EA6C86D
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 09:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33BDC7A18D1
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D641DDC1B;
	Sat, 22 Mar 2025 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="TsK1eplF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IeyR8mNq"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B601940A1;
	Sat, 22 Mar 2025 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742633856; cv=none; b=u/mhvfUCq7h+/o0cwkDZI2p75MBPGoW+ifjJKWqFFGVkctW5yOkAslthc093WSRLvA8Qs2L6tJ7hRrlSjmWdGluN8AreBxU2EVybiw66O9nftNnqmC/RUDw7423dgZJkLDeapq8BB3XX4kwC7trnIo3KCqtg9J+kRZsWDZB7rHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742633856; c=relaxed/simple;
	bh=+hCzaX8YHRvYwcs3aTpG5kmW0qINnPRqHjxFOYvv8ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/FkBPbOZ6EZBxnFB0IuGC+0mFt+7e2YDOpmTRveSg/v7YjvsDKw9hhI3ih2At4E1xidGBk4d3d9ptYXJkVGCpyCRcUjI6MMPscPYa9j5uHHiqnHv4Z9daCkOr2L87cI7nam6Idmok2dQsMhw8gTMPhjc6MXyqB1BFz0WuUX2XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=TsK1eplF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IeyR8mNq; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E1C9925400FC;
	Sat, 22 Mar 2025 04:57:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 22 Mar 2025 04:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742633852;
	 x=1742720252; bh=m2fFyt15VdVD/zzdAZ51qj6gZJ0+m9dFP7gSQufF9ws=; b=
	TsK1eplFJfxGQ8Gt+4jEfhLTdAQiWMKQLR53VcP2SprRIG5VfFWSq8i++cRmEAee
	2+ztIlcd1jhm942CXErbD04ZB+sYNHwDvyW+kcG/zY4r1rLOYtTzSvWQDvcucJt1
	JCLFaUyW/ZBwapIQuHOE+FmUaJ5WfIz8qQUp6un3/K3+vlKjJCZvW24tb1s/VPMc
	tr94x8gLhLP/rnivKM8ob5CDrG6z/DmQKRNCTIIXcrBkDRgJaxrsB4TAN1otkyD4
	5nknpMWSx6ij4rAyzFXVEBhcFYd7qPNVxvWW8ev1BYWeE4v0xCkTHnFFEYnZJknK
	Q1JJG/rAf6Gg8MOWesTXJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742633852; x=
	1742720252; bh=m2fFyt15VdVD/zzdAZ51qj6gZJ0+m9dFP7gSQufF9ws=; b=I
	eyR8mNq9MWnCG945/po99eq9kKCiSTPNNqsXnMwO5+w3olQiVPAK/LBhPo+zmNSv
	3WTrUszwy+a+xiEc7KC0lmk1cia84CBYZqP/YFwRIPLan0Sr875OBk0mqr7r9Rc0
	0TtjyRShrnF+Odn62kzoZt4/qOjWrZjqFQvj9GMZzCK9WSy/pQqn1am7rnfemvNe
	8yVf/O6GACWrH/AdR4hqUBo3GQ3832ZGR+Du1iBIgoUy7z0Oh3PwgeM3O3uNNheB
	EytNj4PYGm+4hO2ThffyqMFpRAugSiBml1qq+mEjMJysdnUOoVeZgdJ+QiG/nlm8
	DKj/1CwsUzWSt1GDwubew==
X-ME-Sender: <xms:fHveZ2aLzAaGdxzGCTZPjkGRbwc5tGrawZHEcqhm-ALkozCubSADcQ>
    <xme:fHveZ5YaU-i2JwNFh6cSM5bYAT0hAAIqyoykDbp0OSun2mhuW2XOHHd7o6MNtz70K
    T7U8nSSqrgg4EEHwrk>
X-ME-Received: <xmr:fHveZw9u7SJ8z2qMzjf1c_H-1gqvfe_H3DMDgapyxuQtxadnGCSq83Lcg06seZegUDWJPblP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheefheegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:fHveZ4rCsOwyBXH-ZtSDLpor-pQd91bbVEuoBhD98xaAGsh8n0LTKQ>
    <xmx:fHveZxqVhtUZr3wzChKdaEjp2XYIOr7dd9GZFKsXinUIq9d8EpwH_Q>
    <xmx:fHveZ2R0IVWhJP7Tc9p7xpq7hNjvKOVNDyF0AIdfSMePNVjpevklPQ>
    <xmx:fHveZxr4ncTPNrJt0fgxjNbNwNStWETdsfXpw3JWZTuEpsckhkpr_g>
    <xmx:fHveZ1f4n28oz8kyIiYVh1p-LHNVqP1t_QX7R7mc3rMWGa0dRsQZGo6l>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 04:57:29 -0400 (EDT)
Message-ID: <2557385c-6d00-4f2c-a9d4-53f805ec4424@ljones.dev>
Date: Sat, 22 Mar 2025 21:57:27 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-6-lkml@antheas.dev>
 <d06fbb28-6bec-42ed-a161-2456131ca32a@ljones.dev>
 <CAGwozwEdkLjT30v1GPpVeArVd-SCAp2tvwB9ZK9_xrGHe93Cjw@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwEdkLjT30v1GPpVeArVd-SCAp2tvwB9ZK9_xrGHe93Cjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 21:06, Antheas Kapenekakis wrote:
> On Sat, 22 Mar 2025 at 04:24, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 21/03/25 11:09, Antheas Kapenekakis wrote:
>>> Some devices, such as the Z13 have multiple AURA devices connected
>>> to them by USB. In addition, they might have a WMI interface for
>>> RGB. In Windows, Armoury Crate exposes a unified brightness slider
>>> for all of them, with 3 brightness levels.
>>>
>>> Therefore, to be synergistic in Linux, and support existing tooling
>>> such as UPower, allow adding listeners to the RGB device of the WMI
>>> interface. If WMI does not exist, lazy initialize the interface.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/platform/x86/asus-wmi.c            | 100 ++++++++++++++++++---
>>>    include/linux/platform_data/x86/asus-wmi.h |  16 ++++
>>>    2 files changed, 104 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>> index 38ef778e8c19b..21e034be71b2f 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -254,6 +254,8 @@ struct asus_wmi {
>>>        int tpd_led_wk;
>>>        struct led_classdev kbd_led;
>>>        int kbd_led_wk;
>>> +     bool kbd_led_avail;
>>> +     bool kbd_led_registered;
>>>        struct led_classdev lightbar_led;
>>>        int lightbar_led_wk;
>>>        struct led_classdev micmute_led;
>>> @@ -1487,6 +1489,46 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
>>>
>>>    /* LEDs ***********************************************************************/
>>>
>>> +LIST_HEAD(asus_brt_listeners);
>>> +DEFINE_MUTEX(asus_brt_lock);
>>> +struct asus_wmi *asus_brt_ref;
>>
>> Could these 3 items contained in a new static struct, it would make it
>> easier to see the associations since they're a group.
> 
> My V0 tried something like that, but it was messy. I will think about
> it for V4. Let's do that when we decide the name as it will be hairy
> to rebase both of those and I want to do it once.
> 
>>> +int asus_brt_register_listener(struct asus_brt_listener *bdev)
>>> +{
>>> +     int ret;
>>> +
>>> +     mutex_lock(&asus_brt_lock);
>>> +     list_add_tail(&bdev->list, &asus_brt_listeners);
>>> +     if (asus_brt_ref) {
>>
>> ret is not initialised if this is false
> 
> I already fixed that for V3.
> 
>>> +             if (asus_brt_ref->kbd_led_registered && asus_brt_ref->kbd_led_wk >= 0)
> 
> This nested && is a bug, I will fix that if I havent. We might end up
> initializing twice.
> 
>>> +                     bdev->notify(bdev, asus_brt_ref->kbd_led_wk);
>>> +             else {
>>> +                     asus_brt_ref->kbd_led_registered = true;
>>> +                     ret = led_classdev_register(
>>> +                             &asus_brt_ref->platform_device->dev,
>>> +                             &asus_brt_ref->kbd_led);
>>> +             }
> 
> (2) If asus_wmi launched already before the usb devices but did not
> support RGB, kbd_led_registered will be false but the struct will be
> initialized. Therefore, we register the device here, and all works.
> 
>>> +     }
>>> +     mutex_unlock(&asus_brt_lock);
>>> +
>>> +     return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(asus_brt_register_listener);
>>> +
>>> +void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
>>> +{
>>> +     mutex_lock(&asus_brt_lock);
>>> +     list_del(&bdev->list);
>>> +
>>> +     if (asus_brt_ref && asus_brt_ref->kbd_led_registered &&
>>> +         list_empty(&asus_brt_listeners) && !asus_brt_ref->kbd_led_avail) {
>>> +             led_classdev_unregister(&asus_brt_ref->kbd_led);
>>> +             asus_brt_ref->kbd_led_registered = false;
>>> +     }
>>> +     mutex_unlock(&asus_brt_lock);
>>> +}
>>> +EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
>>> +
>>>    /*
>>>     * These functions actually update the LED's, and are called from a
>>>     * workqueue. By doing this as separate work rather than when the LED
>>> @@ -1566,6 +1608,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>>>
>>>    static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>>>    {
>>> +     struct asus_brt_listener *listener;
>>>        struct asus_wmi *asus;
>>>        int max_level;
>>>
>>> @@ -1573,7 +1616,12 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>>>        max_level = asus->kbd_led.max_brightness;
>>>
>>>        asus->kbd_led_wk = clamp_val(value, 0, max_level);
>>> -     kbd_led_update(asus);
>>> +
>>> +     if (asus->kbd_led_avail)
>>> +             kbd_led_update(asus);
>>> +
>>> +     list_for_each_entry(listener, &asus_brt_listeners, list)
>>> +             listener->notify(listener, asus->kbd_led_wk);
>>>    }
>>>
>>>    static void kbd_led_set(struct led_classdev *led_cdev,
>>> @@ -1583,15 +1631,21 @@ static void kbd_led_set(struct led_classdev *led_cdev,
>>>        if (led_cdev->flags & LED_UNREGISTERING)
>>>                return;
>>>
>>> +     mutex_lock(&asus_brt_lock);
>>>        do_kbd_led_set(led_cdev, value);
>>> +     mutex_unlock(&asus_brt_lock);
>>>    }
>>>
>>>    static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
>>>    {
>>> -     struct led_classdev *led_cdev = &asus->kbd_led;
>>> +     struct led_classdev *led_cdev;
>>> +
>>> +     mutex_lock(&asus_brt_lock);
>>> +     led_cdev = &asus->kbd_led;
>>>
>>>        do_kbd_led_set(led_cdev, value);
>>>        led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
>>> +     mutex_unlock(&asus_brt_lock);
>>>    }
>>>
>>>    static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>>> @@ -1601,6 +1655,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>>>
>>>        asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>>>
>>> +     if (!asus->kbd_led_avail)
>>> +             return asus->kbd_led_wk;
>>> +
>>>        retval = kbd_led_read(asus, &value, NULL);
>>>        if (retval < 0)
>>>                return retval;
>>> @@ -1716,7 +1773,12 @@ static int camera_led_set(struct led_classdev *led_cdev,
>>>
>>>    static void asus_wmi_led_exit(struct asus_wmi *asus)
>>>    {
>>> -     led_classdev_unregister(&asus->kbd_led);
>>> +     mutex_lock(&asus_brt_lock);
>>> +     asus_brt_ref = NULL;
>>> +     if (asus->kbd_led_registered)
>>> +             led_classdev_unregister(&asus->kbd_led);
>>> +     mutex_unlock(&asus_brt_lock);
>>> +
>>>        led_classdev_unregister(&asus->tpd_led);
>>>        led_classdev_unregister(&asus->wlan_led);
>>>        led_classdev_unregister(&asus->lightbar_led);
>>> @@ -1730,6 +1792,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
>>>    static int asus_wmi_led_init(struct asus_wmi *asus)
>>>    {
>>>        int rv = 0, num_rgb_groups = 0, led_val;
>>> +     bool has_listeners;
>>>
>>>        if (asus->kbd_rgb_dev)
>>>                kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
>>> @@ -1754,24 +1817,37 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>>>                        goto error;
>>>        }
>>>
>>> -     if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
>>> -             pr_info("using asus-wmi for asus::kbd_backlight\n");
>>
>> Okay so part of the reason the asus_use_hid_led_dmi_ids table was
>> created is that some of those laptops had both WMI method, and HID
>> method. The WMI method was given priority but on those laptops it didn't
>> actually work. What was done was a sort of "blanket" use-hid. I don't
>> know why ASUS did this.
>>
>>> +     asus->kbd_led.name = "asus::kbd_backlight";
>>
>> I'd like to see this changed to "asus:rgb:kbd_backlight" if RGB is
>> supported but this might not be so feasible for the bulk of laptops.
>> Given that the Z13 is using a new PID it may be okay there...
> 
> So for the Z13 it is not rgb, this is used just as the common
> backlight handler for all rgb devices, so there is no multi-intensity.
> The only devices that would be good for would be for those where
> kbd_rgb_dev exists, and as this series tries to not affect them,
> changing the name is out of scope.
> 
>>> +     asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>>> +     asus->kbd_led.brightness_set = kbd_led_set;
>>> +     asus->kbd_led.brightness_get = kbd_led_get;
>>> +     asus->kbd_led.max_brightness = 3;
>>> +     asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
>>
>> Per the comment 2x above we will get some laptops returning "yes I
>> support this" even though it doesn't actually work. It raises two
>> questions for me:
>> 1. on machines where it *does* work and they also support HID, do we end
>> up with a race condition?
>> 2. what is the effect of that race?
>>
>> I suspect we might need that quirk table still. Unfortunately I
>> no-longer have a device where the WMI method was broken, but I will test
>> on one 0x1866 device (2019) and a few 0x19b6
>>
>> No other comments.
> 
> We do not need a quirk anymore actually, the endpoint is created on
> demand and there is no race condition. See (1) and (2). I almost gave
> up twice writing this until i figured out how to remove the race
> conditions.
> 
>> Cheers,
>> Luke.
>>
>>> +
>>> +     if (asus->kbd_led_avail)
>>>                asus->kbd_led_wk = led_val;
>>> -             asus->kbd_led.name = "asus::kbd_backlight";
>>> -             asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>>> -             asus->kbd_led.brightness_set = kbd_led_set;
>>> -             asus->kbd_led.brightness_get = kbd_led_get;
>>> -             asus->kbd_led.max_brightness = 3;
>>> +     else
>>> +             asus->kbd_led_wk = -1;
>>> +
>>> +     if (asus->kbd_led_avail && num_rgb_groups != 0)
>>> +             asus->kbd_led.groups = kbd_rgb_mode_groups;
>>>
>>> -             if (num_rgb_groups != 0)
>>> -                     asus->kbd_led.groups = kbd_rgb_mode_groups;
>>> +     mutex_lock(&asus_brt_lock);
>>> +     has_listeners = !list_empty(&asus_brt_listeners);
>>> +     mutex_unlock(&asus_brt_lock);
>>>
>>> +     if (asus->kbd_led_avail || has_listeners) {
>>>                rv = led_classdev_register(&asus->platform_device->dev,
>>>                                           &asus->kbd_led);
>>>                if (rv)
>>>                        goto error;
>>> +             asus->kbd_led_registered = true;
>>>        }
> 
> (1) If asus-wmi launches first and supports the WMI endpoint,
> kbd_led_avail is true so the device is created. If it does not support
> it but there is a usb device, then has_listeners is true so it is
> still created.

The problem is that there are a small group of laptops that report the 
WMI method as supported, but when used it actually does nothing, so they 
need to be quirked. These are the ones that will regress, the GU605M is 
one, I think the ProArt series was another as they use the same build 
base as the GU605.

If both are created then hopefully it's a non-issue since the WMI 
endpoint is a no-op for set. But what about when both HID and WMI work 
and both are created?

>>>
>>> +     mutex_lock(&asus_brt_lock);
>>> +     asus_brt_ref = asus;
>>> +     mutex_unlock(&asus_brt_lock);
>>> +
>>>        if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
>>>                        && (asus->driver->quirks->wapf > 0)) {
>>>                INIT_WORK(&asus->wlan_led_work, wlan_led_update);
>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>> index 783e2a336861b..42e963b70acdb 100644
>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>> @@ -157,14 +157,30 @@
>>>    #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK       0x0000FF00
>>>    #define ASUS_WMI_DSTS_LIGHTBAR_MASK 0x0000000F
>>>
>>> +struct asus_brt_listener {
>>> +     struct list_head list;
>>> +     void (*notify)(struct asus_brt_listener *listener, int brightness);
>>> +};
>>> +
>>>    #if IS_REACHABLE(CONFIG_ASUS_WMI)
>>>    int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>>> +
>>> +int asus_brt_register_listener(struct asus_brt_listener *cdev);
>>> +void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
>>>    #else
>>>    static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>>>                                           u32 *retval)
>>>    {
>>>        return -ENODEV;
>>>    }
>>> +
>>> +static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
>>> +{
>>> +     return -ENODEV;
>>> +}
>>> +static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
>>> +{
>>> +}
>>>    #endif
>>>
>>>    /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
>>


