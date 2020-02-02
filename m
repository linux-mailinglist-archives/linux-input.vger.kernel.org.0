Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A022D14FDCA
	for <lists+linux-input@lfdr.de>; Sun,  2 Feb 2020 16:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgBBP1t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Feb 2020 10:27:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:47586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbgBBP1t (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 2 Feb 2020 10:27:49 -0500
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5891B20643;
        Sun,  2 Feb 2020 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580657267;
        bh=gaaTmLtvZRiCwI1SmffAb5TcB4N+uWs6z1TnutQFA68=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dQDtd7rLDh1Y6TpatVHq41gs1UxuXYD4r3Yeb74cxNGyGbw4/D1XOTgcWBNTml9EG
         zO6KmqobQgh7NtCp4KwYfG04dhZ/klEpCHMxOSgUuZPNQad3gJ6tRuvPinOUpxp5o1
         FXs1QDwDjudWXLGX8NiD7awQbe2UOM8aOQQj4CbE=
Date:   Sun, 2 Feb 2020 15:27:42 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-input@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Minkyu Kang <mk7.kang@samsung.com>,
        =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Oskar Andero <oskar.andero@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/2 v6] iio: light: Add a driver for Sharp GP2AP002x00F
Message-ID: <20200202152742.073a4df6@archlinux>
In-Reply-To: <20200126150548.9168-2-linus.walleij@linaro.org>
References: <20200126150548.9168-1-linus.walleij@linaro.org>
        <20200126150548.9168-2-linus.walleij@linaro.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 26 Jan 2020 16:05:48 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> This driver handles two different Sharp sensors that have been
> proposed for merging to the mainline kernel over the years, and
> already has a limited proximity-only driver in the input
> subsystem.
>=20
> These components are completely different from the confusingly
> similarly named Sharp GP2AP020A00F, for which we have a driver
> in drivers/iio/light/gp2ap020a00f.c
>=20
> The two components GP2AP002A00F and GP2AP002S00F are
> distinctively different but similar: they share the same set of
> registers but differ slightly in the I2C protocol.
>=20
> Instead of the approach by the previous input driver, we create
> a combined IIO proximity and light sensor driver.
>=20
> The plan is to merge this driver and delete the input driver.
>=20
> The pieces for the driver are picked all over the place after
> researching and grepping through a few different vendor trees
> and driver submissions.
>=20
> We merge it under the light sensors because:
>=20
> - It has similarities with the Capella CM3605 light sensor and
>   proximity driver which is there.
>=20
> - It is related to the GP2AP020A00F driver which is also there.
>=20
> This driver was tested with the Samsung GT-S7710 mobile phone
> which has the GP2AP002S00F proximity sensor mounted.
>=20
> The suspend/resume cycle will disable the interrupt from the
> sensor. If someone would desire to use this interrupt for
> wakeup, the driver will need modifications.
>=20
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Minkyu Kang <mk7.kang@samsung.com>
> Cc: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Cc: Jonathan Bakker <xc-racer2@live.ca>
> Cc: Oskar Andero <oskar.andero@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Tested-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Hmm. There are a few minor things inline, but in the interests of
saving everyone time I'll just fix them up.

For the missing docs one I'll make something up based on what I think
they are.  Please check!

Also it doesn't actually build..=20

drivers/iio/light/gp2ap002.c:760:26: error: =E2=80=98gp2ap002_id=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98gp2ap002_info=E2=
=80=99?
  760 | MODULE_DEVICE_TABLE(i2c, gp2ap002_id);
      |                          ^~~~~~~~~~~
./include/linux/module.h:230:15: note: in definition of macro =E2=80=98MODU=
LE_DEVICE_TABLE=E2=80=99
  230 | extern typeof(name) __mod_##type##__##name##_device_table  \
      |               ^~~~
./include/linux/module.h:230:21: error: =E2=80=98__mod_i2c__gp2ap002_id_dev=
ice_table=E2=80=99 aliased to undefined symbol =E2=80=98gp2ap002_id=E2=80=99
  230 | extern typeof(name) __mod_##type##__##name##_device_table  \
      |                     ^~~~~~
drivers/iio/light/gp2ap002.c:760:1: note: in expansion of macro =E2=80=98MO=
DULE_DEVICE_TABLE=E2=80=99
  760 | MODULE_DEVICE_TABLE(i2c, gp2ap002_id);
      | ^~~~~~~~~~~~~~~~~~~

