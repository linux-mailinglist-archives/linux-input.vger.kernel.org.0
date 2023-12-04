Return-Path: <linux-input+bounces-479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33879803DFC
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 20:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5566F1C20A8E
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 19:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311F12F85F;
	Mon,  4 Dec 2023 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4bUX8V2v"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC39BB2;
	Mon,  4 Dec 2023 11:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsKZX9Kfc6k+497+Uj/u7ohTwizZrUtEvruruz9Ui27xXlILavVruWD6IU4OgwWtYfvvIjTKe80EYLKp1YsdsrZmy7ExmP2pbl/Yj7n9od9Sb2bcemni6Qj7IAyLDuZGgc6Zk0QOiR74wIc+UZ8gzWu6oM4iuKzwjqrhMv4nN7RTCk+t0aAOOEPjB64yzceaGIB0rTTfzrA7KReZz1gTsI8r9LSNXtbWqBXcSeffJBSEKJPZ1ekCWKEA0Vde2DW/3yXiTHRm1xNU/zberb/cFJHmeTqXWfCg7zLvjdsSCH8XvolBc0YfD0ae5v6tQBPBFe4rBTdbvdnOXPIC3QjK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRi/2b0b9jegDdHucKpfR5CFgv6ODB3HrSikqdRHkx0=;
 b=k8Jm1eEW3CKQPQ9MZ2YkTH2Hfl7v0mghVBRcZyDLoMhwqiB2qVJWFWXmzFjEjnLQRzzdCsnpaxaNIJ1Ya33+NLz9oV1ymxxYZL/rixNqNSIE9dPda4kxbAZcCwdUaZubl390LLyU0eXv9Fgm+/oPNvX3bJGvo1Xmeprm4xVnnmJbbNzsFxCBWNmBEEURD2vMcWVzS9Nn55peWJru3OC4wLHR7EqqJ+ponAtf/SGTEinf/1GDLojQMdqxnt+byvhWXr6aPzLRQmHJCfBwGR5+QfxLyI6h9Ej9aso+JaMHJJNbB3sE5Glmtn8IhG4dDZFugYyk9UuITM10A7SYLzqsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRi/2b0b9jegDdHucKpfR5CFgv6ODB3HrSikqdRHkx0=;
 b=4bUX8V2vNQsEG1kB5mpNWqL5JTcXo9r1Lj2nRml+SqS5pRUdzbPQQiDASPR0xxofHSBbRJCX4cu8RsaeeAC0D4TFxorROvEcE+9OA4edL1QWE6hGincAKa3U0Lh4wreTj+D9+NquftR3LfMTW8+VLrBAdAR92Cud5FpHczAK16M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 19:02:20 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7046.034; Mon, 4 Dec 2023
 19:02:20 +0000
