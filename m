Return-Path: <linux-input+bounces-10274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A7A41719
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99B9A188C698
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 08:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B0078F37;
	Mon, 24 Feb 2025 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hcrawrSv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405FE2AEE1
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 08:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740385065; cv=none; b=BDBrzHVEfs4/GZWBM9jmlTRxmiXqKNFErXcusix5th7O0d2De7NBqVOrF2z/6ad+KCp8+KVbwRooU+7kUvaUiUNJnEJee0FDJnOF8MYoz/mqni6nEUTObs2RRasq6lWsRi3ovdNrdPodArKwomxkb4LtvNjSPZ///T9OoLtd1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740385065; c=relaxed/simple;
	bh=uDgeapE+u9xQ2fAdsGujzD/Puk6m2qptICyLkdANLA8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BK7DVAAyQ5zI9RDOTjRkGN46VJ6WD/WxM8hNZpnKpEQOYvAFaAknxKNahUpJkKUIisrz8uzZ07ASpAR6R1VNSaCobSdETJDwTHX7KE/gLRiFa31MUENidBs/t8BFZ5+SKada4c4kL5XgjXMAqK+Qles/Epe+fxxGaS5bo3LNXhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hcrawrSv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abbec6a0bfeso657407566b.2
        for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 00:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740385061; x=1740989861; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfD7KFYnMDv27c0uoXtQm9Ir0Bxe68Jv+7I6xEwLf/g=;
        b=hcrawrSvTIPK4RExHrLUAMpmwdZ+/QsyMiyChzjjiQLMFLwvxtUpPViNpEtRkMPg1o
         DfYtOs+gRtDFwbEON8GtrCp5B2PJodjaWBSbN91qrgxUfTL17SwBszWhprl6aMLdy5Bv
         NYw39OmoA3xgrf9Ze3Alws+Co/jg8/yfFPdO6He1kH+8/SDi1ztyN2hMcOwWdvlIyqg5
         vLfkaLF5BaLJ4dhPxGGoCnEP7+o1GV25I1HDJud4P1K9KRdPzZgaho5G56THuHe6iEXJ
         sgFzcTJn1tgSkauisyp5qkmv4jY1ZDs6GbfsLE9rjwO4erzkvLP0yZkA3OXiXSz8b20k
         7IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740385061; x=1740989861;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bfD7KFYnMDv27c0uoXtQm9Ir0Bxe68Jv+7I6xEwLf/g=;
        b=XHNbJLY90vB0Yldb6KFTTRZt0zmc4Uvp4ItzDkW8G8130sKgrHrZsangbkqtHwVazG
         W78q+QVmWSbaucqYm6CjOAq+6opoTwwudE1rTN1JSuRgXgB0fQZqHLpwIxQAas/w6oOA
         mIlazFruYjMMbTi5Vac/KEC47PAphCP81bhDVj3rGRr1H5Nvj889OWGkfH4G4XTH1RRa
         OpcwM5I2BqXlPgv8uCp293z/bEyXroLD0wZTz5r5JGXCrE333C3sff7vT0ONyZTcC169
         Yuo5B8PmGLq2/EKg4tnGK6D+oUi9/8Q7P4i7FnmXZL9sGR9FX+Q27BijThojbSg0GYQh
         2UZw==
X-Gm-Message-State: AOJu0YzJ6UITfQ4CiKpivB7U3/qcv4pZbJpbfFZK+zUiiDwLmVHQrtdq
	U5WvWDrXcVHv55upz/uLyKOuSA2a+MuSmS1yFvcdBrVnMFRbXz4BC8sHMvt3WzI=
X-Gm-Gg: ASbGncuZ8OsTAD5I99GlYO+dHT4Rx/v+Aayp4RkxIcvDEjH8f8wZo/IAxlH4wRg6i7n
	9/JtkV3Jpr14l7xaM7VMPLvGYNJnPed7RuX/KuqZ28RiHKGBt9UPGblXiia8RO4OW5r21FBcjaA
	PfUheYaI+yHnpMb2v7E5xD0ETtz9Mh3fyp5/+CXUeB8m0bJrsIg6lfDxRIfOrs3Hwi1JRmQJq8t
	RM4RHBOHPy+Ua9Q7wMjnkXcD1+Wv4ELDftL4oqQyZ76IcFw0NpOprYbsV9Ye4gYaoNnRBiOIwbO
	iXmV2nWaOZDaNU4iqCbzfyyE1i14Z61wpABQp1D47aG0FVRMKMB6lYkRojyZlkJfhq2o1ZE=
