Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D0723B203
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 03:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgHDA7o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Aug 2020 20:59:44 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34353 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726276AbgHDA7o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Aug 2020 20:59:44 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 21D855C007E;
        Mon,  3 Aug 2020 20:59:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Mon, 03 Aug 2020 20:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=sCpbndeQRU6uxq7gxf7STSDQhphwfEqnYwC1Tiwgk
        wI=; b=cfu+c3bZmX6sNT8FMVqVXO5jdzhC26A8vbz/tJbDF5CuC/bH/yQfl7fRg
        VQg7rQ/14iLs9rjkDPnV73WpZyH6iem4kp67zLsJ1fAqmlFh9KwULGRDF+WiMkBk
        g7v2jn9+agiJBlzaNN2FFdn+h6kklJQOs3tmDSd3RNFCZBX65r930/1GUnhAqgkq
        RSws3Mdk3FZNjidhWBagKtyjdXkAvntGUzrbwuLwYpvcJ7RkPWQsfrrN5F/hxaIV
        sOgzJduxaMaal9uvdEDDrcsReh+xEclSMsIuSvQBiOHgKSZ7RACb9LeAK8lhtR4b
        NMcfI1RwmH0y0tkZrV3UjSJjm/Ahw==
X-ME-Sender: <xms:_bIoX442BMcVKcdJV9qFN7y2SWyLhuEEsC6Y1cgccbRCHk_OE6BSBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrjeehgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthejre
    dttderjeenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdr
    uggvvheqnecuggftrfgrthhtvghrnhepgfffveefledvgeffgeeiieejveevveffgeekle
    evgefhheegleeludelheeiheetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfk
    phepvddtfedruddugedrudeguddrudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:_bIoX57qrDwH6sUjfXIL3AA6sbOrxPfmceEQwZTBACW7-pnh2pEZ3Q>
    <xmx:_bIoX3cxcnVzxYE0NugxeB7Pg3IKEn_JAIQNbhQ6xFWWXCesmQus3w>
    <xmx:_bIoX9Jlp6q6E8JBY7K5ASC2KmnmzWjROlkblbD7O1quvFuesUCbYw>
    <xmx:_rIoXxWlQ-blIyfHn2Sdr3E5Jt8ubx6HGp4pwXdXRSNYCMjqgBpcUw>