Message-ID: <9e7f0d00-483c-4187-8bec-d7832ab8816b@amd.com>
Date: Mon, 4 Dec 2023 13:02:16 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for HPD
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-15-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231204101548.1458499-15-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-MS-Office365-Filtering-Correlation-Id: 08d5acab-f884-44b8-fd5b-08dbf4fb8a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mLmLbvO83Q4aHZ/zl8bhkaarWJG1F0gbYYxF0UpDpxrF/ktv3FD81niEVQzll2FKTfHxIDy+eS2KEunTTK/EL0MPqmkYzyWw3WGwbASARhdA6btXyLs8gxDofWr8J9L8EbUkT9HRjyVpJNlvjHdScfQFzuWQUw3xlHKyun6doPOkdC/7EJFd4UFDi/TnyWGhiZXGkVhcUjll6JiIeWlMfQsa0wXIL2mf5QPeI/HHkgrXQrSR+BYutYtTnGmpozjs2epNyxoMk3yXmMge4PUZ00ze8k4lU+Bai0BdzhztUXS608X2kzmWq8KGS+BCckq7KT3Ww8ObrGSxohPCOIh79jLlQlQYp5lCC9hKTSfuaKA6hoPUgJABGI6ad1q8ere2ekSqHpZmXUrdU+7lzpirKI7QlGAI6oGt4oDBHlB5ChV/ebIxewrMhj/8DPGzO++r9/+EOvUAxAddfI6tZSghhAwCupPGzn+CpACblkbaTtFrKrsjBr7f1SMjmpqsFE54PfpLHBulIV0po2Q2sI2jdzmrTeh9cEv53eL00qDAS4eE581FP5r52zOUALtXnxZuxtTLpTMa7KowO4yxsktlj16z0+4gfj5iyO4/pN6SkiKVfG7eE7bNVauxTyF6CS5oEGmwtg6wOD4VWBLgwRodnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66556008)(66476007)(66946007)(316002)(478600001)(6486002)(6666004)(38100700002)(5660300002)(41300700001)(36756003)(2906002)(86362001)(31696002)(44832011)(4326008)(8676002)(8936002)(31686004)(2616005)(83380400001)(26005)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHV4Kzd1cU51RUZXUURKQlZ5KysycGI0blN1WHFWenVpOCt2OGF1QUp2RzhQ?=
 =?utf-8?B?aGc5S0pnTlpLNVRHb01CUXFmc1crNjVucXBxQ2NzNVNiZzVrMWtOb1N6MW1H?=
 =?utf-8?B?aVFvQWllYnUxN3VtVW5oUy9xcTM5NHdHM3RJR2Fhb1BUb2k0NmwrbWVwRU1M?=
 =?utf-8?B?K1lxL1ptOXFjMzBuVU5KQlUvOEtJUTl6ZDRvU3lUZ0xYTG8veXhNL0tHRDNL?=
 =?utf-8?B?RmN6aEFCcmcwQjBZQ0ZOd1NnUTl5QUxJbTFLRVJ1S3hxOFIzODg4NjN5NDlS?=
 =?utf-8?B?cWE2dm8yMVVuU0dFMWdYcm5DNDdMN1lUR0RNYjlGcWljckM4SmhkMTB4WHBu?=
 =?utf-8?B?TXdnZEJjVTMyTmJvMzhRWmJlbmJ3czN6TGRaNUYraWtWb0txQWJIaVFSRjhV?=
 =?utf-8?B?M1VJbzB3bkJ5QlA3bjEvdmtjTkFhTTY0ejlkdjJUOWQ2ZXFPeHNQZ3cvcWtl?=
 =?utf-8?B?Nll4dmUvc2R4TVhhcGJGRlhxaXpJanlYZG5kc3UvaGhKRW8xTENmU0Fsdjc2?=
 =?utf-8?B?M0pGdEp2UU9vVEthK1B6UXdJdW9sWTVSMXl2TERTYjlwN1UzZDZwcmxHMWZW?=
 =?utf-8?B?Q2dnN1JPU1JRQlQ3Q1k0MlkyUFpON0hPZHJjYzBSTjFXSXVCVHlDTDA1NVdn?=
 =?utf-8?B?UVBQOWdocURRRk9BRnRCc3NwbVRxbGoreC9ZRFlCbkVJY3N1ZlN6aHFUNXJC?=
 =?utf-8?B?T0ZhKzNwWkFPYWZEbVkxaHFSNVg3bGs4WS9oWVhwODhMYXBYY002YkRTRTJG?=
 =?utf-8?B?MXd5blY5eFdpUDl6L2lQaHNzWExkSkdpUWd2am5MZ1dHemxaaHhSRWtVUk8w?=
 =?utf-8?B?bGxCT3N1cEg1Sk1KdlpKU3VWK0lrb0VVVjRhL3NKOUxmV0ljZDdIZ1Fwb2xt?=
 =?utf-8?B?a0Fxd0E5Q21TdFYwczM1ZTVZa3pUSm5oTnhkWi9WTExGVXVUUEFEOFErOUNZ?=
 =?utf-8?B?cE9Ic1B0b3kzVTdyQ1hWdDJWRzJhVDlGSmRUeDQwVUNqYlhuWUcxSmlIaHQv?=
 =?utf-8?B?LzdLRzJvTGExMFFieXMzbi9yazgvcSt5Tm52cGdSNmdDc0Zmc3ZDczJiZklY?=
 =?utf-8?B?Nzc2Y3dod0lKL1ZaTTZUOUJXNjh5V1IyREtFaEZoMVlKT3ZDaE5WOXFKdWc1?=
 =?utf-8?B?ajhlSVowc2kzOHRaVU9LTGV4UG1IUUdyTncyL1IwRWNaN0JUc0JhcGl3cmV2?=
 =?utf-8?B?ZDI4U0NuVFY3Y2NnQTJLLzBFTFpkdFlycXV6RlE3V01yTkZmN1gveGxmK1JO?=
 =?utf-8?B?V2JRalF0L2dkQm5XeFc1UTI0QXpjaDRkMi9nYzJzbTR3eFBDMGV0QkU3V0Rz?=
 =?utf-8?B?MmtBbzdsRytOSFZCc1hCbTk1eW14djJyMFN1Y013NmJia3paVUpBVEk1RGVP?=
 =?utf-8?B?KzdvN2hyTjNHUUxVK3RXTFRNbnpPcmlMYk4zRFRUb0FsZGthYndKT0NJeTh1?=
 =?utf-8?B?MVNkZXFpS3VkbmFRMnZYQmNGNElzTmJPdlRrcE1sSTVxMEhxb213N05MTTJr?=
 =?utf-8?B?aU95azhJSHpLbUFXUEtBdzIvZTl4K1FONTVNTVNkc1Yzc2JBS0FHeThqRVVJ?=
 =?utf-8?B?SzBzN2ZiMi9HalhwaUswNm01amF4NmIrOVY0aXE3cTFUOGZVNmJmdHJFMWJI?=
 =?utf-8?B?dk1abkx3R2pQeFgxL1lXK2lra21SWENHN2lDd3E4UWJhNldHYVB3M3BjYlNR?=
 =?utf-8?B?TUxoTmZZWW9aRjF5QmVVTTUvMjRqWFUwVG00L001Vk5ObmFhczkrSFpQTG5Z?=
 =?utf-8?B?cnM3MlBPVEtDRG9FcVRtb0NNVVFKejIyOVJWaG5TcGdxeGNHd1NjMm1odmFT?=
 =?utf-8?B?MTZvOFpyd1VGQW9Ua045UGNwY2treWtGaFY1eEhtajNGakx6d3B0TDAyVXVT?=
 =?utf-8?B?K2tHbCtzeVZ3NTZTZ1g5Q21zcVB2UHZNUGozWWlYSTJzaVJEUHRPcEd5VzF1?=
 =?utf-8?B?UDlLVDN5dFE5cjdkRVRmS0lXWnpRVGpSNDhkbTQxTEFWdDBRK0lxTytzMEp4?=
 =?utf-8?B?elBTbjlnMk5nWlE4NXNTWlhFck5PekdLQmRlTldzcmdwNXEvY3Q0bWUwUlNG?=
 =?utf-8?B?ZVJHNVl4eVVRNHhURVQ4VGZaRU1LanZaSEk0Z2twMHVkOGJsc3ZiZEViUlNz?=
 =?utf-8?Q?nCa5dh1p5Jm66Jt3uHTjWEQ0o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d5acab-f884-44b8-fd5b-08dbf4fb8a67
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 19:02:20.2231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Redhy4vv9Aw2TYB/scUpHd4++vlnr/gkA+K8ifIZsUSldxpRS7oTKElKa4SXPB9KoW+sguydh33nYo7pwBLumg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312

