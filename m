Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5C429A5BD
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 08:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508065AbgJ0Hq5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 03:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26146 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2508063AbgJ0Hq4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 03:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603784813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2/EViVRilM63Y1QXFyN/4sGHIsAejqS0hfp1TKo/7Oc=;
        b=PrIvVNsb3Qo62ysf5bp9u9N1iMIYBGyebz2JDhhAp3U0AmxQDWInqsMMbBiEo07NDBapax
        oLkJ22i//l32rvgbN0hJ2RVgJ45y0cJRMU0Rnpa/iSeWWndMO5X26+tR+gFJmVQoS+/Oa3
        7eX4LaNKO3ASQxw7CxTd2rg/T73ANAA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-kQzMcudEO4qXHnHYE4QSFw-1; Tue, 27 Oct 2020 03:46:51 -0400
X-MC-Unique: kQzMcudEO4qXHnHYE4QSFw-1
Received: by mail-ed1-f70.google.com with SMTP id y8so347938edj.5
        for <linux-input@vger.kernel.org>; Tue, 27 Oct 2020 00:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2/EViVRilM63Y1QXFyN/4sGHIsAejqS0hfp1TKo/7Oc=;
        b=BNGGcBBd8JMSDjX02N6q4uyM8Hd69aFlf8eSuSIho0RqCumz1PoUVLJCFFyawTqfgl
         6JzohU8Spmzz/3qPdxRTYVqDhQU+yFpcBMB0SXoK9vBmU6G3mO/Qj/zzK3OZ/WDWTzGk
         yVI9WzElpY0I3dEHIM4MMXVDLUUxerki1yPHF2ElORoQhkDIfRhPP9MzDfnIIGToK9nF
         IBNWulgNuCqOqO8lXqe0w+ZEU9WW6lfDlyUtYXMn1YX98hMaB24ReEGCs1VFZtt6LFcv
         ePRZ5U9wBLqaRCHQM40h8ShRWB5Dgniq9rjIzeWxHF1mOjneNEF9qXo4gTWSiwEqITEp
         t/yw==
X-Gm-Message-State: AOAM531TqYo/ffuFpJNcCDZQPZOYqN3NC8ZpZFFazS2+deSvKvbUleu3
        hUbGwfR1SiP763TXsDx/JlJ+wrDXZ00LqFpN030aK4CKduDqe4PtJyjd3A+Z4l0mE/rUC6XrKIp
        9rwrml8ao8ezgNjOWnEY0/Wk=
X-Received: by 2002:a50:c05b:: with SMTP id u27mr858951edd.290.1603784809933;
        Tue, 27 Oct 2020 00:46:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy98egzB7wKTkasrRz5Xq0NNqb2VXJU/gGoq8wPzWyoxy2RRXo8+m9aLcXetaTAdo5MCTR8Lw==
X-Received: by 2002:a50:c05b:: with SMTP id u27mr858925edd.290.1603784809563;
        Tue, 27 Oct 2020 00:46:49 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id b8sm392575edv.20.2020.10.27.00.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 00:46:48 -0700 (PDT)
Subject: Re: [PATCH V9] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Luke Jones <luke@ljones.dev>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org, andy@infradead.org,
        benjamin.tissoires@redhat.com
References: <20201025005615.40615-1-luke@ljones.dev>
 <7a4dd27f-5080-b651-9d8e-7aa57a5b895b@redhat.com>
 <GPTTIQ.UYDTGI32JMY01@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e7aa350c-c9d1-c657-7be9-9711821382f5@redhat.com>
