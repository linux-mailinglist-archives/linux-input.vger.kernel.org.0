Return-Path: <linux-input+bounces-6759-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC64987398
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 14:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F00B4284E25
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 12:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49304380;
	Thu, 26 Sep 2024 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="BvxJ/+MY"
X-Original-To: linux-input@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB857F6;
	Thu, 26 Sep 2024 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353851; cv=none; b=ikqpIaMid6XdA5mpjQtH6MWJVCN9IvRdAPMOIbs42JEOVgI3HPfx81JoxZO3USk64rJrtT2fS6L+/Zu1ivWe60Hs9kpd0umlaA0mbM+Xkqa8qIioz6/C6l/Aa5tPMagmQp6ZP4AOxIuzf5TomY/stjtWZ9apfVKiOJNrl7E+hnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353851; c=relaxed/simple;
	bh=sYsmuHhkc5sLuoGjv09OoclR0SGCJyGi9P+GMjSt8KY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cqumhLLl7ZwM5I+a6qaApaG03zEvEnjDUVru0Cp1xC68vV7yX5wNmabf3dtjXnvsgLbuYw4AJqAAtAJKeV4AJdPRGs14wD0cRkIN2WBsfrTrijvphiajiBAeb4IqkWQ3sU9kUd7fHUMVFo5DN8lj88YgJJhwavVmDqgWbL6DePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=BvxJ/+MY; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=USx5QzEI7V1MRWbv6N+Jwu9RbGTb9McEAkDlk/2vuxk=; t=1727353849; x=1727958649; 
	b=BvxJ/+MYuQm3eRgZzLhkyZBP5pTd8JTd4iTcbkGvFtAQhegdWKHszvr0pMwNJmEu2McLKzPNFyC
	nMk9x6dYuAvVJSVFElR8KC4Fn21KuoSTIcZWSTx1a+Flml1nYPn/CBa+R3i0rRO/9PpKYsvOJ/tLU
	LJTenGjdXkHWAD4OKysJsld8zZCYMIxbcCqSAWHCXc8yRI2ek7mnwVvmQxU/QqK+bbQHCeQEXfS6m
	5A2lEV62BXfb0BMGEY5dEo/UNGtdcFiSntylipEOo4RU47rNxgjEadEDjQmQRA6iOm9T51L2PALih
	Wl22Yn4tFwCKp217jT9YR3/1MbyR/2xNTpxg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1stndu-00000001ik0-1aG5; Thu, 26 Sep 2024 14:30:46 +0200
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1stndu-00000003Ilc-0hrs; Thu, 26 Sep 2024 14:30:46 +0200
Message-ID: <f2f98a4e626e15ebf747f5564557f23405e69e92.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] sh: ecovec24: use static device properties to describe
 the touchscreen
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Yoshinori Sato
	 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Date: Thu, 26 Sep 2024 14:30:45 +0200
In-Reply-To: <ZsVKmnjxdnKBLvju@google.com>
References: <ZsVKmnjxdnKBLvju@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Dmitry,

On Tue, 2024-08-20 at 19:02 -0700, Dmitry Torokhov wrote:
> Convert the board to use static device properties instead of platform
> data to describe the touchscreen, so that support for platform data can
> be removed from tsc2007 driver (ecovec24 is the last board using this
> mechanism of describing tsc2007).
>=20
> Device properties do not allow custom board methods, so the method for
> getting "pen down" state was removed (the driver is capable of working
> without it). If this functionality is needed proper pin control/gpio
> support needs to be implemented so that the same pin can serve as an
> input GPIO and an interrupt.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  arch/sh/boards/mach-ecovec24/setup.c | 38 ++++++++--------------------
>  1 file changed, 11 insertions(+), 27 deletions(-)
>=20
> diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-e=
covec24/setup.c
> index 6f13557eecd6..4833bec0c3c5 100644
> --- a/arch/sh/boards/mach-ecovec24/setup.c
> +++ b/arch/sh/boards/mach-ecovec24/setup.c
> @@ -26,6 +26,7 @@
>  #include <linux/platform_data/tmio.h>
>  #include <linux/platform_data/tsc2007.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regulator/fixed.h>
>  #include <linux/regulator/machine.h>
>  #include <linux/sh_eth.h>
> @@ -589,39 +590,21 @@ static struct platform_device keysc_device =3D {
>  /* TouchScreen */
>  #define IRQ0 evt2irq(0x600)
> =20
> -static int ts_get_pendown_state(struct device *dev)
> -{
> -	int val =3D 0;
> -	gpio_free(GPIO_FN_INTC_IRQ0);
> -	gpio_request(GPIO_PTZ0, NULL);
> -	gpio_direction_input(GPIO_PTZ0);
> -
> -	val =3D gpio_get_value(GPIO_PTZ0);
> -
> -	gpio_free(GPIO_PTZ0);
> -	gpio_request(GPIO_FN_INTC_IRQ0, NULL);
> -
> -	return val ? 0 : 1;
> -}
> -
> -static int ts_init(void)
> -{
> -	gpio_request(GPIO_FN_INTC_IRQ0, NULL);
> -	return 0;
> -}
> +static const struct property_entry tsc2007_properties[] =3D {
> +	PROPERTY_ENTRY_U32("ti,x-plate-ohms", 180),
> +	{ }
> +};
> =20
> -static struct tsc2007_platform_data tsc2007_info =3D {
> -	.model			=3D 2007,
> -	.x_plate_ohms		=3D 180,
> -	.get_pendown_state	=3D ts_get_pendown_state,
> -	.init_platform_hw	=3D ts_init,
> +static const struct software_node tsc2007_swnode =3D {
> +	.name =3D "tsc2007",
> +	.properties =3D tsc2007_properties,
>  };
> =20
>  static struct i2c_board_info ts_i2c_clients =3D {
>  	I2C_BOARD_INFO("tsc2007", 0x48),
>  	.type		=3D "tsc2007",
> -	.platform_data	=3D &tsc2007_info,
>  	.irq		=3D IRQ0,
> +	.swnode		=3D &tsc2007_swnode,
>  };
> =20
>  static struct regulator_consumer_supply cn12_power_consumers[] =3D
> @@ -1241,8 +1224,9 @@ static int __init arch_setup(void)
>  		gpio_direction_output(GPIO_PTF4, 1);
> =20
>  		/* enable TouchScreen */
> -		i2c_register_board_info(0, &ts_i2c_clients, 1);
> +		gpio_request(GPIO_FN_INTC_IRQ0, NULL);
>  		irq_set_irq_type(IRQ0, IRQ_TYPE_LEVEL_LOW);
> +		i2c_register_board_info(0, &ts_i2c_clients, 1);
>  	}
> =20
>  	/* enable CEU0 */
> --=20
> 2.46.0.184.g6999bdac58-goog

Thanks for your patch!

I am not 100% sure whether removing the method for "pen down" won't have
any negative impact on the driver capabilities.

Could you elaborate on this change a little more? Sorry for being so late!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

