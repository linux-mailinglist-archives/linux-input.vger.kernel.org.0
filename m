Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4E238BA6C
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 01:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbhETXgh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 19:36:37 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:11300 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbhETXgh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 19:36:37 -0400
Date:   Thu, 20 May 2021 23:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1621553712;
        bh=S4alO1bJhVCOcYvgJDU+597GyWhVTfKlcu8AueeBgnM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Ud/WWWUHYErHe6EcytsG9GF+DhWWtPX2BOowK3mdscMe6SmdY3FGpBfJM/jVgLuVC
         Q/uoQ0csYDMaFkkHOM44UJqHYpVc/j/uW80wgVO7uo0Zohl/gdwClR/3TyKO8QdUrx
         KeDLB+1S4S2LFEH0wTJ/DUELK7HUTLi2TFDgHicE=
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "thunderbird2k@gmail.com" <thunderbird2k@gmail.com>,
        "blaws05@gmail.com" <blaws05@gmail.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "Roderick.Colenbrander@sony.com" <Roderick.Colenbrander@sony.com>,
        "svv@google.com" <svv@google.com>,
        "s.jegen@gmail.com" <s.jegen@gmail.com>,
        "carmueller@gmail.com" <carmueller@gmail.com>,
        "pgriffais@valvesoftware.com" <pgriffais@valvesoftware.com>,
        "hadess@hadess.net" <hadess@hadess.net>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v13 02/15] HID: nintendo: add player led support
Message-ID: <JmOBKlghm4cLX975NtZzvyo0noT7YpLXsF47QOmXgkpcVPDewimvG68AK6ShwTfKbbwSV7KxngcFbec8VaocAwcakJaolv14oUtyu8uwhtg=@protonmail.com>
In-Reply-To: <20210520224715.680919-3-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com> <20210520224715.680919-3-djogorchock@gmail.com>
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

please cc the linux-leds mailing list and the appropriate subsystem maintai=
ners
at least on the relevant patches.


2021. m=C3=A1jus 21., p=C3=A9ntek 0:47 keltez=C3=A9ssel, Daniel J. Ogorchoc=
k =C3=ADrta:

> This patch adds led_classdev functionality to the switch controller
> driver. It adds support for the 4 player LEDs. The Home Button LED still
> needs to be supported on the pro controllers and right joy-con.
>
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  drivers/hid/Kconfig        |  2 +
>  drivers/hid/hid-nintendo.c | 95 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 95 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 1f23e84f8bdf3..86a6129d3d89f 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -722,6 +722,8 @@ config HID_MULTITOUCH
>  config HID_NINTENDO
>  =09tristate "Nintendo Joy-Con and Pro Controller support"
>  =09depends on HID
> +=09depends on NEW_LEDS
> +=09depends on LEDS_CLASS
>  =09help
>  =09Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
>  =09All controllers support bluetooth, and the Pro Controller also suppor=
ts
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index b6c0e5e36d8b0..c21682b4a2e62 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -25,6 +25,7 @@
>  #include <linux/device.h>
>  #include <linux/hid.h>
>  #include <linux/input.h>
> +#include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/spinlock.h>
>
> @@ -183,11 +184,13 @@ struct joycon_input_report {
>  } __packed;
>
>  #define JC_MAX_RESP_SIZE=09(sizeof(struct joycon_input_report) + 35)
> +#define JC_NUM_LEDS=09=094

I think it'd be better if you could guarantee that `JC_NUM_LEDS` and
size of the `joycon_player_led_names` won't go out of sync. E.g.
define `JC_NUM_LEDS` in terms of ARRAY_SIZE(), use static_assert(), etc.


