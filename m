Return-Path: <linux-input+bounces-480-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FF803DFF
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 20:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20101C20B23
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 19:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851BA30F8D;
	Mon,  4 Dec 2023 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3k+ecigk"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B505FD7;
	Mon,  4 Dec 2023 11:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W76ztgPLU+eav5A9qT51OuekMA2qF5DgwKrKG+tCX2YGVKm5vzyYbv/z/x2NplO/I3A+IKYcMd71xQHqykFe3mf1N246k8XlZCpxb5iGmIV6eq8sjlF2pK+nE15jKebykp7o+MjqjN9/WxhOUPt8tIok4KcKM8eLMSpEscBjtoZRu2U+lc3Exh4vsUyz/VxJ3/8g5wLQ96uQUtdf6fpYwS4RRMTD8ZJCyjuosqgwjneuxhvQ/ZxWqAkeEPrPCscMpgXlaOl8RQGgaYPPLl4MopI6bNSK5NAKxphPbryOHOfzjRk8OGe0y7r0xog0FbZDJc1YtYNOt+Yq3KxjA2nvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vru/hj0rHQH9A/XcNx6uFwf6rXnzyogZdXYrGvCKrg=;
 b=DK47Czd0hOx5OTy2/dBB/eZgbYFeR52djBFlEARcCv4waUWSwqXCrAiEP9xViG5kjJFWiE8WIxD+fsc1wsU/2tK1saHL8yEL9cVUc5lTEkiwvPHZEF/3LY7+5tMVaowulhmH7+XLdM9L8xgUUT7lRz0tuDfjL5T69F56x/ZAD9zPlyz0JCxNu53wcQROB0qiGHO3PkjxyUuCc0rVXFSSuHuUC14J34/JFWE/LA72srOBqFsyPqp1+oMTUi8UHghrxJmheYUMJQ9iE79Q722rEhiJOfmUiJse4V0xnsplDBCLsFNSaxu2JpYl83tL6DPDDQZydubSXfOC3x8W8Vk2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vru/hj0rHQH9A/XcNx6uFwf6rXnzyogZdXYrGvCKrg=;
 b=3k+ecigka6AO61TfQ01525Eei7LNCA2d5XaYsFK152C+uSThqVVORvEk9MCwkM95xlnC8ZubQunlJBLF9rLdSVYYMtwALCMsIgU8HTdjrd+lsid12AMnGnmu6JaY+6uuxGxmaN5ZwdKsC/qhUdUbsA9IxnDrfHxHcx3NgDVA2OM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 19:02:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7046.034; Mon, 4 Dec 2023
 19:02:47 +0000
