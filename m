Return-Path: <linux-input+bounces-5702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66DB957E06
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 08:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70927B2303D
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 06:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9483D16B381;
	Tue, 20 Aug 2024 06:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n2DExOV0"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177EA2A1B2
	for <linux-input@vger.kernel.org>; Tue, 20 Aug 2024 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724135070; cv=fail; b=AjN9D+iM63a0ZzCrTsDg/42Ddn8NAcoSEj7kPyU7q6OvfxBRnMAIMgpkw2svVMyXGf7x29YT/ym+amF0G3SWRKu8O8se3Zn+G6v0U/JBUpEQXaOjYoGSz70My6jmu34AVGwWtxx2y/1M7aRgQl10nkdSOwwRvGVLLkXyyg8NX0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724135070; c=relaxed/simple;
	bh=qdRzTPUgjl5PkTwguBwGi2SE0uyHe+nRSiVZOn3kYag=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CAuwH2a7trVEP+eCcVDcRFt6dd3e3h1GkvI4uU0JaCkVQzBECYiK8N/TYDqaIguIY4U9hgxGHrYQ6njisqym957WKEsg8/CRHZh5g9TEXaJwGupA8hDvUkSbdn6g/9x++UyX77f2vO5ZYVUMcRmDiphBMgXn7YTau/DO/cjj+tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n2DExOV0; arc=fail smtp.client-ip=40.107.94.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9rRXM4mJDegQq6mj5Xio/zBp1Hct6hmEOCNIrn1RhrI4p/YSCiw15p+kRS4IVBMr1b9mAjPJwQ8c6ETM3qGdhacOnanehLw1t5nJY3E+TwkkezGuVbmdY8Y9Lca1JEsh2WtsIewlqmVR4n8D/dbEcVATGWeT9NGSvYnGKLZLy3A/5oo46bCy2Q9t8iY/AW7jb9NDbuKi7mB7XxqFrTE+xjEEeqGv+gmTsQ8wZvZEQzZiKhzDPjGCaMgFKP8XFsov5lj/hisOcp/cLaL5+fdNoBOaD45PM8Rk6Yppnc1WR0NIbRl41AABinHKfpjGzjbr5B5g7NF2gJe87fm/ISNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdRzTPUgjl5PkTwguBwGi2SE0uyHe+nRSiVZOn3kYag=;
 b=eFK1YGHbBekueybFNIox0Di1OUL32bIjcFf5Q6Cm6pjQiqlMUY307Gt9oRFaLSIYjAzcdZPLuG7cL9ajKIDZk1GubUGL1u6CzHXxr/B9QRSllsz94mXZd98M2r81IOE0YYZbHiP5PS6wW12HsfcrvB6bQ728RFw2maHQ7AE35KeMpf1hffug6uF96bX+e07R6bP5IVBdMJT+4/P+KYeYL6dTdvKW6SKGHrbfSwAMo3dfxuRZqeWGqJf2D1MV2YFXHON3VPMbXXtHN8jmDpqKF/QkgzYHvAd7NfYtLM50bKaR9vYcD0E1htCh5QmQopK5t4bMtoOVEOzblJiTgWxv7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdRzTPUgjl5PkTwguBwGi2SE0uyHe+nRSiVZOn3kYag=;
 b=n2DExOV0ueeXFYi0/lumEE21iFYFsIf1toM5JguMjhYZkylaXkfW6nzGpgNouNKITy684zYBlB0RlUgfT9XoGdMYpkgQGMpUSlBkvB6c6EntVmxpVrxStxQiIjyAEub4JYTo6SAabSfsqUUM1OHaQeCdcnLd+9OY4MyMlyW6lJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 06:24:27 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%7]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 06:24:26 +0000
