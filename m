Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C47C264D91C
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 10:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiLOJzX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 04:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbiLOJzF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 04:55:05 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62535446F
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 01:55:02 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id h12so2438898wrv.10
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 01:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEboVQqkxtlNjsg8IwyA57JCH93pgfOrLO1t6HicO8U=;
        b=nG0IwklcS0HhP7dFCzDNzuffnpbceqYAtjhHcXDNXJIb1cwT3HJTxkRhwMLBac3CDj
         Vg7DvhvlgNWvCBjnC2H47o1BO8jLZFGKA6XeNa1FCJmsxfE3h1/4A2TuahPDIfQoGhFS
         y9gsmy5iLP5fZKOZBTvp7jEA2zng9PFauYA+AsUPwAlDIwAmeyKdmdjUPfiz9y90DLkM
         yBlcJMX2TOXUYvokdwtTjPjl3PhYIoMY8aMGxyLBRH67ixX7owZNs2mCPCgxLoWzw2GZ
         /XF0c2ZhGe0x/PYlp9Ly2izBytwbY2SbTr0m2v2fFsoTDVUcF/+oIbKeCFOS9YD2WBEb
         N92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEboVQqkxtlNjsg8IwyA57JCH93pgfOrLO1t6HicO8U=;
        b=zxMwP3fmekmvC9tTcnwGFDc0PBwmNZbRPo1HTEvOX4gRwwy3y60ktpBiugkmrVXRyC
         TQGk/KVLjBr1DMBIhs9i27R7EEmm+ni/SqqonKAGEbc1kxkHI7e5v73Bgy/xUY8eO3ib
         aR8xVMwpmD48SgSlBlIJvVDQ83jv57+ntFcHL8PvqOxx+MhlgcEgNM+6mcsMZ4zzx+T/
         93T2DcGNPQDpRjelEybZhq/HZarM0P658SoodtMLaGvjE9ErIQIbMZlCvIVgpGC0B7tw
         CgJcXhJVKrSlQCmWPEEEESlz7l4pDK2gCNUW1049pT3NSpuIEvCcT4V3a8MdDAgDHLgz
         e6ew==
X-Gm-Message-State: ANoB5pmsxjLP2L52GcZBVFYK1fjRq+3DDSEHzI320wu9uup3ek4ZYwbu
        NR/eOl2iuyO1akl++zmWON4q04FlMVdBZmOr
X-Google-Smtp-Source: AA0mqf5Dnb+oon8Pp8pftkns7He+FANWMiMy9XLsxP34+ZpXjWfP1zBGwm2QOfyPIysFSvPiILmG4w==
X-Received: by 2002:a5d:5610:0:b0:242:1ad2:15e1 with SMTP id l16-20020a5d5610000000b002421ad215e1mr15874823wrv.2.1671098101402;
        Thu, 15 Dec 2022 01:55:01 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d4a82000000b002366dd0e030sm5398654wrq.68.2022.12.15.01.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 01:55:01 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH 3/5] Input: iqs269a - configure device with a single
 block write
In-Reply-To: <Y4V2UUxc94P9YYyc@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71> <Y4V2UUxc94P9YYyc@nixie71>
Date:   Thu, 15 Dec 2022 10:55:00 +0100
Message-ID: <87o7s5j8jv.fsf@baylibre.com>
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

On Mon, Nov 28, 2022 at 21:02, Jeff LaBundy <jeff@labundy.com> wrote:

