Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C7F610BB1
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 09:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiJ1H40 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 03:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiJ1H4Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 03:56:25 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3277D1C25DD
        for <linux-input@vger.kernel.org>; Fri, 28 Oct 2022 00:56:21 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id a14so5908036wru.5
        for <linux-input@vger.kernel.org>; Fri, 28 Oct 2022 00:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=55hNN5mhpCWeHJ4e5MA2/BSL4HhBVDTBm24dvTShODs=;
        b=dMVqaezhDfVty06p6YEd1udG9b6t3d7tZZnZrnQ/10e09pzhN/HhuIdPhGd2WYoOuO
         w0lzU/JGILKJwL83ccSq0ghaHJn83VeQiZpZTj7RdXbav6ORcBuCLiDmlg5FR0aAyOyr
         i6Zx5K4SsgNNscIoSuE4rKkCEsTRQ4gPwYITDK+MBnM6SPGFLn9p7qRuh8zGq9FR2q0e
         wvJEaD7+rXGJ7vrlVPEhplw/WeiZKFVLFc3B+VXl/5Tfbf1Ux4l+dgkdaFmk4ivYQcRo
         097JogegHIHvZU7VNjW8Yqe9y3xkDKp3amApkDIvGfcaM/sIMMcPqor6kdgV+wppwsQL
         PIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55hNN5mhpCWeHJ4e5MA2/BSL4HhBVDTBm24dvTShODs=;
        b=x9Rst1zhgGgh2rz9QlDxJNlSwUU7js8BfTaY2uBkXd3k4Lfg1VhFcr5E1JAoqQCye0
         et0592uSd2DqDMhwFuULShQFfcbpdV8+ZvWhlBu+T0xhqKBhDpMLZy4qXdTp8Uz299fs
         C5zRHdG+34G4mGpISNj7JBEsYc6yex3DcIu01tdeYPp888AajloojAyFtaNQbpNx6AKG
         GnqDZ8pY89akViULeQ/V/e+tyMDlqhm/1cYbKcWfG9esmrzCiYyN2+x7HUIVS8woMbsu
         E0AkmjqNKKYtWbvyxyZIPQbkvk56PIQDbiH+g68sR2tckkGgUIvZpScgJTSWPIhGbpff
         4atA==
X-Gm-Message-State: ACrzQf0rkMCvVr9o5a8iFZ0u5jRJr6U1GjdWW9IIEn4tygyzBv3h4rnl
        npPy/T034TLdTh4JwfL4Q0LfyA==
X-Google-Smtp-Source: AMsMyM5c9vvueTNOYTC7ET7VRSsdz3JUuHEtIUyvwfmfvwxSU0UuCDdtS8WBjs4lgdnib3q37rinZA==
X-Received: by 2002:a05:6000:1109:b0:236:5d1f:5198 with SMTP id z9-20020a056000110900b002365d1f5198mr20653186wrw.22.1666943779543;
        Fri, 28 Oct 2022 00:56:19 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:98b2:dc79:fe90:6dad])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b003a8434530bbsm7206955wmq.13.2022.10.28.00.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:56:18 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: Re: [PATCH v3 1/7] Input: iqs7222 - drop unused device node references
In-Reply-To: <Y1SRJIQ3WPwNpC0K@nixie71>
References: <Y1SRJIQ3WPwNpC0K@nixie71>
Date:   Fri, 28 Oct 2022 09:56:18 +0200
Message-ID: <87r0ystm8t.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On sam., oct. 22, 2022 at 19:56, Jeff LaBundy <jeff@labundy.com> wrote:

