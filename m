Return-Path: <linux-input+bounces-11103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 055ABA6CD3F
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 341F57A6BA5
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 23:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114DB1EE03C;
	Sat, 22 Mar 2025 23:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="1uFEIieS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="8S2P9uqo"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27EA1EB190;
	Sat, 22 Mar 2025 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742686147; cv=none; b=c+UAl7nq86iPccez7wVCSI/pgAJ4aicXFSDjPpvm+WG9UDEJEHqFKNu4HRD68uix4rIBbGOWPfJlOzoBzCu2LOBmdynO2zjzn8Cbc/7Pxvq2S7vT/J2YYHcrIMZiV49U5owgXiT863dabIXMK8lfAV58mvsKZx+vx9zDBIV4kEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742686147; c=relaxed/simple;
	bh=TW37WmiQP4L0JFTI3ZIIYGlSnz5X79KxiqoM9Acn4X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bc4kIwvbZyFCJvHWH+8zGCaP5xRBtVvGXbju6wuAsOxNXHfbORkpB2MXUhUftOcPo5Qp68JjidG4j8onIS/BymmFrfBvl2QGRrIHeCHms66tB+6c8WY2NcIB0iOfsE1LDDNVTZiP7KEv+8wh4lVnlfaGPfTyCdUgGZ6b9Atch8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=1uFEIieS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=8S2P9uqo; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id D35E811400B4;
	Sat, 22 Mar 2025 19:29:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 22 Mar 2025 19:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742686143;
	 x=1742772543; bh=Cwg5RVIyZao3RyvfxVR81cgQDRSI7YWvy4KPXle45Bw=; b=
	1uFEIieSFWOgpCj//dmQOZigXMuNWJV+Vk4DWujueO9F/d/eD9fJ+k3JmFag7of8
	hGyTKujWqXFWGbg0my5G+5pR0IBJ+P8mGsRcZQFL8S3S5rbQGY08PytZjFXltmaF
	nVKgbwdHdQYXeLJR/OkNG0xx2d6ps9ikX6XRFggCGnERhPnHggVWGv7b8yyZWDy/
	1O0RP3n7BlEipdN5ITLs1rUSr990NcReNY71aW+CaIQVT8Xr6dgG4cZB9PNvDTn4
	5XwXNKgtDJ6sa3AgeT7YnNQsAcTNSiTOjx9PN4Yzj+rlZgF8lrP8BrfUupJYn15C
	aupdS7Bi2lGdMUilayr21w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742686143; x=
	1742772543; bh=Cwg5RVIyZao3RyvfxVR81cgQDRSI7YWvy4KPXle45Bw=; b=8
	S2P9uqoCg7skiPRLS8GYDXhn1ZKV8YbrkLMHvGUkzLkznpu0LdRhDX65P0NYGLo3
	IsJb4YaFJC24OFZp4e5Au/c/rmD/P7S6ob/b7mVe3dVxjeRwjsedtVQFQc6YScYe
	X483jEE/0ZAZBMJT9HkeYwVY71W4wQSYaPLR0fZdBuaVqTcwuM7xAfmsJGPuyOe0
	pAqEY/7WNSVoEARmibRPIcluEykUQqNWGBQxNIZwmc6XM3inDV1bbmoGYHdakRWF
	07bFadvu8oRCFEWO9KwL9h+uOG+CNgkW0CO2R4iKaYEP7dY+NIc+dDBswRCkbkuJ
	7wnq1bL8FValio2tvCncw==
X-ME-Sender: <xms:v0ffZ7DPxQDCACulLmLHuDUbbgB--skl0R68_yOlQapjKaimh5N8QA>
    <xme:v0ffZxiqB2tBHhlyvYKF1qea3x7hv0zD6_PsFjcu0aXosEu2V76kwP8mbS8Jgz4k_
    xQYgJD5Af4GOHo7LeI>
X-ME-Received: <xmr:v0ffZ2lUlQoFgoDMu2r0w8gutY5rosWMMP29F57laPITdLo0O3IkwNCl5EKcoBtkE-qmEk1h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehfedtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:v0ffZ9yyGs9WsYzb5nqa1Z2484FUPW4rTcvCN7B77RWreHwk7TQI8w>
    <xmx:v0ffZwSUIxJyPos1SskD7hWd-APnla4cVLp4slzQvcPo2Ms40ocmWQ>
    <xmx:v0ffZwY6uBw-3b_uRKwbjqLdZZ9Om4ifF_7REbcPD18LJy-MllkRMQ>
    <xmx:v0ffZxSqt-IhsfVv3FnHBd8p43WNjfrSEfJwyxv4UIIvmXJHwPsgOw>
    <xmx:v0ffZzEp1rE7i3PAF_OeBXaVA0WQVYcvE3n6nAUl-l1XnlAJIQvJYhfk>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 19:29:00 -0400 (EDT)
