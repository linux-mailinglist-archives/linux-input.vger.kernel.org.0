Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E6F3196CE
	for <lists+linux-input@lfdr.de>; Fri, 12 Feb 2021 00:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhBKXnu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Feb 2021 18:43:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43533 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229681AbhBKXnt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Feb 2021 18:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613086941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wSpG2+vY6NWrsHbZ6OA3pbPqZzlnGWNOFKtjlIX1uWY=;
        b=bIs9isOgM0AazBINytDb35jpGVJ32HECHpAewg4baDzWO2Ty7xcbxnKUZxN0iKpBTxeGhz
        847XcGXrIBQtlxTUcCWQq8b1SDaRuuGMcN+LTxw7KPSfM4rOQO4nU/wqO8+W9kQCvJVPNb
        7XmI36+OvtakLu9L8DEZjsQZwgtYLDo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-45invXDaPD2qCaYF2EBrHQ-1; Thu, 11 Feb 2021 18:42:17 -0500
X-MC-Unique: 45invXDaPD2qCaYF2EBrHQ-1
Received: by mail-ed1-f72.google.com with SMTP id f11so68131edk.13
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 15:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=wSpG2+vY6NWrsHbZ6OA3pbPqZzlnGWNOFKtjlIX1uWY=;
        b=bGVsv3vsQTF/9fUlbQX1Q8yrtg9AZLY0SSOa8P6aE7FbpCU5Y6G2RmMis1bNas5k9n
         aQKFC4WS0iecy0Iv5iBxX68TF40ougoV/rFrcuAeF1vu48gqT/y3ktY6TXPPk883yhCP
         u+mneo9J2krDQuPrzxAI5Lzzk0liopxj40yGblW5QpX7bp9/RM5LObpQ7l5vhPEB2dM5
         EzRZIpYV4WOZPnJQ3s2dqVi6URz/3RMTeAyOnodl3Aj5HZMHcRsZ6mskDtAk+3DEWdQ6
         ie/McL0uNYHv/zdysDpftqt7+2pfBRm03bkoymtYV/c6gDOy7/xfI5HwVBr71br4AHYa
         WrtQ==
X-Gm-Message-State: AOAM5308/fncjXsKO07p2mEShPT3rts2z9ATV7vd0a/zSj4YrddJRhtk
        3zqP9y14Iglgfo4fczESzQt9d4cyS+0GaZUiozcWJbbrcd/16dTUZ5oarDD4ZMPGE5Zjj8GyR8k
        frsw5hlOgHUYRIvBZANIiaxWkXnjDmPpSPzcqo/jK28TJLzKtkprXAOM76X8HDP4PXwi58s2PhR
        Q=
X-Received: by 2002:a17:906:8591:: with SMTP id v17mr190784ejx.30.1613086935834;
        Thu, 11 Feb 2021 15:42:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCFJwvlqo4mm9ye2Jw2AjCr63zLzxjKAtISnEQLOKi9xRRQjBPHiRvyvN0zZvShwvO1elzHg==
X-Received: by 2002:a17:906:8591:: with SMTP id v17mr190757ejx.30.1613086935488;
        Thu, 11 Feb 2021 15:42:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s12sm5062661edu.28.2021.02.11.15.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 15:42:14 -0800 (PST)
Subject: Re: Support for X1 tablet keyboard (was Re: [PATCH] platform/x86:
 thinkpad_acpi: handle HKEY 0x4012, 0x4013 events)
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>
Cc:     linux-input <linux-input@vger.kernel.org>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de>
 <be3f6a0f-281f-975f-70c2-b167adb5547c@redhat.com>
 <64a4f249-f90b-c6b2-887f-55a016d93c65@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <29961a1a-a66a-e732-ff7c-c7f2da52a83d@redhat.com>
Date:   Fri, 12 Feb 2021 00:42:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <64a4f249-f90b-c6b2-887f-55a016d93c65@a-kobel.de>
Content-Type: multipart/mixed;
 boundary="------------7B2B611B04312046DFE622D9"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------7B2B611B04312046DFE622D9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/9/21 4:16 PM, Alexander Kobel wrote:
