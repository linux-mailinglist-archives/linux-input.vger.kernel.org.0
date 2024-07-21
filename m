Return-Path: <linux-input+bounces-5108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ACB93836D
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2024 08:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E100F1C20A32
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2024 06:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6393353BE;
	Sun, 21 Jul 2024 06:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KHSYK1Vz"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02496522F;
	Sun, 21 Jul 2024 06:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721542873; cv=fail; b=Vrlb/xzxz35PGeBnLbVqFSWxiKNrTnUxiEF/6qGISv7tBCIa+m8qOh98k53uAr8mZeQeniNTqbOvHJImG3HOYOJPzpw0aL1H39UaFLlcYYvmeGz0VWo74621k6dmr8+ynJhmyX4tpV8aV/78n5Rni6N7g1i9xVlgEvFajIHnbbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721542873; c=relaxed/simple;
	bh=BqbNCuT8kvdZ3Zr5VGOD2241oNemncBxUkwpCAz9hY8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WofmkIh3ZWtTWgEwhT5+mfauza4fFDjyvfaF+TGBj+XPotlr3o/TCjtPdsg+y4CDlc06SQkqFTO3yJXD7AOAv08Kq5LdTP6FEsRSgUvlXrYQNENmDCrz8JiIW6GC4eIndBQcDYE3yUAFZ8aJgsWElIOWZ9pblH6mULTC7gCOJic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KHSYK1Vz; arc=fail smtp.client-ip=40.107.244.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHfYQ4+7ASfflHl7UCLF0ERN7ZgFii2uPH9X42MTVzGe9GZtXEgQlDa0LWSXsxaD8oC7tpqbjsQsxQpEYs8YAg4Q6ViCjaES84KIcjrp9pJJAHoUT20mK2uB/tMJmPkcswHOQC0apdeJkBDPzekBlPerJRtBAXv6fYzmwrJOsOpE756AzE71AQiD4Hy+85V1HDedkZ2tpVd7DY1befMFTxfRehVKGRLYGMycsWzdEfc9PceGETeFnphkFUl2JWCYJc4wMuizrJk952hkqySas7Ns52KX4lRgahKTKy7vSW/rok7xtaOgLhviHguytKLwGYT8F3i7WIXcKM/ff6XMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT9SeI2lW/CKJ8/nEKXVBl4WRjj8un0kypHxiilzSUY=;
 b=tozH/oMeEcnsdGbTK4oLJduN/mQV/ccA8oElSvsnu0DNXntyVT/bZ2ZFF6CigViFE7p0vEnoToZPveuCWHQ1s8VccT8aU26uE6sBQTNMkWOo6/BdZqV9V9TVaH1V/rvhV/Fuyi5Utc5zL8qp0OqtTsSNZ3Z14YlmEGznYegx7HvdUsw8SahIOBVB9vJ76VJXdePucVnZ9Rwta5cRJA0T2fg5ta888YABotyvkJgsE+EYxmSXxMgTpAlRWr3+Wv8lHnKXqixXO90cAjmNuMIuBO+zOoRguSJZzR60F67sBQ0b0zjYLCLcY7viXS2HvrPCDZfx5N1Wgi+NuW7kFVaKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT9SeI2lW/CKJ8/nEKXVBl4WRjj8un0kypHxiilzSUY=;
 b=KHSYK1VzAxa4iL42lF6m6SFDQAgB73rX/bNnhBYInEbFJR7nacb1Eji/ubCiTRA5Nve8PtBZTyNHJVgW98p6FR6Y/SkYygKkKYfzgR52X4N1p6KO4z/ZFy86pi2xhTmi3tCrJ33TOGgg/eS7dp4F+5g4L/EhLZJtR6l8ynKVLNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Sun, 21 Jul
 2024 06:21:07 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%4]) with mapi id 15.20.7784.017; Sun, 21 Jul 2024
 06:21:07 +0000
