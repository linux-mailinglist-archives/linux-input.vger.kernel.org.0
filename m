Return-Path: <linux-input+bounces-11556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A9A7D997
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 11:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F6D1896FD3
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 09:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C1C22FF42;
	Mon,  7 Apr 2025 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kf4q+RSm"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60622FF4D
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017759; cv=fail; b=dLfnOmxMy3Oa2QDSscrPRu3xC3ZAQ064npBjJjDXzmMWVIzV6nnGVzZRbmAuCkxPzkomp7LSEcerkzinU3qn1VASl4SJcYKYPPsQiv1tt+0jn9AZ9D0AWR32hxX0kGvW6XhD7eQrd2AXBYkJpGxZbFdRI4OwdZz7UOZ+UyTwGrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017759; c=relaxed/simple;
	bh=EfsLxODGpCsTG3V9MprAsUSbz/lcwgA5MktXqZR8hYE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W+aXcdbyNmXazoQ3KoshgV6N4dByK6zIbe9I0+hMrIfRZVVeIbcxyO3TljpRbGdhDJQR7wflQ2LZRTt7lIcPJyHXe15lDg4hsMQm0FVDILfXQvjnthaKSfZ2WkJwgoykeJsYvsYL/sZRPWQTK5kDa+iAasQ4DU73z9tasU1V+KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kf4q+RSm; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNqm307ptSeyPpHc4D+6XAj9rviiZ6lbkWhhMdpMVTdwahy/SaXQKCaw3448KVYnDuKHaaU0gtCXkpXOk+4i0MFaQ1j9y6e93QsOv30CKLNm3vyRd5DJTia4XZbY71rEjIXEfUqpRVAjmpMunJc6w0DKedERpcuHzxr4G0EqAyMAUzwN4qec5k3Jixl8hlouJUQ810fVreqFItCsguqZcmMwSwihNhKuc5KlTyc6MuXzyXDhjESVCxi17Qu9vxWoVvNEz2/Ug1fjSDfFnogt4Ikw65pos6OV+4A7pOCqn8/gPSHxKXGMSAgeIMpCLxZMkPNb/9Ep22hQt+HBtB6LVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeCJNv9lqkzAmM/AF4zdFx7Iis+95cyPYJt5+De7Pfg=;
 b=Bja+LIvV3R60lLpWdwOSBasdDycH/HGcrE9tl/ti3Y2U/CSdFoEecwfdn65zFfM3R25tg0FSFm/CoHjy0s7vRKOmR3WTZ5cP+wN1I6ODeveJSqtBpoCpUnMvzMebdyPAcpQPsF6ozlLe2XiGneTJjvYZJujYIy4V0b5o9WtHvp8kdIs6JFva9EtbgiqVOF+JVG5yAGDtUm1wYcDf9XwStD5oEOD974ymXcvVSBSl95W/gb3VoCthwD0sWEu77EnMcUqtlkYjSCiYsJYjRhGGriiu1yzpqrgiU8aN2VsBBRMTXHVhsz1uLzEwEyihDBKeq6RPpRDr3HMdKzMsPFNw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeCJNv9lqkzAmM/AF4zdFx7Iis+95cyPYJt5+De7Pfg=;
 b=Kf4q+RSmfY6/mkbM037buPy7PBFX4EZdzBoNCGSncBsi1gmvQapWbr3v9tYs4HfMB3U7jzyvakeVXs1g7xbjtw8aI2Idck/IsXRWNooVjs3n5XLxsIyfBaG0anl7YV4FxCPkyIFrY1i0tNO61gPfcxVybhQ0L2wVTWCzx28XpMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by IA1PR12MB6483.namprd12.prod.outlook.com (2603:10b6:208:3a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 09:22:34 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 09:22:34 +0000
Message-ID: <005cb38d-3f25-4312-86e5-77649e114f2f@amd.com>
Date: Mon, 7 Apr 2025 14:52:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] HID: amd_sfh: Cleanup all sensors when init fails
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org
References: <20250403150026.1657538-1-superm1@kernel.org>
 <20250403150026.1657538-3-superm1@kernel.org>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20250403150026.1657538-3-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::9) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|IA1PR12MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c76b58-3870-4260-bb7a-08dd75b5badf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1puV2NVK1UydTVXU3F6bThBaFluem9XZUhjT3Y0MXRzSUw5bWduNWtHWUNn?=
 =?utf-8?B?QkJ5Vmd2K3o0eW8xZkgvSTVPSmlwc1QrLzdJaGtDZnZQR3NXajhoZ1lZNEZi?=
 =?utf-8?B?N0l4a0NVME4ycjdmSHA4RTVlWUI4TWFPTFptUGZKWEdqQ1g1VnJ6cG4zc29u?=
 =?utf-8?B?VVVNdm40amphM2JZOWttUXdZbzVxOU44SEtwWWVvWkcrclR1SXR6cy9nTVZ6?=
 =?utf-8?B?WEo0WDdRZ2drNHlCZUZhWkZ0NmRUVDFzWVcvMVJTZ3MwLzZKZ3p3c2VUcGZl?=
 =?utf-8?B?dDFjZUdyWlVncFVnL1NSam5OWTU2QVRoZnhKY3h4QWFQdmZJTW5mZWZiQjFB?=
 =?utf-8?B?eHhlY0JFd3JsM1VEMUpvN1pBMzQwSGE5UFBBYkNUL2RUUHlyTVJRZERwMnJq?=
 =?utf-8?B?N3U0S1R0MXQyWWVhS0tpdFVYZVU1a1RoVERrZy9aZFdla2JDYkFmcjFrcnBS?=
 =?utf-8?B?K3h2UngvOHJ6ZVd5ZjNkRTQvWXBZRXNxSHZ5cHI3WTNDckhCdWVZUDZYMWJS?=
 =?utf-8?B?TlRhaDRpdnpvUkUzZHM2Q0FoeCt1eUFIZUlBYkxWdFI3NkNQUm1US3ZCc2pu?=
 =?utf-8?B?UGMyNWk4WU5RMHpWd3JHdy92YXBHcmFzM0xXUTJJalJJUDNhRWkxdnl0ck83?=
 =?utf-8?B?Sm9TcFNGMW5DNnltN2loUDBQcVNXVW9CdTZmMDFlSm1MSXRWUmk1bmpETUlQ?=
 =?utf-8?B?Z003SmdlZi9RbHlObWdoRkhEOWh3eDBwa3F5YzVNZ0ZWZCttMWNPMjBsTG13?=
 =?utf-8?B?QVpWNzJVTEVTQU85MnV2ZnltTEQ3anN1SHh5Nm83cVF0c29qRHhvd29sM3lJ?=
 =?utf-8?B?WG5YY0lKZHlxR0twNmRFMmRQeGRIN0g3c0Vyb1pRY04rU3R0QVpUb2NDazRY?=
 =?utf-8?B?K3BESVpyU2NCUFdVeHRmd1hhMnFjVjJNV1RoVWFwSDQ4V3B4aGkwV1o0aEpW?=
 =?utf-8?B?M2d4Y2dGa24rOXlGVlNydE1VY0dtcThMWjNEU0NwVU9abk9hdWRiNi9SMWtt?=
 =?utf-8?B?bXdObi84T0lKcmxvUXhGRThFUHRSSWdQNDBFM2tFaEFYa2NIeHdCM3owOXJ6?=
 =?utf-8?B?cEVBZ0NqNUF1TnM2UDM1M3lJWDlNTCtxNnNmcWR1d0tiRldZSlQrMWYwLyt5?=
 =?utf-8?B?Z0d5RDhTNzJYQUVCZndhWUIvR2hNbXU0YW43Sjg5NjFxUGw2ZHZwek9yYUsx?=
 =?utf-8?B?MU5lclVKUTJrQW9BN1VaYnJocTNETXBMNThJS3NvQ2tMeGFOT0NnVDRBWXBV?=
 =?utf-8?B?eUUzYWJGRnc1RUNyNDJWU0NqQkQ4NWdZZ2FVWUV2WFVuSHlVODV4bHpwS24v?=
 =?utf-8?B?N3NBeUxMUGliRjA3K1FCOEh3Wk45YVhYeEprTTRPZDJmYlhobHRKbnVyUUs0?=
 =?utf-8?B?M1V5eUxWUzFZckFab3dQdUZramhOMm5aclp1TTRPS01qOVJZNUZzSUQ3ZzJo?=
 =?utf-8?B?Tm1VQTliM1ZSbFJWUE5LOEM2ZGYyMGpCY1BtV0twVm5kWkp0SnR4WDFLTW5u?=
 =?utf-8?B?S1RkM3Vkb2dDbEhCMFpVMEYwc1NuMWMxSVhseDRZODhYV1ArMUg4bmRuQmZH?=
 =?utf-8?B?UXFPSHlDdmF3ZXZ2Rk9NZ2FnUXVuQXFYZnJMV0FLeUdWUldGUXcwNXNTUHNh?=
 =?utf-8?B?bFJIT2tlRkpoSlVxRWhlSHZMYmEvMEdYcVhrd09jNU9uaTFabjArMEJWK2Z4?=
 =?utf-8?B?MHlCSDhKdDlncFA2WVZCeElDeVJMYnE4SENFMWwyeGZqSjZFYk15ZHRxL2Yx?=
 =?utf-8?B?UWNLOWl6dElzdTU3cnZPSVNxOUJUKzJFaVVUSjFKWnI5RFlra2ZHcitsZjlN?=
 =?utf-8?B?TVJYWWpFbTlhZ1FGTzVIbFFaU0xPY245K0lTUlZ0ZHUyM3NPUDRkRDFmNFk4?=
 =?utf-8?Q?Qu3/3Pc+567nd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUxWeSsrWmFORkpxSnkxM2tCN0E3bmk0T0U4WExmUTJBbktJZGNRSWhZcDNq?=
 =?utf-8?B?c0FQZm9VWkdpeFJvZGF1ZVRaVUVjKzdBL2FZeVlVUnFMTG1NR0dURWlyRFdS?=
 =?utf-8?B?UzFWV2RDSTdHSyt3VGp0NDFzUW9iZ2R6ZmJ5OFJUWXg1ZVgwUUNsL2Y1dmgz?=
 =?utf-8?B?RUZwaVgwM1BGVmc0aVNTSHFPbER2RjhTQ05tR203b3AxOFQzcG85SFdvOXcv?=
 =?utf-8?B?OE43RTFXby9neGxBb3VpZ2FqUXVGdjdrTmFSVk5aVHZtbTYvaTRVUFdCTTBr?=
 =?utf-8?B?WE1vUGRYT2xGOEIwMVVQZUxxcERJcU9pZWprMnlrb0o1WVRZbUI2WmJyRUFl?=
 =?utf-8?B?S1hCSlZQTk5OLzdMQTZCbzZoSTdieU81K2hsdkxDWVFWYmpuUWd6dE5WazVZ?=
 =?utf-8?B?MzhUclNUVW1tK3Rqeit0anFCazdnakRpVXBFeVBVRWZ2Mncyc3hCejFjYTNF?=
 =?utf-8?B?MnRYYktOT0dHek5GNkJzczRENGFua1pHMnJ5L0J3QTZ2L2hiOUl4NTF1MCtu?=
 =?utf-8?B?VHcvZlIrdXNYb25lSmZkOEJFUlgvWE4wSnZSZ0tHVlppQVFpaWR1Rkl3WVNY?=
 =?utf-8?B?eWZLbVpCSG95VVYxYUpwTE1VQ2krblFRNy9Hd2lqbzZ4dGJsUFM2UW40dDg0?=
 =?utf-8?B?T0hKbkJhWVBwM3FKVjhVeEpkc2o3dThuaVdSUHR4QS91QysyQS9XelN2UHRT?=
 =?utf-8?B?T2JOb0Y2L1JJUlJCUklwb1Evd0dQaWg3Z2c0aHh6Nk1RY2RqWjYxb0hsVmY0?=
 =?utf-8?B?NVJJd2E2ZTg5WldpOWdnQlFtdjIzQW5ka041ZW5kV3VHbDBVRkVaNXhmSHdu?=
 =?utf-8?B?UnR5SWdmYjhwWG1KS3lJZWt1Z3Y5WUFJdzhqbTZrNm9zckI0MDJUTDZHSkJ0?=
 =?utf-8?B?SDc1cmhLbXh6U0dLU1JZYkRwenR1QVVKdTlvcGxJTlAydi81c0N4OWY1ZEhq?=
 =?utf-8?B?TGZJUFFITTdOR1IvcEtheXpBKy84SU1JaXdreFNaMVZLNm9DV1l6Z0VHVVRx?=
 =?utf-8?B?aGhWM2VkaSs4QTZJNTRBbHpBaUN2WlFpREd0dmR4WTRqalp5NlZxZSthYk1q?=
 =?utf-8?B?Y3ZuV05sc3l3RzlyeFdOeTUzSmdoeUtIcjlScUlnK3Z6YWVEdmR3QktuUnJD?=
 =?utf-8?B?d09RcGVCWjgzM2FhNGxvSzJxRmpWMEc1WTlhUGw3TlJOd1RiVUdSb1hoWjRh?=
 =?utf-8?B?YVdZTk54aUwxdE0vQUtsMFFCa05FV2s1WFV0TmNlZDZabHNJeHR1OFcyVnVj?=
 =?utf-8?B?K1NNekRIb1NoMFhNUnI0aDltWTNaSldublhTNTR6Q1h4MTVjdm8xejdLWlQy?=
 =?utf-8?B?MldMbjRXMkR0bVM3VmRONmxTc0ZCL2RoazRwbHdjL0dhTDhlYVZPcWwvMXFB?=
 =?utf-8?B?Q3JaQ1lLM2F1dlUwcUJlQ3p0T09VcHVuU25ja2dkV01NQWs3ZlhRVk1MSTd4?=
 =?utf-8?B?MXprZDFqUVAxYmdMMDBEWS9DaVpYSlVFY3FXbDgvTG94eE42MVR6eGFkNUxv?=
 =?utf-8?B?T0xOODJVOFNCNnBKVWVJLzdDSi8yTlpyQ0VjOFpyMVA0UFJyZHhaMTQyeG9z?=
 =?utf-8?B?MS9iczE1amZhSEFqa1NCYlRUa2Z6QzFySjNjK01CVTZzWlo2eDRrd2pobjhm?=
 =?utf-8?B?T0RMcytkeVNzWDl2ejd3V1IrWlozaW9BclYrandFWHhFYTJtN3hGQnFqUElr?=
 =?utf-8?B?Q2NwT3p6Z0xaUzlvMnljVWw4SFpyd3JacjRGSXl6N2tyaEVWTW9lSU9Iam92?=
 =?utf-8?B?ODBLQXBqRnNSeXlEOG1XNkY1cElRN2g2cEc2VmV2bkIzeG84cnhGb012MWpK?=
 =?utf-8?B?VklQYk4reWQ4NlVrUkZ6RkI1V0Y0ZXR3Z0dIQ1dibWVqZ0FzREJxS0NpdHA2?=
 =?utf-8?B?ajBLMXlIRkhhMGhFZ2pQd2NCL245Q0xyN2dyb2tCZ1VHd3lUNnR0NFd2NWFZ?=
 =?utf-8?B?eFpHc2VEdkVvVUpseHozNlUwUzYyL1Q2YzFjaHlSOFUxcHhkUCt1WUNXOEI3?=
 =?utf-8?B?Uk1IZG93S1V4bGhWaGlzTFhvQWtEZTd5a3JaUWF5ZUtQNnA4aEo0ekxlQXRE?=
 =?utf-8?B?YThoQXJlcnNXYzhjSGErUzhpS0pwV3ZJUnBDdXRrQk5MeFRYMHVJekN3alVV?=
 =?utf-8?Q?+WxkjPf0+rpxYhu0qWJEX6Rnf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c76b58-3870-4260-bb7a-08dd75b5badf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 09:22:34.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vo5/wmCOlYS1Twdm6AHjapcaiI34LXgvs8+tkzxITbsoGln01OTw/ZZz7N9pKxGymq6X/OPeQkyjLa2hjQFlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6483


On 4/3/2025 8:29 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> If any sensors have been started when a failure occurs during client
> init they are left enabled by the firmware.
>
> As part of the cleanup routine check all sensors and if they're enabled
> stop them.
>
> Suggested-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2:
>   * New patch
> ---
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index c1bdf1e0d44af..c61cc42fa7a33 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -235,12 +235,20 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   	return 0;
>   
>   cleanup:
> -	amd_sfh_hid_client_deinit(privdata);
>   	for (i = 0; i < cl_data->num_hid_devices; i++) {
> +		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
> +			mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
> +			status = amd_sfh_wait_for_response
> +					(privdata, cl_data->sensor_idx[i], DISABLE_SENSOR);
> +			cl_data->sensor_sts[i] = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
> +		}

can we only add below condition as above case is already taken care in
amd_sfh_hid_client_deinit

Thanks,
--
Basavaraj

> +		if (cl_data->sensor_idx[i] == SRA_IDX)
> +			continue;
>   		devm_kfree(dev, cl_data->feature_report[i]);
>   		devm_kfree(dev, in_data->input_report[i]);
>   		devm_kfree(dev, cl_data->report_descr[i]);
>   	}
> +	amd_sfh_hid_client_deinit(privdata);
>   	return rc;
>   }
>   


