Return-Path: <linux-input+bounces-14805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 199E7B7F9CA
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 15:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6FF8621F8F
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 13:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4692F25F3;
	Wed, 17 Sep 2025 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xvu6r6zB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B571607AC;
	Wed, 17 Sep 2025 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117022; cv=none; b=EiYzqQHkDt6RI065Z1/tC6aLWo5HmWGzm9MLRd6REC02p0siLsKIafaxUWILL9W7JuirYjeDF+5+dIKFjjwWKN4bO2NXSqdsktNh5zRoa5XqhiuHkEIznZ6CmXH1opYh/UnJI3wY6EdkkDmLw4/ZgvN6vwdYlzzAmAaWctuGCrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117022; c=relaxed/simple;
	bh=G3+GGKsqSvkauLB76fpYYc3vc/9bpSni8eIo0sKFWyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKW+EuyX9XtzrUeb7GHccprftUGi50/loZ7dfF7Zw0hRN34vBLAL/nOoBajWvMgLli8cubDTmzHcofOfyRypIUMz+zt7cOMOmPotL97J4WyMn2ds+dHfYbUmGDT3dB6vHJ8gMkOuiFH1lP2GqE9Vyb/iPBpTetmpWMx21KpoGbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xvu6r6zB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FFBC4CEE7;
	Wed, 17 Sep 2025 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758117021;
	bh=G3+GGKsqSvkauLB76fpYYc3vc/9bpSni8eIo0sKFWyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xvu6r6zBIVthYPajjxtLN3gNaL9ExMAnu//U7TM3uqmkODEmY1ETD+oYTINaY/T9A
	 ltrRWt2WlLa09bC5BXvWZqK/qeONVxCr+xUfSWI3crTZ9yH62xGVG0S3eTwXcM+8+C
	 IShxVQ0PIFluVB/WebEm9V+SukEyhNcXGJbsYuaZDT/VR2Jn0DFJT08EgJQBz6YIQR
	 F8C2Ly2BVCJ0otdHRIoIeqpafoy3fiehtJjI6tD9ZJkuy51A970VZ/v0mUT8Vx6q1W
	 USCfWWuVtzq71vaju2kv35azy/NoHPQf1rvowrkUslbjOkkPGvCBlf6qYPWyPgd/ph
	 mJeT6/XVUzdQQ==
Date: Wed, 17 Sep 2025 15:50:16 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
	Jiri Kosina <jikos@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] HID: playstation: Simplify locking with guard()
 and scoped_guard()
Message-ID: <dor5e2ugnp4k5iava3uwxltttrfopkqoo23uex6xdu5rcz6rqt@7ett6gqco32m>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <20250625-dualsense-hid-jack-v2-3-596c0db14128@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-dualsense-hid-jack-v2-3-596c0db14128@collabora.com>

On Jun 25 2025, Cristian Ciocaltea wrote:
> Use guard() and scoped_guard() infrastructure instead of explicitly
> acquiring and releasing spinlocks and mutexes to simplify the code and
> ensure that all locks are released properly.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

It looks like the patch is now creating sparse errors:

https://gitlab.freedesktop.org/bentiss/hid/-/jobs/84636162

with:

drivers/hid/hid-playstation.c:1187:32: warning: context imbalance in 'dualsense_player_led_set_brightness' - wrong count at exit
drivers/hid/hid-playstation.c:1403:9: warning: context imbalance in 'dualsense_parse_report' - different lock contexts for basic block
drivers/hid/hid-playstation.c:1499:12: warning: context imbalance in 'dualsense_play_effect' - different lock contexts for basic block
drivers/hid/hid-playstation.c:1552:13: warning: context imbalance in 'dualsense_set_lightbar' - wrong count at exit
drivers/hid/hid-playstation.c:1564:13: warning: context imbalance in 'dualsense_set_player_leds' - wrong count at exit
drivers/hid/hid-playstation.c:2054:33: warning: context imbalance in 'dualshock4_led_set_blink' - wrong count at exit
drivers/hid/hid-playstation.c:2095:33: warning: context imbalance in 'dualshock4_led_set_brightness' - wrong count at exit
drivers/hid/hid-playstation.c:2463:12: warning: context imbalance in 'dualshock4_play_effect' - different lock contexts for basic block
drivers/hid/hid-playstation.c:2501:13: warning: context imbalance in 'dualshock4_set_bt_poll_interval' - wrong count at exit
drivers/hid/hid-playstation.c:2509:13: warning: context imbalance in 'dualshock4_set_default_lightbar_colors' - wrong count at exit

