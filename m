Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24149A1EEB
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 17:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbfH2PYF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 11:24:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52042 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbfH2PYE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 11:24:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id k1so4168458wmi.1
        for <linux-input@vger.kernel.org>; Thu, 29 Aug 2019 08:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iZLJ3mfpN/JYypLK5mfRus9dYINbs2EIonEPAPBUqGU=;
        b=PvNnxkNKuMrAHGkVFwa1A1U/RoukcGYwDpXHVBKjRcSbyawvtbqpivHi0KFkd4Tjbc
         a1jClVF2D5jwObvvP+Jq2OiEgWgXsj1SjHMBkKPQvHMyumg7KOy962UhnD/HUZC5Ic5u
         BgDDUTCiXoYs+8GeDb7wynvZBmjE+DAlqo6xpvFpvGvVJkzHfxx2Nc71GLlpna/Zqxsc
         aH59QQQ8NBNft3pWGO6SPtUd9dmgCqgkGdEmJwi2owr4C8gqO/7Kj4mBG67zNW38ezdr
         n/1XyJQttvYD3I6lizLHUshkGpBJ2C18bbt2MPnNlDE5kLLSiwbn10TlUGA8wSGd4QH0
         GhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iZLJ3mfpN/JYypLK5mfRus9dYINbs2EIonEPAPBUqGU=;
        b=MyHdEDamG9gX37oh2sw7HS/1bkuQYHI//vKagFea41Z9cmIklI9vBJxkLgOhcbF0fp
         baj3LGMMcAtNNINp9ssTlPtDRDWpVW5+3DQULB2EO96ZWY/pRP626Lm8FYXaiadJZElT
         1tn4USTUZWDEWhqkQWyhzZkdrNhpifastnP5c/WpDvUlIxgOUsTQVuGMNpp+Ms8nJJCh
         A+A45MoyhPu2q2dPVJ1+VwV33e4VbVcbTuLA3TuQ916NGy+7My78MQpnS7otf1RsLuax
         y/AN8Xy1m6AxyKWrcMZGETClN4r/d6g+UeH5ro+fMHw6MmFRVoMr7x/YdUVRpwx9PMiR
         uHKw==
X-Gm-Message-State: APjAAAX6/ZPzUqYo5w+DcuTUL7QV+iLMFj1a7XGN/tpgMIY0YkJpmm8T
        gZOGdfdJg/8hicKgKPZo2m6JIg==
X-Google-Smtp-Source: APXvYqzq5h58y9lpKBl23tfI1PowsF+bh9FI3BAdFNHFblv40iLzG/5Zq/3UWLFrDNYDVLfHR3DAbQ==
X-Received: by 2002:a05:600c:40f:: with SMTP id q15mr12564428wmb.88.1567092243089;
        Thu, 29 Aug 2019 08:24:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id s19sm5520867wrb.94.2019.08.29.08.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 08:24:02 -0700 (PDT)
Date:   Thu, 29 Aug 2019 16:24:00 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        george_davis@mentor.com
Subject: Re: [PATCH v2 12/49] Input: atmel_mxt_ts - add debug for T92 gesture
 and T93 touch seq msgs
Message-ID: <20190829152400.iqup6lztqjmcqzrc@holly.lan>
References: <20190827062756.20380-1-jiada_wang@mentor.com>
 <20190827062756.20380-3-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827062756.20380-3-jiada_wang@mentor.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 27, 2019 at 03:27:19PM +0900, Jiada Wang wrote:
> From: Karl Tsou <karl.funlab@gmail.com>

This description is a little brief.

> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> (cherry picked from ndyer/linux/for-upstream commit cb98986f8342107bf4a536aed4160b20839e97c1)
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 40 ++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 4e237209cb34..26861252c088 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -71,6 +71,8 @@
>  #define MXT_SPT_MESSAGECOUNT_T44	44
>  #define MXT_SPT_CTECONFIG_T46		46
>  #define MXT_SPT_DYNAMICCONFIGURATIONCONTAINER_T71 71
> +#define MXT_PROCI_SYMBOLGESTUREPROCESSOR	92
> +#define MXT_PROCI_TOUCHSEQUENCELOGGER	93
>  #define MXT_TOUCH_MULTITOUCHSCREEN_T100 100
>  #define MXT_PROCI_ACTIVESTYLUS_T107	107
>  
> @@ -349,6 +351,10 @@ struct mxt_data {
>  	u8 T42_reportid_max;
>  	u16 T44_address;
>  	u8 T48_reportid;
> +	u16 T92_address;
> +	u8 T92_reportid;
> +	u16 T93_address;
> +	u8 T93_reportid;
>  	u8 T100_reportid_min;
>  	u8 T100_reportid_max;
>  	u16 T107_address;
> @@ -1113,6 +1119,24 @@ static int mxt_proc_t48_messages(struct mxt_data *data, u8 *msg)
>  	return 0;
>  }
>  
> +static void mxt_proc_t92_messages(struct mxt_data *data, u8 *msg)
> +{
> +	struct device *dev = &data->client->dev;
> +	u8 status = msg[1];
> +
> +	dev_info(dev, "T92 long stroke LSTR=%d %d\n",
> +		 (status & 0x80) ? 1 : 0,
> +		 status & 0x0F);

Shouldn't this be dev_dbg().


> +}
> +
> +static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
> +{
> +	struct device *dev = &data->client->dev;
> +	u8 status = msg[1];
> +
> +	dev_info(dev, "T93 report double tap %d\n", status);

Ditto.


Daniel.

> +}
> +
>  static int mxt_proc_message(struct mxt_data *data, u8 *message)
>  {
>  	u8 report_id = message[0];
> @@ -1145,6 +1169,10 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
>  	} else if (report_id >= data->T15_reportid_min
>  		   && report_id <= data->T15_reportid_max) {
>  		mxt_proc_t15_messages(data, message);
> +	} else if (report_id == data->T92_reportid) {
> +		mxt_proc_t92_messages(data, message);
> +	} else if (report_id == data->T93_reportid) {
> +		mxt_proc_t93_messages(data, message);
>  	} else {
>  		mxt_dump_message(data, message);
>  	}
> @@ -1814,6 +1842,10 @@ static void mxt_free_object_table(struct mxt_data *data)
>  	data->T42_reportid_max = 0;
>  	data->T44_address = 0;
>  	data->T48_reportid = 0;
> +	data->T92_reportid = 0;
> +	data->T92_address = 0;
> +	data->T93_reportid = 0;
> +	data->T93_address = 0;
>  	data->T100_reportid_min = 0;
>  	data->T100_reportid_max = 0;
>  	data->max_reportid = 0;
> @@ -1906,6 +1938,14 @@ static int mxt_parse_object_table(struct mxt_data *data,
>  		case MXT_PROCG_NOISESUPPRESSION_T48:
>  			data->T48_reportid = min_id;
>  			break;
> +		case MXT_PROCI_SYMBOLGESTUREPROCESSOR:
> +			data->T92_reportid = min_id;
> +			data->T92_address = object->start_address;
> +			break;
> +		case MXT_PROCI_TOUCHSEQUENCELOGGER:
> +			data->T93_reportid = min_id;
> +			data->T93_address = object->start_address;
> +			break;
>  		case MXT_TOUCH_MULTITOUCHSCREEN_T100:
>  			data->multitouch = MXT_TOUCH_MULTITOUCHSCREEN_T100;
>  			data->T100_reportid_min = min_id;
> -- 
> 2.19.2
> 
