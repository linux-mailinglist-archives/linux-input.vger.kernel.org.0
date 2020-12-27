Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646702E3184
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 15:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgL0O2V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 09:28:21 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:21242 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgL0O2V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 09:28:21 -0500
Date:   Sun, 27 Dec 2020 14:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609079258;
        bh=Da+gcC9fFvqn/X6W0G//V/AB+yC2t4CI0O4D+ziUvY8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=q2dQwQw+fPqVrXLIlpOqR4NaEbPO+Cqgga1H5v6IuXB2UNyf58NIE9WjOHW79NRRw
         +bZUzFWYEG4bdfT+ZjTfWfAWYqTk3yuEJ42GPlywFESs135EXxlVBsDXx2+F+CyZaw
         tUgR+1Cn7VD6zm22JyHrbZVvmVQt0K9sYfa1+6+8=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 11/13] HID: playstation: add DualSense player LEDs support.
Message-ID: <8ROOgrBVvXav7SOnZgBVtvZ4QKubyktYJ2WsauoAH22lewKj2-Rp9a-uEZyxhItvF3Q7pp8hKZ4etl0jgiD-G3XkbL1aM9z8cRNsHHmGN9A=@protonmail.com>
In-Reply-To: <20201219062336.72568-12-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-12-roderick@gaikai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:

> [...]
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index ad8eedd3d2bf..384449e3095d 100644
> [...]
> +static enum led_brightness dualsense_player_led_get_brightness(struct le=
d_classdev *led)
> +{
> +=09struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> +=09struct dualsense *ds =3D hid_get_drvdata(hdev);
> +=09int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(ds->player_leds); i++) {
> +=09=09if (&ds->player_leds[i] =3D=3D led)
> +=09=09=09return !!(ds->player_leds_state & BIT(i));
> +=09}

Is there any reason why

```
  !!(ds->player_leds_state & BIT( led - ds->player_leds ))
```

or something similar is not used? Or am I missing something that prevents t=
his
from working?

Furthermore, I don't quite see the purpose of this function. The LED core
can handle if no brightness_get() callback is provided. And since this
function returns just a cached value, I fail to see how it is different fro=
m
the default behaviour of the LED core, which is returning the last brightne=
ss
value. Am I missing something?


> +
> +=09return LED_OFF;
> +}
> +
> +static void dualsense_player_led_set_brightness(struct led_classdev *led=
, enum led_brightness value)
> +{
> +=09struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> +=09struct dualsense *ds =3D hid_get_drvdata(hdev);
> +=09uint8_t player_leds_state =3D 0;
> +=09unsigned long flags;
> +=09int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(ds->player_leds); i++)
> +=09=09player_leds_state |=3D (ds->player_leds[i].brightness << i);
> +

I believe this could be simplified as well using the fact that
`led - ds->player_leds` gives the index of the LED.


> +=09spin_lock_irqsave(&ds->base.lock, flags);
> +=09ds->player_leds_state =3D player_leds_state;
> +=09ds->update_player_leds =3D true;
> +=09spin_unlock_irqrestore(&ds->base.lock, flags);
> +
> +=09schedule_work(&ds->output_worker);
> +}
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
