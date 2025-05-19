Return-Path: <linux-input+bounces-12452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075CABC7DD
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 21:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBD831883E0F
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 19:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964E71DA5F;
	Mon, 19 May 2025 19:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="qgGmqcUv"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010009.outbound.protection.outlook.com [52.103.68.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B7CB67F
	for <linux-input@vger.kernel.org>; Mon, 19 May 2025 19:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683165; cv=fail; b=sq5iC9dFK2tY8SAdeCRU2VcOzVl20Las8eJ7U88zU9Yvt0r1o4A/7uuP5YCmPDaiq8GKQqg16QAKdyKjKptbWr9yZP0MwtY6AKUqyBCcR8ZDbOJrsnR8iAYo8VBDmKFX47K9pZio1DPguuEWxmlY5BufXcWnlVyHOELPhOH4J4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683165; c=relaxed/simple;
	bh=yTq18iXBtaXYdM6We3xhjzBlgZq/uHueLdyc/N0o6lE=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tIeF02sWUwjPHqDPTq2casJcdMuVB30taJdEK1PyTsjSPgevs9nA0jzTQeKIH9qhyLAxpQGR7TdybhN5dULMKLEF6oOhxuKHPpUtvAyWj+z6RChjE2aEJvAgYD7kdZle/WcOd3ZgJztEJgC0DP7V/o1F89MV0DVU0NPXJYuzWn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=qgGmqcUv; arc=fail smtp.client-ip=52.103.68.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y65JbqdUkRzP4MiiilkxMauaNbmVnyPcBs2xMTl+EApP/dLzRUwVT2Vfls7no/QeIri7884AjFSooxV54yykJqVnMR+H2ebpDk1QGBtx1bncYLB4eXVImdHlaQuiUDYEfQCGWcdlEDDSC6V+UFzdY5GIetXA89uNxOL7OutGjW6EBHXUj2oKVQ4raBiQI5ggoJjMq5Q0+9KjsvSDxJ5JaAVlzkD+XkYowGRvKm/pHdMM2jdOKleunlmVt+eQEt6F2PSyG0W3fQxFH+NCHiEOOZZTqArbiploPe5MNLPh2KglHGr0as/DVE+TKMWpdN8rFiqGR33f731MbxRCUHxNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnXD0nqsZrd1lUOB+XpYoaEaqRJgx9qppwujLg9BZUs=;
 b=uUrEKQT35UjvBe4NQxpOKc1wcJPSTjBEK0qDOAqsbM3KradLnuDLZmfeCpWnfePorGQSIv0JAD/j2KVMmtJFZyVr7e4UOK6sfH1yiWCU3W1IWKdzMswkpqQN8UG4t2TPD9VkHTKfmbxMJLssNEvIRyb88KmRWzepTq2IP1ZxDgi6EMPd8kapvtDR9t9rIpx1QVUzew99ui7pCM5cRPZGuMi0u6KQd1ANBDnRcF0MduPu/O0SIHcHqcp3Dm8WKrKKURxvHcfvrybZOHe5zUlR1u8+ncm2z1taNTlXX5yFbeKNnG1isJzCJlz9Y3vGtwxlma3UEHDuX4LoAP92PcMAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnXD0nqsZrd1lUOB+XpYoaEaqRJgx9qppwujLg9BZUs=;
 b=qgGmqcUv3Zhp3+bza8IvjNxW6HZXa+QHF0EZ60/rjbSvrfKerzyKqJ3RGgJKgT+XiS9+PzITTIF0RHc0kePI4pTFwogNb2IHXK0BOU66e0g0mRYMnn8lOsn2aP4ZaLi56Z/eOkDJ1SsZmCzCAvvyewSLbRAsSAVMM+mKjqriHZ5yNPgmE4hpu8XBwSFKDt9InWOWb0vWG8ll1XzLhUlXE030Lj0X540f+y2X0iuzHP1nivI59dvja4aIWTAlI4G1YJ9BYkiBjd3tBMBxDg5qNtF2BLy6nQo7dDYIaoxrTZ/OpyivOER3R0IGH/pP1t7mErQK9qjQ9fF00b010xq1mQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9589.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 19:32:38 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 19:32:38 +0000
Message-ID:
 <PN3PR01MB9597398E16FBA8FE60F12404B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 20 May 2025 01:02:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: HID apple error with A1243 keyboard
To: Ioannis Barkas <jnyb.de@gmail.com>
References: <CADUzMVbe=9YgXfMtSDL-XAKhYnjuo-L6_s4pGiN1g1ibU-_G9A@mail.gmail.com>
 <PN3PR01MB9597F80FFCE6A1037092AC04B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959753C721C0B0C29B8F24B4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CADUzMVaZn6RTUuArHuvT9MAG=BD8HcJKh3PsQEKU08TReXzg5w@mail.gmail.com>
Content-Language: en-US
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CADUzMVaZn6RTUuArHuvT9MAG=BD8HcJKh3PsQEKU08TReXzg5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::28) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <1da7969e-db2d-41fb-a846-564123714117@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PR01MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e2854f-bdb8-4894-e658-08dd970be8e6
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrMi34iUpeHrvUBJkG+6rPgnI6J9YdQ/cvEdmeG9SHo1KxxFDCryxOHDp7u06el3UQujseLs6L1f0H6WUpTYXTwJ+Uuc0y7C8MQ7XUT9Sb568mgWa7tXYei9JqFNKB5xbwHRHaTeceEeoDFewM7CkPkUwlO5Z9CYXizWinTF/YH/wkc+x9wkcY/d8XYKXaqdqITg3NDKDNyCp0IAm1LuoJ6cY6WqfMIjsDTaBwIGimiUfWMJlW9W89hJtgsY26Q2NeTGQn0I97P2IMiWJSRS3KjTAL9LjMtmMi/otQtq/FjSKw0yOcHWWH+Zjtx4wZCBsQy9UExPcpwyBBgXONvtBIRfD2A3ub8tzkcBHC63hAKVF2kYD3RmBn+IrevbK5AkA1ASIgs6IDlWVHFcFeH85KyVDCzbbcw3ZNFB4hs6glhZnad1/1sUN1Y2MyH1RriQIedYwJ/hYRUFRs6NcCDlzI1/l0uj9CqD6Xz40IXAOp8Jb/egNDzDQHHqC8hVdXj3rS06lRQt1HfGLEwJSHXzXn+6RlmsVOq/tAwz9sLtdu8Uwa0AkyXMmUO/tx6+RUVwynjfSXtsoiLchL/cyy5cFO1n5G42c/wiwHmjeKpAcd7sPs4StvTcQ2K/VRyTMpt4YOhmooVFysEH93LUZadVwqMfnxVbcMeXc6E+Fokm4n+WfVMMhZ38CUmNfMW7U6YjMvCM4TccbKe20A8Mt7nYatMcktDrXLNuP4Yrjx4xD00kIiAr9Ce1qxhkBt4CGB94sgc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|7092599006|19110799006|8060799009|6090799003|5072599009|461199028|440099028|3412199025|34005399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3lVUTN0UElzM1dVNHpYSk9sckR4c05vVWNnM1NpZmcwelZlYU1nNzJHZmtn?=
 =?utf-8?B?TWJPRVErQVFObjJtUTU4QXNjKzluV0U3T25Kc1N3ak81ZG91SG5pdzIva1Fu?=
 =?utf-8?B?MG9nZ0VWc0FBQTdEeWZSOHhWem1ONFlGbkZjd0c0T1FmcXloNkF6bGhCQTVp?=
 =?utf-8?B?QTcyektNTjVHWm9pTmJYWW4xaDVrb25zUUdGcG9md3JZOHdaOG43OTZSN2E3?=
 =?utf-8?B?aUtvWGFwWFJlbGRmZ0hYUTJ6L0pieWZhRUpzeExsU204SDJmYlJVaTFnSzd1?=
 =?utf-8?B?ejhoVnRrdmY0WlpGRlVhRElpY0M4U1pwRDhEMUwyUVlROXJXckgrMFdsYU1r?=
 =?utf-8?B?K1FKV29FVjRMMllEb1JrQlZoM2s4S0NhUUV4VFhTSzl3ZTRrOWFVWWlqTUJV?=
 =?utf-8?B?QXgzMi93ZGJpR0VaNjBzU2FIQXpFSjBuY2FWeGh0RDdwNlZRMU5hWG9jY2pM?=
 =?utf-8?B?WDJqR05keVpPTGw4SHRUbXRJVjNSdzRqVU5XQ2U4ak55VnV4L2FLK2t6ZTdH?=
 =?utf-8?B?Wk53dEMrcEUzbWVQcVYveEM5dVlTV2N0NGw3RlZOanBWN1NFcE9ka1QyeVZs?=
 =?utf-8?B?TE50VEc2TStjZEIxNzRUSUt1UnFmVUllNmFlUXVEVE9SNHlyVU4wdWZxSXdj?=
 =?utf-8?B?Y2ZPTGd4S2N4YzV4bU1rWjV6ZWxCT1hVN0NXc0NmakZaNUVaRTYyWEgrQ0ZK?=
 =?utf-8?B?bnZJOHRtK2JVZDBwVjZmMTBBS0dmYTFXNDMvVkV3cHprREtIaWhUcWVQTjVo?=
 =?utf-8?B?bTdpQXc2Skg4V1JGS1R3dnVja3BpUUM2TU5BQlFGRFlkQ25KQy91RGI2bkJo?=
 =?utf-8?B?aktFQlgxNUx4WHhwTHVQUk9QUElpK2VkeVk4WUFGMkpDUzlXTEZlYjl4SFJa?=
 =?utf-8?B?ZXR6RTFtRHpLM05GVllKRHpCZ01UeHcvZER3TVEwWUg1bWMrSGsyeFlQeHVY?=
 =?utf-8?B?RWVCUHV2dVBvWUNZV1lleFZQNUVkNDJHcnRVYy9HQnFxODBMWVJrVXB4WjNV?=
 =?utf-8?B?N05tamRMZi9sZFN3YWZaZnE2NlNVdXRiRW01RzNVb2wrWVo0MjljQXNjZmNT?=
 =?utf-8?B?WUNqcXhPY3ZFZTVLTCt4cm1LZkIrNlhiY0dzdzJIU092bFMxLzRNMXV1L0ND?=
 =?utf-8?B?eGVPaGxXWXJ1NVFVa1ZnTDNXalpBQ2hQNm8xMzNoNWpVYVBnNlFXZEdpNElV?=
 =?utf-8?B?V0ZMRW9ZQnBCc0pYRngyc000NDNwTnhmSlk1RjMrMGE5L0tZUmdsVGdNd0Ju?=
 =?utf-8?B?ZVFicFFwWWFUemREMmNKYndnL2xXTlR3aExlRzcveVl5azYrL2daVS9pcm9J?=
 =?utf-8?B?Q0t2QU83RDI2dGZoU1lUTkhFUURZMmsrZlFMcTVUemJoejBFK0lVNE9nRDI3?=
 =?utf-8?B?VSs3bW4yamIyc2hXdHFLKy8raUNiWDh1akJVUnUwSWN3cWdoWHJXKy9ROUtm?=
 =?utf-8?B?eDU5NnowRVE4MjFkWStpbHZhZlRVeWtQb3lrSm9QcFlpU3ZKM1NVZDl2aWQy?=
 =?utf-8?B?V3dEd2RtWkZNKzAwWjhJL20vWUtteTJGVHpOUU96cU5FZHJCbG8rQW9hUzVI?=
 =?utf-8?B?cytpRTNFWUo3UWF0b2hRcmczTWVqZXR1NnBndCtIeEpzWUszRER6dE1raVBG?=
 =?utf-8?Q?4jm1vzBYA9CnhHP8wob1h/gvgZza4dJRpnXi8/pRJwUc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkVkN00vRGMweks3dTFxcEd0NkxuV2pkZnlHWUkySElEWS9EV3JMSkhZdGRU?=
 =?utf-8?B?ZEVGODJCajlwZ3ZGTFpVSjJZWmxpZGpGVFEvdm94ajVCM3RjWHdISVEvTldZ?=
 =?utf-8?B?SG1vYmpHaXduUjhrT3JFWDBCQngwZW1MakwrUUJQMmdteXlKNk13UlQyQTdW?=
 =?utf-8?B?TzdjZzQwcjV1USs2T29ndFl0UTFLdzYrd3JwYWduaExZZDJhYkhNMmJNbE5J?=
 =?utf-8?B?NjJCV2ljamRzV2NkZmdXcEhNcXgwbzd1eFltajRKS08yczErWVNYa1FTMjNy?=
 =?utf-8?B?Z2ZVUUtkN0Q1UDY2ZnpuWXluak00ZjgvWDNob2k1Q3BidmJuUU1VbVdYbktJ?=
 =?utf-8?B?a0xma21BTnorajNFRWpTVDdvQ1dHN2htOFRuRnE5ajdUc2JVblRjOTZwNFJp?=
 =?utf-8?B?ZlE3TGg3Q1RFN0lCNG5KQm9XdzBXYktKRjhjZDI4NkpRVHVNbTlxQUx3YU9x?=
 =?utf-8?B?ZUpkdmF3N3JHMmFFMDl2WFhvNy94bnpYWnE5aHcrU29nR29DZzVtY2RlZFRG?=
 =?utf-8?B?dU5aSExCclNwbm04Q2prTkNIdHhhcWlYNlRMREhSSEhEdWZzRmZsS2VaY2JV?=
 =?utf-8?B?UDBDVDFQT3B5U1I4YWk3R0wwUkVwSGJTMG9XbTUyUnhwWmVuamVuUWJuR2M2?=
 =?utf-8?B?cERFajc5a0t6M0NsS1VMRVd3OERybUNKMWdiNTVoVk5KOUJHVWkyY1VFY29u?=
 =?utf-8?B?Z1JESmcveWNTTFlqU2hmVDhJMEtXZGhoNXgyTkRNc0tTYjdaays5cEpUUUVH?=
 =?utf-8?B?dGtFUEtkUjlPRFptY1hIZTZab2tDR1NZalI4cUsyWm9nWDB1WGhRWnZuYlRB?=
 =?utf-8?B?QW5Jelp2RXZkby9qRkwyQWlZckJEa2Q0SlhZRWJqZEtsbi85NTBtL0R1NWNj?=
 =?utf-8?B?aGVXREVVSDhJZi9ERjA4dzYzNm9LdkRNL1RjR1c4L1RDd2lTOXFmMHVOVXdv?=
 =?utf-8?B?aG5kaFVaNVp5REc4dG9pY3hpTy9Cd2orM2JkU3pMTDBtcVZSYjVydkJrbzhz?=
 =?utf-8?B?YmFaUWlCdG9laS8wb0VXdXR4aU5nWTNGTnZRNkdKN0MveTEyYWUwbDlxMm1V?=
 =?utf-8?B?aWRHQURZQXhOd3VFWElUMk8rT2RIWCtBZUZWYWU0eEJTcW9Yby9PZFM0Rko2?=
 =?utf-8?B?MjBQRm9vNVloYjY2NmJuRm01T3RVMGlMaUkrS3kyNkVYK292c3IyVTJYZW8y?=
 =?utf-8?B?YXlRdmVYR2xjZUFvWEZnQmdCN0hodmNaUlltWVB1b0JQbkV4anAyMjZEUEM4?=
 =?utf-8?B?UFUwY1Z5b1pBd1R5ZE82SW5DQXFrVjFVRFNNQW01ZVdQdHEwcC9CM0hSRFVw?=
 =?utf-8?B?TkV0VU5qTWN5MS81UzF6cXFEOEx4ZStndFN4KzlOWDVYYWZaUEhTbEVrZTZp?=
 =?utf-8?B?YjhIbTJwTXU1ZnM2U0JqK09vVzFyYkdUem9DMFN5NkdkWThrT2hYTUQxdWp4?=
 =?utf-8?B?WUlNd1dHVkZ0TDI5eWExeFdIeHlzdnJQaXk1OERrZ2F1ek1rYkJ0d0ZIUjJt?=
 =?utf-8?B?QmNZZjVQQnk0MWFJVmJRVlZyQm5OeXlrd1BGQ292dFY1VnFJREo1MXB2TWEw?=
 =?utf-8?B?T2lNdVgrOVdkZFlWOXF5dEdZc2txclQxNVdodTlaazBMSE0yaGlZcFdyeG54?=
 =?utf-8?B?aG53NXJoaWVVZVI3UGVFdmM5WGNsbVJkdS9LOTMxQjFlWDgzNDBlZHZtNmh1?=
 =?utf-8?B?STBhWmhjTld6WlY2QnJsd2N2Uk9sZGZ6aXUwbGNyMmRPZzRRQ0ljYllpWVZE?=
 =?utf-8?Q?j1rXG1Ytgf+VZgtGpY=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e2854f-bdb8-4894-e658-08dd970be8e6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:32:36.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9589



