Return-Path: <linux-input+bounces-7212-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6040B996EC9
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C8152842A8
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807A01A2554;
	Wed,  9 Oct 2024 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vPoCCrKX"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA119DF9E
	for <linux-input@vger.kernel.org>; Wed,  9 Oct 2024 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485572; cv=fail; b=RNZSA0sDO7XHrY3mEiR4TF/uOgh6LkM8x3bOGTqDFvIFLKazbx/DoAB4FKNoXayps8rtfhagxjZsLUNaC8opWp9RKWcsFHGzWqi8RZg5k8OA1bdVvhP+m5cFnLW0RaRsTGemPnJIxKgGIPOVEoGImLujfNdEyu0Nzg/lZlAZKAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485572; c=relaxed/simple;
	bh=dhnNTILj0aebrNfFdCcoTt5hDhFIEZ0Hz5hWuTTnQBc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l08OTTqZykoTICo5wfY2HBSthq/91cTa/uiuxVbh7fVcrQ3a5r7AyJMbl1vpcIvgMy9POIj39UyVbEw1CCYUWDHPylstWw3gBLxPJ+46uITIXgA/xpk8+DCLSwVLX5Kv3qmhJsCsELeyLDIRQ+WjfEemjHhkt0HXCIOcvmGtcrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vPoCCrKX; arc=fail smtp.client-ip=40.107.243.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2uNJeSFFHFvO39veMWUPu7gvq9tww7mnl0LXMiQ+Uwl8fEcKKgsusDe3pDQscBlbCrdIyYkXuWR/m9r/6v6HL+h1BUiqtvdJsa6VniGNumroLSqVb3i/1J5v6STf9ltEpICYIobNdItLjweARMWciiH5QXYcR8Q7MRPj4hn3BS3Mh8zE6mmySiF5kz19QR8oICumj+UiF8B7V/9SyTxBqK1hpev47JvYXer3K4b+ZgqIdrr43qj/w12HnY5QD2tOaX9EqfCchgMTntz99hCnUjzc92JyORlRgpy4Jj2whQnUa74Ol5yy3YBiOU9yaLE5FhuFnXu6acGEcF/e/dodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfYoN/e3YCWagu31M//TdY/+PoTUfvmft4BMJSIPVFU=;
 b=s/SQg8lBjjHBUUh2j75gp+KcHSD9/6wbICgan0bQZOyMAdUwB3ZbK56skWpbhZis/46QL6Eo/Fim5NhCGcUSPlwj7eJA30u3vNsxjPWAj5RoLh2azXJI4RmIBCEPdHnUaLZOfWoqAMwse2INeLP7ndWKRgnIs5jSBkhlufup9NfLny5/grO5NeH1hJ6pxBERyJ56D2sYEIClMn8wIAg0pw6WXnA6qV7TmizS90GHzdEQZQhBOBFTCraUppTsDtZbPm7jF01Zx8GmzkqyIfnrTk5lDttdmY7bIk3thZH5J/ZssijZtrjkLQeEGhSRiG46uZUHj1vXE9m9t0uY2/sStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfYoN/e3YCWagu31M//TdY/+PoTUfvmft4BMJSIPVFU=;
 b=vPoCCrKXqUVJCO867TxB9n1CHpbo8tgiPVebyIvmvEnYObmJdkiZol3XdmvRi+Sg2ibgNfwdJCxdxiqTBbd9H38WNzv/HMsAv1lQrB3YMrgphCd8quRv5GwcfqyVjcQHJYZiz7jlYuMosPX4L5qpW7Vsc3yoIIGHezOhcXwuHFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 14:52:48 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%6]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 14:52:48 +0000
Message-ID: <2214cdc6-2384-dc6a-f77c-fbbe53d979a1@amd.com>
Date: Wed, 9 Oct 2024 20:22:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] HID: amd_sfh: Return immediately if no sensor is found
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org,
 Chris Hixon <linux-kernel-bugs@hixontech.com>, Skyler <skpu@pm.me>,
 Richard <hobbes1069@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>
