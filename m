Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FDB7CD625
	for <lists+linux-input@lfdr.de>; Wed, 18 Oct 2023 10:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjJRIPQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Oct 2023 04:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjJRIPP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Oct 2023 04:15:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A92B6;
        Wed, 18 Oct 2023 01:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697616913; x=1729152913;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=17exRRvNmKwTGh65tU4pd3aVP5pBtBAM+VqgKZy4Ty0=;
  b=Z+VSXvgd3HknzY1OwiWlUg0DVFjV3CsWJDOeSuqbbnGWgE0dZTPGkdIc
   fr42T6nMKexGzwB/M5X8YZbTCcgDOd+jemWytxk8IVhkZyqxI3bsDrVp1
   +r9r48SlE8BzwZbAdLDSvMoHMQyMo3ap8Rvt61btqBDyBvZnIPfFuAWV6
   86YwDrwLTXgw21MI/z81I81q8TkQXdP67EoSNSRgyCHaPoFbYpXI7rk7b
   Reu1+ZYhNbUvi0Wz9PuBd9lkR9hZ9PzAAqoufATPCjcXqEffcwTPGQT3t
   tXCAWWC+A30LjSJ4Y/9tJ7vT6+wQP0anVo8/3LwQuydSgMFmWOUKGP7jx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="371028487"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="371028487"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 01:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="760133296"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="760133296"
Received: from gruberda-mobl1.ger.corp.intel.com ([10.252.62.52])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 01:15:07 -0700
Date:   Wed, 18 Oct 2023 11:15:05 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Basavaraj Natikar <basavaraj.natikar@amd.com>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
        Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 15/17] HID: amd_sfh: rename float_to_int() to
 amd_sfh_float_to_int()
In-Reply-To: <20231018070241.2041529-16-Shyam-sundar.S-k@amd.com>
Message-ID: <e0d9adc1-83c6-1f5a-6f1d-a52391d36ed2@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com> <20231018070241.2041529-16-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-983461305-1697616911=:2178"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-983461305-1697616911=:2178
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 18 Oct 2023, Shyam Sundar S K wrote:

> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> Current amd_sfh driver has float_to_int() to convert units from
> float to int. This is fine until this function gets called outside of
> the current scope of file.
> 
> Add a prefix "amd_sfh" to float_to_int() so that function represents
> the driver name. This function will be called by multiple callers in the
> next patch.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 22 +++++++++----------
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> index 06bdcf072d10..dbc8c6943ca1 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> @@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
>  	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
>  }
>  
> -static int float_to_int(u32 flt32_val)
> +int amd_sfh_float_to_int(u32 flt32_val)
>  {
>  	int fraction, shift, mantissa, sign, exp, zeropre;
>  
> @@ -200,9 +200,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
>  			     OFFSET_SENSOR_DATA_DEFAULT;
>  		memcpy_fromio(&accel_data, sensoraddr, sizeof(struct sfh_accel_data));
>  		get_common_inputs(&acc_input.common_property, report_id);
> -		acc_input.in_accel_x_value = float_to_int(accel_data.acceldata.x) / 100;
> -		acc_input.in_accel_y_value = float_to_int(accel_data.acceldata.y) / 100;
> -		acc_input.in_accel_z_value = float_to_int(accel_data.acceldata.z) / 100;
> +		acc_input.in_accel_x_value = amd_sfh_float_to_int(accel_data.acceldata.x) / 100;
> +		acc_input.in_accel_y_value = amd_sfh_float_to_int(accel_data.acceldata.y) / 100;
> +		acc_input.in_accel_z_value = amd_sfh_float_to_int(accel_data.acceldata.z) / 100;
>  		memcpy(input_report, &acc_input, sizeof(acc_input));
>  		report_size = sizeof(acc_input);
>  		break;
> @@ -211,9 +211,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
>  			     OFFSET_SENSOR_DATA_DEFAULT;
>  		memcpy_fromio(&gyro_data, sensoraddr, sizeof(struct sfh_gyro_data));
>  		get_common_inputs(&gyro_input.common_property, report_id);
> -		gyro_input.in_angel_x_value = float_to_int(gyro_data.gyrodata.x) / 1000;
> -		gyro_input.in_angel_y_value = float_to_int(gyro_data.gyrodata.y) / 1000;
> -		gyro_input.in_angel_z_value = float_to_int(gyro_data.gyrodata.z) / 1000;
> +		gyro_input.in_angel_x_value = amd_sfh_float_to_int(gyro_data.gyrodata.x) / 1000;
> +		gyro_input.in_angel_y_value = amd_sfh_float_to_int(gyro_data.gyrodata.y) / 1000;
> +		gyro_input.in_angel_z_value = amd_sfh_float_to_int(gyro_data.gyrodata.z) / 1000;
>  		memcpy(input_report, &gyro_input, sizeof(gyro_input));
>  		report_size = sizeof(gyro_input);
>  		break;
> @@ -222,9 +222,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
>  			     OFFSET_SENSOR_DATA_DEFAULT;
>  		memcpy_fromio(&mag_data, sensoraddr, sizeof(struct sfh_mag_data));
>  		get_common_inputs(&magno_input.common_property, report_id);
> -		magno_input.in_magno_x = float_to_int(mag_data.magdata.x) / 100;
> -		magno_input.in_magno_y = float_to_int(mag_data.magdata.y) / 100;
> -		magno_input.in_magno_z = float_to_int(mag_data.magdata.z) / 100;
> +		magno_input.in_magno_x = amd_sfh_float_to_int(mag_data.magdata.x) / 100;
> +		magno_input.in_magno_y = amd_sfh_float_to_int(mag_data.magdata.y) / 100;
> +		magno_input.in_magno_z = amd_sfh_float_to_int(mag_data.magdata.z) / 100;
>  		magno_input.in_magno_accuracy = mag_data.accuracy / 100;
>  		memcpy(input_report, &magno_input, sizeof(magno_input));
>  		report_size = sizeof(magno_input);
> @@ -234,7 +234,7 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
>  			     OFFSET_SENSOR_DATA_DEFAULT;
>  		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
>  		get_common_inputs(&als_input.common_property, report_id);
> -		als_input.illuminance_value = float_to_int(als_data.lux);
> +		als_input.illuminance_value = amd_sfh_float_to_int(als_data.lux);
>  		report_size = sizeof(als_input);
>  		memcpy(input_report, &als_input, sizeof(als_input));
>  		break;
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> index 9d31d5b510eb..78e22850417a 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> @@ -151,4 +151,5 @@ struct hpd_status {
>  
>  void sfh_interface_init(struct amd_mp2_dev *mp2);
>  void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
> +int amd_sfh_float_to_int(u32 flt32_val);
>  #endif

Reviewed-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-983461305-1697616911=:2178--
