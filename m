Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FFA28A616
	for <lists+linux-input@lfdr.de>; Sun, 11 Oct 2020 09:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgJKHFn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Oct 2020 03:05:43 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48575 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726342AbgJKHFn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Oct 2020 03:05:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 612EC5C00FE;
        Sun, 11 Oct 2020 03:05:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 11 Oct 2020 03:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Hpq8We
        R3Mv0yPLlMEW5/mKE8iiQb1BQeVk7zDloc2qs=; b=Lap4c5u2GEhk4dksY/Tjfc
        +UyeXrqaxpFpWywXRPxHnt/ZnLvKZyu3oBRe01JsdhPzOHvP1uZEuLFp01VLUXaj
        yKDX7NrUFovzvzSsnPjj3O7XmJcjohEki9woVZ+JlXDZ8ACRglKwvEoEMQbHCJG2
        r/xnRwvx6YLU+HA3uBa1uke1E9Mz7mKsLe+BF8/OqQAkY6m1Z8m/Px+fFd8k/JXf
        Qu/KWhfbRFrgNADvlVwGYtf19iJNJ1Ot1vVttE9ck2vqdL1bXZkv8v6VBI6+45PY
        2UXFRDXxl8hAuYaT06rVGmsvhJ3TTa2ESiIhxyVC/oKZeGUI6nNp1A8sB3Z1UVEg
        ==
X-ME-Sender: <xms:xK6CX4vXgFCZeqOgiRlWsyZ7td2TgF4xQ9e7MIPYX6L5Vhy55dMPFQ>
    <xme:xK6CX1fEnI7OM4MaieHdUsBA2MsuFc0NmAxzzGgUcOSVjIUwN3tua7ebzd94KH8RL
    SEFwmEHLGm5t5B2bWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheeggddutdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhuffvkfgjfhfogggtsehmtderreertddvnecuhfhrohhmpefnuhhkvgcu
    lfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    duieefkeevvddtgeekvdegvddutefgueelieekkeefvddtjeehkeelveekjefhueenucff
    ohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedvtdefrdduudegrddugedurdduie
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhk
    vgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:xK6CXzwbuvotVDrA9HlonKS4Af32UxNi5oUklFfIturvxLlSO5Bd-w>
    <xmx:xK6CX7Ps6F3Km3J4_Y6-Z2X61zS8FhJo_lfnb8WXrIt9cMqyYBmuYQ>
    <xmx:xK6CX49eHewNtj2PfSEjLGMVj4xCZyEzgK8LErwO-YFQYxs2_W6cDQ>
    <xmx:xK6CX6IO-uVVNYEUUNowdQrHL7vJe1wOeiVbeWgXvcYZDp1lVAn3ug>
Received: from [192.168.20.20] (203-114-141-16.sta.inspire.net.nz [203.114.141.16])
        by mail.messagingengine.com (Postfix) with ESMTPA id 23C3E328005A;
        Sun, 11 Oct 2020 03:05:35 -0400 (EDT)
Date:   Sun, 11 Oct 2020 20:05:22 +1300
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH V6 RESEND] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>
Message-Id: <YOZ0IQ.A665YAO5V6WM2@ljones.dev>
In-Reply-To: <119d6a2e-275b-e6b9-0130-edd653ecd4fa@redhat.com>
References: <20200923215633.209724-1-luke@ljones.dev>
        <119d6a2e-275b-e6b9-0130-edd653ecd4fa@redhat.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-gOSdGumNk2JIT0xwAcXM"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--=-gOSdGumNk2JIT0xwAcXM
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello Hans and others, thank you for your valuable feedback