References: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com>
 <a3fb27a2-5167-4880-9102-eaf0f47df398@leemhuis.info>
 <uupvw2jw6j5wkwtfwljipmpx4kynv6k3wqgy6sg3crw5r27rtm@mudhwifihmtw>
 <79320190-8461-4a92-bde2-29a3988a6782@leemhuis.info>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <79320190-8461-4a92-bde2-29a3988a6782@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0243.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::6) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MN0PR12MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f5252c-57f5-40e6-ece0-08dce8720a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmRiYXYvMXp2bXJtZEVkT0tXVVZxY3NXelZnNWs4cDJoUDg2SndBTE1kZkhz?=
 =?utf-8?B?bVlLb3BBMnJkR3AzeURWYnROajRnZVcyT1pHbW5Dell2ci82dWw5MnVMZmRZ?=
 =?utf-8?B?ci9QaUtqd3E1K2pyV21RbVk1ZllkV2hoUGpCbmFRSENodEFDYlRzbFBpeHdp?=
 =?utf-8?B?VGJMcFVGSGJqMjhta0ZQTjdPSURMRlJSR2JNd2xCamVaQW9vZWkrcWtYYXda?=
 =?utf-8?B?OW9yaEVaeStYS2M3Y0N3U3hVaGZNMHo5VTNQWW5qTy9Jclk2Q2ZjTkxyUFBk?=
 =?utf-8?B?RGs1RFNkSFFnMjI2V3lSb1ZFL1g0T011dkxtaUVIa1ZwU2xuK0J1bUJ6eUN0?=
 =?utf-8?B?K1dMcnV2MThtNEg4Qnc3VmNLK01DNXRJVjRYaXEyemdydnl5cTJHSjNuQWlm?=
 =?utf-8?B?RzcrajhiWDhEQ3hXK3lLNlg3R00yd0RaV1ZkaWNWY1dCT09XK2x4a2pCYTVO?=
 =?utf-8?B?Y0NoU1BsNUFRTjhLRUNwT01oaTJ2cmFqZWo3Z25CNjFFUUJpYnJpcWF2dVhM?=
 =?utf-8?B?L1dZR3FZcHhKY3lvbWhoVmdNc3VWNXZmdWg5T0hRLzR4SFVMRW81U0dTQ0lY?=
 =?utf-8?B?dlF0K0tPTk81TXJRQ2xsTEROOFljWWxCZHljZnRlamlibktJQVAzYUQ2TFBM?=
 =?utf-8?B?Q2UvQkd3ODFnVUF6dW5hTFNwRXB2eWNSV2hlNGdpdExtZWhTQXYzV09SUHB3?=
 =?utf-8?B?TFdFbHhTYlB5OFNtTnlDb1VlU24wVUVVdlZwbGY1TGpZemI1d1JKUFJyYkpB?=
 =?utf-8?B?RnhNMjNwdE5CZFdZYWFrTmozZ002ZWkrQVpTVGFQYXBuVjZOdXBnWVdwYjc2?=
 =?utf-8?B?bzNmeGJhS1ZnQitLSC9xNElRMEZhczZ2eWZHUGNkblFBbWU1TzZhKzU1dkhr?=
 =?utf-8?B?bk0wTDF4NFdyRm5zbWlvTXJvR1lCRThwTE8xdGtFdmQ1ZFplZTNZTWRQNkVs?=
 =?utf-8?B?T3I5WFBDNXVCaklQS2JxZUF3aXZ6cjNERFo4MHFLVVRMR3VXYStkM3krenh1?=
 =?utf-8?B?d0IySVhSZmlEcngrUDZyYVcxWlNQTG1iRUtSZ1FPZUJmaURraTViMXVLMHdq?=
 =?utf-8?B?WVJKS0Rta0hLL2hUS01FUGVicEhjVzR3Rk44S2FKWm5oS3pPSHNvS2cyRmMw?=
 =?utf-8?B?alhPaTYrWFdIaFU0MnZtWDVvbVpKSloxdVdZWnRXTlQ0WHloUWZBbjhVaEQz?=
 =?utf-8?B?VzN3SC84OUEwbGd3QnVaU0NDRnVObDBRNWdWQ2NJYUdURXhKb0FjRVNQTDhK?=
 =?utf-8?B?ZlJWZ3pJbC9xRW5scXFOSzROODI3cVUxVThhdUM2UnZ6Q1REZ3YrUmpGMFZP?=
 =?utf-8?B?WTBTS1pmZEVDUmhHa1FDYUgvbFJyM3dibWNjR2NZa21WbnphVm9vMVZnNlRL?=
 =?utf-8?B?TlhCRTAya3BDWnB4aFlGRm5sMzhEVXpzTDNjOXRlMjZMVnl4L1JQTi92bmNt?=
 =?utf-8?B?WDY0U291VTc0bWdDZDdBRG9KY1RpZzhHMVpoNFZ0anFvV1N2c01rNW1wQjcy?=
 =?utf-8?B?ZDVjckxwWm5FbjBmZ21vbWVwRGpwalg4Z1gwR2VCdU1pVDRzdkJEdituOEw4?=
 =?utf-8?B?QjZ2dnFNN21TSXdhWHpScnhxZmRZckxQTDh6ejIrN0RDY2xQUVRnVWsxMk03?=
 =?utf-8?B?bTFMMEpkOGUzZ1haa1F2bTJITGxxTlo0ZG9tck5MVS9mUEV0TGlMdGdDV285?=
 =?utf-8?B?MzV3ZVpaUENveHVwSThZN0VSYW1NMnB3NVc2M3FTRXlScjJtU2prbkFNZjE3?=
 =?utf-8?Q?59CCHX3/2RfmR+9E1s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVdpVStzd2J2YnBOdzFVL2FBdnkxNjc4ZmFqRlBOcS9WS0o3N1pOYnI3V1BD?=
 =?utf-8?B?Z0h5THVNY1ZVVUUvV1llWlc3T05CU2lyOFY3ZjEvOG1LZHQxTnk4MlZaaVBR?=
 =?utf-8?B?cmFEZ04wcXplU3UzS1MrckN1THBxVlFBeHNqOVEzRVMwWjNuNStqWGFFV2JW?=
 =?utf-8?B?bk11UkVlVm5PU0lwc0crajB0cFh4NkdCS2lTVTNiVWEyNE03VlIxNnVIaEJR?=
 =?utf-8?B?UkprdEZSa0ZQZEE0T1F2MGl3c3ZvMHc2YUpTclptZXU3Y25zS2g3KzdoMlQ0?=
 =?utf-8?B?ektJcmpmeHBFTHVOaTZYbUFWZVNFaEdoQmpGUzZUeko2VzBRaUtIY1dvRDN0?=
 =?utf-8?B?aGtGc3NsTWR0akNzOWFpdWNPNS9oS2JiODNHMzlSSWhLbnViY25SS29NbHVK?=
 =?utf-8?B?UktycnB5WktjNys3dkF4akRGRGVjMmVTKy9JbU1PTzlEZ08xaWxpUU9NNlBs?=
 =?utf-8?B?cVpVUWkvLzluRHFnSjBma3lCQVZpNDF3WGJ3WHllWkVlSE9iNnlZTUY3TEdl?=
 =?utf-8?B?N2E0b2VTSUhZZDROVjFJRFBBUzVnRkpzRUgySFljd2Y4ZjkzZFoydlBRUGdv?=
 =?utf-8?B?dEg1VVg0SEtQRE04UWdnYlBXM0lMcTRsWWV0cDMySExLSW5TWjZOaDJ3Q1VC?=
 =?utf-8?B?TTZORTJCQzBIcFRraXZTd250b2V0aVc5V3VFK0ZSN0RWcHJOcEM4aTh4U2kw?=
 =?utf-8?B?T2NjTG9tMWhhRVhCOHVqNm42NCsyalZZNVlZTWk0THNSWjZaSEVTL1hGbDY5?=
 =?utf-8?B?clpXcnBMUCtZQlRDWHdWMktnTkhCeDRFVlNNNXg3WmNtOHhHOW84VVIzQ1Jt?=
 =?utf-8?B?Z0FFUnZwbHVGNktRYThZRTllN3IvNlBobDd6SmRwM2FRYjhUY08rejBTMmpY?=
 =?utf-8?B?bEJnbWNCTDF0RHZvQU5RNHIzVGtveXNJclJOVjV0ZzZ1b2tiUmVHR0JnQ1pP?=
 =?utf-8?B?a2FZbWdUY0pmTzFXOFU4ZktiajhrR0RZdDM1aXdZdENTUTFaV3VaWkU0SjVr?=
 =?utf-8?B?b3lPVVdTZ0tKc0trNUdNOWZqYWZYZkJwVW81VDczV3A5YkJvZnNyUkpaWUVh?=
 =?utf-8?B?ZmtBbzJvYlZYazZxRDkvNDNpOWV5VWJDbnhrMUt1NXlPWm92V0tyaXNFOHZ4?=
 =?utf-8?B?TEJHUDdtYzZ2Z2dxalk0bmFGL3JUNjV0TFJ3akJ2Nm9DVUliUUxtQ043RWti?=
 =?utf-8?B?MGJWMzZYV3Y0VXo5Z1FqMm1Vb3lvMWN1dUliVTNwbStIWjQ3ZHJzK1FJQ0FS?=
 =?utf-8?B?blgzV0VRQ3djYkZBQkppM1Q1VmFVamFoVWNNVjJxdE1hL2VuR0dOV1VPaHFL?=
 =?utf-8?B?S1BsdHBPNUdlcjFERm9STjEwQ0NVeGpWdDVYRXJSeUVvbERmVkJNS2Z0U01y?=
 =?utf-8?B?UDd2SjlaMHBqaVhiVmMwcTZSNDc1S0swVVk4Q2ZxMlFYQ0VaVktERGVGY2RQ?=
 =?utf-8?B?dXJQNllNYzNDTHFueXM3V1JkSUxiNVlTemJQUTQybWlpaFkzM0RhdHhmOExK?=
 =?utf-8?B?Nlp2UUg2bU5RRlpTaXcwS041L3p3elA3SERDVVlCdlMvMzZvWTlsdDdiaU4z?=
 =?utf-8?B?dW9kaStnV3ZnY2JyQ0N3U0c2ZFNucGE2TWJLbi9pRnNrWkVOUVFUUTdhaDM1?=
 =?utf-8?B?ZnU5ditrdGZIZkExVzB0Nm43dStubkhKSFBiSGFqdWkrMklOU0dTVTBneU04?=
 =?utf-8?B?WTQzaWNtdXFvZjZNVVJXMG9iaHh5TFp0RnZIdGZXZG1hQXAvNnJMNFlMVm9Z?=
 =?utf-8?B?cnc2Qkh5RDRmWml6YWo3Tm1ySytFTnFMd0gvYnNLNjVqZzg0RjFhT1FCaVdy?=
 =?utf-8?B?RzdSTVF4OUNNS0JkWXlzSFNtYVA3ejh6NXdNaVpMaWVKKzJOZWwyOFJINWFF?=
 =?utf-8?B?c2NLaUFoMGRUYnoxQ0lqNXk5aktkSEQxMDh5R2MxMER4MmNPeWJtL2Rla2Nz?=
 =?utf-8?B?SVZzeG5DcitZV0tGVG9lL2Vac0hiNG56bzJyL0R5R0huRUdUOEdJSklNSmlS?=
 =?utf-8?B?TjBMR0F3a0QzSC8yTXdiUVVLUWtQeFEzMS9kWUFCS2o0R2pibXFIOEZrTUhG?=
 =?utf-8?B?dVZiblBRbXZwTlBLZFFtTWNpOUlOOWFBZW5uVEpVTjU3dkFMeWR6MmEzR3ZN?=
 =?utf-8?Q?oq1OctPPKIVNg1N+CwBJf+9Qn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f5252c-57f5-40e6-ece0-08dce8720a6e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 14:52:48.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hw7iV7suKIFmtdhbgPZoQ439lXZQ+bq7Fzk2HbFZb/SSOgqcurYw2pKy5EpUSPoKZM2JdMkXZxorP46oBM1f9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979