>
>  /* Each physical controller is associated with a joycon_ctlr struct */
>  struct joycon_ctlr {
>  =09struct hid_device *hdev;
>  =09struct input_dev *input;
> +=09struct led_classdev leds[JC_NUM_LEDS];
>  =09enum joycon_ctlr_state ctlr_state;
>
>  =09/* The following members are used for synchronous sends/receives */
> @@ -553,11 +556,9 @@ static const unsigned int joycon_dpad_inputs_jc[] =
=3D {
>  =09BTN_DPAD_UP, BTN_DPAD_DOWN, BTN_DPAD_LEFT, BTN_DPAD_RIGHT,
>  };
>
> -static DEFINE_MUTEX(joycon_input_num_mutex);
>  static int joycon_input_create(struct joycon_ctlr *ctlr)
>  {
>  =09struct hid_device *hdev;
> -=09static int input_num =3D 1;
>  =09const char *name;
>  =09int ret;
>  =09int i;
> @@ -643,6 +644,66 @@ static int joycon_input_create(struct joycon_ctlr *c=
tlr)
>  =09if (ret)
>  =09=09return ret;
>
> +=09return 0;
> +}
> +
> +static int joycon_player_led_brightness_set(struct led_classdev *led,
> +=09=09=09=09=09    enum led_brightness brightness)
> +{
> +=09struct device *dev =3D led->dev->parent;
> +=09struct hid_device *hdev =3D to_hid_device(dev);
> +=09struct joycon_ctlr *ctlr;
> +=09int val =3D 0;
> +=09int i;
> +=09int ret;
> +=09int num;
> +
> +=09ctlr =3D hid_get_drvdata(hdev);
> +=09if (!ctlr) {
> +=09=09hid_err(hdev, "No controller data\n");
> +=09=09return -ENODEV;
> +=09}
> +
> +=09/* determine which player led this is */
> +=09for (num =3D 0; num < JC_NUM_LEDS; num++) {
> +=09=09if (&ctlr->leds[num] =3D=3D led)
> +=09=09=09break;
> +=09}
> +=09if (num >=3D JC_NUM_LEDS)
> +=09=09return -EINVAL;
> +
> +=09mutex_lock(&ctlr->output_mutex);
> +=09for (i =3D 0; i < JC_NUM_LEDS; i++) {
> +=09=09if (i =3D=3D num)
> +=09=09=09val |=3D brightness << i;
> +=09=09else
> +=09=09=09val |=3D ctlr->leds[i].brightness << i;
> +=09}
> +=09ret =3D joycon_set_player_leds(ctlr, 0, val);
> +=09mutex_unlock(&ctlr->output_mutex);
> +
> +=09return ret;
> +}
> +
> +static const char * const joycon_player_led_names[] =3D {
> +=09"player1",
> +=09"player2",
> +=09"player3",
> +=09"player4"

Small thing: after non-sentinel values at the end the comma is usually not =
omitted.


> +};
> +
> +static DEFINE_MUTEX(joycon_input_num_mutex);
> +static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
> +{
> +=09struct hid_device *hdev =3D ctlr->hdev;
> +=09struct device *dev =3D &hdev->dev;
> +=09const char *d_name =3D dev_name(dev);
> +=09struct led_classdev *led;
> +=09char *name;
> +=09int ret =3D 0;
> +=09int i;
> +=09static int input_num =3D 1;
> +
>  =09/* Set the default controller player leds based on controller number =
*/
>  =09mutex_lock(&joycon_input_num_mutex);
>  =09mutex_lock(&ctlr->output_mutex);
> @@ -650,6 +711,29 @@ static int joycon_input_create(struct joycon_ctlr *c=
tlr)
>  =09if (ret)
>  =09=09hid_warn(ctlr->hdev, "Failed to set leds; ret=3D%d\n", ret);
>  =09mutex_unlock(&ctlr->output_mutex);
> +
> +=09/* configure the player LEDs */
> +=09for (i =3D 0; i < JC_NUM_LEDS; i++) {
> +=09=09name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name,

This does not seem to be an appropriate name for an LED class device.
See Documentation/leds/leds-class.rst.


> +=09=09=09=09      joycon_player_led_names[i]);
> +=09=09if (!name)
> +=09=09=09return -ENOMEM;
> +
> +=09=09led =3D &ctlr->leds[i];
> +=09=09led->name =3D name;
> +=09=09led->brightness =3D ((i + 1) <=3D input_num) ? LED_ON : LED_OFF;
> +=09=09led->max_brightness =3D LED_ON;

LED_{ON,OFF,...} constants have been deprecated to the best of my knowledge=
,
use integer values as appropriate.


> +=09=09led->brightness_set_blocking =3D
> +=09=09=09=09=09joycon_player_led_brightness_set;
> +=09=09led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
> +
> +=09=09ret =3D devm_led_classdev_register(&hdev->dev, led);
> +=09=09if (ret) {
> +=09=09=09hid_err(hdev, "Failed registering %s LED\n", led->name);
> +=09=09=09break;
> +=09=09}
> +=09}
> +
>  =09if (++input_num > 4)
>  =09=09input_num =3D 1;
>  =09mutex_unlock(&joycon_input_num_mutex);
> @@ -813,6 +897,13 @@ static int nintendo_hid_probe(struct hid_device *hde=
v,
>
>  =09mutex_unlock(&ctlr->output_mutex);
>
> +=09/* Initialize the leds */
> +=09ret =3D joycon_player_leds_create(ctlr);
> +=09if (ret) {
> +=09=09hid_err(hdev, "Failed to create leds; ret=3D%d\n", ret);
> +=09=09goto err_close;
> +=09}
> +
>  =09ret =3D joycon_input_create(ctlr);
>  =09if (ret) {
>  =09=09hid_err(hdev, "Failed to create input device; ret=3D%d\n", ret);
> --
> 2.31.1
>


Regards,
Barnab=C3=A1s P=C5=91cze