On 20/05/25 12:30 am, Ioannis Barkas wrote:
> Hello Aditya,
> 
> Thank you for looking into this! Issue appears to be present on old
> kernels as you can see below. This time I tested it on PC.
> 
> Fn works fine as expected with kernel 6.12.15 @PC:
> [  137.137645] input: Apple Inc. Apple Keyboard as
> /devices/pci0000:00/0000:00:12.2/usb2/2-2/2-2.2/2-2.2:1.0/0003:05AC:0250.0006/input/input24
> [  137.282472] apple 0003:05AC:0250.0006: input,hidraw2: USB HID v1.11
> Keyboard [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input0
> [  137.282660] apple 0003:05AC:0250.0007: Fn key not found (Apple
> Wireless Keyboard clone?), disabling Fn key handling
> [  137.282703] input: Apple Inc. Apple Keyboard as
> /devices/pci0000:00/0000:00:12.2/usb2/2-2/2-2.2/2-2.2:1.1/0003:05AC:0250.0007/input/input25
> [  137.338545] apple 0003:05AC:0250.0007: input,hidraw4: USB HID v1.11
> Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1
> 
> Fn works fine as expected with vanilla debug kernel 6.6.0 @PC:
>     3.504563] bus: 'hid': __driver_probe_device: matched device
> 0003:05AC:0250.0006 with driver apple
> [    3.505099] bus: 'hid': really_probe: probing driver apple with
> device 0003:05AC:0250.0006
> [    3.505649] apple 0003:05AC:0250.0006: no default pinctrl state
> [    3.506334] apple 0003:05AC:0250.0006: Fn key not found (Apple
> Wireless Keyboard clone?), disabling Fn key handling
> [    7.248274] apple 0003:05AC:0250.0006: input,hidraw4: USB HID v1.11
> Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1
> [    7.248854] driver: 'apple': driver_bound: bound to device
> '0003:05AC:0250.0006'
> [    7.249456] bus: 'hid': really_probe: bound device
> 0003:05AC:0250.0006 to driver apple
> 
> Fn works fine as expected with debian kernel 6.1.137d @PC:
> [    3.118620] apple 0003:05AC:0250.0005: input,hidraw4: USB HID v1.11
> Keyboard [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input0
> [    3.118765] apple 0003:05AC:0250.0006: Fn key not found (Apple
> Wireless Keyboard clone?), disabling Fn key handling
> [    3.378932] apple 0003:05AC:0250.0006: input,hidraw0: USB HID v1.11
> Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1
> [    6.746946] usbcore: registered new device driver apple-mfi-fastcharge
> 
> Pressing F11 lowers the volume. Pressing it along with Fn key results
> in maximizing the active window as expected. Log entry is false for
> sure.

If it is false positive, I don't really find it worth tracing the root
cause, especially when I myself don't have a hardware to reproduce this
thing. Still, I've Cced Jiri and Benjamin who might know a bit more about
this. Although, honestly speaking, I wouldn't really care as long as it
works.

> 
> Device has 2 hid raw entries 0, 4. hid logs were captured using debian
> kernel 6.1. Initially Fn key was pressed and then F11 or F11+Fn. No
> other key was pressed.
> 
> hidraw0:
> # Apple Inc. Apple Keyboard
> # Report descriptor length: 47 bytes
> #   Bytes                          // Field Name
>        Offset
> # ----------------------------------------------------------------------------------
> # 🮥 0x05, 0x0c,                    // Usage Page (Consumer)
>           0
> # 🭬 0x09, 0x01,                    // Usage (Consumer Control)
>           2
> #   0xa1, 0x01,                    // Collection (Application)
>          4
> # 🮥 0x05, 0x0c,                    //   Usage Page (Consumer)
>           6
> #   0x75, 0x01,                    //   Report Size (1)
>          8
> #   0x95, 0x01,                    //   Report Count (1)
>          10
> #   0x15, 0x00,                    //   Logical Minimum (0)
>          12
> #   0x25, 0x01,                    //   Logical Maximum (1)
>          14
> # 🭬 0x09, 0xcd,                    //   Usage (Play/Pause)
>           16
> # ┇ 0x81, 0x06,                    //   Input (Data,Var,Rel)
>          18
> # 🭬 0x09, 0xb5,                    //   Usage (Scan Next Track)
>           20
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          22
> # 🭬 0x09, 0xb6,                    //   Usage (Scan Previous Track)
>           24
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          26
> # 🭬 0x09, 0xb8,                    //   Usage (Eject)
>           28
> # ┇ 0x81, 0x06,                    //   Input (Data,Var,Rel)
>          30
> # 🭬 0x09, 0xe2,                    //   Usage (Mute)
>           32
> # ┇ 0x81, 0x06,                    //   Input (Data,Var,Rel)
>          34
> # 🭬 0x09, 0xea,                    //   Usage (Volume Decrement)
>           36
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          38
> # 🭬 0x09, 0xe9,                    //   Usage (Volume Increment)
>           40
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          42
> # ┇ 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)
>          44
> #   0xc0,                          // End Collection
>          46
> R: 47 05 0c 09 01 a1 01 05 0c 75 01 95 01 15 00 25 01 09 cd 81 06 09
> b5 81 02 09 b6 81 02 09 b8 81 06 09 e2 81 06 09 ea 81 02 09 e9 81 02
> 81 01 c0
> N: Apple Inc. Apple Keyboard
> I: 3 5ac 250
> # Report descriptor:
> # ------- Input Report -------
> #    | Report size: 8 bits
> #   Bit:    0       Usage: 000c/00cd: Consumer / Play/Pause
>            Logical Range:     0..=1
> #   Bit:    1       Usage: 000c/00b5: Consumer / Scan Next Track
>            Logical Range:     0..=1
> #   Bit:    2       Usage: 000c/00b6: Consumer / Scan Previous Track
>            Logical Range:     0..=1
> #   Bit:    3       Usage: 000c/00b8: Consumer / Eject
>            Logical Range:     0..=1
> #   Bit:    4       Usage: 000c/00e2: Consumer / Mute
>            Logical Range:     0..=1
> #   Bit:    5       Usage: 000c/00ea: Consumer / Volume Decrement
>            Logical Range:     0..=1
> #   Bit:    6       Usage: 000c/00e9: Consumer / Volume Increment
>            Logical Range:     0..=1
> #   Bit:    7       ######### Padding
> ##############################################################################
> # Event nodes:
> # - /dev/input/event5:  "Apple Inc. Apple Keyboard"
> ##############################################################################
> # Recorded events below in format:
> # E: <seconds>.<microseconds> <length-in-bytes> [bytes ...]
> #
> 
> 
> hidraw4:
> # Apple Inc. Apple Keyboard
> # Report descriptor length: 75 bytes
> #   Bytes                          // Field Name
>        Offset
> # ----------------------------------------------------------------------------------
> # 🮥 0x05, 0x01,                    // Usage Page (Generic Desktop)
>           0
> # 🭬 0x09, 0x06,                    // Usage (Keyboard)
>           2
> #   0xa1, 0x01,                    // Collection (Application)
>          4
> # 🮥 0x05, 0x07,                    //   Usage Page (Keyboard/Keypad)
>           6
> # 🭬 0x19, 0xe0,                    //   Usage Minimum (224)
>           8
> # 🭬 0x29, 0xe7,                    //   Usage Maximum (231)
>           10
> #   0x15, 0x00,                    //   Logical Minimum (0)
>          12
> #   0x25, 0x01,                    //   Logical Maximum (1)
>          14
> #   0x75, 0x01,                    //   Report Size (1)
>          16
> #   0x95, 0x08,                    //   Report Count (8)
>          18
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          20
> #   0x95, 0x01,                    //   Report Count (1)
>          22
> #   0x75, 0x08,                    //   Report Size (8)
>          24
> # ┇ 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)
>          26
> # 🮥 0x05, 0x08,                    //   Usage Page (LED)
>           28
> # 🭬 0x19, 0x01,                    //   Usage Minimum (1)
>           30
> # 🭬 0x29, 0x05,                    //   Usage Maximum (5)
>           32
> #   0x95, 0x05,                    //   Report Count (5)
>          34
> #   0x75, 0x01,                    //   Report Size (1)
>          36
> # ┊ 0x91, 0x02,                    //   Output (Data,Var,Abs)
>          38
> #   0x95, 0x01,                    //   Report Count (1)
>          40
> #   0x75, 0x03,                    //   Report Size (3)
>          42
> # ┊ 0x91, 0x01,                    //   Output (Cnst,Arr,Abs)
>          44
> # 🮥 0x05, 0x07,                    //   Usage Page (Keyboard/Keypad)
>           46
> # 🭬 0x19, 0x00,                    //   Usage Minimum (0)
>           48
> # 🭬 0x2a, 0xff, 0x00,              //   Usage Maximum (255)
>           50
> #   0x95, 0x05,                    //   Report Count (5)
>          53
> #   0x75, 0x08,                    //   Report Size (8)
>          55
> #   0x15, 0x00,                    //   Logical Minimum (0)
>          57
> #   0x26, 0xff, 0x00,              //   Logical Maximum (255)
>          59
> # ┇ 0x81, 0x00,                    //   Input (Data,Arr,Abs)
>          62
> # 🮥 0x05, 0xff,                    //   Usage Page (Reserved Usage
> Page 00FF)   64
> # 🭬 0x09, 0x03,                    //   Usage (Reserved Usage 0x03)
>           66
> #   0x75, 0x08,                    //   Report Size (8)
>          68
> #   0x95, 0x01,                    //   Report Count (1)
>          70
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          72
> #   0xc0,                          // End Collection
>          74
> R: 75 05 01 09 06 a1 01 05 07 19 e0 29 e7 15 00 25 01 75 01 95 08 81
> 02 95 01 75 08 81 01 05 08 19 01 29 05 95 05 75 01 91 02 95 01 75 03
> 91 01 05 07 19 00 2a ff 00 95 05 75 08 15 00 26 ff 00 81 00 05 ff 09
> 03 75 08 95 01 81 02 c0
> N: Apple Inc. Apple Keyboard
> I: 3 5ac 250
> # Report descriptor:
> # ------- Input Report -------
> #    | Report size: 64 bits
> #   Bit:    0       Usage: 0007/00e0: Keyboard/Keypad / Keyboard
> LeftControl         Logical Range:     0..=1
> #   Bit:    1       Usage: 0007/00e1: Keyboard/Keypad / Keyboard
> LeftShift           Logical Range:     0..=1
> #   Bit:    2       Usage: 0007/00e2: Keyboard/Keypad / Keyboard
> LeftAlt             Logical Range:     0..=1
> #   Bit:    3       Usage: 0007/00e3: Keyboard/Keypad / Keyboard Left
> GUI            Logical Range:     0..=1
> #   Bit:    4       Usage: 0007/00e4: Keyboard/Keypad / Keyboard
> RightControl        Logical Range:     0..=1
> #   Bit:    5       Usage: 0007/00e5: Keyboard/Keypad / Keyboard
> RightShift          Logical Range:     0..=1
> #   Bit:    6       Usage: 0007/00e6: Keyboard/Keypad / Keyboard
> RightAlt            Logical Range:     0..=1
> #   Bit:    7       Usage: 0007/00e7: Keyboard/Keypad / Keyboard Right
> GUI           Logical Range:     0..=1
> #   Bits:   8..=15  ######### Padding
> #   Bits:  16..=55  Usages:
>               Logical Range:     0..=255
> #                   0007/0000: <unknown>
> #                   0007/0001: Keyboard/Keypad / ErrorRollOver
> #                   0007/0002: Keyboard/Keypad / POSTFail
> #                   0007/0003: Keyboard/Keypad / ErrorUndefined
> #                   0007/0004: Keyboard/Keypad / Keyboard A
> #                   ... use --full to see all usages
> #   Bits:  56..=63  Usage: 00ff/0003: Reserved Usage Page 00FF /
> Reserved Usage 0x03 Logical Range:     0..=255
> # ------- Output Report -------
> #    | Report size: 8 bits
> #   Bit:    0       Usage: 0008/0001: LED / Num Lock
>            Logical Range:     0..=1
> #   Bit:    1       Usage: 0008/0002: LED / Caps Lock
>            Logical Range:     0..=1
> #   Bit:    2       Usage: 0008/0003: LED / Scroll Lock
>            Logical Range:     0..=1
> #   Bit:    3       Usage: 0008/0004: LED / Compose
>            Logical Range:     0..=1
> #   Bit:    4       Usage: 0008/0005: LED / Kana
>            Logical Range:     0..=1
> #   Bits:   5..=7   ######### Padding
> ##############################################################################
> # Event nodes:
> # - /dev/input/event4:  "Apple Inc. Apple Keyboard"
> ##############################################################################
> # Recorded events below in format:
> # E: <seconds>.<microseconds> <length-in-bytes> [bytes ...]
> #
> # Current time: 21:36:37
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000000.000073 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000000.103860 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000000.951703 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000001.071739 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000001.943577 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000002.055507 8 00 00 00 00 00 00 00 00
> # Current time: 21:36:40
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000002.800115 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000002.903383 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000005.911108 8 00 00 44 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000006.031015 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000006.422933 8 00 00 44 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000006.502931 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000006.950889 8 00 00 44 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000007.046852 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000008.702397 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000009.582293 8 00 00 44 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000009.742416 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000010.462202 8 00 00 44 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000010.606141 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000011.118016 8 00 00 44 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000011.254024 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000011.677916 8 00 00 44 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000011.870311 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000012.229851 8 00 00 00 00 00 00 00 00
> 
> Best regards,
> Ioannis
> 
> 
> On Mon, 19 May 2025 at 21:28, Aditya Garg <gargaditya08@live.com> wrote:
>>
>>
>>
>> On 19/05/25 10:45 pm, Aditya Garg wrote:
>>> Hi Ioannis
>>>
>>>> Hello guys,
>>>>
>>>> I am getting a wrong print with the A1243 wired keyboard:
>>>> [  339.368030] usb 1-3.3.1.2: new low-speed USB device number 8 using xhci_hcd
>>>> [  339.460199] usb 1-3.3.1.2: New USB device found, idVendor=05ac,
>>>> idProduct=0250, bcdDevice= 0.74
>>>> [  339.460217] usb 1-3.3.1.2: New USB device strings: Mfr=1,
>>>> Product=2, SerialNumber=0
>>>> [  339.460218] usb 1-3.3.1.2: Product: Apple Keyboard
>>>> [  339.460219] usb 1-3.3.1.2: Manufacturer: Apple Inc.
>>>> [  339.469425] input: Apple Inc. Apple Keyboard as
>>>> /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3.3/1-3.3.1/1-3.3.1.2/1-3.3.1.2:1.0/0003:05AC:0250.000F/input/input18
>>>> [  339.556178] apple 0003:05AC:0250.000F: input,hidraw12: USB HID
>>>> v1.11 Keyboard [Apple Inc. Apple Keyboard] on
>>>> usb-0000:00:14.0-3.3.1.2/input0
>>>> [  339.558624] apple 0003:05AC:0250.0010: Fn key not found (Apple
>>>> Wireless Keyboard clone?), disabling Fn key handling
>>>>
>>>> I get this with kernel 6.14. Fn key is present for sure and it is
>>>> definitely not disabled since it works fine! Same applies to the
>>>> onboard Fn key of the laptop.
>>>>
>>>> Looks like the detection logic needs some adjustment.
>>>
>>> Was the issue present with older kernels as well? And, is fn toggle working
>>> as intended, i.e., is the log a false positive?
>>
>>
>> Following up, it would be better to get the hid device recorded.
>>
>> Download hid-recorder from here: https://github.com/hidutils/hid-recorder/releases/download/0.6.0/hid-recorder.zip
>>
>> Extract the binary from the zip file. Then run `sudo /path/to/hid-recorder | tee hid.log`
>>
>> After running this, choose your keyboard for recording. Then spam the fn key multiple times.
>> After that kill the terminal and share the hid.log file created.