Message-ID: <476deb3c-77c3-412b-99d1-9b0927ab1543@amd.com>
Date: Tue, 20 Aug 2024 11:54:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: BUG in amd_sfh_get_report
To: Jiri Kosina <jikos@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Nehal Shah <nehal-bakulchandra.shah@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-input@vger.kernel.org
References: <ZqlS0MWxFDsIj_Sf@codewreck.org>
 <nycvar.YFH.7.76.2408192006100.12664@cbobk.fhfr.pm>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <nycvar.YFH.7.76.2408192006100.12664@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c9261f-4637-4c6f-b3e4-08dcc0e0bd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2VFQ1R0SitERlZLTXBremJPZUtTRTBxMWxkN1gwUkZ5OFhCbVZUMHlyb0lQ?=
 =?utf-8?B?TnhSaFo3RXB1SzRFazY3TUM1UDBUKzc5QmJmem1JRGJBaHBRQW9pZUoxdWlm?=
 =?utf-8?B?TjltK3JzV2NBU3FSVjNKeWY2VkIzTFlhajlIV2ZyTmtjbkx3eDE2SXJaQjZ6?=
 =?utf-8?B?ejJ4OXZtRERtOFlRRWxYZ1dUVWFlVlpvZ1puREdEQXVUU05zY0tLQ21MeUhz?=
 =?utf-8?B?NmNkMSs3ak9PRG5UN0VtVVA1U1ZQdHBMUzVIRnQrTDcyZUswR1ExdFMrYy85?=
 =?utf-8?B?eE9zYlNuY3N2Z0g1alRFTkwyaFVCQlFrNnFLNEZDNVpxcnB3T2QzSmROZmE4?=
 =?utf-8?B?WjhWT2c4SWtocGxqbE5ySnNWb0c0TklNOGdOcS9aMmxNQ0Z5Q0F6RVpQUXRa?=
 =?utf-8?B?aVlXWmJsdmRKcWsrY1g4WUtXUy9ZL1A0bmNialh1ODJSVTdjNHJPcHRPSDlj?=
 =?utf-8?B?S2cxQUNkN2tacDdCK01iOFFCc1dxaXR0emdXdzZzYktRcytzdldra0dtY2RL?=
 =?utf-8?B?ZzFMVG1WYlJja3EyaXRtNjJScldDSFpSNENTNkNoZS81RitGQWFRTWlGVWNW?=
 =?utf-8?B?WE11aUNjMUtsVGZpbnViSDc2Q2ZFWmwvT2FrRW1ZRXhrTlZ0ZWJlNm9ZOGk1?=
 =?utf-8?B?bU55T2VBNnhvbDZBVXNzSVdmVHd5bnJPeE54SlJwcXgzRTdDTCs0bExyTkxQ?=
 =?utf-8?B?YXRZb3E1ak9ibGtqeUpXZXN3bGxzT2ZPV2tGSVAzbkFvMURSUzdZSWdTVXN1?=
 =?utf-8?B?SExJREtIUXRkNjRwLytwV0w1QkVuU2VkV1NRV2VNWTAxaktVQ25BcGIyMWp6?=
 =?utf-8?B?SFkwYUU0d3JpejJ6M1h4WnY4R29iQkxKK0ZZc1o4aXBWN1orR29CaThyK0ZY?=
 =?utf-8?B?cjg2OG9WMTJOYW1FbDlWT2Y3U0tMWnUvNnlwMzI1RTM0dFJzSktSdXJzQjFL?=
 =?utf-8?B?cnFUaWhDSWpjUU5VY0EyYTZEenVPUWJ3U3BCRFpJNmVSU2pUdUQ3K1lsOWxV?=
 =?utf-8?B?S3pCUlhhZ1k3RmhSWm9PVllQU3VEa1RRa3d4aE1NUHZqV1lSK21wYVhEYkc5?=
 =?utf-8?B?d1hUTUltZitKbDZQSkVmUGNNNlVhUmxCTklmeHBwU2JsRXlUekhvSW13UW5D?=
 =?utf-8?B?SVNCUVhNMFUrYmJUcSsrUXg3UmRxSWtNOWlnbjE1RkpLeW9CaGZHTXlvNXJ3?=
 =?utf-8?B?aSs5U0dJN2NhcTEvbjM0T3drY0xNZ0NXamE0NEFGbjVCTG0xQ2RaOVpGRS9H?=
 =?utf-8?B?cXpwR2tUSmltTWh1NGFBcmhNMmZFRFFLUmYxUGx3YUJyeEp0c05BdVU0TnBW?=
 =?utf-8?B?eE10VnYrZ29adEtXUlZoMHdrYnNIWXhiUU41bVN3VmNJZ3hKN0lsTmMySkJH?=
 =?utf-8?B?blNncjg0ejJtQ3ZmRWxHQnNpdGN1bTJVSlRGMkNaRlhtaDk2NGxwSkVkNmEz?=
 =?utf-8?B?ZHplQkdibXlrWmpUZmlJM3JlZXYvM3BLMXJnam0wQVd5bWU2SGZlMXBrS3lV?=
 =?utf-8?B?dG42dzFWWWxlMG1lM1pWUDM5ZG1WQ0N6NmlQVW1DdkcyQlg1SERXaW9mVmdr?=
 =?utf-8?B?STdFNms5ekV0RHFlQzRNMmhTMmxqdWFwb3NsYVhuMjhEQzNsaEdhSXBXeW8y?=
 =?utf-8?B?VGFGUnpPM0lLUjkvSjJrdE1Id2VaU25tSTJBRThzbUNBWlpkZnpvcFJ1dUtI?=
 =?utf-8?B?SXR1V3dXeHZqRU0zTU1HKzNaR0d4ZHZMOU1jdjBFelNrVkhRY0VnT3prdm9q?=
 =?utf-8?B?TGhWMEk3R09LQ1NNdS9YVkRURkNUSFB4RjlFMXhEUEI5RWlobVJUVHl5REk4?=
 =?utf-8?B?VFZicTFmUzVMRVcxeWJ6UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVhKbVhudDJId1lEQ3ltYTRJNHNEMFlzWXdsM21DcFpXNU9kdGpYNXNLVm92?=
 =?utf-8?B?WW9UOEZlWWp5NW5XQU13Q0F6UzhmdmFYMHhGMFpEN0Q3T21BOERkL2dXdUFp?=
 =?utf-8?B?UU9SQmFkd1l2cnN3NmNiSUExTnZPNi9vNGhFeGQzY05qQ1hvY1dERzFmQUhx?=
 =?utf-8?B?S01idnBjam41dGNUdzQzbGhCenQ2RW9yazlWTG9JaTF5TWxQT2RmNU1wYXRr?=
 =?utf-8?B?SXdic3Z4bmJENHlqOHBLV3VjREgvZFZhalkvM09sYW44NFR1NjBuNEFIN1NY?=
 =?utf-8?B?aFJzVUFoSDJqM2FLNzlXWkdyaGlwcUJGWHB6M0xaMm00M1ZQenRWZ2hCWlZr?=
 =?utf-8?B?ekZDNEEraGlqeHh6Q0tYTDlMN0RIVWZUMkNKTzBiWXN4dzNqcjVJOVJ4eXBu?=
 =?utf-8?B?ODF0M0Z2SWE3SHVVNVVhMUJVazM0YXFlaUl6S0h2ZG9aZmZpb1Q2Q1dXYUtS?=
 =?utf-8?B?dU9Ta0JYS0lxaW5ubUh1K2pLaGhvV2UyVnUrWGlrTjIzNEtYeEMwQloySUYw?=
 =?utf-8?B?Ly9PQ2ZOemxteEJodHJuNDZ4VjJjNXl6VEprVEVudEhSUStPTkJQbVdVVWZX?=
 =?utf-8?B?MkZkZ09wVXArbSt4SnRsenU0QnMwYmpJdDNnMmFLMTBhekExMXFXa2F3Y1dO?=
 =?utf-8?B?dHN1cG5TUXJER2NHQ1VSbFZvR015aFQ5OTJFemQ4NEt4RDF2dnV0SVVSVDE1?=
 =?utf-8?B?a252MGw1bHFKMWNHelBjdDFHR01oMEp3RmtjWDIrWHh3OXUrZ0I0SnB4dVZj?=
 =?utf-8?B?ai9SN1EycW9nNU93NDVTN1JOWEowdTNwaEcwK2hZYnEzUW5nUFNKbDNhZUYx?=
 =?utf-8?B?Q0gydFY1ZGpjMWxOZ2ZKeGxybWwvN1p3ek9YWTNpYW44cGc3VHE3V3E3UDVB?=
 =?utf-8?B?T3kxa2hEc2FFcEd3MjYyYThxWFQ1cS9kLzdJd2U4eFNROWJqWVEvVWJHVjc1?=
 =?utf-8?B?VWpZY0RoVGpBdjM3ajNJZTFaZXV6UU5TVi9qZlVPalpaaS9nQVV2c0FwSC9o?=
 =?utf-8?B?RUxqQ0dOM0FlSStvMmR0TjNIZThMVVFIekhJVzdBOEs5bkdTZjl2eWgzdGVI?=
 =?utf-8?B?dDI3akVhSkFsVVY1cmxneUJNMzFIM0FacHphOFBoVzAzUlhXclZ5dTRWeHRp?=
 =?utf-8?B?dy9CZ2dLcmR6UlFiYnpETVkxMzRBQ2IyNlg1MUk0TEl5aGhKOVNhZ1hjOTZ5?=
 =?utf-8?B?N2pTU3B5ZHQyZ0tGYW41M08wbzNKcXFackpaYlo5OFBCbnRNWGxUNGUrR1hi?=
 =?utf-8?B?UkZvNFVYL0hBL0gzdkZCUmxRRGNmK29aZmdKTlNDcE5HZjZXMHJBMUJta0hx?=
 =?utf-8?B?M3YvQStDYzl4YVpSd2pERGZEVUJERVJHRlRERXZCVDNwWlFRNWtsQWNYTERY?=
 =?utf-8?B?SW5ibFN2TWppcW1JRjVqTkdYZHpQbVFUbC9nTHRlbzN6NzdmMmFSa0FMcnV2?=
 =?utf-8?B?NStOWGxJdFFNUlc3TkxNZGlHM0R2azVhUFhycElRbCtIU3o4REIyc1h1VHpJ?=
 =?utf-8?B?WmpvdzlpcElrYXpmL0U5bDRqUHVtL21Jcjl3SlRjbFlxdVV2VVFIM09pMlNL?=
 =?utf-8?B?L2NJRFZ1SUN2N2ZHRmhselRiWU1vdWhwUk9HYVlWNUVzYjZPQmRNWjljTVhL?=
 =?utf-8?B?SUduL3ZpV2JHNTJSYmd3L3h6Mi9WYXdPZkpMVDNWQis1N0dSZExOR0FadUdp?=
 =?utf-8?B?ZlYyaTM3VUdDeUNOc2RLSEZpK2xuY2hPdWxhZjBxSEM2Y2NuMW5CWUJmZ3pV?=
 =?utf-8?B?aFMxY3BRK3pzNm1HQTdub3RpaWlXZHR3OUtGS1VxMEpjZ3JjakwyUEtwWnBB?=
 =?utf-8?B?eldwYVhHQ1pmeTBMamZRM3R1Nm5pS3B2dU45NmxPMm1yQUdjdzg3NEZwcDRm?=
 =?utf-8?B?MTlJSXFiMDBhQUczdjEwNUdDU3AvckxRTTBLOFh1WUtlUDNlZzUzUCtQN1pI?=
 =?utf-8?B?SUU1cWhlOENIdlhKd1pkQ0NNVkltdXQ3Yi9Vb3FHM1poK1NWc0RKWGdPdHJs?=
 =?utf-8?B?bFFUMnVzaXZuNnBkTEhLWXU3NmJiVlo0MFpGeUM2blpROWtLaTBkcjRWSDdJ?=
 =?utf-8?B?QUtJaUI3TUxZam1WKzBjZkpBWDh0NGp0VDNWL016VTVnYWd0bzhwc1ZLL010?=
 =?utf-8?Q?elRMIzXRb16bPf1RKatTH+CCT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c9261f-4637-4c6f-b3e4-08dcc0e0bd81
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 06:24:26.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+ShmcAuR6yWnI12aAa0SqqDup2Dmh+BNScEmCKcyAg4gZ3fK+4+RBchh06syD9U6w4SksC++TgKq0mNdAL1Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865


On 8/19/2024 11:36 PM, Jiri Kosina wrote:
> On Wed, 31 Jul 2024, Dominique Martinet wrote:
>
>> Hello,
>>
>> I just rebooted my server this morning and was greeted by this bug:
> AMD folks, can did you have a chance to look into this report, please?

Yes Jiri, we tried to reproduce this issue but were unable to recreate it.
We are continuously monitoring the behavior to determine if the issue occurs again


Thanks,
--
Basavaraj

>