> Hi,
> 
> On 2/8/21 11:17 AM, Hans de Goede wrote:
>> On 2/7/21 6:55 PM, Alexander Kobel wrote:
>>> <snip>
>>> I'll go off and try to improve.
>>
>> So Nitin has been kind enough to provide us with some docs for this,
>> please see me reply to Nitin's email and lets continue this part of this mail
>> thread there.
> 
> Right. I have the other patch ready, thanks to your great help. I'm
> waiting for Nitin's okay whether / how much info I can copy from the
> reference sheet to source code comments. Once I have that confirmation,
> I will post the revised patch.
> 
>> <snip>
>>
>>> Finally, I mentioned some open ends already on a post to ibm-acpi-devel
>>> at https://sourceforge.net/p/ibm-acpi/mailman/message/37200082/; this
>>> very question is among them.
>>> I will start tackling the SW_TABLET_MODE event issue first, but if Mark
>>> and Nitin can already hint about the keyboard shortcuts, it'd be highly
>>> appreciated.
>>
>> I think I might be able to help there, a couple of months ago I bought
>> a second-hand thinkpad-10 tablet which also has a USB attached keyboard.
>>
>> In hindsight I guess I could have asked Mark and Nitin for some more info,
>> but I went on autopilot and just ran hexdump -C on the /dev/hidraw node
>> to see which events all the keys send.
>>
>> And I fired up an usb-sniffer under Windows to figure out the audio-leds,
>> since I'm used to just figure these things out without help from the vendor :)
> 
> Yeah, why take the boring route if you know how to do all the work on
> your own... ;-)
> 
>> See the recent commits here for my work on this:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/hid/hid-lenovo.c
> 
> Thanks, very helpful.
> 
>> So on the ibm-acpi list message you said that the kbd sends the following:
>>
>> type 4 (EV_MSC), code 4 (MSC_SCAN), value c0001
>> type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 1
>>
>> For the Fn-keys, does it send the same MSC_SCAN code for *all* the
>> non-working Fn-keys ?
> 
> Correct. And I can confirm that /dev/hidraw1 lets me distinguish between
> the keys.
> 
>> If so then it seems that this is very much like the thinkpad 10 kbd dock
>> which also does this, see the lenovo_input_mapping_tp10_ultrabook_kbd()
>> function in drivers/hid/hid-lenovo.c .
>>
>> If I have that right, then I think we should be able to get the
>> Fn keys to work without too much trouble. You could try hacking up
>> drivers/hid/hid-lenovo.c a bit:
> 
> (Not yet there, but will investigate.)
> 
>> 1. Add an entry to the lenovo_devices array like this:
>>
>> 	/*
>> 	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard part,
>> 	 * while letting hid-multitouch.c handle the touchpad and trackpoint.
>> 	 */
>>         { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>>                      USB_VENDOR_ID_LENOVO,
>>                      USB_DEVICE_ID_LENOVO_X1_TAB),
>>
>> 2. Add the following entry to the switch-case in lenovo_input_mapping() :
>>
>>         case USB_DEVICE_ID_LENOVO_X1_TAB:
>>                 return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
>>                                                                usage, bit, max);
>>
>> And then build hid-lenovo.c and modprobe it.
>>
>> After the modprobe to:
>>
>> ls -l /sys/bus/hid/devices/0003:17EF:60A3.*/driver
>>
>> This should show 2 devices (I guess) with one being bound to hid-lenovo
>> and 1 being bound to hid-multitouch.
> 
> So far (without patching hid-lenovo), 2 bound to hid-generic and 1 to
> hid-multitouch.

Ok, so it seems that they kept the thinkpad 10 kbd bits (mostly) with
1 keyboard interface using the usb boot kbd interface (so that it will
also work inside the BIOS) and a second interface for multimedia-keys +
the mouse emulation of the thinkpad 10 touchpad, those are interfaces
1 and 2, except that they removed the mouse emulation as they added a
new proper multi-touch capable touchpad as interface 3; and that one
also handles the pointing stick I believe.

So yes 2 bound to hid-generic, 1 bound to hid-multitouch seems to be
correct.

