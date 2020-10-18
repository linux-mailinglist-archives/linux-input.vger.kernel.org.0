Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C573729201E
	for <lists+linux-input@lfdr.de>; Sun, 18 Oct 2020 23:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbgJRVYK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Oct 2020 17:24:10 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39385 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726458AbgJRVYK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Oct 2020 17:24:10 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 472C1896;
        Sun, 18 Oct 2020 17:24:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 18 Oct 2020 17:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HiCmom
        9vssxuuIXOxZ7QwMNJl9od/MbmJlWjmflO+Pw=; b=LiUc+jp5w/uUvqVCdQU5zO
        og+Tb9fVr0fpp7QFt1NizCoc29uIw48lMCox50DILq0LxwMu9Gd5hkOqg71Xktq0
        RPMqeEcGro4jI8XU+zIHc3fUi4W2yj0MS+/OSjPXZHNVdU2NyZ5s28W+xkrSyyPQ
        lwS5c0IcDDFFMgwkl4h7OkTlVjBbu+/GrH3DpePmUTLtOXd1m4d3OpYWTIGHgmKq
        2OYBbhuU2uTP+XNuMOC0CyCJxAuYreYOoIskqB9zW4txcsKi2h8zIe6n0vL7HUtV
        hpVvf8CsX8RtK1ajolW78zKpiZvcC7+4zqPadD2yhevxl/Bd5ig12ocGo/xQEHng
        ==
X-ME-Sender: <xms:eLKMX5SWZq1esfkOvZc932LyKHouMgimQTg2LW72kjeqF2bZeKvOMQ>
    <xme:eLKMXywxXXA_gi2_w-BTjmnJkgOa6fVc0g3mOQL0if3oXHsHYfXYMU2Lb_QiNXyec
    _AcicX1WPOicflCyP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieelgdduiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhuffvkfgjfhfogggtsehttdertdertddvnecuhfhrohhmpefnuhhkvgcu
    lfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    fgfeefudffhffgueehgeffffeggeevieefueethfeijefftedugfeuveethedtteenucfk
    phepvddtfedruddugedrudeguddrudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:eLKMX-3PywU4Nt3f25ZFoExLehf82UyiFccXdSVrNp-ifSivfuE5oQ>
    <xmx:eLKMXxDi9Q20g8yeicQ53LRt-SbCaai0ScFniXv9ZizCQOOUDPMn8w>
    <xmx:eLKMXyhlz109MwAfRe0QZ9k_-ER-1axwu3WVHWCAdoBRqncHvtdcGw>
    <xmx:eLKMX1vvIhu9ilKpbxA1l7ZK0wX5cwUrvBOvzjLACsogM0kL7Dj51g>
Received: from [192.168.20.20] (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id 779D9328005A;
        Sun, 18 Oct 2020 17:24:03 -0400 (EDT)
Date:   Mon, 19 Oct 2020 10:23:50 +1300
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH V8] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-Id: <Q32FIQ.27DE313FPONY1@ljones.dev>
In-Reply-To: <CAHp75VfOV2DvngsO87PLXwNKQtR-RaC4XzbBk_7wDVSEaBMrzw@mail.gmail.com>
References: <20201013073508.10476-1-luke@ljones.dev>
        <CAHp75VfOV2DvngsO87PLXwNKQtR-RaC4XzbBk_7wDVSEaBMrzw@mail.gmail.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Thu, Oct 15, 2020 at 14:11, Andy Shevchenko 
<andy.shevchenko@gmail.com> wrote:
> On Tue, Oct 13, 2020 at 10:35 AM Luke D Jones <luke@ljones.dev> wrote:
>> 
>>  The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
>>  almost all modern ASUS gaming laptops with slight changes to the
>>  firmware. This patch enables: Fn+key hotkeys, keyboard backlight
>>  brightness control, and notify asus-wmi to toggle "fan-mode".
>> 
>>  The keyboard has many of the same key outputs as the existing ASUS
>>  keyboard including a few extras, and varies a little between laptop
>>  models.
>> 
>>  Additionally this keyboard requires the LED interface to be
>>  intitialised before such things as keyboard backlight control work.
> 
> initialised

Done

> 
>>  Misc changes in scope: update some hardcoded comparisons to use an
>>  available define.
> ...
> 
>>  @@ -26,6 +26,8 @@
>>   #include <linux/dmi.h>
>>   #include <linux/hid.h>
>>   #include <linux/module.h>
>>  +
>>  +#include <linux/acpi.h>
> 
> Blank line is not needed and perhaps put new inclusion somehow ordered
> (yes, I see the order is broken, by maybe try your best).

Done

