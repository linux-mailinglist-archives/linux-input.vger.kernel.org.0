Return-Path: <linux-input+bounces-5125-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D8B939E2C
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 11:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F27B3281E8D
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 09:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFEF14C59A;
	Tue, 23 Jul 2024 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jq+dTMu6"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DC22097;
	Tue, 23 Jul 2024 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728093; cv=fail; b=A6oFhQAPsmT3J8gLmV4gn9hahqAS21NoXOLLpB77zvlk5rJ1WjDq6rPQ3MeSavczfT7RNluBTeCfiRJSbGgN/6Qe+CvTJfHfXefPAth00dFUiCAGky6kVpkfn9VF320ijPsLVHrz8hqxuN5ew45en9MyseYwNgd+PqEEM8PZoY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728093; c=relaxed/simple;
	bh=NSHWN5e/Cj/evtcXHA3rt/6i5JmXMA2ODJlAxhh5JiI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IhIFeh3kZsvJIcH7sP+W9W2xKnIfwJcAEuqetEi5KHzZVU+mU+syfMfqZfCjG2wDTW+K4D/1zcCeivrFeMCPsxzZuiyT41amQUh5EOkLL70AVbv0PxQBh5yF6sKT84rrpGyNs0ijQPo9XSWBvRP78smTf4ifJdbwX0kHTDSVplg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jq+dTMu6; arc=fail smtp.client-ip=40.107.95.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nh8dLNTzo6TDTKxsIy+vcvolv65aW8G+/9bbDQOWu9fU0WAGZr6suSCKj/2Vx79XIf2y78l67Cmi7IQgwJg1+bZuspbQT6bOo3bfQQaceruzzd38faAzQVLk8G4Npwt+ciEcWsGAjQA4UFxcQkQBU4NaHEzltvRl/OzAoe+DkIup9nFJ6pA3en3h5TORKirV4sB5EFjWwfahYI9MIyASMPNENbQyXMw1jiDT6MbZxevbGd927QVETvAIO099lmNfAzwSC5PsBwmwGSzMXiMUafD7iW0RsgDlAWP2o6Q553GR6dr7Ch/4m8y3Iy/srkWLtJHYc4Z+gLzAtQh0T6bbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2PaXDD+h6Rl8/F7+Lxz25Yrt1KrJ+Dp3EhwNTN3Ago=;
 b=JzoFYgXYwbAQGyR8LeXuFGGyoofDHjeFMYwdDbH2nCL0vMuXFnOlgYz3mlbm8i65dgmKHeT2xhF8dRJ38TqrvdDo6a4TF3pVt+jx1IbJmdmpn3QPe//pdQw+dsIqzry2e8qIuOVhH8/gP+wyn8ZVvOQOvoJYmsYP8rYNvcb1t90HNrbPRBnP5b7yMzNX8sXqcCxKME3W7f7R9whwTIO/83a6mMQ440TELCcKlh7GTWEkvxx6k7QH+K6dpFfNX784Nfj2gZ0p6VaSH8SPBGZPHa8cviwPupsU1+tAfQcCjj+7uxvLsYppmfR+DCawcwBp8X2puvj6TALcvHD7HuCBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2PaXDD+h6Rl8/F7+Lxz25Yrt1KrJ+Dp3EhwNTN3Ago=;
 b=jq+dTMu6q2KD0GHKwZFOr7pKtkKQhVBCgBbbE+o+sxnM5KJgW6Y4OaLz0fcCzDDmDnl/PAdHCXoii+SDU8IOHG09VYQvk/qIj1Ju773mbjht3hqkSlFzYtlrEKsG7C/m310QSpt6kg9rBaEmv1DQQLzS93QJ5D0rLBV4Kh2tc98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 09:48:08 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%4]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 09:48:08 +0000
Message-ID: <da9ccae0-504a-48d3-ade5-a16e53b4a9b5@amd.com>
Date: Tue, 23 Jul 2024 15:17:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] HID: amd_sfh (drivers/hid/amd-sfh-hid/): memory/page
 corruption
To: Benjamin Tissoires <bentiss@kernel.org>,
 Chris Hixon <linux-kernel-bugs@hixontech.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jkosina@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Li Ma <li.ma@amd.com>, amd-gfx@lists.freedesktop.org,
 Alexander.Deucher@amd.com, yifan1.zhang@amd.com,
 linux-input@vger.kernel.org, Basavaraj Natikar <basavaraj.natikar@amd.com>