>> If this works some of your Fn + F# keys will now hopefully start doing
>> something, you can play around with modifying lenovo_input_mapping_tp10_ultrabook_kbd
>> to make it do the right thing for your kbd.
>>z
>> ###
>>
>> About LED support, just enabling the LED support bits for the
>> USB_DEVICE_ID_LENOVO_TP10UBKBD handling for now might work fine,
>> but there is a tiny chance that sending the wrong command somehow puts
>> the kbd in firmware update mode, I had that happen once with a Logitech
>> kbd which did not seem to have any kind of handshake / passcode to avoid
>> accidental fw updates (*).
>>
>> If you can give me a dump of the hid-descriptors for your keyboard,
>> then I can check if that the LEDs might work the same way too (or not).
>>
>> The easiest way to get a dump is to run the following command as root:
>>
>> cat /sys/kernel/debug/hid/0003:17EF:60A3.*/rdesc > rdesc
>>
>> And then attach rdesc to your next email.
> 
> Please find this one attached already now.
> In case it helps, the * expands to 0057 0058 0059 on my system.

Ok, so there still is an output-report number 9 on the second interface,
which probably still controls the LEDS but its descriptors are subtly
different. Although different in a good way I guess because the thinkpad
10 dock descriptor describes the 2 bytes in the output report as being
in the range of 0-1 which is not how they are actually used.

So I think that the code for the Thinkpad 10 ultrabook keyboard as
Lenovo calls it, should also work on the X1 tablet thin keyboard.

I've prepared a set of patches which enable the tp10ubkbd code on
the X1 tablet thin keyboard. But beware as mentioned before there is a
tiny chance that sending the wrong command somehow puts the kbd in
firmware update mode. I believe that trying the tp10ubkbd code is safe,
esp. since this is using a 2 byte large output report and using that
for fw-updating would be a bit weird. Still there is a small risk
(there always is when poking hw) so I will leave it up to you if
you are willing to try this.

Here is how I test this (note you will need to adjust the paths a bit) :

Toggle the 2 mute LEDs:

[root@localhost ~]# echo 1 > /sys/class/leds/0003:17EF:6062.000E:amber:micmute/brightness
[root@localhost ~]# echo 0 > /sys/class/leds/0003:17EF:6062.000E:amber:micmute/brightness
[root@localhost ~]# echo 1 > /sys/class/leds/0003:17EF:6062.000E:amber:mute/brightness
[root@localhost ~]# echo 0 > /sys/class/leds/0003:17EF:6062.000E:amber:mute/brightness

Check Fnlock LED state (toggle on kbd by pressing Fn + Esc) :

[root@localhost ~]# cat /sys/bus/hid/devices/0003:17EF:6062.000E/fn_lock
1
[root@localhost ~]# cat /sys/bus/hid/devices/0003:17EF:6062.000E/fn_lock
0

Change Fnlock state from within Linux:

[root@localhost ~]# echo 1 > /sys/bus/hid/devices/0003:17EF:6062.000E/fn_lock
[root@localhost ~]# echo 0 > /sys/bus/hid/devices/0003:17EF:6062.000E/fn_lock

(The Led on the kbd should update; and the F## key behavior should change)

Regards,

Hans




--------------7B2B611B04312046DFE622D9
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-HID-lenovo-Fix-false-positive-errors-on-setting-tp10.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-HID-lenovo-Fix-false-positive-errors-on-setting-tp10.pa";
 filename*1="tch"

From 44311c907697180046648736dc82b34e8ab5beaf Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 11 Feb 2021 23:14:20 +0100
Subject: [PATCH 1/5] HID: lenovo: Fix false positive errors on setting
 tp10ubkbd LEDs

Fix the error check in lenovo_led_set_tp10ubkbd(), on success
hid_hw_raw_request() returns the number of bytes send. So we should
check for (ret != 3) rather then for (ret != 0).

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index c6c8e20f3e8d..69d709439676 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -75,7 +75,7 @@ static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
 	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 3,
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret)
+	if (ret != 3)
 		hid_err(hdev, "Set LED output report error: %d\n", ret);
 
 	mutex_unlock(&data->led_report_mutex);
-- 
2.30.1


--------------7B2B611B04312046DFE622D9
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-HID-lenovo-Check-hid_get_drvdata-returns-non-NULL-in.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-HID-lenovo-Check-hid_get_drvdata-returns-non-NULL-in.pa";
 filename*1="tch"

