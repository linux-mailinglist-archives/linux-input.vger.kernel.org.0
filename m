Return-Path: <linux-input+bounces-11029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A25A6AF84
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 22:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEF26189CBE3
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 21:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE4A229B02;
	Thu, 20 Mar 2025 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="u5muMKQQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CSsz58+R"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A261EB195;
	Thu, 20 Mar 2025 21:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742504497; cv=none; b=KIVut68lior+TKJNWdX4mFMSuq/y9TYlKId7RoRbNWQS0ufGDCPyrVJllZfHNN7GezTBXG8Uk5r9XuTz4eWFZCaKSptygENN3BB7w3XFSkkhWxsHdk5blTM0kEO7BeNZBGN0HTx+REQpDM1aYAj9lEouv2EIbL9yhth58IjAhpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742504497; c=relaxed/simple;
	bh=K68jqFO45gDXfCxOZwtxizVg9vHIfBc8k64J/D9+qFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4OFsy7E5VAzZ2414awT07tx3J0dCO2PJhhzCwOM1C0HFxsu3INuLN/NTwwVzjHbe6Fib6r4LPdMhyxQyvUhZZ1IwVSQtnK/KIjYjlYNkeXMZE8W9XqBowK+2lE4G0yZapf0BNxNosbYcdsM1uZ1R7y4Dfdv62sjdlyBv9If7H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=u5muMKQQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CSsz58+R; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8FBDD1140177;
	Thu, 20 Mar 2025 17:01:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 20 Mar 2025 17:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742504493;
	 x=1742590893; bh=8c5ZkuDL9kYMx7KIbvTkHRAJDAkoupBL0KPSMh3uCAs=; b=
	u5muMKQQeVch/tg4iGQ7LrJHfMp+8iPYu9+8IZfnYMG5K8fUS7LWt7MOEBkvNC8N
	rqxGMUrMyfAyDcMbwY46MzkbthUKNg/ATene1rullLf6b0NqpQBv2z6G5c+holKq
	zmsX1TwkFaCIOVhk8EfES1ZqxMv2AiTc5u0ZbCnLvovfgU93fS/GdAteUZrKQ1ae
	XksdurA23fpTysRrJinurY8EqgFDbV/MgOVENEytTvJBMsUEycXT8j2M0COjY9he
	M/osOCD+MjAO+ZadeagoErjFtQppLyrshhtwG9g6Ja1N+W25Mb+85/LS9DzYmh0t
	v2oo6CR/LoDqYhNLGrMT8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742504493; x=
	1742590893; bh=8c5ZkuDL9kYMx7KIbvTkHRAJDAkoupBL0KPSMh3uCAs=; b=C
	Ssz58+RjV3pC0jXEhsmxQx0LSQWVFO9aoIUKknzRzeV6GYOD0xo/WojSxX3qjApL
	VSWydijxGCGTiOTHHncsH+Z1hiNOr11djO62xGchIRv4fsTEc7wr5ocPNvqu9sVo
	7jjWUL4HdBqvJwOqLYvZ60VA9eRnHLC102WG5RtDN27lWyyA+v8cschccIA/A9Xe
	fk4WcQ4LDTAYNituR3Ab4SO7MbEKz0RLLJp8rDzZjSHzz7vKv63w0lrg8ovgQ0KR
	RcUUFIfGC+F6+LNRx8VtVQ0ycHnXX1wRVNHDSV5T/MT66cvGKuoONo8qpkZ3Ymfs
	qGmC7WDvW+8wznny4gteA==
X-ME-Sender: <xms:LILcZ_X0JPw_98Dcx27zp1CuJTQcXKh5lFJADVxxl4vN4V8m1NKYXQ>
    <xme:LILcZ3mGoh8ZEH4TUBwzdfWxZFxM7mV_FPNEyHBPQkmoXjxNbjhiesPYKwaQip8rC
    hPtWFrU7e-ZSig8XZg>
