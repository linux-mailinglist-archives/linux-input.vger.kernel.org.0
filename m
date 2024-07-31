Return-Path: <linux-input+bounces-5251-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C49435ED
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 20:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1EBD1F25D8F
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 18:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D37186250;
	Wed, 31 Jul 2024 18:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/+RRDg9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61BD1465A8;
	Wed, 31 Jul 2024 18:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722452021; cv=none; b=uE/RuGlSDqEB99JO9R18/FlooZbsxfFoDjuvym3ihBIS2wJ5MSyaq3UukH7V/TPMEJOtAY/vfDtqfeHX9QLktsP0Sc8qZWgKGzNnwrhLzx0qBp74kiKokPt3qFyWQo5FrpTvZCdy7WDznlRt1chcKj2VZhku0izhUGDfwyDlqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722452021; c=relaxed/simple;
	bh=cYejzeJ2eqYs6HqdtvgK83AMmDS6SXNuDDo2CR2+qhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPYgs2kVuAND20gzMW+EUAWBh3Gqmv0cyIALg99Vo4qZkCqrC+byS7BP751TwOnleQa55qUHuiUX7hMWKjlH0arXKAFHXovcu9/8JtmuXinDH2OJuJ4cKDpRLgNjpVIi/ubFzhh82PTCK1SEeMerlFE2HxOH8EYB03s15rpBR7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/+RRDg9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70eb73a9f14so4595322b3a.2;
        Wed, 31 Jul 2024 11:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722452019; x=1723056819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bnSVnBxfGvA5PtEw2MXRHDuntZeKjiV3XpwqenV0NB8=;
        b=a/+RRDg9Pye2vhiKYzXiMnRNsUJezrwGVx7WGqiFo0S8ZUJBW0lDkjVebPr1urpO9/
         KzKGx7T/NksqSprGeVCetk6EXUBRStcQkPWQ6m0FpuuBom+WJ0/7GWgZewsw7ZulMwxk
         UMg6pMtIzf2cm9jmtgPEj8dlrjsUA/hy7rlcPdw9AeGQBHFjiYbPzqAxkvoq8iJzjG1a
         IhbWTq0hohfby8LQlH2AmtzOeZSIBeIQ51i7sAzaQyc+bJs71ymNP4ifQGgSScVMTNK8
         ZxcfV40pcCvB38LWzA/xAdvmsjw18GtOkO2shvCUMtkQRzcra2NOtRdK+DHOqZjrryHF
         H6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722452019; x=1723056819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnSVnBxfGvA5PtEw2MXRHDuntZeKjiV3XpwqenV0NB8=;
        b=VL5eT6ZUTIlMclXU/aZ3NMPR97MEXtZyX74WKRWyNwem2NOhDq7X7rjdc8p3QzfEHE
         fjxXNLDLscgE7TnseuPSI7Vb3aVrdiLjuLwsuNiGQR9keKdYCrTfYowmu3aQibIvymIc
         a05zu/I+wsZcCa/VmhlMdcZeSy4Bv+iAcmn99Rq/ftWVAznqVLIm5LuMnvQ6yNdVMo4A
         H3hSbcBpZP4kVuYp69ydeCNpEs/gIglV1VrMDWqdZssfRbR4trMnUfHrH/6Rg+z/9qp0
         r8K+t13Qn7UeuHxqMffQnv9KoWKaR82DzwOfk6rVBld1Bhv4Xifja8RVOvhi10NMqYLX
         y9og==
X-Forwarded-Encrypted: i=1; AJvYcCX75clBAvG2ojG2zRS/Ppv11uDtW7Q6bNSiBK482k47C9G6Mp8BnPhdJKuXGj1ZICTLpVfVkb0J00ev8kM0y5yivYgTijtmCRzbG/NO
X-Gm-Message-State: AOJu0YxtVIX7ZsLw6wBg3iqBu4SEfQtm0ey5kSJyi6kPnaOcaTw/kr4M
	bBzff0U2nwjkvsc3d6ree22oWsAb9CKRaKAsmEBrYBtTpAQluiHBvnhZOA==
X-Google-Smtp-Source: AGHT+IFkhfOuCaoTH7srLL4fS+SHbt6ztb5ZSjV5+EDeNcsxBR4jkDVEbIZ0U7m3cOtY1ENf3ZVYAg==
X-Received: by 2002:a05:6a00:3d12:b0:70d:1dcf:e2a5 with SMTP id d2e1a72fcca58-7105d6958b8mr254797b3a.3.1722452018785;
        Wed, 31 Jul 2024 11:53:38 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f8369027sm9370609a12.38.2024.07.31.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 11:53:38 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:53:35 -0700
From: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To: Kevin Chu <kevin.chu@tw.synaptics.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Marge Yang <Marge.Yang@tw.synaptics.com>,
	Derek Cheng <derek.cheng@tw.synaptics.com>,
	David Chiu <David.Chiu@tw.synaptics.com>,
	Vincent Huang <Vincent.huang@tw.synaptics.com>,
	Sam Tsai <Sam.Tsai@synaptics.com>,
	Vincent Tang <Vincent.Tang@synaptics.com>
Subject: Re: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value.
Message-ID: <ZqqIL6cmqT4ZrqBO@google.com>
References: <20240320111058.601156-1-marge.yang@tw.synaptics.com>
 <MW4PR03MB6651C14EBEE7D8B56C82F1EFA3B12@MW4PR03MB6651.namprd03.prod.outlook.com>
 <DM4PR03MB599884A63173E935FAF7EE7FCFB12@DM4PR03MB5998.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR03MB599884A63173E935FAF7EE7FCFB12@DM4PR03MB5998.namprd03.prod.outlook.com>

Hi Kevin,

On Wed, Jul 31, 2024 at 09:17:56AM +0000, Kevin Chu wrote:
> Hi Dmitry and the Linux Input/Kernel Team,
>   
>   I hope this email finds you well. I'm reaching out regarding our
>   kernel code that has been awaiting review for over a quarter now.
> 
>   Given the extended period without review, it's likely that some gaps
>   or inconsistencies have developed in our code base. To ensure a
>   smooth and productive review process, we'd like to address any
>   potential issues proactively.
>   
>   Could you please provide some guidance or hints on areas we should
>   focus on before submitting for formal review? Your expertise would
>   be invaluable in helping us prepare effectively.
> 

There was nothing wrong with patch submission. If you see something
stuck please do not hesitate poking me.

A couple of questions about the patch below though:

> Thanks
> Kevin
> 
> -----Original Message-----
> From: Marge Yang <marge.yang@tw.synaptics.com> 
> Sent: Wednesday, March 20, 2024 7:11 PM
> To: dmitry.torokhov@gmail.com; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Marge Yang <Marge.Yang@tw.synaptics.com>
> Cc: David Chiu <David.Chiu@tw.synaptics.com>; Derek Cheng <derek.cheng@tw.synaptics.com>; Sam Tsai <Sam.Tsai@synaptics.com>; Vincent Huang <Vincent.huang@tw.synaptics.com>; Vincent Huang <Vincent.huang@tw.synaptics.com>
> Subject: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value.
> 
> RMI4 F12 will support to query DPM value on Touchpad.
> When TP firmware doesn't support to report logical and physical value within the Touchpad's HID report, We can directly query the DPM value through RMI.

It seems to me the logic is inverted, if there is resolution register
the new code will query it directly, otherwise it will try to get it
from the subpacket data. Is it intentional? Or did I parse it
incorrectly?

This also does not appear to be tied to the HID transport but rather
generic RMI4 code. Did I miss the connection?

> 
> Signed-off-by: Marge Yang <marge.yang@tw.synaptics.com>
> Signed-off-by: Vincent Huang <Vincent.Huang@tw.synaptics.com>
> ---
>  drivers/input/rmi4/rmi_f12.c | 41 +++++++++++++++++++++++++++++++----------
>  1 file changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c index 7e97944..6a7a17d 100644
> --- a/drivers/input/rmi4/rmi_f12.c
> +++ b/drivers/input/rmi4/rmi_f12.c
> @@ -24,6 +24,7 @@ enum rmi_f12_object_type {  };
>  
>  #define F12_DATA1_BYTES_PER_OBJ			8
> +#define RMI_QUERY_DPM_IN_PRESENSE_BIT          29

Why "BIT"? Should it be called RMI_F12_RESOLUTION_REG or similar?

>  
>  struct f12_data {
>  	struct rmi_2d_sensor sensor;
> @@ -73,6 +74,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
>  	int pitch_y = 0;
>  	int rx_receivers = 0;
>  	int tx_receivers = 0;
> +	u16 query_dpm_addr = 0;
> +	int dpm_resolution = 0;
>  
>  	item = rmi_get_register_desc_item(&f12->control_reg_desc, 8);
>  	if (!item) {
> @@ -122,18 +125,36 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
>  		offset += 4;
>  	}
>  
> -	if (rmi_register_desc_has_subpacket(item, 3)) {
> -		rx_receivers = buf[offset];
> -		tx_receivers = buf[offset + 1];
> -		offset += 2;
> -	}
> +	// Only supports to query DPM value on RMI F12.

I am unsure what this comment means... We are in F12 code, so what does
"only" mean here?

> +	item = rmi_get_register_desc_item(&f12->query_reg_desc, RMI_QUERY_DPM_IN_PRESENSE_BIT);
> +	if (item) {
> +		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
> +			RMI_QUERY_DPM_IN_PRESENSE_BIT);
> +		query_dpm_addr = fn->fd.query_base_addr	+ offset;
> +		ret = rmi_read(fn->rmi_dev, query_dpm_addr, buf);
> +		if (ret < 0) {
> +			dev_err(&fn->dev, "Failed to read DPM value: %d\n", ret);
> +			return -ENODEV;
> +		}
> +		dpm_resolution = buf[0];
> +
> +		sensor->x_mm = sensor->max_x / dpm_resolution;
> +		sensor->y_mm = sensor->max_y / dpm_resolution;
> +	} else {
> +		if (rmi_register_desc_has_subpacket(item, 3)) {
> +			rx_receivers = buf[offset];
> +			tx_receivers = buf[offset + 1];
> +			offset += 2;
> +		}
>  
> -	/* Skip over sensor flags */
> -	if (rmi_register_desc_has_subpacket(item, 4))
> -		offset += 1;
> +		/* Skip over sensor flags */
> +		if (rmi_register_desc_has_subpacket(item, 4))
> +			offset += 1;
> +
> +		sensor->x_mm = (pitch_x * rx_receivers) >> 12;
> +		sensor->y_mm = (pitch_y * tx_receivers) >> 12;
> +	}
>  
> -	sensor->x_mm = (pitch_x * rx_receivers) >> 12;
> -	sensor->y_mm = (pitch_y * tx_receivers) >> 12;
>  
>  	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s: x_mm: %d y_mm: %d\n", __func__,
>  		sensor->x_mm, sensor->y_mm);
> --
> 2.7.4
> 

Thanks.

-- 
Dmitry

