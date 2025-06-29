Return-Path: <linux-input+bounces-13164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B425EAECB61
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 07:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8F347A56DC
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 05:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7272C1A8419;
	Sun, 29 Jun 2025 05:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i54As7BC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5A8828;
	Sun, 29 Jun 2025 05:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751173939; cv=none; b=LFw95y+EYcBQcjU0E4/iGbo05EWOx1fBKp+noYVODmelBM3An1/YtvuGx19TAHVaqCUyTxIrPNn0r0g0/DJF1stT2s9uPE8l08oZZ3sd+0z4CeaFQagHjuG++pnkiOVE9CV03xga+sFHhAoh+1Ueeh654OvZWDZdUlqNsuLolSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751173939; c=relaxed/simple;
	bh=XtKm9MzaMMKCQCHVB6NS44kaGUuKeXWYQRj/kIGuCtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzkUtABzpcN7492Xrl1TZopoq1E0fyH75WG1HbN5V7xjchAPI38Wq9RFIw0/nC+8h/ReeWjnlCovXcWW0AhUdwU2UtN1E5xdcMORGe+sXLIEACBqs2eUPiIEu1taImNkln8k0cOIB5f8+ZzVoRDXUHvnBfv3rkL12o34XzHF8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i54As7BC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23602481460so33255855ad.0;
        Sat, 28 Jun 2025 22:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751173936; x=1751778736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7F3Pv2rCP7Rpo2SyClKZWeBeyiOZmEIiG65XSCku3Co=;
        b=i54As7BCCEHDL7bpW5YaB+HBRBJyTHbjnOb7J4/2nH3qQz5dQViKEs+yFHdlt2HZrU
         8T4IsLrxB8QrWomUipLPkfjx+AFP3b/g5veZ67Xc6JJai3PYeBG91vcWLBkJJUtPhrVh
         yqmP1bbNoo/crCaSoSl616l03DGX9ZJHhkFQF/SQNCOaGKe7t4ZIIeWeNcbeL2PDlWrf
         adCXGWkT17+nHMqDX/8fADAChG7329Y+c+BpWTymVLMqFCJVSlAx+Mha/ijtGWo9q4gG
         jWWO9QdRLDKFwgMEyAkdN44Gw5D8gWGWL0LiTbHmz/TA2qeyJ2johot9R51iQ75Z4lbO
         Mx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751173936; x=1751778736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7F3Pv2rCP7Rpo2SyClKZWeBeyiOZmEIiG65XSCku3Co=;
        b=NSv10PGDuDDaf/fF9mWqvu5Cz393OJ34RZ8pigCSgSAVDFoLjM/ZFoPQ/DNycRFr9m
         gSTRlAKmf94lkc752gM8rucUh457XPehvT8DeRQr5u13jgbw5UROGOCkR9Hy+AUEOcAz
         0+xGJGrvqUmA/KRrii8CyFZ8hMyMfy3KptgU1fOp7UaZ2nsZty2JNCjrLeh7lKyKqeWU
         z/bgA6DaHedi8uSw54juIsM1g2h17hqv1nTbFbrtleroPYiQWqw3hgwQDh5Dr/cEPzhB
         BdTbqZ5EjT3s2qffu9XVoeXixFqteb6xeJitVwnv/iC1Sr9Of37pT6XfepJVepBAEq12
         8C8A==
X-Forwarded-Encrypted: i=1; AJvYcCW5i7cvADtrPPoHsZ2NWl7papDV6/OcxRI3St7i/OkocQdaMHCZDpEeDnzJ0jXNVD2KoA/5m/NwJzR4QyE=@vger.kernel.org, AJvYcCWhR+Lw3OQe8gM5jYJKN8BYOM/chQmaGJbVB/11iFXsR5jBavCfwUaBSwEgDK5Tdi4DLUAZHWsMgKYa@vger.kernel.org, AJvYcCXNWHVjuTnWlcqQdbcSLn0FIi1sphGDOiJcrc7wQH+Bfa+HwrmZg1+bvvZSM29DNI+kRlSuYrdTkrfYp+Mh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7yxRB0g5V/NAFI6F4vOnlYR8JFkIz8EY0PxdJFwW5QinTA2bi
	LAU3LH6mpyxBdixnCpd0Nb8nKyOhC9khRek1+4c9cPjcVJ9W0hyQ0mrF4HoocA==
X-Gm-Gg: ASbGncvpYT40DQ+kN7eQn3i5NsF1dhtc951x9JK+vRNQK/W2kf7+sjNqni8e27CVpFQ
	8dtjZXAwYto1qa3+iQpQrey9DcYG7pelbj+7qYCb8tXacR+dSbKV++IH43uaVU0may5EgDglgOJ
	oR0QLw0dF6JPnhIXatliKGasFGRsl+MpJfEPaheC1BqOd0xcxiztN1jSAPDs8pxVMDyOaD43ILE
	IodCNizgJmYrdX1fazuzjV50xgHMpLU8ZUqIIBweAQXThedBB90gmvEvDmGPYz0SfDc/pBFTxL2
	5a/58iVpFpZl+9s1G2iyVs7l49mFcUUi+6bzcR2lRThm8Dx9OeQ095K1Q9TiSIg=