X-ME-Received: <xmr:LILcZ7ZP8FnYrDfzI964rd_UGniQoc85YysYDGT2tL2-RYEKVIHMivQuNiPC5ncStfmrxEBr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeelvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepffevhedtuedvtefgveejgffhfffhleev
    vddtleffffetueekhfdutdeuvefhleejnecuffhomhgrihhnpehgihhthhhusgdrtghomh
    dptghonhhsthdrphihnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepledpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthhgvrghsrdguvghv
    pdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorh
    gvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhguvghgohgv
    uggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnse
    hlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:LILcZ6Xgmsej8lupXRv3rwoAKvRCWWxVntU8IHVauQPRECRKwI077A>
    <xmx:LILcZ5moJY3H2i0v4D4EL6L_XLIzz1n7O3M_IE1nbHr_n-L4Nbvmnw>
    <xmx:LILcZ3fbdIrepACPLUgICejHDPxIggAL1J2PNL0kY7ZwUcrrg6oNTQ>
    <xmx:LILcZzHtP-dS92BPM-TK1enPzcj1Q9bp2jiaO_HAGVHZ1-JW5DA9fw>
    <xmx:LYLcZ76RykwJ5hn6v7iAYGusMOTwWRPMCO60yZ0VMtbaIMKFL68MLdGO>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 17:01:28 -0400 (EDT)
Message-ID: <11dc0b16-84a3-4eee-9e38-7db0db8b4d5e@ljones.dev>
Date: Fri, 21 Mar 2025 10:01:25 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] HID: asus: refactor init sequence per spec
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-2-lkml@antheas.dev>
 <567b2056-8687-4f92-b4d2-7f289321275e@ljones.dev>
 <CAGwozwGB69__pYzeTOmKnJrx1M8X4mgnDeRXE-dyFy9p495sBQ@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwGB69__pYzeTOmKnJrx1M8X4mgnDeRXE-dyFy9p495sBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/25 22:50, Antheas Kapenekakis wrote:
> On Thu, 20 Mar 2025 at 08:19, Luke D. Jones <luke@ljones.dev> wrote:
>>
>>
>> On 20/03/25 08:13, Antheas Kapenekakis wrote:
>>> Currently, asus_kbd_init() uses a reverse engineered init sequence
>>> from Windows, which contains the handshakes from multiple programs.
>>> Keep the main one, which is 0x5a (meant for drivers).
>>
>> 0x5A is also used for Ally setup commands, used from userspace in
>> Windows. Only a nit but I don't think stating it's only for drivers is
>> accurate but then again asus kind of blurs the line a bit.
> 
> ROG devices contain a HID USB endpoint that exposes multiple
> applications. On my Z13, that is 4 hiddev devices.
> 
> However, we only care about two. Those are:
> 
> Application / Report ID:
> 0xff310076 / 0x5a meant for Asus drivers
> 0xff310079 / 0x5d meant for Asus applications

I'm curious how you determined that. From what I've seen asus are 
consistent until they're not - typically it's when they have a weird 
device like the Slash or Anime. The slash on the G16 uses the same MCU 
and endpoint as the keyboard, but with a new report ID, while the slash 
on a G14 is a separate MCU (or at least device exposed by MCU) with own 
endpoints and hid report.

It's not important here yet, I'm just trying to add context and provide 
some extra information for you.

> Both require the same handshake when they start. Well, in theory. But
> as you say in some of the Anime stuff requires it in practice too.

Yeah as above, the G14 slash needs it, so does the older Anime dispaly. 
But the G16 slash being on the same MCU doesn't. In any case those 
gadgets are being handled in userspace just fine regardless of the 
driver state. Still, not really relevant here and I'm just adding context.

> The handshake is set_report 0x5X + "Asus...", then get_report with the
> same ID which should return the asus string.
> 
> In hiddraw, they appear under the same endpoint, both on the Ally and
> the Z13. But in hiddev (with hid-asus disabled or with this series),
> they appear as separate.
> 
> I cannot comment on the Aura protocol, because I don't know, but for
> the basic sticky RGB mode that supports set and apply, they _should_
> behave identically. I use 0x5d in my userspace software for everything
> now [1]. Previously, I used 0x5a but I am not a driver.
> 
> They do behave identically on the Ally X and the Z13 2025 though.