X-Google-Smtp-Source: AGHT+IH77rm3i63pT0fbrvDdXZxIocOQ5kE/dT9xh/Fhdo75tlaD60C/Ve4ZeKDjOXd+OvmeQ3TlTA==
X-Received: by 2002:a17:907:784b:b0:ab7:ea59:2120 with SMTP id a640c23a62f3a-abc099b3571mr1128009966b.10.1740385061365;
        Mon, 24 Feb 2025 00:17:41 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbddcbfd4fsm1026230366b.98.2025.02.24.00.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 00:17:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 09:17:40 +0100
Message-Id: <D80J0J4L40EP.TLRCGCLDU14O@fairphone.com>
Cc: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <phone-devel@vger.kernel.org>,
 <linux@mainlining.org>, <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v2 2/2] Input: goodix_berlin - Add support for Berlin-A
 series
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jens Reidel" <adrian@travitia.xyz>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bastien Nocera" <hadess@hadess.net>, "Hans de Goede"
 <hdegoede@redhat.com>, "Neil Armstrong" <neil.armstrong@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250214052959.222668-1-adrian@travitia.xyz>
 <20250214052959.222668-3-adrian@travitia.xyz>
In-Reply-To: <20250214052959.222668-3-adrian@travitia.xyz>

On Fri Feb 14, 2025 at 6:29 AM CET, Jens Reidel wrote:
> The current implementation of the goodix_berlin driver lacks support for
> revisions A and B of the Berlin IC. This change adds support for the
> gt9897 IC, which is a Berlin-A revision part.
>
> The differences between revision D and A are rather minor, a handful of
> address changes and a slightly larger read buffer. They were taken from
> the driver published by Goodix, which does a few more things that don't
> appear to be necessary for the touchscreen to work properly.
>
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Just wanted to confirm that v2 still works fine on my device after the
changes.

Thanks!

Regards
Luca