Received: from [192.168.20.21] (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id E18BC3060067;
        Mon,  3 Aug 2020 20:59:39 -0400 (EDT)
Message-ID: <15c7234131d3cc37d93a27659c3aaaac82a4e440.camel@ljones.dev>
Subject: Re: [PATCH V3]: HID: asus: add support for ASUS N-Key keyboard
From:   Luke Jones <luke@ljones.dev>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com
Date:   Tue, 04 Aug 2020 12:59:33 +1200
In-Reply-To: <K6JIEQ.8WHC60A0TYJ6@ljones.dev>
References: <K6JIEQ.8WHC60A0TYJ6@ljones.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-08-04 at 12:11 +1200, Luke Jones wrote:
> Enable missing functionality of the keyboard found in many ASUS
> Zephyrus laptops: Fn key combos and hotkeys, keyboard backlight
> brightness control, and notify asus-wmi to toggle "fan-mode".
> Two input event codes are added for keyboard LED mode switching
> prev/next.
> 
> The keyboard has many of the same key outputs as the existing G752
> keyboard including a few extras, and varies a little between laptop
> models.
> 
> Additionally the keyboard requires the LED interface to be
> intitialised before such things as keyboard backlight control work.
> 
> Misc changes in scope: update some hardcoded comparisons to use an
> available define, change "Mic Toggle" to use a keycode that works.
> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>
> ---
> drivers/hid/hid-asus.c | 166 ++++++++++++++++++---
> drivers/hid/hid-ids.h | 1 +
> include/linux/platform_data/x86/asus-wmi.h | 2 +
> include/uapi/linux/input-event-codes.h | 7 +
> 4 files changed, 153 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index c183caf89d49..5dfca90cd616 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -26,10 +26,12 @@
> #include <linux/dmi.h>
> #include <linux/hid.h>
> #include <linux/module.h>
> +#include <linux/acpi.h>
> #include <linux/platform_data/x86/asus-wmi.h>
> #include <linux/input/mt.h>
> #include <linux/usb.h> /* For to_usb_interface for T100 touchpad
> intf 
> check */
> #include <linux/power_supply.h>
> +#include <../drivers/platform/x86/asus-wmi.h>
> 
> #include "hid-ids.h"
> 
> @@ -48,6 +50,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and
> TouchPad");
> #define INPUT_REPORT_ID 0x5d
> #define FEATURE_KBD_REPORT_ID 0x5a
> #define FEATURE_KBD_REPORT_SIZE 16
> +#define FEATURE_KBD_LED_REPORT_ID1 0x5d
> +#define FEATURE_KBD_LED_REPORT_ID2 0x5e
> 
> #define SUPPORT_KBD_BACKLIGHT BIT(0)
> 
> @@ -80,6 +84,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and
> TouchPad");
> #define QUIRK_T101HA_DOCK BIT(9)
> #define QUIRK_T90CHI BIT(10)
> #define QUIRK_MEDION_E1239T BIT(11)
> +#define QUIRK_ROG_NKEY_KEYBOARD BIT(12)
> 
> #define I2C_KEYBOARD_QUIRKS (QUIRK_FIX_NOTEBOOK_REPORT | \
>        QUIRK_NO_INIT_REPORTS | \
> @@ -305,10 +310,33 @@ static int asus_e1239t_event(struct
> asus_drvdata 
> *drvdat, u8 *data, int size)
>  return 0;
> }
> 
> +/*
> + * This enables triggering events in asus-wmi
> + */
> +static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
> +{
> + int err;
> + u32 retval;
> +
> + err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> + ASUS_WMI_METHODID_NOTIF, code, &retval);
> + if (err) {
> + pr_warn("Failed to notify asus-wmi: %d\n", err);
> + return err;
> + }
> +
> + if (retval != 0) {
> + pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
> + return -EIO;
> + }
> +
> + return 0;
> +}
> +
> static int asus_event(struct hid_device *hdev, struct hid_field
> *field,
>         struct hid_usage *usage, __s32 value)
> {
> - if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> + if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
>      (usage->hid & HID_USAGE) != 0x00 &&
>      (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>   hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
> @@ -332,6 +360,20 @@ static int asus_raw_event(struct hid_device
> *hdev,
>  if (drvdata->quirks & QUIRK_MEDION_E1239T)
>   return asus_e1239t_event(drvdata, data, size);
> 
> + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> + /*
> + * Skip these report ID, the device emits a continuous stream 
> associated
> + * with the AURA mode it is in
> + */
> + if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
> + report->id == FEATURE_KBD_LED_REPORT_ID2) {
> + return -1;
> + /* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
> + } else if (report->id == FEATURE_KBD_REPORT_ID && data[1] == 0xae)
> {
> + return asus_wmi_send_event(drvdata, 0xae);
> + }
> + }
> +
>  return 0;
> }
> 
> @@ -344,7 +386,9 @@ static int asus_kbd_set_report(struct hid_device 
> *hdev, u8 *buf, size_t buf_size
>  if (!dmabuf)
>   return -ENOMEM;
> 
> - ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, dmabuf,
> + // The report ID should be set from the incoming buffer due to LED 
> and key
> + // interfaces having different pages
> + ret = hid_hw_raw_request(hdev, buf[0], dmabuf,
>      buf_size, HID_FEATURE_REPORT,
>      HID_REQ_SET_REPORT);
>  kfree(dmabuf);
> @@ -397,6 +441,44 @@ static int asus_kbd_get_functions(struct 
> hid_device *hdev,
>  return ret;
> }
> 
> +static int asus_kbd_led_init(struct hid_device *hdev)
> +{
> + u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
> + u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 0x55, 
> 0x53, 0x20,
> + 0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> + u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
> + 0x05, 0x20, 0x31, 0x00, 0x08 };
> + int ret;
> +
> + hid_warn(hdev, "Asus initialise N-KEY Device");
> + /* The first message is an init start */
> + ret = asus_kbd_set_report(hdev, buf_init_start, 
> sizeof(buf_init_start));
> + if (ret < 0)
> + hid_err(hdev, "Asus failed to send init start command: %d\n", ret);
> + /* Followed by a string */
> + ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> + if (ret < 0)
> + hid_err(hdev, "Asus failed to send init command 1.0: %d\n", ret);
> + /* Followed by a string */
> + ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> + if (ret < 0)
> + hid_err(hdev, "Asus failed to send init command 1.1: %d\n", ret);
> +
> + /* begin second report ID with same data */
> + buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
> + buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
> +
> + ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> + if (ret < 0)
> + hid_err(hdev, "Asus failed to send init command 2.0: %d\n", ret);
> +
> + ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> + if (ret < 0)
> + hid_err(hdev, "Asus failed to send init command 2.1: %d\n", ret);
> +
> + return ret;
> +}
> +
> static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>        enum led_brightness brightness)
> {
> @@ -460,19 +542,28 @@ static int asus_kbd_register_leds(struct 
> hid_device *hdev)
>  unsigned char kbd_func;
>  int ret;
> 
> - /* Initialize keyboard */
> - ret = asus_kbd_init(hdev);
> - if (ret < 0)
> - return ret;
> + if (drvdata->quirks & QUIRK_G752_KEYBOARD) {
> + /* Initialize keyboard */
> + ret = asus_kbd_init(hdev);
> + if (ret < 0)
> + return ret;
> 
> - /* Get keyboard functions */
> - ret = asus_kbd_get_functions(hdev, &kbd_func);
> - if (ret < 0)
> - return ret;
> + /* Get keyboard functions */
> + ret = asus_kbd_get_functions(hdev, &kbd_func);
> + if (ret < 0)
> + return ret;
> 
> - /* Check for backlight support */
> - if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> - return -ENODEV;
> + /* Check for backlight support */
> + if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> + return -ENODEV;
> + }
> +
> + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> + /* Initialize keyboard LED interface and Vendor keys on 0x1866 */
> + ret = asus_kbd_led_init(hdev);
> + if (ret < 0)
> + return ret;
> + }
> 
>  drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>            sizeof(struct asus_kbd_leds),
> @@ -751,14 +842,14 @@ static int asus_input_mapping(struct
> hid_device 
> *hdev,
>       usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
>   return -1;
> 
> - /* ASUS-specific keyboard hotkeys */
> - if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
> + /* ASUS-specific keyboard hotkeys and led backlight */
> + if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
>   switch (usage->hid & HID_USAGE) {
>   case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN); break;
>   case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP); break;
>   case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF); break;
>   case 0x6c: asus_map_key_clear(KEY_SLEEP); break;
> - case 0x7c: asus_map_key_clear(KEY_MICMUTE); break;
> + case 0x7c: asus_map_key_clear(KEY_F20); break;
>   case 0x82: asus_map_key_clear(KEY_CAMERA); break;
>   case 0x88: asus_map_key_clear(KEY_RFKILL); break;
>   case 0xb5: asus_map_key_clear(KEY_CALC); break;
> @@ -771,16 +862,42 @@ static int asus_input_mapping(struct
> hid_device 
> *hdev,
>   /* ROG key */
>   case 0x38: asus_map_key_clear(KEY_PROG1); break;
> 
> - /* Fn+C ASUS Splendid */
> - case 0xba: asus_map_key_clear(KEY_PROG2); break;
> + default:
> + if (drvdata->quirks & QUIRK_G752_KEYBOARD) {
> + switch (usage->hid & HID_USAGE) {
> + /* Fn+C ASUS Splendid */
> + case 0xba: asus_map_key_clear(KEY_PROG2); break;
> 
> - /* Fn+Space Power4Gear Hybrid */
> - case 0x5c: asus_map_key_clear(KEY_PROG3); break;
> + /* Fn+Space Power4Gear Hybrid */
> + case 0x5c: asus_map_key_clear(KEY_PROG3); break;
> 
> - /* Fn+F5 "fan" symbol on FX503VD */
> - case 0x99: asus_map_key_clear(KEY_PROG4); break;
> + /* Fn+F5 "fan" symbol on FX503VD */
> + case 0x99: asus_map_key_clear(KEY_PROG4); break;
> +
> + default:
> + return -1;
> + }
> + break;
> + }
> +
> + /* device 0x1866, N-KEY Device specific */
> + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> + switch (usage->hid & HID_USAGE) {
> + /* Fn+Ret "Calc" symbol on device 0x1866, N-KEY Device */
> + case 0x92: asus_map_key_clear(KEY_CALC); break;
> +
> + /* Fn+Left Aura mode previous */
> + case 0xb2: asus_map_key_clear(KEY_KBDILLUM_MODE_PREV); break;
> +
> + /* Fn+Right Aura mode next */
> + case 0xb3: asus_map_key_clear(KEY_KBDILLUM_MODE_NEXT); break;
> +
> + default:
> + return -1;
> + }
> + break;
> + }
> 
> - default:
>    /* ASUS lazily declares 256 usages, ignore the rest,
>     * as some make the keyboard appear as a pointer device. */
>    return -1;
> @@ -1126,6 +1243,9 @@ static const struct hid_device_id
> asus_devices[] 
> = {
>  { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD),
>    QUIRK_USE_KBD_BACKLIGHT },
> + { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> + USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> + QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>  { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>   USB_DEVICE_ID_ASUSTEK_T100TA_KEYBOARD),
>    QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 6f370e020feb..c9f930ddcfd7 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -190,6 +190,7 @@
> #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
> #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
> #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
> +#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD 0x1866
> #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD 0x1869
> 
> #define USB_VENDOR_ID_ATEN 0x0557
> diff --git a/include/linux/platform_data/x86/asus-wmi.h 
> b/include/linux/platform_data/x86/asus-wmi.h
> index 897b8332a39f..05253cfe786c 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -27,6 +27,8 @@
> #define ASUS_WMI_METHODID_INIT 0x54494E49 /* INITialize */
> #define ASUS_WMI_METHODID_HKEY 0x59454B48 /* Hot KEY ?? */
> 
> +#define ASUS_WMI_METHODID_NOTIF 0x00100021 /* Notify method ?? */
> +
> #define ASUS_WMI_UNSUPPORTED_METHOD 0xFFFFFFFE
> 
> /* Wireless */
> diff --git a/include/uapi/linux/input-event-codes.h 
> b/include/uapi/linux/input-event-codes.h
> index 0c2e27d28e0a..ca59f7d7a25e 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -772,6 +772,13 @@
> #define BTN_TRIGGER_HAPPY39 0x2e6
> #define BTN_TRIGGER_HAPPY40 0x2e7
> 
> +/*
> + * Some keyboards have function keys associated with
> + * changing the keyboard backlight modes, e.g, RGB patterns
> + */
> +#define KEY_KBDILLUM_MODE_PREV 0x2ea
> +#define KEY_KBDILLUM_MODE_NEXT 0x2eb
> +
> /* We avoid low common keys in module aliases so they don't get huge.
> */
> #define KEY_MIN_INTERESTING KEY_MUTE
> #define KEY_MAX 0x2ff


Apologies for the multiple versions so far. Some guides were not
very clear on expectations of who/where to send patches.
Follows is a description of the patch and reasoning behind.

This patch is to add the 0x1866 product ID of a keyboard that appears
to be used in a very large amount of newer ASUS gamer type laptops.
Full expected support included adding some additional keys and two new
keycodes, plus using an ACPI call to trigger an expected action in the
asus-ami.

The keycodes added are for two keys on this keyboard which under
Windows will trigger an action in client software to change the
keyboard LED mode. As such only the keycodes are added, not any
additional data or structures to control the modes; there are at least
4 variations found so far where the keyboard backlight modes available
are different (none, basic, more, all). However the device interface
for this control is now available under hidraw and works well.

I tried to name the keycodes in similar fashion to existing keyboard
brightness codes to keep them generic. It seems likely that there will
be other brands of laptop or even keyboard out there with similar
functionality.

To fully enable both the LED backlight changing, and keyboard
brightness change, it is required for the keyboard to be fully
initialised - this is the 5 byte arrays send to the keyboard, neither
brightness or mode changes will work without it.

The report filtering in raw_event is required because the device will
emit data (undetermined purpose) in response to key presses and some
other actions - left unfiltered these result in some regular keypresses
also registering other actions such as '3' and 'm' causing screen
brightness down/up actions.

The ACPI call is a "device set" call, which from what I can tell is
setting a keyboard block in DSTS, which then triggers in asus-wmi - the
action being triggering toggle of any associated action on the FN+F5
key, typically stepping to the next thermal throttle mode (normal,
boost, silent).

A large collection of DSTS for this group of laptops using this
keyboard is available here - 
https://github.com/flukejones/rog-core/tree/master/reverse_eng/dsl