From c24649efa10189d49b87a19b6a999ccfa8987801 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 11 Feb 2021 23:41:53 +0100
Subject: [PATCH 2/5] HID: lenovo: Check hid_get_drvdata() returns non NULL in
 lenovo_event()

The HID lenovo probe function only attaches drvdata to one of the
USB interfaces, but lenovo_event() will get called for all USB interfaces
to which hid-lenovo is bound.

This allows a malicious device to fake being a device handled by
hid-lenovo, which generates events for which lenovo_event() has
special handling (and thus dereferences hid_get_drvdata()) on another
interface triggering a NULL pointer exception.

Add a check for hid_get_drvdata() returning NULL, avoiding this
possible NULL pointer exception.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 69d709439676..8a040f6040eb 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -498,6 +498,9 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
 static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
+	if (!hid_get_drvdata(hdev))
+		return 0;
+
 	switch (hdev->product) {
 	case USB_DEVICE_ID_LENOVO_CUSBKBD:
 	case USB_DEVICE_ID_LENOVO_CBTKBD:
-- 
2.30.1


--------------7B2B611B04312046DFE622D9
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-HID-lenovo-Set-default_trigger-s-for-the-mute-and-mi.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-HID-lenovo-Set-default_trigger-s-for-the-mute-and-mi.pa";
 filename*1="tch"

From 0fde88dac366cca64fd38b4303b329adfec643ef Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 11 Feb 2021 23:21:39 +0100
Subject: [PATCH 3/5] HID: lenovo: Set default_trigger-s for the mute and
 micmute LEDs

The mute and mic-mute LEDs should be automatically turned on/off based
on the audio-cards mixer settings.

Add the standardized default-trigger names for this, so that the alsa
code can turn the LEDs on/off as appropriate (on supported audo cards).

This brings the mute/mic-mute LED support inline with the thinkpad_acpi
support for the same LEDs in keyboards directly connected to the
laptop's embedded-controller.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 8a040f6040eb..c4cd4f69cdfd 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -824,6 +824,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	snprintf(name_micm, name_sz, "%s:amber:micmute", dev_name(&hdev->dev));
 
 	data->led_mute.name = name_mute;
+	data->led_mute.default_trigger = "audio-mute";
 	data->led_mute.brightness_get = lenovo_led_brightness_get;
 	data->led_mute.brightness_set = lenovo_led_brightness_set;
 	data->led_mute.dev = &hdev->dev;
@@ -832,6 +833,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 		return ret;
 
 	data->led_micmute.name = name_micm;
+	data->led_micmute.default_trigger = "audio-micmute";
 	data->led_micmute.brightness_get = lenovo_led_brightness_get;
 	data->led_micmute.brightness_set = lenovo_led_brightness_set;
 	data->led_micmute.dev = &hdev->dev;
-- 
2.30.1


--------------7B2B611B04312046DFE622D9
Content-Type: text/x-patch; charset=UTF-8;
 name="0004-HID-lenovo-Rework-how-the-tp10ubkbd-code-decides-whi.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0004-HID-lenovo-Rework-how-the-tp10ubkbd-code-decides-whi.pa";
 filename*1="tch"

From 7f03da5567b810f1b3790674a0fb34db4866ceca Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 11 Feb 2021 23:10:27 +0100
Subject: [PATCH 4/5] HID: lenovo: Rework how the tp10ubkbd code decides which
 USB interface to use

Instead of looking for a hdev with a type of HID_TYPE_USBMOUSE find
the interface for the mute/mic-mute/fn-lock LEDs by checking for the
output-report which is used to set them.

This is a preparation patch for adding support for the LEDs on the
X1 tablet thin keyboard which uses the same output-report, but has
a separate (third) USB interface for the touchpad/mouse functionality.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index c4cd4f69cdfd..33033b74b434 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -957,11 +957,24 @@ static const struct attribute_group lenovo_attr_group_tp10ubkbd = {
 
 static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
 {
+	struct hid_report_enum *rep_enum;
 	struct lenovo_drvdata *data;
+	struct hid_report *rep;
+	bool found;
 	int ret;
 
-	/* All the custom action happens on the USBMOUSE device for USB */
-	if (hdev->type != HID_TYPE_USBMOUSE)
+	/*
+	 * The LEDs and the Fn-lock functionality use output report 9,
+	 * with an application of 0xffa0001, add the LEDs on the interface
+	 * with this output report.
+	 */
+	found = false;
+	rep_enum = &hdev->report_enum[HID_OUTPUT_REPORT];
+	list_for_each_entry(rep, &rep_enum->report_list, list) {
+		if (rep->application == 0xffa00001)
+			found = true;
+	}
+	if (!found)
 		return 0;
 
 	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
-- 
2.30.1


--------------7B2B611B04312046DFE622D9
Content-Type: text/x-patch; charset=UTF-8;
 name="0005-HID-lenovo-WIP-Add-support-for-Thinkpad-X1-Tablet-Th.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0005-HID-lenovo-WIP-Add-support-for-Thinkpad-X1-Tablet-Th.pa";
 filename*1="tch"

From 44a8670e26c6cb57c03c26d0476f813a2856434f Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 11 Feb 2021 23:40:11 +0100
Subject: [PATCH 5/5] HID: lenovo: WIP: Add support for Thinkpad X1 Tablet Thin
 keyboard

WIP: untested and the key mappings in lenovo_input_mapping_x1_tab_kbd()
need work.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 46 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 33033b74b434..9a628e7a2382 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -255,6 +255,39 @@ static int lenovo_input_mapping_tp10_ultrabook_kbd(struct hid_device *hdev,
 	return 0;
 }
 
+static int lenovo_input_mapping_x1_tab_kbd(struct hid_device *hdev,
+		struct hid_input *hi, struct hid_field *field,
+		struct hid_usage *usage, unsigned long **bit, int *max)
+{
+	/*
+	 * The ThinkPad X1 Tablet Thin Keyboard uses 0x000c0001 usage for
+	 * a bunch of keys which have no standard consumer page code.
+	 */
+	// FIXME the below mappings are taken for the tp10_ultrabook_kbd mapping function
+	// these may very well need to be changed for the X1 Tablet Thin Keyboard
+	if (usage->hid == 0x000c0001) {
+		switch (usage->usage_index) {
+		case 8: /* Fn-Esc: Fn-lock toggle */
+			map_key_clear(KEY_FN_ESC);
+			return 1;
+		case 9: /* Fn-F4: Mic mute */
+			map_key_clear(KEY_MICMUTE);
+			return 1;
+		case 10: /* Fn-F7: Control panel */
+			map_key_clear(KEY_CONFIG);
+			return 1;
+		case 11: /* Fn-F8: Search (magnifier glass) */
+			map_key_clear(KEY_SEARCH);
+			return 1;
+		case 12: /* Fn-F10: Open My computer (6 boxes) */
+			map_key_clear(KEY_FILE);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
 static int lenovo_input_mapping(struct hid_device *hdev,
 		struct hid_input *hi, struct hid_field *field,
 		struct hid_usage *usage, unsigned long **bit, int *max)
@@ -278,6 +311,8 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
 							       usage, bit, max);
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
+		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
 	default:
 		return 0;
 	}
@@ -364,6 +399,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 		lenovo_features_set_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
 		break;
 	}
@@ -506,6 +542,7 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 	case USB_DEVICE_ID_LENOVO_CBTKBD:
 		return lenovo_event_cptkbd(hdev, field, usage, value);
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
 	default:
 		return 0;
@@ -802,6 +839,7 @@ static void lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		lenovo_led_set_tpkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
 	}
@@ -1036,6 +1074,7 @@ static int lenovo_probe(struct hid_device *hdev,
 		ret = lenovo_probe_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		ret = lenovo_probe_tp10ubkbd(hdev);
 		break;
 	default:
@@ -1101,6 +1140,7 @@ static void lenovo_remove(struct hid_device *hdev)
 		lenovo_remove_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		lenovo_remove_tp10ubkbd(hdev);
 		break;
 	}
@@ -1140,6 +1180,12 @@ static const struct hid_device_id lenovo_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IBM, USB_DEVICE_ID_IBM_SCROLLPOINT_800DPI_OPTICAL_PRO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_SCROLLPOINT_OPTICAL) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_TP10UBKBD) },
+	/*
+	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard
+	 * part, while letting hid-multitouch.c handle the touchpad and trackpoint.
+	 */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
 	{ }
 };
 
-- 
2.30.1


--------------7B2B611B04312046DFE622D9--