On 10/9/2024 3:50 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 04.10.24 11:12, Benjamin Tissoires wrote:
>> On Oct 04 2024, Linux regression tracking (Thorsten Leemhuis) wrote:
>>
>> so cleanup is doing:
>> cleanup:
>> 	amd_sfh_hid_client_deinit(privdata);
>> 	for (i = 0; i < cl_data->num_hid_devices; i++) {
>> 		devm_kfree(dev, cl_data->feature_report[i]);
>> 		devm_kfree(dev, in_data->input_report[i]);
>> 		devm_kfree(dev, cl_data->report_descr[i]);
>> 	}
>> 	return rc;
>>
>> Would that means that the memory corruption appears during
>> amd_sfh_hid_client_deinit(), or...
>>
>>>>   	}
>>>>   
>>>>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
>>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> index 0c28ca349bcd..1300f122b524 100644
>>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> @@ -351,7 +351,9 @@ static void sfh_init_work(struct work_struct *work)
>>>>   
>>>>   	rc = amd_sfh_hid_client_init(mp2);
>>>>   	if (rc) {
>>>> -		amd_sfh_clear_intr(mp2);
>>>> +		if (rc != -EOPNOTSUPP)
>>>> +			amd_sfh_clear_intr(mp2);
>> ... or during amd_sfh_clear_intr()?
>>
>> This very much looks like a band-aid (I know it is because you can not
>> reproduce, not blaming anyone), but I'd like to know a little bit more
>> if the bug is not appearing anywhere else in the normal processing of
>> the driver itself.
>>
>> Also a comment explaining why this is the only case where
>> amd_sfh_clear_intr() should not be called would be appreciated.
>>
>> So all in all, I have a feeling one of these 2 functions is not making a
>> proper check and I would rather fix the root cause, not the symptoms.
>>
>> Cheers,
>> Benjamin
>>
>> PS: sorry, I know this is a long standing issue, but I'd rather not
>> paper over a bigger issue :/
> Yeah, me to!
>
> There was a new patch in bugzilla and people tested it (see
> https://bugzilla.kernel.org/show_bug.cgi?id=219331 for details) , but
> nothing has happened now for 48 hours, so please allow me to ask:
>
> Basavaraj Natikar, is there any hope that a proper fix will emerge soon?

Yes , please find link for the fix as mentioned in bugid.

https://lore.kernel.org/all/20241009144757.3577625-1-Basavaraj.Natikar@amd.com/

Thanks,
--
Basavaraj


