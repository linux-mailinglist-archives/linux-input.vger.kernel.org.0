Return-Path: <linux-input+bounces-5284-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E2C945C8F
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 12:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0675283A8A
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 10:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1760C1DE85D;
	Fri,  2 Aug 2024 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HBJRdNCO"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35114A603;
	Fri,  2 Aug 2024 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596147; cv=fail; b=dkzcZUltOHRaXU07fTqptMl1POcNf8e1V5VyGhRo2lpbfUJ27wimKwcubB1xUnqBiSa9UBqqM5Q4rzIt0mQXkVyO3kHiQDI3qazJrOOWRrepvPLLcFwwzEgc5Y5WG/pqWFDyMevSreNh522ODze+P/L/jHJ6Hqq1lVhiaIIYgp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596147; c=relaxed/simple;
	bh=EkQDgEE46lybri6Qx40XCac5eTjcMvhRS22xVn0siL0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mTFZhQZhu3pcC2gLWSvQUxmZJlrzhHAV4Kku8HVT2IRcxxApzXymZ4i0pyVRsTohGwHG1Hwpr2LdOfPNYhH74IchrOOXUNwYZEXv4X7HVKZD+bSJhgYuBcZvx4Xek1cLzspbnskv/7qPrfbjRqFfo6TtTUUhO/CrPRHdgVzGhq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HBJRdNCO; arc=fail smtp.client-ip=40.107.236.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP7Ip7PzZ4rio3T3ibvGcFSH7HWlAQ6Sf5l6+kPPPeSKCQhYzkeioNKm1YdrXfsQeehd6QBOqzKmx66HYiiaYbnlm7ViHOFErf5U5ZSsokharG4giMDAQP1w6FTs2Ctmu2xa3Jmzf6cz0alG5Badib0sDs4CuwZH463eiIwvjXlmPbY/GkNWExBZVZmU+greWCVCBlM2h08GS0udziR/GTVyuDzWwFjgavj1XC3GN+j7+qmd7R1N+k6X4SpeVqfgNDKBxK5SrsHBXz7JEqeQQxfoj4tjBY2Hcvk0Myk6prPWE9XKMzlMawYZaByKpQzObCFb22vVa9/6A08SCQBdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBWpqaswiNTnNP+YPRl/GNqQ42jUJLZ4NkiYEZ9OMTg=;
 b=GkTH07b4QjnraaVhHMUCbginj5/vydIKFroRnEJDvfIveValWKur5v/db00IgtO+WkZm5enUsVV3YV5T9VI5A3zONFfpp4UWtrEjFTbeXmj+pHzvpwUVCO6SnEJbkF7oY0kYZlH+OBftacufuDoYZm+bhNpsUk/5O8334uCoPKCudRV9pCh4dEA0GUsCgU6zWsmCmbrWjX7cZ4dWd2b+bF0B2AK38eQ/g8/j4FixLx5GtxFb1MHVnlFQi7CngycUTcX37WZ4X6wapIqiiLtzTs9Ywww3MxqVpz6KYAoT0iyeQyVcrg/vHB+Zv4xihvWEXUUwdaqmF3UMWm4tCUWkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBWpqaswiNTnNP+YPRl/GNqQ42jUJLZ4NkiYEZ9OMTg=;
 b=HBJRdNCOuaXUiDO82OtDQg3Br/Wtb60w8MGf+LN9//ZNDCh8l4LtqdR2KOXudygVTBrJxber7d7ZfDAsVgr7AGGu+M9c1QG038YiF51p/LU8YpjtjAH5mrhf/G3NDW4Rx7/Ghc9sf5NTka77UzRBdmiIpy7H66A7iGXfTJdOj9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 10:55:41 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 10:55:41 +0000
Message-ID: <d1c3ab42-107d-4ce0-9d47-9870084c9514@amd.com>
Date: Fri, 2 Aug 2024 16:25:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: free driver_data after destroying hid
 device
