Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC3739CDB0
	for <lists+linux-input@lfdr.de>; Sun,  6 Jun 2021 08:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhFFGpz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Jun 2021 02:45:55 -0400
Received: from mail-am6eur05olkn2067.outbound.protection.outlook.com ([40.92.91.67]:54411
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229478AbhFFGpz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 6 Jun 2021 02:45:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffEVOx6Mtv8SKVkujjMO/Ak9jwD/cMYcWDshM2AV2DjaBH6kAkeolkFBbWY9IUMmAgNtiiFd8miB/qraSn9NPKSuDAfoUOzXvLq2wkUIKTiyFlBQa3qE4qkWDZw7vbA/EKSQHIngT8Yp4RGFDP57ucE7l6JyPAzAiRkEINfsVqxOSjZ8cxURn4si5n5Z/CGXG76EWa+Beu4UPqp31Ecm8sqUqxAZCaJhsDUoBiUyI8FKDA/pm72lunyvtZbgVpPnWOgT1HsompCjRdg2CSjClnpSD9cWXHOYKmEZ6o2hpQw3LV0aTLjiWhEuuv9byTE7ONRb9/Yiyr2QK8QHACjanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhA+qxE5pYWBrufNlYm4GXFQWCSqjaJW0UBZ/uN6HEE=;
 b=cnjz2PRFOh13l7RZd4Exs+euMr8P7lQ/0+grJ4QNlYyj131eOYoGS9YvKai1lW0T196vsS6i7uFmydsTPVzCNNiES2XqBkUE3UKarQWDWcAvkQAj3B7RqMUVgE1xZU1JbrIMQLDzTQuKCYxuPr2akX1WdaUaxNDgpk8mjE0AiznHbMkBOqqK1lreKOXh9/VmdH6jm7TwXka2xoR5/uaZlUUCoQACKokfJfeDDmY8Bh1t1Hgo8kl46QuDbd+cW8VIgypcygtltBIfxKqZtdQxjHlFTlBknF6tgPeLafzzSa1f9NHZBlAJVa/V406NKNjn43dmufafEtia29//CClLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB8EUR05FT021.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::4a) by
 DB8EUR05HT186.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::473)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.18; Sun, 6 Jun
 2021 06:44:03 +0000
Received: from AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 (2a01:111:e400:fc0f::4a) by DB8EUR05FT021.mail.protection.outlook.com
 (2a01:111:e400:fc0f::288) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.18 via Frontend
 Transport; Sun, 6 Jun 2021 06:44:03 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8B4F61F76BAAC9749C37F55B85451B564A5D7D753159CCF1BB994950C54A7E64;UpperCasedChecksum:2A1581224A93BF301A171EDD62D7241E5783EA0CC9B6211373429415AA017A6F;SizeAsReceived:8179;Count:47
Received: from AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ad12:6a2c:b949:f65d]) by AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ad12:6a2c:b949:f65d%5]) with mapi id 15.20.4195.029; Sun, 6 Jun 2021
 06:44:03 +0000
Subject: Re: [PATCH v3] Input: elantech - fix x_max/y_max values
From:   Bernd Edlinger <bernd.edlinger@hotmail.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Lee Jones <lee.jones@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <AM8PR10MB47082E49F8A2DC4B9B522023E4209@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <AM8PR10MB4708B71F7479A2F6EDB8F010E4399@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
Date:   Sun, 6 Jun 2021 08:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <AM8PR10MB47082E49F8A2DC4B9B522023E4209@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN:  [UGJcC0klQB1ZUErHopke2GvlokNYg/YO]
X-ClientProxiedBy: PR0P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::20) To AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:364::23)
X-Microsoft-Original-Message-ID: <95fba7a5-0df6-ac6d-088e-180a03554eba@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.101] (84.57.61.94) by PR0P264CA0056.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend Transport; Sun, 6 Jun 2021 06:44:02 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e85f6487-d151-4b7b-8a86-08d928b6793b
X-MS-TrafficTypeDiagnostic: DB8EUR05HT186:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PivU2aSHo4IJ0BPJk2UdeNRZhnaOX7Bcp7fTBoS1i7I26jc2N0CK2kJMNm/j/IrqGQoMxRk4BL0r3hD+XdVL+G7CZWpuTycV98jRnWudGg4QBHX2DpgZ7Y7aPQjX9YJo/o5THa+mxX40B53AGwC9dUlOZlaHLsymlWgt1KiPPdINgdhoJxxxmFYxyiCMCLCkecPGuXf+Jhe5OK23bhZ5qKkniD5PsljnnmfLEkRJL+avNI0NSqYlnK2J9Gl9vbLr5dIdPLu89Wmhn0i4GE2YSXCbMi4U9KpwqMmZe7Z1KacBockZ+3cWNotFnjh72cG67XMvQKqB1tQ/leJycUnY2thlgl+RAq36anf5CD2QhBq/msWB+Ro+vifWgis8gEw9Rqr6DQO9pXEl94enmWDYmA==
X-MS-Exchange-AntiSpam-MessageData: M/4WmJnbhOYx3SV6lFtNM05mtsFv2179XIOebcXjBcg1rijmvcOQlnxrWnCUKMsuuRTILyVi6MFb2ZzCesLZK78jooFrrOruUaYJyK0onIBko81ePBIQghTYbGGttcl0AypmjYPuhOjVAmJx7fvT6A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85f6487-d151-4b7b-8a86-08d928b6793b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2021 06:44:03.7469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT021.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT186
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ping...

