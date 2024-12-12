Return-Path: <linux-input+bounces-8520-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC29EF1DB
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 17:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3B71799EC
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 16:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677612210C2;
	Thu, 12 Dec 2024 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HVXlOtwv"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5A216E3B;
	Thu, 12 Dec 2024 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020673; cv=fail; b=Q9ujMOJ6g/WPoePQHgkvRbJhRH/Hm9ihM7PyFsJaqmEwrVeHy1M36FJ55Pbml6/Jy8KsAxYNnv+jdV8/APPnzBtNYrf+nwPbDF6bwaumdmu+G3SFFsy9MN607M/UUUGZYEp3ExvkoXHKzejLTNqe4+rBySpFyocRJwIb+RY7wvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020673; c=relaxed/simple;
	bh=A6+IROIEh0w7ZMbffQ9G0heO/n3Yy9yus2Mz7tJAOYA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7x2Ab0iPi0iRyv0g3q7V0qWcbXnDAEx2d4gBz89r+8Lo05MHIubtYQO84WF7XE0ZRx3mM5PKB4edf/tpKeYtDP+K+BG75NnbP69YN54zgZuluJZzL4TlHkD5z4QW9OjYq3SKoDaeIc1+3a2lzWEc/FEo9hdhOIO5jTKnqAopuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HVXlOtwv; arc=fail smtp.client-ip=40.107.212.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjWeztUhO1Ba8X00zAfxELgdDHpl0Ey3q32qNlfM106NpDtunWEhi42ohVFYaWUFMN+2m4H2COpUPbbX9xa1yO2WS9YsjmJaypHYdpPvhNPFeEsv4M2OExZ9e7jqqIy9krj45BkXDqadh7PLqkqDOQlYPkomENtaNoayjJ9Iuh2aW/uXgNct03aSK0/82k25m0hu82W/zfErHdHAJeXsgrr1FkuyNtsN+iWYztB98ZiE8kG5d7y7pkC77G24zmgQiZrS84ohyO+WWCWWR4wwVxRRosfSK+FgyKqONT8CY9aCCQqGkI5/HYPAI6HxpPX50sCuF+gnBW6rjfZdEzoTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2ETmc7tJcU3De295fmSMJ9cPU7RZFfU3+NxiKh3wn4=;
 b=A059Lq8hRdJDbWg9NWUSvlYNn1yucjnQ1f3gENFR418W2c9Ldm2V4SczG869yl6cG9/X2VtRTgBS/W+13+SaBErXJSPbrlfuvZpcDD8wMsnhQsh/8Vz9lBcHgQzXEMnAj9q4dq0L/pavqqRcxnOBDNNS9K3/R9V5BW8eRJFZitlbMEp0q3Kdcf9A6OBboZgO6JBPketiFyDzBlciNY8BE9fg1ztiU+sdZeFewXDs2UpaWJhHiNDuOPbh2VvFMFMXFsUsAiExWPR8AzSaNug/T8tbtuR2uq/n1U3KKlyAB36fDkCtM6z2IUzCNff2p6ZVnOwHTSRzEO1Tn4Ou0QezhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2ETmc7tJcU3De295fmSMJ9cPU7RZFfU3+NxiKh3wn4=;
 b=HVXlOtwv7soO76edDHWxJzeCbT+4EcC4ieqsVEqENFgd11Oc9jqA9NZN85lJEPlZBwx8cmysWFnqAVwlSoHDKpntVvtNbehUy44qP/jtL1dIm3pxtRsYZRuVEagoK0wA2bq6fHiDYeb0sN9GVZ3E40pO45ApeljozPqHuJ54tz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 12 Dec
 2024 16:24:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 16:24:28 +0000