To: Jiri Kosina <jikos@kernel.org>, Olivier Sobrie <olivier@sobrie.be>
Cc: Basavaraj Natikar <basavaraj.natikar@amd.com>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240723084827.11773-1-olivier@sobrie.be>
 <nycvar.YFH.7.76.2408021247560.12664@cbobk.fhfr.pm>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <nycvar.YFH.7.76.2408021247560.12664@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SA0PR12MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: 8870b277-560b-4792-c803-08dcb2e1a676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVhXWStYNzZtaGNxc1NNaUpKeGFERTRPY1lkdTRYd2RmY3Y3MEcwOXF1WDFv?=
 =?utf-8?B?aStLV3ZKYXg3Vkp0a1AxMjVkblZuN2JXQ3plYVh6V0l2L1RZNVRDMlJQUDBZ?=
 =?utf-8?B?eE1BVHdsRlh4ZG5wRDdib3Evbm0rdFFndjd0VmVYWVY4ZnBReGxLdXdKOTVE?=
 =?utf-8?B?dlhxblpCWDJkeDlBZ2p4cXByWFlSV21uN29tMmNzNEN3cmJ5RDlwcTRFTzFJ?=
 =?utf-8?B?NXJaWjBKaWM5c0R0c0ErTE5mbjE4V1dIOEJCVTVUbThySUI1YmdsM0JhRnRZ?=
 =?utf-8?B?ZmpLNkxaU2F5SC9aallPNlp1VnNTSWx1bC9HYnNvVFU1SFdkU0NwVjlUcUhQ?=
 =?utf-8?B?UnZNdmR1OStLS1dmM256bEp0K0tWVSt1dmVZRmtscUZ0MmdpNDdNeVk2SFk4?=
 =?utf-8?B?R3YwZzNrQ3BpT2lUZTM3S2R2eHpLOUloUzg1bUtHY0xPNXZxNXBhblFkYWRY?=
 =?utf-8?B?RDlZdDVVbVlycTRUMTZhclQ2TW5TTnExRjZvMTU1Ymh6cG1nVUtBRmkySmoz?=
 =?utf-8?B?QzR5RG5OajFQS1JpMGh4RXJ5OTh3MHVCNmthZm16Nk9jazJwcndYVG9ONWVp?=
 =?utf-8?B?V1NYeFJrWkQxc0Y2MkVpek1oN1ZDVitjMUloZUtGelJaNSttdURZcC9nKzZT?=
 =?utf-8?B?NVByWlhYRExIUm00bDJaeVJDV2VYR0htL2tmWUZ2eW5jVC9mNTJIby90ZSts?=
 =?utf-8?B?bnV6b2RYbFF1K05iZGdISFZHaHQyVEFNT21IK0JkM0doWldDczJqNTkxQURu?=
 =?utf-8?B?YTd3blZCTWE3VHIrOS9nVytlQ2I3N1JvNG9nbm1YUjJ3U1orOE5QOTVySE1P?=
 =?utf-8?B?czI0dW0wVk9KbVpWU2sxZUVOZ2dGMkVzYjFRWUI2U3RoSngyUTRDSW53V3d1?=
 =?utf-8?B?NEk1K1VWQVJCejEwd1RveEl3WHNJTi9FU1lKR2RZMEp2TWtqeGpOOUtEM25N?=
 =?utf-8?B?RWtZUHg3TXhCWXY4QWZIbFljRlVtcEY4Ym85ZmFHUW1GaFYrdHhOc0YyNTNF?=
 =?utf-8?B?TTRycXRLdXJqaWdUdEdXUEJWOGVYM3ZCRUxBVmZrMExoTHJIRHJTdG5XU2Nx?=
 =?utf-8?B?eEg3bUhSK2hzRTBBVVRXbFUyT0JMZFQxejNTdklBVE9HZTB0a2t5TCtZR2di?=
 =?utf-8?B?Wk9nTHZhMStNRnZJRlRaTUdNUzNuV3FIVk1yWDhmVVFSa2grNGJ0QXRuNzRh?=
 =?utf-8?B?YnhWY3NqWm5YcHRzQnpOMHduRjhJNVJTb29JNThLWVdBTlhKbXh4b1BJSjhE?=
 =?utf-8?B?VGc2V3hscVhkWTdSQXpsbHJ3cnN3am9ObjJUY1hNNURxY1ZxbUd0Rm5Pcmtl?=
 =?utf-8?B?NTRxbTZBa3liVXBlbldBY0phT2ZXUFNQMjBrcHpQcW1qTjE1MzQ4WVN2WnR4?=
 =?utf-8?B?MGJrZ3ROdFliM0ZxcjF2dW8xc1lTUkVwUVlHSysvVEVVV0FVQjJ3bWVGMktP?=
 =?utf-8?B?elUxcVN6ZjdqRVFtdkZMTzllS3dkMGYvRUlwZi91dm1wRURDQ3VWeGNmVzQv?=
 =?utf-8?B?Vitzd1R3ZHpEdnlNTUE2WXRUbUgveS8wQnlYTXg3dzdwR0xhNGIrTXhVTjU3?=
 =?utf-8?B?MFJyNGY5SWtpUVNtMDRSWnBLbU11N0J0ZFNOYXk1SUpmVmV2dW9qT1gxYS9I?=
 =?utf-8?B?TTZKc1oyWi9iZ2p3aHdlaVdjaU9WNXBXK1hiVEUrUDljVjJHOHNIKy9QWCtH?=
 =?utf-8?B?L2xEeFFwTTE3cHU2YW5TQXc2U0pHR21kUVB2dTNmWWtJeW5ud21OUHZkenVZ?=
 =?utf-8?B?WmVSRUpmQ1RLdVpVSUpaa3BNdVlGVDh2SGlVVTlwSzhtcFN2QzJDUUpmcWM0?=
 =?utf-8?B?VDZ0NEtLa1pTU2RWalJhUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUM4OGpQbXJ2NjRoNGdrRDIzU3ZMYUZWdVR0UjYvWWN5dnlyRkhCUkNmRlpC?=
 =?utf-8?B?ZktobjVRZzdJbzFFeUV5VGI5c2hJR3JwNTdsR3YzZ2pYS21GTzE2emxJTUxW?=
 =?utf-8?B?ZTg4SGwrY2ZVeDVJczBFQ2tUTTdaNlhjZ2JuajFJbG8veDQ5MlN4TFhTRW05?=
 =?utf-8?B?emtlY1BZN1JDSkxBUS9PWkIvQkdyQTNrVWlIODVvN3VYdTU4RWNWbVZva3lW?=
 =?utf-8?B?ZHVlbFh5Szg2UElieHZ2Z2ZrRFUzTFBNdXpKcnhMKy9sNzJDN0NuSm1uZWZX?=
 =?utf-8?B?cmUvVU5HZjJVTnhCak5TUkY4a0ZqcmZrdVA1ZldmS1ZYWVZNMXV6d1lvVVcy?=
 =?utf-8?B?RDhmU1p2OGxRMEliWDlDbVA5Qk9XVGNKbE9CVmpNRjNTVFlHMlJxeEd0dzdI?=
 =?utf-8?B?dUQ5VnF4NEJTZHlSSzhXQjlBZzNUblNJL0Z2WiszbE1JQUpkSm9SUkVHb0xa?=
 =?utf-8?B?UCtrY2ZmK2VUWjZCcHNrdlJ6MjIzWVJhZVRxWkZPVm5rN2UwODRpY1VCZGZD?=
 =?utf-8?B?SjR4VE90RFh5UmdSNkwybktjczZ6eDVucFo2ZExjcis2VWU0Vkova0Q4YUNP?=
 =?utf-8?B?M3lvSHY2M3BJTHBYWGt6b1hSQ1p1VTV2RGc5cGNJTjAzOTE1Y0hocTNCQ295?=
 =?utf-8?B?L0hBbE9ubldvUnMzNXdFSFZOdGJ3L3dMbjFBRk1kYXRvOWZDRjVIUG1kdWZl?=
 =?utf-8?B?cFVjeVNra3hxKy94dHNwb05HcEdZaU1BcU9TNTBmREg0MndLQlVFclAvMWRu?=
 =?utf-8?B?WHFOQVJxd1lZOUMvT1BRWUZJQ2w4L1luUDRwdDlxQzlKYmZMeWZsMTRhaWJh?=
 =?utf-8?B?NUw2V0xFUjgycyt6YThSYUVkL2huLzJQYkFlaitwUm9ncGp2SXJsN3ZhZEhP?=
 =?utf-8?B?VUI5Mm5NZWNqTEcxTk1YSExOT29BR0JjUTN0bGZKODB5R2dYNkJ0Q3ZicjZO?=
 =?utf-8?B?K1pZb3cxWktzTVllNWpyajdTMHBZUEVvR2xhNkFxN003bGRnbm5BU1JIVEhn?=
 =?utf-8?B?eXFGSVdQZTBEN0dsS2YxWjFYSHlYVHNaYXJDZkFUc1ExR1I0QlU0bWJaZit0?=
 =?utf-8?B?ZnNobjlJam85clBubmFQNTAxR0krUkM4aU1DQzhodm1WRG91NUJUaFc1aFZi?=
 =?utf-8?B?bG9Sckx3RVJXbElKYWgvZGhERjBpazBhVDN0eUNNU0NBQXBtem9BSFo5ZFRX?=
 =?utf-8?B?UEhyMjBiYUF6aE5TQy9sWHpxK1lKUFdaamNGV0xldEM3Z3o4QldUQnI4elda?=
 =?utf-8?B?U29YNGoyMVQ4RUxRMC9UbXVtek10ZlVEWitTbG1OdTdsbE9mb1liRyt5ZnhZ?=
 =?utf-8?B?K1Q2VkFHSG0xZDFIdjJ5VUFhWnZRZnNwUlVXb1FETndaMFB2V1dyM0dhTTFs?=
 =?utf-8?B?aDA5eDJkdjlBSzdjQ3R6c2hMUW5nUW50SjA1R25UYkxRZmNnWWFrRXovOWhQ?=
 =?utf-8?B?MlJXMEFNU1h1K05NbjV3bEFRbWNCVWNsblpHcVhETXFLRVJOR0VvWlh5RndF?=
 =?utf-8?B?UmhKdG8zQmFKTkFQSVpueFQ1WjlLLzBMTWVyMjB4dVVHMVdQRVd2bHdwMkZO?=
 =?utf-8?B?c0pnUFlRaGdIeE03MlFxQ3BnMURPUThhS1laaUJKbTVtUlhzN0dBVFkrVlg0?=
 =?utf-8?B?MndmQ0xncE5QTmFoVkNNNVVtRzgrd0I5cmpoSjJVUHNxQW1HLy9zTWdMdXA3?=
 =?utf-8?B?elFtLzVuZUJTVXJLUXFobGplcGdXUWZ4TnNzUkdQdHlzQm5kVE5GVDQ2Y3hG?=
 =?utf-8?B?elM4cnpGYjVxdVNpaFJ6Mjlod0l5ZGNqalp3MDkrZWtNM05xMnlxcHljaTYw?=
 =?utf-8?B?L2lPR25XWUNVanMxdytvVFczSVhaZVlQSHIyQ0dpbllSRXd1M25vMjgyd05H?=
 =?utf-8?B?ZldmQjlSWXJNSjcrTDBHN2RPZXQ5NnVoZStheHRaeVNmTlcvM0NIVzNFems3?=
 =?utf-8?B?NkRDTDlhNzR0ZDVnMy9xNWwzWUlxN2gwMENjMThXMVM3SGRsdVg4M2szTzhM?=
 =?utf-8?B?R3BKMjlWbjFrMzY0VnFyNHUxQ01YVnhPREUxZVBmOWE4YkR0VHNhQU9TeUhv?=
 =?utf-8?B?TWl2Q0s5UE5WY1VMU3JxaUxsOHd3ZWdIQ2szV0loZUZOQlpDR0FEUTN3WEZo?=
 =?utf-8?Q?OcYyJ+Go6rAX07f7mWgviHOqN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8870b277-560b-4792-c803-08dcb2e1a676
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 10:55:41.3498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZniGd+7RzhEp/Zf6/FpNcKKE4RYWFQHmMeIEMxtw8aWYF84679oekgndJ4mIjcuNlLDLMoqUcxgyK4hjSYmjgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398



