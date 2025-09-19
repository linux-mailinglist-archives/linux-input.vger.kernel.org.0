Return-Path: <linux-input+bounces-14934-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5EB8B4AA
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 23:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7A65A8080
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 21:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0532C0F89;
	Fri, 19 Sep 2025 21:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4p7PNFT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831EB27702A;
	Fri, 19 Sep 2025 21:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316182; cv=none; b=Q30hqBRSl/5MeIh0+WvNp7PLAatKiko3N2QsbGFfFJWHdNVWypB4hbIhEp9dW+0f+LOL68nFC067Whc8KDq/RpxzS8pJlV8wY3+tL0eyXp5x/lAEjWkufUGKFCd0IzLajhkiWPU7t7RnNO5dBLmJ07yGkTUxW2R3/vFGtnwLbKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316182; c=relaxed/simple;
	bh=Web+/KWJOGgAJqOfLlvc3c6eUwO+9mrisfatNGg8+Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHfJdLc1yRNfs4ydhH71wC6SPA/8MqTGGBM8h/esb50CqteMy93SSyrf7AOEPsA+gk+MUTcWvP2yrd7m3d+EnmcdtSqwFwjFyT/2/eOHnNE740uYj9WA+KluEB/Uzb9no/muh518j/SYueqT4qd/YhF5ocoL+WeKLUmN/rwJDbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4p7PNFT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3C9C4CEF9;
	Fri, 19 Sep 2025 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758316182;
	bh=Web+/KWJOGgAJqOfLlvc3c6eUwO+9mrisfatNGg8+Uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H4p7PNFTRD71DfbnccaNUmuLl3bqt1+YODQnV2gVpc5LFaEnKynSR1xHaUFD1qRih
	 w213uSWW2arPO5lqCSo6FQGDImsCBYB8mEuSy5PVfWItCoRkpgiGAp0Si2x4aXdwUW
	 72oEIdr4yKzDQYcIad34ZcKN3Z4bOtrPkavL5lHVebc50C4zFi9bvzCC8WiyYiahue
	 LZ8Gqawj/itFvOvgAccyUCVksjsvjE1I7ETNqblsCfPoaHkJTb570RAZFhsQKDUShb
	 +5J06/u9gPJuGTk2OYVb6ytkjKG66/fe4XVDeSdRhbfxZaGs7WfwijldTnduyr2EF7
	 zyYlBs68bvT3Q==
Message-ID: <be81a9a6-8f11-4acd-aa09-17fb00b09620@kernel.org>
Date: Fri, 19 Sep 2025 23:09:38 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] HID: lg-g15 - Add support for Logitech G13.
To: "Leo L. Schwab" <ewhac@ewhac.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250917230550.1160621-1-ewhac@ewhac.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250917230550.1160621-1-ewhac@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Sep-25 1:05 AM, Leo L. Schwab wrote:
> The Logitech G13 is a gaming keypad with general-purpose macro keys,
> four LED-backlit macro preset keys, five "menu" keys, backlight toggle
> key, an analog thumbstick, RGB LED backlight, and a monochrome LCD
> display.
> 
> Support input event generation for all keys and the thumbstick, and
> expose all LEDs.
> 
> Signed-off-by: Leo L. Schwab <ewhac@ewhac.org>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Tested-by: Kate Hsuan <hpa@redhat.com>
> ---
> Changes in v6:
>   - Alter interaction between `brightness` and `brightness_hw_changed`
>     for the backlight as advised by Hans de Goede <hansg@kernel.org>.
>   - On probe, query device for current state of HW backlight toggle;
>     track in `backlight_disabled` and update sysfs.
>   - Ensure non-backlight LED brightnesses report either 0 or 1.

Thanks, this latest version looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

note this is already there, just making clear that all me
remarks are resolved now and this is ready to merge.

Regards,

Hans