> Unless it is being done as part of servicing a soft reset interrupt,
> configuring channels on-the-fly (as is the case when writing to the
> ati_trigger attribute) may cause GPIO3 (which reflects the state of
> touch for a selected channel) to be inadvertently asserted.
>
> To solve this problem, follow the vendor's recommendation and write
> all channel configuration as well as the REDO_ATI register field as
> part of a single block write. This ensures the device has been told
> to re-calibrate itself following an I2C stop condition, after which
> sensing resumes and GPIO3 may be asserted.
>
> Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/iqs269a.c | 98 ++++++++++++++----------------------
>  1 file changed, 39 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index 711e67db71a4..0eb3cff177e5 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -96,8 +96,6 @@
>  #define IQS269_MISC_B_TRACKING_UI_ENABLE	BIT(4)
>  #define IQS269_MISC_B_FILT_STR_SLIDER		GENMASK(1, 0)
>  
> -#define IQS269_CHx_SETTINGS			0x8C
> -
>  #define IQS269_CHx_ENG_A_MEAS_CAP_SIZE		BIT(15)
>  #define IQS269_CHx_ENG_A_RX_GND_INACTIVE	BIT(13)
>  #define IQS269_CHx_ENG_A_LOCAL_CAP_SIZE		BIT(12)
> @@ -245,6 +243,18 @@ struct iqs269_ver_info {
>  	u8 padding;
>  } __packed;
>  
> +struct iqs269_ch_reg {
> +	u8 rx_enable;
> +	u8 tx_enable;
> +	__be16 engine_a;
> +	__be16 engine_b;
> +	__be16 ati_comp;
> +	u8 thresh[3];
> +	u8 hyst;
> +	u8 assoc_select;
> +	u8 assoc_weight;
> +} __packed;
> +
>  struct iqs269_sys_reg {
>  	__be16 general;
>  	u8 active;
> @@ -266,18 +276,7 @@ struct iqs269_sys_reg {
>  	u8 timeout_swipe;
>  	u8 thresh_swipe;
>  	u8 redo_ati;
> -} __packed;
> -
> -struct iqs269_ch_reg {
> -	u8 rx_enable;
> -	u8 tx_enable;
> -	__be16 engine_a;
> -	__be16 engine_b;
> -	__be16 ati_comp;
> -	u8 thresh[3];
> -	u8 hyst;
> -	u8 assoc_select;
> -	u8 assoc_weight;
> +	struct iqs269_ch_reg ch_reg[IQS269_NUM_CH];
>  } __packed;
>  
>  struct iqs269_flags {
> @@ -292,7 +291,6 @@ struct iqs269_private {
>  	struct regmap *regmap;
>  	struct mutex lock;
>  	struct iqs269_switch_desc switches[ARRAY_SIZE(iqs269_events)];
> -	struct iqs269_ch_reg ch_reg[IQS269_NUM_CH];
>  	struct iqs269_sys_reg sys_reg;
>  	struct input_dev *keypad;
>  	struct input_dev *slider[IQS269_NUM_SL];
> @@ -307,6 +305,7 @@ struct iqs269_private {
>  static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
>  			       unsigned int ch_num, unsigned int mode)
>  {
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  	u16 engine_a;
>  
>  	if (ch_num >= IQS269_NUM_CH)
> @@ -317,12 +316,12 @@ static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
>  
>  	mutex_lock(&iqs269->lock);
>  
> -	engine_a = be16_to_cpu(iqs269->ch_reg[ch_num].engine_a);
> +	engine_a = be16_to_cpu(ch_reg[ch_num].engine_a);
>  
>  	engine_a &= ~IQS269_CHx_ENG_A_ATI_MODE_MASK;
>  	engine_a |= (mode << IQS269_CHx_ENG_A_ATI_MODE_SHIFT);
>  
> -	iqs269->ch_reg[ch_num].engine_a = cpu_to_be16(engine_a);
> +	ch_reg[ch_num].engine_a = cpu_to_be16(engine_a);
>  	iqs269->ati_current = false;
>  
>  	mutex_unlock(&iqs269->lock);
> @@ -333,13 +332,14 @@ static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
>  static int iqs269_ati_mode_get(struct iqs269_private *iqs269,
>  			       unsigned int ch_num, unsigned int *mode)
>  {
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  	u16 engine_a;
>  
>  	if (ch_num >= IQS269_NUM_CH)
>  		return -EINVAL;
>  
>  	mutex_lock(&iqs269->lock);
> -	engine_a = be16_to_cpu(iqs269->ch_reg[ch_num].engine_a);
> +	engine_a = be16_to_cpu(ch_reg[ch_num].engine_a);
>  	mutex_unlock(&iqs269->lock);
>  
>  	engine_a &= IQS269_CHx_ENG_A_ATI_MODE_MASK;
> @@ -351,6 +351,7 @@ static int iqs269_ati_mode_get(struct iqs269_private *iqs269,
>  static int iqs269_ati_base_set(struct iqs269_private *iqs269,
>  			       unsigned int ch_num, unsigned int base)
>  {
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  	u16 engine_b;
>  
>  	if (ch_num >= IQS269_NUM_CH)
> @@ -379,12 +380,12 @@ static int iqs269_ati_base_set(struct iqs269_private *iqs269,
>  
>  	mutex_lock(&iqs269->lock);
>  
> -	engine_b = be16_to_cpu(iqs269->ch_reg[ch_num].engine_b);
> +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  
>  	engine_b &= ~IQS269_CHx_ENG_B_ATI_BASE_MASK;
>  	engine_b |= base;
>  
> -	iqs269->ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
> +	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
>  	iqs269->ati_current = false;
>  
>  	mutex_unlock(&iqs269->lock);
> @@ -395,13 +396,14 @@ static int iqs269_ati_base_set(struct iqs269_private *iqs269,
>  static int iqs269_ati_base_get(struct iqs269_private *iqs269,
>  			       unsigned int ch_num, unsigned int *base)
>  {
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  	u16 engine_b;
>  
>  	if (ch_num >= IQS269_NUM_CH)
>  		return -EINVAL;
>  
>  	mutex_lock(&iqs269->lock);
> -	engine_b = be16_to_cpu(iqs269->ch_reg[ch_num].engine_b);
> +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  	mutex_unlock(&iqs269->lock);
>  
>  	switch (engine_b & IQS269_CHx_ENG_B_ATI_BASE_MASK) {
> @@ -429,6 +431,7 @@ static int iqs269_ati_base_get(struct iqs269_private *iqs269,
>  static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>  				 unsigned int ch_num, unsigned int target)
>  {
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  	u16 engine_b;
>  
>  	if (ch_num >= IQS269_NUM_CH)
> @@ -439,12 +442,12 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>  
>  	mutex_lock(&iqs269->lock);
>  
> -	engine_b = be16_to_cpu(iqs269->ch_reg[ch_num].engine_b);
> +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  
>  	engine_b &= ~IQS269_CHx_ENG_B_ATI_TARGET_MASK;
>  	engine_b |= target / 32;
>  
> -	iqs269->ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
> +	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
>  	iqs269->ati_current = false;
>  
>  	mutex_unlock(&iqs269->lock);
> @@ -455,13 +458,14 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>  static int iqs269_ati_target_get(struct iqs269_private *iqs269,
>  				 unsigned int ch_num, unsigned int *target)
>  {
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  	u16 engine_b;
>  
>  	if (ch_num >= IQS269_NUM_CH)
>  		return -EINVAL;
>  
>  	mutex_lock(&iqs269->lock);
> -	engine_b = be16_to_cpu(iqs269->ch_reg[ch_num].engine_b);
> +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  	mutex_unlock(&iqs269->lock);
>  
>  	*target = (engine_b & IQS269_CHx_ENG_B_ATI_TARGET_MASK) * 32;
> @@ -531,13 +535,7 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  	if (fwnode_property_present(ch_node, "azoteq,slider1-select"))
>  		iqs269->sys_reg.slider_select[1] |= BIT(reg);
>  
> -	ch_reg = &iqs269->ch_reg[reg];
> -
> -	error = regmap_raw_read(iqs269->regmap,
> -				IQS269_CHx_SETTINGS + reg * sizeof(*ch_reg) / 2,
> -				ch_reg, sizeof(*ch_reg));
> -	if (error)
> -		return error;
> +	ch_reg = &iqs269->sys_reg.ch_reg[reg];
>  
>  	error = iqs269_parse_mask(ch_node, "azoteq,rx-enable",
>  				  &ch_reg->rx_enable);
> @@ -1048,10 +1046,8 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
>  
>  static int iqs269_dev_init(struct iqs269_private *iqs269)
>  {
> -	struct iqs269_sys_reg *sys_reg = &iqs269->sys_reg;
> -	struct iqs269_ch_reg *ch_reg;
>  	unsigned int val;
> -	int error, i;
> +	int error;
>  
>  	mutex_lock(&iqs269->lock);
>  
> @@ -1061,27 +1057,8 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
>  	if (error)
>  		goto err_mutex;
>  
> -	for (i = 0; i < IQS269_NUM_CH; i++) {
> -		if (!(sys_reg->active & BIT(i)))
> -			continue;
> -
> -		ch_reg = &iqs269->ch_reg[i];
> -
> -		error = regmap_raw_write(iqs269->regmap,
> -					 IQS269_CHx_SETTINGS + i *
> -					 sizeof(*ch_reg) / 2, ch_reg,
> -					 sizeof(*ch_reg));
> -		if (error)
> -			goto err_mutex;
> -	}
> -
> -	/*
> -	 * The REDO-ATI and ATI channel selection fields must be written in the
> -	 * same block write, so every field between registers 0x80 through 0x8B
> -	 * (inclusive) must be written as well.
> -	 */
> -	error = regmap_raw_write(iqs269->regmap, IQS269_SYS_SETTINGS, sys_reg,
> -				 sizeof(*sys_reg));
> +	error = regmap_raw_write(iqs269->regmap, IQS269_SYS_SETTINGS,
> +				 &iqs269->sys_reg, sizeof(iqs269->sys_reg));
>  	if (error)
>  		goto err_mutex;
>  
> @@ -1355,6 +1332,7 @@ static ssize_t hall_bin_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
>  	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  	struct i2c_client *client = iqs269->client;
>  	unsigned int val;
>  	int error;
> @@ -1369,8 +1347,8 @@ static ssize_t hall_bin_show(struct device *dev,
>  	if (error)
>  		return error;
>  
> -	switch (iqs269->ch_reg[IQS269_CHx_HALL_ACTIVE].rx_enable &
> -		iqs269->ch_reg[IQS269_CHx_HALL_INACTIVE].rx_enable) {
> +	switch (ch_reg[IQS269_CHx_HALL_ACTIVE].rx_enable &
> +		ch_reg[IQS269_CHx_HALL_INACTIVE].rx_enable) {
>  	case IQS269_HALL_PAD_R:
>  		val &= IQS269_CAL_DATA_A_HALL_BIN_R_MASK;
>  		val >>= IQS269_CAL_DATA_A_HALL_BIN_R_SHIFT;
> @@ -1450,9 +1428,10 @@ static ssize_t rx_enable_show(struct device *dev,
>  			      struct device_attribute *attr, char *buf)
>  {
>  	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  
>  	return scnprintf(buf, PAGE_SIZE, "%u\n",
> -			 iqs269->ch_reg[iqs269->ch_num].rx_enable);
> +			 ch_reg[iqs269->ch_num].rx_enable);
>  }
>  
>  static ssize_t rx_enable_store(struct device *dev,
> @@ -1460,6 +1439,7 @@ static ssize_t rx_enable_store(struct device *dev,
>  			       size_t count)
>  {
>  	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
> +	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
>  	unsigned int val;
>  	int error;
>  
> @@ -1472,7 +1452,7 @@ static ssize_t rx_enable_store(struct device *dev,
>  
>  	mutex_lock(&iqs269->lock);
>  
> -	iqs269->ch_reg[iqs269->ch_num].rx_enable = val;
> +	ch_reg[iqs269->ch_num].rx_enable = val;
>  	iqs269->ati_current = false;
>  
>  	mutex_unlock(&iqs269->lock);
> -- 
> 2.34.1