On Fri, Oct 9, 2020 at 16:22, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
> 
> On 9/23/20 11:56 PM, Luke D Jones wrote:
>> The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
>> almost all modern ASUS gaming laptops with slight changes to the
>> firmware. This patch enables: Fn+key hotkeys, keyboard backlight
>> brightness control, and notify asus-wmi to toggle "fan-mode".
>> 
>> The keyboard has many of the same key outputs as the existing G752
>> keyboard including a few extras, and varies a little between laptop
>> models. The key-sets have been split and sub-grouped so that there
>> will not be conflict between key event codes used.
>> 
>> An existing key event used across some keyboards for "Mic Toggle"
>> has been changed to emit "F20" as this is what all the main
>> desktop environments are using.
>> 
>> Additionally this keyboard requires the LED interface to be
>> intitialised before such things as keyboard backlight control work.
>> 
>> Misc changes in scope: update some hardcoded comparisons to use an
>> available define.
>> 
>> Signed-off-by: Luke D Jones <luke@ljones.dev>
>> ---
>>   drivers/hid/hid-asus.c                     | 188 
>> ++++++++++++++++++---
>>   drivers/hid/hid-ids.h                      |   1 +
>>   include/linux/platform_data/x86/asus-wmi.h |   2 +
>>   3 files changed, 166 insertions(+), 25 deletions(-)
>> 
>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>> index c183caf89d49..541c92a7f108 100644
>> --- a/drivers/hid/hid-asus.c
>> +++ b/drivers/hid/hid-asus.c
>> @@ -26,6 +26,8 @@
>>   #include <linux/dmi.h>
>>   #include <linux/hid.h>
>>   #include <linux/module.h>
>> +
>> +#include <linux/acpi.h>
>>   #include <linux/platform_data/x86/asus-wmi.h>
>>   #include <linux/input/mt.h>
>>   #include <linux/usb.h> /* For to_usb_interface for T100 touchpad 
>> intf check */
>> @@ -48,6 +50,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and 
>> TouchPad");
>>   #define INPUT_REPORT_ID 0x5d
>>   #define FEATURE_KBD_REPORT_ID 0x5a
>>   #define FEATURE_KBD_REPORT_SIZE 16
>> +#define FEATURE_KBD_LED_REPORT_ID1 0x5d
>> +#define FEATURE_KBD_LED_REPORT_ID2 0x5e
>> 
>>   #define SUPPORT_KBD_BACKLIGHT BIT(0)
>> 
>> @@ -80,6 +84,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and 
>> TouchPad");
>>   #define QUIRK_T101HA_DOCK		BIT(9)
>>   #define QUIRK_T90CHI			BIT(10)
>>   #define QUIRK_MEDION_E1239T		BIT(11)
>> +#define QUIRK_ROG_NKEY_KEYBOARD		BIT(12)
>> 
>>   #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>>   						 QUIRK_NO_INIT_REPORTS | \
>> @@ -305,10 +310,33 @@ static int asus_e1239t_event(struct 
>> asus_drvdata *drvdat, u8 *data, int size)
>>   	return 0;
>>   }
>> 
>> +/*
>> + * This enables triggering events in asus-wmi
>> + */
>> +static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
>> +{
>> +	int err;
>> +	u32 retval;
>> +
>> +	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
>> +		ASUS_WMI_METHODID_NOTIF, code, &retval);
>> +	if (err) {
>> +		pr_warn("Failed to notify asus-wmi: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (retval != 0) {
>> +		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
>> +		return -EIO;
>> +	}
> 
> 2 remarks here:
> 
> 1. Why do you not propogate the error returned by 
> asus_wmi_evaluate_method()?
> 2. When CONFIG_ASUS_WMI is not set asus_wmi_evaluate_method() is a 
> stub which
>    always return -ENODEV. I guess that that counts as a broken 
> kernel-config
>    if a N-Key kbd is use, so printing an error then is probably 
> fine...

I'm sorry, I don't really understand what you mean here. C isn't a 
language I
spend a lot of time in, and the kernel is fairly new to me. Can you 
suggest what
I should do?

> 
> 
>> +
>> +	return 0;
>> +}
>> +
>>   static int asus_event(struct hid_device *hdev, struct hid_field 
>> *field,
>>   		      struct hid_usage *usage, __s32 value)
>>   {
>> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
>> +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
>>   	    (usage->hid & HID_USAGE) != 0x00 &&
>>   	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>>   		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
>> @@ -321,6 +349,7 @@ static int asus_event(struct hid_device *hdev, 
>> struct hid_field *field,
>>   static int asus_raw_event(struct hid_device *hdev,
>>   		struct hid_report *report, u8 *data, int size)
>>   {
>> +	int ret;
>>   	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>> 
>>   	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
>> @@ -332,6 +361,35 @@ static int asus_raw_event(struct hid_device 
>> *hdev,
>>   	if (drvdata->quirks & QUIRK_MEDION_E1239T)
>>   		return asus_e1239t_event(drvdata, data, size);
>> 
>> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>> +		/*
>> +		 * Skip these report ID, the device emits a continuous stream 
>> associated
>> +		 * with the AURA mode it is in which looks like an 'echo'
>> +		*/
>> +		if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
>> +				report->id == FEATURE_KBD_LED_REPORT_ID2) {
>> +			return -1;
>> +		/* Additional report filtering */
>> +		} else if (report->id == FEATURE_KBD_REPORT_ID) {
>> +			/* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
>> +			if (data[1] == 0xae) {
>> +				ret = asus_wmi_send_event(drvdata, 0xae);
>> +				if (ret < 0) {
>> +					hid_warn(hdev, "Asus failed to trigger fan control event");
>> +				}
>> +				return -1;
>> +			/*
>> +			 * G14 and G15 send these codes on some keypresses with no
>> +			 * discernable reason for doing so. We'll filter them out to 
>> avoid
>> +			 * unmapped warning messages later
>> +			*/
>> +			} else if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 
>> ||
>> +					data[1] == 0x8a || data[1] == 0x9e) {
>> +				return -1;
>> +			}
>> +		}
>> +	}
>> +
>>   	return 0;
>>   }
>> 
>> @@ -344,7 +402,11 @@ static int asus_kbd_set_report(struct 
>> hid_device *hdev, u8 *buf, size_t buf_size
>>   	if (!dmabuf)
>>   		return -ENOMEM;
>> 
>> -	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, dmabuf,
>> +	/*
>> +	 * The report ID should be set from the incoming buffer due to LED 
>> and key
>> +	 * interfaces having different pages
>> +	*/
>> +	ret = hid_hw_raw_request(hdev, buf[0], dmabuf,
>>   				 buf_size, HID_FEATURE_REPORT,
>>   				 HID_REQ_SET_REPORT);
>>   	kfree(dmabuf);
>> @@ -397,6 +459,44 @@ static int asus_kbd_get_functions(struct 
>> hid_device *hdev,
>>   	return ret;
>>   }
>> 
>> +static int asus_kbd_led_init(struct hid_device *hdev)
> 
> Maybe put rog_nkey in the function name here? This sounds very 
> generic,
> while it actually is rog_nkey specific.

Done.

> 
>> +{
>> +	u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
>> +	u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 0x55, 
>> 0x53, 0x20,
>> +				0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
>> +	u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
>> +						0x05, 0x20, 0x31, 0x00, 0x08 };
>> +	int ret;
>> +
>> +	hid_warn(hdev, "Asus initialise N-KEY Device");
>> +	/* The first message is an init start */
>> +	ret = asus_kbd_set_report(hdev, buf_init_start, 
>> sizeof(buf_init_start));
>> +	if (ret < 0)
>> +		hid_err(hdev, "Asus failed to send init start command: %d\n", 
>> ret);
>> +	/* Followed by a string */
>> +	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
>> +	if (ret < 0)
>> +		hid_err(hdev, "Asus failed to send init command 1.0: %d\n", ret);
>> +	/* Followed by a string */
>> +	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
>> +	if (ret < 0)
>> +		hid_err(hdev, "Asus failed to send init command 1.1: %d\n", ret);
>> +
>> +	/* begin second report ID with same data */
>> +	buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
>> +	buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
>> +
>> +	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
>> +	if (ret < 0)
>> +		hid_err(hdev, "Asus failed to send init command 2.0: %d\n", ret);
>> +
>> +	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
>> +	if (ret < 0)
>> +		hid_err(hdev, "Asus failed to send init command 2.1: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>>   static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>>   				   enum led_brightness brightness)
>>   {
>> @@ -460,19 +560,28 @@ static int asus_kbd_register_leds(struct 
>> hid_device *hdev)
>>   	unsigned char kbd_func;
>>   	int ret;
>> 
>> -	/* Initialize keyboard */
>> -	ret = asus_kbd_init(hdev);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (drvdata->quirks & QUIRK_G752_KEYBOARD) {
>> +		/* Initialize keyboard */
>> +		ret = asus_kbd_init(hdev);
>> +		if (ret < 0)
>> +			return ret;
> 
> Why are you all of a sudden making the existing code-path
> depend on the G752_KEYBOARD quirk?
> 
> In the current hid-asus.c code asus_kbd_register_leds()
> gets called if drvdata->enable_backlight is set, which
> gets set on the interface with the HID_UP_ASUSVENDOR
> usage-page when the USE_KBD_BACKLIGHT quirk is set.
> 
> That quirk currently is set on the
> ASUSTEK_ROG_KEYBOARD1, ASUSTEK_ROG_KEYBOARD2 and
> ASUSTEK_FX503VD_KEYBOARD
> 
> And you even set it on the new id-table entry
> you add (which makes sense because otherwise
> this entire function would not get called for the
> N-keys kbd at all).
> 
> Notice that the G752_KEYBOARD is missing from the list
> of usb-ids for which we set USE_KBD_BACKLIGHT so by making
> the old code-path check for that you are essentially
> breaking kbd-backlight support on all the models where
> it currently already works!
> 
> Instead please do:
> 
> 	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> 		/* your new stuff */
> 	} else {
> 		/* old code path */
> 	}
> 
> So that you do not change behavior for existing kbds.

Done. Very sorry, I should have caught this. It looks like a remnant
of my initial try and I never cleaned up. In either case, definitely
changed now.

> 
>> -	/* Get keyboard functions */
>> -	ret = asus_kbd_get_functions(hdev, &kbd_func);
>> -	if (ret < 0)
>> -		return ret;
>> +		/* Get keyboard functions */
>> +		ret = asus_kbd_get_functions(hdev, &kbd_func);
>> +		if (ret < 0)
>> +			return ret;
>> 
>> -	/* Check for backlight support */
>> -	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>> -		return -ENODEV;
>> +		/* Check for backlight support */
>> +		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>> +			return -ENODEV;
>> +	}
>> +
>> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>> +		/* Initialize keyboard LED interface and Vendor keys on 0x1866 */
>> +		ret = asus_kbd_led_init(hdev);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> 
>>   	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>>   					      sizeof(struct asus_kbd_leds),
>> @@ -751,14 +860,14 @@ static int asus_input_mapping(struct 
>> hid_device *hdev,
>>   	     usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
>>   		return -1;
>> 
>> -	/* ASUS-specific keyboard hotkeys */
>> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
>> +	/* ASUS-specific keyboard hotkeys and led backlight */
>> +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
>>   		switch (usage->hid & HID_USAGE) {
>>   		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
>>   		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
>>   		case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF);		break;
>>   		case 0x6c: asus_map_key_clear(KEY_SLEEP);		break;
>> -		case 0x7c: asus_map_key_clear(KEY_MICMUTE);		break;
>> +		case 0x7c: asus_map_key_clear(KEY_F20);		break;
>>   		case 0x82: asus_map_key_clear(KEY_CAMERA);		break;
>>   		case 0x88: asus_map_key_clear(KEY_RFKILL);			break;
>>   		case 0xb5: asus_map_key_clear(KEY_CALC);			break;
>> @@ -771,16 +880,42 @@ static int asus_input_mapping(struct 
>> hid_device *hdev,
>>   		/* ROG key */
>>   		case 0x38: asus_map_key_clear(KEY_PROG1);		break;
>> 
>> -		/* Fn+C ASUS Splendid */
>> -		case 0xba: asus_map_key_clear(KEY_PROG2);		break;
>> -
>> -		/* Fn+Space Power4Gear Hybrid */
>> -		case 0x5c: asus_map_key_clear(KEY_PROG3);		break;
>> -
>> -		/* Fn+F5 "fan" symbol on FX503VD */
>> -		case 0x99: asus_map_key_clear(KEY_PROG4);		break;
>> -
>> +		/* The keyboard ID's in this section don't share key events */
>>   		default:
>> +			if (drvdata->quirks & QUIRK_G752_KEYBOARD) {
>> +				switch (usage->hid & HID_USAGE) {
>> +				/* Fn+C ASUS Splendid */
>> +				case 0xba: asus_map_key_clear(KEY_PROG2);		break;
>> +
>> +				/* Fn+Space Power4Gear Hybrid */
>> +				case 0x5c: asus_map_key_clear(KEY_PROG3);		break;
>> +
>> +				/* Fn+F5 "fan" symbol on FX503VD */
>> +				case 0x99: asus_map_key_clear(KEY_PROG4);		break;
>> +
>> +				default:
>> +					return -1;
>> +				}
>> +				break;
>> +			}
> 
> Same thing again, who says that these 3 usage-ids in the asus-page 
> are only
> found on the QUIRK_G752_KEYBOARD ?
> 
> Also I see no conflict between these 3 usage ids and the 3 new ones 
> which you add,
> so why not just add those 3 new ones to the normal switch-case and be 
> done with
> it, without any quirk checking at all ?
> 
> That has worked well for all previous Asus kbd models ...

Also done. We've gathered a fair amount of data on ASUS laptops in the 
community
centered around these models now. What you say is true, and so far 
looks like it
also applies even to different product ID (like 0x18**)

> 
>> +			/* device 0x1866, N-KEY Device specific */
>> +			else if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>> +				switch (usage->hid & HID_USAGE) {
>> +				/* Fn+Ret "Calc" symbol on device 0x1866, N-KEY Device */
>> +				case 0x92: asus_map_key_clear(KEY_CALC);		break;
>> +
>> +				/* Fn+Left Aura mode previous */
>> +				case 0xb2: asus_map_key_clear(KEY_PROG2);	break;
>> +
>> +				/* Fn+Right Aura mode next */
>> +				case 0xb3: asus_map_key_clear(KEY_PROG3);	break;
>> +
>> +				default:
>> +					return -1;
>> +				}
>> +				break;
> 
> If you drop the default: return -1 and the break after the 
> switch-case here, then
> you will just fall through to the return -1 below, which has a nice 
> comment why
> this is done.
> 
> Note as said please just add the 3 new usage-ids directly to the main 
> switch case instead
> of checking for a quirk and having a nested switch-case just for the 
> N-key kbd, then
> this all goes away and my remark here can be ignored.

Definitely done. I think I was trying to avoid conflict or something. 
But yes, nice
and clean now :)

> 
>> +			}
>> +
>>   			/* ASUS lazily declares 256 usages, ignore the rest,
>>   			 * as some make the keyboard appear as a pointer device. */
>>   			return -1;
>> @@ -1126,6 +1261,9 @@ static const struct hid_device_id 
>> asus_devices[] = {
>>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>   		USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD),
>>   	  QUIRK_USE_KBD_BACKLIGHT },
>> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>> +	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>   		USB_DEVICE_ID_ASUSTEK_T100TA_KEYBOARD),
>>   	  QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
>> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
>> index 74fc1df6e3c2..ce5ca078b232 100644
>> --- a/drivers/hid/hid-ids.h
>> +++ b/drivers/hid/hid-ids.h
>> @@ -190,6 +190,7 @@
>>   #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
>>   #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
>>   #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
>> +#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
>>   #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD	0x1869
>> 
>>   #define USB_VENDOR_ID_ATEN		0x0557
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h 
>> b/include/linux/platform_data/x86/asus-wmi.h
>> index 897b8332a39f..05253cfe786c 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -27,6 +27,8 @@
>>   #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
>>   #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
>> 
>> +#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method ?? */
>> +
>>   #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
>> 
>>   /* Wireless */
> 
> This new define is passed as second argument to the
> asus_wmi_evaluate_method call, that means that it is not
> a METHODID but a DEVID and we already have a bunch of
> 0x0010002x  DEVID defines:
> 
> /* Input */
> #define ASUS_WMI_DEVID_TOUCHPAD         0x00100011
> #define ASUS_WMI_DEVID_TOUCHPAD_LED     0x00100012
> #define ASUS_WMI_DEVID_FNLOCK           0x00100023
> 
> So I suggest that you add a new:
> 
> #define ASUS_WMI_DEVID_FAN_MODE         0x00100021