> 
>>   #include <linux/platform_data/x86/asus-wmi.h>
>>   #include <linux/input/mt.h>
>>   #include <linux/usb.h> /* For to_usb_interface for T100 touchpad 
>> intf check */
> 
> ...
> 
>>  +/*
>>  + * This enables triggering events in asus-wmi
>>  + */
>>  +static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 
>> code)
>>  +{
>>  +       int err;
>>  +       u32 retval;
>>  +
>>  +       err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
>>  +               ASUS_WMI_DEVID_NOTIF, code, &retval);
>>  +       if (err) {
> 
>>  +               pr_warn("Failed to notify asus-wmi: %d\n", err);
> 
> dev_warn() ?

Done (changed to dev_warn. Sorry, I wasn't sure what to use)

> 
>>  +               return err;
>>  +       }
> 
>>  +       if (retval != 0) {
> 
> if (retval)
> 
>>  +               pr_warn("Failed to notify asus-wmi (retval): 
>> 0x%x\n", retval);
> 
> dev_warn()?

Done

> 
> Now a question is why warn and not err level for both messages?
> And maybe even hid_err() / hid_warn().
> 

I guess because it's not a show-stopper? The whole device still works
perfectly fine regardless of the wmi/acpi method call result.

Which I guess raises the question that since this is actually an ACPI 
call
is there another warn function more suitable?

>>  +               return -EIO;
>>  +       }
>>  +
>>  +       return 0;
>>  +}
> 
> ...
> 
>>   static int asus_event(struct hid_device *hdev, struct hid_field 
>> *field,
>>                        struct hid_usage *usage, __s32 value)
>>   {
>>  -       if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
>>  +       if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
> 
> Seems like a separate change.
> 

Okay, I've reverted this, will submit a separate patch at a later date.

> ...
> 
>>  +       int ret;
> 
> Inconsistent with the first part of the patch there you used err. So,
> be consistent.

Done. A lot of this patch was made by looking at similar code :)

> 
>>  +       if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>>  +               /*
>>  +                * Skip these report ID, the device emits a 
>> continuous stream associated
>>  +                * with the AURA mode it is in which looks like an 
>> 'echo'
> 
> + period at the end.
> 
>>  +               */
>>  +               if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
>>  +                               report->id == 
>> FEATURE_KBD_LED_REPORT_ID2) {
> 
>>  +                       return -1;
> 
> is -1 a good return code? (this Q for all cases)
> 
>>  +               /* Additional report filtering */
>>  +               } else if (report->id == FEATURE_KBD_REPORT_ID) {
>>  +                       /* Fn+F5 "fan" symbol, trigger WMI event to 
>> toggle next mode */
>>  +                       if (data[1] == 0xae) {
>>  +                               ret = asus_wmi_send_event(drvdata, 
>> 0xae);
>>  +                               if (ret < 0) {
>>  +                                       hid_warn(hdev, "Asus failed 
>> to trigger fan control event");
>>  +                               }
> 
>>  +                               return -1;
>>  +                       /*
>>  +                        * G14 and G15 send these codes on some 
>> keypresses with no
>>  +                        * discernable reason for doing so. We'll 
>> filter them out to avoid
>>  +                        * unmapped warning messages later
> 
> Period at the end.
> This is for all multi-line comments.

Done

> 
>>  +                       */
>>  +                       } else if (data[1] == 0xea || data[1] == 
>> 0xec || data[1] == 0x02 ||
>>  +                                       data[1] == 0x8a || data[1] 
>> == 0x9e) {
>>  +                               return -1;
>>  +                       }
>>  +               }
>>  +       }
> 
> ...
> 
>>  +static int rog_nkey_led_init(struct hid_device *hdev)
>>  +{
>>  +       u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
>>  +       u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 
>> 0x55, 0x53, 0x20,
>>  +                               0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 
>> 0x6e, 0x63, 0x2e, 0x00 };
>>  +       u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
>>  +                                               0x05, 0x20, 0x31, 
>> 0x00, 0x08 };
>>  +       int ret;
>>  +
>>  +       hid_info(hdev, "Asus initialise N-KEY Device");
>>  +       /* The first message is an init start */
>>  +       ret = asus_kbd_set_report(hdev, buf_init_start, 
>> sizeof(buf_init_start));
>>  +       if (ret < 0)
>>  +               hid_err(hdev, "Asus failed to send init start 
>> command: %d\n", ret);
>>  +       /* Followed by a string */
>>  +       ret = asus_kbd_set_report(hdev, buf_init2, 
>> sizeof(buf_init2));
>>  +       if (ret < 0)
>>  +               hid_err(hdev, "Asus failed to send init command 
>> 1.0: %d\n", ret);
>>  +       /* Followed by a string */
>>  +       ret = asus_kbd_set_report(hdev, buf_init3, 
>> sizeof(buf_init3));
>>  +       if (ret < 0)
>>  +               hid_err(hdev, "Asus failed to send init command 
>> 1.1: %d\n", ret);
> 
> If you do hid_err() why are you not bailing out?
> Mis-leveling of messages otherwise.
> 

Corrected to hid_warn. Most of the device is still completely usable 
without the
LED's working so it doesn't seem like good behaviour to kill 
functionality.

Thanks Andy. A new patch will be coming in the next few days.

Kind regards, Luke.


