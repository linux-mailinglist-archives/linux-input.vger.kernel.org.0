Return-Path: <linux-input+bounces-8518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D88939EEE59
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 16:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D10285B09
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A59021E0AA;
	Thu, 12 Dec 2024 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pwx9P/r+"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1723B10F2;
	Thu, 12 Dec 2024 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018931; cv=fail; b=YQwqRZaCi7YOjJdy65W85wtjRGCbMAZpuDksJgs2nCBsLjUuI3Bw2qrYVdLi/JAcuDde/7bPsprT/XeBAfZ3/1PTgj+YOk3/jVCbyw5vz6ef/54oT0itRd8g5XB4m0mjKsm4lYnLI3hyXE8fl5UGGc28vibGqFha906MdW20Y4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018931; c=relaxed/simple;
	bh=NgU9xS/VeirodN1iANhYSf9F3vg+bEiTUDxakjOMUYc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aMr/NwuxFD5/5s67GVQyshHIC+z/iNvkDRdr8MCG4IAylft55uHA/RZTuk+mAlUBtLB3lacGlm2x4w2QCxvQZOEUq9fn7b8x0T9e/UBkMc/mVhqps6EUeycy3ruQW4jKG8by9OZUeEyk1su2WKjANVtxskH8IeOz1/xGomM0RUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Pwx9P/r+; arc=fail smtp.client-ip=40.107.212.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIIRp6DlUrheGVHq70JloNlsev/lWLlCO4HE1t8QUAx80LMo+4FdSRRnX76feYApqXHf8BGFsnNyGFlFNdIMyNpV9rUAFr0p+XRyTHjMsSKZQrixOLeMvUiMPrLDzSxokOm8B/RPUu4EADB3mRaFPpEgkHjtpPkWSArw7JSlEmS810h0+JDDA2YuTqRPaO1rRqrOdCBYwz3Ua6SanlpTaMOv42XJUwJR53gduCoay/Se7E3RQxo+PQO21j3zW1fmEFlzi4L6BiFyxNWoC7a+lj88V+sNP+oyiYA5FMI//qv1YfogPX7GiJ5/1Hf1ZgL2V7IDZ6FgtygHJBWhU48z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQMuszy2UrGjUvFvwKQKPhCg6KVqNjNpLyBAsHE5um8=;
 b=moY9HRF116WDcIYCeihlZEQ85NomRF9/Y2FkYNP2zjHCQJO1LEBKcIpqeAoVMTsqCJfmwxo50xPhZI6eVjoeyLIld5Iz6ANbZf8kcu9mQpvISlhKdfErLx1t7It97DDOx3lrLfYm7WsMV55HOvCQqUPMS2C2hHtC8Ez87mcdLKkdHsg6RaXfrJSC7YAgBwE4E49yC9fYNzwWzmGu0PxuLgI3mpW0HanxJ1ZjP1UG4Z6QmwINZtYLQUoeJojur8EzXgV95xfoPDYQ7wDKI/OmxioBwSju4kB0PkxiddfH8Ja6BC+oRMGN++2nrL/ofuZCEnccMmajsj4uRBqm3O9pVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQMuszy2UrGjUvFvwKQKPhCg6KVqNjNpLyBAsHE5um8=;
 b=Pwx9P/r+aF2OnHGkvDg9xLvYR5zq3LS9GU4y+8uWMargzvV5gff038t0afYIwP3n9hnBA50fdSuxT9cgf39G1tZcJsZOgm0L1MPJU5dcexwb47x29ZGKR4z6ef7F3cSnPwYt9WfSbeNU5jlPcac7vVKGtnZIH9K8JsfXJ94yXw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH8PR12MB7253.namprd12.prod.outlook.com (2603:10b6:510:226::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 12 Dec
 2024 15:55:24 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 15:55:23 +0000
Message-ID: <a16764a3-744b-4a55-86af-777de02ff999@amd.com>
Date: Thu, 12 Dec 2024 21:25:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] HID: amd_sfh: Add support to export device operating
 states