Message-ID: <11fdf362-8fa5-4d44-904b-c0c9867ebd07@amd.com>
Date: Sun, 21 Jul 2024 11:50:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] HID: amd_sfh (drivers/hid/amd-sfh-hid/): memory/page
 corruption
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires <bentiss@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Li Ma <li.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 yifan1.zhang@amd.com, linux-kernel-bugs@hixontech.com,
 linux-input@vger.kernel.org, Basavaraj Natikar <basavaraj.natikar@amd.com>
References: <3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com>
 <ade43b5b-9b93-40a8-acbf-99df944b45f9@leemhuis.info>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <ade43b5b-9b93-40a8-acbf-99df944b45f9@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fafdcc3-c9db-4bdf-de5c-08dca94d4e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlZFNHZNTFplblBqbWRzUllQYVBMTzFvNmNXM1JZM1hzY1RwUUpZUXo2TllP?=
 =?utf-8?B?Z2lacmxwOHJ5RVdKVXc5Y1RNNXU1UmwxK08rQ1kyQmdBcnI4clZQS2kyNjVw?=
 =?utf-8?B?RDFBWGpHbW9scHE5dUhQMitVMlptL1RlTDJURFg5UUN0eGxJTTNBYlprbGVZ?=
 =?utf-8?B?dHVyZDFoQWE5Y21kMktUNTQ2RUVVN3NuMU8yQXppQjlsRlZkaStOakVpRHBw?=
 =?utf-8?B?K0FsUnE4MFdDWkM4WjlBUFZsdTRrM1VZRFRWeU44OVZwNXFLK0FFKzAzbmR0?=
 =?utf-8?B?SldFWGUyanBnc3d2b0c4VVdDQ3dTU0kwZlRReVgzaEMyOWhKbFcyNVIveTh4?=
 =?utf-8?B?eVFVTjhkdWRwVVlqK3BscGQ1cWdoQnpwVEtKbThLQXJOQjlOd2ZrNTFlL3Z0?=
 =?utf-8?B?WHNIbkZNYnhOSTRwbDFsOU9QZE9GcXY1N1pWcVVuWDdkUy9FbVpOYnlwaTR0?=
 =?utf-8?B?d2xsbUU3K3ZzYmN1QmpUN0lIWXdpTWZXeUZZaUF1dXg3ZDJwZFozMm5sTFB1?=
 =?utf-8?B?MUJoUThtKy9WUTVJc2czSFBaL1JpNitJT3R3ZkgrOXNvaVZyRCszQ3RBdUZs?=
 =?utf-8?B?NmxRUERvVkF3a2lmcXlpem90cC90ektJbHpteTZYVUxLcEZXaml3bWhoMFlI?=
 =?utf-8?B?OWNCSmpzTnJtMU9zU1JQb1RqWVhPUERGYVRhZElHbVhxcWF4cXB5cUg5c285?=
 =?utf-8?B?RDM3UzJiZ2xtaVA4Mjk0b2tMS2lQVlZXZStENnBNZTdSWURQSUVGcExLWC9j?=
 =?utf-8?B?OGdLWU5OZ0ptcjE5bEtoVVVKclM4eFFodHdkd2xVVWEwVW53RG43NEhRZW0w?=
 =?utf-8?B?R2g1TlJUOG5aOEJldkYwSW9wOXArMndwaURneEVDbnZVVllvdUR3UWRXOHJD?=
 =?utf-8?B?OFVSYkUzYmovcEZzS3MrTHVFMlZRbkxPbVlnUVdGeG10WmlEZG9qR24wZ21z?=
 =?utf-8?B?ZEpOMCtHVG9ZUWhsanBYQWRFN2pYdXBkWUdKVHo3WXdwK3BER0pPdUVkeWlV?=
 =?utf-8?B?bmgwVEhQb0xhTGJRbEdHNVdLbTdubkkvR3paR3F1STVKQi9BcDFvdGhRMW5y?=
 =?utf-8?B?Z3JUUE8wbkVPZ0s3RXh0eVl0YzVlWEpNYTROemNidU95VXNWMUxGdWJjS3FP?=
 =?utf-8?B?QjhwTWR1TzFmOHVoMFg4dlZDMlVsUHoyeUJablpVUGgyMzN6WEY5KzM2b0lK?=
 =?utf-8?B?T1RFQjQ5cnZVSHFzWUo5M2o1d1FLaklaZGVIb0R6RzFsK0pQeVowNzJtNGl5?=
 =?utf-8?B?TmxqYUVoTDNFeDRMdW50eDZoQUpvQnY4dlRhTE5pUmRRL0hqSTliaHlnb3Y4?=
 =?utf-8?B?dDVPejJ6VjFYNVd0SGVFTWhBaWVERjQxTzBxMW5kMENJa0tIbktRWHQ0SE00?=
 =?utf-8?B?WnFKbSs3eEtReTduU0ZaT2ZPQXY5Tk1RakVhcWprUlhPSE1pUVVaOGozK09R?=
 =?utf-8?B?Z25HR3A1c0pHalBCQy84TTFML2lsRmIyUUpSNEQwWXBRZFVjUGtQY3A1S0JW?=
 =?utf-8?B?bTBuRVBkWDd4L2ZKTnBPSisrYUVDdWkyd1BRWlJJLzRBb3J6cWRxT0F0VlN5?=
 =?utf-8?B?WjJUbWNldldkMzNjdCtSdVpZdHJvOFJJVTdwYzlPc21PMTJLWmxEN1psR3Vy?=
 =?utf-8?B?bkl2dGxnUTZmdGhRMjdWb255dTFEYVBqd21SNm1hUytUeDVHS3Q5Y1hWbS9h?=
 =?utf-8?B?TFF4TGsvYW01ZGh4eEVwRVF1MHJLdzZHN3RwUWZER2RRM00xMkpGMUxlVDVE?=
 =?utf-8?Q?TNej3J3qhtLZet3OLc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVQrQzVhS0g0WjZNTFdQaGNJc1R4WWdXSHVGMm5jSlJNdWNSUjIvZmFGbkc0?=
 =?utf-8?B?aW5ucVBVcjIrbkY0L3NVOENYVkdiVHJVN3I3STc5WG5PTElHVUtPRW5NQlBY?=
 =?utf-8?B?Nnp4NGNhZnI5RFVrSmFXSW1acnlJc2hrMXNSNTMwSnFNQm45UlErQWtGb1NX?=
 =?utf-8?B?dW9Oc0w3RW04SGRFRGNxdVNRUG9jamF5RldyYmc0Y3pEcERSN3VwREtNdkdy?=
 =?utf-8?B?Tk1BNzlROE9WWUJTZUgwb2ZIL3Fod0tKWk0vVmJHTEdJUnp2TWVHeFp6cWtC?=
 =?utf-8?B?TDJGSnRLKzU5eEppcG9yQ042V3JmcXV5RVp0QmI3c2dJRjN3TDRwL2N2Yklm?=
 =?utf-8?B?dlFqOERxNHpIT0Rub3pOUU43dS91V0k3YU9NQ2NjV3NZcHVEREpNZFhoQVBU?=
 =?utf-8?B?SG1CNUswWDBEb3N5bHpYdTJvTGhUaGNxVzVCdFNRbDI1NFNwcTRSbGUwalZp?=
 =?utf-8?B?dmU4TVRGU0RwSFFWZE9nb2ZmdG53VlNNQU1HMDQ1UFo1ZUhDRzdjODVkSXJq?=
 =?utf-8?B?eElNWnFWTjc3WEtqZ1QrR08vWUw2VEpNNzJNcWE5VTc3SUhrb1QvK2hZdmZ2?=
 =?utf-8?B?WkI3WHNqQThpQXBOdXJaRUdzUnFlNVlYa3VjN0xNd3NGSFMwdHYrYnBDRG1k?=
 =?utf-8?B?WFlaM0k5N3ZlOEMyOHpDUmFyOXdGOEd3Q1RtbUxuY3VKZkNUM2hLNHNNTEt1?=
 =?utf-8?B?K1gxRTlTVFZ3RE9tSlowc0g0NnBlOFhTbjE2cEg5N0JHbXQvLzFCODJjR3BX?=
 =?utf-8?B?MmZpUmsrQmtKcmNVckM1aXFHWE5BZzBISGtiMDJ1RnhjR2g0NmpkZ0VzcFVD?=
 =?utf-8?B?UFFPME9kL1FvYXJud3RubkFmV05PMS9wbG1SZXhNK0JBZHhtdm43RWxQeEc5?=
 =?utf-8?B?YUFNMjZKQm4zekhReFdRKzdraE9FS3YwaDRmMFNYcEJ4VElweDZPdkMvNlpL?=
 =?utf-8?B?QWRUcUFmM3V5R2dSeUQ4WG9xeCsrZTloek5zeU9nd0hkNHpFV2RZdFFLcFYz?=
 =?utf-8?B?WmhUdnZFaVNobm9kYkNwOXFwQ2l0OUJQTTBiU2hkWGkzWkMrSko0U1QvdVpD?=
 =?utf-8?B?Q1E0SWNweng2NGFSMnNQZGRjOEllbVFSMEFyZjJnTzYwN2NFUjZ3S25uOW9V?=
 =?utf-8?B?Y2J3RUNhVGRRRWNRMmlveWhsdmlHVlowMjZGNjhmWll0QWtiNkVXWGFOa01P?=
 =?utf-8?B?N2hBUTRmQWo0VDduSUFqSFREbnMzNUl0blZ6SFBKSEs5ejk3YXVkVW1QMlZ4?=
 =?utf-8?B?TXUvVWc4RXZYRHMxWFJraWMwZzFvMmRhWEM5eGMwaU1VeE5TdHdjK0gwck5s?=
 =?utf-8?B?V2lVK1JyM2Fvc25MbTlPVlg1QUl5djNYaGNoZjY2NVJueEZtRjdkYSs5d3JZ?=
 =?utf-8?B?VzRjQXZTQ1FlMFYyRHhYRjZnUzkzSlVUZFh6VSs0a2Y1aXNiUW9oNTMxZ3VI?=
 =?utf-8?B?dzdpSzdNdHFpUGFheVZmODdjYlN5Z25rZmd3VmtFUy9OSVlCelpMR21qV3NZ?=
 =?utf-8?B?WHJxWVhCNFNPcDQ0QUdISlpMZTE3ZnVUTFptYTcrcXJlQ2xFNVNYYkQ0NTVZ?=
 =?utf-8?B?UEpKZGFIQUQwSDNibmUyR3FibVA0Vkt6U2NnWU5ZZlYvWGRwSzMzYzZuOHpN?=
 =?utf-8?B?YWlqV3lRUjhYeEZFOU1HTm5KT3FKTmkrZ3dOMHg5UzRZRmdObDh6ZjVCTWFD?=
 =?utf-8?B?Y1lpTnBpSXhSNTIvT1hFL2I0ZVBYNjliR3NTdStzZlRvbVVOV0FsenhmQnJ6?=
 =?utf-8?B?Mi9SSS81T3FVaEdvL2Z0eHdhVjR3dHJ5YURqRmpianpMUWpTN09IdTliL04x?=
 =?utf-8?B?aUNLa2d2Z0VvN3ZTM2J5R1I2cHFPelB3S1gzK0N0VG1YRFdoZ3V6K085aE5r?=
 =?utf-8?B?MkJxdDM0OXRwdUVKMEc5bk1GWEN2TzhpY1Z1WVFmNnJGZTA2RWVEUXg2dkhN?=
 =?utf-8?B?amttb0ROMGltNnFYNmt1TEVCNjdLeVlpTndrNkRUK1pGdGdKS202MDh6Rm5G?=
 =?utf-8?B?NGd3eFg1YkYyaGJjelhrMjVsdjE5ZGQzazhlcW82UFJZNnlta0Z1QzNoWjNO?=
 =?utf-8?B?WjJJQlNhaVBSdi8rWEJzb1JTSSs1TWJaTFNjSXptdW5HTFU4bk0wK0t1WW5R?=
 =?utf-8?Q?FbBGRN2rhWwMZhKJhStPiRqBv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fafdcc3-c9db-4bdf-de5c-08dca94d4e04
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2024 06:21:06.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Px/GQr8dTMM4T7r9ZlmttRhUq9r49GGrJ1H2voKQORQPPijLuyJYCzG+GTapx2SK9XWZjdES5g0l8wx8rETtVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024