Message-ID: <ba6ded1b-7132-4165-b6be-77211c014e08@amd.com>
Date: Mon, 4 Dec 2023 13:02:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/15] HID: amd_sfh: rename float_to_int() to
 amd_sfh_float_to_int()
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-14-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231204101548.1458499-14-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a80bb7-9b66-4e38-7583-08dbf4fb9a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QNUFjg1U3NeXL9RHz/miTj5xmRrRmovW7VzB/ESEYKrLEWBZ3q5+RB581Q6zANYlunyHScK2Dqo5QSIjTe6Dk3eSzAJlwnD0WRnnuoaPMmKfUr3XmJ3ZBcxd9vyV0Tl8u9tk7tMyhR776CUmGjQiQn4FI88XPbVsoaS4mShBotKm5gYQiIjU4L9WDour+TGiukcwj2ZQYDyCQmeaoTqO1T0BdcwnJatupoPIWoLzQ68ZBBzkyX62vDtDGrEnOSlsIljZFNCcpfPbVUm+PuIxOHOWvawwMphFuLJz89RwNswS9w4D5ngw38Q2vp25929+QN23OD0dL94VBVmMlC2a0xHA0z4z7T8g/ZOqgBduTDnhK2XI44aIcxw9eb9sWdbpfY4IIfWmfs+8QKdn8QlvRf8Krzx3jB/s5Mwg6lV42S5aRvCXcMccDRScQwCwRU5QUiegTSzfMlMDqvO8c0gauVFXgczWgOoEoC7We0LvBdMlIKcxKm05/mo+QxCPNQivcsKclsGxUzbWf36ncbfk6AkY6nH5t4ddnnlnkMqWjZBnw3ZWDEtQSWxdC9zIBG1TRnGTi2YBKE54mJifscZphbA2pVmYRT5+0/TGmd9fJvS0xvHUtRHv/G6QNoEAbkvF5aSQ4QJbfHF8nr+4dcb9Bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66556008)(66476007)(66946007)(316002)(478600001)(6486002)(38100700002)(5660300002)(41300700001)(36756003)(2906002)(86362001)(31696002)(44832011)(4326008)(8676002)(8936002)(31686004)(2616005)(83380400001)(26005)(66574015)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzhHczlQc0IwR25wSUU2T0F0MUY4NmNTelRTS2pkYVBjbXVIUVJYSVBUdDdv?=
 =?utf-8?B?UE5IUld4V2xEbXk2YmxINEMwSzRTMUdTUXl3MWgwMDh2clVLL0xZWXlHdnVj?=
 =?utf-8?B?R3lBaDNyWDV1b0hJZjVNdmJnNFZUY0FoSXkrS3JWOXJqRDZkcUI0VCtEM1lw?=
 =?utf-8?B?ODdlaVNnREh5RnhQZk0yOEhKeGtXVENldHlQYVZNZUpNWldhOUhoWEdMZjJt?=
 =?utf-8?B?NG5hUUFXSjh1OEVVTFdEOFZrdFF5TFZIZ0JVd216bjNEaFNuVjZCL3d2UllD?=
 =?utf-8?B?MjhWUStESTlvMTR6R1AxQzg0S2dSQUo1b3NZSWpLMTR6bk5pTmNWRDNJWmhF?=
 =?utf-8?B?dWhmMHdCZ3oycFF3V2puRGJCU1BjcDBZY0Jwc1FrbEJlN1JDOW5JQ2RPSjVL?=
 =?utf-8?B?OGtZdkw3TnJpaWZlcTlVWGZOeWd4RXYzSVl2VUZtRmR2czBqVndndXJkZ1JO?=
 =?utf-8?B?eUVoYjRidXFNUFFYa21ydW9zaTJDUUJXeGZmazRxR0E2NXpRUXpUbzFJOGZj?=
 =?utf-8?B?MjRrT2ZLTnBqeXRDMUtBMEhySHE2b3A4NzVET05pTGtmYlRNTFlWbTZOeUxS?=
 =?utf-8?B?RXUxVHRJSC9zWWpINlNRa2YyanZEYXdzdlpvTFdqUHhCVkg3NWlyMTdrN3o5?=
 =?utf-8?B?TzVsYWVyeFAvWTREN24rOUo4eUluNit1aUZja1RxUzkyWXBqeHg3ZEJKTFdn?=
 =?utf-8?B?NU5YRHNTUnc0WEVFci8wNHAwS0FVT1pwL2VzRDlFaDNFOFdNcytsMnA0RTJz?=
 =?utf-8?B?SGVqVHF6VXdQQTc4ZmluU3NhaDZKOUNyWG1LRFJGM2RnVUUzZ09RZHVocUNn?=
 =?utf-8?B?TjlOQmxSNysvNnBmelcwZFdDQW1TcHFnUHl6aHdrdzRkNHNsVGtRYTZnNW8x?=
 =?utf-8?B?UEhiUkU3VWJaR2Y5NWRRZHRBZmtzcm9xZEtKdG9CVDI2MWdsRkx1N2hVN0or?=
 =?utf-8?B?K2M4UDB3ViticGREc1NsVXJuNnpJUlNobG85V2VtQkkyMnB0ek9IVDRXSlQx?=
 =?utf-8?B?ejYvbFJJOGpxYUhSVUJ2Zm5oNVBNTnc3Z1FzRTJjbnhNLzJhMnZmRkxrQmxL?=
 =?utf-8?B?bFRsVHo4MEF4b2tqVGlDNFZQbUR3eHZkWUJpUUJRdzFtdTErcUtWMGthZzNt?=
 =?utf-8?B?Vy9KTksrb3NqNFlWa3I5czFQV0UxbnFpNTUzRldTSXlNcTVXNGY2aFRUUFo3?=
 =?utf-8?B?ZzZENThKSTVRY2VzTlczRTJyQVhhSnZxK0k2SjdqQVVvZEFJNS9QTFR3NkpB?=
 =?utf-8?B?OExFQXBmRXVqbWtiZ1owdUo4MFhRZHN6K0F0YUNqYzJ3Q01xdDZkZGFtQTdh?=
 =?utf-8?B?VjRqUTFEZEJJREZldEtrVU1ERjE5K2tGajJNNTJlMDFSMEo0Y2I3RFhIb085?=
 =?utf-8?B?L3pGNndNbkNUTmtIMktqOW5XZWpxQytkVkxKMXU5YTVKZDArUXVJdnY2VFVR?=
 =?utf-8?B?YTNOaG1INjBQd3lENUorNVVlMTNXaFpONGJxZHZlcmpYcHc2eitXampsTldR?=
 =?utf-8?B?ajVuYWZtSGVzc0I5amtIaHN4QVJKenRQV3RsUDZucDRmTGIrM21kRWdkbE9s?=
 =?utf-8?B?VHpvcWJrQ3JYUnhaZm4xUlI5WEN4ekV2Y05ieFlnam0rck43d1hOMGZiMXox?=
 =?utf-8?B?L21rQkNMWGkvbjZXdndOZ003SkJCejZib2Y3aTQzMFJHNi9PSW1RSGpIckw3?=
 =?utf-8?B?SXFHcXRlUnZjekRxd1VPaWkzOTA1bmNjVGNGSjNLTHJoeXBUd2pyK0c4blJT?=
 =?utf-8?B?ZG9EZUtNRitVbStTb3NhVEZEa0hMeWczR2hyNjdvSG9UYnBacmE2TzIxcnBw?=
 =?utf-8?B?S1UwUjBad0dobms0MnNGc1RJY2ZnclRjOU9ZenZIZ2JiaTNlQVA5TWFVQTRt?=
 =?utf-8?B?aTBtUFlmd1F2U0czUERyeGdaRmxtQVl3cHlpVnNOWEYxdFZ4UlRNQ3hCYlJD?=
 =?utf-8?B?UWRkMnBSYzRnd0E0ZGJlSld0R1pOSlZzQTA4djJvNVRsRjM1bWV4N2NUcDE4?=
 =?utf-8?B?YitaREpUWW8xcm00Mlc3UkYzMWZRRHRZc0dZUE9uaVpsWWFkUDQzeU51L0w3?=
 =?utf-8?B?ZkRyNmt4SzBiYTl5VVJ4SWwzY2k5M3ZOeHpZVUVsRTBpV0tIdEN0Zm1wMTVn?=
 =?utf-8?Q?YWhTao0YJLjDqPE1W64bPDGKZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a80bb7-9b66-4e38-7583-08dbf4fb9a6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 19:02:46.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYdzGbwSVs8a9RK1CaN+c8Xzo4/M6LzuNF47h2Sw5Zqa4ADACRvKvOPStz1Y4MkDEXperh+P7db1dkfyRW1Trw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312

