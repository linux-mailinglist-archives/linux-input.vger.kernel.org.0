Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7F42D5792
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 10:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgLJJv1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 04:51:27 -0500
Received: from mga11.intel.com ([192.55.52.93]:9423 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbgLJJv0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 04:51:26 -0500
IronPort-SDR: HZ2k1DdHJIUHyV9PlK39DA9aOSR2UPpHE5cut2ib9Kri2XJKKTAPREP6nBeVD/hGj7dMktvAiv
 pbkfYrfv50Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="170718093"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="170718093"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 01:49:36 -0800
IronPort-SDR: sakz8cdy0isTDgAZEXYgncsulmvp3bVMUydDhGHpiIWOjn4aZovL+tdcc7/0pgT7k0cANhD1jz
 tXc1gCJTSgYA==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="438277008"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 01:49:35 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1knIar-00DNjr-ED; Thu, 10 Dec 2020 11:50:37 +0200
Date:   Thu, 10 Dec 2020 11:50:37 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Marco Felsch <m.felsch@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Simon Budig <simon.budig@kernelconcepts.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - consolidate handling of number of
 electrodes
Message-ID: <20201210095037.GC4077@smile.fi.intel.com>
References: <X9FZFs3NZADoIhhH@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9FZFs3NZADoIhhH@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 09, 2020 at 03:09:10PM -0800, Dmitry Torokhov wrote:
> Instead of using special-casing retrieval of number of X/Y electrodes
> based on the firmware, let's select default values and mark registers as
> non-existent on firmwares that do not support this operation.
> 
> Also mark "report rate" register as non-existent for generic firmwares as
> having it set to 0 does not make sense.

Makes sense, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 43 ++++++++++----------------
>  1 file changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 6ff81d48da86..2eefbc2485bc 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -69,6 +69,9 @@
>  #define EDT_RAW_DATA_RETRIES		100
>  #define EDT_RAW_DATA_DELAY		1000 /* usec */
>  
> +#define EDT_DEFAULT_NUM_X		1024
> +#define EDT_DEFAULT_NUM_Y		1024
> +
>  enum edt_pmode {
>  	EDT_PMODE_NOT_SUPPORTED,
>  	EDT_PMODE_HIBERNATE,
> @@ -977,8 +980,7 @@ static void edt_ft5x06_ts_get_defaults(struct device *dev,
>  	}
>  }
>  
> -static void
> -edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
> +static void edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
>  {
>  	struct edt_reg_addr *reg_addr = &tsdata->reg_addr;
>  
> @@ -997,21 +999,17 @@ edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
>  	if (reg_addr->reg_report_rate != NO_REGISTER)
>  		tsdata->report_rate = edt_ft5x06_register_read(tsdata,
>  						reg_addr->reg_report_rate);
> -	if (tsdata->version == EDT_M06 ||
> -	    tsdata->version == EDT_M09 ||
> -	    tsdata->version == EDT_M12) {
> +	tsdata->num_x = EDT_DEFAULT_NUM_X;
> +	if (reg_addr->reg_num_x != NO_REGISTER)
>  		tsdata->num_x = edt_ft5x06_register_read(tsdata,
>  							 reg_addr->reg_num_x);
> +	tsdata->num_y = EDT_DEFAULT_NUM_Y;
> +	if (reg_addr->reg_num_y != NO_REGISTER)
>  		tsdata->num_y = edt_ft5x06_register_read(tsdata,
>  							 reg_addr->reg_num_y);
> -	} else {
> -		tsdata->num_x = -1;
> -		tsdata->num_y = -1;
> -	}
>  }
>  
> -static void
> -edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
> +static void edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
>  {
>  	struct edt_reg_addr *reg_addr = &tsdata->reg_addr;
>  
> @@ -1041,22 +1039,25 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
>  
>  	case EV_FT:
>  		reg_addr->reg_threshold = EV_REGISTER_THRESHOLD;
> +		reg_addr->reg_report_rate = NO_REGISTER;
>  		reg_addr->reg_gain = EV_REGISTER_GAIN;
>  		reg_addr->reg_offset = NO_REGISTER;
>  		reg_addr->reg_offset_x = EV_REGISTER_OFFSET_X;
>  		reg_addr->reg_offset_y = EV_REGISTER_OFFSET_Y;
>  		reg_addr->reg_num_x = NO_REGISTER;
>  		reg_addr->reg_num_y = NO_REGISTER;
> -		reg_addr->reg_report_rate = NO_REGISTER;
>  		break;
>  
>  	case GENERIC_FT:
>  		/* this is a guesswork */
>  		reg_addr->reg_threshold = M09_REGISTER_THRESHOLD;
> +		reg_addr->reg_report_rate = NO_REGISTER;
>  		reg_addr->reg_gain = M09_REGISTER_GAIN;
>  		reg_addr->reg_offset = M09_REGISTER_OFFSET;
>  		reg_addr->reg_offset_x = NO_REGISTER;
>  		reg_addr->reg_offset_y = NO_REGISTER;
> +		reg_addr->reg_num_x = NO_REGISTER;
> +		reg_addr->reg_num_y = NO_REGISTER;
>  		break;
>  	}
>  }
> @@ -1195,20 +1196,10 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  	input->id.bustype = BUS_I2C;
>  	input->dev.parent = &client->dev;
>  
> -	if (tsdata->version == EDT_M06 ||
> -	    tsdata->version == EDT_M09 ||
> -	    tsdata->version == EDT_M12) {
> -		input_set_abs_params(input, ABS_MT_POSITION_X,
> -				     0, tsdata->num_x * 64 - 1, 0, 0);
> -		input_set_abs_params(input, ABS_MT_POSITION_Y,
> -				     0, tsdata->num_y * 64 - 1, 0, 0);
> -	} else {
> -		/* Unknown maximum values. Specify via devicetree */
> -		input_set_abs_params(input, ABS_MT_POSITION_X,
> -				     0, 65535, 0, 0);
> -		input_set_abs_params(input, ABS_MT_POSITION_Y,
> -				     0, 65535, 0, 0);
> -	}
> +	input_set_abs_params(input, ABS_MT_POSITION_X,
> +			     0, tsdata->num_x * 64 - 1, 0, 0);
> +	input_set_abs_params(input, ABS_MT_POSITION_Y,
> +			     0, tsdata->num_y * 64 - 1, 0, 0);
>  
>  	touchscreen_parse_properties(input, true, &tsdata->prop);
>  
> -- 
> 2.29.2.576.ga3fc446d84-goog
> 
> 
> -- 
> Dmitry

-- 
With Best Regards,
Andy Shevchenko