On 8/2/2024 4:18 PM, Jiri Kosina wrote:
> On Tue, 23 Jul 2024, Olivier Sobrie wrote:
>
>> HID driver callbacks aren't called anymore once hid_destroy_device() has
>> been called. Hence, hid driver_data should be freed only after the
>> hid_destroy_device() function returned as driver_data is used in several
>> callbacks.
>>
>> I observed a crash with kernel 6.10.0 on my T14s Gen 3, after enabling
>> KASAN to debug memory allocation, I got this output:
> [ ... snip ... ]
>> KASAN reports a use-after-free of hid->driver_data in function
>> amd_sfh_get_report(). The backtrace indicates that the function is called
>> by amdtp_hid_request() which is one of the callbacks of hid device.
>> The current make sure that driver_data is freed only once
>> hid_destroy_device() returned.
>>
>> Note that I observed the crash both on v6.9.9 and v6.10.0. The
>> code seems to be as it was from the early days of the driver.
>>
>> Signed-off-by: Olivier Sobrie <olivier@sobrie.be>
>> ---
>>  drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
>> index 705b52337068..81f3024b7b1b 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
>> @@ -171,11 +171,13 @@ int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data)
>>  void amdtp_hid_remove(struct amdtp_cl_data *cli_data)
>>  {
>>  	int i;
>> +	struct amdtp_hid_data *hid_data;
>>  
>>  	for (i = 0; i < cli_data->num_hid_devices; ++i) {
>>  		if (cli_data->hid_sensor_hubs[i]) {
>> -			kfree(cli_data->hid_sensor_hubs[i]->driver_data);
>> +			hid_data = cli_data->hid_sensor_hubs[i]->driver_data;
>>  			hid_destroy_device(cli_data->hid_sensor_hubs[i]);
>> +			kfree(hid_data);
>>  			cli_data->hid_sensor_hubs[i] = NULL;
>>  		}

Looks good to me.

Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Thanks,
--
Basavaraj

> This seems reasonable. Basavaraj, can you please provide your Ack for 
> this? Thanks,
>


