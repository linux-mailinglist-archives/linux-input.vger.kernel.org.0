Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A66228504
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 18:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729252AbgGUQLb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 12:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgGUQLa (ORCPT
        <rfc822;Linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 12:11:30 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE09C061794;
        Tue, 21 Jul 2020 09:11:30 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l63so12145102pge.12;
        Tue, 21 Jul 2020 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zzbqiqwc31KqM2Et+XXVVCncSRbRlF1CE6a0KngbCr4=;
        b=XteG9C2sTpsUs/HxH1Gl6SoUdO37jKoh41TMOEcyoRXZ7LxUfPeTVPqzg4HlkDV1t5
         2QRD6kpEAxo/NN5IwXkhUxyVVO00h76W7xIMZbN7miYrIgPCzl6Y6/M0K6Ih5rFirEig
         bLlXMauZ0g32g3L23MWHi04X5S54e4mkHwx/VidzbQPLrPWs4ckBcMHjoe2hPDDDsXKe
         CE2Z1LCm9inpF+bonThIPDaM5HO7g5jiT3kONjI/1KmUIaXAEldB5k6ko23u8W1tIfv3
         Ls9Vo6Khe/eH0SY4SoKPFjZghQSuXyrlkgVCA3zYAZqOQ0dRQ7eR1UM8CcNQ/7DVfb7y
         AX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zzbqiqwc31KqM2Et+XXVVCncSRbRlF1CE6a0KngbCr4=;
        b=SNlrkMm2cU7osGC+LfmPokdVhQZ44YJHmH+ICXU0ql87vEnOPMlJ2kGHTy4cZkTMmf
         WXEE+W0iyvpqb9XPcuGvNabiEfwLK1KcfGkUKKn9+2IQjehsWJEl8RVDxn4zcM/5rSs8
         QECL5EKC2/5WKr6q5Lp8/I3UC1R06KkMrUk35w1xSNNMgTAE8mMaIssCqYo4iihso4Si
         fmU77ukOBEh7plnaTCfKt8r555pRzEC9HbmW06a/nklHt7qZXAypNePRpdU3jfSsOB6a
         r8QtEr0iXCGj5wB+eNfLVassoaNTtfHdWAwb//Ky434fKkQIXd7vw0Bt+HcsdaTZ8CZg
         jjVw==
X-Gm-Message-State: AOAM532g7Fc5GLeH3Vj0O5lvtyx49TYzZS8rCLqQZRzkuDOD4QDgHFV2
        yRbSzpeyv/kEW2LsI6f4zfU=
X-Google-Smtp-Source: ABdhPJzxE03akPm+IwBFiaKcJKj6zq/o38hm9NIkh217Fsr0Fz+tmHT7V4RilIvMM8XlR10uKVtc4w==
X-Received: by 2002:a62:7bc9:: with SMTP id w192mr25188892pfc.255.1595347890006;
        Tue, 21 Jul 2020 09:11:30 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u8sm3680495pjn.24.2020.07.21.09.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 09:11:28 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <Dmitry.torokhov@gmail.com>
Date:   Tue, 21 Jul 2020 09:11:26 -0700
To:     Dave Wang <dave.wang@emc.com.tw>
Cc:     Linux-input@vger.kernel.org, Linux-kernel@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com
Subject: Re: [PATCH 3/3] Input: elan_i2c - Get the device information from
 PS/2 interface
Message-ID: <20200721161126.GH1665100@dtor-ws>
References: <20191209111842.32390-1-dave.wang@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209111842.32390-1-dave.wang@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dave,

On Mon, Dec 09, 2019 at 06:18:42AM -0500, Dave Wang wrote:
> Get the device information from PS/2 interface for PS/2+SMBus
> protocol such as product_id, fw_version, ic_type...etc.
> 
> Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
> ---
>  drivers/input/mouse/elan_i2c_smbus.c | 87 +++++++++++++++++-----------
>  1 file changed, 54 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
> index 9ffb1f834507..35919035ec89 100644
> --- a/drivers/input/mouse/elan_i2c_smbus.c
> +++ b/drivers/input/mouse/elan_i2c_smbus.c
> @@ -146,17 +146,22 @@ static int elan_smbus_get_version(struct i2c_client *client,
>  	int error;
>  	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
>  
> -	error = i2c_smbus_read_block_data(client,
> -					  iap ? ETP_SMBUS_IAP_VERSION_CMD :
> -						ETP_SMBUS_FW_VERSION_CMD,
> -					  val);
> -	if (error < 0) {
> -		dev_err(&client->dev, "failed to get %s version: %d\n",
> -			iap ? "IAP" : "FW", error);
> -		return error;
> +	if (device_property_read_u8(&client->dev,
> +				iap ? "elan,iap_version" : "elan,fw_version",
> +				version)) {

Should this be moved into core? Or we only plan on using this on SMbus?
What will happen after firmware update? How can userspace verify that
the firmware update completed successfully if we always return static
data? Can the device still be accessed via PS/2 while also using SMbus?

Thanks.

-- 
Dmitry
