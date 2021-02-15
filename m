Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95ACB31B5DE
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 09:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhBOI0H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 03:26:07 -0500
Received: from mail-eopbgr690082.outbound.protection.outlook.com ([40.107.69.82]:15111
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229595AbhBOI0G (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 03:26:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTYCi02ZlRACMDpJz1UJ7mu1hKunv/HEDf2Fdp0NdqrazGX6cmCmm8O1TjzeYuRGsos9tD/QNXaqIYjQ6CeYJD5ahAUOynN6RGiejohgwz00qTmyFqLu/NXIPOAN36XfRQtcGWTkP71T6Fq9IbHwurZ4a6tJvoYka2kwSiSM5ZXtISFuPxOPZYR+BTxlFUp65l2Lx6JlbBJ0DFSnXK0eOlgwzgwEaHsX4JFCA1YQ+XjF1BD0IsHuaeYqW7hvEVn+FIAoDcInO0f12FMQf+wB47p+G9gvoam3JuGh+3nfMiWve8VoGlCHj5bUhqRmbOGEbZXPySFe2bGw73uxruB/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYSyKPeagULqR3mxEoXASLNwRTnJ3ecL/9rUtFZkUEg=;
 b=dzuGIh7I4hcfcp91hOeFJV1PDYNOVVJcgn72K8Om6dQsyALbcz+iGj4AwWpea+8hyhr9oR8o+mTda103K7NU4o/8tnx72JEAMB8YZGBrAxXYqpCnPSkB09WmcMO8wU+do0KJR2aH+L+JtqNfL0YUzK7z12emg7tnprjccZ0FAjZKSZm9Mz35AjgCQR4RoaSVFkDs8GnghspIbrR3Xr0nBNMwY4zZlID6/Mo6XVLmsPTWdHIgl0yIdoOUdRf2UWiPGcx77LEFqRc0Lrj+al72y5b8rzlpldTOp7qbA+LDpV+TagpGp5kjFLJPpQgcFgmCdYs8cPoJFhwNvxtx/BZNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYSyKPeagULqR3mxEoXASLNwRTnJ3ecL/9rUtFZkUEg=;
 b=30DlV6CKnfUtKJ6OaEccognZW6NF6wrMMoX82xDUgIPcCRZA3mjJlUehpdKUlTDGkWO/LEhp3Q4a5mPe87uCSZDyjCCOSiMgw+D01tKDyoCk74LyUXJzy3TCniba4kk4y1+bLJAzJ/lH0H4hGR0eFcTayVL9r4ropnY44cCKNHo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
 by BN8PR12MB3122.namprd12.prod.outlook.com (2603:10b6:408:44::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Mon, 15 Feb
 2021 08:25:17 +0000
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::d812:d649:7699:bd74]) by BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::d812:d649:7699:bd74%10]) with mapi id 15.20.3846.042; Mon, 15 Feb
 2021 08:25:17 +0000
Subject: Re: [PATCH 3/3] AMD_SFH: Add DMI quirk table for BIOS-es which don't
 set the activestatus bits
To:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     Richard Neumann <mail@richard-neumann.de>,
        linux-input@vger.kernel.org, ",Shyam-sundar.S-k"@amd.com
References: <20210128121219.6381-1-hdegoede@redhat.com>
 <20210128121219.6381-4-hdegoede@redhat.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Message-ID: <eac9fd4c-f3ea-1127-a59d-aaa01ca8e0bc@amd.com>
Date:   Mon, 15 Feb 2021 13:54:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128121219.6381-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [165.204.158.249]
X-ClientProxiedBy: BM1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::26) To BN6PR1201MB2467.namprd12.prod.outlook.com
 (2603:10b6:404:a7::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.159.67] (165.204.158.249) by BM1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend Transport; Mon, 15 Feb 2021 08:25:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7834a9ca-f643-4bdb-0b3d-08d8d18b3968