This is a tricky one. That ACPI method can actually be used to trigger 
many
different key events, so in the code I've written it is used just for 
triggering
an Fn+F5 event (fan) which is the 0xae code. The USB keyboard emtis the 
same code
but if we use this method then the associated fan control in asus-wmi 
is triggered.

I'm not really up with the terminology on the other interfaces, the TUF 
series use
a keyboard with the exact same controller but connected over PS/2? 
Which enables the
key events to trigger the correct things in asus-wmi. So that block in 
the DSL
is common across a lot of ASUS laptops, and we can actually call the 
method to
/emulate/ the PS/2 keyboard sort of.

The function in drivers/platform/x86/asus-wmi.c triggered by this is:
asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
...
	if (asus->throttle_thermal_policy_available && code == NOTIFY_KBD_TTP) 
{
		throttle_thermal_policy_switch_next(asus);
		return;
	}
...
where NOTIFY_KBD_TTP = 0xae, the same code the USB keyboard emits.

So um, yeah, 0x00100021 can trigger all the keycodes in that block. I 
didn't think
labelling it as ASUS_WMI_DEVID_FAN_MODE was appropriate. I'm not sure 
what else to
name it.

All the DSL we've dumped are here:
https://gitlab.com/asus-linux/reverse-engineering/-/tree/master/dsl

