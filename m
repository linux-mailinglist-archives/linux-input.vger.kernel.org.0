Return-Path: <linux-input+bounces-7809-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 581CB9B7FF7
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 17:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A85AB1F21F7E
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 16:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232B51A3047;
	Thu, 31 Oct 2024 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PtpZKjDF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vPd+RE+3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D04D1B6541;
	Thu, 31 Oct 2024 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391842; cv=fail; b=R5DotP0tlYUbxsk9gZUYwpxb7gy+XPk0y8Z9upQWWZY3PCKoeZq0AKKn3LI6neSxpJQPXo0YjOVy8c8HOJ9kov/kgsi6cKV4w7RVGe+nIbjDdKfxCA3v7w41Xy0VWUhUXmGXG3Qkduler48r6kOnMvZynjWIwwM+p23G7q+llOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391842; c=relaxed/simple;
	bh=Zr3L86n57h5bAdMQLCkHxst5B0HeO95DHn20YljQM0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QWuebUXiscVCYd1pZhD95R7cYZbutgMwhtXFeZ4FORnYf5I6XS6FaU1prxyTOw/ThJ/OD56v1TXEHSBjh2w4q5PzfyX2q8k4JYhUBC14+EgUUtSPe/8XeaMgWSd7vUULFeGuKa8OfW2ADnjTmcOlEVqDjug/c3xJ/iDYt1uEkp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PtpZKjDF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vPd+RE+3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V8uF26018268;
	Thu, 31 Oct 2024 16:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=2jPCfNG3W/aE5PuJFc
	rKxlR/cNd4xKfYEi+UcfxFAS0=; b=PtpZKjDFMMhqeX0pdBa6hhqSY/0WtRjPE7
	AqhtE/YeELeZMq/9NUOXsh9biSq+Xznkk01wZfvvoUzybWq6MGDQRJrzk9CXzXQm
	x5zrdw0ifUt0kADyKfeTuGGJP3/BFIT2s2q8b2sveSf+2SLttP+BIteFfe2SwCh/
	CMR51/xbSF6DdSJ13a6/3EtFl0+s2oCKqltBY7UYt/17pc6cgDFjc3nZPsSYN9lD
	WCWj6ncxLlI19oUSk49Aoc++RCFCe9d5Os9fz/BmGQEVLLtgFIQTPHGusQlfwYoe
	Kth5aqww9mgK7gj8IIx8aN/4CYmyWwvt2/oozpZetWS/rzMf+42Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdpanx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 16:23:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49VFrLOQ008454;
	Thu, 31 Oct 2024 16:23:45 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnechx56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 16:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwV3wcCmc6AV/ZoNR85o1u1n+DUQIl9LLh+r70/0gVTE5Uo344wKf1a4+uOCzk81BJPEX7GBWqgVjxKNg/6oWGbniH7EpwyjuurOS4GNrlJsZF1e71yOKY/6fGQdjQrZQro3eRXiZANFh+OvmjBSwQxIKcHSmaFr2xZRc70ti/4gzs0pNTDR2woVZ+0Rb44xdvnBvgR7E7mfFYWJb/CUMt+JKZTtwsPKfkj+99DxsxpolaASRESZowTXL6d2+MEQxCCbHBMSnea1FtLmIcSHMzIR68ByS4yr16Ox73ntUCqJVxh8EXEpVRp0dy/YcpnbdJzOW3mQQ2HSNoIyQ+0J1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jPCfNG3W/aE5PuJFcrKxlR/cNd4xKfYEi+UcfxFAS0=;
 b=RKWOOM8ZTr9Yw7F9nLhOJ+ssqaSTsmNAtp751jYjGkLuSDTuI8FFY+XHAsDaXHdAhTjVHhNP40a5GgPXFzaXq959Kky/uXYyaKp3UuztDkfTmOt2o1aqFrqBtn/1fU9vjYkIdfa7MGVyXXE2hDiihSwA9k/IRW6ytNHeZrj2CIpKELpEWcfI0XaTzJ+A1lLE8co6430RmeP0FBwai5B2Ddo4qBZWLVZr1BDMGoCLKgQ/IsBYcDQWunM7cqm4PAbLZBrIio7lRmadCXnNKi9pG0S4GvOuWalozQtjbuNEsrL3fpEpy72fy3qs+83HaUfLDVCNsl9dG+isSEaG5WDQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jPCfNG3W/aE5PuJFcrKxlR/cNd4xKfYEi+UcfxFAS0=;
 b=vPd+RE+3uMGMa8AnNmf6WsuktoyUjj8K2vBpoe8t4gIs0c/HG1huuNJvitQyKDXSTTwK0fGgdkYQnhBJHDH9nUO1g9rwU7L/ajaSwUBmxGM23WLAVmAWDLKTSbrjMw8ZOmo68fcDRyUhkmUMvFIkBNfnm/j90K2k1NPXW7Jvl9g=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA1PR10MB7636.namprd10.prod.outlook.com (2603:10b6:806:376::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Thu, 31 Oct
 2024 16:23:40 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8114.020; Thu, 31 Oct 2024
 16:23:39 +0000
Date: Thu, 31 Oct 2024 16:23:35 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk
 (2)
Message-ID: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
References: <6723aa4d.050a0220.35b515.0161.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6723aa4d.050a0220.35b515.0161.GAE@google.com>
X-ClientProxiedBy: LO3P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::12) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA1PR10MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ee1a76-693b-44a6-cfcf-08dcf9c860e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u2iCLecDv6WQFe+uset//IXJtYf4G0wrDpPwkwAwDK18eIDq1qfW4GBETov8?=
 =?us-ascii?Q?KFLnynvpQIUgTAKdfjUxwc6kUcPUtb4pi2Xu0cHTR8Egoi9L18wqzHv5EnZV?=
 =?us-ascii?Q?td8RF5zkym0ri1gjn5+Y+n95nKLrHl7Nei3KCzYKG9VSjBXWFq6dLd5jfC1s?=
 =?us-ascii?Q?t4hPxjxJ5q2r27KISsS+KRU7QLb+ZHLe/k9rTR46WLhXFPu1rjTICIFzON3T?=
 =?us-ascii?Q?TN4ub0wkuOKho80fQxUrUzA6WJXl3kluPa4scp1bSxzOyy1MNb8csQsZ65Ak?=
 =?us-ascii?Q?FOjRpZrO/jMNQpSRcIGDYM8J4cAN7VCO3OS1YIjFTZbYxKoFm6AtnoOUHEAO?=
 =?us-ascii?Q?P//lkXix5yD/1TTHGTakM38l/6yOPU7zYxpm2w4iVgym6SaUBb2NubAR9Zu1?=
 =?us-ascii?Q?NfL2Q6WLUJZYzwjtiQOoJoq1gMNEgphuOBMGB4DccrTc+vkvHu1n/RYYaXum?=
 =?us-ascii?Q?iPzHfXx3Tuntmd8c5tirT1dDOxYvSCdb+Rb4H7XdFsViOc6FxxbzPcFw6p2V?=
 =?us-ascii?Q?MpSJjcyYgjYShWCnw2CWCVKW1jj1h2zpysghengdSP2DJ6p/wEuRTJWjsavR?=
 =?us-ascii?Q?Sod8zMixy09zXD2C0zL7ha/KGXXU7R7QTuWZo8pLYN6cjdvaM23Kk8DRhdaE?=
 =?us-ascii?Q?1qIrf1fHjyN3ypMJMVh4V1bmX+UcLogfdDjcLZ72ZUtEHyz3iTFbLodA7Pg5?=
 =?us-ascii?Q?TfEKD0+txxQPgoQrTB4yFQ4GnnrZZAoF0dg2iaK8w2iTr/ricimseOjULWTk?=
 =?us-ascii?Q?d6DummfrY7qh6lnlf0CMBprIyjgZVq0EpW70MtGW/cTYpavhFeuMmjv28iQf?=
 =?us-ascii?Q?zdgrExvC2IUQOAVZsI/nHlL8i1dPQPwodwXcWf/kSjdRq2uZ/vqELI9ireil?=
 =?us-ascii?Q?cq2t4jbxYxlcuw3qeCeaarbKutDKKjaYxTnnTSu4iB1h3fOQQ1bgBva6ChiW?=
 =?us-ascii?Q?9Sovw761RbOaO/WSjPaElsR1j6P9usavTl7YZDLEfchVF7UE733/O6UGHL32?=
 =?us-ascii?Q?VGOUEnwiQWqExZWw8SufSqXYcfTHXazhyfLpuLfzj7jmTwVmRSmyq7T8PVux?=
 =?us-ascii?Q?codgDcOwbYcB8spsC+5R4cwa3I4ZqjIWeJbkY1FstRAjikpGX8XVC9NCMp7N?=
 =?us-ascii?Q?W1J9P9zl2CKaQpnOXeL6D91bwYpmCc8lSX5j5zMYASjrTQY2d1KxKPjjTWo0?=
 =?us-ascii?Q?kP/SOq2CMIwQlUmTUglqvcTp7kDuMvoBxWTLyxZzVUpq3nalMsl+bacK/s0e?=
 =?us-ascii?Q?Q4xNpG/4RtWyANxBjmI6PVL90D1p5yhb5wtvhboe3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?32AnGLxrgU7LNNpbkiPnI4h9d5VlXx5kMVLz46D06ikyKfya8e9jQrJAxS2c?=
 =?us-ascii?Q?pnRKKhkK1vg0gzsKixpO3/mT6zc6yHDsxvnlXViy4uvwcEM7UoTxYZ8GVj08?=
 =?us-ascii?Q?b38UW2hLa+6hWDnCtPGqU8SjHO6jIT+ZEhsEcz6R9ioSDSPLKWL5uAOYlVz+?=
 =?us-ascii?Q?WAjV2g7Ahgm78JJfg+zulstaJiR4Yp8jr5AhrBnMpwFeKurjb5FfLcjc7Mpm?=
 =?us-ascii?Q?HOUhw4AWUakQ5j8piMneK5mjqHqy8oFVg7SlQ2hWy90tqw0+/0/2QK1Slpp9?=
 =?us-ascii?Q?XfeVS6MaLo724i09WbhXjibM3vqmZHuK2Mejb1xppFNxEXB8EDQkC2Uygt0/?=
 =?us-ascii?Q?Mtq9meV4TYb2JwH5iJaMdqTUyZMsRWHlrrDVl0kN3+iEKGnm5q2YhQRy1Rwm?=
 =?us-ascii?Q?6BXTmkg0MRrhhHYD7hm5/NeqBvf/B8OGX2Vncx3aAKd+k23EgBMubuEvyhiL?=
 =?us-ascii?Q?YBacKZdyT8+tXQnr7y4TNeNMRbH/Hmr1TzL7aF/nW0/FKUhfcMZdnv1x0gRM?=
 =?us-ascii?Q?jp5SzP+FcUR1xJMl+XlVanxT0PLiwXDU1YW25NLAzBwY0u7y1n5LK4nnIbh2?=
 =?us-ascii?Q?it0olbUZbLcnRQLzmnuUQDqXJu4ui6wfxa8xrpUu8Xg8Zhu46bGCRgj9FBqd?=
 =?us-ascii?Q?E26mkYrcrT76xtvJowT4cCbvk5QwxS/jEY53xdag65yyN+EkFqHDwFg31Ib0?=
 =?us-ascii?Q?DM/5Dq8PAOi+VoKpbfP0mgTAlcr9gyikjJOTNUr4uREkkVapWf1/LZQem1e5?=
 =?us-ascii?Q?POFSlhMOvImZp/KyyCY/PM5cFN9PpIP3+luHErUc2OHhcrl45BzhCnR9uQfM?=
 =?us-ascii?Q?18HvpRzqOXGpDqcpIDo0pRvTTQKNMovvb9nVAmCp6hGJPGY1h7k7ta2NFAtf?=
 =?us-ascii?Q?HVGREhZ6dLxQvWUAjq8KLlzYSM0cehoQQ8jsJf6S1kgDWLw71srgcMHHMvYw?=
 =?us-ascii?Q?ORvXHv0vEFBudo7HLAfCx/27YLQPpekvDT5fufTBEFceVukfwrRYJPuYD72m?=
 =?us-ascii?Q?ioNes8PjjDU4RMzBA59NnAuIbaPtpTds4PAB9i1kP/VJiKgs5QgS+T0jZo8D?=
 =?us-ascii?Q?f1fq4xqxHb8NJGmuKs2bWOWZv1LU26jJLvmR+YYxVqh8axoaGg7Z32N5orPh?=
 =?us-ascii?Q?7j4ISr2xXeZ7PF/LJi6eBfzKju6OPJGtjI1hGWCb4O3z4WKFQpTU9yi+B+0s?=
 =?us-ascii?Q?X7AOL7a0I2pKpxqwZ3WoDn10wuf4+JPnn4BHusEcvWfYiy1BxGFo6yFkaqH1?=
 =?us-ascii?Q?KBg/E4cHdxmcEfWvBWQ0Oa0RgxoqupiiX/zMZjHbRbZmSDZY6fasqH0lCV+U?=
 =?us-ascii?Q?ztc6xjHpN6KzgUqtV1oAcnZOea1pzGg7AIbNRdPOH3Gt6jw9LP+PWKEe4Yn+?=
 =?us-ascii?Q?2GXpZZdIlm4bUEbHQCSUshWGFgpntflkFxDQ/H0Mc5/r64yYvQbRCqzQbWUe?=
 =?us-ascii?Q?y57XkW7B2gH9BirrjfJy16zJ7t6Ejc8GCkr9mrRNdAPtbgnvTaML3lJSGPqF?=
 =?us-ascii?Q?GmHrGLtvBSSXXrMrGJ/9LJy40aR5lnMqaguNficUAbb2N/++3Jh+IgUdqZFz?=
 =?us-ascii?Q?oWVQejHM3W9tbFbeEz/67YWlFMxtdoFhJaL2C84qWsJfZI/dd8w66S7T40l6?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bQmyS+cPccm9DIMJ+HWC2WtN07GhXr6sX8TNMaT6Gu7j/awWiPzKFEqdQw07Ac9GOCt62srP3WOWSAhsufbuv3FBPVT7iaYT2UAxeQmu/OY+OEWY6kkSWu01phmN2wwDgv6sSQQG03+qW9C1w7RZCJOFcUJfH0GZnkIPzAQLYjFImST2HtfxX/VB1iBLM5frbFZ12hI/zpirM3ew1GUQjRlc4Roa2XB4TmQv9HHpfnip/cMzx/dDRjqmZ/mYTWA+PgWA1Uh3AeqC47welt3ZCKax9Kgf70NGPhqdIpDPGONlCuL0M1XmjJuzMRY6NEOXBMK53VhgZTUptnslXgzWL6fE/w72hpW90zFE5Hhly24AvAAEv+ncW+lfVLSgcFyPh7+HrK2QQsdM2Rr1MwRS7bSmwJTA2Pt9YcSIsuRqSSjtSEdryf4bfBZiY719wSJFC1HfoHYin34i4tOIG1Ji9/zuieAKrB+5qVVXMJTFONpJ9anXzPo1f4z0kt/jKXVoQBY3pu+SSWfJqeo6PL33UH2WgkITkzLs3lD9YviupraY+zoqUet5g99OFAIbgWROP6bWofskaDQkimvmCQKpej3AhMI0FwQiSeDiHCgxZPQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ee1a76-693b-44a6-cfcf-08dcf9c860e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:23:39.6669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGp0PztRrtNFuO3/sIzrJr7W8ftdlUaetWrYVg2EdiIea0lFqX8dRUItyhEcu1jSzBgm2XqC4yzB9GF3yOofkiuVstMsBo/t9q47n8JgN4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-31_07,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310124