> ---
>  drivers/input/touchscreen/goodix_berlin.h     | 13 ++++++
>  .../input/touchscreen/goodix_berlin_core.c    | 15 ++++---
>  drivers/input/touchscreen/goodix_berlin_i2c.c |  9 +++-
>  drivers/input/touchscreen/goodix_berlin_spi.c | 45 ++++++++++++++-----
>  4 files changed, 61 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/to=
uchscreen/goodix_berlin.h
> index 38b6f9ddbdef..b186a7fb3586 100644
> --- a/drivers/input/touchscreen/goodix_berlin.h
> +++ b/drivers/input/touchscreen/goodix_berlin.h
> @@ -12,6 +12,19 @@
> =20
>  #include <linux/pm.h>
> =20
> +#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A	0x1000C
> +#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D	0x10014
> +
> +#define GOODIX_BERLIN_IC_INFO_ADDR_A		0x10068
> +#define GOODIX_BERLIN_IC_INFO_ADDR_D		0x10070
> +
> +struct goodix_berlin_ic_data {
> +	int fw_version_info_addr;
> +	int ic_info_addr;
> +	ssize_t read_dummy_len;
> +	ssize_t read_prefix_len;
> +};
> +
>  struct device;
>  struct input_id;
>  struct regmap;
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/inp=
ut/touchscreen/goodix_berlin_core.c
> index 3fc03cf0ca23..f9fbde63ab52 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -12,7 +12,7 @@
>   * to the previous generations.
>   *
>   * Currently the driver only handles Multitouch events with already
> - * programmed firmware and "config" for "Revision D" Berlin IC.
> + * programmed firmware and "config" for "Revision A/D" Berlin IC.
>   *
>   * Support is missing for:
>   * - ESD Management
> @@ -20,7 +20,7 @@
>   * - "Config" update/flashing
>   * - Stylus Events
>   * - Gesture Events
> - * - Support for older revisions (A & B)
> + * - Support for revision B
>   */
> =20
>  #include <linux/bitfield.h>
> @@ -28,6 +28,7 @@
>  #include <linux/input.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/sizes.h>
> @@ -53,10 +54,8 @@
> =20
>  #define GOODIX_BERLIN_DEV_CONFIRM_VAL		0xAA
>  #define GOODIX_BERLIN_BOOTOPTION_ADDR		0x10000
> -#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR	0x10014
> =20
>  #define GOODIX_BERLIN_IC_INFO_MAX_LEN		SZ_1K
> -#define GOODIX_BERLIN_IC_INFO_ADDR		0x10070
> =20
>  #define GOODIX_BERLIN_CHECKSUM_SIZE		sizeof(u16)
> =20
> @@ -297,9 +296,10 @@ static void goodix_berlin_power_off(struct goodix_be=
rlin_core *cd)
> =20
>  static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
>  {
> +	const struct goodix_berlin_ic_data *ic_data =3D device_get_match_data(c=
d->dev);
>  	int error;
> =20
> -	error =3D regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADD=
R,
> +	error =3D regmap_raw_read(cd->regmap, ic_data->fw_version_info_addr,
>  				&cd->fw_version, sizeof(cd->fw_version));
>  	if (error) {
>  		dev_err(cd->dev, "error reading fw version, %d\n", error);
> @@ -358,6 +358,7 @@ static int goodix_berlin_parse_ic_info(struct goodix_=
berlin_core *cd,
> =20
>  static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
>  {
> +	const struct goodix_berlin_ic_data *ic_data =3D device_get_match_data(c=
d->dev);
>  	u8 *afe_data __free(kfree) =3D NULL;
>  	__le16 length_raw;
>  	u16 length;
> @@ -367,7 +368,7 @@ static int goodix_berlin_get_ic_info(struct goodix_be=
rlin_core *cd)
>  	if (!afe_data)
>  		return -ENOMEM;
> =20
> -	error =3D regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
> +	error =3D regmap_raw_read(cd->regmap, ic_data->ic_info_addr,
>  				&length_raw, sizeof(length_raw));
>  	if (error) {
>  		dev_err(cd->dev, "failed get ic info length, %d\n", error);
> @@ -380,7 +381,7 @@ static int goodix_berlin_get_ic_info(struct goodix_be=
rlin_core *cd)
>  		return -EINVAL;
>  	}
> =20
> -	error =3D regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
> +	error =3D regmap_raw_read(cd->regmap, ic_data->ic_info_addr,
>  				afe_data, length);
>  	if (error) {
>  		dev_err(cd->dev, "failed get ic info data, %d\n", error);
> diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/inpu=
t/touchscreen/goodix_berlin_i2c.c
> index ad7a60d94338..7db234c74db8 100644
> --- a/drivers/input/touchscreen/goodix_berlin_i2c.c
> +++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
> @@ -46,15 +46,20 @@ static int goodix_berlin_i2c_probe(struct i2c_client =
*client)
>  	return 0;
>  }
> =20
> +static const struct goodix_berlin_ic_data gt9916_data =3D {
> +	.fw_version_info_addr =3D GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D,
> +	.ic_info_addr =3D GOODIX_BERLIN_IC_INFO_ADDR_D,
> +};
> +
>  static const struct i2c_device_id goodix_berlin_i2c_id[] =3D {
> -	{ "gt9916" },
> +	{ .name =3D "gt9916", .driver_data =3D (long)&gt9916_data },
>  	{ }
>  };
> =20
>  MODULE_DEVICE_TABLE(i2c, goodix_berlin_i2c_id);
> =20
>  static const struct of_device_id goodix_berlin_i2c_of_match[] =3D {
> -	{ .compatible =3D "goodix,gt9916", },
> +	{ .compatible =3D "goodix,gt9916", .data =3D &gt9916_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, goodix_berlin_i2c_of_match);
> diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/inpu=
t/touchscreen/goodix_berlin_spi.c
> index 0662e87b8692..a5e77e6585e8 100644
> --- a/drivers/input/touchscreen/goodix_berlin_spi.c
> +++ b/drivers/input/touchscreen/goodix_berlin_spi.c
> @@ -18,10 +18,14 @@
> =20
>  #define GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN	1
>  #define GOODIX_BERLIN_REGISTER_WIDTH		4
> -#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN	3
> -#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFI=
X_LEN + \
> +#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A	4
> +#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D	3
> +#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A	(GOODIX_BERLIN_SPI_TRANS_PRE=
FIX_LEN + \
>  						 GOODIX_BERLIN_REGISTER_WIDTH + \
> -						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN)
> +						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A)
> +#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_D	(GOODIX_BERLIN_SPI_TRANS_PRE=
FIX_LEN + \
> +						 GOODIX_BERLIN_REGISTER_WIDTH + \
> +						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D)
>  #define GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREF=
IX_LEN + \
>  						 GOODIX_BERLIN_REGISTER_WIDTH)
> =20
> @@ -33,6 +37,7 @@ static int goodix_berlin_spi_read(void *context, const =
void *reg_buf,
>  				  size_t val_size)
>  {
>  	struct spi_device *spi =3D context;
> +	const struct goodix_berlin_ic_data *ic_data =3D spi_get_device_match_da=
ta(spi);
>  	struct spi_transfer xfers;
>  	struct spi_message spi_msg;
>  	const u32 *reg =3D reg_buf; /* reg is stored as native u32 at start of =
buffer */
> @@ -42,23 +47,22 @@ static int goodix_berlin_spi_read(void *context, cons=
t void *reg_buf,
>  		return -EINVAL;
> =20
>  	u8 *buf __free(kfree) =3D
> -		kzalloc(GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size,
> -			GFP_KERNEL);
> +		kzalloc(ic_data->read_prefix_len + val_size, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
> =20
>  	spi_message_init(&spi_msg);
>  	memset(&xfers, 0, sizeof(xfers));
> =20
> -	/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
> +	/* buffer format: 0xF1 + addr(4bytes) + dummy(3/4bytes) + data */
>  	buf[0] =3D GOODIX_BERLIN_SPI_READ_FLAG;
>  	put_unaligned_be32(*reg, buf + GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN);
>  	memset(buf + GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + GOODIX_BERLIN_REGISTE=
R_WIDTH,
> -	       0xff, GOODIX_BERLIN_SPI_READ_DUMMY_LEN);
> +	       0xff, ic_data->read_dummy_len);
> =20
>  	xfers.tx_buf =3D buf;
>  	xfers.rx_buf =3D buf;
> -	xfers.len =3D GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size;
> +	xfers.len =3D ic_data->read_prefix_len + val_size;
>  	xfers.cs_change =3D 0;
>  	spi_message_add_tail(&xfers, &spi_msg);
> =20
> @@ -68,7 +72,7 @@ static int goodix_berlin_spi_read(void *context, const =
void *reg_buf,
>  		return error;
>  	}
> =20
> -	memcpy(val_buf, buf + GOODIX_BERLIN_SPI_READ_PREFIX_LEN, val_size);
> +	memcpy(val_buf, buf + ic_data->read_prefix_len, val_size);
>  	return error;
>  }
> =20
> @@ -123,6 +127,7 @@ static const struct input_id goodix_berlin_spi_input_=
id =3D {
> =20
>  static int goodix_berlin_spi_probe(struct spi_device *spi)
>  {
> +	const struct goodix_berlin_ic_data *ic_data =3D spi_get_device_match_da=
ta(spi);
>  	struct regmap_config regmap_config;
>  	struct regmap *regmap;
>  	size_t max_size;
> @@ -137,7 +142,7 @@ static int goodix_berlin_spi_probe(struct spi_device =
*spi)
>  	max_size =3D spi_max_transfer_size(spi);
> =20
>  	regmap_config =3D goodix_berlin_spi_regmap_conf;
> -	regmap_config.max_raw_read =3D max_size - GOODIX_BERLIN_SPI_READ_PREFIX=
_LEN;
> +	regmap_config.max_raw_read =3D max_size - ic_data->read_prefix_len;
>  	regmap_config.max_raw_write =3D max_size - GOODIX_BERLIN_SPI_WRITE_PREF=
IX_LEN;
> =20
>  	regmap =3D devm_regmap_init(&spi->dev, NULL, spi, &regmap_config);
> @@ -152,14 +157,30 @@ static int goodix_berlin_spi_probe(struct spi_devic=
e *spi)
>  	return 0;
>  }
> =20
> +static const struct goodix_berlin_ic_data gt9897_data =3D {
> +	.fw_version_info_addr =3D GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A,
> +	.ic_info_addr =3D GOODIX_BERLIN_IC_INFO_ADDR_A,
> +	.read_dummy_len =3D GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A,
> +	.read_prefix_len =3D GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A,
> +};
> +
> +static const struct goodix_berlin_ic_data gt9916_data =3D {
> +	.fw_version_info_addr =3D GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D,
> +	.ic_info_addr =3D GOODIX_BERLIN_IC_INFO_ADDR_D,
> +	.read_dummy_len =3D GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D,
> +	.read_prefix_len =3D GOODIX_BERLIN_SPI_READ_PREFIX_LEN_D,
> +};
> +
>  static const struct spi_device_id goodix_berlin_spi_ids[] =3D {
> -	{ "gt9916" },
> +	{ .name =3D "gt9897", .driver_data =3D (long)&gt9897_data },
> +	{ .name =3D "gt9916", .driver_data =3D (long)&gt9916_data },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, goodix_berlin_spi_ids);
> =20
>  static const struct of_device_id goodix_berlin_spi_of_match[] =3D {
> -	{ .compatible =3D "goodix,gt9916", },
> +	{ .compatible =3D "goodix,gt9897", .data =3D &gt9897_data },
> +	{ .compatible =3D "goodix,gt9916", .data =3D &gt9916_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, goodix_berlin_spi_of_match);