X-Google-Smtp-Source: AGHT+IHn4CsXslZ+uLe2cnLYWIMYSvRYpTKVs33Xm+02bohD0toNcwhmjnrHFANTn6fks+FtiuvhkA==
X-Received: by 2002:a17:903:3c50:b0:234:914b:3841 with SMTP id d9443c01a7336-23ac460837dmr123310865ad.39.1751173935915;
        Sat, 28 Jun 2025 22:12:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d8da:e3e0:2b93:2315])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bc406sm50031315ad.195.2025.06.28.22.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 22:12:15 -0700 (PDT)
Date: Sat, 28 Jun 2025 22:12:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sangwon Jee <jeesw@melfas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/5] Input: melfas-mip4 - add support for touchkey
 input events
Message-ID: <ugwy3adqmxodsyhohpdv337lvbxpdzhgtojpbtrykkuyf2eivl@sl36qsvcju6v>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
 <20250613-mip4-touchkey-v2-3-9bbbe14c016d@disroot.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-mip4-touchkey-v2-3-9bbbe14c016d@disroot.org>

Hi Kaustabh,

On Fri, Jun 13, 2025 at 01:11:35AM +0530, Kaustabh Chakraborty wrote:
> The MIP4 protocol are supposed to support touchscreens, touchkeys, and
> combo-devices. The driver handles touchscreen events, but touchkey
> events are unimplemented.

I am confused, because I clearly see the driver parsing and forwarding
key events. It appears that this patch adds the ability to set the
keymap via device tree instead of relying on userspace to load it.

Please adjust the patch description.

> 
> Implement them. If compiled with devicetree support, the driver attempts
> to retrieve keycodes from a property named "linux,keycodes".
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/input/touchscreen/melfas_mip4.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> index a6946e3d8376d7e9b4c26f4194409e0ba78bb075..061ac353bc7a2e28f17581411af81f35c89733a1 100644
> --- a/drivers/input/touchscreen/melfas_mip4.c
> +++ b/drivers/input/touchscreen/melfas_mip4.c
> @@ -169,7 +169,7 @@ struct mip4_ts {
>  	unsigned int event_format;
>  
>  	unsigned int key_num;
> -	unsigned short key_code[MIP4_MAX_KEYS];
> +	unsigned int key_code[MIP4_MAX_KEYS];
>  
>  	bool wake_irq_enabled;
>  
> @@ -337,8 +337,13 @@ static int mip4_query_device(struct mip4_ts *ts)
>  			ts->ppm_x, ts->ppm_y);
>  
>  		/* Key ts */
> -		if (ts->node_key > 0)
> +		if (ts->node_key > MIP4_MAX_KEYS) {
> +			dev_warn(&ts->client->dev,
> +				"Too many keys (%u) found\n", ts->node_key);
> +			ts->key_num = MIP4_MAX_KEYS;
> +		} else {
>  			ts->key_num = ts->node_key;
> +		}

I believe this is a bugfix. Please extract it into a separate patch.

>  	}
>  
>  	/* Protocol */
> @@ -1080,6 +1085,7 @@ static int mip4_flash_fw(struct mip4_ts *ts,
>  			 const u8 *fw_data, u32 fw_size, u32 fw_offset)
>  {
>  	struct i2c_client *client = ts->client;
> +	unsigned int i;
>  	int offset;
>  	u16 buf_addr;
>  	int error, error2;
> @@ -1149,6 +1155,11 @@ static int mip4_flash_fw(struct mip4_ts *ts,
>  	input_abs_set_res(ts->input, ABS_X, ts->ppm_x);
>  	input_abs_set_res(ts->input, ABS_Y, ts->ppm_y);
>  
> +	for (i = 0; i < ts->key_num; i++) {
> +		if (ts->key_code[i])
> +			input_set_capability(ts->input, EV_KEY, ts->key_code[i]);
> +	}
> +
>  	return error ? error : 0;
>  }
>  
> @@ -1425,6 +1436,7 @@ static int mip4_probe(struct i2c_client *client)
>  {
>  	struct mip4_ts *ts;
>  	struct input_dev *input;
> +	unsigned int i;
>  	int error;
>  
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> @@ -1471,6 +1483,17 @@ static int mip4_probe(struct i2c_client *client)
>  
>  	input_set_drvdata(input, ts);
>  
> +#ifdef CONFIG_OF
> +	error = of_property_read_u32_array(client->dev.of_node, "linux,keycodes",
> +					   ts->key_code, ts->key_num);
> +	if (error && ts->key_num) {
> +		dev_warn(&client->dev,
> +			 "Failed to get codes for %u supported keys", ts->key_num);
> +		/* Disable touchkey support */
> +		ts->key_num = 0;
> +	}

Please use generic device properties (device_property_read_u32_array())
and drop the dependency on OF.

> +#endif
> +
>  	input->keycode = ts->key_code;
>  	input->keycodesize = sizeof(*ts->key_code);
>  	input->keycodemax = ts->key_num;
> @@ -1491,6 +1514,11 @@ static int mip4_probe(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> +	for (i = 0; i < ts->key_num; i++) {
> +		if (ts->key_code[i])
> +			input_set_capability(input, EV_KEY, ts->key_code[i]);
> +	}
> +
>  	i2c_set_clientdata(client, ts);
>  
>  	error = devm_request_threaded_irq(&client->dev, client->irq,
> 

Thanks.

-- 
Dmitry