I'm not sure where to go from here. Do I resubmit the revised patch in 
a new thread
or should I attach here? (I'll attach for now)

Kind regards,
Luke.


--=-gOSdGumNk2JIT0xwAcXM
Content-Type: text/x-patch
Content-Disposition: attachment;
	filename=0001-HID-ASUS-Add-support-for-ASUS-N-Key-keyboard.patch
Content-Transfer-Encoding: quoted-printable

From 296d638b51a4c59237bab4ec0a19b2034f2b1d99 Mon Sep 17 00:00:00 2001
From: Luke D Jones <luke@ljones.dev>
Date: Sun, 11 Oct 2020 19:57:18 +1300
Subject: [PATCH] HID: ASUS: Add support for ASUS N-Key keyboard

The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
almost all modern ASUS gaming laptops with slight changes to the
firmware. This patch enables: Fn+key hotkeys, keyboard backlight
brightness control, and notify asus-wmi to toggle "fan-mode".

The keyboard has many of the same key outputs as the existing ASUS
keyboard including a few extras, and varies a little between laptop
models.

An existing key event used across some keyboards for "Mic Toggle"
has been changed to emit "F20" as this is what all the main
desktop environments are using.

Additionally this keyboard requires the LED interface to be
intitialised before such things as keyboard backlight control work.

Misc changes in scope: update some hardcoded comparisons to use an
available define.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c                     | 154 ++++++++++++++++++---
 drivers/hid/hid-ids.h                      |   1 +
 include/linux/platform_data/x86/asus-wmi.h |   3 +
 3 files changed, 142 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index c183caf89d49..5b362b3cbb70 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -26,6 +26,8 @@
 #include <linux/dmi.h>
 #include <linux/hid.h>
 #include <linux/module.h>
+
+#include <linux/acpi.h>
 #include <linux/platform_data/x86/asus-wmi.h>
 #include <linux/input/mt.h>
 #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf chec=
k */
@@ -48,6 +50,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define INPUT_REPORT_ID 0x5d
 #define FEATURE_KBD_REPORT_ID 0x5a
 #define FEATURE_KBD_REPORT_SIZE 16
+#define FEATURE_KBD_LED_REPORT_ID1 0x5d
+#define FEATURE_KBD_LED_REPORT_ID2 0x5e
=20
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
=20
@@ -80,6 +84,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_T101HA_DOCK		BIT(9)
 #define QUIRK_T90CHI			BIT(10)
 #define QUIRK_MEDION_E1239T		BIT(11)
+#define QUIRK_ROG_NKEY_KEYBOARD		BIT(12)
=20
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -305,10 +310,33 @@ static int asus_e1239t_event(struct asus_drvdata *drv=
dat, u8 *data, int size)
 	return 0;
 }