I'll fix that as well..
> ---
> ChangeLog v5->v6:
> - It turns out that the two chip variants can use the
>   same regmap read/write functions, so simplify this and
>   use just one regmap variant.
> - Some platforms will get interrupt storms/lockups during
>   runtime suspend/resume, so disable the IRQ during suspend,
>   re-enable it on resume.
> - Collected Jonathan Bakker's Tested-by.
> ChangeLog v4->v5:
> - Implement runtime PM according to the pattern in
>   other drivers such as gyro/mpu3050-core.c, letting
>   runtime PM also handle system PM (suspend/resume).
> - Implement the missing .read_event_config() and
>   .write_event_config() callbacks.
> - When state 1 is passed to .write_event_config()
>   grab runtime PM to power on the sensor and activate
>   it, conversely drop runtime PM when state 0 is
>   passed.
> ChangeLog v3->v4:
> - Realized I had to fix also the last two users of
>   of_property_read_u32(). Replaced with
>   device_property_read_u8(). Dropped unsigned byte check
>   because it can't be anything else.
> - Change warnings about properties to "failed to obtain.."
> - Return the actual error code instead of -EINVAL
> - Move interpolation message to dev_dbg()
> - Return with error if we fail to enable regulators on
>   the resume path.
> ChangeLog v2->v3:
> - Use the device property accessors to read the compatible
>   string and drop the dependency on <linux/of.h> making the
>   driver reusable with ACPI.
> - Add a paragraph with comments on the hysteresis values.
> ChangeLog v1->v2:
> - Drop ifdef CONFIG_OF and of_match_ptr() to encourage
>   reuse with other OF-compliant hardware descriptions such
>   as ACPI PRP001
> - Convert success print to dev_dbg()
> - Drop leftover debug read of VDD voltage
> - Create two different regmap buses for the two component variants
>   and select the one we want depending on detected component
> - Use if (ret) on all regmap accesses
> - Fix up error handling in interrupt routine for proximity
> - Provide some rationale for the 20-30 ms delay in the irq handler
> - Use GENMASK() where applicable
> - Prefix all defines with GP2AP002_*
> - Drop buffer infrastructure from Kconfig
> - Staticize gp2ap002_illuminance_table
> ---
>  MAINTAINERS                  |   8 +
>  drivers/iio/light/Kconfig    |  11 +
>  drivers/iio/light/Makefile   |   1 +
>  drivers/iio/light/gp2ap002.c | 783 +++++++++++++++++++++++++++++++++++
>  4 files changed, 803 insertions(+)
>  create mode 100644 drivers/iio/light/gp2ap002.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1372b4139ebd..dbd4236fc7f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14893,6 +14893,14 @@ W:	http://www.ibm.com/developerworks/linux/linux=
390/
>  S:	Supported
>  F:	net/smc/
> =20
> +SHARP GP2AP002A00F/GP2AP002S00F SENSOR DRIVER
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +L:	linux-iio@vger.kernel.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
> +S:	Maintained
> +F:	drivers/iio/light/gp2ap002.c
> +F:	Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> +
>  SHARP RJ54N1CB0C SENSOR DRIVER
>  M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
> index 9968f982fbc7..307412c79c53 100644
> --- a/drivers/iio/light/Kconfig
> +++ b/drivers/iio/light/Kconfig
> @@ -159,6 +159,17 @@ config IIO_CROS_EC_LIGHT_PROX
>  	  To compile this driver as a module, choose M here:
>  	  the module will be called cros_ec_light_prox.
> =20
> +config GP2AP002
> +	tristate "Sharp GP2AP002 Proximity/ALS sensor"
> +	depends on I2C
> +	select REGMAP
> +	help
> +	  Say Y here if you have a Sharp GP2AP002 proximity/ALS combo-chip
> +	  hooked to an I2C bus.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called gp2ap002.
> +
>  config GP2AP020A00F
>  	tristate "Sharp GP2AP020A00F Proximity/ALS sensor"
>  	depends on I2C
> diff --git a/drivers/iio/light/Makefile b/drivers/iio/light/Makefile
> index c98d1cefb861..264a76039006 100644
> --- a/drivers/iio/light/Makefile
> +++ b/drivers/iio/light/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_CM3323)		+=3D cm3323.o
>  obj-$(CONFIG_CM3605)		+=3D cm3605.o
>  obj-$(CONFIG_CM36651)		+=3D cm36651.o
>  obj-$(CONFIG_IIO_CROS_EC_LIGHT_PROX) +=3D cros_ec_light_prox.o
> +obj-$(CONFIG_GP2AP002)		+=3D gp2ap002.o
>  obj-$(CONFIG_GP2AP020A00F)	+=3D gp2ap020a00f.o
>  obj-$(CONFIG_HID_SENSOR_ALS)	+=3D hid-sensor-als.o
>  obj-$(CONFIG_HID_SENSOR_PROX)	+=3D hid-sensor-prox.o
> diff --git a/drivers/iio/light/gp2ap002.c b/drivers/iio/light/gp2ap002.c
> new file mode 100644
> index 000000000000..f747a42882e0
> --- /dev/null
> +++ b/drivers/iio/light/gp2ap002.c
> @@ -0,0 +1,783 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * These are the two Sharp GP2AP002 variants supported by this driver:
> + * GP2AP002A00F Ambient Light and Proximity Sensor
> + * GP2AP002S00F Proximity Sensor
> + *
> + * Copyright (C) 2020 Linaro Ltd.
> + * Author: Linus Walleij <linus.walleij@linaro.org>
> + *
> + * Based partly on the code in Sony Ericssons GP2AP00200F driver by
> + * Courtney Cavin and Oskar Andero in drivers/input/misc/gp2ap002a00f.c
> + * Based partly on a Samsung misc driver submitted by
> + * Donggeun Kim & Minkyu Kang in 2011:
> + * https://lore.kernel.org/lkml/1315556546-7445-1-git-send-email-dg77.ki=
m@samsung.com/
> + * Based partly on a submission by
> + * Jonathan Bakker and Pawe=C5=82 Chmiel in january 2019:
> + * https://lore.kernel.org/linux-input/20190125175045.22576-1-pawel.miko=
laj.chmiel@gmail.com/
> + * Based partly on code from the Samsung GT-S7710 by <mjchen@sta.samsung=
.com>
> + * Based partly on the code in LG Electronics GP2AP00200F driver by
> + * Kenobi Lee <sungyoung.lee@lge.com> and EunYoung Cho <ey.cho@lge.com>
> + */
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
> +#include <linux/iio/events.h>
> +#include <linux/iio/consumer.h> /* To get our ADC channel */
> +#include <linux/iio/types.h> /* To deal with our ADC channel */
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/interrupt.h>
> +#include <linux/bits.h>
> +#include <linux/math64.h>
> +#include <linux/pm.h>
> +
> +#define GP2AP002_PROX_CHANNEL 0
> +#define GP2AP002_ALS_CHANNEL 1
> +
> +/* ---------------------------------------------------------------------=
--- */
> +/* ADDRESS SYMBOL             DATA                                 Init =
R/W */
> +/*                   D7    D6    D5    D4    D3    D2    D1    D0       =
    */
