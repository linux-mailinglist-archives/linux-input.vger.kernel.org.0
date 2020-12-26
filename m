Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557B22E2F01
	for <lists+linux-input@lfdr.de>; Sat, 26 Dec 2020 20:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgLZT1y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Dec 2020 14:27:54 -0500
Received: from lithium.sammserver.com ([168.119.122.30]:34712 "EHLO
        lithium.sammserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgLZT1y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Dec 2020 14:27:54 -0500
X-Greylist: delayed 61930 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Dec 2020 14:27:53 EST
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id A41A831181DE;
        Sat, 26 Dec 2020 20:27:12 +0100 (CET)
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id 29CE43C5F3;
        Sat, 26 Dec 2020 20:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1609010832; bh=SZSJJ4UZ8FVw/WfczsUHj7kLkqBT4CcspdccNEOvUgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kkL/LBdfhgvNETKapE+/REOY2Zq9ORqX6bSFnUrySsnb1divTSv9+3cjNDE9i52pR
         kbetR0/ygy6W4gA4pD+40R95xh34bqe8l1/gjmXkMbR2UpSGIBO5yVByjbFUd+K1QR
         zDleIr9S2wAFYMkY/G8Cg9R6FKqF8t6kgIMB7alM=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id 1712E1420814; Sat, 26 Dec 2020 20:27:12 +0100 (CET)
Date:   Sat, 26 Dec 2020 20:27:12 +0100
From:   Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 11/13] HID: playstation: add DualSense player LEDs
 support.
Message-ID: <20201226192712.ky56nhdbh6n43bp6@fastboi.localdomain>
References: <20201219062336.72568-1-roderick@gaikai.com>
 <20201219062336.72568-12-roderick@gaikai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201219062336.72568-12-roderick@gaikai.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS autolearn=no autolearn_force=no
        version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on sammserver.tu
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I noticed that the `value` argument is not at all used in the
player_led_set_brightness function.

On 18.12.2020 22:23, Roderick Colenbrander wrote:
> +
> +static void dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
> +{
> +	struct hid_device *hdev = to_hid_device(led->dev->parent);
> +	struct dualsense *ds = hid_get_drvdata(hdev);
> +	uint8_t player_leds_state = 0;
> +	unsigned long flags;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ds->player_leds); i++)
> +		player_leds_state |= (ds->player_leds[i].brightness << i);

Is it guaranteed at this point, that the led->brightness is set to the
new value? I'm unfamiliar with the led subsystem, but skimming other
drivers I found that they update the device based on the value of the
`value` argument.

> +
> +	spin_lock_irqsave(&ds->base.lock, flags);
> +	ds->player_leds_state = player_leds_state;
> +	ds->update_player_leds = true;
> +	spin_unlock_irqrestore(&ds->base.lock, flags);
> +
> +	schedule_work(&ds->output_worker);
> +}

Reading led-core.c, I found that led_set_brightness_{nosleep,sync} do
set the brightness attribute, but the _nopm one does not and it is
exported, although it is not used anywhere other than led-core.c and
led-class.c.

However, I find the usage in led_classdev_suspend and _resume
interesting. In suspend, set_brightness_nopm is called with a value of
0, which should turn off the LED while retaining the value of the
brightness attribute, which is later recalled in _resume. I assume the
intended behaviour is the LED to turn off when suspending and return to
its original state on resume, without overwriting the attribute.

Assuming that, the "value" argument passed to dualsense_player_led_set_brightness
can be different from led->brightness *on purpose* and should be used
instead.

I would write something along these lines:

for (i = 0; i < ARRAY_SIZE(ds->player_leds); i++) {
	if (&ds->player_leds[i] == led) {
		if (value == LED_OFF)
			player_leds_state &= ~(1 << i);
		else
			player_leds_state |= (1 << i);
		break;
	}
}

This is just me hypothesizing though, could anyone clear this up for
me? Thank you very much.

Regards,
Samuel