Message-ID: <6b8ea775-ab3c-4046-9152-dfe7255387e4@ljones.dev>
Date: Sun, 23 Mar 2025 12:28:57 +1300
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
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwFa1UgrWKEoAa2TqvvjB=if8UEnPzcfcmAs=yG=XNazsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/25 12:05, Antheas Kapenekakis wrote:
> On Sat, 22 Mar 2025 at 23:01, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 22/03/25 23:27, Antheas Kapenekakis wrote:
>>> Currently, asus_kbd_init() uses a reverse engineered init sequence
>>> from Windows, which contains the handshakes from multiple programs.
>>> Keep the main one, which is 0x5a (meant for brightness drivers).
>>>
>>> In addition, perform a get_response and check if the response is the
>>> same. To avoid regressions, print an error if the response does not
>>> match instead of rejecting device.
>>>
>>> Then, refactor asus_kbd_get_functions() to use the same ID it is called
>>> with, instead of hardcoding it to 0x5a so that it may be used for 0x0d
>>> in the future.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
>>>    1 file changed, 46 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 46e3e42f9eb5f..8d4df1b6f143b 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>    #define FEATURE_REPORT_ID 0x0d
>>>    #define INPUT_REPORT_ID 0x5d
>>>    #define FEATURE_KBD_REPORT_ID 0x5a
>>> -#define FEATURE_KBD_REPORT_SIZE 16
>>> +#define FEATURE_KBD_REPORT_SIZE 64
>>>    #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>>>    #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>>>
>>> @@ -388,14 +388,41 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>>>
>>>    static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>>>    {
>>> -     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>>> -                  0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>>> +     /*
>>> +      * Asus handshake identifying us as a driver (0x5A)
>>> +      * 0x5A then ASCII for "ASUS Tech.Inc."
>>> +      * 0x5D is for userspace Windows applications.
>>> +      *
>>> +      * The handshake is first sent as a set_report, then retrieved
>>> +      * from a get_report to verify the response.
>>> +      */
>>
>> This entire comment is not required, especially not the last paragraph.
>>   From what I've seen in .dll reversing attempts there's no real
>> distinction from driver/app and it's simply an init/enable sequence
>> common to almost every ITE MCU that ASUS have used (slash, anime, Ally).
>>
>> Please remove.
> 
> It is a context comment but can be removed.
> 
>>> +     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
>>> +             0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>>> +     u8 *readbuf;
>>>        int ret;
>>>
>>>        ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>>> -     if (ret < 0)
>>> -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
>>> +     if (ret < 0) {
>>> +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
>>> +             return ret;
>>> +     }
>>>
>>> +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
>>> +     if (!readbuf)
>>> +             return -ENOMEM;
>>> +
>>> +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
>>> +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>>> +                              HID_REQ_GET_REPORT);
>>> +     if (ret < 0) {
>>> +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
>>> +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
>>> +             hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
>>> +                     FEATURE_KBD_REPORT_SIZE, readbuf);
>>> +             // Do not return error if handshake is wrong to avoid regressions
>>> +     }
>>> +
>>> +     kfree(readbuf);
>>>        return ret;
>>>    }
>>>
>>> @@ -417,7 +444,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>>>        if (!readbuf)
>>>                return -ENOMEM;
>>>
>>> -     ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
>>> +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
>>>                                 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>>>                                 HID_REQ_GET_REPORT);
>>>        if (ret < 0) {
>>> @@ -540,42 +567,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>        unsigned char kbd_func;
>>>        int ret;
>>>
>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>> -             /* Initialize keyboard */
>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> -
>>> -             /* The LED endpoint is initialised in two HID */
>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> -
>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>> +     if (ret < 0)
>>> +             return ret;
>>>
>>
>> I don't have any non-ROG equipment to test. There have been some cases
>> of Vivobook using the same MCU, but these otherwise used something else.
>> And the oldest hardware I have uses a 0x1866, which uses the same init
>> sequence but works with both 0x5A and 0x5D report ID for init (on same
>> endpoint). There are instances of other laptops that accept both 0x5A
>> and 0x5D, and some that have only 0x5D.
> 
> The driver sets the brightness using 0x5a and accepts keyboard
> shortcuts only from 0x5a. Therefore it needs to init only with 0x5a.
> 
> How would those laptops regress and in what way?
> 

The media keys fail to work (vol, mic, rog). Can you please accept that 
I do know some laptops used only 0x5D, and these are older models, 
around 5+ years. The only thing I have to go on is my memory 
unfortunately, and I've been trying to find the concrete examples.

>> I think you will need to change this to try both 0x5A and 0x5D sorry.
>> The older models using 0x1854, 0x1869, 0x1866 PID may regress and
>> although I'm reasonably confident there won't be issues due to age of
>> those, it's not a risk I'm willing to take, I've spent all morning
>> trawling through archives of info and I can't actually verify this other
>> than from my memory.
> 
> For devices that support RGB, only when RGB is set, 0x5D is initialized too.

Sure. But as I've said above.. Please add both to init. It's only done 
once, and it doesn't hurt anything plus doesn't risk regressing older 
hardware.

If I can get the proper evidence that only 0x5A is required I'm happy to 
use only that, but until then I don't want that risk. And it's only a 
small thing here.

Cheers,
Luke.

> 
>> I mentioned 0x5E being used for some of the oddball devices like slash
>> and anime, don't worry about that one, it's a bridge that can be crossed
>> at a later time. But it does illustrate that other report ID have been
>> used for init.
>>
>> Otherwise the cleanup is good.
>>
>> No other comments required and I'll sign off with the above corrections.
>>
>> Cheers,
>> Luke
>>
>>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>> -                     ret = asus_kbd_disable_oobe(hdev);
>>> -                     if (ret < 0)
>>> -                             return ret;
>>> -             }
>>> -     } else {
>>> -             /* Initialize keyboard */
>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>>> -             if (ret < 0)
>>> -                     return ret;
>>> +     /* Get keyboard functions */
>>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>> +     if (ret < 0)
>>> +             return ret;
>>>
>>> -             /* Get keyboard functions */
>>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
>>> +             ret = asus_kbd_disable_oobe(hdev);
>>>                if (ret < 0)
>>>                        return ret;
>>> -
>>> -             /* Check for backlight support */
>>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>> -                     return -ENODEV;
>>>        }
>>>
>>> +     /* Check for backlight support */
>>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>> +             return -ENODEV;
>>> +
>>>        drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>>>                                              sizeof(struct asus_kbd_leds),
>>>                                              GFP_KERNEL);
>>