> +/* ---------------------------------------------------------------------=
--- */
> +/*    0      PROX     X     X     X     X     X     X     X    VO  H'00 =
  R */
> +/*    1      GAIN     X     X     X     X  LED0     X     X     X  H'00 =
  W */
> +/*    2       HYS  HYSD HYSC1 HYSC0     X HYSF3 HYSF2 HYSF1 HYSF0  H'00 =
  W */
> +/*    3     CYCLE     X     X CYCL2 CYCL1 CYCL0  OSC2     X     X  H'00 =
  W */
> +/*    4     OPMOD     X     X     X   ASD     X     X  VCON   SSD  H'00 =
  W */
> +/*    6       CON     X     X     X OCON1 OCON0     X     X     X  H'00 =
  W */
> +/* ---------------------------------------------------------------------=
--- */
> +/* VO   :Proximity sensing result(0: no detection, 1: detection)        =
    */
> +/* LED0 :Select switch for LED driver's On-registence(0:2x higher, 1:nor=
mal)*/
> +/* HYSD/HYSF :Adjusts the receiver sensitivity                          =
    */
> +/* OSC  :Select switch internal clocl frequency hoppling(0:effective)   =
    */
> +/* CYCL :Determine the detection cycle(typically 8ms, up to 128x)       =
    */
> +/* SSD  :Software Shutdown function(0:shutdown, 1:operating)            =
    */
> +/* VCON :VOUT output method control(0:normal, 1:interrupt)              =
    */
> +/* ASD  :Select switch for analog sleep function(0:ineffective, 1:effect=
ive)*/
> +/* OCON :Select switch for enabling/disabling VOUT (00:enable, 11:disabl=
e)  */
> +
> +#define GP2AP002_PROX				0x00
> +#define GP2AP002_GAIN				0x01
> +#define GP2AP002_HYS				0x02
> +#define GP2AP002_CYCLE				0x03
> +#define GP2AP002_OPMOD				0x04
> +#define GP2AP002_CON				0x06
> +
> +#define GP2AP002_PROX_VO_DETECT			BIT(0)
> +
> +/* Setting this bit to 0 means 2x higher LED resistance */
> +#define GP2AP002_GAIN_LED_NORMAL		BIT(3)
> +
> +/*
> + * These bits adjusts the proximity sensitivity, determining characteris=
tics
> + * of the detection distance and its hysteresis.
> + */
> +#define GP2AP002_HYS_HYSD_SHIFT		7
> +#define GP2AP002_HYS_HYSD_MASK		BIT(7)
> +#define GP2AP002_HYS_HYSC_SHIFT		5
> +#define GP2AP002_HYS_HYSC_MASK		GENMASK(6, 5)
> +#define GP2AP002_HYS_HYSF_SHIFT		0
> +#define GP2AP002_HYS_HYSF_MASK		GENMASK(3, 0)
> +#define GP2AP002_HYS_MASK		(GP2AP002_HYS_HYSD_MASK | \
> +					 GP2AP002_HYS_HYSC_MASK | \
> +					 GP2AP002_HYS_HYSF_MASK)
> +
> +/*
> + * These values determine the detection cycle response time
> + * 0: 8ms, 1: 16ms, 2: 32ms, 3: 64ms, 4: 128ms,
> + * 5: 256ms, 6: 512ms, 7: 1024ms
> + */
> +#define GP2AP002_CYCLE_CYCL_SHIFT	3
> +#define GP2AP002_CYCLE_CYCL_MASK	GENMASK(5, 3)
> +
> +/*
> + * Select switch for internal clock frequency hopping
> + *	0: effective,
> + *	1: ineffective
> + */
> +#define GP2AP002_CYCLE_OSC_EFFECTIVE	0
> +#define GP2AP002_CYCLE_OSC_INEFFECTIVE	BIT(2)
> +#define GP2AP002_CYCLE_OSC_MASK		BIT(2)
> +
> +/* Analog sleep effective */
> +#define GP2AP002_OPMOD_ASD		BIT(4)
> +/* Enable chip */
> +#define GP2AP002_OPMOD_SSD_OPERATING	BIT(0)
> +/* IRQ mode */
> +#define GP2AP002_OPMOD_VCON_IRQ		BIT(1)
> +#define GP2AP002_OPMOD_MASK		(BIT(0) | BIT(1) | BIT(4))
> +
> +/*
> + * Select switch for enabling/disabling Vout pin
> + * 0: enable
> + * 2: force to go Low
> + * 3: force to go High
> + */
> +#define GP2AP002_CON_OCON_SHIFT		3
> +#define GP2AP002_CON_OCON_ENABLE	(0x0 << GP2AP002_CON_OCON_SHIFT)
> +#define GP2AP002_CON_OCON_LOW		(0x2 << GP2AP002_CON_OCON_SHIFT)
> +#define GP2AP002_CON_OCON_HIGH		(0x3 << GP2AP002_CON_OCON_SHIFT)
> +#define GP2AP002_CON_OCON_MASK		(0x3 << GP2AP002_CON_OCON_SHIFT)
> +
> +/**
> + * struct gp2ap002 - GP2AP002 state
> + * @map: regmap pointer for the i2c regmap
> + * @dev: pointer to parent device
> + * @vdd: regulator controlling VDD
> + * @vio: regulator controlling VIO
> + * @alsout: IIO ADC channel to convert the ALSOUT signal

Grumble.. Incomplete docs. Please send a follow up patch fixing that.

> + * @is_gp2ap002s00f: this is the GP2AP002F variant of the chip
> + * @irq: the IRQ line used by this device
> + * @enabled: we cannot read the status of the hardware so we need to
> + * keep track of whether the event is enabled using this state variable
> + */
> +struct gp2ap002 {
> +	struct regmap *map;
> +	struct device *dev;
> +	struct regulator *vdd;
> +	struct regulator *vio;
> +	struct iio_channel *alsout;
> +	enum iio_event_direction dir;
This one doesn't actually seem to be used so I dropped it rather than
make up the docs ;)