On 7/17/2024 4:51 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 15.07.24 06:39, Chris Hixon wrote:
>> System: HP ENVY x360 Convertible 15-ds1xxx; AMD Ryzen 7 4700U with
>> Radeon Graphics
>>
>> Problem commits (introduced in v6.9-rc1):
>> 6296562f30b1 HID: amd_sfh: Extend MP2 register access to SFH
>> 2105e8e00da4 HID: amd_sfh: Improve boot time when SFH is available
>>> It appears amd_sfh commits 6296562f30b1 and 2105e8e00da4 correlate with
>> some form of memory/page corruption. 
> Hi! From a quick search on lore it looks like Basavaraj Natikar who
> authored those two commits is inactive since a few days. This is totally
> fine, but given the nature of the problem slightly unfortunate. That's
> why I'm trying to raise awareness to this report by adding the
> subsystems maintainers, a few lists, and a few people to the list of
> recipients that were involved in the submission of those two patches.
> With a bit of luck somebody might be able to help out. Ciao, Thorsten
>
>> On my system, this typically
>> presents itself as a page dump followed by BTRFS errors, usually
>> involving "corrupt leaf" (see dmesg output below); often the BTRFS
>> filesystem becomes read-only afterwards. Note that the underlying NVME
>> disk seems fine, and the BTRFS filesystem does not actually appear to be
>> corrupt when booted/checked from kernels without this bug (no BTRFS
>> errors or I/O errors reported on non-problem kernels).
>>
>> I have no problems when I blacklist the amd_sfh module (any kernel
>> version), or revert both commits 6296562f30b1 and 2105e8e00da4 (on
>> stable, linux-6.9.y). I have no problems on any recent linux-mainline
>> (v6.10{,-rc*}) when reverting these two commits (in addition to
>> reverting 7902ec988a9a and 6856f079cd45 to successfully build the
>> kernel). I have had no problems with any 6.6.y, v6.7.y, or v6.8.y version.
>>
>> It is curious BTRFS always seems involved, but problems go away with
>> these amd_sfh commits reverted (or amd_afh disabled).
>>
>> Further notes:
>>
>> I have not specifically used the amd_sfh module for anything. As far
>> I've been able to determine, my system has the "Sensor Fusion Hub" mp2
>> chip, but has no supported sensors/sub-devices (or I need to do
>> something to enable them), (or there is an error while detecting
>> sensors?). All logs I've checked contain something like:
>>
>> Jul 09 04:14:37 arch kernel: pcie_mp2_amd 0000:04:00.7: enabling device
>> (0000 -> 0002)
>> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7: Failed to
>> discover, sensors not enabled is 0
>> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7:
>> amd_sfh_hid_client_init failed err -95
>>
>> Excerpt from lshw:
>>            *-generic:1 UNCLAIMED
>>                 description: Signal processing controller
>>                 product: Sensor Fusion Hub
>>                 vendor: Advanced Micro Devices, Inc. [AMD]
>>                 physical id: 0.7
>>                 bus info: pci@0000:04:00.7
>>                 version: 00
>>                 width: 32 bits
>>                 clock: 33MHz
>>                 capabilities: pm pciexpress msi msix cap_list
>>                 configuration: latency=0
>>                 resources: memory:fe000000-fe0fffff
>> memory:fe4cc000-fe4cdfff

