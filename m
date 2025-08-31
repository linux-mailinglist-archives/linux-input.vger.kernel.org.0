Return-Path: <linux-input+bounces-14403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56801B3D37F
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 15:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F3BB163CCE
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 13:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941C317A2EB;
	Sun, 31 Aug 2025 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsTucDx9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA7517993;
	Sun, 31 Aug 2025 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756645276; cv=none; b=i1o4+rf2kctT+3GOEA0H/8NjXJgB6pRsQZsN0yiNr8eQOzJaDn29bcS3UlmL3OB5VBJ/FatekQaw1ktxxdCDkxkeCLeH/XBMdhJpihTw8upsyUIoLMK+Sc6eYU773tvYgMRhrcfUCdTY4tBT/k+L8P8Jf2LwPuyl8Mb4uzTcQ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756645276; c=relaxed/simple;
	bh=K/RRwgtr/jyuBfa0ugyglnMmaTHqDQfBmdCFjAF1Ls4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ub5swaNi7Q6w2MVwNEvFj+HSUYT1bVoDg0SCxPWzvISeD2CyioDZnT/P/+V0lOk1LmCVQPsLfpio4122mlXS3sJvRMdQhpqf8LnTnG2maqNUTPdPbJOWYsK6RgNZQz3RmgJ4B39Vc0waMWlgRVD5BRhbeRRkZPSs/pJkPCnu62s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsTucDx9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAE8C4CEED;
	Sun, 31 Aug 2025 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756645275;
	bh=K/RRwgtr/jyuBfa0ugyglnMmaTHqDQfBmdCFjAF1Ls4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RsTucDx9/vPcmMgdmOOiGi8ikusW3G0Bnh52wZGxkw0HxmhFE7zDlzrkWoSpm9iWy
	 KvjknB8qSsJC8xztc1SggoAvBCMdn23se+e23jf4Dwfty7iZisNFYUauMNC6vkjT9k
	 iYUZ+w/+uNNdbpBmitY+/bTRPB+e350Ic1DWnl0C2E079QWZ3HHk8TWK8zHpydWYog
	 D/g3Y+D5vsTI/7jJVY/XYrvUi0YnLANmT1I0msWi9e9sIZm2XUj4PFXHhYK32+/VEl
	 sx62O8OLSIF/XecPhgVJFTeYwvG7khRU8p1KUs+TEplh3ptLwbRilEKwJt74xGoiXI
	 0l3KQeeC50MNQ==
Message-ID: <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
Date: Sun, 31 Aug 2025 15:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
To: "Leo L. Schwab" <ewhac@ewhac.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250814212641.197573-2-ewhac@ewhac.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250814212641.197573-2-ewhac@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Leo,

On 14-Aug-25 11:26 PM, Leo L. Schwab wrote:
> The Logitech G13 is a gaming keypad with general-purpose macro keys,
> four LED-backlit macro preset keys, five "menu" keys, backlight toggle
> key, an analog thumbstick, RGB LED backlight, and a monochrome LCD
> display.
> 
> Support input event generation for all keys and the thumbstick, and
> expose all LEDs.
> 
> Signed-off-by: Leo L. Schwab <ewhac@ewhac.org>

Thank you for your patch overal this looks good to me,
some remarks inline below.

...

> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index f8605656257b..6e1d79abfb23 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c

...

> +/**
> + * g13_input_report.keybits[] is not 32-bit aligned, so we can't use the bitops macros.
> + *
> + * @ary: Pointer to array of u8s
> + * @b: Bit index into ary, LSB first.  Not range checked.
> + */
> +#define	TEST_BIT(ary, b)	((1 << ((b) & 7)) & (ary)[(b) >> 3])
> +
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
> +static const u16 g13_keys_for_bits_js[] = {
> +	/* Joystick buttons */
> +	/* These keybits are at bit indices 33, 34, and 35. */
> +	BTN_BASE,	/* Left side */
> +	BTN_BASE2,	/* Bottom side */
> +	BTN_THUMB,	/* Stick depress */
> +};

You are using this 33 offset hardcoded below, maybe
at a #define for this, e.g. :

#define G13_JS_KEYBITS_OFFSET	33

> +
> +static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
> +{
> +	struct g13_input_report const * const rep = (struct g13_input_report *) data;
> +	int i, val;
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
> +		if (g13_keys_for_bits_js[i]) {

g13_keys_for_bits_js[] is contiguous so no need
for this if (g13_keys_for_bits_js[i]) test.

> +			val = TEST_BIT(rep->keybits, i + 33);
> +			input_report_key(g15->input_js, g13_keys_for_bits_js[i], val);
> +		}
> +	}
> +	input_report_abs(g15->input_js, ABS_X, rep->joy_x);
> +	input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
> +	input_sync(g15->input_js);
> +
> +	if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)) {

I do not believe that this IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)
is necessary, led_classdev_notify_brightness_hw_changed() has a static
inline replacement when CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set,
so you can just call it unconditionally.

This is already called unconditionally in other places of the code.

> +		/*
> +		 * Bit 23 of keybits[] reports the current backlight on/off
> +		 * state.  If it has changed from the last cached value, apply
> +		 * an update.
> +		 */
> +		bool hw_brightness_changed = (!!TEST_BIT(rep->keybits, 23))
> +					   ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
> +		if (hw_brightness_changed)
> +			led_classdev_notify_brightness_hw_changed(
> +				&g15->leds[0].cdev,
> +				TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF);
> +	}
> +
> +	return 0;
> +}
> +

...

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
> +	for (int i = 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i) {
> +		if (g13_keys_for_bits_js[i])
> +			input_set_capability(input_js, EV_KEY, g13_keys_for_bits_js[i]);

g13_keys_for_bits_js[] is contiguous so no need
for this if (g13_keys_for_bits_js[i]) test.

This will also allow you to drop the {} from the for loop.

> +	}
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
...

Besides from my few small remarks this looks good to me,
feel free to add:

Reviewed-by: Hans de Goede <hansg@kernel.org>

to the next version.

Regards,

Hans




