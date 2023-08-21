Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34DB87824BF
	for <lists+linux-input@lfdr.de>; Mon, 21 Aug 2023 09:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233828AbjHUHnh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 03:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbjHUHne (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 03:43:34 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2FFB9
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 00:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9SQcZnZz4lVsRHhfdXLUlQC9jer4Cgx4Pt7ufV5BJ/+tFyBgN9+VPFljYVc2N3FhDFh8kVlLZr/SvDUGVR/KnXrdk2tyL4SKPq4hsnJa191LB0idjY5l91GXdoaTD0C93gaOqLBKpwCHnzLDkod7MrXQeRZJamHCXr1T1AnfIZTQZI1Phq2Ys5PLGZIe4EGlobYG0r/tClQUhzDrG1msPSU0GttqvZeYf77pVG5WhiGnxvX1qsRiKZzHRXpbVSIrNe90dt6KeBWemLEjZRNuhyd1FW/VeisFC79tQZ0XoHHQttb5JnqU9P4gkwpbLzP40e/nLmaERqu9H7hZOhd2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhXd4qdqfpSf+qrGFK65lBPGOjaM0E0XbDEY5KtEjvw=;
 b=NVPYSU6ZXGJa0EXNI/mYx6NKUfufkrWAJB38+YiK21oIxw7IpDjstlUj1KlczfDEd3RqrBLdWMCmPsYLCbeG9/3mnr6UOpr8l5cMpSrnnYbbvaGEDAQotvZ/zqOnN6PCYAfNAXwjuLI0AB0IuwJALkQyH0QejGbpt+U8z3uCTLMLz9aXJ/53aEBEkNFHn4jtybNkAXOaMqAV77O6EgcWvOxZzoaa+YrnpGrxTbU3WPi909sUUA3v0/319lTu+qKpjlvs14mwKp9f/XivrBhrht8ITq8qCA0GZuKPL6o5r2Q5dTc7bsQ124DFkYK/nomekoF0YkdPl07JxIkAZHjpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhXd4qdqfpSf+qrGFK65lBPGOjaM0E0XbDEY5KtEjvw=;
 b=jlCBELsFbohBikSquIgipFZ3pU3mgHLLrVD7KnZLMvmjB40/lzQNgQDpt+cQKJIXws8xB9Eljbl29KjneJ4smBjwIv0TgszS9l+ZrCXwfa2mbNjrAk1F2YBi0VfQSrVscJDp6eqBZ1qARDVlSAQHDjXykLJTv308CZfKOMbcqao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SJ2PR12MB8944.namprd12.prod.outlook.com (2603:10b6:a03:53e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 07:43:30 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::4bf4:b77b:2985:1344]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::4bf4:b77b:2985:1344%4]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 07:43:29 +0000