=20
+/*
+ * This enables triggering events in asus-wmi
+ */
+static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
+{
+	int err;
+	u32 retval;
+
+	err =3D asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
+		ASUS_WMI_METHODID_NOTIF, code, &retval);
+	if (err) {
+		pr_warn("Failed to notify asus-wmi: %d\n", err);
+		return err;
+	}
+
+	if (retval !=3D 0) {
+		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
-	if ((usage->hid & HID_USAGE_PAGE) =3D=3D 0xff310000 &&
+	if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_ASUSVENDOR &&
 	    (usage->hid & HID_USAGE) !=3D 0x00 &&
 	    (usage->hid & HID_USAGE) !=3D 0xff && !usage->type) {
 		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
@@ -321,6 +349,7 @@ static int asus_event(struct hid_device *hdev, struct h=
id_field *field,
 static int asus_raw_event(struct hid_device *hdev,
 		struct hid_report *report, u8 *data, int size)
 {
+	int ret;
 	struct asus_drvdata *drvdata =3D hid_get_drvdata(hdev);
=20
 	if (drvdata->battery && data[0] =3D=3D BATTERY_REPORT_ID)
@@ -332,6 +361,35 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (drvdata->quirks & QUIRK_MEDION_E1239T)
 		return asus_e1239t_event(drvdata, data, size);
=20
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		/*
+		 * Skip these report ID, the device emits a continuous stream associated
+		 * with the AURA mode it is in which looks like an 'echo'
+		*/
+		if (report->id =3D=3D FEATURE_KBD_LED_REPORT_ID1 ||
+				report->id =3D=3D FEATURE_KBD_LED_REPORT_ID2) {
+			return -1;
+		/* Additional report filtering */
+		} else if (report->id =3D=3D FEATURE_KBD_REPORT_ID) {
+			/* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
+			if (data[1] =3D=3D 0xae) {
+				ret =3D asus_wmi_send_event(drvdata, 0xae);
+				if (ret < 0) {
+					hid_warn(hdev, "Asus failed to trigger fan control event");
+				}
+				return -1;
+			/*
+			 * G14 and G15 send these codes on some keypresses with no
+			 * discernable reason for doing so. We'll filter them out to avoid
+			 * unmapped warning messages later
+			*/
+			} else if (data[1] =3D=3D 0xea || data[1] =3D=3D 0xec || data[1] =3D=3D=
 0x02 ||
+					data[1] =3D=3D 0x8a || data[1] =3D=3D 0x9e) {
+				return -1;
+			}
+		}
+	}
+
 	return 0;
 }
=20
@@ -344,7 +402,11 @@ static int asus_kbd_set_report(struct hid_device *hdev=
, u8 *buf, size_t buf_size
 	if (!dmabuf)
 		return -ENOMEM;
=20
-	ret =3D hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, dmabuf,
+	/*
+	 * The report ID should be set from the incoming buffer due to LED and ke=
y
+	 * interfaces having different pages
+	*/
+	ret =3D hid_hw_raw_request(hdev, buf[0], dmabuf,
 				 buf_size, HID_FEATURE_REPORT,
 				 HID_REQ_SET_REPORT);
 	kfree(dmabuf);
@@ -397,6 +459,44 @@ static int asus_kbd_get_functions(struct hid_device *h=
dev,
 	return ret;
 }
=20
+static int rog_nkey_led_init(struct hid_device *hdev)
+{
+	u8 buf_init_start[] =3D { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
+	u8 buf_init2[] =3D { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 0x55, 0x53, =
0x20,
+				0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
+	u8 buf_init3[] =3D { FEATURE_KBD_LED_REPORT_ID1,
+						0x05, 0x20, 0x31, 0x00, 0x08 };
+	int ret;
+
+	hid_warn(hdev, "Asus initialise N-KEY Device");
+	/* The first message is an init start */
+	ret =3D asus_kbd_set_report(hdev, buf_init_start, sizeof(buf_init_start))=
;
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init start command: %d\n", ret);
+	/* Followed by a string */
+	ret =3D asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init command 1.0: %d\n", ret);
+	/* Followed by a string */
+	ret =3D asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init command 1.1: %d\n", ret);
+
+	/* begin second report ID with same data */
+	buf_init2[0] =3D FEATURE_KBD_LED_REPORT_ID2;
+	buf_init3[0] =3D FEATURE_KBD_LED_REPORT_ID2;
+
+	ret =3D asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init command 2.0: %d\n", ret);
+
+	ret =3D asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
+	if (ret < 0)
+		hid_err(hdev, "Asus failed to send init command 2.1: %d\n", ret);
+
+	return ret;
+}
+
 static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
 				   enum led_brightness brightness)
 {
@@ -460,19 +560,29 @@ static int asus_kbd_register_leds(struct hid_device *=
hdev)
 	unsigned char kbd_func;
 	int ret;
=20
-	/* Initialize keyboard */
-	ret =3D asus_kbd_init(hdev);
-	if (ret < 0)
-		return ret;
+	/*
+	 * Special case to init the LEDS for N-Key device but otherwise continue
+	 * on the previous codepath so other devices also init correctly
+	 */
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		ret =3D rog_nkey_led_init(hdev);
+		if (ret < 0)
+			return ret;
+	} else {
+		/* Initialize keyboard */
+		ret =3D asus_kbd_init(hdev);
+		if (ret < 0)
+			return ret;
=20
-	/* Get keyboard functions */
-	ret =3D asus_kbd_get_functions(hdev, &kbd_func);
-	if (ret < 0)
-		return ret;
+		/* Get keyboard functions */
+		ret =3D asus_kbd_get_functions(hdev, &kbd_func);
+		if (ret < 0)
+			return ret;
=20
-	/* Check for backlight support */
-	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
-		return -ENODEV;
+		/* Check for backlight support */
+		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
+			return -ENODEV;
+	}
=20
 	drvdata->kbd_backlight =3D devm_kzalloc(&hdev->dev,
 					      sizeof(struct asus_kbd_leds),
@@ -751,14 +861,14 @@ static int asus_input_mapping(struct hid_device *hdev=
,
 	     usage->hid =3D=3D (HID_UP_GENDEVCTRLS | 0x0026)))
 		return -1;
=20
-	/* ASUS-specific keyboard hotkeys */
-	if ((usage->hid & HID_USAGE_PAGE) =3D=3D 0xff310000) {
+	/* ASUS-specific keyboard hotkeys and led backlight */
+	if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_ASUSVENDOR) {
 		switch (usage->hid & HID_USAGE) {
 		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
 		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
 		case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF);		break;
 		case 0x6c: asus_map_key_clear(KEY_SLEEP);		break;
-		case 0x7c: asus_map_key_clear(KEY_MICMUTE);		break;
+		case 0x7c: asus_map_key_clear(KEY_F20);		break;
 		case 0x82: asus_map_key_clear(KEY_CAMERA);		break;
 		case 0x88: asus_map_key_clear(KEY_RFKILL);			break;
 		case 0xb5: asus_map_key_clear(KEY_CALC);			break;
@@ -780,6 +890,15 @@ static int asus_input_mapping(struct hid_device *hdev,
 		/* Fn+F5 "fan" symbol on FX503VD */
 		case 0x99: asus_map_key_clear(KEY_PROG4);		break;
=20
+		/* Fn+Ret "Calc" symbol on device 0x1866, N-KEY Device */
+		case 0x92: asus_map_key_clear(KEY_CALC);		break;
+
+		/* Fn+Left Aura mode previous */
+		case 0xb2: asus_map_key_clear(KEY_PROG2);		break;
+
+		/* Fn+Right Aura mode next */
+		case 0xb3: asus_map_key_clear(KEY_PROG3);		break;
+
 		default:
 			/* ASUS lazily declares 256 usages, ignore the rest,
 			 * as some make the keyboard appear as a pointer device. */
@@ -1126,6 +1245,9 @@ static const struct hid_device_id asus_devices[] =3D =
{
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD),
 	  QUIRK_USE_KBD_BACKLIGHT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_T100TA_KEYBOARD),
 	  QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6f370e020feb..c9f930ddcfd7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -190,6 +190,7 @@
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
+#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
 #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD	0x1869
=20
 #define USB_VENDOR_ID_ATEN		0x0557
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/pla=
tform_data/x86/asus-wmi.h
index 897b8332a39f..a72047be4174 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -71,6 +71,9 @@
 #define ASUS_WMI_DEVID_TOUCHPAD_LED	0x00100012
 #define ASUS_WMI_DEVID_FNLOCK		0x00100023
=20
+/* This ACPI method can be used to trigger keyboard events in asus-wmi */
+#define ASUS_WMI_METHODID_NOTIF		0x00100021
+
 /* Fan, Thermal */
 #define ASUS_WMI_DEVID_THERMAL_CTRL	0x00110011
 #define ASUS_WMI_DEVID_FAN_CTRL		0x00110012 /* deprecated */
--=20
2.28.0


--=-gOSdGumNk2JIT0xwAcXM--

