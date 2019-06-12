Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC63C424DB
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 13:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391831AbfFLL6D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 07:58:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:42522 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391809AbfFLL6C (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 07:58:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id F2415AE5A;
        Wed, 12 Jun 2019 11:58:00 +0000 (UTC)
Message-ID: <f029cb51eb99b9a51743b87cb736ec66e8ec0ae5.camel@suse.de>
Subject: Re: [PATCH 1/2] input: edt-ft5x06 - add polled input support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Date:   Wed, 12 Jun 2019 13:57:46 +0200
In-Reply-To: <20190430185859.24015-1-nsaenzjulienne@suse.de>
References: <20190430185859.24015-1-nsaenzjulienne@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-SOdlE4XTHuErT+ib+94s"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-SOdlE4XTHuErT+ib+94s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-30 at 20:58 +0200, Nicolas Saenz Julienne wrote:
> Some hardware configurations might pass on providing an interrupt line.
> In that case there is always the option to use a polled input approach.
> This patch adapts the driver for it.
>=20
> The polled approach is only triggered if no interrupt is provided by the
> firmware or platform data.
>=20
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---

Ping :)

>  drivers/input/touchscreen/edt-ft5x06.c | 100 ++++++++++++++++++-------
>  1 file changed, 72 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c
> b/drivers/input/touchscreen/edt-ft5x06.c
> index 702bfda7ee77..e58645c72c2f 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -39,6 +39,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> +#include <linux/input-polldev.h>
>  #include <linux/of_device.h>
> =20
>  #define WORK_REGISTER_THRESHOLD		0x00
> @@ -97,6 +98,7 @@ struct edt_reg_addr {
>  struct edt_ft5x06_ts_data {
>  	struct i2c_client *client;
>  	struct input_dev *input;
> +	struct input_polled_dev *poll_dev;
>  	struct touchscreen_properties prop;
>  	u16 num_x;
>  	u16 num_y;
> @@ -181,9 +183,8 @@ static bool edt_ft5x06_ts_check_crc(struct
> edt_ft5x06_ts_data *tsdata,
>  	return true;
>  }
> =20
> -static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
> +static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
>  {
> -	struct edt_ft5x06_ts_data *tsdata =3D dev_id;
>  	struct device *dev =3D &tsdata->client->dev;
>  	u8 cmd;
>  	u8 rdbuf[63];
> @@ -210,7 +211,7 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void
> *dev_id)
>  		break;
> =20
>  	default:
> -		goto out;
> +		return;
>  	}
> =20
>  	memset(rdbuf, 0, sizeof(rdbuf));
> @@ -222,7 +223,7 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void
> *dev_id)
>  	if (error) {
>  		dev_err_ratelimited(dev, "Unable to fetch data, error: %d\n",
>  				    error);
> -		goto out;
> +		return;
>  	}
> =20
>  	/* M09/M12 does not send header or CRC */
> @@ -232,11 +233,11 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void
> *dev_id)
>  			dev_err_ratelimited(dev,
>  					"Unexpected header: %02x%02x%02x!\n",
>  					rdbuf[0], rdbuf[1], rdbuf[2]);
> -			goto out;
> +			return;
>  		}
> =20
>  		if (!edt_ft5x06_ts_check_crc(tsdata, rdbuf, datalen))
> -			goto out;
> +			return;
>  	}
> =20
>  	for (i =3D 0; i < tsdata->max_support_points; i++) {
> @@ -273,11 +274,23 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void
> *dev_id)
> =20
>  	input_mt_report_pointer_emulation(tsdata->input, true);
>  	input_sync(tsdata->input);
> +}
> =20
> -out:
> +static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
> +{
> +	struct edt_ft5x06_ts_data *tsdata =3D dev_id;
> +
> +	edt_ft5x06_process(tsdata);
>  	return IRQ_HANDLED;
>  }
> =20
> +static void edt_ft5x06_poll(struct input_polled_dev *dev)
> +{
> +	struct edt_ft5x06_ts_data *tsdata =3D dev->private;
> +
> +	edt_ft5x06_process(tsdata);
> +}
> +
>  static int edt_ft5x06_register_write(struct edt_ft5x06_ts_data *tsdata,
>  				     u8 addr, u8 value)
>  {
> @@ -1059,7 +1072,9 @@ static int edt_ft5x06_ts_probe(struct i2c_client
> *client,
>  					 const struct i2c_device_id *id)
>  {
>  	const struct edt_i2c_chip_data *chip_data;
> +	struct input_polled_dev *poll_dev =3D NULL;
>  	struct edt_ft5x06_ts_data *tsdata;
> +	bool polled =3D !(client->irq);
>  	struct input_dev *input;
>  	unsigned long irq_flags;
>  	int error;
> @@ -1112,15 +1127,38 @@ static int edt_ft5x06_ts_probe(struct i2c_client
> *client,
>  		msleep(300);
>  	}
> =20
> -	input =3D devm_input_allocate_device(&client->dev);
> -	if (!input) {
> -		dev_err(&client->dev, "failed to allocate input device.\n");
> -		return -ENOMEM;
> +	if (polled) {
> +		poll_dev =3D devm_input_allocate_polled_device(&client->dev);
> +		if (!poll_dev) {
> +			dev_err(&client->dev,
> +				"failed to allocate polled input device.\n");
> +			return -ENOMEM;
> +		}
> +
> +		poll_dev->poll =3D edt_ft5x06_poll;
> +		poll_dev->private =3D tsdata;
> +
> +		tsdata->poll_dev =3D poll_dev;
> +		tsdata->input =3D poll_dev->input;
> +
> +		input =3D poll_dev->input;
> +
> +		device_property_read_u32(&client->dev, "poll-interval",
> +					 &poll_dev->poll_interval);
> +
> +	} else {
> +		input =3D devm_input_allocate_device(&client->dev);
> +		if (!input) {
> +			dev_err(&client->dev,
> +				"failed to allocate input device.\n");
> +			return -ENOMEM;
> +		}
> +
> +		tsdata->input =3D input;
>  	}
> =20
>  	mutex_init(&tsdata->mutex);
>  	tsdata->client =3D client;
> -	tsdata->input =3D input;
>  	tsdata->factory_mode =3D false;
> =20
>  	error =3D edt_ft5x06_ts_identify(client, tsdata, fw_version);
> @@ -1167,26 +1205,32 @@ static int edt_ft5x06_ts_probe(struct i2c_client
> *client,
> =20
>  	i2c_set_clientdata(client, tsdata);
> =20
> -	irq_flags =3D irq_get_trigger_type(client->irq);
> -	if (irq_flags =3D=3D IRQF_TRIGGER_NONE)
> -		irq_flags =3D IRQF_TRIGGER_FALLING;
> -	irq_flags |=3D IRQF_ONESHOT;
> -
> -	error =3D devm_request_threaded_irq(&client->dev, client->irq,
> -					NULL, edt_ft5x06_ts_isr, irq_flags,
> -					client->name, tsdata);
> -	if (error) {
> -		dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
> -		return error;
> -	}
> -
>  	error =3D devm_device_add_group(&client->dev, &edt_ft5x06_attr_group);
>  	if (error)
>  		return error;
> =20
> -	error =3D input_register_device(input);
> -	if (error)
> -		return error;
> +	if (polled) {
> +		error =3D input_register_polled_device(poll_dev);
> +		if (error)
> +			return error;
> +	} else {
> +		irq_flags =3D irq_get_trigger_type(client->irq);
> +		if (irq_flags =3D=3D IRQF_TRIGGER_NONE)
> +			irq_flags =3D IRQF_TRIGGER_FALLING;
> +		irq_flags |=3D IRQF_ONESHOT;
> +
> +		error =3D devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, edt_ft5x06_ts_isr,
> irq_flags,
> +						client->name, tsdata);
> +		if (error) {
> +			dev_err(&client->dev, "Unable to request touchscreen
> IRQ.\n");
> +			return error;
> +		}
> +
> +		error =3D input_register_device(input);
> +		if (error)
> +			return error;
> +	}
> =20
>  	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
>  	device_init_wakeup(&client->dev, 1);


--=-SOdlE4XTHuErT+ib+94s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl0A6LoACgkQlfZmHno8
x/5wfAgAmv+aigWIRYobmGMVU+23GtJ7MRGy8LHah23eCy0ZIIfpmXZ8D75yc82i
VtOEmkJDCgOLM2SMXtcYdSjQ0P/KI0AGiU2eSVICsCu4I5QtmdZJcQLwtALcaJvm
uf4w9pzGUABi0zN9mU50f92M30pDY4U5iMnmx0cnT7RfztdOxh0VEPPDJnGyeOPa
TOHekzOQXJTM4YpeCVJRdC1Q9Q7w0fn82dSdIDnmQfoOnZ9uQonaR2ts6hrZm2Bv
+sHeEPEGCRPOMGezvFIrRTzQbE0qI+M2PmPYPBNubkgnT5YR6t6M8ZT2yHahqCNB
+xRsOBjmHcfRYFm0YXDULpbPNp/jCA==
=da2i
-----END PGP SIGNATURE-----

--=-SOdlE4XTHuErT+ib+94s--