On 12/4/2023 04:15, Shyam Sundar S K wrote:
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
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 28 ++++++++++---------
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
>   2 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> index 8a037de08e92..33fbdde8aff0 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> @@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
>   	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
>   }
>   
> -static int float_to_int(u32 flt32_val)
> +int amd_sfh_float_to_int(u32 flt32_val)
>   {
>   	int fraction, shift, mantissa, sign, exp, zeropre;
>   
> @@ -201,9 +201,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
>   			     OFFSET_SENSOR_DATA_DEFAULT;
>   		memcpy_fromio(&accel_data, sensoraddr, sizeof(struct sfh_accel_data));
>   		get_common_inputs(&acc_input.common_property, report_id);
> -		acc_input.in_accel_x_value = float_to_int(accel_data.acceldata.x) / 100;
> -		acc_input.in_accel_y_value = float_to_int(accel_data.acceldata.y) / 100;
> -		acc_input.in_accel_z_value = float_to_int(accel_data.acceldata.z) / 100;
> +		acc_input.in_accel_x_value = amd_sfh_float_to_int(accel_data.acceldata.x) / 100;
> +		acc_input.in_accel_y_value = amd_sfh_float_to_int(accel_data.acceldata.y) / 100;
> +		acc_input.in_accel_z_value = amd_sfh_float_to_int(accel_data.acceldata.z) / 100;
>   		memcpy(input_report, &acc_input, sizeof(acc_input));
>   		report_size = sizeof(acc_input);
>   		break;
> @@ -212,9 +212,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
>   			     OFFSET_SENSOR_DATA_DEFAULT;
>   		memcpy_fromio(&gyro_data, sensoraddr, sizeof(struct sfh_gyro_data));
>   		get_common_inputs(&gyro_input.common_property, report_id);
> -		gyro_input.in_angel_x_value = float_to_int(gyro_data.gyrodata.x) / 1000;
> -		gyro_input.in_angel_y_value = float_to_int(gyro_data.gyrodata.y) / 1000;
> -		gyro_input.in_angel_z_value = float_to_int(gyro_data.gyrodata.z) / 1000;
> +		gyro_input.in_angel_x_value = amd_sfh_float_to_int(gyro_data.gyrodata.x) / 1000;
> +		gyro_input.in_angel_y_value = amd_sfh_float_to_int(gyro_data.gyrodata.y) / 1000;
> +		gyro_input.in_angel_z_value = amd_sfh_float_to_int(gyro_data.gyrodata.z) / 1000;
>   		memcpy(input_report, &gyro_input, sizeof(gyro_input));
>   		report_size = sizeof(gyro_input);
>   		break;
> @@ -223,9 +223,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
>   			     OFFSET_SENSOR_DATA_DEFAULT;
>   		memcpy_fromio(&mag_data, sensoraddr, sizeof(struct sfh_mag_data));
>   		get_common_inputs(&magno_input.common_property, report_id);
> -		magno_input.in_magno_x = float_to_int(mag_data.magdata.x) / 100;
> -		magno_input.in_magno_y = float_to_int(mag_data.magdata.y) / 100;
> -		magno_input.in_magno_z = float_to_int(mag_data.magdata.z) / 100;
> +		magno_input.in_magno_x = amd_sfh_float_to_int(mag_data.magdata.x) / 100;
> +		magno_input.in_magno_y = amd_sfh_float_to_int(mag_data.magdata.y) / 100;
> +		magno_input.in_magno_z = amd_sfh_float_to_int(mag_data.magdata.z) / 100;
>   		magno_input.in_magno_accuracy = mag_data.accuracy / 100;
>   		memcpy(input_report, &magno_input, sizeof(magno_input));
>   		report_size = sizeof(magno_input);
> @@ -235,13 +235,15 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
>   			     OFFSET_SENSOR_DATA_DEFAULT;
>   		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
>   		get_common_inputs(&als_input.common_property, report_id);
> -		als_input.illuminance_value = float_to_int(als_data.lux);
> +		als_input.illuminance_value = amd_sfh_float_to_int(als_data.lux);
>   
>   		memcpy_fromio(&binfo, mp2->vsbase, sizeof(struct sfh_base_info));
>   		if (binfo.sbase.s_prop[ALS_IDX].sf.feat & 0x2) {
>   			als_input.light_color_temp = als_data.light_color_temp;
> -			als_input.chromaticity_x_value = float_to_int(als_data.chromaticity_x);
> -			als_input.chromaticity_y_value = float_to_int(als_data.chromaticity_y);
> +			als_input.chromaticity_x_value =
> +				amd_sfh_float_to_int(als_data.chromaticity_x);
> +			als_input.chromaticity_y_value =
> +				amd_sfh_float_to_int(als_data.chromaticity_y);
>   		}
>   
>   		report_size = sizeof(als_input);
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> index 656c3e95ef8c..75267b0fec70 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> @@ -166,4 +166,5 @@ struct hpd_status {
>   
>   void sfh_interface_init(struct amd_mp2_dev *mp2);
>   void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
> +int amd_sfh_float_to_int(u32 flt32_val);
>   #endif


