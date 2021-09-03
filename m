Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D06A400315
	for <lists+linux-input@lfdr.de>; Fri,  3 Sep 2021 18:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236655AbhICQSf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Sep 2021 12:18:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53364 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233991AbhICQSe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Sep 2021 12:18:34 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E5BBF1C0B87; Fri,  3 Sep 2021 18:17:33 +0200 (CEST)
Date:   Fri, 3 Sep 2021 18:17:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v2 3/3] HID: playstation: expose DualSense player LEDs
 through LED class.
Message-ID: <20210903161724.GC2209@bug>
References: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
 <20210901223037.2964665-4-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901223037.2964665-4-roderick.colenbrander@sony.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

> The DualSense player LEDs were so far not adjustable from user-space.
> This patch exposes each LED individually through the LED class. Each
> LED uses the new 'player' function resulting in a name like:
> 'inputX:white:player-1' for the first LED.
> 
>  
> +struct ps_led_info {
...
> +	enum led_brightness (*brightness_get)(struct led_classdev *cdev);
> +	void (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
> +};

Do you need these fields? They are constant in the driver...

> +static enum led_brightness dualsense_player_led_get_brightness(struct led_classdev *led)
> +{
> +	struct hid_device *hdev = to_hid_device(led->dev->parent);
> +	struct dualsense *ds = hid_get_drvdata(hdev);
> +
> +	return !!(ds->player_leds_state & BIT(led - ds->player_leds));
> +}

You should not need to implement get if all it does is returning cached state.

> +static void dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
> +{
> +	struct hid_device *hdev = to_hid_device(led->dev->parent);
> +	struct dualsense *ds = hid_get_drvdata(hdev);
> +	unsigned long flags;
> +	unsigned int led_index;
> +
> +	spin_lock_irqsave(&ds->base.lock, flags);
> +
> +	led_index = led - ds->player_leds;
> +	if (value == LED_OFF)
> +		ds->player_leds_state &= ~BIT(led_index);
> +	else
> +		ds->player_leds_state |= BIT(led_index);
> +
> +	ds->update_player_leds = true;
> +	spin_unlock_irqrestore(&ds->base.lock, flags);
> +
> +	schedule_work(&ds->output_worker);
> +}

LED core can handle scheduling the work for you. You should use it, in similar
way you handle the RGB led.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