On 5/30/21 6:35 AM, Bernd Edlinger wrote:
> Since commit 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
> moved the querying of the x_max/y_max values from
> elantech_set_input_params to elantech_query_info,
> the returned x_max/y_max values are different than before,
> at least for some firmware versions.
> 
> The reason is likely that this is now done before
> elantech_set_absolute_mode does run.  So it may happen that
> the returned values are exactly half of what they used to be,
> which makes input_report_abs in PS/2 mode report ABS_X values which
> exceed the x_max value, which is very annoying since the mouse stops
> to move then, and ABS_Y value become negative, which is benign.
> 
> This was observed with a MSI GX70 laptop:
> 
> elantech: assuming hardware version 3 (with firmware version 0x250f01)
> elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
> elantech: Elan sample query result 05, 0e, 00
> input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...
> 
> This patch moves the code sending the ETP_FW_ID_QUERY command to
> the function elantech_set_range and calls this function in
> elantech_query_info for hw_version == 4, but for hw_version < 4 it is
> called in elantech_setup_ps2 after the function elantech_set_absolute_mode.
> 
> It is right to switch the touchpad into absolute mode first to get valid
> results from the ID query call in hardware version 2 and 3.
> 
> There is no way how this change can affect the state of the firmware
> when elantech_setup_smbus is called later, since that can only happen for
> hardware version 4, see elantech_init_smbusand elantech_use_host_notify
> which uses ETP_NEW_IC_SMBUS_HOST_NOTIFY and info->bus.
> 
> The macro ETP_NEW_IC_SMBUS_HOST_NOTIFY can only return true
> for (fw_version & 0x0f0000) == 0x0f0000 which implies v4 hardware.
> The value info->bus can only be unequal to ETP_BUS_PS2_ONLY,
> if elantech_get_resolution_v4 was called from elantech_query_info,
> which is again guarded by info->hw_version == 4.
> 
> Fixes: 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
> 
> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> ---
> v3: Do the ID_QUEERY after set absoulute mode for hw_version < 4.
>     Note: It turned out to be more difficult to call elantech_set_absolute_mode
>     from elantech_query_info.
> 
>  drivers/input/mouse/elantech.c | 172 ++++++++++++++++++++++-------------------
>  1 file changed, 94 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 97381e2..5f4a1a4 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1078,6 +1078,94 @@ static int elantech_set_absolute_mode(struct psmouse *psmouse)
>  	return rc;
>  }
>  
> +static int elantech_set_range(struct psmouse *psmouse,
> +			      struct elantech_device_info *info)
> +{
> +	unsigned char param[3];
> +	unsigned char traces;
> +
> +	/* query range information */
> +	switch (info->hw_version) {
> +	case 1:
> +		info->x_min = ETP_XMIN_V1;
> +		info->y_min = ETP_YMIN_V1;
> +		info->x_max = ETP_XMAX_V1;
> +		info->y_max = ETP_YMAX_V1;
> +		break;
> +
> +	case 2:
> +		if (info->fw_version == 0x020800 ||
> +		    info->fw_version == 0x020b00 ||
> +		    info->fw_version == 0x020030) {
> +			info->x_min = ETP_XMIN_V2;
> +			info->y_min = ETP_YMIN_V2;
> +			info->x_max = ETP_XMAX_V2;
> +			info->y_max = ETP_YMAX_V2;
> +		} else {
> +			int i;
> +			int fixed_dpi;
> +
> +			i = (info->fw_version > 0x020800 &&
> +			     info->fw_version < 0x020900) ? 1 : 2;
> +
> +			if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
> +				return -EINVAL;
> +
> +			fixed_dpi = param[1] & 0x10;
> +
> +			if (((info->fw_version >> 16) == 0x14) && fixed_dpi) {
> +				if (info->send_cmd(psmouse, ETP_SAMPLE_QUERY, param))
> +					return -EINVAL;
> +
> +				info->x_max = (info->capabilities[1] - i) * param[1] / 2;
> +				info->y_max = (info->capabilities[2] - i) * param[2] / 2;
> +			} else if (info->fw_version == 0x040216) {
> +				info->x_max = 819;
> +				info->y_max = 405;
> +			} else if (info->fw_version == 0x040219 || info->fw_version == 0x040215) {
> +				info->x_max = 900;
> +				info->y_max = 500;
> +			} else {
> +				info->x_max = (info->capabilities[1] - i) * 64;
> +				info->y_max = (info->capabilities[2] - i) * 64;
> +			}
> +		}
> +		break;
> +
> +	case 3:
> +		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
> +			return -EINVAL;
> +
> +		info->x_max = (0x0f & param[0]) << 8 | param[1];
> +		info->y_max = (0xf0 & param[0]) << 4 | param[2];
> +		break;
> +
> +	case 4:
> +		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
> +			return -EINVAL;
> +
> +		info->x_max = (0x0f & param[0]) << 8 | param[1];
> +		info->y_max = (0xf0 & param[0]) << 4 | param[2];
> +		traces = info->capabilities[1];
> +		if ((traces < 2) || (traces > info->x_max))
> +			return -EINVAL;
> +
> +		info->width = info->x_max / (traces - 1);
> +
> +		/* column number of traces */
> +		info->x_traces = traces;
> +
> +		/* row number of traces */
> +		traces = info->capabilities[2];
> +		if ((traces >= 2) && (traces <= info->y_max))
> +			info->y_traces = traces;
> +
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * (value from firmware) * 10 + 790 = dpi
>   * we also have to convert dpi to dots/mm (*10/254 to avoid floating point)
> @@ -1659,7 +1747,6 @@ static int elantech_query_info(struct psmouse *psmouse,
>  			       struct elantech_device_info *info)
>  {
>  	unsigned char param[3];
> -	unsigned char traces;
>  	unsigned char ic_body[3];
>  
>  	memset(info, 0, sizeof(*info));
> @@ -1759,85 +1846,9 @@ static int elantech_query_info(struct psmouse *psmouse,
>  			psmouse_warn(psmouse,
>  				     "failed to query resolution data.\n");
>  		}
> -	}
> -
> -	/* query range information */
> -	switch (info->hw_version) {
> -	case 1:
> -		info->x_min = ETP_XMIN_V1;
> -		info->y_min = ETP_YMIN_V1;
> -		info->x_max = ETP_XMAX_V1;
> -		info->y_max = ETP_YMAX_V1;
> -		break;
> -
> -	case 2:
> -		if (info->fw_version == 0x020800 ||
> -		    info->fw_version == 0x020b00 ||
> -		    info->fw_version == 0x020030) {
> -			info->x_min = ETP_XMIN_V2;
> -			info->y_min = ETP_YMIN_V2;
> -			info->x_max = ETP_XMAX_V2;
> -			info->y_max = ETP_YMAX_V2;
> -		} else {
> -			int i;
> -			int fixed_dpi;
> -
> -			i = (info->fw_version > 0x020800 &&
> -			     info->fw_version < 0x020900) ? 1 : 2;
> -
> -			if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
> -				return -EINVAL;
>  
> -			fixed_dpi = param[1] & 0x10;
> -
> -			if (((info->fw_version >> 16) == 0x14) && fixed_dpi) {
> -				if (info->send_cmd(psmouse, ETP_SAMPLE_QUERY, param))
> -					return -EINVAL;
> -
> -				info->x_max = (info->capabilities[1] - i) * param[1] / 2;
> -				info->y_max = (info->capabilities[2] - i) * param[2] / 2;
> -			} else if (info->fw_version == 0x040216) {
> -				info->x_max = 819;
> -				info->y_max = 405;
> -			} else if (info->fw_version == 0x040219 || info->fw_version == 0x040215) {
> -				info->x_max = 900;
> -				info->y_max = 500;
> -			} else {
> -				info->x_max = (info->capabilities[1] - i) * 64;
> -				info->y_max = (info->capabilities[2] - i) * 64;
> -			}
> -		}
> -		break;
> -
> -	case 3:
> -		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
> -			return -EINVAL;
> -
> -		info->x_max = (0x0f & param[0]) << 8 | param[1];
> -		info->y_max = (0xf0 & param[0]) << 4 | param[2];
> -		break;
> -
> -	case 4:
> -		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
> +		if (elantech_set_range(psmouse, info))
>  			return -EINVAL;
> -
> -		info->x_max = (0x0f & param[0]) << 8 | param[1];
> -		info->y_max = (0xf0 & param[0]) << 4 | param[2];
> -		traces = info->capabilities[1];
> -		if ((traces < 2) || (traces > info->x_max))
> -			return -EINVAL;
> -
> -		info->width = info->x_max / (traces - 1);
> -
> -		/* column number of traces */
> -		info->x_traces = traces;
> -
> -		/* row number of traces */
> -		traces = info->capabilities[2];
> -		if ((traces >= 2) && (traces <= info->y_max))
> -			info->y_traces = traces;
> -
> -		break;
>  	}
>  
>  	/* check for the middle button: DMI matching or new v4 firmwares */
> @@ -2037,6 +2048,11 @@ static int elantech_setup_ps2(struct psmouse *psmouse,
>  		goto init_fail;
>  	}
>  
> +	if (info->hw_version < 4) {
> +		if (elantech_set_range(psmouse, &etd->info))
> +			goto init_fail;
> +	}
> +
>  	if (info->fw_version == 0x381f17) {
>  		etd->original_set_rate = psmouse->set_rate;
>  		psmouse->set_rate = elantech_set_rate_restore_reg_07;
> 
