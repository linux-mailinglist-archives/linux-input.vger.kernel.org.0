Return-Path: <linux-input+bounces-8611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBCB9F3830
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 18:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8328B188552A
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 17:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AB920896A;
	Mon, 16 Dec 2024 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OYCKs7pF"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BFC207A1D;
	Mon, 16 Dec 2024 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371861; cv=fail; b=o0ALwtSs+K3Bu64oBCNXAIrFCix1yhEE7taoljGbC2WmsQR/YXL+mT+5OFcM5y2zYbkZCDl4yALFMR81GpbmlGhJWZSxJj/PWr2uG3JFuMKgmFFGtwaueoTCM/vcO1CYqtAvU0uHr1rlQoh2jsCMw4u+abyRXK/U2vcIV0+4lkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371861; c=relaxed/simple;
	bh=3caC/tzhx1M2JX/op3IjJ5uvbu61isu93Y1J7WQGEqw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FUhm3NUOli7OQztrIM4kJ7IulAC0rgTui7Zz6V8F1DYNBnGKHCn2Fcoz4IVx+N2831BBrfQe0+qqASfJM8tf52PQlL16TN4G5wq8ri0SBhZNT03RJLoXrxAvSI6zABHYzzME0XwtTD2nxzBgWVnjjG6LFwSUlfgKDSsxf19P6so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OYCKs7pF; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOztmtu/NTZcwhMqa/46qtTu4KClMcNTophsq2WGzQUTQ4Y3UF5OdGsiR2liOcNxSn1kmOYPtdfubJBAbI3hB8TcwfQiDqXiDrfmJjOYSeJ4GWS0CP6JHfmolbaaquGWF8kz8l+dLHUK33xDQ/8gCfhj6mjqQcnbcv8rkGPpRZhyaArHNj7t170HwhON/n0xKVYviVto0HpO8wgZQBWG8EfTZWPWqeWwv1dnCS4usOR6VShHrEGG0t+6WA6FT1I+8XMRXVyAB/nBACT5m7kmtfalECquAnvu9IYymgnHnubeLwgJW1cg5I2G3L0udY5SnCC8QLDc38AVPuARoOO5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZgW30B5ViV6fSYgGdKBssY0wlc2AmEu142sANHuaw8=;
 b=IcIua5hekzS5cy5Qg+ZzL5CjypsXAzi4ZKPptPy95qTJHwuwIoXI4x9T56ctahOYNVTERsQalnIdy1N3XHMbTNA8+HuPMQ+Vwx7ZaGNt+0MPEormVnundXYgOLrut7cK7YvtPLR2Rh7WGA6TuHH5RDahbEeHk7IBTtReGLhHUBPuR6NalViyLrKcF86Yd1cd456om0ru8uVm5MJAhZgnDyvlOAUV0jTd/+Usq3YcBfxYTMoD1DkBifo5dHk1aQuTdsxeWG79nUBH1rG9MJXLo2krYIHE1jwDouH79xiflBLodw1ep/S2DSb87kVWhY6UO4qxVwJuNM+L/8yRc7vwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZgW30B5ViV6fSYgGdKBssY0wlc2AmEu142sANHuaw8=;
 b=OYCKs7pFToUIHuKnrVUviYCdSURwUqPqbZXfQxxOHmCUsql6i2EMAg06oMHO2BMuVpni54jfV+DcMkALivPhX8DMbHPdv+z40tm/ohsUWJIRUECQ/ZoOPkQUhxDlhEXDC7poLGhyRG/j+Lv3JI+jPdHivxS61G5UYQ1UCohuFYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA0PR12MB8838.namprd12.prod.outlook.com (2603:10b6:208:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 17:57:37 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 17:57:37 +0000
Message-ID: <5e06d015-cc3c-48b0-a9f7-1f8955ba33ef@amd.com>
Date: Mon, 16 Dec 2024 23:27:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Get SRA sensor data from AMD
 SFH driver
To: Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>,
 Patil Rajesh Reddy <patreddy@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
 <20241212151951.1922544-3-Shyam-sundar.S-k@amd.com>
 <ac9983d4-432b-4ad6-bd6c-f5f72aeb2493@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ac9983d4-432b-4ad6-bd6c-f5f72aeb2493@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA0PR12MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f5ba69-0dcb-48ca-4f89-08dd1dfb2032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmFNSjltOWhFMms4MkNBMWFBaHFUYjRvV0h5OE5qcmU3ZCtWTmxEOG1LT3My?=
 =?utf-8?B?cG5Gc0pvOXpKVjdUU2xiQTFEV1U0L3VON0M4RStJVllwemZ1aE5qRURWdUlI?=
 =?utf-8?B?b01XWnNka2E2akdkeUsxQU1SLytmWlU2ZFE2VVdYbWtVZFdYM3NJOXFXdFFN?=
 =?utf-8?B?VWlxWDVnY2hwNC9aKzBHWjJmUmFEbVJRNk42eUcwaDFRWEloU0ZCWHJTeHhl?=
 =?utf-8?B?aHcwdFVsUVRqMGFmOExaS3dKeUVnbEhDcURVK3FQWnZlY2psL1Yva3FOdkRE?=
 =?utf-8?B?aHZBa0dramhRQVUvZ1NWSTFRaGJhUUZVeFBtakVQbTFzZWZPeTJNZjdKU3Vq?=
 =?utf-8?B?ai8vVkNNUzdTbmZnbU1ZaDFmcHcrNkZRLzJpZjhQOTVFWlJkcDkvL0Y1QnVy?=
 =?utf-8?B?U1V5WFNNc3N3bC9YVDJPZnoxYzJmVW9kMGFMRFVNUFl2N3JqZWhxTzJjQ2wy?=
 =?utf-8?B?bm44bmtjbGhVaGFaOS9NaWxMMEl1RmJ4SGdNdHlJNXN5Q1lWOGVpQjBYYTlY?=
 =?utf-8?B?UDBZUlFXcWZtK2FtL2ludUNmWlpzWEZTTnhhMDlqcXMyaHVOZXNDQmtGazJS?=
 =?utf-8?B?ZTdnK1JnejVySENZUTl1QTN4cFJPNmh1bVRpejBudUJtYUVuMVdtWFQrdjJk?=
 =?utf-8?B?RGNoNlpTN1ZtaEF2MWJHSTVETnhLKzJ3Qlg1cml4TFRQbjBwSkNraDVUdlA1?=
 =?utf-8?B?M2tNVnhmOHp2emRrQVhwOVVPMkpLUms4OGtNN2I5Lzc5L0owM244TWE2TU1W?=
 =?utf-8?B?dDlvemZKeDFqbHBiTHdLL3NzVUpiU0VLWmFQRVBpKy9EL0RIOUJQNE5WSXln?=
 =?utf-8?B?M05ab2EveERJTFYvVjBSVlFSTXFnMitKVzN2WFpzNmpTWE1zWlNRQWVlWmJ0?=
 =?utf-8?B?SFl0OHJZNUxRZ1FWbUVsM2hrV1dNcGpXV0xlbjRwVUpUNlFlSFY2OGU4enht?=
 =?utf-8?B?VGd0YmZ1UVpNNkp6dHdYdGY5YWJTMDdrSmNGZmdabUxRSlA4RFcxUzBLWHpT?=
 =?utf-8?B?cnFxaTFmZE9uQ2hhNWJOVCtia2Q3QmZ4ZXhjeTFqWlQxRmE4aDBDamVPbUxk?=
 =?utf-8?B?ZXNYR2c5a05LZjNiLzdyMzlqVFhxckRjWDY3ZXB0aTZoZk9CL2l4ajRVMThp?=
 =?utf-8?B?SlFKWWpFSlJGWUFUbUlWNHhMWDY4RU5nb3E4c0dhdXI2UU02TmxlUlI5ci9y?=
 =?utf-8?B?Zks5TVdjcEJ2WUtmK2h5dktaVG43M2wrK0lxWEFpM3dlQVkxd3YzK3lrSkV0?=
 =?utf-8?B?V09QdDZxNytqTnp4NWpsbmxjSVJXQnlTbHkzTDJ2WlZpZFNxZk96WUI0SWFt?=
 =?utf-8?B?QnlWUWx0UnNWSHhndXgzTGV3YWJVRlpUOFhIVHAyRWlIa2dSSmNyYW5mUDRY?=
 =?utf-8?B?U015eWtFTWJITzlMWmYzVmhzU1pUV2hmTXZBT1YxK3dOMWF1R2d6MjgzbG4r?=
 =?utf-8?B?TFlQQVlJQTlMMVM4ZjhSMHpZQkNPYmhsQ00zdU55L2Juc1E3K3FIL1BqWVpQ?=
 =?utf-8?B?STk3RytLc1htUjRwbU9jL1ExamcrTFN3d0ZqYUFoSE1lZjUxZk1qMitZYWRO?=
 =?utf-8?B?L3VyWXRFNXBPcEFTVkNDYklVT1FOOFR2aTdQQ2ZnN2ZZZm1KRnhvTk9hcm1D?=
 =?utf-8?B?Z3pZSUdEUm1CTnNyODJNb25iZzgzc1d4VjZUdlArK0lVejVOQkp3VHNXcjF3?=
 =?utf-8?B?bXdMaGdrbkVsRllCem0wOC9zMnRpUXpHd3NJQWxXc1lEYWh6YmRNNHJqTDFk?=
 =?utf-8?B?ck5GZEFaMi9wR0dPTzhTMDNUOE1idTJOcitLbDBXZFRVTWdQTW5DT09zajJ4?=
 =?utf-8?B?NTNwZkdMWVh3alRudUYxbm1kbUY0SG9ZTXRrRlkya2pEZzJPa0J2MzdBbUZN?=
 =?utf-8?Q?4x311jWQFnvt2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVlESTRaakVXSTB1Qnl4NmVHblRIRWNxRVdPbXNpVFV0S1ZtVk42RzdpVW5O?=
 =?utf-8?B?WkE3cWlPOStRb0x2dzFlRkV1K21taVRROFdzd09NUnJIdTJoV1Q3TmorNURM?=
 =?utf-8?B?bnhqdDR3TXQxdWkwbi9OUndLbmN1dVlreVRyQWhiVks5ajFsVnBSRGdPRU84?=
 =?utf-8?B?OWVEMU5CNHNSOWlKVGovNWxrWkxPWE11M3BYMnQxYnVPK1lYaDRQUXhXcy9K?=
 =?utf-8?B?TTRlRVEwR2NnbCtpdGlpNzViY1lGa0ZiWUlNbTk2R0hFZUtJd2szMzUxUktU?=
 =?utf-8?B?K2hQdmptZGR4M1dKSVh6UUJUaWlXQ0h6d2FOK2QzYkRMd0RPSm40cGU0ZTVK?=
 =?utf-8?B?T3VDYm05TldvamxpVjZVQUt3all6ZmxZRWtmazR4YjZraDVFek03Z0ZTUWtu?=
 =?utf-8?B?cWlicktoTFh6NU1UbnQvYmV2M0Nxa2cxOTJoL2FGYjJjaUYyVlRXd0c0L1VD?=
 =?utf-8?B?QTF0cWNmUU1iQ2kwZGNsTnA2MWZISitHNzAzZ2xuOGorVHNWZ1VFdDVIL3lp?=
 =?utf-8?B?TlByMlJJVzFaUXF6bDZWNmJwRUUwbHg1Vk5xVk9MODVCN2Mzd05xVmxuS012?=
 =?utf-8?B?SDQxcUlZb2E4RWtNQmJZbzBOcEdhVEdiTG1TWFFhR3BDdlVZc1hneE1zdElR?=
 =?utf-8?B?QkRPNzhONCsrUElYSEgzRy9WODFiU3QzQjJLeFdmZHVETkZxRFFzcGpaQkVR?=
 =?utf-8?B?cmVFYW42MzhqSkhCd0tHdEVJdG5vTU82NW4yNFFxYm55MXJmdXEwdmZaRkxp?=
 =?utf-8?B?azlaM1VBQ1JCcmRqUEVHMlFVNXJGcHVIQU5FSjhPODI5SU4wUXJJditQN2N2?=
 =?utf-8?B?bkFXR1NmZ0NrMTNRZmtWZzhxSTFIeVhOWXVzYzFpSEIyOFNTWGlWejNOWmMx?=
 =?utf-8?B?Sk53TDEzUmhFVW1tb1p1cWJIdENIMjJ4SUwvMy9uZGV4RzhSY2pTaDg2NGlw?=
 =?utf-8?B?a0phWnExRE56U3MxMWZjQlB0VWt4b0tmTzVPMVVPdmo0bW5ZUDJsRnp1bU96?=
 =?utf-8?B?LzZBRnRDeWRjRGRlN1hUWW1IMzFKWW5tZU5yYnRralhGWU4wVkdoRTF2eERz?=
 =?utf-8?B?NElqTDIrZHQzemRYb1IrR2dYekw4Q0Njc2FLaCtGU2MzWVhCdUJjQjlCRUlz?=
 =?utf-8?B?WDZvbEVGTThNOEFxRmc0ODZtYTJGWGxnUzZlUENHWWFLdUx1MUJGQjVTZEw5?=
 =?utf-8?B?RXJnVVNHeGx6dEY2Y1BXcjdtRENWTXJQejBvVk4rTUZwSTVralprQng2dnRh?=
 =?utf-8?B?cU1ybzNIMVBudFhoVEN1eWp5aXBtK3c3ZUFQbUZzUHFjYVJHOEdoaEEzeEsv?=
 =?utf-8?B?R2ZZdGZHWENqK2RXQ0pWejR3YzA1RmZsMDFmK1lqZEJGMzQ3amZ5ZFJGTUwr?=
 =?utf-8?B?cDNzNytSRXY0bEF0RG9jbnpzOVdXdExjdDRyTko4NVpabHpOZVJBVXRIVzRx?=
 =?utf-8?B?SlNmRXRaeHQ3VDQ5YzdoZWtsR2ZLZ3BwVzF6WTVHK0gra3hvOTAwa3JBL25t?=
 =?utf-8?B?cGUwK3ZSa0hLcjNUYjdxbUlWNzZNUzNQaWdMbVE2TUtyT2trSWkrNERyaEs4?=
 =?utf-8?B?TWVZNllYcFZISFBnbFBuOHYyTUowOW4ybEFMOFFMSnBEUzVFN29MczBHZmpn?=
 =?utf-8?B?R2hYelhzZWZMUWd3M3V5eFdtREo3czBmSFZTRUo5VW5FYXVDWngyYUlVMVVm?=
 =?utf-8?B?dUJkVnVvTGRaVDF6U1gzdjBvOU1IR1duZWRiK1BOQWdJYzI2a1dBR1JMYitY?=
 =?utf-8?B?eEJHRmhPVUxxdTl1U2NESXhjdmRpUXpEQjFBcjcxeE5JeW4zTUpXTmZSTnpV?=
 =?utf-8?B?RldZQjNydXpqOEdrcE04d0puT2VmaGxHMzNCVVlIVkU1OEY2NUtwTVd2T3Vi?=
 =?utf-8?B?bEs0ZWxzL2dBRENNNWd6WkZqQ2E1ck9UZGZyK2I4cjlPQTJGUFJLSkpMbXlT?=
 =?utf-8?B?WmNRei8raFdQUVRzazROdUFVc3pLN1dxWGZFUHlGWkx3MUpuTHJpTjYyNkdq?=
 =?utf-8?B?Qi9tcGtHei9yOGFCb2pBR1NQSHdPcDI0YjdIMlh6QlJzMnRJMTlDeldVYytP?=
 =?utf-8?B?ekVVM3hjNjVQRDlWVVNXcVUyRCsyaEkvOXZQb3paa1FsekNVWVVsb29ERnAv?=
 =?utf-8?Q?aeE7LQagbbUi6Y/njdiG2hdri?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f5ba69-0dcb-48ca-4f89-08dd1dfb2032
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 17:57:37.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y61AxCNAy29VYmvDUakpSVqlnov7tQABlOuLit8nHblWehzXiDNrsGx5nKvlioLjbbMg/Jm11ohHY57uni1UmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8838



On 12/12/2024 21:56, Mario Limonciello wrote:
> On 12/12/2024 09:19, Shyam Sundar S K wrote:
>> The AMD SFH driver includes APIs to export SRA sensor data. This
>> data is
>> utilized by the AMD PMF driver to transmit SRA data to the PMF TA,
>> enabling the AMD PMF driver to implement the output actions
>> specified by
>> the PMF TA.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/pmf.h | 18 ++++++++++-
>>   drivers/platform/x86/amd/pmf/spc.c | 51 ++++++++++++++++++++++++++
>> ++++
>>   2 files changed, 68 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>> x86/amd/pmf/pmf.h
>> index a79808fda1d8..c343eaa84755 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -616,6 +616,20 @@ enum ta_slider {
>>       TA_MAX,
>>   };
>>   +enum platform_type {
>> +    PTYPE_UNKNOWN = 0,
>> +    LID_CLOSE,
>> +    CLAMSHELL,
>> +    FLAT,
>> +    TENT,
>> +    STAND,
>> +    TABLET,
>> +    BOOK,
>> +    PRESENTATION,
>> +    PULL_FWD,
>> +    PTYPE_INVALID = 0Xf,
>> +};
>> +
>>   /* Command ids for TA communication */
>>   enum ta_pmf_command {
>>       TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
>> @@ -667,7 +681,9 @@ struct ta_pmf_condition_info {
>>       u32 device_state;
>>       u32 socket_power;
>>       u32 skin_temperature;
>> -    u32 rsvd3[5];
>> +    u32 rsvd3[2];
>> +    u32 platform_type;
>> +    u32 rsvd3_1[2];
>>       u32 ambient_light;
>>       u32 length;
>>       u32 avg_c0residency;
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/
>> x86/amd/pmf/spc.c
>> index 06226eb0eab3..d5f764e624b4 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -16,6 +16,46 @@
>>   #include "pmf.h"
>>     #ifdef CONFIG_AMD_PMF_DEBUG
>> +static const char *platform_type_as_str(u16 platform_type)
>> +{
>> +    switch (platform_type) {
> 
> I notice you're missing "LID_CLOSE" case here.

This was actually intentional. There is already one such print present
in amd_pmf_dump_ta_inputs() which gets populated via the
acpi_lid_open() call

dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" :
"open");

So thought to exclude it here. Makes sense?

Thanks,
Shyam


> 
>> +    case CLAMSHELL:
>> +        return "CLAMSHELL";
>> +    case FLAT:
>> +        return "FLAT";
>> +    case TENT:
>> +        return "TENT";
>> +    case STAND:
>> +        return "STAND";
>> +    case TABLET:
>> +        return "TABLET";
>> +    case BOOK:
>> +        return "BOOK";
>> +    case PRESENTATION:
>> +        return "PRESENTATION";
>> +    case PULL_FWD:
>> +        return "PULL_FWD";
>> +    default:
>> +        return "UNKNOWN";
>> +    }
>> +}
>> +
>> +static const char *laptop_placement_as_str(u16 device_state)
>> +{
>> +    switch (device_state) {
>> +    case ON_TABLE:
>> +        return "ON_TABLE";
>> +    case ON_LAP_MOTION:
>> +        return "ON_LAP_MOTION";
>> +    case IN_BAG:
>> +        return "IN_BAG";
>> +    case OUT_OF_BAG:
>> +        return "OUT_OF_BAG";
>> +    default:
>> +        return "UNKNOWN";
>> +    }
>> +}
>> +
>>   static const char *ta_slider_as_str(unsigned int state)
>>   {
>>       switch (state) {
>> @@ -47,6 +87,9 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev
>> *dev, struct ta_pmf_enact_table *
>>       dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ?
>> "close" : "open");
>>       dev_dbg(dev->dev, "User Presence: %s\n", in-
>> >ev_info.user_present ? "Present" : "Away");
>>       dev_dbg(dev->dev, "Ambient Light: %d\n", in-
>> >ev_info.ambient_light);
>> +    dev_dbg(dev->dev, "Platform type: %s\n",
>> platform_type_as_str(in->ev_info.platform_type));
>> +    dev_dbg(dev->dev, "Laptop placement: %s\n",
>> +        laptop_placement_as_str(in->ev_info.device_state));
>>       dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>   }
>>   #else
>> @@ -190,6 +233,14 @@ static void amd_pmf_get_sensor_info(struct
>> amd_pmf_dev *dev, struct ta_pmf_enact
>>       } else {
>>           dev_dbg(dev->dev, "HPD is not enabled/detected\n");
>>       }
>> +
>> +    /* Get SRA (Secondary Accelerometer) data */
>> +    if (!amd_get_sfh_info(&sfh_info, MT_SRA)) {
>> +        in->ev_info.platform_type = sfh_info.platform_type;
>> +        in->ev_info.device_state = sfh_info.laptop_placement;
>> +    } else {
>> +        dev_dbg(dev->dev, "SRA is not enabled/detected\n");
>> +    }
>>   }
>>     void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct
>> ta_pmf_enact_table *in)
> 