Message-ID: <ef7845f3-8515-46df-b8aa-a6c9486206d7@amd.com>
Date: Thu, 12 Dec 2024 10:22:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] HID: amd_sfh: Add support to export device operating
 states
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>,
 Patil Rajesh Reddy <patreddy@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
 <20241212151951.1922544-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241212151951.1922544-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d999d0-2b22-497e-e7b8-08dd1ac97352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0pGL1JlV0xNVWM0R1V6OWZ4UWFTTGFuMXp6VkVDc09yTEFTeVQyNXhTdGJS?=
 =?utf-8?B?SU05enNEQnRYQUpCRXplMHJKcTNXQ21MUCtZR2xMMm1aU2RDMzYvT2RuaW84?=
 =?utf-8?B?emFiL0ZRWFVFeW1QK203RDBTWGRFa1J0WWpFTVcvM0lmWGQvVEhDcTRTdXFW?=
 =?utf-8?B?dnFWMkZxQkRZNWdlYlIrMlUwZVpRVTJVbERBNFpMQ3ZjdFJuUnJBUmVHK1BU?=
 =?utf-8?B?aFRoV2x1c1VzVUJmRzdrWGFZLzVNdExLL1RCTEhUQ0ZuM0lncmhqeS9ObDgy?=
 =?utf-8?B?VDYvTU0rZXFiZVBiU2h4bUI3akFBNkdwbUVDRWRBTk41dFZCRVY2Z2dkVEYx?=
 =?utf-8?B?dmtXd3J1aWhqYkM4TzQ2VG1wc2lnblM1WjNCZjBHdnBBMmJ1VVIvam04SThZ?=
 =?utf-8?B?RW10OE9VN0dCeDBPOWZ1UXRIWUtxSWRiNElib01IcTJkOWFRbU5PRDZlU0E5?=
 =?utf-8?B?VzBiVE02V2NlTWpqcmJjOVNxanRrZEZpMmcvQlBTeWhMNHFvUXJVNzhEb2NX?=
 =?utf-8?B?ZHpHUUFNRzBQTFg3NUhkaW84V0Urak9OSUV0WXdMT2g4VzRJVDZPK1dZekl2?=
 =?utf-8?B?WGdxblBMRk0rU3A0T2JFYTNyN1ZhQUk1a3RDclZQYmJ4eCtCTGI0NXBLOW5C?=
 =?utf-8?B?dWdpK2J5cFRsUXFHbWt4UkgzMlFmSjlvZDVkOTIrYTJxMEw4VC8yYXdMNm0r?=
 =?utf-8?B?TDdNNTM5MzRkM05qQXE1dUFaUlNFTVp0eFVsYzRySTVHTmNmcmNiNDdieGlB?=
 =?utf-8?B?UE8vdmRMeHoyMUdRRFdHTlNBelBYdThRQzgrR2daMnRvMVpNbFhHMlpSZW84?=
 =?utf-8?B?d3hlbUt3V3NsQ1I4NWVFRmhHSEdmRVl5c1RYL2NXQWpDeVRMdmFzTS9POFl0?=
 =?utf-8?B?YWdNOW1JVlVDUVQvYlJucDN5NHoxa0h4NlZoOXJ4cHErdDN2aEpmbnYwd3FU?=
 =?utf-8?B?WnlBZU5PL1BNM2ZmV2YzUHZDN0IzWjJpUmxKeHNqUnZtczdYV1Vxekw0OHY5?=
 =?utf-8?B?SXRsVEJEZjBZTFNDZDcyYzFmbGhpZXF3MDhNTHVtMXpMUGQvRy9hNTZRQTJr?=
 =?utf-8?B?c2o3Mm16VFdQUWFvWFVyQjBwb0dwRWFuVlN1SzFvcUtKUWJnemd5ditHRnNV?=
 =?utf-8?B?U1Jndnk3ckNDa0xRdmFGLyswY3FsZFRDZ1FUOHVwZ1dacVFlNzdaKzlSVjQw?=
 =?utf-8?B?Zkk2TGNDRnpiaWkyUVFPbkdtYytWT3I3VUhOSnJERU9GMWtIamtHbmVUZys5?=
 =?utf-8?B?cHFYd2s5T3JxQ0dvcWY5OGpHSGMremdNU2UxaVNRTXByY2Q0Z1V0dzRvd2VN?=
 =?utf-8?B?N1JxcVhsaE05dzhtOVMzQ3ZQVU5KWmhEbS9UbG9LVzdCYlRWWmtob0JaMkpa?=
 =?utf-8?B?bFRUcW82U2dUNXFXSVpoWnQwK0FIeTRxRUFMNU00ZWR2MjI5QnI2U0xpREwr?=
 =?utf-8?B?dWJjK2ptSWx2Wm1sMkZVMmFCRk9lTTUxcytUT3l0WGZpcnc1anBwZmV2UEFK?=
 =?utf-8?B?UWp5MmxablZDejlET3JTcnRzb1NrRkZvdmROYTI2ejNZZ3VvVEJVeVYvT2dR?=
 =?utf-8?B?T3hLd2dqMlkxL280VE9hUTNtRERLRW9nV1NSRStLekdvc3hRTER2NitBcnFo?=
 =?utf-8?B?aUhZa0JoaWFqK2J1eG5NWnJZVks2cE1JQlBkcnhCQ25pai9iVkpHa2I3bUl5?=
 =?utf-8?B?bTN0UW4rbTZsdlFON0Q1SHpzcnd2YnE4ODVWc2RZamFjMXQwQUNvYUhITjdz?=
 =?utf-8?B?bCs1cHljT1EvSWg4YWpZOUhXZ09LMkM2QXQzdDFtbEhQcC9KNFhHYWw5WnIv?=
 =?utf-8?B?NzdJVXRoa3dMd0xPdVFHZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak5RaUt3K3grRVRUbUVaOHYyQ3gyNEhVN3hrYjVYR3NMYzJ4d2lGbnhheFNL?=
 =?utf-8?B?aUd3REsvTlhzYnRKYTFDRHVoOXBpT05EckRqaUkvd01XdFZTak13bXJRSklP?=
 =?utf-8?B?blVXV0lBMEdHbWZwUUorZVorQmcwRzlDM3IxbDRGazI1QkREWU5qUXNNRXJ5?=
 =?utf-8?B?MlB3WlI2bldCUXFMKzJSMmFrbUtsa1F5aWhvdGJ0SUd1czl2eGpVUnZxdndJ?=
 =?utf-8?B?SjRtVUdMMXNVUzBVUldEMkRJTkwwdEtTeFcveFdvcm5qdldpQlR4ZUlPbzZk?=
 =?utf-8?B?VDdUbVNRZVBYYzZMUFNHQ1V5K3E0bmJyYUNvY1NzUnltOWJ2QlVJZ05mZUFM?=
 =?utf-8?B?MkxzMnJHNEd1c1gyQUQ3dmFjZ3QrVmMxRm5zUDlkMm5pYzBsY29IbXhCeURE?=
 =?utf-8?B?Y051WUkyWE1MSm55UlVnQ25IY29sZEFFbmQxR0tHUitBM0ptazJrTEVRMHZV?=
 =?utf-8?B?MERpRVFYWXpkVjdEZkc5THplUXNZVDVXMDV2R0I0YUJKd3NqeHN3R1h6TTFY?=
 =?utf-8?B?Njh4OUJKMUd4WVBJKzc4VTFKRjB6ZnFuWDIzdkJCblUwbGlVbnRXakhJYzda?=
 =?utf-8?B?a1M5c2o5QU5hdTM2UnVYU3FzQWxaTjZ4VWRXb1R6VWZlNW0xM2tIcGE4YVRo?=
 =?utf-8?B?NzlGYnIzWFU4Y3hQTWVqNjJTTnhQSm5Ua2ZCbUFpLytxdi9FN1JlRHRXd290?=
 =?utf-8?B?K0F1SXFTY1F1eXNWK05OY2drUXUvU3BWK3BpaGhBTEEyaFB1aUhVRDZXRkIz?=
 =?utf-8?B?UlFpSCt3Q0xwNkZiQ0RPd2V0QmZtTVFiQW10MTZRK1R4M2FVZnd0cWhQbW81?=
 =?utf-8?B?cTUvenNtY2pRVXZNMUxMSmV2RDBIdDhvdndRdlNMbktaMVZ4bnhSVCtKZTE4?=
 =?utf-8?B?R1B4dHNnY2Rtd0xYVytsYWFLUDJkenZySkpKQTkxeTRNL2dtYm5jUVI4QmFs?=
 =?utf-8?B?cWxKUTBuWlFzZGxqNzloNXFiMnZ0Z1M3MVI4NmdoRzF2aHFPcDdKWHdoNFQx?=
 =?utf-8?B?Zy9aWTJkUkVNTmE1MEVmZ0Jyc2ErWFA4TVk3WXorUHBacGtFbTh1eTFmQStB?=
 =?utf-8?B?M3hRZzdVK2hLd2FXYmtMSDFFVDdjUTI3VDJyUFREaXVVQW1FZkZaODdMWmtH?=
 =?utf-8?B?cFZ3N2JpMGJxWi9DbkM5Y3lvdDFvK08yWFo0eEFBZ2Nzb1RaTlpOZ2lLYkdG?=
 =?utf-8?B?M1ZWekVPR3lucktaZnMzeHhaTDBGQ1VvTmlzc2xXNVE5d2F0LzQyRXo1WWph?=
 =?utf-8?B?MXZTRTl3eHhXdDZVN0t4WlA2UkJqWlJxaEFtYVNPRGs1ck1qVlBtcldmT3FB?=
 =?utf-8?B?bjdQeVJ3MjN2TFd4OGdTbC96Z2IwQTNzWUM2MlBhbUw2M25zTlAwM01admZL?=
 =?utf-8?B?eUFRN1A0YVdTQkZtRnJ0ZC8wL2lybEZrUUdjZ1BzekZndkVrcERkSmxoU2NN?=
 =?utf-8?B?aXc4MFVqWnJmS0xEQkpOcEJVR1IxTEFCclBiYmh3cndjQ1M2empmNkpHRng0?=
 =?utf-8?B?Q2tCV0ZtYkkxZlRnZGRmVFpheWxOSjI1bndjcHFVaDlNd2ZEUVhmU202UkRj?=
 =?utf-8?B?T0wrV2VzdCtzRGt6WVUyVURKcHNCQjlrSEN2TnlSS1JiUnRydXFiWGVGNnEw?=
 =?utf-8?B?ZjRVb1N6WmZDbDN5eW9SSHM0UGdoK1hzVXpJdnNBcTJmQk1CeHpSY1plRExK?=
 =?utf-8?B?ODR1T1BKN3g1VTMwVnUzL2ttNm9vbHJDUnhwQmZhSVhQeXZFbkdJRFBpUkhB?=
 =?utf-8?B?d3lEMStPVHRXSWRHUklNWDZVQ3dudjJIbElKRHpIejA5c2pyM2Jkajh2aldE?=
 =?utf-8?B?QnkyUURmTjRTZGdQc3FUb25HNzZFeTZ3eFFwSk44elY5akxMN2lkNDNHNUJo?=
 =?utf-8?B?SGVUUWNEWktybVpDNkRxSXVRLzZtcnNaYjV4eUZOaEd6SG1lWEtDdktZOTFT?=
 =?utf-8?B?Rm9UeFJTNm03NTZuWU9mV3pZcjZRZStYcEcxWkFJQVUwUFVkQUhMQ2hJRmFy?=
 =?utf-8?B?eXNuS0xUVzlFWDFTanlnbzdrZ2NGZkRhQWppRE9aQjFweFlyU3IxUWtXQTJU?=
 =?utf-8?B?V2hGbFBPanRwMFlGZklVN09OYW1TSU5mQmZJOXdXaC9YMTJsUTIvaG1lZ1JI?=
 =?utf-8?Q?FS33oDhM/MTVUu5hAbXqzUZJR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d999d0-2b22-497e-e7b8-08dd1ac97352
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 16:24:28.3629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0n7B112lh7UD6W9rsqPll+KKvYHG8JquwhjV2sGiy74qqHdTG5CBuK8CHYox8L+GE3TJy37eLwaU7IL0AB12sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859

On 12/12/2024 09:19, Shyam Sundar S K wrote:
>   
>   /**
> @@ -40,10 +42,23 @@ enum sfh_hpd_info {
>    * struct amd_sfh_info - get HPD sensor info from MP2 FW
>    * @ambient_light: Populates the ambient light information
>    * @user_present: Populates the user presence information
> + * @platform_type: Operating modes (clmashell, flat, tent, etc.)

Sorry, one more issue.  You have a spelling error here "clmashell".



