Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5606D26F7
	for <lists+linux-input@lfdr.de>; Fri, 31 Mar 2023 19:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbjCaRs7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Mar 2023 13:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjCaRsx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Mar 2023 13:48:53 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C4FA5F8;
        Fri, 31 Mar 2023 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1680284895; i=w_armin@gmx.de;
        bh=woI48I8o4xKoN1w0ykh4kPC4w3kcomO8tMZmCkuoybY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Wz05eyZrvfr+HVn7xrXOl+GVQ1hm8qbu0Y9JAz+6WtjEPzELrsTt/llMxdVMD3mvC
         mTQBw3dmEJ5oudB5SbDwoYX+LvQWXF9jdYrrHaKej/ffHxu2aT2c1gqQe+fwgYqB4A
         4TWI8rZX6IEN5rM7+w4PnLQs8woGH1r4/sMu5fWxuc3SeqRq6RwnXgQxDeXjahtDbO
         XXpb/VTeCeWgEoj11o1m0RuSbPJwsRIHvMoh5r03cER4BV1ImGfLh46xbbTlcL8zZg
         q2S+xe4niog/NyOhW6/BDZ67hrfVBMNIaebIAaWODnoMDCWZlw1/7gw+9zi4yVI/Ij
         umJlPnXZA1Ucw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1qQGZr3ts9-0107ql; Fri, 31
 Mar 2023 19:48:15 +0200
Subject: Re: [PATCH v3 0/2] platform/x86: Add driver for Yoga Tablet mode
 switch
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
        linux-input@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <20230329014559.44494-1-kallmeyeras@gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <8f021a40-5e16-10b9-2ad9-0800a761a202@gmx.de>
Date:   Fri, 31 Mar 2023 19:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20230329014559.44494-1-kallmeyeras@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:MUNTATM8bzgn0PYqNsQEn48ib+G0rHbVof5JaE8UyTZF5r+Obfo
 Tuiv21H3MmetgOl1PWgz+y/rJrqygjxw/fWhTJNQypsh88Au6o8xME+bNBPOP2b8ZxgBf6N
 mEuYGumc38iPVYvetbrvp5rnSm3f0RZOfS0EVEtC9R/afjSXLWUHZM20Oq5825x5tYXUa41
 1RAKlMet5fKZXe0B7356A==
UI-OutboundReport: notjunk:1;M01:P0:Nk3jPtiSLcQ=;WEHrWx7LCVt+Z2rnRzQOxbupNf7
 Ttfz3zvUI2mdQI7knwej6IBMeF57MNUWNe1WLgt4rE3QKOy01YE01eSULcuYYDAL4ZtutVqlU
 S/iqg2YmxFdvkTAerZkTrN4QyNWr/YMoDZfU4Bp3dE3Sbp7ASO8GrjW7zyxeoCIGXuP7jE+qZ
 IDo7eSouWwoPpmYO0cyajVMbH1SpSc9I+y6EZKUpDkHbrI6nNKISkh+Q4q5KD7Ng4/PSOxZ1F
 lG5i4Swp4FfmBeTEHHpw/QCRIDBc7kBGS9Y4yv+X2kcV8OKiG+9rgPmDGj4NykBho4nhDNk1Q
 RZaublaYLKUaRgEVhT8KXR0y5RydH9iebBrm6Il6mHbi/WhfRZR51XJUwJ2xtjjG3B+FCLYH6
 Rukf5ZrJvNLGB/1ap0ldnlxm/IUpGeIrVBdB2LqlwPdpSFfUXtz+cWfKah/F9n7x4elhiDB8T
 4axvP6KLDLThGn+t8wUvBRbKNmPt84Zqwi3UKiU4A82Vf0WwdQTigATroa+fDTHS144cLV1V5
 DP4MB9iuzIx0xLyX6WBmrdQKStRN2Yid2zo6NXkYlMr2RNuJOuhX5GD2x/HQ8j9JcmyGvKKcY
 cSMbKMsvfpZyP4LESSANRSWJH6VkEcbMPtZYrxCzsERacR/+ISS9ZFkyThJR0/lNlSSYLxeSf
 JccxM9kbRIyioxzwrTozqdnO2Ped1mzq2OmcGlRNGjSqZn8Lcnj3+r5XSaoWfUXjlUXuJAy5A
 fy2QBTJqwW4sMCqiAEJ2cIwG75f0NvHJpxGUawh4R5lwXFhXLHnVeMZ94/MZb2obqMVTuIKpD
 CUXySm/UDazb+hsjjHuQ7IF+Z0wYj2lZOKhaDRpxnrxqrzJ72GJfJ2IPPzQDLugFfgZYZB4+I
 rpLYTi/npmWMO4zLnbYbWzBP8FBWRt7qIJEjVsQY8MxUTSoEo57IutHqwj2ZbLHfX/0fejqA4
 dXRZdXHx/eD9YJz06jmjwKQp4oA=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 29.03.23 um 03:45 schrieb Andrew Kallmeyer:

> This driver maps the Lenovo Yoga tablet mode switch to a SW_TABLET_MODE =
input
> device. This will make the tablet status available to desktop environmen=
ts.
>
> This patch series is the result of the discussion at
> https://lore.kernel.org/r/CAG4kvq9US=3D-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgC=
DjdAkbg@mail.gmail.com/
>
> I decided to follow-up on the patch Gergo wrote and respond to the revie=
w
> comments to get it merged and available for everyone.
>
> Gergo and I have tested this on the Yoga 7 14ARB7, and the Yoga 7 14AIL7
> respectively. Additionally, according to reports at
> https://github.com/lukas-w/yoga-usage-mode, which uses the same WMI devi=
ces,
> this driver should work with:
> Yoga C940, Ideapad flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7, etc.
>
> v1: https://lore.kernel.org/r/20230310041726.217447-1-kallmeyeras@gmail.=
com/
> v2: https://lore.kernel.org/r/20230323025200.5462-1-kallmeyeras@gmail.co=
m/
> The diff since v2 is as follows:
>
> --- a/drivers/platform/x86/lenovo-ymc.c
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -21,8 +21,8 @@
>   #define LENOVO_YMC_QUERY_METHOD 0x01
>
>   static bool ec_trigger __read_mostly;
> -module_param(ec_trigger, bool, 0644);
> -MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events")=
;
> +module_param(ec_trigger, bool, 0444);
> +MODULE_PARM_DESC(ec_trigger, "Enable EC triggering work-around to force=
 emitting tablet mode events");
>
>   static const struct dmi_system_id ec_trigger_quirk_dmi_table[] =3D {
>   	{
> @@ -43,8 +43,7 @@ struct lenovo_ymc_private {
>   static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct leno=
vo_ymc_private *priv)
>   {
>   	int err;
> -
> -	if (!ec_trigger || !priv || !priv->ec_acpi_dev)
> +	if (!priv->ec_acpi_dev)
>   		return;
>   	err =3D write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
>   	if (err)
> @@ -103,11 +102,7 @@ static void lenovo_ymc_notify(struct wmi_device *wd=
ev, union acpi_object *data)
>   	lenovo_ymc_trigger_ec(wdev, priv);
>   }
>
> -static void lenovo_ymc_remove(struct wmi_device *wdev)
> -{
> -	struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
> -	acpi_dev_put(priv->ec_acpi_dev);
> -}
> +static void acpi_dev_put_helper(void *p) { acpi_dev_put(p); }
>
>   static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
>   {
> @@ -124,10 +119,18 @@ static int lenovo_ymc_probe(struct wmi_device *wde=
v, const void *ctx)
>   	if (ec_trigger) {
>   		pr_debug("Lenovo YMC enable EC triggering.\n");
>   		priv->ec_acpi_dev =3D acpi_dev_get_first_match_dev("VPC2004", NULL, =
-1);
> +
>   		if (!priv->ec_acpi_dev) {
>   			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
>   			return -ENODEV;
>   		}
> +		err =3D devm_add_action_or_reset(&wdev->dev,
> +				acpi_dev_put_helper, priv->ec_acpi_dev);
> +		if (err) {
> +			dev_err(&wdev->dev,
> +				"Could not clean up EC ACPI device: %d\n", err);
> +			return err;
> +		}
>   	}
>
>   	input_dev =3D devm_input_allocate_device(&wdev->dev);
> @@ -138,9 +141,6 @@ static int lenovo_ymc_probe(struct wmi_device *wdev,=
 const void *ctx)
>   	input_dev->phys =3D LENOVO_YMC_EVENT_GUID "/input0";
>   	input_dev->id.bustype =3D BUS_HOST;
>   	input_dev->dev.parent =3D &wdev->dev;
> -
> -	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> -
>   	err =3D sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
>   	if (err) {
>   		dev_err(&wdev->dev,
> @@ -177,7 +177,6 @@ static struct wmi_driver lenovo_ymc_driver =3D {
>   	.id_table =3D lenovo_ymc_wmi_id_table,
>   	.probe =3D lenovo_ymc_probe,
>   	.notify =3D lenovo_ymc_notify,
> -	.remove =3D lenovo_ymc_remove,
>   };
>
>   module_wmi_driver(lenovo_ymc_driver);
>
> Andrew Kallmeyer (1):
>    platform/x86: Move ideapad ACPI helpers to a new header
>
> Gergo Koteles (1):
>    platform/x86: Add driver for Yoga Tablet Mode switch
>
>   drivers/platform/x86/Kconfig          |  10 ++
>   drivers/platform/x86/Makefile         |   1 +
>   drivers/platform/x86/ideapad-laptop.c | 135 +------------------
>   drivers/platform/x86/ideapad-laptop.h | 152 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-ymc.c     | 185 ++++++++++++++++++++++++++
>   5 files changed, 349 insertions(+), 134 deletions(-)
>   create mode 100644 drivers/platform/x86/ideapad-laptop.h
>   create mode 100644 drivers/platform/x86/lenovo-ymc.c
>
Hi,

while compile-testing your patch series, i noticed that there are a couple=
 of checkpatch warnings.
For lenovo-ymc.c:

WARNING: Missing a blank line after declarations
#46: FILE: drivers/platform/x86/lenovo-ymc.c:46:
+	int err;
+	if (!priv->ec_acpi_dev)

CHECK: Alignment should match open parenthesis
#77: FILE: drivers/platform/x86/lenovo-ymc.c:77:
+	status =3D wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
+				LENOVO_YMC_QUERY_INSTANCE,

CHECK: Alignment should match open parenthesis
#83: FILE: drivers/platform/x86/lenovo-ymc.c:83:
+		dev_warn(&wdev->dev,
+			"Failed to evaluate query method: %s\n",

CHECK: Alignment should match open parenthesis
#92: FILE: drivers/platform/x86/lenovo-ymc.c:92:
+		dev_warn(&wdev->dev,
+			"WMI event data is not an integer\n");

CHECK: Alignment should match open parenthesis
#128: FILE: drivers/platform/x86/lenovo-ymc.c:128:
+		err =3D devm_add_action_or_reset(&wdev->dev,
+				acpi_dev_put_helper, priv->ec_acpi_dev);

For ideapad-laptop.h:

WARNING: Improper SPDX comment style for 'drivers/platform/x86/ideapad-lap=
top.h', please use '/*' instead
#1: FILE: drivers/platform/x86/ideapad-laptop.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#1: FILE: drivers/platform/x86/ideapad-laptop.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

CHECK: line length of 112 exceeds 100 columns
#44: FILE: drivers/platform/x86/ideapad-laptop.h:44:
+static inline int eval_int_with_arg(acpi_handle handle, const char *name,=
 unsigned long arg, unsigned long *res)

All these checkpatch warnings are minor style issues (except the malformed=
 SPDX tag in ideapad-laptop.h),
but it would be nice if those would get fixed too.

Armin Wolf