Date:   Tue, 27 Oct 2020 08:46:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <GPTTIQ.UYDTGI32JMY01@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/26/20 9:46 PM, Luke Jones wrote:
> 
> G'day Hans.
> 
>> Can you try using "git send-email" for the next version ?
> 
> I do. And I just figured out why this happens, I was editing the subject
> line in vim before sending, and I have a white-space removal thing
> happening on write :(
> 
>> initialized
> 
> Done
> 
>> Please for the next version put a changelog here.
> 
> Darn... I did add a good changelog but it seems to have been cut.

That probably has something todo with how you edit the patch in between.

Normally you would let git send-email take care of the git format-patch
phase too and then contents in the commit message below the cut line
will be preserved.

Note you can set the version in the subject directly when calling
git send-email, there is no need to edit the patch for that.

git send-email should take all arguments which git format-patch accepts
and git format-patch allows you to pass -v#, e.g. for version 9 you
would pass -v9.



>>
>>>   drivers/hid/hid-asus.c | 116 ++++++++++++++++++++++++++++++++++++-----
>>>   drivers/hid/hid-ids.h  |   1 +
>>>   2 files changed, 103 insertions(+), 14 deletions(-)
>>>
>>>  diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>  index c183caf89d49..98b033b4951f 100644
>>>  --- a/drivers/hid/hid-asus.c
>>>  +++ b/drivers/hid/hid-asus.c
>>>  @@ -48,6 +48,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>   #define INPUT_REPORT_ID 0x5d
>>>   #define FEATURE_KBD_REPORT_ID 0x5a
>>>   #define FEATURE_KBD_REPORT_SIZE 16
>>>  +#define FEATURE_KBD_LED_REPORT_ID1 0x5d
>>>  +#define FEATURE_KBD_LED_REPORT_ID2 0x5e
>>>
>>>   #define SUPPORT_KBD_BACKLIGHT BIT(0)
>>>
>>>  @@ -80,6 +82,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>   #define QUIRK_T101HA_DOCK        BIT(9)
>>>   #define QUIRK_T90CHI            BIT(10)
>>>   #define QUIRK_MEDION_E1239T        BIT(11)
>>>  +#define QUIRK_ROG_NKEY_KEYBOARD        BIT(12)
>>>
>>>   #define I2C_KEYBOARD_QUIRKS            (QUIRK_FIX_NOTEBOOK_REPORT | \
>>>                            QUIRK_NO_INIT_REPORTS | \
>>>  @@ -332,6 +335,28 @@ static int asus_raw_event(struct hid_device *hdev,
>>>       if (drvdata->quirks & QUIRK_MEDION_E1239T)
>>>           return asus_e1239t_event(drvdata, data, size);
>>>
>>>  +    if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>  +        /*
>>>  +         * Skip these report ID, the device emits a continuous stream associated
>>>  +         * with the AURA mode it is in which looks like an 'echo'.
>>>  +        */
>>>  +        if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
>>>  +                report->id == FEATURE_KBD_LED_REPORT_ID2) {
>>>  +            return -1;
>>>  +        /* Additional report filtering */
>>>  +        } else if (report->id == FEATURE_KBD_REPORT_ID) {
>>>  +            /*
>>>  +             * G14 and G15 send these codes on some keypresses with no
>>>  +             * discernable reason for doing so. We'll filter them out to avoid
>>>  +             * unmapped warning messages later.
>>>  +            */
>>>  +            if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
>>>  +                    data[1] == 0x8a || data[1] == 0x9e) {
>>>  +                return -1;
>>>  +            }
>>>  +        }
>>>  +    }
>>>  +
>>>       return 0;
>>>   }
>>>
>>>  @@ -344,7 +369,11 @@ static int asus_kbd_set_report(struct hid_device *hdev, u8 *buf, size_t buf_size
>>>       if (!dmabuf)
>>>           return -ENOMEM;
>>>
>>>  -    ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, dmabuf,
>>>  +    /*
>>>  +     * The report ID should be set from the incoming buffer due to LED and key
>>>  +     * interfaces having different pages
>>>  +    */
>>>  +    ret = hid_hw_raw_request(hdev, buf[0], dmabuf,
>>>                    buf_size, HID_FEATURE_REPORT,
>>>                    HID_REQ_SET_REPORT);
>>>       kfree(dmabuf);
>>>  @@ -397,6 +426,44 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>>>       return ret;
>>>   }
>>>
>>>  +static int rog_nkey_led_init(struct hid_device *hdev)
>>>  +{
>>>  +    u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
>>>  +    u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 0x55, 0x53, 0x20,
>>>  +                0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>>>  +    u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
>>>  +                        0x05, 0x20, 0x31, 0x00, 0x08 };
>>>  +    int ret;
>>>  +
>>>  +    hid_info(hdev, "Asus initialise N-KEY Device");
>>>  +    /* The first message is an init start */
>>>  +    ret = asus_kbd_set_report(hdev, buf_init_start, sizeof(buf_init_start));
>>>  +    if (ret < 0)
>>>  +        hid_warn(hdev, "Asus failed to send init start command: %d\n", ret);
>>>  +    /* Followed by a string */
>>>  +    ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
>>>  +    if (ret < 0)
>>>  +        hid_warn(hdev, "Asus failed to send init command 1.0: %d\n", ret);
>>
>> Hmm, so this construction means that the final return value of this function
>> may be 0 even if some commands fail.
>>
>> The actual led calls device registration will get skipped on a failure return;
>> and we probably should skip that registration on any errors, so how about:
>>
>>     ret = asus_kbd_set_report(hdev, buf_init_start, sizeof(buf_init_start));
>>     if (ret < 0) {
>>         hid_warn(hdev, "Asus failed to send init start command: %d\n", ret);
>>         return ret;
>>     }
>>     /* Followed by a string */
>>     ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
>>     if (ret < 0) {
>>         hid_warn(hdev, "Asus failed to send init command 1.0: %d\n", ret);
>>         return ret;
>>     }
>>
>> etc. ?  This (return on first error) is the normal way of dealing with things
>> like this in the kernel.
>>
> 
> Done. Thanks for the pointer here.
> 
> I'll submit a v10, with changes from v8-v10 in the changelog.