Could you please check with the latest version, including the patch below?

https://lore.kernel.org/all/20240718111616.3012155-1-Basavaraj.Natikar@amd.com/

Thanks,
--
Basavaraj

>>
>> How I tracked down the problem commits:
>>
>> I was not able to successfully "git bisect" this bug - I seemed to run
>> into a mess of unrelated problems/errors that sent me down a rabbit hole
>> chasing who knows what. I had already manually narrowed down the bug to
>> amd_sfh by blacklisting modules, so I reverted each
>> drivers/hid/amd-sfh-hid commit on the stable linux-6.9.y branch (v6.9.8
>> known "bad"), back to v6.6 (known "good"), and then manually bisected
>> the revert commits, landing on "HID: amd_sfh: Improve boot time when SFH
>> is available" (2105e8e00da4) as the first "bad" commit.
>>
>> I wanted to be able to test with only the "bad" commit(s) removed; it
>> turns out 6296562f30b1 ("HID: amd_sfh: Extend MP2 register access to
>> SFH") needs to be reverted to do that. Everything seems fine with these
>> two commits reverted (again, this in on the stable linux-6.9.y branch).
>>
>> When testing, "bad" commits usually quickly display some variation of
>> the page dump/BTRFS errors, similar to the dmesg output below. I
>> consider commits "good" if the system survives "stress-ng --all 2
>> --vm-bytes 50% --minimize --syslog --status 10 -t 5m" (run as a non-root
>> user), which was usually followed by building the next test kernel. The
>> "bad" commits often show errors before I even get to the stress test.
>>
>> Examples of error messages from dmesg:
>>
>> [  653.364343] page: refcount:4 mapcount:0 mapping:00000000b159289f
>> index:0x585a7cec pfn:0x10b5c1
>> [  653.364353] memcg:ffff8f2600918000
>> [  653.364354] aops:btree_aops ino:1
>> [  653.364358] flags:
>> 0x17ffffd000802a(uptodate|lru|private|writeback|node=0|zone=2|lastcpupid=0x1fffff)
>> [  653.364361] page_type: 0xffffffff()
>> [  653.364363] raw: 0017ffffd000802a fffff1da87ee3288 fffff1da842d70c8
>> ffff8f260c719458
>> [  653.364365] raw: 00000000585a7cec ffff8f26cd09e0f0 00000004ffffffff
>> ffff8f2600918000
>> [  653.364366] page dumped because: eb page dump
>> [  653.364367] BTRFS critical (device dm-0): corrupt leaf: root=7
>> block=6071604133888 slot=159, unexpected item end, have 2768254010
>> expect 13379
>> [  653.364371] BTRFS info (device dm-0): leaf 6071604133888 gen 679995
>> total ptrs 353 free space 322 owner 7
>> [  653.364373]     item 0 key (18446744073709551606 128 1062871883776)
>> itemoff 16271 itemsize 12
>> [  653.364375]     item 1 key (18446744073709551606 128 1062871896064)
>> itemoff 16263 itemsize 8
>> [  653.364376]     item 2 key (18446744073709551606 128 1062871904256)
>> itemoff 16255 itemsize 8
>> ...
>> [  653.364762]     item 350 key (18446744073709551606 128 1062879260672)
>> itemoff 9227 itemsize 12
>> [  653.364763]     item 351 key (18446744073709551606 128 1062879272960)
>> itemoff 9223 itemsize 4
>> [  653.364764]     item 352 key (18446744073709551606 128 1062879277056)
>> itemoff 9147 itemsize 76
>> [  653.364766] BTRFS error (device dm-0): block=6071604133888 write time
>> tree block corruption detected
>> [  653.375440] BTRFS: error (device dm-0) in
>> btrfs_commit_transaction:2511: errno=-5 IO failure (Error while writing
>> out transaction)
>> [  653.375453] BTRFS info (device dm-0 state E): forced readonly
>> [  653.375458] BTRFS warning (device dm-0 state E): Skipping commit of
>> aborted transaction.
>> [  653.375461] BTRFS error (device dm-0 state EA): Transaction aborted
>> (error -5)
>> [  653.375465] BTRFS: error (device dm-0 state EA) in
>> cleanup_transaction:2005: errno=-5 IO failure
>> [  653.375582] BTRFS warning (device dm-0 state EA): Skipping commit of
>> aborted transaction.
>> [  653.375586] BTRFS: error (device dm-0 state EA) in
>> cleanup_transaction:2005: errno=-5 IO failure
>>
>> Another example:
>>
>> [ 5478.134046] page: refcount:4 mapcount:0 mapping:0000000010080c01
>> index:0x5459ff30 pfn:0x168c7f
>> [ 5478.134054] memcg:ffff89c240988000
>> [ 5478.134056] aops:btree_aops ino:1
>> [ 5478.134061] flags:
>> 0x17ffffd800802a(uptodate|lru|private|writeback|node=0|zone=2|lastcpupid=0x1fffff)
>> [ 5478.134064] page_type: 0xffffffff()
>> [ 5478.134066] raw: 0017ffffd800802a ffffcc5d043e2bc8 ffffcc5d05a08c88
>> ffff89c249968338
>> [ 5478.134068] raw: 000000005459ff30 ffff89c246fa22d0 00000004ffffffff
>> ffff89c240988000
>> [ 5478.134069] page dumped because: eb page dump
>> [ 5478.134071] BTRFS critical (device dm-0): corrupt leaf: root=2161
>> block=5796594384896 slot=84 ino=2434728, invalid inode generation: has
>> 72057594122450740 expect (0, 664473]
>> [ 5478.134075] BTRFS info (device dm-0): leaf 5796594384896 gen 664472
>> total ptrs 120 free space 1223 owner 2161
>> [ 5478.134077]  item 0 key (2434713 24 3817753667) itemoff 16210
>> itemsize 73
>> [ 5478.134078]  item 1 key (2434713 108 0) itemoff 15359 itemsize 851
>> [ 5478.134080]          inline extent data size 830
>> [ 5478.134081]  item 2 key (2434714 1 0) itemoff 15199 itemsize 160
>> [ 5478.134082]          inode generation 636724 size 758 mode 100644
>> [ 5478.134083]  item 3 key (2434714 12 2348495) itemoff 15181 itemsize 18
>>   ...
>> [ 5478.134242]  item 117 key (2434733 108 0) itemoff 4398 itemsize 329
>> [ 5478.134243]          inline extent data size 308
>> [ 5478.134244]  item 118 key (2434734 1 0) itemoff 4238 itemsize 160
>> [ 5478.134245]          inode generation 636724 size 30 mode 40755
>> [ 5478.134245]  item 119 key (2434734 12 2434375) itemoff 4223 itemsize 15
>> [ 5478.134247] BTRFS error (device dm-0): block=5796594384896 write time
>> tree block corruption detected
>> [ 5478.263726] BTRFS: error (device dm-0) in
>> btrfs_commit_transaction:2511: errno=-5 IO failure (Error while writing
>> out transaction)
>> [ 5478.263733] BTRFS info (device dm-0 state E): forced readonly
>> [ 5478.263736] BTRFS warning (device dm-0 state E): Skipping commit of
>> aborted transaction.
>> [ 5478.263737] BTRFS error (device dm-0 state EA): Transaction aborted
>> (error -5)
>> [ 5478.263739] BTRFS: error (device dm-0 state EA) in
>> cleanup_transaction:2005: errno=-5 IO failure
>> [ 5478.264582] BTRFS warning (device dm-0 state EA): Skipping commit of
>> aborted transaction.
>> [ 5478.264595] BTRFS: error (device dm-0 state EA) in
>> cleanup_transaction:2005: errno=-5 IO failure
> #regzbot ^introduced: 6296562f30b1
> #regzbot summary: hid: amd_sfh: memory/page corruption correlated with
> 6296562f30b1 or 2105e8e00da4
> #regzbot ignore-activity