Message-ID: <e88ebf93-d191-b2ca-57ab-a352ca842178@amd.com>
Date:   Mon, 21 Aug 2023 13:13:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH -next] HID: amd_sfh: Remove unused declarations
To:     Yue Haibing <yuehaibing@huawei.com>, basavaraj.natikar@amd.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
References: <20230817135127.36372-1-yuehaibing@huawei.com>
Content-Language: en-US
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20230817135127.36372-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::16) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SJ2PR12MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: 4146dbe6-fe23-454f-5f66-08dba21a4fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JkfIpO6rT0lcRzuGvGD67Yfs/RcabJRrOVlGfQDc8aaOulhBWf0+HuxtHq8qmb4fTgg/iMVEhKB2al9sNNpXyAoFZQgtQM7JVqMwjgOP55wqK7/BlAvLcUhEzVV8Y6yW3HgXz8o3J0Rbf245MSF33y2fCiJFvqEeRQtaqBFBq7vAa8UfQXFBheB6MxBxuYZgnSDC7S1FiQCE00tGofcDHxBgnkNPavlBNPpnNLrG5YWbZyJUPYLeIBShDbRRr+Ag3ffap7CSeWyMxbcAThfhPr13KnI3jMTVi82VNhKes4GRPSeHsJD9oazvChnNps63Km0nbHxzvxp9wkGhwvWNPYBktu98Wj5kLouZItwian4fzbpXhfCRVXAgYf3iNY0P3Pk7NDj0p5kX9EAh1LVwGvQpLFvbrh++JTIIbN4mwwQSQz+FnHS5nHUit12Br/D3Qdd7ktDaY1ahbJ+zpCYD1l5PN5e+AfZonxo9i7oIrDbb0kxDoQ0LrMD3WtVLig5sBC841fP2ui4ZTuXa5TI2IGkf5V9ASHtc29CxKku5id8ob+o5RAC1+GdGK+q5Id/C+stes+DQmilfxSWhIzTyDFye+PjBtjrN/aWBInR7ixfsIsdaHZz6GkEzRxtP/fR2IEsoe81+J/qxpVctiYDfxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(5660300002)(2616005)(41300700001)(66476007)(2906002)(66946007)(316002)(66556008)(31686004)(8936002)(8676002)(4326008)(478600001)(31696002)(6666004)(6486002)(53546011)(6506007)(38100700002)(6512007)(26005)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdBd2lXSDd0OUdpaGRNZzF4YUJhLzM5R0VpeDlmbzJQeEViUzM3OGZZTy8z?=
 =?utf-8?B?L1ZReHgzcEVCMXBJZ3dQckNIS2FaSUs3STJFbldYYXU4Z1gvRFNDZCs2VkFJ?=
 =?utf-8?B?QnpTVkU1Ky96YTAwNXR0ZmtpRW8xbTJ6NHdqVHdZckt1eGxySC9pVHR2SmUy?=
 =?utf-8?B?WXVXeUpPVkNFY3pTbjEvQWVUb1RhTWoxOFVaSEw3Q0FncmtzdHhBMnUvT3cx?=
 =?utf-8?B?Qkpqb1JneWM2Uk9JUUd6RTFXUjdvQkxCNDQwZ05sYkI0d1NIZ2VKRnRaaVZD?=
 =?utf-8?B?TE0weGdrYmcvNVJyd3g4OTlPb2g1dVhNTXUyelcyQ3YveEZPcXlUNHZsTk5i?=
 =?utf-8?B?aEhlZlF3TjBvVE9Xc292bWc2MjFhWFcwb2QyRE00dHdRbElGU3lpSGhPTlRr?=
 =?utf-8?B?a0l6cFhkZnUwVElKZG9QdlFrSTFQTGRXOEtpVUNBZEVFNGFnb3lFQndBTldY?=
 =?utf-8?B?a1NCTVBSSXdRbXNaK3BPbXJudE5GRlRjVEoxVFBBRjJUUnVCRTFnbXJKNVE0?=
 =?utf-8?B?UnRFTWduZ2czZCtFdGxpd2FocWx4U1BNa1piOU55d2c4bEgzaUpQRW1lNXI4?=
 =?utf-8?B?STM4WWw4MHJPLzJXbk1OOThEUHEydVp6VzFLYWdLMTNnWk5CS0NnaVFaSHk2?=
 =?utf-8?B?dFJHeFlpRERZYnRaSDhrT0FyRkFoMmhKb0RlTFdPT0R2MzF5ZmlFa1NTQ0VZ?=
 =?utf-8?B?TVgzWFZhUjlmTTB4UlRRZDlDSUhSYi9QTXZWbVVSc3JCNkhLN1Bsa3NMcFVT?=
 =?utf-8?B?TGNwMXlPVWJscHRLN1RORTFlY0hWNlBtVzBGbXlINFhFei80dmwzRHEwellk?=
 =?utf-8?B?cDAvVHNiaDNscVdQb3pLb1NqRnhCRHRNRks3ZkF5eXloaElXRWlsdGhLYjlQ?=
 =?utf-8?B?aGJlZXljcHZCNEk1eXl4SXR2V2F4aDVvb0ZPcWRBOUdDTTl3dXNoWkRPYmZY?=
 =?utf-8?B?TDhBcWJNNHVFcDJlUlQwLzRJUE8xL3RRc0pGVjdwNGl3TU9yNEUwVXRwaXph?=
 =?utf-8?B?ZVQ0VDluSUJYd05TVGJVd1ZORHowTktqRDRUT1Q5TnBNUHpEK1FUQVFHNXFC?=
 =?utf-8?B?dm1UVmExbDljUE5JcWFwc3NXNlBGcGRMQnR4bkgrWnh6N1dVNDBtTjF0eTdU?=
 =?utf-8?B?Z2FTR3d3UmlaY2ZRKytOTWxicy9TUE02RkxXTyt2REEwaS9wb3F2SkhkeklI?=
 =?utf-8?B?RXdmaFBOMnczM3NHcU04UndST0hmVGo5SkxUMDUvM0N4MnRRZ0tVR1V5R1ls?=
 =?utf-8?B?eisxR3kwUVFoQllMYVlVY1U1cnBlZ1JwZTRhQnZ3TGpLNUxEdVZZU3M3MnRz?=
 =?utf-8?B?a256aFNXNi9vbmk1R0RSKzBQbGVQWHZEcnE1ZldrK2lvTWs0dG5aanNPWjdC?=
 =?utf-8?B?TGFnUjhJUktIeSsyL1RUK3A0Q3grZlZyNDRaVUlRb3Qvc0tVY0ZFYTFPeDRk?=
 =?utf-8?B?Zi9NSmc1dkpuRkNEMEpmcVB5cnJTdFdBYk1pZlNMbUVCdmFVNWtZQWdPSUVR?=
 =?utf-8?B?Qk5uZGE5M3B0a0M0Um1yK0pNeDZqTjZ0VkZzWHQ5MjFqVDdFUE5VLzlDQ1NK?=
 =?utf-8?B?aWcrT29HTWM3N0lUc2NERE1KSUhSeGRjckY4WXJtWUhHWkN2VEFlVlZkdVlp?=
 =?utf-8?B?QTl6bWhmN2pjMTNyTTFaYUIwMmNZbE9CZEo4UWlNTFdHN1hDT1BvRXV6UEJj?=
 =?utf-8?B?Q1BCc3l1cDA0V1RFUVZkVE1JTS9UMEdTQW1ZbitYblNBSHN2aVpIS2dieFBn?=
 =?utf-8?B?ckFtSTk1K2oyQ3hONTFUOU42OUxIcFhzK2xhOFE2SWpZYWJ2MTZnQ3FMQVZU?=
 =?utf-8?B?VjJ4VldpVHdxWFJKc0tmTFl3OGd5STI3L1ZzMWFJMDRqNlFMRGtUUUROWXR6?=
 =?utf-8?B?cU9xSXRsZURUSXN6UHBqV1Mxc3JLZ09ISU5OQ1NvN1BCN0lqL3VNaENyckQr?=
 =?utf-8?B?cE5PR1BOQ2x3WEJ0alFjaXpMVkZSajV6VS9OenVSQU1LVXFIa01STHJHa0ty?=
 =?utf-8?B?TGtLMk9wT3pWcGZZaHNPZ0dnNnIrZE9LT1RTaHU5RmRtdWQ1WWVUM1NxeTIv?=
 =?utf-8?B?d2c0eG0wSUNKV0QrRDdGNjM1dWhNOHQ2T1Bzb2NDNThKbzhmVFlNekxTazhN?=
 =?utf-8?Q?tFXzKmqQL1e/+Lzd2nWZDpXre?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4146dbe6-fe23-454f-5f66-08dba21a4fc6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 07:43:29.8702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyrsf/2sh22O1WrvoEK87GUpggziCy5dlOfd5CnH05r7qczsg77+jVHrq+IKdrjw1qSIJaufrrouzPxEv8V39g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8944
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 8/17/2023 7:21 PM, Yue Haibing wrote:
> Commit 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor
> Fusion Hub (SFH)") declared but never implemented them.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> index 97296f587bc7..1c91be8daedd 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> @@ -73,8 +73,6 @@ struct amdtp_hid_data {
>  };
>  
>  /* Interface functions between HID LL driver and AMD SFH client */
> -void hid_amdtp_set_feature(struct hid_device *hid, char *buf, u32 len, int report_id);
> -void hid_amdtp_get_report(struct hid_device *hid, int report_id, int report_type);
>  int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data);
>  void amdtp_hid_remove(struct amdtp_cl_data *cli_data);
>  int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type);

Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Thanks,
--
Basavaraj