X-Proofpoint-ORIG-GUID: qefxvs6Z3qSgISwk7Q8qd5CkE3XGLGd4
X-Proofpoint-GUID: qefxvs6Z3qSgISwk7Q8qd5CkE3XGLGd4

On Thu, Oct 31, 2024 at 09:03:25AM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    c6d9e43954bf Merge 6.12-rc4 into usb-next
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=175cbe5f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5aceb1f10131390c
> dashboard link: https://syzkaller.appspot.com/bug?extid=7402e6c8042635c93ead
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b3cca7980000
>

Not really sure what to do with these, they're all non-repro, all seem to
be stalled on some USB issue, all have CONFIG_DEBUG_VM_MAPLE_TREE which
causes _way_ more work to be done so increase the chances of a stall and
nobody seems to want to own this...

I would _strongly_ suggest that if you are doing potentially high-latency
USB testing CONFIG_DEBUG_VM_MAPLE_TREE is a bad thing to have enabled, as
this will _massively_ increase the chances of these stalls. It's a very
very heavy operation.

It's good to have in ordinary testing, but for known high-latency
hardware-related testing not so much.

It seems always to get stuck in mas_next_slot() on mm side.

Anyway...

Let's re-run this against the latest pending fix tree in mm to see what happens.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable

> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/fe53e83da4bf/disk-c6d9e439.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a9135a278859/vmlinux-c6d9e439.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/72fb7499fd06/bzImage-c6d9e439.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
>
> rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
>  1-...D } 2636 jiffies s: 1593 root: 0x2/.
> rcu: blocking rcu_node structures (internal RCU debug):
>
> Sending NMI from CPU 0 to CPUs 1:
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 10933 Comm: modprobe Not tainted 6.12.0-rc4-syzkaller-00052-gc6d9e43954bf #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> RIP: 0010:io_serial_in+0x87/0xb0 drivers/tty/serial/8250/8250_port.c:407
> Code: 68 b5 fe 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1a 66 03 5d 40 89 da ec <5b> 0f b6 c0 5d 41 5c c3 cc cc cc cc e8 78 ef 0d ff eb a2 e8 01 f0
> RSP: 0018:ffffc900001b80a8 EFLAGS: 00000002
> RAX: dffffc0000000060 RBX: 00000000000003fd RCX: 0000000000000000
> RDX: 00000000000003fd RSI: ffffffff82a08a30 RDI: ffffffff93637660
> RBP: ffffffff93637620 R08: 0000000000000001 R09: 000000000000001f
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000020 R14: fffffbfff26c6f1e R15: dffffc0000000000
> FS:  00007f1b331b7380(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f1b3323219c CR3: 0000000119252000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <NMI>
>  </NMI>
>  <IRQ>
>  serial_in drivers/tty/serial/8250/8250.h:137 [inline]
>  serial_lsr_in drivers/tty/serial/8250/8250.h:159 [inline]
>  wait_for_lsr+0xda/0x180 drivers/tty/serial/8250/8250_port.c:2068
>  serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3315 [inline]
>  serial8250_console_write+0xf5a/0x17c0 drivers/tty/serial/8250/8250_port.c:3393
>  console_emit_next_record kernel/printk/printk.c:3092 [inline]
>  console_flush_all+0x800/0xc60 kernel/printk/printk.c:3180
>  __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
>  console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
>  vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
>  vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
>  _printk+0xc8/0x100 kernel/printk/printk.c:2432
>  printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]
>  show_trace_log_lvl+0x21f/0x3d0 arch/x86/kernel/dumpstack.c:285
>  sched_show_task kernel/sched/core.c:7604 [inline]
>  sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7579
>  show_state_filter+0xee/0x320 kernel/sched/core.c:7649
>  k_spec drivers/tty/vt/keyboard.c:667 [inline]
>  k_spec+0xed/0x150 drivers/tty/vt/keyboard.c:656
>  kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
>  kbd_event+0xcbd/0x17a0 drivers/tty/vt/keyboard.c:1541
>  input_handler_events_default+0x116/0x1b0 drivers/input/input.c:2549
>  input_pass_values+0x777/0x8e0 drivers/input/input.c:126
>  input_event_dispose drivers/input/input.c:341 [inline]
>  input_handle_event+0xf0b/0x14d0 drivers/input/input.c:369
>  input_event drivers/input/input.c:398 [inline]
>  input_event+0x83/0xa0 drivers/input/input.c:390
>  input_sync include/linux/input.h:451 [inline]
>  hidinput_report_event+0xb2/0x100 drivers/hid/hid-input.c:1736
>  hid_report_raw_event+0x274/0x11c0 drivers/hid/hid-core.c:2047
>  __hid_input_report.constprop.0+0x341/0x440 drivers/hid/hid-core.c:2110
>  hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
>  __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
>  usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
>  dummy_timer+0x17f0/0x3930 drivers/usb/gadget/udc/dummy_hcd.c:1993
>  __run_hrtimer kernel/time/hrtimer.c:1691 [inline]
>  __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1755
>  hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1772
>  handle_softirqs+0x206/0x8d0 kernel/softirq.c:554
>  __do_softirq kernel/softirq.c:588 [inline]
>  invoke_softirq kernel/softirq.c:428 [inline]
>  __irq_exit_rcu kernel/softirq.c:637 [inline]
>  irq_exit_rcu+0xac/0x110 kernel/softirq.c:649
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
>  sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1049
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
> RIP: 0010:__sanitizer_cov_trace_pc+0x66/0x70 kernel/kcov.c:235
> Code: 82 30 15 00 00 83 f8 02 75 20 48 8b 8a 38 15 00 00 8b 92 34 15 00 00 48 8b 01 48 83 c0 01 48 39 d0 73 07 48 89 01 48 89 34 c1 <c3> cc cc cc cc 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 0018:ffffc90002dc7a50 EFLAGS: 00000293
> RAX: 0000000000000000 RBX: 0000000000000001 RCX: dffffc0000000000
> RDX: ffff88810fed9d40 RSI: ffffffff86e3ce73 RDI: 0000000000000005
> RBP: ffff888124e21e00 R08: 0000000000000005 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000000 R12: ffff88811972fe00
> R13: ffffc90002dc7b88 R14: ffff88811ad2a540 R15: ffffc90002dc7bc5
>  mas_next_slot+0x12d3/0x21b0 lib/maple_tree.c:4693
>  mas_find+0x2c6/0x530 lib/maple_tree.c:6059
>  vma_next include/linux/mm.h:1007 [inline]
>  validate_mm+0xeb/0x4d0 mm/vma.c:535
>  do_brk_flags+0x943/0x1260 mm/mmap.c:1781
>  __do_sys_brk+0x68e/0xa20 mm/mmap.c:197
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f1b3330fc7c
> Code: 1a 64 c7 03 01 00 00 00 eb 11 64 44 89 23 31 f6 5b 31 ff 5d 41 5c e9 41 ff ff ff 5b 83 c8 ff 5d 41 5c c3 b8 0c 00 00 00 0f 05 <48> 8b 15 d5 61 0d 00 45 31 c0 48 89 02 48 39 c7 76 12 48 8b 05 73
> RSP: 002b:00007ffd9efad018 EFLAGS: 00000206 ORIG_RAX: 000000000000000c
> RAX: ffffffffffffffda RBX: 0000000000021000 RCX: 00007f1b3330fc7c
> RDX: 00007f1b333ee1b8 RSI: 00007f1b333e6b00 RDI: 00005562a3991000
> RBP: 00007f1b333e6aa0 R08: 0000000000000000 R09: 00007f1b333e6d80
> R10: 0000000000000037 R11: 0000000000000206 R12: 00005562a3970000
> R13: 0000000000000290 R14: 0000000000001000 R15: 0000000000000000
>  </TASK>
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f2087884a90
> RSP: 002b:00007ffe718808c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f2087975860 RCX: 00007f2087884a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f2087975860 R08: 0000000000000001 R09: eb9e03d0b6065ae7
> R10: 00007ffe71880780 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f2087979658 R15: 0000000000000001
>  </TASK>
> task:kworker/u8:3    state:R  running task     stack:32568 pid:11825 tgid:11825 ppid:3004   flags:0x00004000
> Call Trace:
>  <TASK>
>  __switch_to_asm+0x70/0x70
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11826 tgid:11826 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11828 tgid:11828 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:kworker/u8:4    state:R  running task     stack:32568 pid:11832 tgid:11832 ppid:3551   flags:0x00004000
> Call Trace:
>  <TASK>
>  __switch_to_asm+0x70/0x70
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11834 tgid:11834 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11836 tgid:11836 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25344 pid:11837 tgid:11837 ppid:3004   flags:0x00004002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f596b783a90
> RSP: 002b:00007ffdaec1f738 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f596b874860 RCX: 00007f596b783a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f596b874860 R08: 0000000000000001 R09: d427ab9054769841
> R10: 00007ffdaec1f5f0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f596b878658 R15: 0000000000000001
>  </TASK>
> task:kworker/u8:3    state:R  running task     stack:28656 pid:11839 tgid:11839 ppid:3004   flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6869
>  __cond_resched+0x1b/0x30 kernel/sched/core.c:7214
>  _cond_resched include/linux/sched.h:2031 [inline]
>  stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11843 tgid:11843 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:kworker/u8:6    state:R  running task     stack:32568 pid:11845 tgid:11845 ppid:1106   flags:0x00004000
> Call Trace:
>  <TASK>
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11846 tgid:11846 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f62ec5faa90
> RSP: 002b:00007ffc77d2c6e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f62ec6eb860 RCX: 00007f62ec5faa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f62ec6eb860 R08: 0000000000000001 R09: 73127a7182c281c0
> R10: 00007ffc77d2c5a0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f62ec6ef658 R15: 0000000000000001
>  </TASK>
> task:kworker/u8:4    state:R  running task     stack:32568 pid:11849 tgid:11849 ppid:3551   flags:0x00004000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11858 tgid:11858 ppid:2989   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:11860 tgid:11860 ppid:3551   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11864 tgid:11864 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11865 tgid:11865 ppid:2989   flags:0x00004002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fe85a408a90
> RSP: 002b:00007ffe6d728978 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fe85a4f9860 RCX: 00007fe85a408a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fe85a4f9860 R08: 0000000000000001 R09: 0d6f8889d938ef07
> R10: 00007ffe6d728830 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fe85a4fd658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24000 pid:11870 tgid:11870 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:11874 tgid:11874 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f9ab6225a90
> RSP: 002b:00007ffd2d084458 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f9ab6316860 RCX: 00007f9ab6225a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f9ab6316860 R08: 0000000000000001 R09: 213f27e3772f6406
> R10: 00007ffd2d084310 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f9ab631a658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24000 pid:11879 tgid:11879 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
>  </TASK>
> task:modprobe        state:R  running task     stack:24416 pid:11882 tgid:11882 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fd1e055da90
> RSP: 002b:00007ffc2fdba8d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fd1e064e860 RCX: 00007fd1e055da90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fd1e064e860 R08: 0000000000000001 R09: 44bb0356e4044352
> R10: 00007ffc2fdba790 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fd1e0652658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11888 tgid:11888 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:11890 tgid:11890 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fed39e3ca90
> RSP: 002b:00007ffcaabe57b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fed39f2d860 RCX: 00007fed39e3ca90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fed39f2d860 R08: 0000000000000001 R09: 751a872febfbe0c2
> R10: 00007ffcaabe5670 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fed39f31658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11896 tgid:11896 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11905 tgid:11905 ppid:3004   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11908 tgid:11908 ppid:3004   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11909 tgid:11909 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f91c01d1a90
> RSP: 002b:00007fff59a721a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f91c02c2860 RCX: 00007f91c01d1a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f91c02c2860 R08: 0000000000000001 R09: 174dcf661f33f894
> R10: 00007fff59a72060 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f91c02c6658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11915 tgid:11915 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11918 tgid:11918 ppid:3551   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:11920 tgid:11920 ppid:3004   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f22572aea90
> RSP: 002b:00007fff9570b928 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f225739f860 RCX: 00007f22572aea90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f225739f860 R08: 0000000000000001 R09: 1d598a15939cff95
> R10: 00007fff9570b7e0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f22573a3658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11924 tgid:11924 ppid:3551   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:11929 tgid:11929 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11933 tgid:11933 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f0644958a90
> RSP: 002b:00007fff8866c018 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f0644a49860 RCX: 00007f0644958a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f0644a49860 R08: 0000000000000001 R09: 6c69b7350d6b595d
> R10: 00007fff8866bed0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f0644a4d658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11939 tgid:11939 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11951 tgid:11951 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24000 pid:11959 tgid:11959 ppid:3551   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11963 tgid:11963 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f58d02e0a90
> RSP: 002b:00007ffc6626d778 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f58d03d1860 RCX: 00007f58d02e0a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f58d03d1860 R08: 0000000000000001 R09: 7e2759f2076a714e
> R10: 00007ffc6626d630 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f58d03d5658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11967 tgid:11967 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f1d0649da90
> RSP: 002b:00007ffd773ed488 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f1d0658e860 RCX: 00007f1d0649da90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f1d0658e860 R08: 0000000000000001 R09: dbfdc4bed4c4ff8f
> R10: 00007ffd773ed340 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f1d06592658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11973 tgid:11973 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11976 tgid:11976 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:11984 tgid:11984 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f1385ec8a90
> RSP: 002b:00007ffcf976a3e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f1385fb9860 RCX: 00007f1385ec8a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f1385fb9860 R08: 0000000000000001 R09: fd48b3f27557a6a1
> R10: 00007ffcf976a2a0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f1385fbd658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:11990 tgid:11990 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25344 pid:12000 tgid:12000 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f622c1a5a90
> RSP: 002b:00007ffc7eb2d618 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f622c296860 RCX: 00007f622c1a5a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f622c296860 R08: 0000000000000001 R09: fb6da14796518947
> R10: 00007ffc7eb2d4d0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f622c29a658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:12005 tgid:12005 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12008 tgid:12008 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12010 tgid:12010 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fd9cbf9aa90
> RSP: 002b:00007ffddace9658 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fd9cc08b860 RCX: 00007fd9cbf9aa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fd9cc08b860 R08: 0000000000000001 R09: 742256a4a252f6b4
> R10: 00007ffddace9510 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fd9cc08f658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:12015 tgid:12015 ppid:2989   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:12018 tgid:12018 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f4008cfda90
> RSP: 002b:00007fffd5753b88 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f4008dee860 RCX: 00007f4008cfda90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f4008dee860 R08: 0000000000000001 R09: 57a0791dac7bd80f
> R10: 00007fffd5753a40 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f4008df2658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24416 pid:12023 tgid:12023 ppid:2989   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12029 tgid:12029 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24000 pid:12037 tgid:12037 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f3539f25a90
> RSP: 002b:00007ffdd9a78498 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f353a016860 RCX: 00007f3539f25a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f353a016860 R08: 0000000000000001 R09: 517fac0adb2b96eb
> R10: 00007ffdd9a78350 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f353a01a658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:12042 tgid:12042 ppid:3004   flags:0x00000002
> Call Trace:
>  <TASK>
>  prep_new_page mm/page_alloc.c:1545 [inline]
>  get_page_from_freelist+0xd5c/0x2630 mm/page_alloc.c:3457
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12049 tgid:12049 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12060 tgid:12060 ppid:2989   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f1c22cefa90
> RSP: 002b:00007fff7a4ca7f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f1c22de0860 RCX: 00007f1c22cefa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f1c22de0860 R08: 0000000000000001 R09: a9976d4a22f06c8e
> R10: 00007fff7a4ca6b0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f1c22de4658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:12065 tgid:12065 ppid:3551   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f40d09ada90
> RSP: 002b:00007ffe44700508 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f40d0a9e860 RCX: 00007f40d09ada90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f40d0a9e860 R08: 0000000000000001 R09: f1aa9b16a9cef104
> R10: 00007ffe447003c0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f40d0aa2658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12070 tgid:12070 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:12076 tgid:12076 ppid:1106   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12079 tgid:12079 ppid:1106   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12084 tgid:12084 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  prepare_lock_switch kernel/sched/core.c:5066 [inline]
>  context_switch kernel/sched/core.c:5325 [inline]
>  __schedule+0x102c/0x34b0 kernel/sched/core.c:6690
>  __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12087 tgid:12087 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6706
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fedf6344a90
> RSP: 002b:00007ffdd18ea6b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fedf6435860 RCX: 00007fedf6344a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fedf6435860 R08: 0000000000000001 R09: e0e65f21ab61f0e5
> R10: 00007ffdd18ea570 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fedf6439658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12092 tgid:12092 ppid:3551   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5328 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6690
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:12098 tgid:12098 ppid:2989   flags:0x00000002
> Call Trace:
>  <TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup

