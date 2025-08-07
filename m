Return-Path: <linux-input+bounces-13856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0860B1D828
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 14:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FE707B238C
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 12:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D092824728B;
	Thu,  7 Aug 2025 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpSakPD5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250B825393C
	for <linux-input@vger.kernel.org>; Thu,  7 Aug 2025 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754570583; cv=none; b=W8HTdT2J3YMlYB/5z75ZtIXYRychILhdMNhp3SjjCSLx75BdS7HfONWwxPW3f0Aery4Q7RHHG5bkTk2ETlmLZpPNwghsw7Av7J76HvLqXyl8uzu2amXM5RiLKt5i6yjp0vafDf2hgb+eiTq8K29EWO9yqUQzVVlMhIBfP3cGshI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754570583; c=relaxed/simple;
	bh=3zgP7iR6K7q9sLZ8DSbuc508pNd9u2UBGuvPUziUXxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8sVvPB3KvRWKYn3Crfmlmbk3xeOKvHHZr+a7jzCGVHrJ5NO5gZEFfNvcNRL2pqfZQBSTUAGEoG1eYEwzzl6SQREuTykx1C0bjG51DYcbX7Jn6Tla8JtTfwoKuuXWzi3nfUjnxwORgwrtGTYSRqVoqIgSXhVHoyMAfqWVoJe8I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpSakPD5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae9c2754a00so192024566b.2
        for <linux-input@vger.kernel.org>; Thu, 07 Aug 2025 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754570579; x=1755175379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+FEF9xNUl87NULgl2gpCQyvIOR29nQAQJmVR0Lxk4Y=;
        b=cpSakPD5XYoxKp3XB7LIUlI2Aa0RDggmenZqs9HeQo3b2V/Znc5jP37xF7iSoU5h2C
         SKulhOkBN4iLpto0UsJhyrv3Ri3M1E26YIr9hhRPFminYmD7dt9UoCjub9QfSGpUyKbj
         DYqbseXFyl0UzJM9anbexpQIbY1/7TCJgWS1KNOfNwEbO6u7qD7A2bFTW2M8wUMLa5iC
         jjR/T1rSiZdw5MK9cwg4xroryEFzROihvC0ixQobhAMqkJgu6SnQr1lr+PJrgpiF3yub
         rqxBjnNe8HDNsvJG2ul1F7De0+gi0ylmQMuGKKFdf9o0dOwCX7u+crD92lYzOTL1R3JM
         1nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754570579; x=1755175379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+FEF9xNUl87NULgl2gpCQyvIOR29nQAQJmVR0Lxk4Y=;
        b=WRqTOwwnePrtEOkPbbRB1KFdTY7Exfke5eQJ6Oi5IeUMaGp7dO3/sfpKcQ1uCUPlgG
         CMQuOT1EABRKvH9sQI9tcNk2eqIHRb39To14yMpasw0EJMPESw1y/JGJpI2M3pRsDGxw
         khk/cX9vfcmdVxPncNf7JwPpGS80qIUw1Ac1oeudn0uXZM/EmunFZZvJ9cqx1kyGuzl3
         D0PmTD+lweX036faoFg0r2DLHSCwRBxz2i384e40kW/0Y+qikQY/O9aEsm/EyfUXsZpN
         EEHs4gNieBzAcfyGRxAiHemyHvCyhd9chQ/nAPrG+JYCBLBL1QLyLVeVtiebEcW8ynLq
         QpJw==
X-Forwarded-Encrypted: i=1; AJvYcCVSd8uSFQJ+4HrQRDIapmdZn26QxXGNNw9hcMY7vIjKG2bIUiNAEtjNzLgwlw8u/ovmvk3IZFGEL6BNuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygT+XABtgCCQKmf8Tas09L8I4HTq1B3awCInuR9A912G7MvgX+
	wVLlU8jvC0XV1gmpYArYaS1OYYfJS0h9WdyTcIjDmkoTvW1L5DbWg4Tq
X-Gm-Gg: ASbGnctGsT6TSl/xSIE2rUEfGk167gsfpzNMqv7WOdYArXD/1CctEGa5yOZrOi0U9//
	OA8Tc1AmlxBJ21Ebb9TwvrsJ7NEIQ0NkIi2EcqGF3LIoYtkVRfCLjVJjj1LK0+8roATYLc5lUBb
	vdFzfZSWEYKy/6l4M/d3xvcWMTMlmB+F6N/YDjFtCcn8tHN9H4XdDj+GykE1h/BNxth2KHNfzkR
	4MFM1CEwypsGtX6HiaBUUEtmLBpFVY4pvzD1OiEAgiboAlgiVwZcUdvGTPUmZlXmuoPox+DMV3H
	3J9JkQ3/PwyNz78Xekv2i+QyRliRBChTCSnOvQXHKbCjGwMsGDccp4adC/tnDy+aFWJh8nqpfOu
	SAfj7cqvBikU955MFQIDZf/fpYw==