References: <3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com>
 <ade43b5b-9b93-40a8-acbf-99df944b45f9@leemhuis.info>
 <11fdf362-8fa5-4d44-904b-c0c9867ebd07@amd.com>
 <f6162b22-c6c6-47d7-9bda-dd702fcc5b4b@hixontech.com>
 <kkenglf5lkvu2um3o44umdxaoeh5zgsaus73kauc6vwcqpnsfv@5i6xtjnxtb5c>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <kkenglf5lkvu2um3o44umdxaoeh5zgsaus73kauc6vwcqpnsfv@5i6xtjnxtb5c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aaad658-90e0-4d9d-cc5c-08dcaafc8ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0RSc0FNays2UnV4TGY0dzlTbzA5MXlLd0FiMzBCKzlQUjh2Z1VLbW91bGRh?=
 =?utf-8?B?ajhnZStXZHU0UnRrV05VU2RDNFA5eXFXd1BhRVYwQng2Z1VEeElBSjZCNFZl?=
 =?utf-8?B?VFJtN0NqaDYyTXp2SWEydWxHb1gybDQrMXFtTXd4UnlzVmRkS1dlQUh1SXov?=
 =?utf-8?B?dFFSWTRzbmUvb2xMcTVmcHhIOElZbkxCTVFBMFRVM3hjTlhjYlE1YWF6MTA0?=
 =?utf-8?B?MUR3TnlJMndocHg1cFlHbHIvOEFFc1VudC9mY1hQQUh0dGRBeU1obzQyT1Z6?=
 =?utf-8?B?cUlESHcyeFBOcUFXb2lHM3BhQWZ2bnAvdWQrVDV1MWxjZkk3VEdvZVhZM2xs?=
 =?utf-8?B?bmcxOFRYNlZCM2ZJNEtJblhGa3g4U2JOZjNmcytBMmExSk9CTkhINFNpVFYw?=
 =?utf-8?B?eUxBRW1obnZaTGdReTB3aVpjSDh4dmRMQ1ZUSlI2QVM1ajV3Z2R1M2RzZUx4?=
 =?utf-8?B?a0M0NWVHSGVjSUZXb2xrMndReEtSSmlkdzdpZlJ3eTlYQ1VjZk13OU1vYnhG?=
 =?utf-8?B?amtDemZzVlBRYk12NHlZN0NERUtnb3ByOE8yTXZXS25qQVplZnc0cFlDcDFi?=
 =?utf-8?B?ZDNIa3V4MUhNbFRRenZCWVdaZW16cVA2Qzhvb3Ruc2VKVFVpY21pcWdWSVhu?=
 =?utf-8?B?d3Nlbkc2RVJzM2hDdWhTajdyRzZFV3NwaHczQk5waGZ0WWY1UXgwNGNWUjhV?=
 =?utf-8?B?bjAvU1Y3ckMzeEJKRTFFNkMwaENLSjBrWUFPWElseDZJd1Y1NUl6bFVXYWtv?=
 =?utf-8?B?SGVzYm5uRTBESklUamxQeDhqMnoyQTQ5OHduNHNYZlFXRmtlbmg5MEwwbzcx?=
 =?utf-8?B?NWYwc1hPMU9GSCtGQ3poZlNQNkJIZHhrOHlNSlZ0aGtiSCtrYzVUSkVGMmg0?=
 =?utf-8?B?UHRMQTlzN0M2c2hIK0V4cHRERDhWMEZPWFdkWkMyQW1Xd0lJRnlJbFJibXkr?=
 =?utf-8?B?Z2YzL1RuNmcrdnIyU00zTFlHdVR5T240VjhTRUJKaHJDbnBucXJkWlNlekdv?=
 =?utf-8?B?NG1YeUtrYURSZnFhdXBPMnRXRXo4L1BYNmtUbkI5bnYvdHMzcmM0N1V4eGFu?=
 =?utf-8?B?cEVSaTJodzNjalpSOUdYK25vZWRlTjZxMEppRUlndTFaWUhsRkhIYW9yZWw0?=
 =?utf-8?B?N0x6MStUaGFzMW5rZ2kveWlkTGVSZnB1QnliNEJwdTZvMGptZGZNUFE1RXN1?=
 =?utf-8?B?OHlhUzEyUytqVU1LNDFxZUVCVmpNbWVWQnV5MTZkeGZONzNuYmdULzR0TkM1?=
 =?utf-8?B?Y3BwVUVmNDBYd3RnMXFnejhpMHhvN09hT2pYQ21EbUFwRGVNN0pNMkN3YXpa?=
 =?utf-8?B?QUtVTTMzWHdoMFJ3Ukw2Vk9iWjVtcFhNRStnclM4OXhwUmhxdkFvc09KNndQ?=
 =?utf-8?B?OEN0aG9XM0FhdlNpMUlpOXlqYS9jbDNnd2pjcFFidG8yRkdNMGsxejlCeHVO?=
 =?utf-8?B?YXdHb3lDNUR2VVZVTmZWNFhCdW9FdTlodUN4T1ZBWnV0UkFZWUZkQTNmMFVr?=
 =?utf-8?B?T3IvSTM2ZWl0UGorbjZwNmtFM3M0b1krYktxSWsxVnl5dWQ0QkM0dDlmOGRh?=
 =?utf-8?B?QXprRDc3bExSWnZWQ2M2K2tLVDdEU00vM2NJK1dmakRHZTVpclI2SFNuS3N4?=
 =?utf-8?B?VEdybFluWU1jekJteW9KUnJXanprb0ZPRmt3Q2hLc3A3QVVwTmE3aG45NWho?=
 =?utf-8?B?NzJDZWlpc0M1VVhaVHBGS3lPNm9NekhzUUo1b2xvNFlaQndocGR6Y2RPWWlI?=
 =?utf-8?Q?nlrm1dQ+eWB5SM0hHM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z09wZVdvVXpqRjV3UE10N1hmUXlpVTVQY0RRMEZlSGd1ckdTTUxPUXNOK3hy?=
 =?utf-8?B?TmpsVGlHUmpUZWdTVUJ5ME5uRENITUE4aW1TaVRrWTRveVdKYUVxTEdTZ2d1?=
 =?utf-8?B?RWVwZjN3Q0RPUXBmLzNmbFdSN1lCeHZDcGRQb0o1NjJhTC9hTDVkNmFWYmNU?=
 =?utf-8?B?dXV5SVpmS21yZE5PMUROdDh5UUFXdExjNWVVbDlQdDFGNDJpcUV0d1NoLzNP?=
 =?utf-8?B?aTRtOE41Skhub1N0a2NNd3l4QjdyTEw1TUNIVVF5QVFVUXpuZ21JQ1duenQw?=
 =?utf-8?B?dkwxZnMrd0hLVVFmWk9jUUQxaEpGVWhxWllibCs3d1Zkdnd0M3NuNW0yYlRa?=
 =?utf-8?B?cEFpUnFvRnJQWnpmbmxWODNLMVZjQzlzbjZjT3poTWlRVnVOUHFqTC9ZSVBy?=
 =?utf-8?B?RnhSbjFtOW5URGY2Tm9EejZmNytZOWJ4REwyMWgzeUJpcnFsZWRTUGM2RklX?=
 =?utf-8?B?UEtCalExQStuR2lMSTJpajd3d203RHJXMEdrTVIxUTZhZWllQjlDOFJ2Wnly?=
 =?utf-8?B?OUI0MGg5bTJMNUcvQVQvdjQ3aUJSNGJRajhCQWFvMzZtc3I2bzdza0NFMUFu?=
 =?utf-8?B?em03enJySWtQSTRWd1VXRGRaekpoNWlKbzRJUTRNelYzZE5vaDFrTFgyYnpY?=
 =?utf-8?B?UXdhM0pwTnY4TmpCSGFqRktkeStRZXR2clVLZWVVS3NqOTRBM2ZxUURsU0t0?=
 =?utf-8?B?OCt3alF0WWdibE5VeUI4VFE5eGx1VVBrT2hEL0xXN2R6a3hPeVhkWllTelJj?=
 =?utf-8?B?d2U2bWo3bTBuWnk5Y1FQYisydmJRaFVZQ0RDayttWHBKRmRmZFNPTUczdHhW?=
 =?utf-8?B?ZEkyTVBWVFk0SHFtTjlqK25aVVN5ZzBsUEV0UVhjeXp2MkxlOFU3S1dLends?=
 =?utf-8?B?T0JCNjF5eUMxdkRobHQrYXoyWEFCZWp0RkZGYndwVjFxL3VrdHRnRExJVXpa?=
 =?utf-8?B?b2ZjcFFySkNmR09ZejhiR0pLbUNnT1llcnprWWtOejVYMFloYnFrejIyejl0?=
 =?utf-8?B?VjN4ZGs1akYzQ3d5NGozV2w4YUVxM05EaFRJU2hhaG9ILzZqNng3cDJQT0Vk?=
 =?utf-8?B?VDJ3MUQ5MmpVWGtLZVhxc3R3ZUNJckpvWFpveW1mNk9mYTV4N2wydTdiSklP?=
 =?utf-8?B?cUh4THZ6c2g2c3o3ckNGZGpzblZwRERsUTlTQmFueDFycE5WaktMY3RhK2Qv?=
 =?utf-8?B?N09nMy8raUFPN1FmYzJSQTlXcEdPbHJ0SlVBYUk1cGRsU25oTTFOeW9rVzIy?=
 =?utf-8?B?TjhsZTJPQmlHYW4yNjYrZUsrMmMwa2w0djIwK0VkZ2VZYjZTQWlvOUgyNXNt?=
 =?utf-8?B?bVVyS295WmI3MUhyS05Pc2lUaG9hNlBuMEk2T3lDV1JZeXRiNlpYN05KQnZk?=
 =?utf-8?B?YVpyLzUwU1czaWsvWnEyRS9ZaktYNkdCemdxSDBSQnIwUjZ4WHdVeHIvVUMr?=
 =?utf-8?B?M2ZhUXlLWDhOTm1PQUgxczdqQlRxWjdVb1M0WFArT3NqZHlQV0ozNVFzdStF?=
 =?utf-8?B?YWtjWEZPWFZJOU1HSmZlK1pVSjdDK1ExMWJhOXpISy9HSW9xTkdOMkZmYzIw?=
 =?utf-8?B?UGV2ZGxKOTE4bjVhY0ZkcmU0OEd2c2UrM0M3b1hRZVd4TDR1NXU1bzEwR2NZ?=
 =?utf-8?B?djhKR2d1NG9UeWh2NDZDS0RNYWRQZHgvR3pyZHdBM253L2dsdDNJY2pYdnQ0?=
 =?utf-8?B?YmxVbnd3blYwUExieHF3LzJIUVJ6R2ZWcER6TWoxZXgwbHBCZ2pOZm9zWERa?=
 =?utf-8?B?WWRWci9IdXZFeDJrRjRQUG5jVUNOdlBuT1hIcWFsSEJDOXlobGM2Q3BXbVNQ?=
 =?utf-8?B?bER5WloyUHNPYUxUTjhxV3p5YnpubUxXdzE4OXp3SldrcTdvN2s4dzdNZ0s2?=
 =?utf-8?B?K1lzMTBpa2k5YXd6MW5sb1BmSGlGdzErWTJRVnQ1VTQveDJxWXVKNU1vRGwv?=
 =?utf-8?B?QXBEZDVUOWJrNkU4RzBidStVcW5DWmdMSDdVZWM5UTgzbEFvNlJGVzZuWCt0?=
 =?utf-8?B?ZnN5OVBlV2xNV2s5eWl5UTRvVkJmVDlQYy8rdDJtM3RySjUwdkptSTJzTXFK?=
 =?utf-8?B?SVRObXkreE5IbmI5VHVKYTJoZGdtT0xHUDBKOTdGRmNVNjhidGhLS0pkd3dU?=
 =?utf-8?Q?CWRcwi7qyowmq9/MhSXhECG3f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aaad658-90e0-4d9d-cc5c-08dcaafc8ec5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:48:08.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2+uBOXyoobaQHjqrOaqBL8PV5e+qGzv8r0eg1/Cjn4vDkrWxrfK7DEZbhQk2PmtcejlmTmr3v4Xo39ISfnFqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431


