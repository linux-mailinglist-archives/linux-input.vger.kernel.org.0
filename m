Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4D329A60A
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 09:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508638AbgJ0ICG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 04:02:06 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:35185 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2508637AbgJ0ICG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 04:02:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id D91F7427;
        Tue, 27 Oct 2020 04:02:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 27 Oct 2020 04:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4S9mdf
        Mn53BxJLdy0+LfdLyc/dJQhPd7cNvmCj6PlYc=; b=QkAZPm6FWr9MaJeCk9a2zu
        XQwi10GL+Gx0b8s5v+f66cEw9YXolcuhTFXBFXwnUh2c2lj4ybgHWZ5J1mBSt+GW
        GCEytFfSDpNJKWrdFy+l0yCmm9rZk1EuUFRU26+CEvblIGXOBj6bMiFpT3akExek
        uh67UM3+EyPzPGQlem9aZTaL96QGHzIbVHhFiM2uXvl/4OgGh8TcINapCZ/BX2iU
        +gZN1hYT4p+U7Loy95cDAb5TS30bJ1bgA1cn0Z40w7ZLdx2JTOb4YNREfAj3cZve
        86n3CJly5J9T9WhMMN7B4uCv4FkCgp0IYuJG632u2Dr9bQkAzL88SAnjAwECC9mQ
        ==
X-ME-Sender: <xms:_NOXX75EkSuWzyQnZ-xIL5vCiqHhNFcEJCZLtGBC3orEZ7ggcvLNpw>
    <xme:_NOXXw4Vu3vB2UdH5ewQnjkcs3f3pjjJvm5X1nP-M2ItNcU0v_o9OnWPJQvJnFTJt
    u2gyw6ReMBsheKzErE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeekgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhuffvkfgjfhfogggtsehttdertdertddvnecuhfhrohhmpefnuhhkvgcu
    lfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    fgfeefudffhffgueehgeffffeggeevieefueethfeijefftedugfeuveethedtteenucfk
    phepvddtfedruddugedrudeguddrudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:_NOXXyfj2keomTwuYwFtky-IxVBXu1Ih_09JYyJmylVBHdRBoDclBw>
    <xmx:_NOXX8ItH79lq_T4cdiRkK4lAjxy54cBA_uw87Q4ovX-V5VUTpk_7Q>
    <xmx:_NOXX_KLfgrlSrttsNRUSqIR-P37QjuJfxTUFWJdEPDQi20wz6iH0w>
    <xmx:_NOXX1hv0TZU-534uXysZiR0nLSzcg0DzjLl72s1jF2NFUCT-Dk3OA>
Received: from [192.168.20.20] (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id B83A53280063;
        Tue, 27 Oct 2020 04:02:00 -0400 (EDT)
Date:   Tue, 27 Oct 2020 21:01:46 +1300
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH V9] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org, andy@infradead.org,
        benjamin.tissoires@redhat.com
Message-Id: <YYOUIQ.K32MP4HNYM4Q3@ljones.dev>
In-Reply-To: <e7aa350c-c9d1-c657-7be9-9711821382f5@redhat.com>
References: <20201025005615.40615-1-luke@ljones.dev>
        <7a4dd27f-5080-b651-9d8e-7aa57a5b895b@redhat.com>
        <GPTTIQ.UYDTGI32JMY01@ljones.dev>
        <e7aa350c-c9d1-c657-7be9-9711821382f5@redhat.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Tue, Oct 27, 2020 at 08:46, Hans de Goede <hdegoede@redhat.com> 
wrote:
> Normally you would let git send-email take care of the git 
> format-patch
> phase too and then contents in the commit message below the cut line
> will be preserved.
> 
> Note you can set the version in the subject directly when calling
> git send-email, there is no need to edit the patch for that.
> 
> git send-email should take all arguments which git format-patch 
> accepts
> and git format-patch allows you to pass -v#, e.g. for version 9 you
> would pass -v9.

Yeah, learned that the hard way. I was doing a git format-patch then 
sending that
but editing it to add the Vn postfix. For the new version I found an 
article
whcih clarified things a bit for me and I used git send-email -v10 -1 
etc.

