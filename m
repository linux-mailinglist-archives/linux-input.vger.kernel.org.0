Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9432EE884
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbhAGW0C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:26:02 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:16594 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728481AbhAGW0B (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:26:01 -0500
Date:   Thu, 07 Jan 2021 22:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610058319;
        bh=oS4GEc0YKLg0xAXfjpdDA1wE5WRVX/wPxs9oKTcJlN4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=mHNGCYotHGgb7M58Yp0UBmBYv8/FdvUj6e3rwJrdBzzYZGZo5ZiXDEB8TlH0rLpXZ
         agZ/2dlLNzue8JmYO2inTccKxyWNksVpXhts5kr6lZYw4zJdgXee3XprQwTF4EYfJX
         SGaV50uDb0qPuNRwJe6gmlN1/Qx7HPxmox+O1P4A=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 12/13] HID: playstation: DualSense set LEDs to default player id.
Message-ID: <uyEK3LmEvaKDosxkqkczg8jyXrMGJdo2b69sFZrK0Zlbag81cf5AMqf60JATfAyeFLCWpMT3z9k1i16W5Vbw7gjmNep2lV6BtTG-vDo947I=@protonmail.com>
In-Reply-To: <20210102223109.996781-13-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-13-roderick@gaikai.com>
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


2021. janu=C3=A1r 2., szombat 23:31 keltez=C3=A9ssel, Roderick Colenbrander=
 =C3=ADrta:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Add a ID allocator to assign player ids to ps_device instances.
> Utilize the player id to set a default color on the DualSense its
> player LED strip.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> [...]
> +static void ps_device_release_player_id(struct ps_device *dev)
> +{
> +=09ida_free(&ps_player_id_allocator, dev->player_id);
> +
> +=09dev->player_id =3D -1;

A minor thing, but I believe U32_MAX would be better here. I'd avoid
(especially) negative magic numbers for an unsigned value. You could even
  #define PS_PLAYER_ID_INVALID U32_MAX
or something similar.


> +}
> +
>  static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, =
const char *name_suffix)
>  {
>  =09struct input_dev *input_dev;
> @@ -1102,6 +1125,28 @@  static int dualsense_reset_leds(struct dualsense =
*ds)
>  =09return 0;
>  }
>
> +static void dualsense_set_player_leds(struct dualsense *ds)
> +{
> +=09/* The DualSense controller has a row of 5 LEDs used for player ids.
> +=09 * Behavior on the PlayStation 5 console is to center the player id
> +=09 * across the LEDs, so e.g. player 1 would be "--x--" with x being 'o=
n'.
> +=09 * Follow a similar mapping here.
> +=09 */
> +=09int player_ids[5] =3D {
> +=09=09BIT(2),
> +=09=09BIT(3) | BIT(1),
> +=09=09BIT(4) | BIT(2) | BIT(0),
> +=09=09BIT(4) | BIT(3) | BIT(1) | BIT(0),
> +=09=09BIT(4) | BIT(3) | BIT(2) | BIT(1) | BIT(0)
> +=09};
> +
> +=09uint8_t player_id =3D ds->base.player_id % 5;

I'd write `ds->base.player_id % ARRAY_SIZE(player_ids)` here.


> +
> +=09ds->update_player_leds =3D true;
> +=09ds->player_leds_state =3D player_ids[player_id];
> +=09schedule_work(&ds->output_worker);
> +}
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
