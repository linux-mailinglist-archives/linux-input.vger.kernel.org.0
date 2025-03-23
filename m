Return-Path: <linux-input+bounces-11113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D150EA6CD8D
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 01:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25BAC3AA3F1
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3592193435;
	Sun, 23 Mar 2025 00:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="gTn8GWBZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eS10uV70"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B453A1922C4;
	Sun, 23 Mar 2025 00:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742688876; cv=none; b=RcaniKF7u6W4iVVOoWC79XJUnpiVLauhInNuZ9tMqOiCCk/TAr5FStBv8uH8p+ermKvGaUZnkuVshhL2Tw3v5lwUzc7ESfFK2DNQZB4bqtVkvj8pH724j0rKe+0GoYIOJlPVNnfgpYHj09LH/xzxC6v6R1p9YGKJuh3spwU1lEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742688876; c=relaxed/simple;
	bh=Tq8QjASQg3Ogp6ZfBz/tiLrh3XTfd+zcYEfMvXxtrJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQeNl8O2WUVh5SYV+BmTcCFgZviBlqnMvbqRh0wiFNENJtxi3f8emkBX0VVC9/H4Hw84KrhGyoir+W6mVSOhlIOsM7e3O1lB1Aa3ZByH898PM42Uj7pevLDjRt64LeoHXCo28qVWtThLaWVBzC6Xo5gRvqCClccw0mlQaflriGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=gTn8GWBZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eS10uV70; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8EC6625400FC;
	Sat, 22 Mar 2025 20:14:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 22 Mar 2025 20:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742688873;
	 x=1742775273; bh=9Nmnk2f5IDWoHM2YAHgFVyYuE9HNtcxsZx7ipX+af3Y=; b=
	gTn8GWBZhqwgVNkZXnYpZduYXgGAyOjfISsTbqGJRbbBvoaT63K+0xkMGkEvaOvC
	/p7TkL/BflFxfixigbUCsyuCjDnAgwaf9Sl59jB1QtKG8AA/u9cqvw0U8Iyed3dQ
	AjGUN+xbyDaIoHNXScfFdVXAmP0ClM4kD8Fo9KCzTMZOH80u4FQZCxEHBJUYGwOP
	RGZ0UlbaM4NOOZIrrN2r5ae9+pC01c+JHpF9gvppGJj95S5utmK73dNptAYHp9MN
	Q8pK6CO1+8eGhhjASyH7YZTUJMUeYAW31a4TaKZGr+97hqrYN4c9NZT1nqSZMY2l
	njsMBXsOp9eWGOl3hlv3Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742688873; x=
	1742775273; bh=9Nmnk2f5IDWoHM2YAHgFVyYuE9HNtcxsZx7ipX+af3Y=; b=e
	S10uV70/J1/Q6N5Lt7ieXx2yQMv9IXm0zwPoJnUgbOxVodiQl5jGL3Wai7QCJuAZ
	1si16pe0mEnzJbO4nh2+trgnQm5cnkQRiSRD8fyDsUbHG4LPxQ/VDjtGHac9f8Dl
	4JaUIGlqJwLq6jG8WpjtkyAL1jAh8IraJRu02J8hRheGuIV5bfBadEUf/axdFAJB
	qGscAK6svD30ztoNYnFRFMWvs+azfbcyyKVzsXoE6GmQk3n46tj9WezwY82z8J7U
	PvMT4tuL9jtHG63hItOhlzYJJHfnvI3GsVfwfs6jPu3+9kajXjHSs1iNdabSXtmz
	4J1W5TkxUzFIniqwL5K6A==
X-ME-Sender: <xms:aVLfZ7oLIPP8A_MOJ0R7HrHsG_RJU4NZlo4qvksCykTwuQCoEFqM_Q>
    <xme:aVLfZ1o2nLJyNi_5TSpv9LMqv1LQHq9RsRwOyhD7SCK73Me7pD-DS0pDhe9lcias0
    iNhN3psmS0A3S9x_vA>
X-ME-Received: <xmr:aVLfZ4NYsIN5OSVPfdQ3MjSzYCEc6UchHDPIAcLDwLt7KcuSwXIm8zBuevsfx83_JLC7RyS5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehfeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:aVLfZ-7NQvmwD7jSpDCugDrXmokAQG9FVHQQCnQVZjVlkuAfwaoq1A>
    <xmx:aVLfZ65GIZ627eZUErbcc2pREBsz05m4pFmi6R6x0pMjTFdHG761CQ>
    <xmx:aVLfZ2gI-sZFGYih6nJMaLAg6cigFhhGhXmfkClsFIczMNF1u6_qJQ>
    <xmx:aVLfZ86VgL6aMdpyDs77ayNPGnbn0w82jj1kz6SRl3FuV7Q6V_xfRQ>
    <xmx:aVLfZ8tngkOimOQgGUP6r4NuVrWCfIpfdjIC6n96rsfqUz39UNMP3JcA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 20:14:29 -0400 (EDT)