It is something I do have to test, and I'll add your v2 to kernels to 
get some feedback from my discord group too. I know for sure that there 
were some laptops that didn't accept 0x5D for brightness - I'm sorry I'm 
so vague on this part, I really don't remember the details and I lost 
notes so it will need to be tested.

> I do not know about 0x5e. Perhaps Asus made a special endpoint for
> their Anime creation app.

It is only for that yes.

Cheers,
Luke.

>>> In addition, perform a get_response and check if the response is the
>>> same. To avoid regressions, print an error if the response does not
>>> match instead of rejecting device.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
>>>    1 file changed, 46 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 46e3e42f9eb5f..aa4a481dc4f27 100644
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
>>> @@ -386,16 +386,43 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>>>        return ret;
>>>    }
>>>
>>> -static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>>> +static int asus_kbd_init(struct hid_device *hdev)
>>>    {
>>> -     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>>> -                  0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>>> +     /*
>>> +      * Asus handshake identifying us as a driver (0x5A)
>>> +      * 0x5A then ASCII for "ASUS Tech.Inc."
>>> +      * 0x5D is for userspace Windows applications.
>>
>> 0x5D is the report ID used for commands such as RGB modes. Probably
>> don't need to mention it here, and only where it is used.
> 
> Yep, see above. Not required for basic RGB. Maybe it is for Aura, but
> I'd leave that to userspace.
> 
>>> +      * The handshake is first sent as a set_report, then retrieved
>>> +      * from a get_report to verify the response.
>>> +      */
>>> +     const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0x41, 0x53, 0x55, 0x53, 0x20,
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
>>> +     ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
>>> +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>>> +                              HID_REQ_GET_REPORT);
>>> +     if (ret < 0) {
>>> +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
>>> +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
>>> +             hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
>>> +                     FEATURE_KBD_REPORT_SIZE, readbuf);
>>> +             // Do not return error if handshake is wrong to avoid regressions
>>
>> I'll have to test this on the oldest model I have. Hopefully it's a
>> non-issue and this can return error instead.
>>
>> Side-note: I notice you're using a msleep to try and work around an
>> issue in a later patch - it might be worth trying replacing that with a
>> retry/count loop with an inner of small msleep + a call to this init,
>> see if it still responds to this during that critical period.
> 
> The call did not fail. I was thinking it was because the device needs
> some time to warm up (it happens with certain devices).
> 
> Turns out it was hid-multitouch not attaching.
> 
>>> +     }
>>> +
>>> +     kfree(readbuf);
>>>        return ret;
>>>    }
>>>
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
>>
>> Ah, I recall now. Some devices like the Slash or AniMe Matrix required
>> the 0x5E and 0x5D report ID (device dependent) however these are
>> currently being done via userspace due to not being HID devices.
>>
>> There *are* some older laptops still in use that require init on 0x5E or
>> 0x5D for RGB to be usable, from memory. It's been over 5 years so I'll
>> pull out the laptop I have with 0x1866 PID MCU and see if that is
>> actually true and not just my imagination.
> 
> Hopefully you handshake with these devices over userspace, so they
> will not be affected.
> 
>>> +     ret = asus_kbd_init(hdev);
>>> +     if (ret < 0)
>>> +             return ret;
>>>
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
>> I've left only small comments on a few patches for now. I'll review in
>> full after I get testing done on a variety of devices whcih I'm aiming
>> for this weekend. Overall impression so far is everything looks good and
>> this is a nice improvement. Thank you for taking the time to implement it.
>>
>> Cheers,
>> Luke.
> 
> I'll try to have V2 out today. I finished it yesterday and fixed all
> the lockups and the hid-multitouch issue. Just needs a good
> lookthrough.
> 
> Perhaps I will also do a small multi-intensity endpoint that works
> with KDE and only applies the colors when asked. This way our programs
> are not affected and normal laptop users get basic RGB OOTB.
> 
> If I do that, I will make the quirk for the Ally in a separate patch,
> so that you can nack it if you'd rather introduce RGB support with
> your driver, so that it does not need to be reverted.
> 
> Antheas
> 
> [1] https://github.com/hhd-dev/hhd/blob/d3bbd7fa25fe9a4838896a2c5cfda460abe48dc6/src/hhd/device/rog_ally/const.py#L5-L8