> Each call to device/fwnode_get_named_child_node() must be matched
> with a call to fwnode_handle_put() once the corresponding node is
> no longer in use. This ensures a reference count remains balanced
> in the case of dynamic device tree support.
>
> Currently, the driver never calls fwnode_handle_put(). Solve this
> problem by moving the node handling from iqs7222_parse_props() to
> the new iqs7222_parse_reg_grp(), leaving the former to do nothing
> but parse properties. The latter then manages the reference count
> in a single location and consistent fashion.
>
> This change drastically simplifies iqs7222_parse_all(), which can
> then call iqs7222_parse_reg_grp() on every register group without
> having to treat each register group differently.
>
> For nested event nodes, common parsing code has been factored out
> to the new iqs7222_parse_event() so as to allow the event node to
> be dropped from as few locations as possible.
>
> As part of this refactor, the 'linux,code' property has been made
> optional. This enables applications that define an event with the
> sole purpose of enabling a GPIO.
>
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
> Changes in v3:
>  - Updated iqs7222_parse_reg_grp() to call iqs7222_parse_props() for all
>    register groups in order to drop the same call from every instance of
>    iqs7222_parse_extra()
>  - Out of an abundance of caution, opted to drop previous Reviewed-by as
>    the change was non-trivial
>
> Changes in v2:
>  - Created new iqs7222_parse_reg_grp() and iqs7222_parse_event() helpers
>    to prevent multiple goto statements and calls to fwnode_handle_put()
>  - Updated commit message
>
>  drivers/input/misc/iqs7222.c | 340 +++++++++++++++--------------------
>  1 file changed, 146 insertions(+), 194 deletions(-)
>
> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> index ddb863bf63ee..ca02fea9be59 100644
> --- a/drivers/input/misc/iqs7222.c
> +++ b/drivers/input/misc/iqs7222.c
> @@ -105,14 +105,14 @@ enum iqs7222_reg_grp_id {
>  	IQS7222_NUM_REG_GRPS
>  };
>  
> -static const char * const iqs7222_reg_grp_names[] = {
> +static const char * const iqs7222_reg_grp_names[IQS7222_NUM_REG_GRPS] = {
>  	[IQS7222_REG_GRP_CYCLE] = "cycle",
>  	[IQS7222_REG_GRP_CHAN] = "channel",
>  	[IQS7222_REG_GRP_SLDR] = "slider",
>  	[IQS7222_REG_GRP_GPIO] = "gpio",
>  };
>  
> -static const unsigned int iqs7222_max_cols[] = {
> +static const unsigned int iqs7222_max_cols[IQS7222_NUM_REG_GRPS] = {
>  	[IQS7222_REG_GRP_STAT] = IQS7222_MAX_COLS_STAT,
>  	[IQS7222_REG_GRP_CYCLE] = IQS7222_MAX_COLS_CYCLE,
>  	[IQS7222_REG_GRP_GLBL] = IQS7222_MAX_COLS_GLBL,
> @@ -1567,56 +1567,17 @@ static int iqs7222_gpio_select(struct iqs7222_private *iqs7222,
>  }
>  
>  static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
> -			       struct fwnode_handle **child_node,
> -			       int child_index,
> +			       struct fwnode_handle *reg_grp_node,
> +			       int reg_grp_index,
>  			       enum iqs7222_reg_grp_id reg_grp,
>  			       enum iqs7222_reg_key_id reg_key)
>  {
> -	u16 *setup = iqs7222_setup(iqs7222, reg_grp, child_index);
> +	u16 *setup = iqs7222_setup(iqs7222, reg_grp, reg_grp_index);
>  	struct i2c_client *client = iqs7222->client;
> -	struct fwnode_handle *reg_grp_node;
> -	char reg_grp_name[16];
>  	int i;
>  
> -	switch (reg_grp) {
> -	case IQS7222_REG_GRP_CYCLE:
> -	case IQS7222_REG_GRP_CHAN:
> -	case IQS7222_REG_GRP_SLDR:
> -	case IQS7222_REG_GRP_GPIO:
> -	case IQS7222_REG_GRP_BTN:
> -		/*
> -		 * These groups derive a child node and return it to the caller
> -		 * for additional group-specific processing. In some cases, the
> -		 * child node may have already been derived.
> -		 */
> -		reg_grp_node = *child_node;
> -		if (reg_grp_node)
> -			break;
> -
> -		snprintf(reg_grp_name, sizeof(reg_grp_name), "%s-%d",
> -			 iqs7222_reg_grp_names[reg_grp], child_index);
> -
> -		reg_grp_node = device_get_named_child_node(&client->dev,
> -							   reg_grp_name);
> -		if (!reg_grp_node)
> -			return 0;
> -
> -		*child_node = reg_grp_node;
> -		break;
> -
> -	case IQS7222_REG_GRP_GLBL:
> -	case IQS7222_REG_GRP_FILT:
> -	case IQS7222_REG_GRP_SYS:
> -		/*
> -		 * These groups are not organized beneath a child node, nor are
> -		 * they subject to any additional processing by the caller.
> -		 */
> -		reg_grp_node = dev_fwnode(&client->dev);
> -		break;
> -
> -	default:
> -		return -EINVAL;
> -	}
> +	if (!setup)
> +		return 0;
>  
>  	for (i = 0; i < ARRAY_SIZE(iqs7222_props); i++) {
>  		const char *name = iqs7222_props[i].name;
> @@ -1686,11 +1647,66 @@ static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
>  	return 0;
>  }
>  
> -static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
> +static int iqs7222_parse_event(struct iqs7222_private *iqs7222,
> +			       struct fwnode_handle *event_node,
> +			       int reg_grp_index,
> +			       enum iqs7222_reg_grp_id reg_grp,
> +			       enum iqs7222_reg_key_id reg_key,
> +			       u16 event_enable, u16 event_link,
> +			       unsigned int *event_type,
> +			       unsigned int *event_code)
> +{
> +	struct i2c_client *client = iqs7222->client;
> +	int error;
> +
> +	error = iqs7222_parse_props(iqs7222, event_node, reg_grp_index,
> +				    reg_grp, reg_key);
> +	if (error)
> +		return error;
> +
> +	error = iqs7222_gpio_select(iqs7222, event_node, event_enable,
> +				    event_link);
> +	if (error)
> +		return error;
> +
> +	error = fwnode_property_read_u32(event_node, "linux,code", event_code);
> +	if (error == -EINVAL) {
> +		return 0;
> +	} else if (error) {
> +		dev_err(&client->dev, "Failed to read %s code: %d\n",
> +			fwnode_get_name(event_node), error);
> +		return error;
> +	}
> +
> +	if (!event_type) {
> +		input_set_capability(iqs7222->keypad, EV_KEY, *event_code);
> +		return 0;
> +	}
> +
> +	error = fwnode_property_read_u32(event_node, "linux,input-type",
> +					 event_type);
> +	if (error == -EINVAL) {
> +		*event_type = EV_KEY;
> +	} else if (error) {
> +		dev_err(&client->dev, "Failed to read %s input type: %d\n",
> +			fwnode_get_name(event_node), error);
> +		return error;
> +	} else if (*event_type != EV_KEY && *event_type != EV_SW) {
> +		dev_err(&client->dev, "Invalid %s input type: %d\n",
> +			fwnode_get_name(event_node), *event_type);
> +		return -EINVAL;
> +	}
> +
> +	input_set_capability(iqs7222->keypad, *event_type, *event_code);
> +
> +	return 0;
> +}
> +
> +static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222,
> +			       struct fwnode_handle *cycle_node, int cycle_index)
>  {
>  	u16 *cycle_setup = iqs7222->cycle_setup[cycle_index];
>  	struct i2c_client *client = iqs7222->client;
> -	struct fwnode_handle *cycle_node = NULL;
>  	unsigned int pins[9];
>  	int error, count, i;
>  
> @@ -1698,17 +1714,7 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
>  	 * Each channel shares a cycle with one other channel; the mapping of
>  	 * channels to cycles is fixed. Properties defined for a cycle impact
>  	 * both channels tied to the cycle.
> -	 */
> -	error = iqs7222_parse_props(iqs7222, &cycle_node, cycle_index,
> -				    IQS7222_REG_GRP_CYCLE,
> -				    IQS7222_REG_KEY_NONE);
> -	if (error)
> -		return error;
> -
> -	if (!cycle_node)
> -		return 0;
> -
> -	/*
> +	 *
>  	 * Unlike channels which are restricted to a select range of CRx pins
>  	 * based on channel number, any cycle can claim any of the device's 9
>  	 * CTx pins (CTx0-8).
> @@ -1750,11 +1756,11 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
>  	return 0;
>  }
>  
> -static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
> +static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
> +			      struct fwnode_handle *chan_node, int chan_index)
>  {
>  	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
>  	struct i2c_client *client = iqs7222->client;
> -	struct fwnode_handle *chan_node = NULL;
>  	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
>  	int ext_chan = rounddown(num_chan, 10);
>  	int error, i;
> @@ -1762,15 +1768,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
>  	u16 *sys_setup = iqs7222->sys_setup;
>  	unsigned int val;
>  
> -	error = iqs7222_parse_props(iqs7222, &chan_node, chan_index,
> -				    IQS7222_REG_GRP_CHAN,
> -				    IQS7222_REG_KEY_NONE);
> -	if (error)
> -		return error;
> -
> -	if (!chan_node)
> -		return 0;
> -
>  	if (dev_desc->allow_offset &&
>  	    fwnode_property_present(chan_node, "azoteq,ulp-allow"))
>  		sys_setup[dev_desc->allow_offset] &= ~BIT(chan_index);
> @@ -1892,18 +1889,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
>  		if (!event_node)
>  			continue;
>  
> -		error = iqs7222_parse_props(iqs7222, &event_node, chan_index,
> -					    IQS7222_REG_GRP_BTN,
> -					    iqs7222_kp_events[i].reg_key);
> -		if (error)
> -			return error;
> -
> -		error = iqs7222_gpio_select(iqs7222, event_node,
> -					    BIT(chan_index),
> -					    dev_desc->touch_link - (i ? 0 : 2));
> -		if (error)
> -			return error;
> -
>  		if (!fwnode_property_read_u32(event_node,
>  					      "azoteq,timeout-press-ms",
>  					      &val)) {
> @@ -1919,7 +1904,8 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
>  			if (val > U8_MAX * 500) {
>  				dev_err(&client->dev,
>  					"Invalid %s press timeout: %u\n",
> -					fwnode_get_name(chan_node), val);
> +					fwnode_get_name(event_node), val);
> +				fwnode_handle_put(event_node);
>  				return -EINVAL;
>  			}
>  
> @@ -1927,49 +1913,16 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
>  			*setup |= (val / 500 << i * 8);
>  		}
>  
> -		error = fwnode_property_read_u32(event_node, "linux,code",
> -						 &val);
> -		if (error) {
> -			dev_err(&client->dev, "Failed to read %s code: %d\n",
> -				fwnode_get_name(chan_node), error);
> +		error = iqs7222_parse_event(iqs7222, event_node, chan_index,
> +					    IQS7222_REG_GRP_BTN,
> +					    iqs7222_kp_events[i].reg_key,
> +					    BIT(chan_index),
> +					    dev_desc->touch_link - (i ? 0 : 2),
> +					    &iqs7222->kp_type[chan_index][i],
> +					    &iqs7222->kp_code[chan_index][i]);
> +		fwnode_handle_put(event_node);
> +		if (error)
>  			return error;
> -		}
> -
> -		iqs7222->kp_code[chan_index][i] = val;
> -		iqs7222->kp_type[chan_index][i] = EV_KEY;
> -
> -		if (fwnode_property_present(event_node, "linux,input-type")) {
> -			error = fwnode_property_read_u32(event_node,
> -							 "linux,input-type",
> -							 &val);
> -			if (error) {
> -				dev_err(&client->dev,
> -					"Failed to read %s input type: %d\n",
> -					fwnode_get_name(chan_node), error);
> -				return error;
> -			}
> -
> -			if (val != EV_KEY && val != EV_SW) {
> -				dev_err(&client->dev,
> -					"Invalid %s input type: %u\n",
> -					fwnode_get_name(chan_node), val);
> -				return -EINVAL;
> -			}
> -
> -			iqs7222->kp_type[chan_index][i] = val;
> -		}
> -
> -		/*
> -		 * Reference channels can opt out of event reporting by using
> -		 * KEY_RESERVED in place of a true key or switch code.
> -		 */
> -		if (iqs7222->kp_type[chan_index][i] == EV_KEY &&
> -		    iqs7222->kp_code[chan_index][i] == KEY_RESERVED)
> -			continue;
> -
> -		input_set_capability(iqs7222->keypad,
> -				     iqs7222->kp_type[chan_index][i],
> -				     iqs7222->kp_code[chan_index][i]);
>  
>  		if (!dev_desc->event_offset)
>  			continue;
> @@ -1981,16 +1934,16 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
>  	 * The following call handles a special pair of properties that apply
>  	 * to a channel node, but reside within the button (event) group.
>  	 */
> -	return iqs7222_parse_props(iqs7222, &chan_node, chan_index,
> +	return iqs7222_parse_props(iqs7222, chan_node, chan_index,
>  				   IQS7222_REG_GRP_BTN,
>  				   IQS7222_REG_KEY_DEBOUNCE);
>  }
>  
> -static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
> +static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
> +			      struct fwnode_handle *sldr_node, int sldr_index)
>  {
>  	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
>  	struct i2c_client *client = iqs7222->client;
> -	struct fwnode_handle *sldr_node = NULL;
>  	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
>  	int ext_chan = rounddown(num_chan, 10);
>  	int count, error, reg_offset, i;
> @@ -1998,15 +1951,6 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
>  	u16 *sldr_setup = iqs7222->sldr_setup[sldr_index];
>  	unsigned int chan_sel[4], val;
>  
> -	error = iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
> -				    IQS7222_REG_GRP_SLDR,
> -				    IQS7222_REG_KEY_NONE);
> -	if (error)
> -		return error;
> -
> -	if (!sldr_node)
> -		return 0;
> -
>  	/*
>  	 * Each slider can be spread across 3 to 4 channels. It is possible to
>  	 * select only 2 channels, but doing so prevents the slider from using
> @@ -2130,46 +2074,37 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
>  	for (i = 0; i < ARRAY_SIZE(iqs7222_sl_events); i++) {
>  		const char *event_name = iqs7222_sl_events[i].name;
>  		struct fwnode_handle *event_node;
> +		enum iqs7222_reg_key_id reg_key;
>  
>  		event_node = fwnode_get_named_child_node(sldr_node, event_name);
>  		if (!event_node)
>  			continue;
>  
> -		error = iqs7222_parse_props(iqs7222, &event_node, sldr_index,
> -					    IQS7222_REG_GRP_SLDR,
> -					    reg_offset ?
> -					    IQS7222_REG_KEY_RESERVED :
> -					    iqs7222_sl_events[i].reg_key);
> -		if (error)
> -			return error;
> +		if (reg_offset)
> +			reg_key = IQS7222_REG_KEY_RESERVED;
> +		else
> +			reg_key = iqs7222_sl_events[i].reg_key;
>  
>  		/*
>  		 * The press/release event does not expose a direct GPIO link,
>  		 * but one can be emulated by tying each of the participating
>  		 * channels to the same GPIO.
>  		 */
> -		error = iqs7222_gpio_select(iqs7222, event_node,
> +		error = iqs7222_parse_event(iqs7222, event_node, sldr_index,
> +					    IQS7222_REG_GRP_SLDR, reg_key,
>  					    i ? iqs7222_sl_events[i].enable
>  					      : sldr_setup[3 + reg_offset],
>  					    i ? 1568 + sldr_index * 30
> -					      : sldr_setup[4 + reg_offset]);
> +					      : sldr_setup[4 + reg_offset],
> +					    NULL,
> +					    &iqs7222->sl_code[sldr_index][i]);
> +		fwnode_handle_put(event_node);
>  		if (error)
>  			return error;
>  
>  		if (!reg_offset)
>  			sldr_setup[9] |= iqs7222_sl_events[i].enable;
>  
> -		error = fwnode_property_read_u32(event_node, "linux,code",
> -						 &val);
> -		if (error) {
> -			dev_err(&client->dev, "Failed to read %s code: %d\n",
> -				fwnode_get_name(sldr_node), error);
> -			return error;
> -		}
> -
> -		iqs7222->sl_code[sldr_index][i] = val;
> -		input_set_capability(iqs7222->keypad, EV_KEY, val);
> -
>  		if (!dev_desc->event_offset)
>  			continue;
>  
> @@ -2190,19 +2125,63 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
>  	 * The following call handles a special pair of properties that shift
>  	 * to make room for a wheel enable control in the case of IQS7222C.
>  	 */
> -	return iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
> +	return iqs7222_parse_props(iqs7222, sldr_node, sldr_index,
>  				   IQS7222_REG_GRP_SLDR,
>  				   dev_desc->wheel_enable ?
>  				   IQS7222_REG_KEY_WHEEL :
>  				   IQS7222_REG_KEY_NO_WHEEL);
>  }
>  
> +static int (*iqs7222_parse_extra[IQS7222_NUM_REG_GRPS])
> +				(struct iqs7222_private *iqs7222,
> +				 struct fwnode_handle *reg_grp_node,
> +				 int reg_grp_index) = {
> +	[IQS7222_REG_GRP_CYCLE] = iqs7222_parse_cycle,
> +	[IQS7222_REG_GRP_CHAN] = iqs7222_parse_chan,
> +	[IQS7222_REG_GRP_SLDR] = iqs7222_parse_sldr,
> +};
> +
> +static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
> +				 enum iqs7222_reg_grp_id reg_grp,
> +				 int reg_grp_index)
> +{
> +	struct i2c_client *client = iqs7222->client;
> +	struct fwnode_handle *reg_grp_node;
> +	int error;
> +
> +	if (iqs7222_reg_grp_names[reg_grp]) {
> +		char reg_grp_name[16];
> +
> +		snprintf(reg_grp_name, sizeof(reg_grp_name), "%s-%d",
> +			 iqs7222_reg_grp_names[reg_grp], reg_grp_index);
> +
> +		reg_grp_node = device_get_named_child_node(&client->dev,
> +							   reg_grp_name);
> +	} else {
> +		reg_grp_node = fwnode_handle_get(dev_fwnode(&client->dev));
> +	}
> +
> +	if (!reg_grp_node)
> +		return 0;
> +
> +	error = iqs7222_parse_props(iqs7222, reg_grp_node, reg_grp_index,
> +				    reg_grp, IQS7222_REG_KEY_NONE);
> +
> +	if (!error && iqs7222_parse_extra[reg_grp])
> +		error = iqs7222_parse_extra[reg_grp](iqs7222, reg_grp_node,
> +						     reg_grp_index);
> +
> +	fwnode_handle_put(reg_grp_node);
> +
> +	return error;
> +}
> +
>  static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
>  {
>  	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
>  	const struct iqs7222_reg_grp_desc *reg_grps = dev_desc->reg_grps;
>  	u16 *sys_setup = iqs7222->sys_setup;
> -	int error, i;
> +	int error, i, j;
>  
>  	if (dev_desc->allow_offset)
>  		sys_setup[dev_desc->allow_offset] = U16_MAX;
> @@ -2210,32 +2189,13 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
>  	if (dev_desc->event_offset)
>  		sys_setup[dev_desc->event_offset] = IQS7222_EVENT_MASK_ATI;
>  
> -	for (i = 0; i < reg_grps[IQS7222_REG_GRP_CYCLE].num_row; i++) {
> -		error = iqs7222_parse_cycle(iqs7222, i);
> -		if (error)
> -			return error;
> -	}
> -
> -	error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_GLBL,
> -				    IQS7222_REG_KEY_NONE);
> -	if (error)
> -		return error;
> -
>  	for (i = 0; i < reg_grps[IQS7222_REG_GRP_GPIO].num_row; i++) {
> -		struct fwnode_handle *gpio_node = NULL;
>  		u16 *gpio_setup = iqs7222->gpio_setup[i];
> -		int j;
>  
>  		gpio_setup[0] &= ~IQS7222_GPIO_SETUP_0_GPIO_EN;
>  		gpio_setup[1] = 0;
>  		gpio_setup[2] = 0;
>  
> -		error = iqs7222_parse_props(iqs7222, &gpio_node, i,
> -					    IQS7222_REG_GRP_GPIO,
> -					    IQS7222_REG_KEY_NONE);
> -		if (error)
> -			return error;
> -
>  		if (reg_grps[IQS7222_REG_GRP_GPIO].num_row == 1)
>  			continue;
>  
> @@ -2258,29 +2218,21 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
>  		chan_setup[5] = 0;
>  	}
>  
> -	for (i = 0; i < reg_grps[IQS7222_REG_GRP_CHAN].num_row; i++) {
> -		error = iqs7222_parse_chan(iqs7222, i);
> -		if (error)
> -			return error;
> -	}
> -
> -	error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_FILT,
> -				    IQS7222_REG_KEY_NONE);
> -	if (error)
> -		return error;
> -
>  	for (i = 0; i < reg_grps[IQS7222_REG_GRP_SLDR].num_row; i++) {
>  		u16 *sldr_setup = iqs7222->sldr_setup[i];
>  
>  		sldr_setup[0] &= ~IQS7222_SLDR_SETUP_0_CHAN_CNT_MASK;
> +	}
>  
> -		error = iqs7222_parse_sldr(iqs7222, i);
> -		if (error)
> -			return error;
> +	for (i = 0; i < IQS7222_NUM_REG_GRPS; i++) {
> +		for (j = 0; j < reg_grps[i].num_row; j++) {
> +			error = iqs7222_parse_reg_grp(iqs7222, i, j);
> +			if (error)
> +				return error;
> +		}
>  	}
>  
> -	return iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_SYS,
> -				   IQS7222_REG_KEY_NONE);
> +	return 0;
>  }
>  
>  static int iqs7222_report(struct iqs7222_private *iqs7222)
> -- 
> 2.34.1