To: Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>,
 Patil Rajesh Reddy <patreddy@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
 <20241212151951.1922544-2-Shyam-sundar.S-k@amd.com>
 <1b3dacc1-37bd-49cc-addc-628e843a5af8@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <1b3dacc1-37bd-49cc-addc-628e843a5af8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::25) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH8PR12MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 6228ff06-ca79-4b0a-e22f-08dd1ac56355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2dBaHdNa2FwQUFTL3VtSm1MMUN5dFloajBYNWUzTmxhb1l4WlhidTlMTDA1?=
 =?utf-8?B?cW56Q252UW5HUGpnTEl2M29qWjdhYW1CbEJNTk42Q1YxaDFyZk9NZWowYThD?=
 =?utf-8?B?bEphV3pCNVgwT1YybUJnYVE3U0FWcXZHcmZUMmVaUFFiL29yb05OWDhsTGQv?=
 =?utf-8?B?SWtsMjB4VXFsaXBnNVY2cGREUTczVGZGSE1NZVpxNWw3MDJKbUR1OVhFRHAv?=
 =?utf-8?B?OGdhYmZWWnNFYUJkS0lZMGw1a3BCMzk1cnc1bXRIOFZCVzNkV2VqUTBSSTFI?=
 =?utf-8?B?a2I2OXEwSEpxay9CYit6RXI2VDVPb2U1L3VTYW54RE1SNHdDYVFoUCtMbFBt?=
 =?utf-8?B?TFFFdzFjUWVCRjdndVkwOUpkL1FpelNqTEZxcUVFbmVIRFYybnV0MVU3MUh4?=
 =?utf-8?B?T0lnM0QreFVnMnN6ZGVwcGxEd1BoMlJPN1BzNFV2em5YdE82OVMxZ3lxNGlr?=
 =?utf-8?B?WWZGRTUvRkxMM3gyUmUyQ2hPL3dHT3k5TE9FbWEzd2NPN2RtclBJQlpsUktp?=
 =?utf-8?B?SS9FSXJDZWR4SFRTOFJ5NStqazdpS3dPdGZmNkdHZCs3MmFpcjkxQy9CSDh1?=
 =?utf-8?B?L0VIakdOdlo0ZjgvNzdmeWQwczNZbHhpV0lTR1UyU2F5ZDdKY28zazhTZnpu?=
 =?utf-8?B?NUpwV1BUMmdacWhGRjY0RTZ0dERsWFR1MEJBWktTNFo1U29iK1RoaXdhTWlq?=
 =?utf-8?B?Tks2a3AySnhES1JTSGYrWTNCaldCZ1dCTnBPZmJEVDhBRVdKMDVNQlhGNVhy?=
 =?utf-8?B?Y2N3ZE1zN3Ryb0drelE1UWNZMzhsWkJLMHlXMlJpSDV6VHE5cVpSSTJVT0ZV?=
 =?utf-8?B?RWFOVkRWTUwyN2RlM2pHK0JkcjJ3UjU3YXVrSVR2UlBqTzd3MTZUZ3FyV3Jv?=
 =?utf-8?B?eC9PdnFYSUFHd2tiMDJldncvK2U0QmRCZlgrSTA0clN0bEVkNjBKUDlvTVdC?=
 =?utf-8?B?SnJyajBoUm9tYjlMV29UZVhmcnVUdi8xNVJ4ajFDbm9seFJURkV5RHBVRlVV?=
 =?utf-8?B?V0MzS0cvSGkwY2N0NDJyamtoc0VXTmh1Rnd0Vi91c2FOS0J0OXMrVmtVUW9K?=
 =?utf-8?B?aUhRbXJsZlZUOHlMTHF0Q1lLdE4vNDhWZi9FSklhbEtxR2orTElSWmxqSmJK?=
 =?utf-8?B?bi85WjZEL3d1MWdNMEZHblU2YWxnd1BLM2ZnaWhjTC9wTjZjcVZqdlVHR3Zx?=
 =?utf-8?B?UHE0cjdObVVnZWV5UVZqZ3VxMUx4UWxKQnpQek1EWmRTSmlFNldSM3FSTmx1?=
 =?utf-8?B?ZUJ4K28zN0U2NmpLb0x4T0RQM2VjcFVPejZiRk15R3puSEZZampWbk85MnlU?=
 =?utf-8?B?Nm5hQmVIYlIyWWxRdFpLdW9xWWFaazRERDliK21VcGl6RVpOSGExZU1INnh4?=
 =?utf-8?B?U1VwRUFWK05zVlFIdmpXaGZrOGN5T2VIRnFmVlk4Qm9nWkdOeWF6eEw2ajQ0?=
 =?utf-8?B?NmRmRkNWMUlMNGsxakVHWW16LzJJcjBteEpwVE9uTkhlV3RDZEFTWGQ3VGx6?=
 =?utf-8?B?VjFFYXdWeDE3Tnl3OHpXT0trNXNiY0tycDVXUmFzR1IvcDg0S1hXM2xQOW1k?=
 =?utf-8?B?S2FOTU9PYWZIUTVVRDdnQ0xsVkRRVVRQK3dQdklLOTQwNjdCQmNzQ21POHpy?=
 =?utf-8?B?Q3ZFQUxVbVFRb1hHdXFndkIvVVd5ZUVMRWtjZGYyd1VpL1BMWmNIWldIcXhm?=
 =?utf-8?B?VnZsZ0JXMG5TU1RYZlJtY1pCSkpCcEtDU0xrTVNJSHd6RWJNRG5udXU2VVBK?=
 =?utf-8?B?L2pFNG1NRVdVME95MkV3b2w5T0RCTVB1VXMrRzlmLzJLM29xYVZTVVM4UEJu?=
 =?utf-8?B?NnBjSzN5SE41enkyeWVtdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1lVOG9FZndMa0FCOVMzVUJZNjlia29TdDlGMWNicFhoT0lRVWdDVjhpZkJJ?=
 =?utf-8?B?M2JZMkxEaEk1aVlEM1hCODdzeTdVcUJ6dE1yNmU2MXMrKzN2cGNlRkZpd1lY?=
 =?utf-8?B?YnpCSG1oTDhtYkZBdHZ6SHByN1pyc2dzZXM1dy9xMGhiaHpULys2cC8zQlQr?=
 =?utf-8?B?N2NVd21oRFQ2TG5ZQ09lZll5dy9CTmdhWE41d2U4NUk0ZWZMeE9OQUZNdlIx?=
 =?utf-8?B?U0ZBODFyOFFEZHMzS1JOUDNoYXZCZTEvNFJYVkRsb2NMUFhQSUUyMkNLWThq?=
 =?utf-8?B?KzIzd2ZIQkU4Z0dwRWFEbEhkREhNeEtITUg2cnQzelhtNkY5YzBib2N6eGtz?=
 =?utf-8?B?b2ZwelAzMGJnYlA0dUVDcUljNVJJeVRaZlZBOWhuc1ZqQmFiU214c2Q4SXhR?=
 =?utf-8?B?YWMreUoxRVdkM0w0SVRuRWViZSs1dEs5c0JsNlpoKysvRXFUdE01S1hIUFAw?=
 =?utf-8?B?cGRXd1l3dzZtNjJIMmlROFkvU1NQcXhITnY0YWJHVjNLVjA0SUVMTklWdEY0?=
 =?utf-8?B?TDdDTnlLUTZlZWVwTmZTVjJLNFgwVTd4cmFxdmFoUGg4REJPK0FRYm5WenVG?=
 =?utf-8?B?ZnYvU0R6U25WM29sb3hERFpzU2NKbHNIMFAzaFo3ZVI2ZnpjSDN6MVdZWVFN?=
 =?utf-8?B?VFBQTE1FVHVSMkhnbTVSV2hzbUJmOHJQYlp0Y2pLcVB2TkZnWUxLb1I5TjhX?=
 =?utf-8?B?bERsYStmSkVLbU9UMDhaNXEzd0NTTXpnZ29RKzNZQjBFcXRSTFdwMS94UTdy?=
 =?utf-8?B?dEhoMzRwVExZN0RMK2FyWVEwbFdESTZDNkx6UzJBdzF3SzNXZ0l4dFZOUGVO?=
 =?utf-8?B?Ynl6YnlNMytsOFltQTlTd3JCWXZJa0w0VU5wZENweThTVW8rblFlak1obkhJ?=
 =?utf-8?B?SHBJZmNwMCthMEFZYUg5eTRXQndqT2Q4SU1aVUpLY1FveWVSVXJrOEhEZ1VH?=
 =?utf-8?B?RXhkZkRaY2U4MWdBVFlHY2M4UHZRZjdEbWlBaEZYa0h0VC9hOUdrVXB3M04r?=
 =?utf-8?B?WlFrMkFlZ1pBTUZwU0dWbWZiVms0djBIbVBTRmVZa09QVnhHRUF5QWRoMWdG?=
 =?utf-8?B?VVlMblkzWHlNYkxFNjMxNlEvM3RjbHk2STZjZkZ5N2dzYjlEc2xvTnVLaThQ?=
 =?utf-8?B?WkJmMUtoMHpkRnFydlpkalV6R2FaakpTbS90OXAwM1REeFBrZVgyd1VlQ3NU?=
 =?utf-8?B?VXcrUVhRNEtMbHZ2OXZoQ29UdVBwcHVJUW9LV1ovcTJrNm03MFdMWE0wWlBw?=
 =?utf-8?B?OUE3WFhZNjhGMUhzOGtTRGZ1MUU3VGR4dVc1UHJxQjdpRlY5VTVBZzVsT3BB?=
 =?utf-8?B?ZXZLM0tVTGtaOW81eDZuYlVkTmhUa1ZEVWN4MG1iYXpoaXNQQTJ2N2hjUVY3?=
 =?utf-8?B?MzJpbjdmbHYvNjZYSm91NkdoQmpCRnBNaUlaczFVdWhWbks1TEtmT2ZvSFNw?=
 =?utf-8?B?TEFGTFA4aTJjTTZjUFR3ck1tUlMvZldDUjFIb1R4Qi84TnNTaERUY3lLRmxj?=
 =?utf-8?B?SG92VThBQnhQVkdzL3lkYjlBTkZIeFcrN2sySFBzanhTUWZiYnA2eTA1NEo0?=
 =?utf-8?B?WElhVjJkWjlob2UzQjBsMFVtb3MrUjlWNkZHKzNSRzEwR2w5QjRpRTZub3FV?=
 =?utf-8?B?clhIRWEvN3J3d2NLK3JEL3FaKzFZdzBsamtPbEhzUFlZamtpclpUZVdVSldq?=
 =?utf-8?B?VjZFWnBJZVkyWTJyeWpYU1FOb1VIT0RJZVYxNUdjaURKZGNwd3NXY3hzMGk1?=
 =?utf-8?B?Sk9MWE8wd3kyK2N2b1JnS3hNYldhUDA0MkdIU0dhTXJ5UWZiN0EvQkZ2cHRw?=
 =?utf-8?B?ak5WQ2J1VHRybDVSSU43T1NpTWFZYlNPMGFSVVB6N1J6M3BmSmhDRUNYdWYv?=
 =?utf-8?B?UUJ3aDdlMlF5Y2JjTVlTZUJlcitpR0lKUFZtbThRb2UxYUtDQjgweXlJVUxP?=
 =?utf-8?B?WlBZSEhNOStrYWdTSVRFMjZhaGl2WSsxUEhNYkZSU2NFUWFQVFI1b3pnTy9z?=
 =?utf-8?B?d0tyOWxQRGU4N0tFbkExZjQzUnU2d282TXJxMW9MdnkyMWZ2RDJPQ1pnWTht?=
 =?utf-8?B?U3lmYmtDbWdDdy9NakxCZDJNM3JydlBqVDhrb0dyNmw3RExKVXhzVmNWUGl1?=
 =?utf-8?Q?t0eRLoMpHUYZfXUqXTvMbhROI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6228ff06-ca79-4b0a-e22f-08dd1ac56355
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:55:23.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taMLw1VCmrkx8TSVv2GgVQRwYmFkFYTs0rC3JmBmE5cE1Y9fGDnuMDtSZK1hOVm4WdubOhFrff8tQWEUmK0U7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7253



