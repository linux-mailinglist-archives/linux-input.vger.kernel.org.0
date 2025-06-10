Return-Path: <linux-input+bounces-12769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E248EAD41CB
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 20:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE3E189C299
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 18:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07F723BD0C;
	Tue, 10 Jun 2025 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcQCf/A8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C7C236429;
	Tue, 10 Jun 2025 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579344; cv=none; b=rkEIwnOpeJeGSALdBzpo0tc1W/KG3LZqSbta2vIi3xrEBL+nKnESOfDnDt3K5Z0nvneOFCsAn39R7xnMxWLSQpSvXwKLXPTrKkcSB6chzbqk+FqXlRsJ3Mw/DRLr1ubaLMGIP7NrLMPuPB5cN0SeqShA2fL87v8vpEVwHIEi2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579344; c=relaxed/simple;
	bh=5zhnt1c0lZT3OLH7CzVt7TZ9CQ82Lt78WV/RF/ijulU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtb2yAvfZbE0w/KN7ijo4TCG6tZ8qHGSvLQjjZPW+uQoD3OjhvQKPCUvT/62LT1FhcNMNrxsWjfZP3kgllplPbucl82w2JxHw03uEd3im5op0RjMVrH0M5nHB0lHAXS5kIwPld8t/Tl2NLhV8d5+PVGsi67zFm+Fkc3irtT0ju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcQCf/A8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F16C4CEED;
	Tue, 10 Jun 2025 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749579343;
	bh=5zhnt1c0lZT3OLH7CzVt7TZ9CQ82Lt78WV/RF/ijulU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcQCf/A8aRdQcOkf9YgLLFbg0vq14IlRcZyxzsxaFgdIqC3cWb8++rEN/gyHvLZtm
	 mpysfcNEiDr4Gq/+1a1yJe+aGTC+cfYpEwhZ7+zCj29NKeRTUq1j6a7+SJUEFQ1hSW
	 X/vnfmEmVi9hRIl2A3AQmYev4iBoTwt4fSSz56taUjqG+EWZ8ipkx4wnQCR3eiAMZS
	 G4Po/STLKg24RmmuUfPTngUhRxwwxk7XoDKqa4U/AAA30KUCsTJtGLqTPnXdBikBCZ
	 at+BQwW2WsQUb5AGyWOMoexnChYPlxTEQ0gg1zfSu0bD6ov1q2JP3Y98AJiryzh6m9
	 MuzB0mBdfOUIg==
Date: Tue, 10 Jun 2025 13:15:42 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?VG9tw6HFoSBKdcWZZW5h?= <jurenatomas@gmail.com>
Cc: dmitry.torokhov@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <20250610181542.GA2396962-robh@kernel.org>
References: <20250610154609.1382818-1-jurenatomas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610154609.1382818-1-jurenatomas@gmail.com>

On Tue, Jun 10, 2025 at 05:46:10PM +0200, Tomáš Juřena wrote:
> From: Tomas Jurena <jurenatomas@gmail.com>
> 
> Adds support for instantiating the tca6416-keypad driver via
> Device Tree. If no platform data is present, the driver can now be
> probed based on OF bindings.
> 
> A corresponding Device Tree binding document is added at:
>   Documentation/devicetree/bindings/input/tca6416-keypad.yaml
> 
> This allows the driver to be used in systems that rely solely on the
> Device Tree for hardware description, such as embedded ARM platforms.
> 
> Tested on Toradex Ixora 1.3A board and Apalis imx8 SOM.

We already have a GPIO driver for this chip. Would the 
gpio-keys driver work here instead? Seems to work for 
arch/arm/boot/dts/ti/omap/am3517-evm-ui.dtsi.

> 
> Signed-off-by: Tomas Jurena <jurenatomas@gmail.com>
> ---
>  .../bindings/input/tca6416-keypad.yaml        | 87 ++++++++++++++++++

Bindings should be a separate patch.

>  drivers/input/keyboard/tca6416-keypad.c       | 88 +++++++++++++++++--
>  2 files changed, 170 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/tca6416-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/tca6416-keypad.yaml b/Documentation/devicetree/bindings/input/tca6416-keypad.yaml
> new file mode 100644
> index 000000000000..f050403c4dbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/tca6416-keypad.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/tca6416-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI TCA6416 keypad
> +
> +maintainers:
> +
> +description: |

Don't need '|'

> +  Texas Instruments TCA6416 IO expander as a keypad input device.
> +
> +allOf:
> +  - $ref: input.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tca6416_keys
> +      - ti,tca6408_keys
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  linux,gpio-keymap:

linux,keymap

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      Array of gpio keys provided by the driver instance. Each entry is a
> +      bitfield holding configuration of the input key. The bitfield looks like
> +      this:
> +      +------------------------------------------------------------+
> +      | Bits     | 31:18    |         17 | 16:14 | 13:10    | 9:0  |
> +      | Function | reserved | active_low | type  | reserved | code |
> +      +------------------------------------------------------------+
> +      code - Linux key code
> +      type - EV_KEY or EV_SW
> +      active_low - Key is active in low state
> +
> +  linux,keycodes:
> +    minItems: 1
> +    maxItems: 16
> +
> +  autorepeat:
> +    type: boolean
> +    description: |
> +      Enables the Linux input system's autorepeat feature on the input device.
> +
> +  polling:
> +    type: boolean
> +    description: |
> +      Forces driver to use polling mode instead of IRQ.
> +
> +  pinmask:
> +    description: |
> +      Allows to disable certain keys. By default are all inputs enabled.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      keypad@21 {
> +        compatible = "ti,tca6416_keys";
> +        reg = <0x21>;
> +        interrupt-parent = <&gpio>;
> +        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +        linux,gpio-keymap = <
> +                            0x24290, // active low, EV_KEY, 0, KEY_MACRO1
> +                            0x24291, // active low, EV_KEY, 1, KEY_MACRO2
> +                            0x24292, // active low, EV_KEY, 2, KEY_MACRO3
> +        >;
> +      };
> +    };
> +
> +...
> diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
> index fbc674d7b9f0..8910498cf266 100644
> --- a/drivers/input/keyboard/tca6416-keypad.c
> +++ b/drivers/input/keyboard/tca6416-keypad.c
> @@ -17,6 +17,7 @@
>  #include <linux/i2c.h>
>  #include <linux/input.h>
>  #include <linux/tca6416_keypad.h>
> +#include <linux/bitfield.h>
>  
>  #define TCA6416_INPUT          0
>  #define TCA6416_OUTPUT         1
> @@ -24,6 +25,7 @@
>  #define TCA6416_DIRECTION      3
>  
>  #define TCA6416_POLL_INTERVAL	100 /* msec */
> +#define TCA6416_MAX_IO_SIZE 16 /* maximum number of inputs */
>  
>  static const struct i2c_device_id tca6416_id[] = {
>  	{ "tca6416-keys", 16, },
> @@ -173,9 +175,67 @@ static int tca6416_setup_registers(struct tca6416_keypad_chip *chip)
>  	return 0;
>  }
>  
> +/* Configuration bitmap
> + * | 31:18    |         17 | 16:14 | 13:10    | 9:0  |
> + * | reserved | active_low | type  | reserved | code |
> + */
> +#define CFG_CODE GENMASK(9, 0)
> +#define CFG_TYPE GENMASK(16, 14)
> +#define CFG_ACTIVE_LOW BIT(17)
> +
> +static struct tca6416_keys_platform_data *
> +tca6416_parse_properties(struct device *dev, uint8_t io_size)
> +{
> +	static const char keymap_property[] = "linux,gpio-keymap";
> +	struct tca6416_keys_platform_data *pdata;
> +	u32 keymap[TCA6416_MAX_IO_SIZE];
> +	struct tca6416_button *buttons;
> +	int ret, i;
> +	u8 pin;
> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return NULL;
> +
> +	ret = device_property_count_u32(dev, keymap_property);
> +	if (ret <= 0)
> +		return NULL;
> +
> +	pdata->nbuttons = ret;
> +	if (pdata->nbuttons > io_size)
> +		pdata->nbuttons = io_size;
> +
> +	ret = device_property_read_u32_array(dev, keymap_property, keymap,
> +					     pdata->nbuttons);
> +	if (ret)
> +		return NULL;
> +
> +	buttons = devm_kcalloc(dev, pdata->nbuttons, sizeof(*buttons),
> +			       GFP_KERNEL);
> +	if (!buttons)
> +		return NULL;
> +
> +	for (i = 0; i < pdata->nbuttons; i++) {
> +		buttons[i].code = FIELD_GET(CFG_CODE, keymap[i]);
> +		buttons[i].type = FIELD_GET(CFG_TYPE, keymap[i]);
> +		buttons[i].active_low = FIELD_GET(CFG_ACTIVE_LOW, keymap[i]);
> +		/* enable all inputs by default */
> +		pdata->pinmask |= BIT(i);
> +	}
> +
> +	pdata->buttons = buttons;
> +
> +	pdata->rep = device_property_read_bool(dev, "autorepeat");
> +	/* we can ignore the result as by default all inputs are enabled */
> +	device_property_read_u16(dev, "pinmask", &pdata->pinmask);
> +	pdata->use_polling = device_property_read_bool(dev, "polling");
> +
> +	return pdata;
> +}
> +
>  static int tca6416_keypad_probe(struct i2c_client *client)
>  {
> -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +	uint8_t io_size = (uintptr_t)i2c_get_match_data(client);
>  	struct tca6416_keys_platform_data *pdata;
>  	struct tca6416_keypad_chip *chip;
>  	struct input_dev *input;
> @@ -190,9 +250,13 @@ static int tca6416_keypad_probe(struct i2c_client *client)
>  	}
>  
>  	pdata = dev_get_platdata(&client->dev);
> -	if (!pdata) {
> -		dev_dbg(&client->dev, "no platform data\n");
> -		return -EINVAL;
> +	if (!pdata && dev_fwnode(&client->dev)) {
> +		pdata = tca6416_parse_properties(&client->dev, io_size);
> +		if (!pdata) {
> +			dev_err(&client->dev,
> +				"Failed to parse device configuration from properties\n");
> +			return -EINVAL;
> +		}
>  	}
>  
>  	chip = devm_kzalloc(&client->dev,
> @@ -207,7 +271,7 @@ static int tca6416_keypad_probe(struct i2c_client *client)
>  
>  	chip->client = client;
>  	chip->input = input;
> -	chip->io_size = id->driver_data;
> +	chip->io_size = io_size;
>  	chip->pinmask = pdata->pinmask;
>  	chip->use_polling = pdata->use_polling;
>  
> @@ -279,9 +343,23 @@ static int tca6416_keypad_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> +static const struct of_device_id tca6416_of_match[] = {
> +	{
> +		.compatible = "ti,tca6416_keys",
> +		.data = (void *)16,
> +	},
> +	{
> +		.compatible = "ti,tca6408_keys",
> +		.data = (void *)8,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tca6416_of_match);
> +
>  static struct i2c_driver tca6416_keypad_driver = {
>  	.driver = {
>  		.name	= "tca6416-keypad",
> +		.of_match_table = tca6416_of_match,
>  	},
>  	.probe		= tca6416_keypad_probe,
>  	.id_table	= tca6416_id,
> -- 
> 2.34.1
> 

