Return-Path: <linux-input+bounces-13835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD55B1C49E
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 13:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 598783BC95D
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 11:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB1F28A1EA;
	Wed,  6 Aug 2025 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sZasbnRO"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0E1F3BA9;
	Wed,  6 Aug 2025 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754478471; cv=fail; b=E5HkeZy/1sWiDAmj8GHNQH7LSteaxbka0k1M+W7zEJUAldfz5Ng0NMq4nINm3oKc5ke7GbB+A8Idr1m8/qez0ek8vjuD02qETjtABepoJ3BEaUdmeozSjiUvYcT9l87eHlsmDKHPOAmiu8PeHzDHVwbpncXv+7AqdhN8C8CpNGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754478471; c=relaxed/simple;
	bh=kr/5CoHHOjkwF2UPw9XjeGrqph76WZkHZQUk3Yk4388=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8ZxnLYPipuquscoIPpG5/zVSp6DaFhWrerEEcdajlPwV8ksb7cXJPOepbHojCT0cnukMtSxnUYL8ngyYQdhMGnc+H3isiJSLPEBl5z+81OplLri25zjZgy7URmFWVecHZtmbj+/T+qBNd7IEtVwJaQCaU71mQ8IUER8kb2+tQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sZasbnRO; arc=fail smtp.client-ip=40.107.93.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAD/fVc9Hok1WhrGoYbER582/GLU/HJNrmtwQNhURay7VzX16LwSnFBLtr7SDXZEhYEfsmsHdzdjGXNJfraMgWwu8A2nJyKGiC0ONE9qmIRO1lZFEogAYBjNkI5g4KlDI7KlW/tixL8iSbafdXDQFzBeJP/j31QDxmV+OjGdYxY1h5KYmwUJtCq5LAANef76GaMSAhcNtHAcJH+AwwMgbvaqYXkzKQSEjn3C5YQEIaKdy4xjR+WsGZihwaMruj1BIkeTTD2cTGAP8IicPa5LWqIaZQLiwLl+be2I98HFGNGlYL01RNEDifmTd8X6vZgA+z0CnMJO+ljECye2s5U+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ULUqnRUSx7LDk2k7mIpSszOcn9PCE4rIQnJPQR+ayk=;
 b=mpKfyJPthMCbXqdbrYgGbxB6kU5eSo+Hd8BUKxKse54U9ir6M6czs4UWpueKMBMrmZODY0jr/5f8/utrvFl8/fQ0qb2uAaVNFNU78EDwXhh/7muVhvy19NF66C4w2s27SDG40HQYOY13bLAvBWIeVYQiiviEl51Pspx2ef5MuLNt6ib4WG9PWMhikf9qPxe6hg8tpnRCtM4G9oAPrvbnrnSmQLJZg33p2eNy2SgqGppoXTNP4Gq1Anve3KI5zcK293X1XHPOSOdtrUEvid+VH+QAs394wzgO8LXIN4wrcyYCZy+8cmcz+NcKUGCiwA++8KSpLtmlbs9VtiRz4NrBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=plexus.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ULUqnRUSx7LDk2k7mIpSszOcn9PCE4rIQnJPQR+ayk=;
 b=sZasbnROM+68+OCl/UWIOVUAmB8enuNLRKhlbJd10ncFaLav/y0nP3JUezowsGYj1nkXD3MSXXQ5do7u7NBsluO/+Sza5S0edrXVgQJhr7KqJ6pqLNyT24Mm6T9s4pS4PO5G/Oi3F4Bh46J3E0VzMVaZA2Goua59oCaDZn3hnu64MEEiNdKXW4RipsKs2CXqLcKYiFCmyUR+lVUMe7+vx6sSnFSSK33kYz9qjJpDAWyql/7RYBgx2HoaxoDud2LlzrBIBvKtGZENFjWIHVrRuzCgIjz7IGB+OvJAFFSSoQSlHPv2Y8eRydXtr5PHRHt/+/9NhbUZPPLjf21Qwr/zlQ==
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by PH7PR12MB5928.namprd12.prod.outlook.com (2603:10b6:510:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 11:07:45 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::30) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Wed,
 6 Aug 2025 11:07:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 11:07:44 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 6 Aug
 2025 04:07:21 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 6 Aug
 2025 04:07:21 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 6 Aug 2025 04:07:20 -0700