(the artifacts are going to be removed in 4 hours, so better document
the line numbers here).

I am under the impression that it's because the 2 *_output_worker
functions are not using scoped guarding, but it could very well be
something entirely different. Do you mind taking a look as well?

Cheers,
Benjamin

> ---
>  drivers/hid/hid-playstation.c | 216 ++++++++++++++++++------------------------
>  1 file changed, 93 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 799b47cdfe034c2b78ec589ac19e3c7a764dc784..ab3a0c505c4db9110ae4d528ba70b32d9f90b81b 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/crc32.h>
>  #include <linux/device.h>
>  #include <linux/hid.h>
> @@ -566,26 +567,25 @@ static int ps_devices_list_add(struct ps_device *dev)
>  {
>  	struct ps_device *entry;
>  
> -	mutex_lock(&ps_devices_lock);
> +	guard(mutex)(&ps_devices_lock);
> +
>  	list_for_each_entry(entry, &ps_devices_list, list) {
>  		if (!memcmp(entry->mac_address, dev->mac_address, sizeof(dev->mac_address))) {
>  			hid_err(dev->hdev, "Duplicate device found for MAC address %pMR.\n",
>  					dev->mac_address);
> -			mutex_unlock(&ps_devices_lock);
>  			return -EEXIST;
>  		}
>  	}
>  
>  	list_add_tail(&dev->list, &ps_devices_list);
> -	mutex_unlock(&ps_devices_lock);
>  	return 0;
>  }
>  
>  static int ps_devices_list_remove(struct ps_device *dev)
>  {
> -	mutex_lock(&ps_devices_lock);
> +	guard(mutex)(&ps_devices_lock);
> +
>  	list_del(&dev->list);
> -	mutex_unlock(&ps_devices_lock);
>  	return 0;
>  }
>  
> @@ -649,13 +649,12 @@ static int ps_battery_get_property(struct power_supply *psy,
>  	struct ps_device *dev = power_supply_get_drvdata(psy);
>  	uint8_t battery_capacity;
>  	int battery_status;
> -	unsigned long flags;
>  	int ret = 0;
>  
> -	spin_lock_irqsave(&dev->lock, flags);
> -	battery_capacity = dev->battery_capacity;
> -	battery_status = dev->battery_status;
> -	spin_unlock_irqrestore(&dev->lock, flags);
> +	scoped_guard(spinlock_irqsave, &dev->lock) {
> +		battery_capacity = dev->battery_capacity;
> +		battery_status = dev->battery_status;
> +	}
>  
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_STATUS:
> @@ -1173,19 +1172,17 @@ static int dualsense_player_led_set_brightness(struct led_classdev *led, enum le
>  {
>  	struct hid_device *hdev = to_hid_device(led->dev->parent);
>  	struct dualsense *ds = hid_get_drvdata(hdev);
> -	unsigned long flags;
>  	unsigned int led_index;
>  
> -	spin_lock_irqsave(&ds->base.lock, flags);
> -
> -	led_index = led - ds->player_leds;
> -	if (value == LED_OFF)
> -		ds->player_leds_state &= ~BIT(led_index);
> -	else
> -		ds->player_leds_state |= BIT(led_index);
> +	scoped_guard(spinlock_irqsave, &ds->base.lock) {
> +		led_index = led - ds->player_leds;
> +		if (value == LED_OFF)
> +			ds->player_leds_state &= ~BIT(led_index);
> +		else
> +			ds->player_leds_state |= BIT(led_index);
>  
> -	ds->update_player_leds = true;
> -	spin_unlock_irqrestore(&ds->base.lock, flags);
> +		ds->update_player_leds = true;
> +	}
>  
>  	dualsense_schedule_work(ds);
>  
> @@ -1234,12 +1231,9 @@ static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_
>  
>  static inline void dualsense_schedule_work(struct dualsense *ds)
>  {
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&ds->base.lock, flags);
> +	guard(spinlock_irqsave)(&ds->base.lock);
>  	if (ds->output_worker_initialized)
>  		schedule_work(&ds->output_worker);
> -	spin_unlock_irqrestore(&ds->base.lock, flags);
>  }
>  
>  /*
> @@ -1337,7 +1331,6 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>  	int battery_status;
>  	uint32_t sensor_timestamp;
>  	bool btn_mic_state;
> -	unsigned long flags;
>  	int i;
>  
>  	/*
> @@ -1399,10 +1392,10 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>  	 */
>  	btn_mic_state = !!(ds_report->buttons[2] & DS_BUTTONS2_MIC_MUTE);
>  	if (btn_mic_state && !ds->last_btn_mic_state) {
> -		spin_lock_irqsave(&ps_dev->lock, flags);
> -		ds->update_mic_mute = true;
> -		ds->mic_muted = !ds->mic_muted; /* toggle */
> -		spin_unlock_irqrestore(&ps_dev->lock, flags);
> +		scoped_guard(spinlock_irqsave, &ps_dev->lock) {
> +			ds->update_mic_mute = true;
> +			ds->mic_muted = !ds->mic_muted; /* toggle */
> +		}
>  
>  		/* Schedule updating of microphone state at hardware level. */
>  		dualsense_schedule_work(ds);
> @@ -1495,10 +1488,10 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>  		battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
>  	}
>  
> -	spin_lock_irqsave(&ps_dev->lock, flags);
> -	ps_dev->battery_capacity = battery_capacity;
> -	ps_dev->battery_status = battery_status;
> -	spin_unlock_irqrestore(&ps_dev->lock, flags);
> +	scoped_guard(spinlock_irqsave, &ps_dev->lock) {
> +		ps_dev->battery_capacity = battery_capacity;
> +		ps_dev->battery_status = battery_status;
> +	}
>  
>  	return 0;
>  }
> @@ -1507,16 +1500,15 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
>  {
>  	struct hid_device *hdev = input_get_drvdata(dev);
>  	struct dualsense *ds = hid_get_drvdata(hdev);
> -	unsigned long flags;
>  
>  	if (effect->type != FF_RUMBLE)
>  		return 0;
>  
> -	spin_lock_irqsave(&ds->base.lock, flags);
> -	ds->update_rumble = true;
> -	ds->motor_left = effect->u.rumble.strong_magnitude / 256;
> -	ds->motor_right = effect->u.rumble.weak_magnitude / 256;
> -	spin_unlock_irqrestore(&ds->base.lock, flags);
> +	scoped_guard(spinlock_irqsave, &ds->base.lock) {
> +		ds->update_rumble = true;
> +		ds->motor_left = effect->u.rumble.strong_magnitude / 256;
> +		ds->motor_right = effect->u.rumble.weak_magnitude / 256;
> +	}
>  
>  	dualsense_schedule_work(ds);
>  	return 0;
> @@ -1525,11 +1517,9 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
>  static void dualsense_remove(struct ps_device *ps_dev)
>  {
>  	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&ds->base.lock, flags);
> -	ds->output_worker_initialized = false;
> -	spin_unlock_irqrestore(&ds->base.lock, flags);
> +	scoped_guard(spinlock_irqsave, &ds->base.lock)
> +		ds->output_worker_initialized = false;
>  
>  	cancel_work_sync(&ds->output_worker);
>  }
> @@ -1561,14 +1551,12 @@ static int dualsense_reset_leds(struct dualsense *ds)
>  
>  static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue)
>  {
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&ds->base.lock, flags);
> -	ds->update_lightbar = true;
> -	ds->lightbar_red = red;
> -	ds->lightbar_green = green;
> -	ds->lightbar_blue = blue;
> -	spin_unlock_irqrestore(&ds->base.lock, flags);
> +	scoped_guard(spinlock_irqsave, &ds->base.lock) {
> +		ds->update_lightbar = true;
> +		ds->lightbar_red = red;
> +		ds->lightbar_green = green;
> +		ds->lightbar_blue = blue;
> +	}
>  
>  	dualsense_schedule_work(ds);
>  }
> @@ -1755,7 +1743,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>  static void dualshock4_dongle_calibration_work(struct work_struct *work)
>  {
>  	struct dualshock4 *ds4 = container_of(work, struct dualshock4, dongle_hotplug_worker);
> -	unsigned long flags;
>  	enum dualshock4_dongle_state dongle_state;
>  	int ret;
>  
> @@ -1774,9 +1761,8 @@ static void dualshock4_dongle_calibration_work(struct work_struct *work)
>  		dongle_state = DONGLE_CONNECTED;
>  	}
>  
> -	spin_lock_irqsave(&ds4->base.lock, flags);
> -	ds4->dongle_state = dongle_state;
> -	spin_unlock_irqrestore(&ds4->base.lock, flags);
> +	scoped_guard(spinlock_irqsave, &ds4->base.lock)
> +		ds4->dongle_state = dongle_state;
>  }
>  
>  static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
> @@ -2048,26 +2034,23 @@ static int dualshock4_led_set_blink(struct led_classdev *led, unsigned long *del
>  {
>  	struct hid_device *hdev = to_hid_device(led->dev->parent);
>  	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&ds4->base.lock, flags);
> +	scoped_guard(spinlock_irqsave, &ds4->base.lock) {
> +		if (!*delay_on && !*delay_off) {
> +			/* Default to 1 Hz (50 centiseconds on, 50 centiseconds off). */
> +			ds4->lightbar_blink_on = 50;
> +			ds4->lightbar_blink_off = 50;
> +		} else {
> +			/* Blink delays in centiseconds. */
> +			ds4->lightbar_blink_on = min_t(unsigned long, *delay_on / 10,
> +						       DS4_LIGHTBAR_MAX_BLINK);
> +			ds4->lightbar_blink_off = min_t(unsigned long, *delay_off / 10,
> +							DS4_LIGHTBAR_MAX_BLINK);
> +		}
>  
> -	if (!*delay_on && !*delay_off) {
> -		/* Default to 1 Hz (50 centiseconds on, 50 centiseconds off). */
> -		ds4->lightbar_blink_on = 50;
> -		ds4->lightbar_blink_off = 50;
> -	} else {
> -		/* Blink delays in centiseconds. */
> -		ds4->lightbar_blink_on = min_t(unsigned long, *delay_on / 10,
> -					       DS4_LIGHTBAR_MAX_BLINK);
> -		ds4->lightbar_blink_off = min_t(unsigned long, *delay_off / 10,
> -						DS4_LIGHTBAR_MAX_BLINK);
> +		ds4->update_lightbar_blink = true;
>  	}
>  
> -	ds4->update_lightbar_blink = true;
> -
> -	spin_unlock_irqrestore(&ds4->base.lock, flags);
> -
>  	dualshock4_schedule_work(ds4);
>  
>  	/* Report scaled values back to LED subsystem */
> @@ -2081,36 +2064,33 @@ static int dualshock4_led_set_brightness(struct led_classdev *led, enum led_brig
>  {
>  	struct hid_device *hdev = to_hid_device(led->dev->parent);
>  	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
> -	unsigned long flags;
>  	unsigned int led_index;
>  
> -	spin_lock_irqsave(&ds4->base.lock, flags);
> -
> -	led_index = led - ds4->lightbar_leds;
> -	switch (led_index) {
> -	case 0:
> -		ds4->lightbar_red = value;
> -		break;
> -	case 1:
> -		ds4->lightbar_green = value;
> -		break;
> -	case 2:
> -		ds4->lightbar_blue = value;
> -		break;
> -	case 3:
> -		ds4->lightbar_enabled = !!value;
> -
> -		/* brightness = 0 also cancels blinking in Linux. */
> -		if (!ds4->lightbar_enabled) {
> -			ds4->lightbar_blink_off = 0;
> -			ds4->lightbar_blink_on = 0;
> -			ds4->update_lightbar_blink = true;
> +	scoped_guard(spinlock_irqsave, &ds4->base.lock) {
> +		led_index = led - ds4->lightbar_leds;
> +		switch (led_index) {
> +		case 0:
> +			ds4->lightbar_red = value;
> +			break;
> +		case 1:
> +			ds4->lightbar_green = value;
> +			break;
> +		case 2:
> +			ds4->lightbar_blue = value;
> +			break;
> +		case 3:
> +			ds4->lightbar_enabled = !!value;
> +
> +			/* brightness = 0 also cancels blinking in Linux. */
> +			if (!ds4->lightbar_enabled) {
> +				ds4->lightbar_blink_off = 0;
> +				ds4->lightbar_blink_on = 0;
> +				ds4->update_lightbar_blink = true;
> +			}
>  		}
> -	}
> -
> -	ds4->update_lightbar = true;
>  
> -	spin_unlock_irqrestore(&ds4->base.lock, flags);
> +		ds4->update_lightbar = true;
> +	}
>  
>  	dualshock4_schedule_work(ds4);
>  
> @@ -2242,7 +2222,6 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
>  	uint8_t battery_capacity, num_touch_reports, value;
>  	int battery_status, i, j;
>  	uint16_t sensor_timestamp;
> -	unsigned long flags;
>  	bool is_minimal = false;
>  
>  	/*
> @@ -2420,10 +2399,10 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
>  		battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
>  	}
>  
> -	spin_lock_irqsave(&ps_dev->lock, flags);
> -	ps_dev->battery_capacity = battery_capacity;
> -	ps_dev->battery_status = battery_status;
> -	spin_unlock_irqrestore(&ps_dev->lock, flags);
> +	scoped_guard(spinlock_irqsave, &ps_dev->lock) {
> +		ps_dev->battery_capacity = battery_capacity;
> +		ps_dev->battery_status = battery_status;
> +	}
>  
>  	return 0;
>  }
> @@ -2441,7 +2420,6 @@ static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_r
>  	 */
>  	if (data[0] == DS4_INPUT_REPORT_USB && size == DS4_INPUT_REPORT_USB_SIZE) {
>  		struct dualshock4_input_report_common *ds4_report = (struct dualshock4_input_report_common *)&data[1];
> -		unsigned long flags;
>  
>  		connected = ds4_report->status[1] & DS4_STATUS1_DONGLE_STATE ? false : true;
>  
> @@ -2450,9 +2428,8 @@ static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_r
>  
>  			dualshock4_set_default_lightbar_colors(ds4);
>  
> -			spin_lock_irqsave(&ps_dev->lock, flags);
> -			ds4->dongle_state = DONGLE_CALIBRATING;
> -			spin_unlock_irqrestore(&ps_dev->lock, flags);
> +			scoped_guard(spinlock_irqsave, &ps_dev->lock)
> +				ds4->dongle_state = DONGLE_CALIBRATING;
>  
>  			schedule_work(&ds4->dongle_hotplug_worker);
>  
> @@ -2464,9 +2441,8 @@ static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_r
>  			    ds4->dongle_state == DONGLE_DISABLED) && !connected) {
>  			hid_info(ps_dev->hdev, "DualShock 4 USB dongle: controller disconnected\n");
>  
> -			spin_lock_irqsave(&ps_dev->lock, flags);
> -			ds4->dongle_state = DONGLE_DISCONNECTED;
> -			spin_unlock_irqrestore(&ps_dev->lock, flags);
> +			scoped_guard(spinlock_irqsave, &ps_dev->lock)
> +				ds4->dongle_state = DONGLE_DISCONNECTED;
>  
>  			/* Return 0, so hidraw can get the report. */
>  			return 0;
> @@ -2488,16 +2464,15 @@ static int dualshock4_play_effect(struct input_dev *dev, void *data, struct ff_e
>  {
>  	struct hid_device *hdev = input_get_drvdata(dev);
>  	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
> -	unsigned long flags;
>  
>  	if (effect->type != FF_RUMBLE)
>  		return 0;
>  
> -	spin_lock_irqsave(&ds4->base.lock, flags);
> -	ds4->update_rumble = true;
> -	ds4->motor_left = effect->u.rumble.strong_magnitude / 256;
> -	ds4->motor_right = effect->u.rumble.weak_magnitude / 256;
> -	spin_unlock_irqrestore(&ds4->base.lock, flags);
> +	scoped_guard(spinlock_irqsave, &ds4->base.lock) {
> +		ds4->update_rumble = true;
> +		ds4->motor_left = effect->u.rumble.strong_magnitude / 256;
> +		ds4->motor_right = effect->u.rumble.weak_magnitude / 256;
> +	}
>  
>  	dualshock4_schedule_work(ds4);
>  	return 0;
> @@ -2506,11 +2481,9 @@ static int dualshock4_play_effect(struct input_dev *dev, void *data, struct ff_e
>  static void dualshock4_remove(struct ps_device *ps_dev)
>  {
>  	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&ds4->base.lock, flags);
> -	ds4->output_worker_initialized = false;
> -	spin_unlock_irqrestore(&ds4->base.lock, flags);
> +	scoped_guard(spinlock_irqsave, &ds4->base.lock)
> +		ds4->output_worker_initialized = false;
>  
>  	cancel_work_sync(&ds4->output_worker);
>  
> @@ -2520,12 +2493,9 @@ static void dualshock4_remove(struct ps_device *ps_dev)
>  
>  static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
>  {
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&ds4->base.lock, flags);
> +	guard(spinlock_irqsave)(&ds4->base.lock);
>  	if (ds4->output_worker_initialized)
>  		schedule_work(&ds4->output_worker);
> -	spin_unlock_irqrestore(&ds4->base.lock, flags);
>  }
>  
>  static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8_t interval)
> 
> -- 
> 2.49.0
> 