> Changes in v5:
>   - None; resend v4 due to bounced email submission.
> Changes in v4:
>   - Minor changes recommended by Hans de Goede <hansg@kernel.org>.
> Changes in v3:
>   - Re-revise commit message.
>   - Conditionally compile the section depending on
>     CONFIG_LEDS_BRIGHTNESS_HW_CHANGED correctly this time.
>   - Use led-class-multicolor facilities for the RGB backlight.
>   - Changes recommended by Kate Hsuan <hpa@redhat.com>:
>     - Use guard(mutex) construct.
>     - Fix numerous style nits.
> Changes in v2:
>   - Add `#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED` bracket around new
>     code segment dependent on that feature (fixes test robot build
>     error).
>   - Use `guard(mutex)` construct in new code (existing code left
>     unmodified).
>   - Commit message revised.
> 
>  drivers/hid/hid-ids.h    |   1 +
>  drivers/hid/hid-lg-g15.c | 448 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 433 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 33cc5820f2be..7ed1e402b80a 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -870,6 +870,7 @@
>  #define USB_DEVICE_ID_LOGITECH_DUAL_ACTION	0xc216
>  #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2	0xc218
>  #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2	0xc219
> +#define USB_DEVICE_ID_LOGITECH_G13		0xc21c
>  #define USB_DEVICE_ID_LOGITECH_G15_LCD		0xc222
>  #define USB_DEVICE_ID_LOGITECH_G11		0xc225
>  #define USB_DEVICE_ID_LOGITECH_G15_V2_LCD	0xc227
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index f8605656257b..7b8df2d5b57f 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c
> @@ -26,7 +26,21 @@
>  #define LG_G510_FEATURE_BACKLIGHT_RGB	0x05
>  #define LG_G510_FEATURE_POWER_ON_RGB	0x06
>  
> +#define LG_G13_INPUT_REPORT		0x01
> +#define LG_G13_FEATURE_M_KEYS_LEDS	0x05
> +#define LG_G13_FEATURE_BACKLIGHT_RGB	0x07
> +#define LG_G13_BACKLIGHT_HW_ON_BIT	23
> +
> +/**
> + * g13_input_report.keybits[] is not 32-bit aligned, so we can't use the bitops macros.
> + *
> + * @ary: Pointer to array of u8s
> + * @b: Bit index into ary, LSB first.  Not range checked.
> + */
> +#define TEST_BIT(ary, b)	((1 << ((b) & 7)) & (ary)[(b) >> 3])
> +
>  enum lg_g15_model {
> +	LG_G13,
>  	LG_G15,
>  	LG_G15_V2,
>  	LG_G510,
> @@ -45,6 +59,12 @@ enum lg_g15_led_type {
>  	LG_G15_LED_MAX
>  };
>  
> +struct g13_input_report {
> +	u8 report_id;	/* Report ID is always set to 1. */
> +	u8 joy_x, joy_y;
> +	u8 keybits[5];
> +};
> +
>  struct lg_g15_led {
>  	union {
>  		struct led_classdev cdev;
> @@ -63,12 +83,188 @@ struct lg_g15_data {
>  	struct mutex mutex;
>  	struct work_struct work;
>  	struct input_dev *input;
> +	struct input_dev *input_js; /* Separate joystick device for G13. */
>  	struct hid_device *hdev;
>  	enum lg_g15_model model;
>  	struct lg_g15_led leds[LG_G15_LED_MAX];
>  	bool game_mode_enabled;
> +	bool backlight_disabled;	/* true == HW backlight toggled *OFF* */
>  };
>  
> +/********* G13 LED functions ***********/
> +/*
> + * G13 retains no state across power cycles, and always powers up with the backlight on,
> + * color #5AFF6E, all macro key LEDs off.
> + */
> +static int lg_g13_get_leds_state(struct lg_g15_data *g15)
> +{
> +	u8 * const tbuf = g15->transfer_buf;
> +	int ret, high;
> +
> +	/* RGB backlight. */
> +	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_BACKLIGHT_RGB,
> +				 tbuf, 5,
> +				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
> +	if (ret != 5) {
> +		hid_err(g15->hdev, "Error getting backlight brightness: %d\n", ret);
> +		return (ret < 0) ? ret : -EIO;
> +	}
> +
> +	/* Normalize RGB intensities against the highest component. */
> +	high = max3(tbuf[1], tbuf[2], tbuf[3]);
> +	if (high) {
> +		g15->leds[LG_G15_KBD_BRIGHTNESS].red =
> +			DIV_ROUND_CLOSEST(tbuf[1] * 255, high);
> +		g15->leds[LG_G15_KBD_BRIGHTNESS].green =
> +			DIV_ROUND_CLOSEST(tbuf[2] * 255, high);
> +		g15->leds[LG_G15_KBD_BRIGHTNESS].blue =
> +			DIV_ROUND_CLOSEST(tbuf[3] * 255, high);
> +		g15->leds[LG_G15_KBD_BRIGHTNESS].brightness = high;
> +	} else {
> +		g15->leds[LG_G15_KBD_BRIGHTNESS].red        = 255;
> +		g15->leds[LG_G15_KBD_BRIGHTNESS].green      = 255;
> +		g15->leds[LG_G15_KBD_BRIGHTNESS].blue       = 255;
> +		g15->leds[LG_G15_KBD_BRIGHTNESS].brightness = 0;
> +	}
> +
> +	/* Macro LEDs. */
> +	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_M_KEYS_LEDS,
> +				 tbuf, 5,
> +				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
> +	if (ret != 5) {
> +		hid_err(g15->hdev, "Error getting macro LED brightness: %d\n", ret);
> +		return (ret < 0) ? ret : -EIO;
> +	}
> +
> +	for (int i = LG_G15_MACRO_PRESET1; i < LG_G15_LED_MAX; ++i)
> +		g15->leds[i].brightness = !!(tbuf[1] & (1 << (i - LG_G15_MACRO_PRESET1)));
> +
> +	/*
> +	 * Bit 23 of g13_input_report.keybits[] contains the backlight's
> +	 * current HW toggle state.  Retrieve it from the device.
> +	 */
> +	ret = hid_hw_raw_request(g15->hdev, LG_G13_INPUT_REPORT,
> +				 tbuf, sizeof(struct g13_input_report),
> +				 HID_INPUT_REPORT, HID_REQ_GET_REPORT);
> +	if (ret != sizeof(struct g13_input_report)) {
> +		hid_err(g15->hdev, "Error getting backlight on/off state: %d\n", ret);
> +		return (ret < 0) ? ret : -EIO;
> +	}
> +	g15->backlight_disabled =
> +		!TEST_BIT(((struct g13_input_report *) tbuf)->keybits,
> +			  LG_G13_BACKLIGHT_HW_ON_BIT);
> +
> +	return 0;
> +}
> +
> +static int lg_g13_kbd_led_write(struct lg_g15_data *g15,
> +				struct lg_g15_led *g15_led,
> +				enum led_brightness brightness)
> +{
> +	struct mc_subled const * const subleds = g15_led->mcdev.subled_info;
> +	u8 * const tbuf = g15->transfer_buf;
> +	int ret;
> +
> +	guard(mutex)(&g15->mutex);
> +
> +	led_mc_calc_color_components(&g15_led->mcdev, brightness);
> +
> +	tbuf[0] = 5;
> +	tbuf[1] = subleds[0].brightness;
> +	tbuf[2] = subleds[1].brightness;
> +	tbuf[3] = subleds[2].brightness;
> +	tbuf[4] = 0;
> +
> +	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_BACKLIGHT_RGB,
> +				 tbuf, 5,
> +				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
> +	if (ret != 5) {
> +		hid_err(g15->hdev, "Error setting backlight brightness: %d\n", ret);
> +		return (ret < 0) ? ret : -EIO;
> +	}
> +
> +	g15_led->brightness = brightness;
> +	return 0;
> +}
> +
> +static int lg_g13_kbd_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
> +	struct lg_g15_led *g15_led =
> +		container_of(mc, struct lg_g15_led, mcdev);
> +	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
> +
> +	/* Ignore LED off on unregister / keyboard unplug */
> +	if (led_cdev->flags & LED_UNREGISTERING)
> +		return 0;
> +
> +	return lg_g13_kbd_led_write(g15, g15_led, brightness);
> +}
> +
> +static enum led_brightness lg_g13_kbd_led_get(struct led_classdev *led_cdev)
> +{
> +	struct led_classdev_mc const * const mc = lcdev_to_mccdev(led_cdev);
> +	struct lg_g15_led const *g15_led =
> +		container_of(mc, struct lg_g15_led, mcdev);
> +
> +	return g15_led->brightness;
> +}
> +
> +static int lg_g13_mkey_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> +{
> +	struct lg_g15_led *g15_led =
> +		container_of(led_cdev, struct lg_g15_led, cdev);
> +	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
> +	int i, ret;
> +	u8 * const tbuf = g15->transfer_buf;
> +	u8 val, mask = 0;
> +
> +	/* Ignore LED off on unregister / keyboard unplug */
> +	if (led_cdev->flags & LED_UNREGISTERING)
> +		return 0;
> +
> +	guard(mutex)(&g15->mutex);
> +
> +	for (i = LG_G15_MACRO_PRESET1; i < LG_G15_LED_MAX; ++i) {
> +		if (i == g15_led->led)
> +			val = brightness;
> +		else
> +			val = g15->leds[i].brightness;
> +
> +		if (val)
> +			mask |= 1 << (i - LG_G15_MACRO_PRESET1);
> +	}
> +
> +	tbuf[0] = 5;
> +	tbuf[1] = mask;
> +	tbuf[2] = 0;
> +	tbuf[3] = 0;
> +	tbuf[4] = 0;
> +
> +	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_M_KEYS_LEDS,
> +				 tbuf, 5,
> +				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
> +	if (ret != 5) {
> +		hid_err(g15->hdev, "Error setting LED brightness: %d\n", ret);
> +		return (ret < 0) ? ret : -EIO;
> +	}
> +
> +	g15_led->brightness = brightness;
> +	return 0;
> +}
> +
> +static enum led_brightness lg_g13_mkey_led_get(struct led_classdev *led_cdev)
> +{
> +	/*
> +	 * G13 doesn't change macro key LEDs behind our back, so they're
> +	 * whatever we last set them to.
> +	 */
> +	struct lg_g15_led *g15_led =
> +		container_of(led_cdev, struct lg_g15_led, cdev);
> +
> +	return g15_led->brightness;
> +}
> +
>  /******** G15 and G15 v2 LED functions ********/
>  
>  static int lg_g15_update_led_brightness(struct lg_g15_data *g15)
> @@ -390,6 +586,8 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
>  	int ret;
>  
>  	switch (g15->model) {
> +	case LG_G13:
> +		return lg_g13_get_leds_state(g15);
>  	case LG_G15:
>  	case LG_G15_V2:
>  		return lg_g15_update_led_brightness(g15);
> @@ -417,6 +615,108 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
>  
>  /******** Input functions ********/
>  
> +/* Table mapping keybits[] bit positions to event codes. */
> +/* Note: Indices are discontinuous to aid readability. */
> +static const u16 g13_keys_for_bits[] = {
> +	/* Main keypad - keys G1 - G22 */
> +	[0] = KEY_MACRO1,
> +	[1] = KEY_MACRO2,
> +	[2] = KEY_MACRO3,
> +	[3] = KEY_MACRO4,
> +	[4] = KEY_MACRO5,
> +	[5] = KEY_MACRO6,
> +	[6] = KEY_MACRO7,
> +	[7] = KEY_MACRO8,
> +	[8] = KEY_MACRO9,
> +	[9] = KEY_MACRO10,
> +	[10] = KEY_MACRO11,
> +	[11] = KEY_MACRO12,
> +	[12] = KEY_MACRO13,
> +	[13] = KEY_MACRO14,
> +	[14] = KEY_MACRO15,
> +	[15] = KEY_MACRO16,
> +	[16] = KEY_MACRO17,
> +	[17] = KEY_MACRO18,
> +	[18] = KEY_MACRO19,
> +	[19] = KEY_MACRO20,
> +	[20] = KEY_MACRO21,
> +	[21] = KEY_MACRO22,
> +
> +	/* LCD menu buttons. */
> +	[24] = KEY_KBD_LCD_MENU5,	/* "Next page" button */
> +	[25] = KEY_KBD_LCD_MENU1,	/* Left-most */
> +	[26] = KEY_KBD_LCD_MENU2,
> +	[27] = KEY_KBD_LCD_MENU3,
> +	[28] = KEY_KBD_LCD_MENU4,	/* Right-most */
> +
> +	/* Macro preset and record buttons; have red LEDs under them. */
> +	[29] = KEY_MACRO_PRESET1,
> +	[30] = KEY_MACRO_PRESET2,
> +	[31] = KEY_MACRO_PRESET3,
> +	[32] = KEY_MACRO_RECORD_START,
> +
> +	/* 33-35 handled by joystick device. */
> +
> +	/* Backlight toggle. */
> +	[37] = KEY_LIGHTS_TOGGLE,
> +};
> +
> +#define G13_JS_KEYBITS_OFFSET	33
> +
> +static const u16 g13_keys_for_bits_js[] = {
> +	/* Joystick buttons */
> +	/* These keybits are at bit indices 33, 34, and 35. */
> +	BTN_BASE,	/* Left side */
> +	BTN_BASE2,	/* Bottom side */
> +	BTN_THUMB,	/* Stick depress */
> +};
> +
> +static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
> +{
> +	struct g13_input_report const * const rep = (struct g13_input_report *) data;
> +	int i, val;
> +	bool backlight_disabled;
> +
> +	/*
> +	 * Main macropad and menu keys.
> +	 * Emit key events defined for each bit position.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(g13_keys_for_bits); ++i) {
> +		if (g13_keys_for_bits[i]) {
> +			val = TEST_BIT(rep->keybits, i);
> +			input_report_key(g15->input, g13_keys_for_bits[i], val);
> +		}
> +	}
> +	input_sync(g15->input);
> +
> +	/*
> +	 * Joystick.
> +	 * Emit button and deflection events.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i) {
> +		val = TEST_BIT(rep->keybits, i + G13_JS_KEYBITS_OFFSET);
> +		input_report_key(g15->input_js, g13_keys_for_bits_js[i], val);
> +	}
> +	input_report_abs(g15->input_js, ABS_X, rep->joy_x);
> +	input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
> +	input_sync(g15->input_js);
> +
> +	/*
> +	 * Bit 23 of keybits[] reports the current backlight on/off state.  If
> +	 * it has changed from the last cached value, apply an update.
> +	 */
> +	backlight_disabled = !TEST_BIT(rep->keybits, LG_G13_BACKLIGHT_HW_ON_BIT);
> +	if (backlight_disabled ^ g15->backlight_disabled) {
> +		led_classdev_notify_brightness_hw_changed(
> +			&g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev.led_cdev,
> +			backlight_disabled
> +			? 0 : g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
> +		g15->backlight_disabled = backlight_disabled;
> +	}
> +
> +	return 0;
> +}
> +
>  /* On the G15 Mark I Logitech has been quite creative with which bit is what */
>  static void lg_g15_handle_lcd_menu_keys(struct lg_g15_data *g15, u8 *data)
>  {
> @@ -572,6 +872,10 @@ static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
>  		return 0;
>  
>  	switch (g15->model) {
> +	case LG_G13:
> +		if (data[0] == 0x01 && size == sizeof(struct g13_input_report))
> +			return lg_g13_event(g15, data);
> +		break;
>  	case LG_G15:
>  		if (data[0] == 0x02 && size == 9)
>  			return lg_g15_event(g15, data);
> @@ -616,13 +920,22 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
>  {
>  	int i;
>  	struct mc_subled *subled_info;
> -
> -	g15->leds[index].mcdev.led_cdev.brightness_set_blocking =
> -		lg_g510_kbd_led_set;
> -	g15->leds[index].mcdev.led_cdev.brightness_get =
> -		lg_g510_kbd_led_get;
> -	g15->leds[index].mcdev.led_cdev.max_brightness = 255;
> -	g15->leds[index].mcdev.num_colors = 3;
> +	struct lg_g15_led * const gled = &g15->leds[index];
> +
> +	if (g15->model == LG_G13) {
> +		gled->mcdev.led_cdev.brightness_set_blocking =
> +			lg_g13_kbd_led_set;
> +		gled->mcdev.led_cdev.brightness_get =
> +			lg_g13_kbd_led_get;
> +		gled->mcdev.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
> +	} else {
> +		gled->mcdev.led_cdev.brightness_set_blocking =
> +			lg_g510_kbd_led_set;
> +		gled->mcdev.led_cdev.brightness_get =
> +			lg_g510_kbd_led_get;
> +	}
> +	gled->mcdev.led_cdev.max_brightness = 255;
> +	gled->mcdev.num_colors = 3;
>  
>  	subled_info = devm_kcalloc(&g15->hdev->dev, 3, sizeof(*subled_info), GFP_KERNEL);
>  	if (!subled_info)
> @@ -632,20 +945,20 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
>  		switch (i + 1) {
>  		case LED_COLOR_ID_RED:
>  			subled_info[i].color_index = LED_COLOR_ID_RED;
> -			subled_info[i].intensity = g15->leds[index].red;
> +			subled_info[i].intensity = gled->red;
>  			break;
>  		case LED_COLOR_ID_GREEN:
>  			subled_info[i].color_index = LED_COLOR_ID_GREEN;
> -			subled_info[i].intensity = g15->leds[index].green;
> +			subled_info[i].intensity = gled->green;
>  			break;
>  		case LED_COLOR_ID_BLUE:
>  			subled_info[i].color_index = LED_COLOR_ID_BLUE;
> -			subled_info[i].intensity = g15->leds[index].blue;
> +			subled_info[i].intensity = gled->blue;
>  			break;
>  		}
>  		subled_info[i].channel = i;
>  	}
> -	g15->leds[index].mcdev.subled_info = subled_info;
> +	gled->mcdev.subled_info = subled_info;
>  }
>  
>  static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
> @@ -656,6 +969,23 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
>  	g15->leds[i].cdev.name = name;
>  
>  	switch (g15->model) {
> +	case LG_G13:
> +		if (i < LG_G15_BRIGHTNESS_MAX) {
> +			/* RGB backlight. */
> +			lg_g15_setup_led_rgb(g15, i);
> +			ret = devm_led_classdev_multicolor_register_ext(&g15->hdev->dev,
> +									&g15->leds[i].mcdev,
> +									NULL);
> +		} else {
> +			/* Macro keys */
> +			g15->leds[i].cdev.brightness_set_blocking = lg_g13_mkey_led_set;
> +			g15->leds[i].cdev.brightness_get = lg_g13_mkey_led_get;
> +			g15->leds[i].cdev.max_brightness = 1;
> +
> +			ret = devm_led_classdev_register(&g15->hdev->dev,
> +							 &g15->leds[i].cdev);
> +		}
> +		break;
>  	case LG_G15:
>  	case LG_G15_V2:
>  		g15->leds[i].cdev.brightness_get = lg_g15_led_get;
> @@ -702,11 +1032,9 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
>  }
>  
>  /* Common input device init code shared between keyboards and Z-10 speaker handling */
> -static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *input,
> -				  const char *name)
> +static void lg_g15_init_input_dev_core(struct hid_device *hdev, struct input_dev *input,
> +				       char const *name)
>  {
> -	int i;
> -
>  	input->name = name;
>  	input->phys = hdev->phys;
>  	input->uniq = hdev->uniq;
> @@ -717,12 +1045,42 @@ static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *inp
>  	input->dev.parent = &hdev->dev;
>  	input->open = lg_g15_input_open;
>  	input->close = lg_g15_input_close;
> +}
> +
> +static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *input,
> +				  const char *name)
> +{
> +	int i;
> +
> +	lg_g15_init_input_dev_core(hdev, input, name);
>  
>  	/* Keys below the LCD, intended for controlling a menu on the LCD */
>  	for (i = 0; i < 5; i++)
>  		input_set_capability(input, EV_KEY, KEY_KBD_LCD_MENU1 + i);
>  }
>  
> +static void lg_g13_init_input_dev(struct hid_device *hdev,
> +				  struct input_dev *input, const char *name,
> +				  struct input_dev *input_js, const char *name_js)
> +{
> +	/* Macropad. */
> +	lg_g15_init_input_dev_core(hdev, input, name);
> +	for (int i = 0; i < ARRAY_SIZE(g13_keys_for_bits); ++i) {
> +		if (g13_keys_for_bits[i])
> +			input_set_capability(input, EV_KEY, g13_keys_for_bits[i]);
> +	}
> +
> +	/* OBTW, we're a joystick, too... */
> +	lg_g15_init_input_dev_core(hdev, input_js, name_js);
> +	for (int i = 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i)
> +		input_set_capability(input_js, EV_KEY, g13_keys_for_bits_js[i]);
> +
> +	input_set_capability(input_js, EV_ABS, ABS_X);
> +	input_set_abs_params(input_js, ABS_X, 0, 255, 0, 0);
> +	input_set_capability(input_js, EV_ABS, ABS_Y);
> +	input_set_abs_params(input_js, ABS_Y, 0, 255, 0, 0);
> +}
> +
>  static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
>  	static const char * const led_names[] = {
> @@ -739,7 +1097,7 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	unsigned int connect_mask = 0;
>  	bool has_ff000000 = false;
>  	struct lg_g15_data *g15;
> -	struct input_dev *input;
> +	struct input_dev *input, *input_js;
>  	struct hid_report *rep;
>  	int ret, i, gkeys = 0;
>  
> @@ -778,6 +1136,25 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	hid_set_drvdata(hdev, (void *)g15);
>  
>  	switch (g15->model) {
> +	case LG_G13:
> +		/*
> +		 * The G13 has an analog thumbstick with nearby buttons.  Some
> +		 * libraries and applications are known to ignore devices that
> +		 * don't "look like" a joystick, and a device with two ABS axes
> +		 * and 25+ macro keys would confuse them.
> +		 *
> +		 * Create an additional input device dedicated to appear as a
> +		 * simplified joystick (two ABS axes, three BTN buttons).
> +		 */
> +		input_js = devm_input_allocate_device(&hdev->dev);
> +		if (!input_js)
> +			return -ENOMEM;
> +		g15->input_js = input_js;
> +		input_set_drvdata(input_js, hdev);
> +
> +		connect_mask = HID_CONNECT_HIDRAW;
> +		gkeys = 25;
> +		break;
>  	case LG_G15:
>  		INIT_WORK(&g15->work, lg_g15_leds_changed_work);
>  		/*
> @@ -859,6 +1236,38 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  			goto error_hw_stop;
>  
>  		return 0; /* All done */
> +	} else if (g15->model == LG_G13) {
> +		static char const * const g13_led_names[] = {
> +			/* Backlight is shared between LCD and keys. */
> +			"g13:rgb:kbd_backlight",
> +			NULL,	/* Keep in sync with led_type enum */
> +			"g13:red:macro_preset_1",
> +			"g13:red:macro_preset_2",
> +			"g13:red:macro_preset_3",
> +			"g13:red:macro_record",
> +		};
> +		lg_g13_init_input_dev(hdev,
> +				      input, "Logitech G13 Gaming Keypad",
> +				      input_js, "Logitech G13 Thumbstick");
> +		ret = input_register_device(input);
> +		if (ret)
> +			goto error_hw_stop;
> +		ret = input_register_device(input_js);
> +		if (ret)
> +			goto error_hw_stop;
> +
> +		for (i = 0; i < ARRAY_SIZE(g13_led_names); ++i) {
> +			if (g13_led_names[i]) {
> +				ret = lg_g15_register_led(g15, i, g13_led_names[i]);
> +				if (ret)
> +					goto error_hw_stop;
> +			}
> +		}
> +		led_classdev_notify_brightness_hw_changed(
> +			&g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev.led_cdev,
> +			g15->backlight_disabled
> +			? 0 : g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
> +		return 0;
>  	}
>  
>  	/* Setup and register input device */
> @@ -903,6 +1312,13 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  }
>  
>  static const struct hid_device_id lg_g15_devices[] = {
> +	/*
> +	 * The G13 is a macropad-only device with an LCD, LED backlighing,
> +	 * and joystick.
> +	 */
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +			 USB_DEVICE_ID_LOGITECH_G13),
> +		.driver_data = LG_G13 },
>  	/* The G11 is a G15 without the LCD, treat it as a G15 */
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>  		USB_DEVICE_ID_LOGITECH_G11),