> +	u8 hys_far;
> +	u8 hys_close;
> +	bool is_gp2ap002s00f;
> +	int irq;
> +	bool enabled;
> +};
> +
> +static irqreturn_t gp2ap002_prox_irq(int irq, void *d)
> +{
> +	struct iio_dev *indio_dev =3D d;
> +	struct gp2ap002 *gp2ap002 =3D iio_priv(indio_dev);
> +	u64 ev;
> +	int val;
> +	int ret;
> +
> +	ret =3D regmap_read(gp2ap002->map, GP2AP002_PROX, &val);
> +	if (ret) {
> +		dev_err(gp2ap002->dev, "error reading proximity\n");
> +		goto err_retrig;
> +	}
> +
> +	if (val & GP2AP002_PROX_VO_DETECT) {
> +		/* Close */
> +		dev_dbg(gp2ap002->dev, "close\n");
> +		ret =3D regmap_write(gp2ap002->map, GP2AP002_HYS,
> +				   gp2ap002->hys_far);
> +		if (ret)
> +			dev_err(gp2ap002->dev,
> +				"error setting up proximity hysteresis\n");
> +		ev =3D IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, GP2AP002_PROX_CHANNEL,
> +					IIO_EV_TYPE_THRESH, IIO_EV_DIR_RISING);
> +	} else {
> +		/* Far */
> +		dev_dbg(gp2ap002->dev, "far\n");
> +		ret =3D regmap_write(gp2ap002->map, GP2AP002_HYS,
> +				   gp2ap002->hys_close);
> +		if (ret)
> +			dev_err(gp2ap002->dev,
> +				"error setting up proximity hysteresis\n");
> +		ev =3D IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, GP2AP002_PROX_CHANNEL,
> +					IIO_EV_TYPE_THRESH, IIO_EV_DIR_FALLING);
> +	}
> +	iio_push_event(indio_dev, ev, iio_get_time_ns(indio_dev));
> +
> +	/*
> +	 * After changing hysteresis, we need to wait for one detection
> +	 * cycle to see if anything changed, or we will just trigger the
> +	 * previous interrupt again. A detection cycle depends on the CYCLE
> +	 * register, we are hard-coding ~8 ms in probe() so wait some more
> +	 * than this, 20-30 ms.
> +	 */
> +	usleep_range(20000, 30000);
> +
> +err_retrig:
> +	ret =3D regmap_write(gp2ap002->map, GP2AP002_CON,
> +			   GP2AP002_CON_OCON_ENABLE);
> +	if (ret)
> +		dev_err(gp2ap002->dev, "error setting up VOUT control\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +struct gp2ap002_illuminance {
> +	unsigned int curr;
> +	unsigned int lux;
> +};
> +
> +/*
> + * This array maps current and lux.
> + *
> + * Ambient light sensing range is 3 to 55000 lux.
> + *
> + * This mapping is based on the following formula.
> + * illuminance =3D 10 ^ (current / 10)
> + */
> +static const struct gp2ap002_illuminance gp2ap002_illuminance_table[] =
=3D {
> +	{ .curr		=3D 5, .lux	=3D 3 },
> +	{ .curr		=3D 6, .lux	=3D 4 },
> +	{ .curr		=3D 7, .lux	=3D 5 },
> +	{ .curr		=3D 8, .lux	=3D 6 },
> +	{ .curr		=3D 9, .lux	=3D 8 },
> +	{ .curr		=3D 10, .lux	=3D 10 },
> +	{ .curr		=3D 11, .lux	=3D 12 },
> +	{ .curr		=3D 12, .lux	=3D 16 },
> +	{ .curr		=3D 13, .lux	=3D 20 },
> +	{ .curr		=3D 14, .lux	=3D 25 },
> +	{ .curr		=3D 15, .lux	=3D 32 },
> +	{ .curr		=3D 16, .lux	=3D 40 },
> +	{ .curr		=3D 17, .lux	=3D 50 },
> +	{ .curr		=3D 18, .lux	=3D 63 },
> +	{ .curr		=3D 19, .lux	=3D 79 },
> +	{ .curr		=3D 20, .lux	=3D 100 },
> +	{ .curr		=3D 21, .lux	=3D 126 },
> +	{ .curr		=3D 22, .lux	=3D 158 },
> +	{ .curr		=3D 23, .lux	=3D 200 },
> +	{ .curr		=3D 24, .lux	=3D 251 },
> +	{ .curr		=3D 25, .lux	=3D 316 },
> +	{ .curr		=3D 26, .lux	=3D 398 },
> +	{ .curr		=3D 27, .lux	=3D 501 },
> +	{ .curr		=3D 28, .lux	=3D 631 },
> +	{ .curr		=3D 29, .lux	=3D 794 },
> +	{ .curr		=3D 30, .lux	=3D 1000 },
> +	{ .curr		=3D 31, .lux	=3D 1259 },
> +	{ .curr		=3D 32, .lux	=3D 1585 },
> +	{ .curr		=3D 33, .lux	=3D 1995 },
> +	{ .curr		=3D 34, .lux	=3D 2512 },
> +	{ .curr		=3D 35, .lux	=3D 3162 },
> +	{ .curr		=3D 36, .lux	=3D 3981 },
> +	{ .curr		=3D 37, .lux	=3D 5012 },
> +	{ .curr		=3D 38, .lux	=3D 6310 },
> +	{ .curr		=3D 39, .lux	=3D 7943 },
> +	{ .curr		=3D 40, .lux	=3D 10000 },
> +	{ .curr		=3D 41, .lux	=3D 12589 },
> +	{ .curr		=3D 42, .lux	=3D 15849 },
> +	{ .curr		=3D 43, .lux	=3D 19953 },
> +	{ .curr		=3D 44, .lux	=3D 25119 },
> +	{ .curr		=3D 45, .lux	=3D 31623 },
> +	{ .curr		=3D 46, .lux	=3D 39811 },
> +	{ .curr		=3D 47, .lux	=3D 50119 },
> +};
> +
> +static int gp2ap002_get_lux(struct gp2ap002 *gp2ap002)
> +{
> +	const struct gp2ap002_illuminance *ill1;
> +	const struct gp2ap002_illuminance *ill2;
> +	int ret, res;
> +	int i;
> +
> +	ret =3D iio_read_channel_processed(gp2ap002->alsout, &res);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(gp2ap002->dev, "read %d mA from ADC\n", res);
> +
> +	ill1 =3D &gp2ap002_illuminance_table[0];
> +	if (res < ill1->curr) {
> +		dev_dbg(gp2ap002->dev, "total darkness\n");
> +		return 0;
> +	}
> +	for (i =3D 0; i < ARRAY_SIZE(gp2ap002_illuminance_table) - 1; i++) {
> +		ill1 =3D &gp2ap002_illuminance_table[i];
> +		ill2 =3D &gp2ap002_illuminance_table[i + 1];
> +
> +		if (res > ill2->curr)
> +			continue;
> +		if ((res <=3D ill1->curr) && (res >=3D ill2->curr))
> +			break;
> +	}
> +	if (res > ill2->curr) {
> +		dev_info_once(gp2ap002->dev, "max current overflow\n");
> +		return ill2->curr;
> +	}
> +	/* Interpolate and return */
> +	dev_dbg(gp2ap002->dev, "interpolate index %d and %d\n", i, i + 1);
> +	/* How many steps along the curve */
> +	i =3D res - ill1->curr; /* x - x0 */
> +	/* Linear interpolation */
> +	return ill1->lux + i *
> +		((ill2->lux - ill1->lux) / (ill2->curr - ill1->curr));
> +}
> +
> +static int gp2ap002_read_raw(struct iio_dev *indio_dev,
> +			   struct iio_chan_spec const *chan,
> +			   int *val, int *val2, long mask)
> +{
> +	struct gp2ap002 *gp2ap002 =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		switch (chan->type) {
> +		case IIO_LIGHT:
> +			ret =3D gp2ap002_get_lux(gp2ap002);
> +			if (ret < 0)
> +				return ret;
> +			*val =3D ret;
> +			return IIO_VAL_INT;
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int gp2ap002_init(struct gp2ap002 *gp2ap002)
> +{
> +	int ret;
> +
> +	/* Set up the IR LED resistance */
> +	ret =3D regmap_write(gp2ap002->map, GP2AP002_GAIN,
> +			   GP2AP002_GAIN_LED_NORMAL);
> +	if (ret) {
> +		dev_err(gp2ap002->dev, "error setting up LED gain\n");
> +		return ret;
> +	}
> +	ret =3D regmap_write(gp2ap002->map, GP2AP002_HYS, gp2ap002->hys_far);
> +	if (ret) {
> +		dev_err(gp2ap002->dev,
> +			"error setting up proximity hysteresis\n");
> +		return ret;
> +	}
> +
> +	/* Disable internal frequency hopping */
> +	ret =3D regmap_write(gp2ap002->map, GP2AP002_CYCLE,
> +			   GP2AP002_CYCLE_OSC_INEFFECTIVE);
> +	if (ret) {
> +		dev_err(gp2ap002->dev,
> +			"error setting up internal frequency hopping\n");
> +		return ret;
> +	}
> +
> +	/* Enable chip and IRQ, disable analog sleep */
> +	ret =3D regmap_write(gp2ap002->map, GP2AP002_OPMOD,
> +			   GP2AP002_OPMOD_SSD_OPERATING |
> +			   GP2AP002_OPMOD_VCON_IRQ);
> +	if (ret) {
> +		dev_err(gp2ap002->dev, "error setting up operation mode\n");
> +		return ret;
> +	}
> +
> +	/* Interrupt on VOUT enabled */
> +	ret =3D regmap_write(gp2ap002->map, GP2AP002_CON,
> +			   GP2AP002_CON_OCON_ENABLE);
> +	if (ret)
> +		dev_err(gp2ap002->dev, "error setting up VOUT control\n");
> +
> +	return ret;
> +}
> +
> +static int gp2ap002_read_event_config(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan,
> +				      enum iio_event_type type,
> +				      enum iio_event_direction dir)
> +{
> +	struct gp2ap002 *gp2ap002 =3D iio_priv(indio_dev);
> +
> +	/*
> +	 * We just keep track of this internally, as it is not possible to
> +	 * query the hardware.
> +	 */
> +	return gp2ap002->enabled;
> +}
> +
> +static int gp2ap002_write_event_config(struct iio_dev *indio_dev,
> +				       const struct iio_chan_spec *chan,
> +				       enum iio_event_type type,
> +				       enum iio_event_direction dir,
> +				       int state)
> +{
> +	struct gp2ap002 *gp2ap002 =3D iio_priv(indio_dev);
> +
> +	if (state) {
> +		/*
> +		 * This will bring the regulators up (unless they are on
> +		 * already) and reintialize the sensor by using runtime_pm
> +		 * callbacks.
> +		 */
> +		pm_runtime_get_sync(gp2ap002->dev);
> +		gp2ap002->enabled =3D true;
> +	} else {
> +		pm_runtime_mark_last_busy(gp2ap002->dev);
> +		pm_runtime_put_autosuspend(gp2ap002->dev);
> +		gp2ap002->enabled =3D false;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct iio_info gp2ap002_info =3D {
> +	.read_raw =3D gp2ap002_read_raw,
> +	.read_event_config =3D gp2ap002_read_event_config,
> +	.write_event_config =3D gp2ap002_write_event_config,
> +};
> +
> +static const struct iio_event_spec gp2ap002_events[] =3D {
> +	{
> +		.type =3D IIO_EV_TYPE_THRESH,
> +		.dir =3D IIO_EV_DIR_EITHER,
> +		.mask_separate =3D BIT(IIO_EV_INFO_ENABLE),
> +	},
> +};
> +
> +static const struct iio_chan_spec gp2ap002_channels[] =3D {
> +	{
> +		.type =3D IIO_PROXIMITY,
> +		.event_spec =3D gp2ap002_events,
> +		.num_event_specs =3D ARRAY_SIZE(gp2ap002_events),
> +	},
> +	{
> +		.type =3D IIO_LIGHT,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
> +		.channel =3D GP2AP002_ALS_CHANNEL,
> +	},
> +};
> +
> +/*
> + * We need a special regmap because this hardware expects to
> + * write single bytes to registers but read a 16bit word on some
> + * variants and discard the lower 8 bits so combine
> + * i2c_smbus_read_word_data() with i2c_smbus_write_byte_data()
> + * selectively like this.
> + */
> +static int gp2ap002_regmap_i2c_read(void *context, unsigned int reg,
> +				    unsigned int *val)
> +{
> +	struct device *dev =3D context;
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_word_data(i2c, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D (ret >> 8) & 0xFF;
> +
> +	return 0;
> +}
> +
> +static int gp2ap002_regmap_i2c_write(void *context, unsigned int reg,
> +				     unsigned int val)
> +{
> +	struct device *dev =3D context;
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
> +
> +	return i2c_smbus_write_byte_data(i2c, reg, val);
> +}
> +
> +static struct regmap_bus gp2ap002_regmap_bus =3D {
> +	.reg_read =3D gp2ap002_regmap_i2c_read,
> +	.reg_write =3D gp2ap002_regmap_i2c_write,
> +};
> +
> +static int gp2ap002_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct gp2ap002 *gp2ap002;
> +	struct iio_dev *indio_dev;
> +	struct device *dev =3D &client->dev;
> +	enum iio_chan_type ch_type;
> +	static const struct regmap_config config =3D {
> +		.reg_bits =3D 8,
> +		.val_bits =3D 8,
> +		.max_register =3D GP2AP002_CON,
> +	};
> +	struct regmap *regmap;
> +	int num_chan;
> +	const char *compat;
> +	u8 val;
> +	int ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*gp2ap002));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +	i2c_set_clientdata(client, indio_dev);
> +
> +	gp2ap002 =3D iio_priv(indio_dev);
> +	gp2ap002->dev =3D dev;
> +
> +	/*
> +	 * Check the device compatible like this makes it possible to use
> +	 * ACPI PRP0001 for registering the sensor using device tree
> +	 * properties.
> +	 */
> +	ret =3D device_property_read_string(dev, "compatible", &compat);
> +	if (ret) {
> +		dev_err(dev, "cannot check compatible\n");
> +		return ret;
> +	}
> +	gp2ap002->is_gp2ap002s00f =3D !strcmp(compat, "sharp,gp2ap002s00f");
> +
> +	regmap =3D devm_regmap_init(dev, &gp2ap002_regmap_bus, dev, &config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "Failed to register i2c regmap %d\n",
> +			(int)PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +	gp2ap002->map =3D regmap;
> +
> +	/*
> +	 * The hysteresis settings are coded into the device tree as values
> +	 * to be written into the hysteresis register. The datasheet defines
> +	 * modes "A", "B1" and "B2" with fixed values to be use but vendor
> +	 * code trees for actual devices are tweaking these values and refer to
> +	 * modes named things like "B1.5". To be able to support any devices,
> +	 * we allow passing an arbitrary hysteresis setting for "near" and
> +	 * "far".
> +	 */
> +
> +	/* Check the device tree for the IR LED hysteresis */
> +	ret =3D device_property_read_u8(dev, "sharp,proximity-far-hysteresis",
> +				      &val);
> +	if (ret) {
> +		dev_err(dev, "failed to obtain proximity far setting\n");
> +		return ret;
> +	}
> +	dev_dbg(dev, "proximity far setting %02x\n", val);
> +	gp2ap002->hys_far =3D val;
> +
> +	ret =3D device_property_read_u8(dev, "sharp,proximity-close-hysteresis",
> +				      &val);
> +	if (ret) {
> +		dev_err(dev, "failed to obtain proximity close setting\n");
> +		return ret;
> +	}
> +	dev_dbg(dev, "proximity close setting %02x\n", val);
> +	gp2ap002->hys_close =3D val;
> +
> +	/* The GP2AP002A00F has a light sensor too */
> +	if (!gp2ap002->is_gp2ap002s00f) {
> +		gp2ap002->alsout =3D devm_iio_channel_get(dev, "alsout");
> +		if (IS_ERR(gp2ap002->alsout)) {
> +			if (PTR_ERR(gp2ap002->alsout) =3D=3D -ENODEV) {
> +				dev_err(dev, "no ADC, deferring...\n");
> +				return -EPROBE_DEFER;
> +			}
> +			dev_err(dev, "failed to get ALSOUT ADC channel\n");
> +			return PTR_ERR(gp2ap002->alsout);
> +		}
> +		ret =3D iio_get_channel_type(gp2ap002->alsout, &ch_type);
> +		if (ret < 0)
> +			return ret;
> +		if (ch_type !=3D IIO_CURRENT) {
> +			dev_err(dev,
> +				"wrong type of IIO channel specified for ALSOUT\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	gp2ap002->vdd =3D devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(gp2ap002->vdd)) {
> +		dev_err(dev, "failed to get VDD regulator\n");
> +		return PTR_ERR(gp2ap002->vdd);
> +	}
> +	gp2ap002->vio =3D devm_regulator_get(dev, "vio");
> +	if (IS_ERR(gp2ap002->vio)) {
> +		dev_err(dev, "failed to get VIO regulator\n");
> +		return PTR_ERR(gp2ap002->vio);
> +	}
> +
> +	/* Operating voltage 2.4V .. 3.6V according to datasheet */
> +	ret =3D regulator_set_voltage(gp2ap002->vdd, 2400000, 3600000);
> +	if (ret) {
> +		dev_err(dev, "failed to sett VDD voltage\n");
> +		return ret;
> +	}
> +
> +	/* VIO should be between 1.65V and VDD */
> +	ret =3D regulator_get_voltage(gp2ap002->vdd);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get VIO voltage\n");

VDD. I'll fix that up if I don't find anything else.

> +		return ret;
> +	}
> +	ret =3D regulator_set_voltage(gp2ap002->vio, 1650000, ret);
> +	if (ret) {
> +		dev_err(dev, "failed to set VIO voltage\n");
> +		return ret;
> +	}
> +
> +	ret =3D regulator_enable(gp2ap002->vdd);
> +	if (ret) {
> +		dev_err(dev, "failed to enable VDD regulator\n");
> +		return ret;
> +	}
> +	ret =3D regulator_enable(gp2ap002->vio);
> +	if (ret) {
> +		dev_err(dev, "failed to enable VIO regulator\n");
> +		goto out_disable_vdd;
> +	}
> +
> +	msleep(20);
> +
> +	/*
> +	 * Initialize the device and signal to runtime PM that now we are
> +	 * definately up and using power.
> +	 */
> +	ret =3D gp2ap002_init(gp2ap002);
> +	if (ret) {
> +		dev_err(dev, "initialization failed\n");
> +		goto out_disable_vio;
> +	}
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	gp2ap002->enabled =3D false;
> +
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +					gp2ap002_prox_irq, IRQF_ONESHOT,
> +					"gp2ap002", indio_dev);
> +	if (ret) {
> +		dev_err(dev, "unable to request IRQ\n");
> +		goto out_disable_vio;
> +	}
> +	gp2ap002->irq =3D client->irq;
> +
> +	/*
> +	 * As the device takes 20 ms + regulator delay to come up with a fresh
> +	 * measurement after power-on, do not shut it down unnecessarily.
> +	 * Set autosuspend to a one second.
> +	 */
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_put(dev);
> +
> +	indio_dev->dev.parent =3D dev;
> +	indio_dev->info =3D &gp2ap002_info;
> +	indio_dev->name =3D "gp2ap002";
> +	indio_dev->channels =3D gp2ap002_channels;
> +	/* Skip light channel for the proximity-only sensor */
> +	num_chan =3D ARRAY_SIZE(gp2ap002_channels);
> +	if (gp2ap002->is_gp2ap002s00f)
> +		num_chan--;
> +	indio_dev->num_channels =3D num_chan;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +
> +	ret =3D iio_device_register(indio_dev);
> +	if (ret)
> +		goto out_disable_pm;
> +	dev_dbg(dev, "Sharp GP2AP002 probed successfully\n");
> +
> +	return 0;
> +
> +out_disable_pm:
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +out_disable_vio:
> +	regulator_disable(gp2ap002->vio);
> +out_disable_vdd:
> +	regulator_disable(gp2ap002->vdd);
> +	return ret;
> +}
> +
> +static int gp2ap002_remove(struct i2c_client *client)
> +{
> +	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
> +	struct gp2ap002 *gp2ap002 =3D iio_priv(indio_dev);
> +	struct device *dev =3D &client->dev;
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	iio_device_unregister(indio_dev);
> +	regulator_disable(gp2ap002->vio);
> +	regulator_disable(gp2ap002->vdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused gp2ap002_runtime_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct gp2ap002 *gp2ap002 =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	/* Deactivate the IRQ */
> +	disable_irq(gp2ap002->irq);
> +
> +	/* Disable chip and IRQ, everything off */
> +	ret =3D regmap_write(gp2ap002->map, GP2AP002_OPMOD, 0x00);
> +	if (ret) {
> +		dev_err(gp2ap002->dev, "error setting up operation mode\n");
> +		return ret;
> +	}
> +	/*
> +	 * As these regulators may be shared, at least we are now in
> +	 * sleep even if the regulators aren't really turned off.
> +	 */
> +	regulator_disable(gp2ap002->vio);
> +	regulator_disable(gp2ap002->vdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused gp2ap002_runtime_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct gp2ap002 *gp2ap002 =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D regulator_enable(gp2ap002->vdd);
> +	if (ret) {
> +		dev_err(dev, "failed to enable VDD regulator in resume path\n");
> +		return ret;
> +	}
> +	ret =3D regulator_enable(gp2ap002->vio);
> +	if (ret) {
> +		dev_err(dev, "failed to enable VIO regulator in resume path\n");
> +		return ret;
> +	}
> +
> +	msleep(20);
> +
> +	ret =3D gp2ap002_init(gp2ap002);
> +	if (ret) {
> +		dev_err(dev, "re-initialization failed\n");
> +		return ret;
> +	}
> +
> +	/* Re-activate the IRQ */
> +	enable_irq(gp2ap002->irq);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops gp2ap002_dev_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(gp2ap002_runtime_suspend,
> +			   gp2ap002_runtime_resume, NULL)
> +};
> +
> +static const struct i2c_device_id gp2ap002_id_table[] =3D {
> +	{ "gp2ap002", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, gp2ap002_id);
> +
> +static const struct of_device_id gp2ap002_of_match[] =3D {
> +	{ .compatible =3D "sharp,gp2ap002a00f" },
> +	{ .compatible =3D "sharp,gp2ap002s00f" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, gp2ap002_of_match);
> +
> +static struct i2c_driver gp2ap002_driver =3D {
> +	.driver =3D {
> +		.name =3D "gp2ap002",
> +		.of_match_table =3D gp2ap002_of_match,
> +		.pm =3D &gp2ap002_dev_pm_ops,
> +	},
> +	.probe =3D gp2ap002_probe,
> +	.remove =3D gp2ap002_remove,
> +	.id_table =3D gp2ap002_id_table,
> +};
> +module_i2c_driver(gp2ap002_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("GP2AP002 ambient light and proximity sensor driver");
> +MODULE_LICENSE("GPL v2");