X-Google-Smtp-Source: AGHT+IFd38Ak1KsXIH8QDdjHIZb+w+PSHX7kL/etdHGM3/kvJMbPEj2e9COm/bqyVP8/s6+LH2Fllw==
X-Received: by 2002:a17:906:c10b:b0:af9:3116:e0f6 with SMTP id a640c23a62f3a-af9904baf22mr671444066b.53.1754570579083;
        Thu, 07 Aug 2025 05:42:59 -0700 (PDT)
Received: from fedora.localnet ([79.127.145.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92a2ec9cbsm1189034766b.79.2025.08.07.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 05:42:58 -0700 (PDT)
From: butmonkeh@gmail.com
To: jikos@kernel.org, bentiss@kernel.org,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Mario.Limonciello@amd.com, linux-input@vger.kernel.org,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Eric Naim <dnaim@cachyos.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>
Subject: Re: [PATCH v2] HID: amd_sfh: Enable operating mode
Date: Thu, 07 Aug 2025 13:42:56 +0100
Message-ID: <5275875.OV4Wx5bFTl@fedora>
In-Reply-To: <20250623085453.2267034-1-Basavaraj.Natikar@amd.com>
References: <20250623085453.2267034-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 23 June 2025 09:54:53 British Summer Time Basavaraj Natikar wrote:
> Add changes to enable operating modes in the driver to allow the FW to
> activate and retrieve data from relevant sensors. This enables the FW to
> take necessary actions based on the operating modes.
> 
> Tested-by: Eric Naim <dnaim@cachyos.org>
> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
> v2:
> * Increased missing device count.
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c | 23 +++++++++++++++++++++++
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.h    |  2 +-
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  4 ++++
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  1 +
>  4 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> b/drivers/hid/amd-sfh-hid/amd_sfh_client.c index 3438d392920f..0f2cbae39b2b
> 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> @@ -146,6 +146,8 @@ static const char *get_sensor_name(int idx)
>  		return "gyroscope";
>  	case mag_idx:
>  		return "magnetometer";
> +	case op_idx:
> +		return "operating-mode";
>  	case als_idx:
>  	case ACS_IDX: /* ambient color sensor */
>  		return "ALS";
> @@ -243,6 +245,20 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev
> *privdata) rc = -ENOMEM;
>  			goto cleanup;
>  		}
> +
> +		if (cl_data->sensor_idx[i] == op_idx) {
> +			info.period = AMD_SFH_IDLE_LOOP;
> +			info.sensor_idx = cl_data->sensor_idx[i];
> +			info.dma_address = cl_data->sensor_dma_addr[i];
> +			mp2_ops->start(privdata, info);
> +			cl_data->sensor_sts[i] = 
amd_sfh_wait_for_response(privdata,
> +								
	   cl_data->sensor_idx[i],
> +								
	   SENSOR_ENABLED);
> +			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
> +				cl_data->is_any_sensor_enabled = true;
> +			continue;
> +		}
> +
>  		cl_data->sensor_sts[i] = SENSOR_DISABLED;
>  		cl_data->sensor_requested_cnt[i] = 0;
>  		cl_data->cur_hid_dev = i;
> @@ -303,6 +319,13 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev
> *privdata)
> 
>  	for (i = 0; i < cl_data->num_hid_devices; i++) {
>  		cl_data->cur_hid_dev = i;
> +		if (cl_data->sensor_idx[i] == op_idx) {
> +			dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
> +				cl_data->sensor_idx[i], 
get_sensor_name(cl_data->sensor_idx[i]),
> +				cl_data->sensor_sts[i]);
> +			continue;
> +		}
> +
>  		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>  			rc = amdtp_hid_probe(i, cl_data);
>  			if (rc)
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h index 1c91be8daedd..7452b0302953
> 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> @@ -11,7 +11,7 @@
>  #ifndef AMDSFH_HID_H
>  #define AMDSFH_HID_H
> 
> -#define MAX_HID_DEVICES		6
> +#define MAX_HID_DEVICES		7
>  #define AMD_SFH_HID_VENDOR	0x1022
>  #define AMD_SFH_HID_PRODUCT	0x0001
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c index 1c1fd63330c9..2983af969579
> 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -29,6 +29,7 @@
>  #define ACEL_EN		BIT(0)
>  #define GYRO_EN		BIT(1)
>  #define MAGNO_EN	BIT(2)
> +#define OP_EN		BIT(15)
>  #define HPD_EN		BIT(16)
>  #define ALS_EN		BIT(19)
>  #define ACS_EN		BIT(22)
> @@ -232,6 +233,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata,
> u8 *sensor_id) if (MAGNO_EN & activestatus)
>  		sensor_id[num_of_sensors++] = mag_idx;
> 
> +	if (OP_EN & activestatus)
> +		sensor_id[num_of_sensors++] = op_idx;
> +
>  	if (ALS_EN & activestatus)
>  		sensor_id[num_of_sensors++] = als_idx;
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
> b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h index 05e400a4a83e..2eb61f4e8434
> 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
> @@ -79,6 +79,7 @@ enum sensor_idx {
>  	accel_idx = 0,
>  	gyro_idx = 1,
>  	mag_idx = 2,
> +	op_idx = 15,
>  	als_idx = 19
>  };

Tested-by: Marc H (butmonkeh@gmail.com) Asus ROG Flow X13 (GV301) - working



