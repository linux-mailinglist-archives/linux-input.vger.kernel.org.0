Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8766C67A5
	for <lists+linux-input@lfdr.de>; Thu, 23 Mar 2023 13:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjCWMG7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 08:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjCWMGl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 08:06:41 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC28B46AD;
        Thu, 23 Mar 2023 05:05:52 -0700 (PDT)
Date:   Thu, 23 Mar 2023 12:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1679573148; x=1679832348;
        bh=E7k73I4MNEuDAsQ0Kvbnyvlsp4CfV6veKmwyBA4aO+s=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=vwC0RRnNmzwaeDlzwBjsscOVx91u2300tDHYgrrP37jmP77GzCnFNRsQN+Ryj8+tU
         tFqaDq6BAYwet3/E5GhQhmcXM3Svw0EFaT01FTHS0Al1ev+A36fYX2ofD3eYuCTBYq
         xlHTKc7IK29fA6S4JUBgbCXdaJ4wr9xhYW2VbnSmVEvlObhtEX/7SWmlMvJ9MTeSPk
         oEEOsAqI5ng7y4BxsdnjzKElQuaaTTCApLKTTNGD+A6niuEGhMLTXQnoLdDDkPjHar
         YrxZQoCGexYB617f3aMIvI/AcvQmXxmorV9Z356BX6J1iHfpNx69FH0v/cTMNq24uc
         Lj/ZGbJy3G/RA==
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v2 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Message-ID: <XgKppKbytAKuIBKEDEChlLJE86hsLgonhU8OFHaBjveK7MV8apS9OGi3cNc6v6UPKee_AkKiPD6peBcTcZ3q45k-TTyMBO4GD52wpLxQS3c=@protonmail.com>
In-Reply-To: <20230323025200.5462-3-kallmeyeras@gmail.com>
References: <20230323025200.5462-1-kallmeyeras@gmail.com> <20230323025200.5462-3-kallmeyeras@gmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2023. m=C3=A1rcius 23., cs=C3=BCt=C3=B6rt=C3=B6k 3:52 keltez=C3=A9ssel, And=
rew Kallmeyer <kallmeyeras@gmail.com> =C3=ADrta:

> From: Gergo Koteles <soyer@irl.hu>
>=20
> This WMI driver for the tablet mode control switch for Lenovo Yoga
> notebooks was originally written by Gergo Koteles. The mode is mapped to
> a SW_TABLET_MODE switch capable input device.
>=20
> Andrew followed the suggestions that were posted in reply to Gergo's RFC
> patch, and on the v1 version of this patch to follow-up and get it
> merged.
>=20
> Changes from Gergo's RFC:
>=20
>  - Refactored obtaining a reference to the EC ACPI device needed for the
>    quirk implementation as suggested by Hans de Goede
>  - Applied small fixes and switched to devm_input_allocate_device() and
>    removing input_unregister_device() as suggested by Barnab=C3=A1s P=
=C5=91cze.
>  - Merged the lenovo_ymc_trigger_ec function with the
>    ideapad_trigger_ymc_next_read function since it was no longer
>    external.
>  - Added the word "Tablet" to the driver description to hopefully make
>    it more clear.
>  - Fixed the LENOVO_YMC_QUERY_METHOD ID and the name string for the EC
>    APCI device trigged for the quirk
>  - Triggered the input event on probe so that the initial tablet mode
>    state when the driver is loaded is reported to userspace as suggested
>    by Armin Wolf.
>=20
> We have tested this on the Yoga 7 14AIL7 for the non-quirk path and on
> the Yoga 7 14ARB7 which has the firmware bug that requires triggering
> the embedded controller to send the mode change events. This workaround
> is also used by the Windows drivers.
>=20
> According to reports at https://github.com/lukas-w/yoga-usage-mode,
> which uses the same WMI devices, the following models should also work:
> Yoga C940, Ideapad flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7, etc.
>=20
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
> Link: https://lore.kernel.org/platform-driver-x86/20230310041726.217447-1=
-kallmeyeras@gmail.com/
> ---
> [...]
> +struct lenovo_ymc_private {
> +=09struct input_dev *input_dev;
> +=09struct acpi_device *ec_acpi_dev;
> +};
> +
> +static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenovo=
_ymc_private *priv)
> +{
> +=09int err;
> +
> +=09if (!ec_trigger || !priv || !priv->ec_acpi_dev)

I think just the `!priv->ec_acpi_dev` check is sufficient.


> +=09=09return;
> +=09err =3D write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
> +=09if (err)
> +=09=09dev_warn(&wdev->dev, "Could not write YMC: %d\n", err);
> +}
> [...]
> +static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +=09struct input_dev *input_dev;
> +=09struct lenovo_ymc_private *priv;
> +=09int err;
> +
> +=09ec_trigger |=3D dmi_check_system(ec_trigger_quirk_dmi_table);
> +
> +=09priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +=09if (!priv)
> +=09=09return -ENOMEM;
> +
> +=09if (ec_trigger) {
> +=09=09pr_debug("Lenovo YMC enable EC triggering.\n");
> +=09=09priv->ec_acpi_dev =3D acpi_dev_get_first_match_dev("VPC2004", NULL=
, -1);

The reference is leaked in case of an error. Use `devm_add_action_or_reset(=
)`:

  static void acpi_dev_put_helper(void *p) { acpi_dev_put(p); }
  [...]
  priv->ec_acpi_dev =3D acpi_dev_get_first_match_dev("VPC2004", NULL, -1);
  if (!priv->ec_acpi_dev)
    ...
  err =3D devm_add_action_or_reset(&wdev->dev, acpi_dev_put_helper, priv->e=
c_acpi_dev)
  if (err)
    ...

And then you can remove `lenovo_ymc_remove()` altogether.


> +=09=09if (!priv->ec_acpi_dev) {
> +=09=09=09dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
> +=09=09=09return -ENODEV;
> +=09=09}
> +=09}
> +
> +=09input_dev =3D devm_input_allocate_device(&wdev->dev);
> +=09if (!input_dev)
> +=09=09return -ENOMEM;
> +
> +=09input_dev->name =3D "Lenovo Yoga Tablet Mode Control switch";
> +=09input_dev->phys =3D LENOVO_YMC_EVENT_GUID "/input0";
> +=09input_dev->id.bustype =3D BUS_HOST;
> +=09input_dev->dev.parent =3D &wdev->dev;
> +
> +=09input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);

As far as I can tell `sparse_keymap_setup()` already sets the above.


> +
> +=09err =3D sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> +=09if (err) {
> +=09=09dev_err(&wdev->dev,
> +=09=09=09"Could not set up input device keymap: %d\n", err);
> +=09=09return err;
> +=09}
> +
> +=09err =3D input_register_device(input_dev);
> +=09if (err) {
> +=09=09dev_err(&wdev->dev,
> +=09=09=09"Could not register input device: %d\n", err);
> +=09=09return err;
> +=09}
> +
> +=09priv->input_dev =3D input_dev;
> +=09dev_set_drvdata(&wdev->dev, priv);
> +
> +=09// Report the state for the first time on probe
> +=09lenovo_ymc_trigger_ec(wdev, priv);
> +=09lenovo_ymc_notify(wdev, NULL);
> +=09return 0;
> +}
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
