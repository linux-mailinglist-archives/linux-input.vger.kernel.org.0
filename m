Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 686E472CB7C
	for <lists+linux-input@lfdr.de>; Mon, 12 Jun 2023 18:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbjFLQ1y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jun 2023 12:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbjFLQ1t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jun 2023 12:27:49 -0400
Received: from mail.gnu-linux.rocks (unknown [82.165.184.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F04A1739;
        Mon, 12 Jun 2023 09:27:45 -0700 (PDT)
Received: from localhost (ip5f5be8c3.dynamic.kabel-deutschland.de [95.91.232.195])
        by mail.gnu-linux.rocks (Postfix) with ESMTPSA id 902AD4027B;
        Mon, 12 Jun 2023 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnu-linux.rocks;
        s=mail; t=1686587263;
        bh=c/4JjmJ45ZkiQZgNYBFXe9OTRXvupIaPpAdcPeF4Qlk=;
        h=Date:Subject:From:To:Cc:From;
        b=d21DZCTcvAV7eVmnPtWr1W/JJyeD2Axbn5J2Y1vWesLZp2MW4YlwoesqpJUrkB/Y2
         1Z5ORW/WMi+03NivX1guxwFd9q4rx7FJWvtX2n39EGRyZe8smwtyDYkjw6FaqHV6v8
         xc3uGYQqR3uKXjt1PXF+78IQsQOwTZQKK1Y346nEqFdzKPPmD69QPVKzJijYEYyfCu
         QUiwFeHGDYmz+DVKERb5FsXFJMe+QBAuXjkuT+LtlHusmy82dTas4RvPU3OWuoErAS
         i3ozWiuf4mH8L6iHuavLAg5I3H8Wa48VPOPJk8BePSIfiT88sM8tj4giUpXkMha2yB
         BpvNbT2U7oxZA==
Date:   Mon, 12 Jun 2023 18:27:34 +0200
Message-ID: <1365bda1dccfa4b6f146c5a0551a803d.johannes@gnu-linux.rocks>
Subject: Re:Re: [PATCH 1/2] hid-mcp2200 added driver for MCP2200 GPIOs
From:   johannes@gnu-linux.rocks
To:     christophe.jaillet@wanadoo.fr
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
        RDNS_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

>Le 11/06/2023 à 18:48, Johannes Roith a écrit :
>> Added a gpiochip compatible driver to control the 8 GPIOs of the MCP2200
>> by using the HID interface.
>> 
>> Using GPIOs with alternative functions (GP0<->SSPND, GP1<->USBCFG,
>> GP6<->RXLED, GP7<->TXLED) will reset the functions, if set (unset by
>> default).
>> 
>> The driver was tested while also using the UART of the chip. Setting
>> and reading the GPIOs has no effect on the UART communication. However,
>> a reset is triggered after the CONFIGURE command. If the GPIO Direction
>> is constantly changed, this will affect the communication at low baud
>> rates. This is a hardware problem of the MCP2200 and is not caused by
>> the driver.
>> 
>> Signed-off-by: Johannes Roith <johannes@gnu-linux.rocks>
>
>Hi,
>
>a few nits below, should it help the review.
>
>[...]
>
>> --- /dev/null
>> +++ b/drivers/hid/hid-mcp2200.c
>> @@ -0,0 +1,421 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * MCP2200 - Microchip USB to GPIO bridge
>> + *
>> + * Copyright (c) 2023, Johannes Roith <johannes@gnu-linux.rocks>
>> + *
>> + * Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/22228A.pdf
>> + * App Note for HID: https://ww1.microchip.com/downloads/en/DeviceDoc/93066A.pdf
>> + */
>> +#include <linux/module.h>
>> +#include <linux/err.h>
>> +#include <linux/mutex.h>
>> +#include <linux/bitfield.h>
>
>Is this include needed?
>
>> +#include <linux/completion.h>
>> +#include <linux/delay.h>
>> +#include <linux/hid.h>
>> +#include <linux/hidraw.h>
>> +#include <linux/gpio/driver.h>
>
>Many maintainers prefer alphabetic order for includes.
>
>
>> +#include "hid-ids.h"
>> +
>> +/* Commands codes in a raw output report */
>> +enum {
>> +	SET_CLEAR_OUTPUTS = 0x08,
>> +	CONFIGURE = 0x10,
>> +	READ_EE = 0x20,
>> +	WRITE_EE = 0x40,
>> +	READ_ALL = 0x80
>> +};
>
>Does some
>	#define xxx BIT(n)
>would make more sense than this enum?
>
>> +
>> +/* MCP GPIO direction encoding */
>> +enum MCP_IO_DIR {
>> +	MCP2200_DIR_OUT = 0x00,
>> +	MCP2200_DIR_IN  = 0x01,
>> +};
>> +
>> +/* Altternative pin assignments */
>> +enum {
>> +	TXLED = 2,
>> +	RXLED = 3,
>> +	USBCFG = 6,
>> +	SSPND = 7,
>> +
>
>Uneeded new line.
>
>> +};
>> +
>> +#define MCP_NGPIO 8
>> +
>
>[...]
>
>> +/* this executes the READ_ALL cmd */
>> +static int mcp_cmd_read_all(struct mcp2200 *mcp)
>> +{
>> +	struct mcp_read_all *read_all;
>> +	int len, t;
>> +
>> +	reinit_completion(&mcp->wait_in_report);
>> +	mutex_lock(&mcp->lock);
>> +
>> +	read_all = kzalloc(sizeof(struct mcp_read_all), GFP_KERNEL);
>> +	if (!read_all)
>> +		return -ENOMEM;
>
>Allocation could be deone before the lock.
>
>> +
>> +	read_all->cmd = READ_ALL;
>> +	len = hid_hw_output_report(mcp->hdev, (u8 *) read_all,
>> +			sizeof(struct mcp_read_all));
>> +
>> +	if (len != sizeof(struct mcp_read_all))
>
>kfree(read_all); ?
>(or move the call just below before the test)
>
>> +		return -EINVAL;
>> +
>> +	kfree(read_all);
>> +	mutex_unlock(&mcp->lock);
>
>Mutex unlock could be done before kfree() or even before the "if 
>(len..." a few lines above.
>
>> +	t = wait_for_completion_timeout(&mcp->wait_in_report, msecs_to_jiffies(4000));
>> +	if (!t)
>> +		return -ETIMEDOUT;
>> +
>> +	/* return status, negative value if wrong response was received */
>> +	return mcp->status;
>> +}
>> +
>> +static void mcp_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>> +				  unsigned long *bits)
>> +{
>> +	struct mcp2200 *mcp = gpiochip_get_data(gc);
>> +	u8 value;
>> +	int status;
>> +	struct mcp_set_clear_outputs *cmd;
>> +
>> +	cmd = kzalloc(sizeof(struct mcp_set_clear_outputs), GFP_KERNEL);
>> +	if (!cmd)
>> +		return;
>> +
>> +	mutex_lock(&mcp->lock);
>> +
>> +	value = mcp->gpio_val & ~*mask;
>> +	value |= (*mask & *bits);
>> +
>> +	cmd->cmd = SET_CLEAR_OUTPUTS;
>> +	cmd->set_bmap = value;
>> +	cmd->clear_bmap = ~(value);
>> +
>> +	status = hid_hw_output_report(mcp->hdev, (u8 *) cmd,
>> +		       sizeof(struct mcp_set_clear_outputs));
>> +	if (status == sizeof(struct mcp_set_clear_outputs))
>> +		mcp->gpio_val = value;
>> +
>> +	kfree(cmd);
>> +	mutex_unlock(&mcp->lock);
>
>Mutex unlock could be done before kfree().
>
>> +}
>> +
>> +static void mcp_set(struct gpio_chip *gc, unsigned int gpio_nr, int value)
>> +{
>> +	unsigned long mask = (1 << gpio_nr);
>
>Uneeded ()
>Does using BIT makes sense here?
>
>> +	unsigned long bmap_value = (value<<gpio_nr);
>
>Uneeded () and missing spaces aoud <<
>
>> +
>> +	mcp_set_multiple(gc, &mask, &bmap_value);
>> +}
>> +
>> +static int mcp_get_multiple(struct gpio_chip *gc, unsigned long *mask,
>> +		unsigned long *bits)
>> +{
>> +	u32 val;
>> +	struct mcp2200 *mcp = gpiochip_get_data(gc);
>> +	int status;
>> +
>> +	status = mcp_cmd_read_all(mcp);
>> +	if (status != 0)
>> +		return status;
>> +
>> +	val = mcp->gpio_inval;
>> +	*bits = (val & *mask);
>> +	return 0;
>> +}
>> +
>> +static int mcp_get(struct gpio_chip *gc, unsigned int gpio_nr)
>> +{
>> +	unsigned long mask = 0, bits = 0;
>
>No need to init long (and maybe bits)
>
>> +
>> +	mask = (1 << gpio_nr);
>
>Uneeded ()
>Does using BIT makes sense here?
>
>> +	mcp_get_multiple(gc, &mask, &bits);
>> +	return (bits > 0) ? 1 : 0;
>> +}
>> +
>> +static int mcp_get_direction(struct gpio_chip *gc, unsigned int gpio_nr)
>> +{
>> +	struct mcp2200 *mcp = gpiochip_get_data(gc);
>> +
>> +	return (mcp->gpio_dir & (MCP2200_DIR_IN << gpio_nr))
>> +		? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
>> +}
>> +
>> +static int mcp_set_direction(struct gpio_chip *gc, unsigned int gpio_nr,
>> +		enum MCP_IO_DIR io_direction)
>> +{
>> +	struct mcp2200 *mcp = gpiochip_get_data(gc);
>> +	struct mcp_configure *conf;
>> +	int status;
>> +	/* after the configure cmd we will need to set the outputs again */
>> +	unsigned long mask = ~(mcp->gpio_dir); /* only set outputs */
>> +	unsigned long bits = mcp->gpio_val;
>> +	/* Offsets of alternative pins in config_alt_pins, 0 is not used */
>> +	u8 alt_pin_conf[8] = {SSPND, USBCFG, 0, 0, 0, 0, RXLED, TXLED};
>> +	u8 config_alt_pins = mcp->config_alt_pins;
>> +
>> +	/* Read in the reset baudrate first, we need it later */
>> +	status = mcp_cmd_read_all(mcp);
>> +	if (status != 0)
>> +		return status;
>> +
>> +	conf = kzalloc(sizeof(struct mcp_configure), GFP_KERNEL);
>> +	if (!conf)
>> +		return -ENOMEM;
>> +	mutex_lock(&mcp->lock);
>> +
>> +	/* configure will reset the chip! */
>> +	conf->cmd = CONFIGURE;
>> +	conf->io_bmap = (mcp->gpio_dir & ~(1 << gpio_nr))
>> +		| (io_direction << gpio_nr);
>> +	/* Don't overwrite the reset parameters */
>> +	conf->baud_h = mcp->baud_h;
>> +	conf->baud_l = mcp->baud_l;
>> +	conf->config_alt_options = mcp->config_alt_options;
>> +	conf->io_default_val_bmap = mcp->gpio_reset_val;
>> +	/* Adjust alt. func if necessary */
>> +	if (alt_pin_conf[gpio_nr])
>> +		config_alt_pins &= ~(1 << alt_pin_conf[gpio_nr]);
>> +	conf->config_alt_pins = config_alt_pins;
>> +
>> +	status = hid_hw_output_report(mcp->hdev, (u8 *) conf,
>> +			sizeof(struct mcp_set_clear_outputs));
>> +	if (status == sizeof(struct mcp_set_clear_outputs)) {
>> +		mcp->gpio_dir &= ~(1 << gpio_nr);
>> +		mcp->config_alt_pins = config_alt_pins;
>> +	} else {
>> +		return -EIO;
>> +	}
>> +
>> +	kfree(conf);
>> +	mutex_unlock(&mcp->lock);
>
>Mutex unlock could be done before kfree().
>
>> +
>> +	/* Configure CMD will clear all IOs -> rewrite them */
>> +	mcp_set_multiple(gc, &mask, &bits);
>> +	return 0;
>> +}
>> +
>> +static int mcp_direction_input(struct gpio_chip *gc, unsigned int gpio_nr)
>> +{
>> +	return mcp_set_direction(gc, gpio_nr, MCP2200_DIR_IN);
>> +}
>> +
>> +static int mcp_direction_output(struct gpio_chip *gc, unsigned int gpio_nr,
>> +		int value)
>> +{
>> +	int ret;
>> +	unsigned long mask, bmap_value;
>> +
>> +	mask = (1 << gpio_nr);
>
>Uneeded ()
>Does using BIT makes sense here?
>
>> +	bmap_value = (value << gpio_nr);
>
>Uneeded ()
>
>> +
>> +	ret = mcp_set_direction(gc, gpio_nr, MCP2200_DIR_OUT);
>> +	if (ret == 0)
>> +		mcp_set_multiple(gc, &mask, &bmap_value);
>> +	return ret;
>> +}
>> +
>> +
>
>No need for 2 new lines.
>
>[...]
>
>> +static int mcp2200_probe(struct hid_device *hdev, const struct hid_device_id *id)
>> +{
>> +	int ret;
>> +	struct mcp2200 *mcp;
>> +
>> +	mcp = devm_kzalloc(&hdev->dev, sizeof(*mcp), GFP_KERNEL);
>> +	if (!mcp)
>> +		return -ENOMEM;
>> +
>> +	ret = hid_parse(hdev);
>> +	if (ret) {
>> +		hid_err(hdev, "can't parse reports\n");
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * This driver uses the .raw_event callback and therefore does not need any
>> +	 * HID_CONNECT_xxx flags.
>> +	 */
>> +	ret = hid_hw_start(hdev, 0);
>> +	if (ret) {
>> +		hid_err(hdev, "can't start hardware\n");
>> +		return ret;
>> +	}
>> +
>> +	hid_info(hdev, "USB HID v%x.%02x Device [%s] on %s\n", hdev->version >> 8,
>> +			hdev->version & 0xff, hdev->name, hdev->phys);
>> +
>> +	ret = hid_hw_open(hdev);
>> +	if (ret) {
>> +		hid_err(hdev, "can't open device\n");
>> +		hid_hw_stop(hdev);
>> +		return ret;
>> +	}
>> +
>> +	mutex_init(&mcp->lock);
>> +	init_completion(&mcp->wait_in_report);
>> +	hid_set_drvdata(hdev, mcp);
>> +	mcp->hdev = hdev;
>> +
>> +	ret = devm_add_action_or_reset(&hdev->dev, mcp2200_hid_unregister, hdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mcp->gc = template_chip;
>> +	mcp->gc.parent = &hdev->dev;
>> +
>> +	ret = gpiochip_add_data(&mcp->gc, mcp);
>
>devm_gpiochip_add_data() and no .remove function?
>
>> +	if (ret < 0) {
>> +		dev_err(&hdev->dev, "Unable to register gpiochip\n");
>
>hid_err() to be consistent?
>
>> +		hid_hw_stop(hdev);
>
>hid_hw_stop() would be called twice. Once here and once because of the 
>devm_add_action_or_reset() above.
>
>
>Just my 2c,
>
>CJ
>
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>
>[...]
>

Hi,

thanks for your feedback. I have added most of it in my Kernel module. For the
view things, I haven't added, I add a comment under your comment.

I am sorry for the error in hid-ids.h. It seems I forgot to run a git add hid-ids.h
to rename the second USB_DEVICE_ID_MCP2221 into USB_DEVICE_ID_MCP2200. 

What do you think is the best way to deliver my driver? Should I create a new
patch containg everything I have changed or should I go with the two already
created patches, reorder them, fixing the error in hid-ids.h and adding a new
patch including the comments from your review? This is my first contribution,
that's why I am asking.

Best regards,
Johannes
