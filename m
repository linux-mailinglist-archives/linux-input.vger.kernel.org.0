Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38167A1F37
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 17:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbfH2Pb3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 11:31:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42888 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbfH2Pb3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 11:31:29 -0400
Received: by mail-wr1-f68.google.com with SMTP id b16so3870532wrq.9
        for <linux-input@vger.kernel.org>; Thu, 29 Aug 2019 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rbjz2X90VdQD30qgQblGHMm6dzBKGBcwAw5+it2jDPE=;
        b=F7wo8ckzJW/r0rXHOF3NTyPHRiYiDzLV9Nqq/9Nyz02llWBNe+F5anuuR5Abbba8gi
         OVnsbmCWqVVBRxIxDJ0Mypm+4vrkNWzONOUhTIa0wmQrfTc5cRZlKxjRe+5jK3cwsINk
         pFslYEimc05U4vnGMwY/4VMVIAddM1P7Cu/6S8fMepS31mgvnRtQFa88ZVVrZDTECtfc
         FOUvI42QBnST+Fr11rhAGKcmVP7wIc3FgfFuCskryHdcq6rD7z/BSUJ4ysBHMk0UeCLs
         Bz2ndDmO1r7lPDWBaJYtS0q6RGJ9Wos28VckcnAI55CQnhqNLIWhvgPpLzIm1lyJ8nAe
         xMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rbjz2X90VdQD30qgQblGHMm6dzBKGBcwAw5+it2jDPE=;
        b=Pqmypf4RLh1VDEoPoP8sCnS0tZdtIKtXnqt6Gzb4j2E4bD2DgmjVj4HqBverH27ygk
         m91MIC9Cwaw9dhri3IN0HFg6Zg4zw2dZgpuNxkcO3wfCPBqI5Uznzv/lu3z0P1UUO+/i
         03MIk8ejWYQrGZdVrvHqigvi4bB05G+i+PJHt4OKmU50vabxlHOSSPx2O5Hop8N/JrAS
         DtE2zRDL0CfH1KHcXlVrds3blh1D5GQCZ1st6z2YT+kMpQ2OAPv8Z1OfZYoUlqUjmGef
         pcyac7DdrJyiFuW5vOXlK6854YUVjG7lIYftkXWaeuba5KFZrFAdmH3pJSegLRgXx4Fb
         zOKA==
X-Gm-Message-State: APjAAAU5KZiRVSVxzSmy/PjS/zeSVKipoSM7ZR9qZhKxPl0akPWetTke
        LjCPQcZ6Fn7/eVvSt7/FN0eplw==
X-Google-Smtp-Source: APXvYqyYIi1//241THO2CGpk66eVvt65m84i7+YAM7ffzO0dF4GbgcT7MJXE17LKs/J7tFg6UKF2OA==
X-Received: by 2002:adf:db06:: with SMTP id s6mr1855272wri.348.1567092686839;
        Thu, 29 Aug 2019 08:31:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id r1sm2524685wro.13.2019.08.29.08.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 08:31:26 -0700 (PDT)
Date:   Thu, 29 Aug 2019 16:31:24 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        george_davis@mentor.com
Subject: Re: [PATCH v2 29/49] Input: atmel_mxt_ts - implement debug output
 for messages
Message-ID: <20190829153124.cozqsegnmvxveecd@holly.lan>
References: <20190827062943.20698-1-jiada_wang@mentor.com>
 <20190827062943.20698-5-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827062943.20698-5-jiada_wang@mentor.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 27, 2019 at 03:29:23PM +0900, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> Add a debug switch which causes all messages from the touch controller to
> be dumped to the dmesg log with a set prefix "MXT MSG:". This is used by
> Atmel user-space utilities to debug touch operation. Enabling this output
> does impact touch performance.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> (cherry picked from ndyer/linux/for-upstream commit 3c3fcfdd4889dfeb1c80ae8cd94a622c6342b06a)
> [gdavis: Forward port and fix conflicts.]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 44 ++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 2d2e8ea30547..941c6970cb70 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -335,6 +335,7 @@ struct mxt_data {
>  	u8 t100_aux_ampl;
>  	u8 t100_aux_area;
>  	u8 t100_aux_vect;
> +	bool debug_enabled;
>  	u8 max_reportid;
>  	u32 config_crc;
>  	u32 info_crc;
> @@ -460,8 +461,8 @@ static bool mxt_object_readable(unsigned int type)
>  
>  static void mxt_dump_message(struct mxt_data *data, u8 *message)
>  {
> -	dev_dbg(&data->client->dev, "message: %*ph\n",
> -		data->T5_msg_size, message);
> +	dev_dbg(&data->client->dev, "MXT MSG: %*ph\n",
> +		       data->T5_msg_size, message);

I'm not 100% convinced that the kernel should change here (arguably the
userspace utility should be modified instead) but if the messages are
conforming to some sort of vendor specific protocol then some commenting
is needed.


> @@ -3538,6 +3573,8 @@ static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
>  static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
>  static DEVICE_ATTR(update_cfg, S_IWUSR, NULL, mxt_update_cfg_store);
>  static DEVICE_ATTR(config_crc, S_IRUGO, mxt_config_crc_show, NULL);
> +static DEVICE_ATTR(debug_enable, S_IWUSR | S_IRUSR, mxt_debug_enable_show,
> +		   mxt_debug_enable_store);

Why isn't CONFIG_DYNAMIC_DEBUG sufficient to enable/disable the
messages?


Daniel.