Many many thanks for everyone for their time and patience. It's been a 
journey.

> 
> 
>>> 
>>>>    drivers/hid/hid-asus.c | 116 
>>>> ++++++++++++++++++++++++++++++++++++-----
>>>>    drivers/hid/hid-ids.h  |   1 +
>>>>    2 files changed, 103 insertions(+), 14 deletions(-)
>>>> 
>>>>   diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>>   index c183caf89d49..98b033b4951f 100644
>>>>   --- a/drivers/hid/hid-asus.c
>>>>   +++ b/drivers/hid/hid-asus.c
>>>>   @@ -48,6 +48,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and 
>>>> TouchPad");
>>>>    #define INPUT_REPORT_ID 0x5d
>>>>    #define FEATURE_KBD_REPORT_ID 0x5a
>>>>    #define FEATURE_KBD_REPORT_SIZE 16
>>>>   +#define FEATURE_KBD_LED_REPORT_ID1 0x5d
>>>>   +#define FEATURE_KBD_LED_REPORT_ID2 0x5e
>>>> 
>>>>    #define SUPPORT_KBD_BACKLIGHT BIT(0)
>>>> 
>>>>   @@ -80,6 +82,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and 
>>>> TouchPad");
>>>>    #define QUIRK_T101HA_DOCK        BIT(9)
>>>>    #define QUIRK_T90CHI            BIT(10)
>>>>    #define QUIRK_MEDION_E1239T        BIT(11)
>>>>   +#define QUIRK_ROG_NKEY_KEYBOARD        BIT(12)
>>>> 
>>>>    #define I2C_KEYBOARD_QUIRKS            
>>>> (QUIRK_FIX_NOTEBOOK_REPORT | \
>>>>                             QUIRK_NO_INIT_REPORTS | \
>>>>   @@ -332,6 +335,28 @@ static int asus_raw_event(struct hid_device 
>>>> *hdev,
>>>>        if (drvdata->quirks & QUIRK_MEDION_E1239T)
>>>>            return asus_e1239t_event(drvdata, data, size);
>>>> 
>>>>   +    if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>>   +        /*
>>>>   +         * Skip these report ID, the device emits a continuous 
>>>> stream associated
>>>>   +         * with the AURA mode it is in which looks like an 
>>>> 'echo'.
>>>>   +        */
>>>>   +        if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
>>>>   +                report->id == FEATURE_KBD_LED_REPORT_ID2) {
>>>>   +            return -1;
>>>>   +        /* Additional report filtering */
>>>>   +        } else if (report->id == FEATURE_KBD_REPORT_ID) {
>>>>   +            /*
>>>>   +             * G14 and G15 send these codes on some keypresses 
>>>> with no
>>>>   +             * discernable reason for doing so. We'll filter 
>>>> them out to avoid
>>>>   +             * unmapped warning messages later.
>>>>   +            */
>>>>   +            if (data[1] == 0xea || data[1] == 0xec || data[1] 
>>>> == 0x02 ||
>>>>   +                    data[1] == 0x8a || data[1] == 0x9e) {
>>>>   +                return -1;
>>>>   +            }
>>>>   +        }
>>>>   +    }
>>>>   +
>>>>        return 0;
>>>>    }
>>>> 
>>>>   @@ -344,7 +369,11 @@ static int asus_kbd_set_report(struct 
>>>> hid_device *hdev, u8 *buf, size_t buf_size
>>>>        if (!dmabuf)
>>>>            return -ENOMEM;
>>>> 
>>>>   -    ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, 
>>>> dmabuf,
>>>>   +    /*
>>>>   +     * The report ID should be set from the incoming buffer due 
>>>> to LED and key
>>>>   +     * interfaces having different pages
>>>>   +    */
>>>>   +    ret = hid_hw_raw_request(hdev, buf[0], dmabuf,
>>>>                     buf_size, HID_FEATURE_REPORT,
>>>>                     HID_REQ_SET_REPORT);
>>>>        kfree(dmabuf);
>>>>   @@ -397,6 +426,44 @@ static int asus_kbd_get_functions(struct 
>>>> hid_device *hdev,
>>>>        return ret;
>>>>    }
>>>> 
>>>>   +static int rog_nkey_led_init(struct hid_device *hdev)
>>>>   +{
>>>>   +    u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
>>>>   +    u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 
>>>> 0x55, 0x53, 0x20,
>>>>   +                0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 
>>>> 0x2e, 0x00 };
>>>>   +    u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
>>>>   +                        0x05, 0x20, 0x31, 0x00, 0x08 };
>>>>   +    int ret;
>>>>   +
>>>>   +    hid_info(hdev, "Asus initialise N-KEY Device");
>>>>   +    /* The first message is an init start */
>>>>   +    ret = asus_kbd_set_report(hdev, buf_init_start, 
>>>> sizeof(buf_init_start));
>>>>   +    if (ret < 0)
>>>>   +        hid_warn(hdev, "Asus failed to send init start command: 
>>>> %d\n", ret);
>>>>   +    /* Followed by a string */
>>>>   +    ret = asus_kbd_set_report(hdev, buf_init2, 
>>>> sizeof(buf_init2));
>>>>   +    if (ret < 0)
>>>>   +        hid_warn(hdev, "Asus failed to send init command 1.0: 
>>>> %d\n", ret);
>>> 
>>>  Hmm, so this construction means that the final return value of 
>>> this function
>>>  may be 0 even if some commands fail.
>>> 
>>>  The actual led calls device registration will get skipped on a 
>>> failure return;
>>>  and we probably should skip that registration on any errors, so 
>>> how about:
>>> 
>>>      ret = asus_kbd_set_report(hdev, buf_init_start, 
>>> sizeof(buf_init_start));
>>>      if (ret < 0) {
>>>          hid_warn(hdev, "Asus failed to send init start command: 
>>> %d\n", ret);
>>>          return ret;
>>>      }
>>>      /* Followed by a string */
>>>      ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
>>>      if (ret < 0) {
>>>          hid_warn(hdev, "Asus failed to send init command 1.0: 
>>> %d\n", ret);
>>>          return ret;
>>>      }
>>> 
>>>  etc. ?  This (return on first error) is the normal way of dealing 
>>> with things
>>>  like this in the kernel.
>>> 
>> 
>>  Done. Thanks for the pointer here.
>> 
>>  I'll submit a v10, with changes from v8-v10 in the changelog.
> 
> Great, thank you.
> 
>>  Sorry about that
>>  I'm really not sure at what stage the log got cut out.
> 
> No problem.
> 
> Regards,
> 
> Hans
> 
> 
> 
>> 
>>> 
>>> 
>>> 
>>> 
>>> 
>>>>   +    /* Followed by a string */
>>>>   +    ret = asus_kbd_set_report(hdev, buf_init3, 
>>>> sizeof(buf_init3));
>>>>   +    if (ret < 0)
>>>>   +        hid_warn(hdev, "Asus failed to send init command 1.1: 
>>>> %d\n", ret);
>>>>   +
>>>>   +    /* begin second report ID with same data */
>>>>   +    buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
>>>>   +    buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
>>>>   +
>>>>   +    ret = asus_kbd_set_report(hdev, buf_init2, 
>>>> sizeof(buf_init2));
>>>>   +    if (ret < 0)
>>>>   +        hid_warn(hdev, "Asus failed to send init command 2.0: 
>>>> %d\n", ret);
>>>>   +
>>>>   +    ret = asus_kbd_set_report(hdev, buf_init3, 
>>>> sizeof(buf_init3));
>>>>   +    if (ret < 0)
>>>>   +        hid_warn(hdev, "Asus failed to send init command 2.1: 
>>>> %d\n", ret);
>>>>   +
>>>>   +    return ret;
>>>>   +}
>>>>   +
>>>>    static void asus_kbd_backlight_set(struct led_classdev 
>>>> *led_cdev,
>>>>                       enum led_brightness brightness)
>>>>    {
>>>>   @@ -460,19 +527,25 @@ static int asus_kbd_register_leds(struct 
>>>> hid_device *hdev)
>>>>        unsigned char kbd_func;
>>>>        int ret;
>>>> 
>>>>   -    /* Initialize keyboard */
>>>>   -    ret = asus_kbd_init(hdev);
>>>>   -    if (ret < 0)
>>>>   -        return ret;
>>>>   +    if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>>   +        ret = rog_nkey_led_init(hdev);
>>>>   +        if (ret < 0)
>>>>   +            return ret;
>>>>   +    } else {
>>>>   +        /* Initialize keyboard */
>>>>   +        ret = asus_kbd_init(hdev);
>>>>   +        if (ret < 0)
>>>>   +            return ret;
>>>> 
>>>>   -    /* Get keyboard functions */
>>>>   -    ret = asus_kbd_get_functions(hdev, &kbd_func);
>>>>   -    if (ret < 0)
>>>>   -        return ret;
>>>>   +        /* Get keyboard functions */
>>>>   +        ret = asus_kbd_get_functions(hdev, &kbd_func);
>>>>   +        if (ret < 0)
>>>>   +            return ret;
>>>> 
>>>>   -    /* Check for backlight support */
>>>>   -    if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>   -        return -ENODEV;
>>>>   +        /* Check for backlight support */
>>>>   +        if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>>   +            return -ENODEV;
>>>>   +    }
>>>> 
>>>>        drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>>>>                              sizeof(struct asus_kbd_leds),
>>>>   @@ -751,8 +824,8 @@ static int asus_input_mapping(struct 
>>>> hid_device *hdev,
>>>>             usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
>>>>            return -1;
>>>> 
>>>>   -    /* ASUS-specific keyboard hotkeys */
>>>>   -    if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
>>>>   +    /* ASUS-specific keyboard hotkeys and led backlight */
>>>>   +    if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
>>>>            switch (usage->hid & HID_USAGE) {
>>>>            case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);    
>>>> break;
>>>>            case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);        
>>>> break;
>>>>   @@ -780,6 +853,18 @@ static int asus_input_mapping(struct 
>>>> hid_device *hdev,
>>>>            /* Fn+F5 "fan" symbol on FX503VD */
>>>>            case 0x99: asus_map_key_clear(KEY_PROG4);        break;
>>>> 
>>>>   +        /* Fn+F5 "fan" symbol on N-Key keyboard */
>>>>   +        case 0xae: asus_map_key_clear(KEY_PROG4);        break;
>>>>   +
>>>>   +        /* Fn+Ret "Calc" symbol on N-Key keyboard */
>>>>   +        case 0x92: asus_map_key_clear(KEY_CALC);        break;
>>>>   +
>>>>   +        /* Fn+Left Aura mode previous on N-Key keyboard */
>>>>   +        case 0xb2: asus_map_key_clear(KEY_PROG2);        break;
>>>>   +
>>>>   +        /* Fn+Right Aura mode next on N-Key keyboard */
>>>>   +        case 0xb3: asus_map_key_clear(KEY_PROG3);        break;
>>>>   +
>>>>            default:
>>>>                /* ASUS lazily declares 256 usages, ignore the rest,
>>>>                 * as some make the keyboard appear as a pointer 
>>>> device. */
>>>>   @@ -1126,6 +1211,9 @@ static const struct hid_device_id 
>>>> asus_devices[] = {
>>>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>            USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD),
>>>>          QUIRK_USE_KBD_BACKLIGHT },
>>>>   +    { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>   +        USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>>>>   +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>            USB_DEVICE_ID_ASUSTEK_T100TA_KEYBOARD),
>>>>          QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
>>>>   diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
>>>>   index 6f370e020feb..c9f930ddcfd7 100644
>>>>   --- a/drivers/hid/hid-ids.h
>>>>   +++ b/drivers/hid/hid-ids.h
>>>>   @@ -190,6 +190,7 @@
>>>>    #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
>>>>    #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
>>>>    #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
>>>>   +#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD    0x1866
>>>>    #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD    0x1869
>>>> 
>>>>    #define USB_VENDOR_ID_ATEN        0x0557
>>>>   --
>>>>   2.28.0
>>>> 
>>> 
>> 
>> 
> 


