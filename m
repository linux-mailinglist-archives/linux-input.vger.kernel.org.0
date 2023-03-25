Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 826836C8C1B
	for <lists+linux-input@lfdr.de>; Sat, 25 Mar 2023 08:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbjCYHLW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Mar 2023 03:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjCYHLV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Mar 2023 03:11:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F73512043;
        Sat, 25 Mar 2023 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1679728241; i=w_armin@gmx.de;
        bh=v5gXOEbDuKkUgOpSUYcyD8yPPk6X81HY8BmMaFPyT4k=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ZdigdYSadT5Xgw1MUVi7EQn6/GsdlwV8K3qwcVZ+cx50jVjZvn1qNYmlmnne35V15
         sySM+4amTB2u3EiGX2d2fS7QslA5qcCKulcAUfcA6Ls7PwqeUjdL+d+YzMQAvZ9Ufj
         w02+chRBBuKXETt6Al7j1bnbfkWwGxtIrfy0vnDFiVGdBmQmow+bvQ5sWNmNTPiBjw
         pIU3AzGZO1ZwMOJ9ppcj3uCOGHHsghT2W0Bv3hKUjz5igBGE6Jh4y0+z7wK+SfbfsK
         G0ALsHULzeUFMZ5Wb1UGTolLVbL4zTv2N6RNi0FqMLYhVac94zRo6CznjiPLqiLNjF
         vN8s2vWXzWDMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dsV-1qaHgK2CaT-015ZMf; Sat, 25
 Mar 2023 08:10:41 +0100
Subject: Re: [PATCH v2 2/2] platform/x86: Add driver for Yoga Tablet Mode
 switch
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
        linux-input@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <20230323025200.5462-1-kallmeyeras@gmail.com>
 <20230323025200.5462-3-kallmeyeras@gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <7584e398-202a-dcee-ef5d-47a3989b06ab@gmx.de>
Date:   Sat, 25 Mar 2023 08:10:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20230323025200.5462-3-kallmeyeras@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:2uzbZ++2ANAp9s5vvOK0/PgEis6Io+0XoErP+5uJCNV9xRLShYa
 Px64p9sa1t9+uCF/pxVfc770cUsmfkSqrKkH0aNnRxwAJWnILKxuOSk8AUYgNMAuIJzR1TD
 QYYFgnG33Ws/NSc5dheD2jrT01nL9HN0LQ0lAW7SRQJUbG8B0X7/b1bfnbIRnc+QYXOvusN
 Rw1Y1tZn0vhpRQmus8xXA==
UI-OutboundReport: notjunk:1;M01:P0:aoeLQgTXWnI=;nJC+vCoisQuRuwjYc/ydsDfHcB0
 SA2eS3RZShtgNYEBbl2VGm4Vm4vdaSvdyR/WKeC9xj751PF0qFvx/EtUnJT/0wlYXDUp6unLu
 ymJcFLiV51Z7hPr44+7VkaDdydJm5qptcV2VUgcyx9iVhryXTFbaXOpjXprEESrbxVqjzx4Lg
 wv7pTdL2lf435vTZaPiDrlUrpKychkhonh2L+E2rCTNkR4NoOlOdWJelfkUkkgg/8F1ySdBva
 U1MFxrDeuN3aceYbCzdUdn9MQJP0Kj4Cr4NeQmQIam+fRSPY3PMe3PGmm0/YEWT/uQOWnWdpL
 vxgV3HXbealrannTubIXQBR/dpwqx986oXkel+35H/B4N5nnWSJET91mIVuOeOrCWJF48+EAc
 QAPD+zJAXK/Z/LL5mLbiY/DSJW7YjEGxKAbKs7sakZPnCPu93fhssgJuWyJEr6UWaHTJgzkn4
 sx9JsYX+MqOuwKW1C9oOhTAB+9VPxMMEN+AOuVaYBAmkYQiZzusEqh9SIMArnHLeERKngxOFa
 ZZn17QVe2u9sbkak0cWbT3o+aJI6r+RKPPh6PqaDUX/PJxZmqqHgXEJuoaLmET+WNxebN2DYy
 wP/TqVYdDL2AD840jX9LlDO3BQFxnPEyCmoCZbe7B9xZrPUiKr6n9UAdF/02WIt8BL5GTlN52
 3/q/ue38D5ghlSAfbJqNKdE/oWvZOaXurJYASvJloGzc1zqvi8L30NblV78jrIsubQK9AzEkV
 20lELV/H3K5UZTHeCtde9IzCPYQc/jU82wgrQWmftgOiIicHv2J4Ezr1zPcs5wNjjNS1JF3I8
 KO5AnlHax0g6NlrkZlQN6ZuVNmLIsAvhq1G2NjwSzD/sm1QDcdGNZcM5HdP9nAORI8nXqnt+T
 GP4NH/4oai/dnorEYnUFVAO+mcblgr0DerF94rcAYB75lNGto/NdZzqmjkugw1lpgbM3i/kk2
 SLrmkFwEb4FUGIBmo/Ic/Ka5+3E=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 23.03.23 um 03:52 schrieb Andrew Kallmeyer:

> From: Gergo Koteles <soyer@irl.hu>
>
> This WMI driver for the tablet mode control switch for Lenovo Yoga
> notebooks was originally written by Gergo Koteles. The mode is mapped to
> a SW_TABLET_MODE switch capable input device.
>
> Andrew followed the suggestions that were posted in reply to Gergo's RFC
> patch, and on the v1 version of this patch to follow-up and get it
> merged.
>
> Changes from Gergo's RFC:
>
>   - Refactored obtaining a reference to the EC ACPI device needed for th=
e
>     quirk implementation as suggested by Hans de Goede
>   - Applied small fixes and switched to devm_input_allocate_device() and
>     removing input_unregister_device() as suggested by Barnab=C3=A1s P=
=C5=91cze.
>   - Merged the lenovo_ymc_trigger_ec function with the
>     ideapad_trigger_ymc_next_read function since it was no longer
>     external.
>   - Added the word "Tablet" to the driver description to hopefully make
>     it more clear.
>   - Fixed the LENOVO_YMC_QUERY_METHOD ID and the name string for the EC
>     APCI device trigged for the quirk
>   - Triggered the input event on probe so that the initial tablet mode
>     state when the driver is loaded is reported to userspace as suggeste=
d
>     by Armin Wolf.
>
> We have tested this on the Yoga 7 14AIL7 for the non-quirk path and on
> the Yoga 7 14ARB7 which has the firmware bug that requires triggering
> the embedded controller to send the mode change events. This workaround
> is also used by the Windows drivers.
>
> According to reports at https://github.com/lukas-w/yoga-usage-mode,
> which uses the same WMI devices, the following models should also work:
> Yoga C940, Ideapad flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7, etc.
>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
> Link: https://lore.kernel.org/platform-driver-x86/20230310041726.217447-=
1-kallmeyeras@gmail.com/
> ---
>   drivers/platform/x86/Kconfig          |  10 ++
>   drivers/platform/x86/Makefile         |   1 +
>   drivers/platform/x86/ideapad-laptop.h |   1 +
>   drivers/platform/x86/lenovo-ymc.c     | 187 ++++++++++++++++++++++++++
>   4 files changed, 199 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-ymc.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 5692385e2..858be0c65 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -470,6 +470,16 @@ config IDEAPAD_LAPTOP
>   	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>   	  rfkill switch, hotkey, fan control and backlight control.
>
> +config LENOVO_YMC
> +	tristate "Lenovo Yoga Tablet Mode Control"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	depends on IDEAPAD_LAPTOP
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE in=
put
> +	  events for Lenovo Yoga notebooks.
> +
>   config SENSORS_HDAPS
>   	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
>   	depends on INPUT
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 1d3d1b025..10054cdea 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
>   # IBM Thinkpad and Lenovo
>   obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl.o
>   obj-$(CONFIG_IDEAPAD_LAPTOP)	+=3D ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_YMC)	+=3D lenovo-ymc.o
>   obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps.o
>   obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
>   obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
> diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x8=
6/ideapad-laptop.h
> index 7dd8ce027..2564cb1cd 100644
> --- a/drivers/platform/x86/ideapad-laptop.h
> +++ b/drivers/platform/x86/ideapad-laptop.h
> @@ -35,6 +35,7 @@ enum {
>   	VPCCMD_W_FAN,
>   	VPCCMD_R_RF,
>   	VPCCMD_W_RF,
> +	VPCCMD_W_YMC =3D 0x2A,
>   	VPCCMD_R_FAN =3D 0x2B,
>   	VPCCMD_R_SPECIAL_BUTTONS =3D 0x31,
>   	VPCCMD_W_BL_POWER =3D 0x33,
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/le=
novo-ymc.c
> new file mode 100644
> index 000000000..c64f7ec85
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * lenovo-ymc.c - Lenovo Yoga Mode Control driver
> + *
> + * Copyright =C2=A9 2022 Gergo Koteles <soyer@irl.hu>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/wmi.h>
> +#include "ideapad-laptop.h"
> +
> +#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
> +#define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
> +
> +#define LENOVO_YMC_QUERY_INSTANCE 0
> +#define LENOVO_YMC_QUERY_METHOD 0x01
> +
> +static bool ec_trigger __read_mostly;
> +module_param(ec_trigger, bool, 0644);
> +MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events")=
;

Hi,

is it really necessary to allow userspace to read/write ec_trigger? The AC=
PI device
used for triggering the EC is only initialized during probing, so changing=
 the value
of ec_trigger will make no difference in such cases.

Maybe you could change module_param(ec_trigger, bool, 0644) to module_para=
m(ec_trigger, bool, 0)?

Armin Wolf

> +
> +static const struct dmi_system_id ec_trigger_quirk_dmi_table[] =3D {
> +	{
> +		// Lenovo Yoga 7 14ARB7
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
> +		},
> +	},
> +	{ },
> +};
> +
> +struct lenovo_ymc_private {
> +	struct input_dev *input_dev;
> +	struct acpi_device *ec_acpi_dev;
> +};
> +
> +static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenov=
o_ymc_private *priv)
> +{
> +	int err;
> +
> +	if (!ec_trigger || !priv || !priv->ec_acpi_dev)
> +		return;
> +	err =3D write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
> +	if (err)
> +		dev_warn(&wdev->dev, "Could not write YMC: %d\n", err);
> +}
> +
> +static const struct key_entry lenovo_ymc_keymap[] =3D {
> +	// Laptop
> +	{ KE_SW, 0x01, { .sw =3D { SW_TABLET_MODE, 0 } } },
> +	// Tablet
> +	{ KE_SW, 0x02, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +	// Drawing Board
> +	{ KE_SW, 0x03, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +	// Tent
> +	{ KE_SW, 0x04, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +	{ KE_END },
> +};
> +
> +static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_objec=
t *data)
> +{
> +	struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	u32 input_val =3D 0;
> +	struct acpi_buffer input =3D {sizeof(input_val), &input_val};
> +	struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +	acpi_status status;
> +	union acpi_object *obj;
> +	int code;
> +
> +	status =3D wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
> +				LENOVO_YMC_QUERY_INSTANCE,
> +				LENOVO_YMC_QUERY_METHOD,
> +				&input, &output);
> +
> +	if (ACPI_FAILURE(status)) {
> +		dev_warn(&wdev->dev,
> +			"Failed to evaluate query method: %s\n",
> +			acpi_format_exception(status));
> +		return;
> +	}
> +
> +	obj =3D output.pointer;
> +
> +	if (obj->type !=3D ACPI_TYPE_INTEGER) {
> +		dev_warn(&wdev->dev,
> +			"WMI event data is not an integer\n");
> +		goto free_obj;
> +	}
> +	code =3D obj->integer.value;
> +
> +	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
> +		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
> +
> +free_obj:
> +	kfree(obj);
> +	lenovo_ymc_trigger_ec(wdev, priv);
> +}
> +
> +static void lenovo_ymc_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
> +	acpi_dev_put(priv->ec_acpi_dev);
> +}
> +
> +static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct input_dev *input_dev;
> +	struct lenovo_ymc_private *priv;
> +	int err;
> +
> +	ec_trigger |=3D dmi_check_system(ec_trigger_quirk_dmi_table);
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (ec_trigger) {
> +		pr_debug("Lenovo YMC enable EC triggering.\n");
> +		priv->ec_acpi_dev =3D acpi_dev_get_first_match_dev("VPC2004", NULL, -=
1);
> +		if (!priv->ec_acpi_dev) {
> +			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	input_dev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name =3D "Lenovo Yoga Tablet Mode Control switch";
> +	input_dev->phys =3D LENOVO_YMC_EVENT_GUID "/input0";
> +	input_dev->id.bustype =3D BUS_HOST;
> +	input_dev->dev.parent =3D &wdev->dev;
> +
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	err =3D sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not set up input device keymap: %d\n", err);
> +		return err;
> +	}
> +
> +	err =3D input_register_device(input_dev);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not register input device: %d\n", err);
> +		return err;
> +	}
> +
> +	priv->input_dev =3D input_dev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	// Report the state for the first time on probe
> +	lenovo_ymc_trigger_ec(wdev, priv);
> +	lenovo_ymc_notify(wdev, NULL);
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lenovo_ymc_wmi_id_table[] =3D {
> +	{ .guid_string =3D LENOVO_YMC_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
> +
> +static struct wmi_driver lenovo_ymc_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-ymc",
> +	},
> +	.id_table =3D lenovo_ymc_wmi_id_table,
> +	.probe =3D lenovo_ymc_probe,
> +	.notify =3D lenovo_ymc_notify,
> +	.remove =3D lenovo_ymc_remove,
> +};
> +
> +module_wmi_driver(lenovo_ymc_driver);
> +
> +MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
> +MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
> +MODULE_LICENSE("GPL");