On 7/22/2024 10:00 PM, Benjamin Tissoires wrote:
> On Jul 21 2024, Chris Hixon wrote:
>> On 7/21/24 00:20, Basavaraj Natikar wrote:
>>
>>> On 7/17/2024 4:51 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 15.07.24 06:39, Chris Hixon wrote:
>>>>> System: HP ENVY x360 Convertible 15-ds1xxx; AMD Ryzen 7 4700U with
>>>>> Radeon Graphics
>>>>>
>>>>> Problem commits (introduced in v6.9-rc1):
>>>>> 6296562f30b1 HID: amd_sfh: Extend MP2 register access to SFH
>>>>> 2105e8e00da4 HID: amd_sfh: Improve boot time when SFH is available
>>>>>> It appears amd_sfh commits 6296562f30b1 and 2105e8e00da4 correlate with
>>>>> some form of memory/page corruption. 
>>>> Hi! From a quick search on lore it looks like Basavaraj Natikar who
>>>> authored those two commits is inactive since a few days. This is totally
>>>> fine, but given the nature of the problem slightly unfortunate. That's
>>>> why I'm trying to raise awareness to this report by adding the
>>>> subsystems maintainers, a few lists, and a few people to the list of
>>>> recipients that were involved in the submission of those two patches.
>>>> With a bit of luck somebody might be able to help out. Ciao, Thorsten
>>>>
>>>>> On my system, this typically
>>>>> presents itself as a page dump followed by BTRFS errors, usually
>>>>> involving "corrupt leaf" (see dmesg output below); often the BTRFS
>>>>> filesystem becomes read-only afterwards. Note that the underlying NVME
>>>>> disk seems fine, and the BTRFS filesystem does not actually appear to be
>>>>> corrupt when booted/checked from kernels without this bug (no BTRFS
>>>>> errors or I/O errors reported on non-problem kernels).
>>>>>
>>>>> I have no problems when I blacklist the amd_sfh module (any kernel
>>>>> version), or revert both commits 6296562f30b1 and 2105e8e00da4 (on
>>>>> stable, linux-6.9.y). I have no problems on any recent linux-mainline
>>>>> (v6.10{,-rc*}) when reverting these two commits (in addition to
>>>>> reverting 7902ec988a9a and 6856f079cd45 to successfully build the
>>>>> kernel). I have had no problems with any 6.6.y, v6.7.y, or v6.8.y version.
>>>>>
>>>>> It is curious BTRFS always seems involved, but problems go away with
>>>>> these amd_sfh commits reverted (or amd_afh disabled).
>>>>>
>>>>> Further notes:
>>>>>
>>>>> I have not specifically used the amd_sfh module for anything. As far
>>>>> I've been able to determine, my system has the "Sensor Fusion Hub" mp2
>>>>> chip, but has no supported sensors/sub-devices (or I need to do
>>>>> something to enable them), (or there is an error while detecting
>>>>> sensors?). All logs I've checked contain something like:
>>>>>
>>>>> Jul 09 04:14:37 arch kernel: pcie_mp2_amd 0000:04:00.7: enabling device
>>>>> (0000 -> 0002)
>>>>> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7: Failed to
>>>>> discover, sensors not enabled is 0
>>>>> Jul 09 04:15:07 arch kernel: pcie_mp2_amd 0000:04:00.7:
>>>>> amd_sfh_hid_client_init failed err -95
>>>>>
>>>>> Excerpt from lshw:
>>>>>            *-generic:1 UNCLAIMED
>>>>>                 description: Signal processing controller
>>>>>                 product: Sensor Fusion Hub
>>>>>                 vendor: Advanced Micro Devices, Inc. [AMD]
>>>>>                 physical id: 0.7
>>>>>                 bus info: pci@0000:04:00.7
>>>>>                 version: 00
>>>>>                 width: 32 bits
>>>>>                 clock: 33MHz
>>>>>                 capabilities: pm pciexpress msi msix cap_list
>>>>>                 configuration: latency=0
>>>>>                 resources: memory:fe000000-fe0fffff
>>>>> memory:fe4cc000-fe4cdfff
>>> Could you please check with the latest version, including the patch below?
>>>
>>> https://lore.kernel.org/all/20240718111616.3012155-1-Basavaraj.Natikar@amd.com/
>>>
>>> Thanks,
>>> --
>>> Basavaraj
>>>
>> Hi,
>>
>> Unfortunately, that patch doesn't fix the issue. I do get different crashes...
> Thanks for the quick testing.
>
> Basavaraj, was the patch from above an attempt at fixing that particular
> regression or was it emerging from some other means?
>
> In other words: should I apply the fix even if it's still not the
> correct one for Chris?

yes Benjamin, Please apply fix and it looks like below crash is not related to amd_sfh driver.

Thanks,
--
Basavaraj

>
> Cheers,
> Benjamin