On 12/4/2023 04:15, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the User presence information via the Human
> Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 14 ++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 33 +++++++++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
>   drivers/platform/x86/amd/pmf/Kconfig          |  1 +
>   drivers/platform/x86/amd/pmf/spc.c            | 22 +++++++++
>   include/linux/amd-pmf-io.h                    | 46 +++++++++++++++++++
>   7 files changed, 122 insertions(+)
>   create mode 100644 include/linux/amd-pmf-io.h
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> index 2643bb14fee2..cd57037bf217 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> @@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
>   	dma_addr_t dma_address;
>   };
>   
> +struct sfh_dev_status {
> +	bool is_hpd_present;
> +};
> +
>   struct amd_mp2_dev {
>   	struct pci_dev *pdev;
>   	struct amdtp_cl_data *cl_data;
> @@ -47,6 +51,7 @@ struct amd_mp2_dev {
>   	struct amd_input_data in_data;
>   	/* mp2 active control status */
>   	u32 mp2_acs;
> +	struct sfh_dev_status dev_en;
>   };
>   
>   struct amd_mp2_ops {
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index e9c6413af24a..0351b0fd394a 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
>   	int i, status;
>   
>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
> +		switch (cl_data->sensor_idx[i]) {
> +		case HPD_IDX:
> +			privdata->dev_en.is_hpd_present = false;
> +			break;
> +		}
> +
>   		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>   			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
>   			status = amd_sfh_wait_for_response
> @@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   			rc = amdtp_hid_probe(i, cl_data);
>   			if (rc)
>   				goto cleanup;
> +			switch (cl_data->sensor_idx[i]) {
> +			case HPD_IDX:
> +				privdata->dev_en.is_hpd_present = true;
> +				break;
> +			}
>   		}
>   		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
>   			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
> @@ -259,6 +270,7 @@ static void amd_mp2_pci_remove(void *privdata)
>   {
>   	struct amd_mp2_dev *mp2 = privdata;
>   
> +	sfh_deinit_emp2();
>   	amd_sfh_hid_client_deinit(privdata);
>   	mp2->mp2_ops->stop_all(mp2);
>   	pci_intx(mp2->pdev, false);
> @@ -311,12 +323,14 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
>   
>   	rc = amd_sfh_irq_init(mp2);
>   	if (rc) {
> +		sfh_deinit_emp2();
>   		dev_err(dev, "amd_sfh_irq_init failed\n");
>   		return rc;
>   	}
>   
>   	rc = amd_sfh1_1_hid_client_init(mp2);
>   	if (rc) {
> +		sfh_deinit_emp2();
>   		dev_err(dev, "amd_sfh1_1_hid_client_init failed\n");
>   		return rc;
>   	}
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 4f81ef2d4f56..f8758fb70b1a 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -7,11 +7,14 @@
>    *
>    * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>    */
> +#include <linux/amd-pmf-io.h>
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/iopoll.h>
>   
>   #include "amd_sfh_interface.h"
>   
> +static struct amd_mp2_dev *emp2;
> +
>   static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
>   {
>   	struct sfh_cmd_response cmd_resp;
> @@ -73,7 +76,37 @@ static struct amd_mp2_ops amd_sfh_ops = {
>   	.response = amd_sfh_wait_response,
>   };
>   
> +void sfh_deinit_emp2(void)
> +{
> +	emp2 = NULL;
> +}
> +
>   void sfh_interface_init(struct amd_mp2_dev *mp2)
>   {
>   	mp2->mp2_ops = &amd_sfh_ops;
> +	emp2 = mp2;
> +}
> +
> +static int amd_sfh_hpd_info(u8 *user_present)
> +{
> +	struct hpd_status hpdstatus;
> +
> +	if (!emp2 || !emp2->dev_en.is_hpd_present)
> +		return -ENODEV;
> +
> +	hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
> +	*user_present = hpdstatus.shpd.presence;

It's an unlikely problem considering there is only one consumer for this 
function but if amd_sfh_hpd_info() was called with NULL as an argument 
this is a NULL pointer derefence.

So I think this function should have at the beginning:

if (!user_present)
	return -EINVAL;

> +	return 0;
> +}
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
> +{
> +	if (sfh_info) {
> +		switch (op) {
> +		case MT_HPD:
> +			return amd_sfh_hpd_info(&sfh_info->user_present);
> +		}
> +	}
> +	return -EINVAL;
>   }
> +EXPORT_SYMBOL_GPL(amd_get_sfh_info);
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> index 75267b0fec70..2c211d28764d 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> @@ -165,6 +165,7 @@ struct hpd_status {
>   };
>   
>   void sfh_interface_init(struct amd_mp2_dev *mp2);
> +void sfh_deinit_emp2(void);
>   void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
>   int amd_sfh_float_to_int(u32 flt32_val);
>   #endif
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f246252bddd8..f4fa8bd8bda8 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -10,6 +10,7 @@ config AMD_PMF
>   	depends on AMD_NB
>   	select ACPI_PLATFORM_PROFILE
>   	depends on TEE && AMDTEE
> +	depends on AMD_SFH_HID
>   	help
>   	  This driver provides support for the AMD Platform Management Framework.
>   	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index a0423942f771..5e769dcb075a 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <acpi/button.h>
> +#include <linux/amd-pmf-io.h>
>   #include <linux/power_supply.h>
>   #include <linux/units.h>
>   #include "pmf.h"
> @@ -44,6 +45,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
>   	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>   	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
> +	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
> @@ -147,6 +149,25 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>   	return 0;
>   }
>   
> +static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	struct amd_sfh_info sfh_info;
> +
> +	/* get HPD data */
> +	amd_get_sfh_info(&sfh_info, MT_HPD);

There is still an error handling miss here.  amd_get_sfh_info() can 
return error codes but they're discarded and sfh_info hasn't been 
initialized to anything so this could be garbage going into the switch() 
statement.

So can you explicitly check for errors on amd_get_sfh_info()?

> +	switch (sfh_info.user_present) {
> +	case SFH_NOT_DETECTED:
> +		in->ev_info.user_present = 0xff; /* assume no sensors connected */
> +		break;
> +	case SFH_USER_PRESENT:
> +		in->ev_info.user_present = 1;
> +		break;
> +	case SFH_USER_AWAY:
> +		in->ev_info.user_present = 0;
> +		break;
> +	}
> +}
> +
>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>   {
>   	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -155,4 +176,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>   	amd_pmf_get_smu_info(dev, in);
>   	amd_pmf_get_battery_info(dev, in);
>   	amd_pmf_get_slider_info(dev, in);
> +	amd_pmf_get_sensor_info(dev, in);
>   }
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> new file mode 100644
> index 000000000000..5b6d29d36922
> --- /dev/null
> +++ b/include/linux/amd-pmf-io.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Platform Management Framework Interface
> + *
> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> + */
> +
> +#ifndef AMD_PMF_IO_H
> +#define AMD_PMF_IO_H
> +
> +#include <linux/types.h>
> +
> +/**
> + * enum sfh_message_type - Query the SFH message type
> + * @MT_HPD: Message ID to know the Human presence info from MP2 FW
> + */
> +enum sfh_message_type {
> +	MT_HPD,
> +};
> +
> +/**
> + * enum sfh_hpd_info - Query the Human presence information
> + * @SFH_NOT_DETECTED: Check the HPD connection information from MP2 FW
> + * @SFH_USER_PRESENT: Check if the user is present from HPD sensor
> + * @SFH_USER_AWAY: Check if the user is away from HPD sensor
> + */
> +enum sfh_hpd_info {
> +	SFH_NOT_DETECTED,
> +	SFH_USER_PRESENT,
> +	SFH_USER_AWAY,
> +};
> +
> +/**
> + * struct amd_sfh_info - get HPD sensor info from MP2 FW
> + * @user_present: Populates the user presence information
> + */
> +struct amd_sfh_info {
> +	u8 user_present;
> +};
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +#endif


