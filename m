Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CACD1DA3A4
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 23:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgESVbv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 17:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgESVbv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 17:31:51 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EF9C08C5C0;
        Tue, 19 May 2020 14:31:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 2E69B2725B2
Received: by earth.universe (Postfix, from userid 1000)
        id 9042B3C08C6; Tue, 19 May 2020 23:31:45 +0200 (CEST)
Date:   Tue, 19 May 2020 23:31:45 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv2 4/5] Input: EXC3000: Add support to query model and
 fw_version
Message-ID: <20200519213145.peg2yxzt5n54atmh@earth.universe>
References: <20200519182447.73405-1-sebastian.reichel@collabora.com>
 <20200519182447.73405-5-sebastian.reichel@collabora.com>
 <a1700a82-3fa0-771a-e924-7bdacca71c18@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zxgy5gmwy23xx7qj"
Content-Disposition: inline
In-Reply-To: <a1700a82-3fa0-771a-e924-7bdacca71c18@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--zxgy5gmwy23xx7qj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 19, 2020 at 11:12:16PM +0200, Enric Balletbo i Serra wrote:
> On 19/5/20 20:24, Sebastian Reichel wrote:
> > Expose model and fw_version via sysfs. Also query the model
> > in probe to make sure, that the I2C communication with the
> > device works before successfully probing the driver.
> >=20
> > This is a bit complicated, since EETI devices do not have
> > a sync interface. Sending the commands and directly reading
> > does not work. Sending the command and waiting for some time
> > is also not an option, since there might be touch events in
> > the mean time.
> >=20
> > Last but not least we do not cache the results, since this
> > interface can be used to check the I2C communication is still
> > working as expected.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  drivers/input/touchscreen/exc3000.c | 138 +++++++++++++++++++++++++++-
> >  1 file changed, 137 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchs=
creen/exc3000.c
> > index 9622cba514b3..1ae758bbf627 100644
> > --- a/drivers/input/touchscreen/exc3000.c
> > +++ b/drivers/input/touchscreen/exc3000.c
> > @@ -24,6 +24,9 @@
> >  #define EXC3000_LEN_FRAME		66
> >  #define EXC3000_LEN_POINT		10
> > =20
> > +#define EXC3000_LEN_MODEL_NAME		16
> > +#define EXC3000_LEN_FW_VERSION		16
> > +
> >  #define EXC3000_MT1_EVENT		0x06
> >  #define EXC3000_MT2_EVENT		0x18
> > =20
> > @@ -64,6 +67,11 @@ struct exc3000_data {
> >  	struct touchscreen_properties prop;
> >  	struct timer_list timer;
> >  	u8 buf[2 * EXC3000_LEN_FRAME];
> > +	struct completion wait_event;
> > +	struct mutex query_lock;
> > +	int query_result;
> > +	char model[EXC3000_LEN_MODEL_NAME];
> > +	char fw_version[EXC3000_LEN_FW_VERSION];
> >  };
> > =20
> >  static void exc3000_report_slots(struct input_dev *input,
> > @@ -149,6 +157,28 @@ static int exc3000_read_data(struct exc3000_data *=
data,
> >  	return 0;
> >  }
> > =20
> > +static int exc3000_query_interrupt(struct exc3000_data *data)
> > +{
> > +	u8 *buf =3D data->buf;
> > +	int err;
> > +
> > +	err =3D i2c_master_recv(data->client, buf, EXC3000_LEN_FRAME);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	if (buf[0] !=3D 0x42)
> > +		return -EPROTO;
> > +
> > +	if (buf[4] =3D=3D 'E')
> > +		strlcpy(data->model, buf+5, sizeof(data->model));
> > +	else if (buf[4] =3D=3D 'D')
> > +		strlcpy(data->fw_version, buf+5, sizeof(data->fw_version));
> > +	else
> > +		return -EPROTO;
> > +
> > +	return 0;
> > +}
> > +
> >  static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
> >  {
> >  	struct exc3000_data *data =3D dev_id;
> > @@ -157,6 +187,12 @@ static irqreturn_t exc3000_interrupt(int irq, void=
 *dev_id)
> >  	int slots, total_slots;
> >  	int error;
> > =20
> > +	if (mutex_is_locked(&data->query_lock)) {
> > +		data->query_result =3D exc3000_query_interrupt(data);
> > +		complete(&data->wait_event);
> > +		goto out;
> > +	}
> > +
> >  	error =3D exc3000_read_data(data, buf, &total_slots);
> >  	if (error) {
> >  		/* Schedule a timer to release "stuck" contacts */
> > @@ -184,11 +220,94 @@ static irqreturn_t exc3000_interrupt(int irq, voi=
d *dev_id)
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > +static int fw_version_show(struct device *dev,
> > +			   struct device_attribute *attr, char *buf)
> > +{
> > +	struct exc3000_data *data =3D dev_get_drvdata(dev);
> > +	static const u8 request[68] =3D {
> > +		0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'D', 0x00
> > +	};
> > +	struct i2c_client *client =3D data->client;
> > +	int err;
> > +
> > +	mutex_lock(&data->query_lock);
> > +
> > +	data->query_result =3D -ETIMEDOUT;
> > +	reinit_completion(&data->wait_event);
> > +
> > +	err =3D i2c_master_send(client, request, sizeof(request));
> > +	if (err < 0) {
> > +		mutex_unlock(&data->query_lock);
> > +		return err;
> > +	}
> > +
> > +	wait_for_completion_interruptible_timeout(&data->wait_event, 1*HZ);
> > +	mutex_unlock(&data->query_lock);
> > +
> > +	if (data->query_result < 0)
> > +		return data->query_result;
> > +
> > +	return sprintf(buf, "%s\n", data->fw_version);
> > +}
> > +static DEVICE_ATTR_RO(fw_version);
> > +
>=20
> You should probably document the new sysfs entries, although are
> self-explanatory.

I suppose I could create
Documentation/ABI/testing/sysfs-driver-input-exc3000 or is there a
better place for sysfs API documentation of input devices?

> > +static ssize_t exc3000_get_model(struct exc3000_data *data)
> > +{
> > +	static const u8 request[68] =3D {
> > +		0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'E', 0x00
> > +	};
> > +	struct i2c_client *client =3D data->client;
> > +	int err;
> > +
> > +	mutex_lock(&data->query_lock);
> > +	data->query_result =3D -ETIMEDOUT;
> > +	reinit_completion(&data->wait_event);
> > +
> > +	err =3D i2c_master_send(client, request, sizeof(request));
> > +	if (err < 0) {
> > +		mutex_unlock(&data->query_lock);
> > +		return err;
> > +	}
> > +
> > +	wait_for_completion_interruptible_timeout(&data->wait_event, 1 * HZ);
> > +	mutex_unlock(&data->query_lock);
> > +
> > +	return data->query_result;
> > +}
> > +
> > +static ssize_t model_show(struct device *dev,
> > +			  struct device_attribute *attr, char *buf)
> > +{
> > +	struct exc3000_data *data =3D dev_get_drvdata(dev);
> > +	int err =3D exc3000_get_model(data);
> > +
> > +	if (err < 0)
> > +		return err;
> > +
> > +	return sprintf(buf, "%s\n", data->model);
> > +}
> > +static DEVICE_ATTR_RO(model);
> > +
> > +static struct attribute *sysfs_attrs[] =3D {
> > +	&dev_attr_fw_version.attr,
> > +	&dev_attr_model.attr,
> > +	NULL
> > +};
> > +
> > +static struct attribute_group exc3000_attribute_group =3D {
> > +	.attrs =3D sysfs_attrs
> > +};
> > +
> > +static const struct attribute_group *exc3000_attribute_groups[] =3D {
> > +	&exc3000_attribute_group,
> > +	NULL
> > +};
> > +
> >  static int exc3000_probe(struct i2c_client *client)
> >  {
> >  	struct exc3000_data *data;
> >  	struct input_dev *input;
> > -	int error, max_xy;
> > +	int error, max_xy, retry;
> > =20
> >  	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> >  	if (!data)
> > @@ -202,15 +321,19 @@ static int exc3000_probe(struct i2c_client *clien=
t)
> >  		data->info =3D &exc3000_info[eeti_dev_id];
> >  	}
> >  	timer_setup(&data->timer, exc3000_timer, 0);
> > +	init_completion(&data->wait_event);
> > +	mutex_init(&data->query_lock);
> > =20
> >  	input =3D devm_input_allocate_device(&client->dev);
> >  	if (!input)
> >  		return -ENOMEM;
> > =20
> >  	data->input =3D input;
> > +	input_set_drvdata(input, data);
> > =20
> >  	input->name =3D data->info->name;
> >  	input->id.bustype =3D BUS_I2C;
> > +	input->dev.groups =3D exc3000_attribute_groups;
> > =20
> >  	max_xy =3D data->info->max_xy;
> >  	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_xy, 0, 0);
> > @@ -233,6 +356,19 @@ static int exc3000_probe(struct i2c_client *client)
> >  	if (error)
> >  		return error;
> > =20
> > +	for (retry =3D 0; retry < 3; ++retry) {
>=20
> Just curious, is it known to fail and need retries?

No, but a single I=B2C transmission can always go bad and in that case
it makes sense to recover instead of failing to load the driver. Other
buses (e.g. PCI) handle this transparently, but I=B2C does not.

-- Sebastian

>=20
> > +		error =3D exc3000_get_model(data);
> > +		if (!error)
> > +			break;
> > +		dev_warn(&client->dev, "Retry %d get EETI EXC3000 model: %d\n",
> > +			 retry + 1, error);
> > +	}
> > +
> > +	if (error)
> > +		return error;
> > +
> > +	dev_dbg(&client->dev, "TS Model: %s", data->model);
> > +
> >  	return 0;
> >  }
> > =20
> >=20

--zxgy5gmwy23xx7qj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl7EUBgACgkQ2O7X88g7
+pp7zg/+P7712NkOj8dDfEkHbXbWPgj2OfEFjeMtxF5B5WPnMWeiW89YWkKK3cKh
lCjBFO9MtRhgxkrx/THfML1zZpvQnZ5oJTqFardVhaktzrXFEYXhbZsnd9NwSvut
eN+8MnBCJZtXDI5vu4xq5t/SvuAV0q75fZIJr6fukImLf16YewQyknGvUejFkloo
0a3F0/NuBZsCqKB1hQtYzVPCnLcfoNeIz/OXz5V0AJzzynfW0Bq18g8Rdl42KnPM
IrfHZAntbpu0TfTqcLf8DRpthfVbwFrhv+85MlHkcFRtXXFSzszsuepZG51H86Qf
/9Mm+owDmeR9lhDqlgD1+RiKeK4TMQ9eYbM2uIzykVrVaAmq4WJ6Cn3DFpt2tCSG
hfru3sm38GJDPOSwfOXCqrpafdWW8CAiLaf25uM9sgE8Xo+qnZgpLYg7nsRdtXIm
687D6lE+Z6aBRBerdtJ8VLqOvn+/iUIWNFv3EZjwN7Jg3r9JNsGN5evM8AlC83k1
ob/n+VhrTXLT3s2xUSs5ex+kO80Pv48iT9Wv79Baz00p8OAtKU4P3LxkpbNdwKvI
9NjGhOqc5/YWcB3twP6LPGIRJU5tBt/MG5ZNMDLMuF0KR7GrVx6wD2FI6HMyzuWJ
n3Ag8y5DmquGFAiKLhQEIXVqgS6L7VZLbTR41Ey43vNaNh7EfqA=
=U8IP
-----END PGP SIGNATURE-----

--zxgy5gmwy23xx7qj--