Message-ID: <d3e3a37c-4a8c-416a-a1a9-3bbc8830ef40@ljones.dev>
Date: Sun, 23 Mar 2025 13:14:27 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] HID: asus: refactor init sequence per spec
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-2-lkml@antheas.dev>
 <51a02c2f-acf3-4cca-9514-73ca8b6de336@ljones.dev>
 <CAGwozwFa1UgrWKEoAa2TqvvjB=if8UEnPzcfcmAs=yG=XNazsQ@mail.gmail.com>
 <6b8ea775-ab3c-4046-9152-dfe7255387e4@ljones.dev>
 <CAGwozwHqKPrYXKqb0mDP8w5-1LPQ4kQjsk+n76BAyQbM8LV=nw@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwHqKPrYXKqb0mDP8w5-1LPQ4kQjsk+n76BAyQbM8LV=nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/25 12:53, Antheas Kapenekakis wrote:
> On Sun, 23 Mar 2025 at 00:29, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 23/03/25 12:05, Antheas Kapenekakis wrote:
>>> On Sat, 22 Mar 2025 at 23:01, Luke D. Jones <luke@ljones.dev> wrote:
>>>>
>>>> On 22/03/25 23:27, Antheas Kapenekakis wrote:
>>>>> Currently, asus_kbd_init() uses a reverse engineered init sequence
>>>>> from Windows, which contains the handshakes from multiple programs.
>>>>> Keep the main one, which is 0x5a (meant for brightness drivers).
>>>>>
>>>>> In addition, perform a get_response and check if the response is the
>>>>> same. To avoid regressions, print an error if the response does not
>>>>> match instead of rejecting device.
>>>>>
>>>>> Then, refactor asus_kbd_get_functions() to use the same ID it is called
>>>>> with, instead of hardcoding it to 0x5a so that it may be used for 0x0d
>>>>> in the future.
>>>>>
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>     drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
>>>>>     1 file changed, 46 insertions(+), 36 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>>> index 46e3e42f9eb5f..8d4df1b6f143b 100644
>>>>> --- a/drivers/hid/hid-asus.c
>>>>> +++ b/drivers/hid/hid-asus.c
>>>>> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>>>     #define FEATURE_REPORT_ID 0x0d
>>>>>     #define INPUT_REPORT_ID 0x5d
>>>>>     #define FEATURE_KBD_REPORT_ID 0x5a
>>>>> -#define FEATURE_KBD_REPORT_SIZE 16
>>>>> +#define FEATURE_KBD_REPORT_SIZE 64
>>>>>     #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>>>>>     #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>>>>>
>>>>> @@ -388,14 +388,41 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>>>>>
>>>>>     static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>>>>>     {
>>>>> -     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>>>>> -                  0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>>>>> +     /*
>>>>> +      * Asus handshake identifying us as a driver (0x5A)
>>>>> +      * 0x5A then ASCII for "ASUS Tech.Inc."
>>>>> +      * 0x5D is for userspace Windows applications.
>>>>> +      *
>>>>> +      * The handshake is first sent as a set_report, then retrieved
>>>>> +      * from a get_report to verify the response.
>>>>> +      */
>>>>
>>>> This entire comment is not required, especially not the last paragraph.
>>>>    From what I've seen in .dll reversing attempts there's no real
>>>> distinction from driver/app and it's simply an init/enable sequence
>>>> common to almost every ITE MCU that ASUS have used (slash, anime, Ally).
>>>>
>>>> Please remove.
>>>
>>> It is a context comment but can be removed.
>>>
>>>>> +     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
>>>>> +             0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>>>>> +     u8 *readbuf;
>>>>>         int ret;
>>>>>
>>>>>         ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>>>>> -     if (ret < 0)
>>>>> -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
>>>>> +     if (ret < 0) {
>>>>> +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
>>>>> +             return ret;
>>>>> +     }
>>>>>
>>>>> +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
>>>>> +     if (!readbuf)
>>>>> +             return -ENOMEM;
>>>>> +
>>>>> +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
>>>>> +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>>>>> +                              HID_REQ_GET_REPORT);
>>>>> +     if (ret < 0) {
>>>>> +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
>>>>> +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
>>>>> +             hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
>>>>> +                     FEATURE_KBD_REPORT_SIZE, readbuf);
>>>>> +             // Do not return error if handshake is wrong to avoid regressions
>>>>> +     }
>>>>> +
>>>>> +     kfree(readbuf);
>>>>>         return ret;
>>>>>     }
>>>>>
>>>>> @@ -417,7 +444,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>>>>>         if (!readbuf)
>>>>>                 return -ENOMEM;
>>>>>
>>>>> -     ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
>>>>> +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
>>>>>                                  FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>>>>>                                  HID_REQ_GET_REPORT);
>>>>>         if (ret < 0) {
>>>>> @@ -540,42 +567,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>>>         unsigned char kbd_func;
>>>>>         int ret;
>>>>>
>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>>> -             /* Initialize keyboard */
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> -
>>>>> -             /* The LED endpoint is initialised in two HID */
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> -
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>>
>>>>
>>>> I don't have any non-ROG equipment to test. There have been some cases
>>>> of Vivobook using the same MCU, but these otherwise used something else.
>>>> And the oldest hardware I have uses a 0x1866, which uses the same init
>>>> sequence but works with both 0x5A and 0x5D report ID for init (on same
>>>> endpoint). There are instances of other laptops that accept both 0x5A
>>>> and 0x5D, and some that have only 0x5D.
>>>
>>> The driver sets the brightness using 0x5a and accepts keyboard
>>> shortcuts only from 0x5a. Therefore it needs to init only with 0x5a.
>>>
>>> How would those laptops regress and in what way?
>>>
>>
>> The media keys fail to work (vol, mic, rog). Can you please accept that
>> I do know some laptops used only 0x5D, and these are older models,
>> around 5+ years. The only thing I have to go on is my memory
>> unfortunately, and I've been trying to find the concrete examples.
> 
> I just looked at the history. Yeah it seems you added ID1 in 2020 with
> some other commands. But on the same commit you blocked 0x5d and 0x5e,
> so it means those keyboards use 0x5a to send keyboard events.
> 
> Nevertheless, it is not worth looking up or risking regressions for
> old hardware. I will readd 0x5d, 0x5e for
> USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD and
> USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2, since those are the ones you
> added the inits with.
> 

Thank you. Please know that I'm not trying to be a pain, I only don't 
want to take that risk when I know things were working for all before 
now, and that I know at least some laptops required 0x5D historically. I 
do know you can drop 0x5E here.

I saw we have:
#define INPUT_REPORT_ID 0x5d
#define FEATURE_KBD_LED_REPORT_ID1 0x5d

Maybe unifying to just one of these can be added as a cleanup?

Cheers,
Luke.

> But I will still keep them off for the Z13 and Ally.
> 
> By the way,
> 
> Antheas
> 
>>>> I think you will need to change this to try both 0x5A and 0x5D sorry.
>>>> The older models using 0x1854, 0x1869, 0x1866 PID may regress and
>>>> although I'm reasonably confident there won't be issues due to age of
>>>> those, it's not a risk I'm willing to take, I've spent all morning
>>>> trawling through archives of info and I can't actually verify this other
>>>> than from my memory.
>>>
>>> For devices that support RGB, only when RGB is set, 0x5D is initialized too.
>>
>> Sure. But as I've said above.. Please add both to init. It's only done
>> once, and it doesn't hurt anything plus doesn't risk regressing older
>> hardware.
>>
>> If I can get the proper evidence that only 0x5A is required I'm happy to
>> use only that, but until then I don't want that risk. And it's only a
>> small thing here.
>>
>> Cheers,
>> Luke.
>>
>>>
>>>> I mentioned 0x5E being used for some of the oddball devices like slash
>>>> and anime, don't worry about that one, it's a bridge that can be crossed
>>>> at a later time. But it does illustrate that other report ID have been
>>>> used for init.
>>>>
>>>> Otherwise the cleanup is good.
>>>>
>>>> No other comments required and I'll sign off with the above corrections.
>>>>
>>>> Cheers,
>>>> Luke
>>>>
>>>>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>>>> -                     ret = asus_kbd_disable_oobe(hdev);
>>>>> -                     if (ret < 0)
>>>>> -                             return ret;
>>>>> -             }
>>>>> -     } else {
>>>>> -             /* Initialize keyboard */
>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>>>> -             if (ret < 0)
>>>>> -                     return ret;
>>>>> +     /* Get keyboard functions */
>>>>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>>
>>>>> -             /* Get keyboard functions */
>>>>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>>>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>>>> +             ret = asus_kbd_disable_oobe(hdev);
>>>>>                 if (ret < 0)
>>>>>                         return ret;
>>>>> -
>>>>> -             /* Check for backlight support */
>>>>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>> -                     return -ENODEV;
>>>>>         }
>>>>>
>>>>> +     /* Check for backlight support */
>>>>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>> +             return -ENODEV;
>>>>> +
>>>>>         drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>>>>>                                               sizeof(struct asus_kbd_leds),
>>>>>                                               GFP_KERNEL);
>>>>
>>