Great, thank you.

> Sorry about that
> I'm really not sure at what stage the log got cut out.

No problem.

Regards,

Hans



> 
>>
>>
>>
>>
>>
>>>  +    /* Followed by a string */
>>>  +    ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
>>>  +    if (ret < 0)
>>>  +        hid_warn(hdev, "Asus failed to send init command 1.1: %d\n", ret);
>>>  +
>>>  +    /* begin second report ID with same data */
>>>  +    buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
>>>  +    buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
>>>  +
>>>  +    ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
>>>  +    if (ret < 0)
>>>  +        hid_warn(hdev, "Asus failed to send init command 2.0: %d\n", ret);
>>>  +
>>>  +    ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
>>>  +    if (ret < 0)
>>>  +        hid_warn(hdev, "Asus failed to send init command 2.1: %d\n", ret);
>>>  +
>>>  +    return ret;
>>>  +}
>>>  +
>>>   static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>>>                      enum led_brightness brightness)
>>>   {
>>>  @@ -460,19 +527,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>       unsigned char kbd_func;
>>>       int ret;
>>>
>>>  -    /* Initialize keyboard */
>>>  -    ret = asus_kbd_init(hdev);
>>>  -    if (ret < 0)
>>>  -        return ret;
>>>  +    if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>>  +        ret = rog_nkey_led_init(hdev);
>>>  +        if (ret < 0)
>>>  +            return ret;
>>>  +    } else {
>>>  +        /* Initialize keyboard */
>>>  +        ret = asus_kbd_init(hdev);
>>>  +        if (ret < 0)
>>>  +            return ret;
>>>
>>>  -    /* Get keyboard functions */
>>>  -    ret = asus_kbd_get_functions(hdev, &kbd_func);
>>>  -    if (ret < 0)
>>>  -        return ret;
>>>  +        /* Get keyboard functions */
>>>  +        ret = asus_kbd_get_functions(hdev, &kbd_func);
>>>  +        if (ret < 0)
>>>  +            return ret;
>>>
>>>  -    /* Check for backlight support */
>>>  -    if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>  -        return -ENODEV;
>>>  +        /* Check for backlight support */
>>>  +        if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>>>  +            return -ENODEV;
>>>  +    }
>>>
>>>       drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>>>                             sizeof(struct asus_kbd_leds),
>>>  @@ -751,8 +824,8 @@ static int asus_input_mapping(struct hid_device *hdev,
>>>            usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
>>>           return -1;
>>>
>>>  -    /* ASUS-specific keyboard hotkeys */
>>>  -    if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
>>>  +    /* ASUS-specific keyboard hotkeys and led backlight */
>>>  +    if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
>>>           switch (usage->hid & HID_USAGE) {
>>>           case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);    break;
>>>           case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);        break;
>>>  @@ -780,6 +853,18 @@ static int asus_input_mapping(struct hid_device *hdev,
>>>           /* Fn+F5 "fan" symbol on FX503VD */
>>>           case 0x99: asus_map_key_clear(KEY_PROG4);        break;
>>>
>>>  +        /* Fn+F5 "fan" symbol on N-Key keyboard */
>>>  +        case 0xae: asus_map_key_clear(KEY_PROG4);        break;
>>>  +
>>>  +        /* Fn+Ret "Calc" symbol on N-Key keyboard */
>>>  +        case 0x92: asus_map_key_clear(KEY_CALC);        break;
>>>  +
>>>  +        /* Fn+Left Aura mode previous on N-Key keyboard */
>>>  +        case 0xb2: asus_map_key_clear(KEY_PROG2);        break;
>>>  +
>>>  +        /* Fn+Right Aura mode next on N-Key keyboard */
>>>  +        case 0xb3: asus_map_key_clear(KEY_PROG3);        break;
>>>  +
>>>           default:
>>>               /* ASUS lazily declares 256 usages, ignore the rest,
>>>                * as some make the keyboard appear as a pointer device. */
>>>  @@ -1126,6 +1211,9 @@ static const struct hid_device_id asus_devices[] = {
>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>           USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD),
>>>         QUIRK_USE_KBD_BACKLIGHT },
>>>  +    { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>  +        USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>>>  +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>           USB_DEVICE_ID_ASUSTEK_T100TA_KEYBOARD),
>>>         QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
>>>  diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
>>>  index 6f370e020feb..c9f930ddcfd7 100644
>>>  --- a/drivers/hid/hid-ids.h
>>>  +++ b/drivers/hid/hid-ids.h
>>>  @@ -190,6 +190,7 @@
>>>   #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
>>>   #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
>>>   #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
>>>  +#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD    0x1866
>>>   #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD    0x1869
>>>
>>>   #define USB_VENDOR_ID_ATEN        0x0557
>>>  --
>>>  2.28.0
>>>
>>
> 
> 