From: Willie Thai <wthai@nvidia.com>
To: <danny.kaehn@plexus.com>
CC: <andriy.shevchenko@linux.intel.com>, <arundp@nvidia.com>,
	<bartosz.golaszewski@linaro.org>, <bentiss@kernel.org>,
	<devicetree@vger.kernel.org>, <dkodihalli@nvidia.com>,
	<dmitry.torokhov@gmail.com>, <ethan.twardy@plexus.com>, <jikos@kernel.org>,
	<krzk+dt@kernel.org>, <linux-input@vger.kernel.org>, <mhn@nvidia.com>,
	<rastekar@nvidia.com>, <robh@kernel.org>, <tingkaic@nvidia.com>,
	<wthai@nvidia.com>
Subject: Re: Re [PATCH v11 0/4] Firmware Support for USB-HID Devices and CP2112
Date: Wed, 6 Aug 2025 11:07:20 +0000
Message-ID: <20250806110720.680587-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250729174951.GB4111945@LNDCL34533.neenah.na.plexus.com>
References: <20250729174951.GB4111945@LNDCL34533.neenah.na.plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|PH7PR12MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9aea6f-148d-4f33-4249-08ddd4d9786d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|30052699003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THVSSkJyNzNUaGxiMndudnd2VE1zSi85QUxGaGVTd2ZTbmdLTisrQkMzLzRl?=
 =?utf-8?B?ZjNPSjE1eW5pbEVQWGZpK1ZyK25CL0c4ZndUK21qbkt2blJCVWxKaTBsK2Ry?=
 =?utf-8?B?SjNsd2VWTlFTSHdabFduQTNFekJudmg1UzZHVG51UGNiYVZzT0czM0pXTExo?=
 =?utf-8?B?N3E1WUNjVjY4R3d5RmpqbXNRdDlFR0VEZVlrUXRZcXNPRXNJdUN6OGsvU245?=
 =?utf-8?B?Zk9mSWdzMzd2aEF1R3RUTENYaTBVSE1DUmpjdHdFbVR2ZldlZVJOc2hHUEpW?=
 =?utf-8?B?cGVGRDB4ZjdiTExpNEhPaGsyUkRRMURYNHNrL2tVOEIrZUc2U1hDUm9wQkJ2?=
 =?utf-8?B?MGpBR0hPZ0VQUzA5UWMrNEVnOWwzUXFIY1JSWmdsaVdaMWVieVlBbytnUGxT?=
 =?utf-8?B?MVlVcm56amZBd2kwMmpiQjZlSXBnbmluRFZSUHBCUG8rbzFqN3drNUIwd1FQ?=
 =?utf-8?B?eVllOXNXNXRWRk9Mb0xBME1QK1k0ek5Bbk4yYS84blplcXgvRnN3SXZXdDJN?=
 =?utf-8?B?Z1FBZjJxNEdZM2g2dHVMcVFBNjZoeXFWdENsRHNBUFpQYWNScHNnKzZxQk5i?=
 =?utf-8?B?akRKUjdNVUIxbjZrYUNpVGcrZkZPL0k1ZXRGcUYycm9OdXdLaEt1RHdHMG1u?=
 =?utf-8?B?bHFKTzhPVjBZUnBxbTVXSGpwUlBHcGQ2MnFsWHkrekxPdXJkU0VZL1FKeHFY?=
 =?utf-8?B?NjlhZzlzNkh3STRJRmhsRDlpbk9vWXNzWnE3Tm9EWHZiaTZwUWFCVEFreCtH?=
 =?utf-8?B?bm5yRHhxREs5YjA5c0FOVjgyZml1V2dRNURNdjVWMWJPb3hzMC94ZkV4RVh1?=
 =?utf-8?B?TnRSZG9wSlpKdzl1K3JRSjloVkZ0UTIvZVR1anN2R29FMmc0R0ExN3Mvb2Rp?=
 =?utf-8?B?ME50N0ZMMFpra1lYRHpqQW8yMHVpQW1mQ2VVTFpuN2txZVBqTWhNRWY2eHY2?=
 =?utf-8?B?MXkxTXNTYWxKUUJ2ZzVWcjlmUTQ5RkNDbW82ZGhoazFyMm52eVBIR1lHMU9N?=
 =?utf-8?B?ZkJJcUZ0Qk91MnEzT1BhK2FNRldFYmhFVFJmL09RdDdsN2RQQmRmWjhZRENH?=
 =?utf-8?B?dmZETnNmbmZyZUY4YTNiQThwVWQ1K1ZCWXh1OVU4SERDV3Y0QmNCd0pqL1lT?=
 =?utf-8?B?YXlUbTNsWWJjTGFmanZxYmNMY2tTajJJOHRqTExFRytWS1RNUFZRSzcybnJD?=
 =?utf-8?B?ZFpQVVdONWg4KzY5RjFCOXA0eDRocWRWLzBCcG80Q2tjTzRlemlVWGJWWitT?=
 =?utf-8?B?OHNydDNEU2krOXdBY3RybkgzZ21XUm9oMTdPWFBJSmtUb0dGWTEzTlRlWm1N?=
 =?utf-8?B?WFZ1d1U0OWFDRERuN1BxTTB1dDlRRG9pcE9SWkJVS05TSWRjOXd3cVlPMUxC?=
 =?utf-8?B?c3RONlBnZkEwNGJDSGpLaC9NVCttSmxVc0FvTVFZMnlXOWZMQlVoaEk2c1NZ?=
 =?utf-8?B?d0NKK0JVeC94WFV1djhldHMzNHdiczlZdk5FZ2Vma2VOOVFHRUtTL0N5OVJo?=
 =?utf-8?B?U29LVkZBblZYUDl6V3h4d3VaZEN6WG5naEtudExyYlNmNGZ0K2g2OVpoQXlj?=
 =?utf-8?B?ODE1V0IrSk9HWTBzZkh4d2N3NEEyaGVSS2FtSGpTSEg3V0pHTkZZd2xyU0JM?=
 =?utf-8?B?aDU2cndlNll2cU5Gbm04SjVnZ1dZYXBxUlIvKzE1MTRqMG1aY3ZaVjFiOXYw?=
 =?utf-8?B?Q1NPaG1MSTRhbi9ySUdzSGNqZUxTNlJjd2M0MjBKVk1iTEhRbTRsNjVHVktl?=
 =?utf-8?B?KzFTMVJ0T0JDQ1RPTXBkYmlBUHpQblNWUzJHbnFsQUNpS25ZN2dFYnkvUGJx?=
 =?utf-8?B?K0V5TDJaUnZkbUVuUEd5V0dUcElMaW8vNnFqTHk2NHdLOUpUbzlxMGF4Mmtn?=
 =?utf-8?B?cUsraGY4SGc4WDhYLzJmZ2dEVXpLV1dZQ3o0YkFUaHhFTTRiRDE1dlZMVngr?=
 =?utf-8?B?eHF1eHFHSncxTkpVYjYyS1ZzQUJuN0Q2TEQwcEhad0c2N0FjMXVpcGsyZzlB?=
 =?utf-8?B?MG14aFM2Y3owdmwrN3dzZXdlV3lzUU9aUTYrSk03YzF4Q2J1ZlNhcWxLekVT?=
 =?utf-8?Q?x40RQq?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(30052699003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 11:07:44.7464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9aea6f-148d-4f33-4249-08ddd4d9786d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5928

>> Hi Danny,
>> 
>> I hope this message finds you well.
>> Thank you for the patch set — it’s exactly what we need for the I2C-over-USB feature in our new products.
>> Could you please let us know when we can expect the next version of the patch set?
>> If you've paused work on it, we're happy to take over and continue from where you left off.
>> 
>> Thanks!
>
> Thanks for reaching out!
>
> Apologies, I haven't been working on this in a while, and have only been able
> to intermittently return to attempt to bring it forward.
>
> Feel free to take over and move this forward! I'm not sure what the protocol
> is for that, as far as changelogs and versions and whatnot. If your product's
> timeline for needing this mainlined is not urgent; however, I can prioritize
> coming back to this and having a v12 submitted, likely by the end of next
> week, to remove the overhead needed for you to assume ownership of the
> patchset.
>
> The last several versions of this patchset have all revolved around trying
> to get this change working for ACPI as well as DeviceTree in such a way which
> make the ACPI and DeviceTree interface/binding acceptable to their respective
> maintainers. With this latest version, it seemed that there was not going to
> be any consensus between the two firmware languages, so it seemed an entirely
> different binding/interface and corresponding logic in the device driver
> would be needed. This seems unfortunate, as it seemed the whole purpose of
> the fwnode / device_*() functions was to unify the driver interface to the
> firmware language used... but this is presumably a special case, being almost
> exclusively a device composed of different generic device functions...
>
> Let me know if you plan to take this over and if there's any
> documentation/context/test procedures you would need from me; else I would be
> happy to start moving this forward again now that there is someone waiting
> on it.
>
> Thanks
> 
> Danny Kaehn

Hi Danny,

Thanks for your response !
Currently, your patch is working fine with our feature without ACPI.
We can use it downstream first.
Please let me know if you need any support !

Thanks !