On 12/12/2024 21:16, Mario Limonciello wrote:
> On 12/12/2024 09:19, Shyam Sundar S K wrote:
>> From: Basavaraj Natikar <basavaraj.natikar@amd.com>
>>
>> Add support to export device operating states, such as laptop
>> placement,
>> platform types and propagate this data to AMD PMF driver for use in
>> actions.
>>
>> To retrieve the device operating states data, SRA sensor support
>> need to
>> be enabled in AMD SFH driver. So add support to enable the SRA sensor.
>>
>> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>> Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
> 
> When you send someone else's patch but don't change it you are still
> supposed to add your "own" S-o-b.

ah! Thanks. I missed to add it.

> 
> I have two small nits below.
> 

Sure, but I have a question to Hans and Ilpo

while we address the remarks what should be approach for merging this
series? Should it go via pdx86 tree or hid because patch 2/2 is
dependent of 1/2.

Thanks,
Shyam
>> ---
>>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 22 ++++++++++++
>>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 35 +++++++++++++++
>> ++++
>>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 20 +++++++++++
>>   include/linux/amd-pmf-io.h                    | 15 ++++++++
>>   5 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/
>> amd-sfh-hid/amd_sfh_common.h
>> index e5620d7db569..799b8686a88a 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
>> @@ -43,6 +43,7 @@ struct amd_mp2_sensor_info {
>>   struct sfh_dev_status {
>>       bool is_hpd_present;
>>       bool is_als_present;
>> +    bool is_sra_present;
>>   };
>>     struct amd_mp2_dev {
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/
>> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> index db36d87d5634..03c028f1aab4 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
>> @@ -30,6 +30,7 @@ static int amd_sfh_get_sensor_num(struct
>> amd_mp2_dev *mp2, u8 *sensor_id)
>>           case ACCEL_IDX:
>>           case GYRO_IDX:
>>           case MAG_IDX:
>> +        case SRA_IDX:
>>           case ALS_IDX:
>>           case HPD_IDX:
>>               if (BIT(i) & slist->sl.sensors)
>> @@ -58,6 +59,8 @@ static const char *get_sensor_name(int idx)
>>           return "gyroscope";
>>       case MAG_IDX:
>>           return "magnetometer";
>> +    case SRA_IDX:
>> +        return "SRA";
>>       case ALS_IDX:
>>           return "ALS";
>>       case HPD_IDX:
>> @@ -130,6 +133,23 @@ static int amd_sfh1_1_hid_client_init(struct
>> amd_mp2_dev *privdata)
>>         for (i = 0; i < cl_data->num_hid_devices; i++) {
>>           cl_data->sensor_sts[i] = SENSOR_DISABLED;
>> +
>> +        if (cl_data->num_hid_devices == 1 && cl_data->sensor_idx[0]
>> == SRA_IDX)
>> +            break;
>> +
>> +        if (cl_data->sensor_idx[i] == SRA_IDX) {
>> +            info.sensor_idx = cl_data->sensor_idx[i];
>> +            writel(0, privdata->mmio + amd_get_p2c_val(privdata, 0));
>> +            mp2_ops->start(privdata, info);
>> +            status = amd_sfh_wait_for_response
>> +                (privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
>> +
>> +            cl_data->sensor_sts[i] = (status == 0) ?
>> SENSOR_ENABLED : SENSOR_DISABLED;
>> +            if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
>> +                privdata->dev_en.is_sra_present = true;
>> +            continue;
>> +        }
>> +
>>           cl_data->sensor_requested_cnt[i] = 0;
>>           cl_data->cur_hid_dev = i;
>>           cl_idx = cl_data->sensor_idx[i];
>> @@ -181,6 +201,8 @@ static int amd_sfh1_1_hid_client_init(struct
>> amd_mp2_dev *privdata)
>>       }
>>         for (i = 0; i < cl_data->num_hid_devices; i++) {
>> +        if (cl_data->sensor_idx[i] == SRA_IDX)
>> +            continue;
>>           cl_data->cur_hid_dev = i;
>>           if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>>               cl_data->is_any_sensor_enabled = true;
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/
>> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> index 4676f060da26..b4c0d96ab152 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>> @@ -87,6 +87,38 @@ void sfh_interface_init(struct amd_mp2_dev *mp2)
>>       emp2 = mp2;
>>   }
>>   +static int amd_sfh_mode_info(u32 *platform_type, u32
>> *laptop_placement)
>> +{
>> +    struct sfh_op_mode mode;
>> +
>> +    if (!platform_type || !laptop_placement)
>> +        return -EINVAL;
>> +
>> +    if (!emp2 || !emp2->dev_en.is_sra_present)
>> +        return -ENODEV;
>> +
>> +    mode.val = readl(emp2->mmio + amd_get_c2p_val(emp2, 3));
>> +
>> +    *platform_type = mode.op_mode.devicemode;
>> +
>> +    if (mode.op_mode.ontablestate == 1)
>> +        *laptop_placement = ON_TABLE;
>> +    else if (mode.op_mode.ontablestate == 2)
>> +        *laptop_placement = ON_LAP_MOTION;
>> +    else if (mode.op_mode.inbagstate == 1)
>> +        *laptop_placement = IN_BAG;
>> +    else if (mode.op_mode.outbagstate == 1)
>> +        *laptop_placement = OUT_OF_BAG;
>> +    else if (mode.op_mode.ontablestate == 0 ||
>> mode.op_mode.inbagstate == 0 ||
>> +         mode.op_mode.outbagstate == 0)
>> +        *laptop_placement = LP_UNKNOWN;
>> +    else if (mode.op_mode.ontablestate == 3 ||
>> mode.op_mode.inbagstate == 3 ||
>> +         mode.op_mode.outbagstate == 3)
>> +        *laptop_placement = LP_UNDEFINED;
> 
> What do you think of doing a pr_warn_once() when you end up with an
> undefined placement?  This could help point out that the driver needs
> to be changed for a newly created mode that the hardware detected.
> 
>> +
>> +    return 0;
>> +}
>> +
>>   static int amd_sfh_hpd_info(u8 *user_present)
>>   {
>>       struct hpd_status hpdstatus;
>> @@ -131,6 +163,9 @@ int amd_get_sfh_info(struct amd_sfh_info
>> *sfh_info, enum sfh_message_type op)
>>               return amd_sfh_hpd_info(&sfh_info->user_present);
>>           case MT_ALS:
>>               return amd_sfh_als_info(&sfh_info->ambient_light);
>> +        case MT_SRA:
>> +            return amd_sfh_mode_info(&sfh_info->platform_type,
>> +                         &sfh_info->laptop_placement);
>>           }
>>       }
>>       return -EINVAL;
>> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/
>> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
>> index 2c211d28764d..f7eb2539bccc 100644
>> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
>> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
>> @@ -22,6 +22,7 @@ enum sensor_index {
>>       ACCEL_IDX,
>>       GYRO_IDX,
>>       MAG_IDX,
>> +    SRA_IDX,
>>       ALS_IDX = 4,
>>       HPD_IDX = 5,
> 
> IIRC in C enums start at 0 right?  So ALS_IDX and HPD_IDX don't need
> explicit assingments anymore.
> 
>>       MAX_IDX = 15,
>> @@ -164,6 +165,25 @@ struct hpd_status {
>>       };
>>   };
>>   +struct sfh_op_mode {
>> +    union {
>> +        u32 val;
>> +        struct {
>> +            u32 mode        : 3;
>> +            u32 lidstatus        : 1;
>> +            u32 angle        : 10;
>> +            u32 inbagstatedbg    : 2;
>> +            u32 ontablestate    : 2;
>> +            u32 inbagstate        : 2;
>> +            u32 outbagstate        : 2;
>> +            u32 inbagmlcstate    : 1;
>> +            u32 powerstate        : 2;
>> +            u32 data        : 3;
>> +            u32 devicemode        : 4;
>> +        } op_mode;
>> +    };
>> +};
>> +
>>   void sfh_interface_init(struct amd_mp2_dev *mp2);
>>   void sfh_deinit_emp2(void);
>>   void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>> index b4f818205216..01f2b12c56a6 100644
>> --- a/include/linux/amd-pmf-io.h
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -18,10 +18,12 @@
>>    * enum sfh_message_type - Query the SFH message type
>>    * @MT_HPD: Message ID to know the Human presence info from MP2 FW
>>    * @MT_ALS: Message ID to know the Ambient light info from MP2 FW
>> + * @MT_SRA: Message ID to know the SRA data from MP2 FW
>>    */
>>   enum sfh_message_type {
>>       MT_HPD,
>>       MT_ALS,
>> +    MT_SRA,
>>   };
>>     /**
>> @@ -40,10 +42,23 @@ enum sfh_hpd_info {
>>    * struct amd_sfh_info - get HPD sensor info from MP2 FW
>>    * @ambient_light: Populates the ambient light information
>>    * @user_present: Populates the user presence information
>> + * @platform_type: Operating modes (clmashell, flat, tent, etc.)
>> + * @laptop_placement: Device states (ontable, onlap, outbag)
>>    */
>>   struct amd_sfh_info {
>>       u32 ambient_light;
>>       u8 user_present;
>> +    u32 platform_type;
>> +    u32 laptop_placement;
>> +};
>> +
>> +enum laptop_placement {
>> +    LP_UNKNOWN = 0,
>> +    ON_TABLE,
>> +    ON_LAP_MOTION,
>> +    IN_BAG,
>> +    OUT_OF_BAG,
>> +    LP_UNDEFINED,
>>   };
>>     int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum
>> sfh_message_type op);
> 