X-MS-TrafficTypeDiagnostic: BN8PR12MB3122:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB3122E52022FF0B5A42C7C8D4A0889@BN8PR12MB3122.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3OggUz50a7Hb4XR+a66x/OxHAer4lWFzmeBrEZybC/gf6JvRmaIwvXYCvBtrXX+ZRtj4SOIaTUgs8XEhA1zLfJlAbz3meJ27TwO/VkO9XjzHJiYPQ74zPEsjkZz1juk2dKxNhiMrFdneJzWSLptbNTpSDvJJvEsm/bXsy8/1+7HIAbOSIAjlkuF/iGYzdHY9NIOlNkzz0uN5yYnzg5VrQJP8doGw2CIDB4qMLsg6DmpMaXjq9FNXSbrnvOeDWK9oqfvm0ayXrwWS+Ya35JKbBgfvTGg6Uw7LZd+/gT/ZW5Yzo4KVKLQJsGqjdqGZtfcBeZcx716Mwz7DKeldRlUnELrKvYGcEMA5RrqW7tauMpxvcHjzo6FbMp+oNt96vbzufI4/5pCEmVpwnPyJq1XBg+eVrkwDk5ntNhLO6hVYfEE+iw9WxcGIFQkZeu+jbVsreCjQo6k6TiMgE5Jj6MtT3vByZ2OUDlSiWeVhJQU2DXpz3sUDuq4BO3bkh0wYwFw9Ffu3AogpmQfhxtnsboHImAwce1QHaRPE2pY/55RyLmhLVrp54JVc/KTihxOHCH763lhGVWvolDtqtPtIu5NQNWYOkJ58llnibs6L/VCxAscri4Q0riGeD/2dH3GmU/MPCnzjtXeWS5Kl892ynmRUU7CmeT+rPgNxcpF3nZmDJ0xtrIYomF3q5XOB61AFYxZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB2467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(86362001)(8936002)(36756003)(66556008)(110136005)(478600001)(8676002)(66476007)(4326008)(83380400001)(52116002)(6486002)(31686004)(5660300002)(186003)(2906002)(956004)(966005)(26005)(66946007)(6636002)(2616005)(53546011)(16526019)(6666004)(316002)(31696002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZmNIUVRDLzJjdjc4eXpaN3QwQnN6cVcyL2V1dE1XMktKUk1YQXFRc3pLUVBJ?=
 =?utf-8?B?bktlRVZodmllRjNQUE1NY1dwMThZMVlrVHZoRUdUb3VSR1E2SlVFOWFCV29M?=
 =?utf-8?B?cnkwUDk3aGd6dDNjWVBPaVdpbEhnMkpWTzFpWmErdzVySEpjVTBEZzdiMFN2?=
 =?utf-8?B?UTJQaDg5TmlMUXpxNVNrNFdsOHczU3ppdnF6djJvdW9SM2dTUTVnbjZXTjRi?=
 =?utf-8?B?UEhRSFF6QnJ1cGtrRC95ODZ5aTg5UThRVUpKSDBhNWZKMExZK204dTAwNlVy?=
 =?utf-8?B?UnJmZm9aM3JFTzAza2ZkakZkYUVDR0FrblNtWVBKeE1FMi9Uak45blZRNXhx?=
 =?utf-8?B?ajFzT2MyNk54RXZ1WEhEcS9GdmVadDNCb1kvQXVLdHRaQzgyOWpWbUQ5UnFt?=
 =?utf-8?B?bG9nQzJHZXRaYjlzamhmbTFteGxKQTFmUEF2a29NRzhvTTUvdmFFb2tVR2Q4?=
 =?utf-8?B?YThlT2x3QXNDYWZCU0M0WCtCMlpSRzdtSzcvaHdua05ZQzZTSXorOU9ja3pJ?=
 =?utf-8?B?eXNzSGdhdjNqUFhOWlVOQlBoUmRhVmw5YW9vNjRSWjgzV29vUyt2Y0FxdExT?=
 =?utf-8?B?bW1YL09hU0NLTHNiREZESFI1L0Zkbm1DcWwrMzJ2SEhldndzSVNLaFR5c2wv?=
 =?utf-8?B?QmxIcGxqSFF5SXpRbXdxUWpMQnRGaEpPV3dXckMzQ1E0NHgxb0hNeFRWLzBO?=
 =?utf-8?B?QmpnTXd0ZTZ6YkJYOG9VY0krUTl4YzRrdVExVVgwRWlBR3VLMlJRckd6RCtL?=
 =?utf-8?B?bE5CdDIyVjhLc2I2UnNkQkhiOFZ6bEdFUTZmRUhRUVFmTURNMklqVUVxWkVZ?=
 =?utf-8?B?RDFkNlFPWUd5M0czRHhYV2xocktENmxvcHZGZFE2VzIvekR4UXhBY2I4aTF2?=
 =?utf-8?B?cU9QVXdNWE9DcWRYbUxhRWVaRWpWWGNtWFJPTWU2L1VIWHBSR0VaNDA0c2VN?=
 =?utf-8?B?cXAxc0hLYlcraDFXeUxaSzNXMWt3U3hISEZtQlRLaHNqSWwwOUpvRk10aVo0?=
 =?utf-8?B?R01yd1AvdFk2Q0JGT0xTT3NEeENlWUtBUGc2ZzV4TEdac1NXeDlqN3g0b05k?=
 =?utf-8?B?ZWRHRmxnSCs3VnpHeSthQ05RUHlnSFpzSXhici9GV250OXZiWVFad2pyZ0lv?=
 =?utf-8?B?YWN0U2c5aklxOFIyOURrTVJtQnBraVplcHNPeC9BZndKR2F2M09zRXlwZGR0?=
 =?utf-8?B?Z3Q0enRRbVd1b2t1S2k0TDZWV251NE0yUTNGM3crUmxUMFBxQlFMV1BiYkgw?=
 =?utf-8?B?TUtGU2huL29QQWs2ZXI4bVUyUmY4bDV1QkRsRUY1Z0RjaHpsUFEzZERydVRH?=
 =?utf-8?B?ek9SSXd5ZjIvcmRaU2VBaGhSSTREZFY2R2ZrZUNaelBJU0RYSEp1TWJTQ3JF?=
 =?utf-8?B?bzczaHVFL3hLRG1kZGExRkE2MkthT1hNN29COVQ5SmRMSXJuTDduYUM2YkRM?=
 =?utf-8?B?VXJ6ek8wd1J6Y2c0cU1qWThHUy9zOEwyUkY1by9EMUEwZCs2djdncjdDUHF0?=
 =?utf-8?B?RnJkQ2wyb2tSSjdxdzlGMkk4WVMveUozQjlvdnpPYVNGZ2l1YlRlQzVYazd5?=
 =?utf-8?B?ZEp4UzM4OFpKakc3TG5jeE93bEFKMHhYTjRvaGVKRitOeXgvU1ljTE5HV2wz?=
 =?utf-8?B?UXFpNlhHTjRsaldYaGxKWkd1ZjE2SzFFaDZyQ1p1cHlFNkVEMXVvNi9pT2Rm?=
 =?utf-8?B?WmtycjQ4T2xtOGJ1MlIvTmtoakhiTkQzTXl6SXN1M2NvbVJIWjJMQTNYcnkr?=
 =?utf-8?Q?yl6l4PuZKolPe/TEJ0xU8LgcosGxhrHk9mwNA8g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7834a9ca-f643-4bdb-0b3d-08d8d18b3968
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB2467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 08:25:16.9623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hv5PxT44suQo7q9wx3fJd9BBCJ/ozcbEmSpm5cGqbOw7Ij4ITsiwPFboDLHFgQJH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3122
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,
On 1/28/2021 5:42 PM, Hans de Goede wrote:
> Some BIOS-es do not initialize the activestatus bits of the AMD_P2C_MSG3
> register. This cause the AMD_SFH driver to not register any sensors even
> though the laptops in question do have sensors.
>
> Add a DMI quirk-table for specifying sensor-mask overrides based on
> DMI match, to make the sensors work OOTB on these laptop models.
>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199715
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1651886
> Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor fusion hub")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index ab0a9443e252..ddecc84fd6f0 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -10,6 +10,7 @@
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dmi.h>
>  #include <linux/interrupt.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/module.h>
> @@ -77,11 +78,34 @@ void amd_stop_all_sensors(struct amd_mp2_dev *privdata)
>  	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
>  }
>  
> +static const struct dmi_system_id dmi_sensor_mask_overrides[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-ag0xxx"),
> +		},
> +		.driver_data = (void *)(ACEL_EN | MAGNO_EN),
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 15-cp0xxx"),
> +		},
> +		.driver_data = (void *)(ACEL_EN | MAGNO_EN),
> +	},
> +	{ }
> +};
> +
>  int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
>  {
>  	int activestatus, num_of_sensors = 0;
> +	const struct dmi_system_id *dmi_id;
>  	u32 activecontrolstatus;
>  
> +	if (sensor_mask_override == -1) {
> +		dmi_id = dmi_first_match(dmi_sensor_mask_overrides);
> +		if (dmi_id)
> +			sensor_mask_override = (long)dmi_id->driver_data;
> +	}
> +
>  	if (sensor_mask_override >= 0) {
>  		activestatus = sensor_mask_override;
>  	} else {
Can you please confirm that HP Envy x360  is whether ryzen 4000 (Renior based) series or ryzen 3000 (Raven based) series? As of now current upstream code does not have support for Ryzen 4000 series
for which work is in progress. However, for Ryzen 3000 based series this patch looks fine and thanks for the contribution.


Regards

Nehal


