Return-Path: <linux-input+bounces-7397-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0399E16A
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 10:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91BB11F222A7
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 08:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A4C1CDA08;
	Tue, 15 Oct 2024 08:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eE6feHys";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BZNNl5R/"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7F16A92D;
	Tue, 15 Oct 2024 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981893; cv=fail; b=pFC8QRSSqqqoPL29AQ5mYNXn740Nt1Gm9OQgjFZVGDu1ZAWri0uE4zAn9p6WFWFQNztJvuHVQ6lrFMGQ+lupf9O+ycLj7HnsPsztMWXQLcMsmauBiWqjsauvf3iIp0LpHDqehWZMX+rfIa7Oa1H1mxJe1FbEsaQKq2ZZRMXhmd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981893; c=relaxed/simple;
	bh=iWGSk17hKR+1josaPAV1desfmzU67TbWkmldHjsn4eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CerH23zWju7GWS8CGHj7jA+cTCFwgb2JbwtsMLYiAEBXvEQNkd4zI49oZiFNr42eY6d9vCX3DAmuCML47ykXGFp6wukLGSRUVB0+tYypR+2t0/vXrCUxvHUhzfrN0yn4XFtJkSp0LwfAYADjNfhkEz3rCAwokO0CJ0OwGjn0414=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eE6feHys; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BZNNl5R/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F6F6uq019625;
	Tue, 15 Oct 2024 08:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=utZmdfYGrp8xuJfxbr
	aFYJ3YBgPnctAlkMMNpnmzwJo=; b=eE6feHysVlH05E5PiBs/DMN0tgfKkb9A0K
	R5tJpw9wfGSu9Q6ABPy2p1D1iEldrVDlK0CPaPXm28FHVrnhwIs8GVrfMp7C6d/4
	a7H+4Gd3vxPIoA3o1VGf4VAIUpKRoIDtD8yOOqyuyFwoLYVBsxOL66pjAjLNCLb/
	GnzeuY2SZ4TI/79A/7HC2UX+jLgGtIUER+3Xo9ci/4CYL43xUZDc16eI3/UUmg0C
	AdgFGRou8oGF/nnpe+1bd/AwnXLxzopo7nyKrG3yVbrzjf79wTdrEv5suw+Kdnh9
	HfMSlqRtYMg2O1BAOi3ddmgWQHvWfv4+Cfc41WGFELqEpJYpM6yQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427gq7g8nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 08:44:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49F803cR027163;
	Tue, 15 Oct 2024 08:44:30 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjdnq5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 08:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vv6yo3ngGVSWa+o6HIq/86GNZET1OA6TNcFq1JQX49hYnKGr5x1ElAW1hCTQZzzz3gXf9fL0u6Scbqsoj3S8mR9M7lMrFwUYizNwE7LfB3Ntq4xSkCvNXiB3H5+bIz/45ODbx6HLvBSN9u57DNLPh+nUq0xc0+jnKzcRxIxFLb8MJy4uAmvODuMoj9pJOmDs3rOI8J8az41LT9PiN0/3nylIWvOx9mMu8GwMrvUuYrzGCJZmCSb5y9k6QpwGHCjGLXtXZaIaP47gdgG1GzShou1jk2YZV9BAyUGhfxtviok6A2bGsUZ095/PrQhwtDWnmhp9uiKZ1bLxVMFFkFCX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utZmdfYGrp8xuJfxbraFYJ3YBgPnctAlkMMNpnmzwJo=;
 b=ZJDTjNaUGwOTIyvbubOKsgdkGaJ5DVzV5HSYic9c3TywuKHQolUnDZlU9m+CZdkcn7pWYiVlXy0I47DA4momBx4NGGd+BcEJlA0/kVqRjJzR4pkje4rb7eJbQTmaxpRB5vWAfAy8ZP5f05hOihf7Jwv0K5pRpvo+6VKuWWtfXLd5SRrdR6GBP7n0dRfxdfGcnCMEPnTROwK/Rj+Airl0DNN/pjJFQBWXFFnuQKjdEaS9z97fGh2XL8LlP1bmu+PRO8EJ2F/+kHi+51vhFMwx+DefgIxfEo0OCNl7HgU2Sziz7lNNcgQ+X/imKaCYguJKnqlB6kVLiVB+8EBEw0HfzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utZmdfYGrp8xuJfxbraFYJ3YBgPnctAlkMMNpnmzwJo=;
 b=BZNNl5R/1ls8xCS59AxqKOZ5qjDbBv6HJRsNJCQlmyH6/MagF22LGT6OE+zgwgumQKPAKBaQ6YY4dcOiUJRLnTLMpPdVO/paUCBjpN7FapurMzh6zrQkAD+35MlACR3sbOR7fZcu7nZRKj+PjYzBe7+BzawoY4a5icuUckVUKTE=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by CY8PR10MB6538.namprd10.prod.outlook.com (2603:10b6:930:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.28; Tue, 15 Oct
 2024 08:44:27 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 08:44:27 +0000
Date: Tue, 15 Oct 2024 09:44:23 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [input?] [usb?] [mm?] INFO: rcu detected stall in
 vma_link_file
Message-ID: <2442e7bd-bf62-4a1e-af45-8b36c088b071@lucifer.local>
References: <670d3282.050a0220.3e960.0065.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670d3282.050a0220.3e960.0065.GAE@google.com>
X-ClientProxiedBy: LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::19) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|CY8PR10MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da990f6-71a7-45e8-8d67-08dcecf593c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i2JRRGaJcC2JY/kDAcIjNmlV9N41j3nyRi4z0bAp7ZJYUvgP0DvCtCLSQQaj?=
 =?us-ascii?Q?hbic3TgntlZkFHhZPwg2kOalsJVIL7jaH70rEJHK5SRb1nQYzf7xqxAsGolU?=
 =?us-ascii?Q?QZuE2eCkOAJCkpcZ+WVFHW3wjKdUCN7H4OHyi4VyosilCV7t6rX46jeosKoO?=
 =?us-ascii?Q?rB+rTD//s+g1u4/RTMDLYaNv7JlOkfhClLW3ojH0zhPG8PEVf1h35niRlkfT?=
 =?us-ascii?Q?pyvIey0OPk0owwB/pZB+CuZxLBHaumVBD7bnIP9+hvx/iFQJPsiP57FmTsVF?=
 =?us-ascii?Q?q5rkHmbPT8/yal/Xf0upzNsNpMXMEoxrbO5G0ZV4ftLkltsJ9c/8VSKW8waI?=
 =?us-ascii?Q?0kbb+HO1u4TQU2blO7UEokqSzpm/9nkLVJyqHIBSB/+gbe53DuXoYy9dAjI8?=
 =?us-ascii?Q?sGSl3ZyM4/fY39Q90fLYxgjj1kXo5cFwn0U9A/ymI5khg+EvDJr2FVn4Ly8h?=
 =?us-ascii?Q?jBYFKXH07z4SXziplkUT6EmQnria3hNQzu4TFYE87MrXBGljXE9g9ZdZe3Ol?=
 =?us-ascii?Q?AVvpxvaoQ1Nc3aGjMt6dYAcPOlXhYbx0Y/OHnncc9PCPMLmvRRXRBoYG3wDu?=
 =?us-ascii?Q?doyxfu55tu83i3Armb+SR7vXusSOqdGRqtkxDqvMm8xkIxBvHKjGL8YiwACv?=
 =?us-ascii?Q?4BfEc2TSQ8Zfw4G8EmobNRAfJ62fQZd55DKRdQBHr+hcDjmfDkhbyK+zzIC0?=
 =?us-ascii?Q?/G8iGitJzUPJo/BOoIhz9Bo3P3OxKEzusVGYzBtq+oRRR7wGsc5a8tneLhKe?=
 =?us-ascii?Q?oA9jkKy4qhqUUC/IEIWL+z0aokSRwfFST4Lx2blDpURZMF21ZZr6Nfg7/1GT?=
 =?us-ascii?Q?Sag0HO5PUiH3YY+GGN1CZ1sv7hLEXP+gJrdoXmdunSo4RVJdHHK3LO7HcaId?=
 =?us-ascii?Q?VU2X5f2jVfk6uAPWpJk4peE/VNBk3Mo9MzrWDGriauGUGXLYJf0sGUckRGBT?=
 =?us-ascii?Q?L2tKEUmpwGB81l66KvlkALL4b93otmlC8QGathQpQfOwCYqnUEgLA76DfP2I?=
 =?us-ascii?Q?QO9G9f0PhHnWlCejh/+QVAczvcRGxNF9BYd+tl2fzAx9LWu5fPf7RH63gcE/?=
 =?us-ascii?Q?FKwqs5uH0b3E/S7LvxDSiEkUwpPASz50oDerIFWErEfXqF9h9ysDqOAwe4Gf?=
 =?us-ascii?Q?vwUhA9L0loDnBrH4X93JGvfc7/Rm7kwQUCLabDmmp0WpbZBBZR83iQUHreYN?=
 =?us-ascii?Q?OpDpyss1ytY/qIUwEnggnZKU6careEi1udYQNS6qPZ7p9IhRWrsTotU/HB4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qe5E+ZqyjfuZ9ZTcKCKKivHTgdv3hk1qZqGtGDqMdL7AHL8GmkqctkZPy88v?=
 =?us-ascii?Q?e8MrfmxGziNQ1ghkAKs66/k7vrHWPCzDBSVGeWVuTZxP0jUDPb+A9zESiXuQ?=
 =?us-ascii?Q?rk+zdpTeTXwxMq7TVYPOKbF30yuRZxiVk9/rBFbTMSwZ43A00NPU1UmUYwiq?=
 =?us-ascii?Q?BCpgzBTQHrpdSp8qz5bN1lFp6WpUDiz72pj6Lu9hr6nzPbuzg3whKWdxXnCV?=
 =?us-ascii?Q?va+iRQXIClmYE0h/JzaJIR4hhLanPUbE+uXUmnDDhUbAsUmmBCiM4SBuBM5p?=
 =?us-ascii?Q?wmSb7jxAU6XhRfoGaVVot0l5G1jyIIWt0D24cUY56wLxRFpKbI0joohZ+0q1?=
 =?us-ascii?Q?ETeDxGsmMUi5Tl+9Nh4ZQZbKE5gAFY5Aky0YkaU8AR8ooQYlvfFeSWu4v5ZQ?=
 =?us-ascii?Q?9TJ8F1Kwysh8Ffn2QNC2/a8S8uBSdpjTXAKnNaBFIAULDcZqImm/85rVo9RX?=
 =?us-ascii?Q?/54ZBMPhQeZWLX/jq3+AdibrBt555MsBMCnZUKHGuIkRGBX0cYz8NgYvDO9T?=
 =?us-ascii?Q?fet78SyFtn0MLh7A2SjtF1rYGNdVAXbmmkv2djUfua9WrzXdeMDhra8dEoSX?=
 =?us-ascii?Q?teY0fflueXRyX7mJU0B//HgxByEXnXEpE+gH3EYz1UPRTT2G82N9OCFPuy7Q?=
 =?us-ascii?Q?NF/GzJHwft/nz8F4RvqFBcjHqiNnKIJzBLsCXrZrmSevr4fK4vA/qzRYuti0?=
 =?us-ascii?Q?PCqq/Fh4ufY2HOjG4/A4xilWOqdLbNcXE70bEMEl1v+RWjmX5QHEvwAp9Ojg?=
 =?us-ascii?Q?f+iv6nDeCZuU0MhkU6JDFsD2s0JjTwpN+0c41YY11neLAXAjJ2NvrhvpTdpE?=
 =?us-ascii?Q?lKdhYuZ6Qc2deVOmrnZfD00s6GujgD49zd0yMqY33EkDke1YJesGt0jW7WL7?=
 =?us-ascii?Q?/XGMkYrxkivqlCG7pG0Afcoa1koHw5CRr48Y795/SvSiqP6ToFhHkrzv0/Cd?=
 =?us-ascii?Q?1IgTzhNPxRS65RsHQSSHyTQBm1PauIk9krU5eb8E1nAq4p/mI9tFqeQ5Hz+g?=
 =?us-ascii?Q?eIGM1dlSW9uSt5bziy8Fbf+6Gz1uCLCs4DI9tvvqvokSDa9sCd4297DuMLBD?=
 =?us-ascii?Q?Zmlm37QNI4s3sR0hw1iwDnIurgl9/ISrIQbOqQkty0OxYq9h4yM72O89vvAo?=
 =?us-ascii?Q?D9SUVsfU+t2JvBZ2KIHwc8KhCu79iFjBx9vt8Aq9ymxaziLV1SK2ubGT8epM?=
 =?us-ascii?Q?facIzB9TDUxN0XrQRvw7PWkDf8k514/pue+v44cYwBKlPtReoJKcskHqcmEX?=
 =?us-ascii?Q?h7d1N76qh7niUl2XZ4q6z0lZ8Bd8Q058s+5hztcWRJ+vByxWAU1OLDr7b1Vh?=
 =?us-ascii?Q?ZG+hEwrSgPiRaF6riTiK/h9gCq5ZpJMtHRbCfR11oGFW74R5Ma0MHHyADNXz?=
 =?us-ascii?Q?n94FvfUdusTHmeK0iTG7DChADIbkBWNF9QGVsSmRAk8R/8JgZfZlPyE1Re2R?=
 =?us-ascii?Q?4X40nocfO7aIyncCo3LZtpDCWSUO73vioncQz2HmLYVxBzMHBx6cos054KSI?=
 =?us-ascii?Q?sdZnOteVzcCCLwzD28HLrRYoGlR8N6fGbavfKdFzYj6dgZN/y/xz8SlqVWvo?=
 =?us-ascii?Q?0qhrYwgRj3ECN8L12fiPHAB8YnHw5aCsaipCJaGLVKHxjVsxfE5ZmLe75s6e?=
 =?us-ascii?Q?CX+s9Pn4+nVDC2dzTf40a9n5Xr3xQbwG7269Vz9ENGYZKz85jJlhQR6rAsNy?=
 =?us-ascii?Q?Qxzhww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vGeZZV+G7QRfa6w8vnIGQNol7V23Pv4W3AYsoI+5A9DBlisGRCs5wln6spFOXrGKPMKgC5ApoDfqnXg0YvnVfEn6n11/VhaC5NkX3VXKzW+l+XhUoKWWCkR/F2pV8e+olFANoZGfTM4zCEKPN4qY41fh+P8LSm1OTvzH63Xp1NZE6AIfCc2ll/mbNHKsrS247nRW+pznQyaf9/AQyo7C0PcbnJ9QECkJZejcw6JCDRdr5fWcz6kMBVj2JvHool9MbPy/tEWJEBOvxQpKS/WqGzZYk+Yt0/3B87gLFLvtDxBxbEXGJ8SFs3aCe5AXGaWDVyI7GKfDDXzKA4dQA3cruJhXKClF+Ce4tBueVfCdzzraLZ24SuNudAVzmSHdx4NeAuRWbe+EsmavQguhtRf32xjMCR/Nnu1SyqaRZwLd1CpEZwjcWKrPbDiW10ibV+kOhXAmNZhpVe3umI6Bmx9hz9MgdqnXYJ2hE2yVTUZe5XajzNif5qecx50KLLJ5sT/QnxQaGBudgzB/Ame7aL5M3ZBTh80Y30ob0d0W/yR/6TQz8jLyvDPs4nH50y9FO4aVV8udePtCf+BcOsPsol/bhFxXACbzAui2II0rEhCLLzg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da990f6-71a7-45e8-8d67-08dcecf593c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 08:44:27.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzuTGRjD4jX2N00OrP9zLhGOqhi5Sgub8HgXGn0n+0MJiUGZ1jRhRp4xSUo1KKlLI0TCumN9lOzj0+kI9Ta8sC7A0IDl5V2EUqmSYRW3wwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6538
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_05,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410150058
X-Proofpoint-ORIG-GUID: fS7CQrl0OSwsEGp-Q1KycLhV5g0crJPk
X-Proofpoint-GUID: fS7CQrl0OSwsEGp-Q1KycLhV5g0crJPk

On Mon, Oct 14, 2024 at 08:02:26AM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compatible..

Strange that this hit in the USB tree.

It's possible this is another variant of the problems introduced by the
maple tree bug fixed in [0] as this has been seen to result in hanged
processes due to memory corruption.

This is sitting in the unstable hotfixes branch in mm so not yet in an rc,
so it is possible. The issue is that it manifests in potentially
unpredictable ways so it may be this or it may not.

In any case the vma_link_file() stall seems likely to be due to contended
lock, and since we are pulling the address_space against which we take that
lock from a vma, which could be a UAF due to the bug, this seems plausible.

On the other hand, I notice that CONFIG_DEBUG_VM_MAPLE_TREE is enabled here
which causes very expensive validation (not in vma_link_file() but
elsewhere) which can cause RCU stalls.

[0]:https://lore.kernel.org/linux-mm/48b349a2a0f7c76e18772712d0997a5e12ab0a3b.1728314403.git.lorenzo.stoakes@oracle.com/

Either way, it's probably worth retrying on a repo with this fix so...

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable

> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=13425040580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
> dashboard link: https://syzkaller.appspot.com/bug?extid=ce483fd06e2061f44f5d
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17336fd0580000
>
> downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/883c5319cb52/disk-4a9fe2a8.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/caf4421ed2ef/vmlinux-4a9fe2a8.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d8e3beb01d49/bzImage-4a9fe2a8.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com
>
> rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
>  1-...D } 2645 jiffies s: 2181 root: 0x2/.
> rcu: blocking rcu_node structures (internal RCU debug):
>
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 13390 Comm: modprobe Not tainted 6.12.0-rc1-syzkaller-00027-g4a9fe2a8ac53 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> RIP: 0010:io_serial_in+0x87/0xb0 drivers/tty/serial/8250/8250_port.c:407
> Code: 6d b5 fe 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1a 66 03 5d 40 89 da ec <5b> 0f b6 c0 5d 41 5c c3 cc cc cc cc e8 38 eb 0d ff eb a2 e8 c1 eb
> RSP: 0018:ffffc900001b7f08 EFLAGS: 00000002
> RAX: dffffc0000000060 RBX: 00000000000003fd RCX: 0000000000000000
> RDX: 00000000000003fd RSI: ffffffff82a07780 RDI: ffffffff936356a0
> RBP: ffffffff93635660 R08: 0000000000000001 R09: 000000000000001f
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000020 R14: fffffbfff26c6b26 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f62d4710409 CR3: 000000011ced8000 CR4: 00000000003506f0
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
>  show_trace_log_lvl+0x1b7/0x3d0 arch/x86/kernel/dumpstack.c:285
>  sched_show_task kernel/sched/core.c:7582 [inline]
>  sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7557
>  show_state_filter+0xee/0x320 kernel/sched/core.c:7627
>  k_spec drivers/tty/vt/keyboard.c:667 [inline]
>  k_spec+0xed/0x150 drivers/tty/vt/keyboard.c:656
>  kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
>  kbd_event+0xcbd/0x17a0 drivers/tty/vt/keyboard.c:1541
>  input_handler_events_default+0x116/0x1b0 drivers/input/input.c:2549
>  input_pass_values+0x777/0x8e0 drivers/input/input.c:126
>  input_event_dispose drivers/input/input.c:352 [inline]
>  input_handle_event+0xb30/0x14d0 drivers/input/input.c:369
>  input_event drivers/input/input.c:398 [inline]
>  input_event+0x83/0xa0 drivers/input/input.c:390
>  hidinput_hid_event+0xa12/0x2410 drivers/hid/hid-input.c:1719
>  hid_process_event+0x4b7/0x5e0 drivers/hid/hid-core.c:1540
>  hid_input_array_field+0x535/0x710 drivers/hid/hid-core.c:1652
>  hid_process_report drivers/hid/hid-core.c:1694 [inline]
>  hid_report_raw_event+0xa02/0x11c0 drivers/hid/hid-core.c:2040
>  __hid_input_report.constprop.0+0x341/0x440 drivers/hid/hid-core.c:2110
>  hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
>  __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
>  usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
>  dummy_timer+0x17c3/0x38d0 drivers/usb/gadget/udc/dummy_hcd.c:1988
>  __run_hrtimer kernel/time/hrtimer.c:1691 [inline]
>  __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1755
>  hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1772
>  handle_softirqs+0x206/0x8d0 kernel/softirq.c:554
>  __do_softirq kernel/softirq.c:588 [inline]
>  invoke_softirq kernel/softirq.c:428 [inline]
>  __irq_exit_rcu kernel/softirq.c:637 [inline]
>  irq_exit_rcu+0xac/0x110 kernel/softirq.c:649
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1037 [inline]
>  sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1037
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
> RIP: 0010:get_current arch/x86/include/asm/current.h:49 [inline]
> RIP: 0010:lockdep_enabled kernel/locking/lockdep.c:122 [inline]
> RIP: 0010:lock_is_held_type+0x35/0x150 kernel/locking/lockdep.c:5890
> Code: bd ff ff ff ff 41 54 55 53 48 83 ec 08 8b 0d ea d3 67 03 85 c9 0f 84 dd 00 00 00 65 8b 05 2b 0c 14 79 85 c0 0f 85 ce 00 00 00 <65> 4c 8b 25 93 46 15 79 41 8b 94 24 94 0a 00 00 85 d2 0f 85 b6 00
> RSP: 0018:ffffc90003d0f840 EFLAGS: 00000246
> RAX: 0000000000000000 RBX: 1ffff920007a1f12 RCX: 0000000000000001
> RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffffffff88ebb040
> RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8727e760
> R13: 00000000ffffffff R14: ffffc90003d0fab8 R15: 00007fe8bee64000
>  lock_is_held include/linux/lockdep.h:249 [inline]
>  __might_resched+0x4ca/0x5e0 kernel/sched/core.c:8593
>  down_write+0x6f/0x200 kernel/locking/rwsem.c:1576
>  i_mmap_lock_write include/linux/fs.h:507 [inline]
>  vma_link_file+0x7b/0x120 mm/vma.c:1582
>  mmap_region+0x16ec/0x2900 mm/mmap.c:1515
>  do_mmap+0xc00/0xfc0 mm/mmap.c:496
>  vm_mmap_pgoff+0x1ba/0x350 mm/util.c:588
>  ksys_mmap_pgoff+0x32c/0x5c0 mm/mmap.c:542
>  __do_sys_mmap arch/x86/kernel/sys_x86_64.c:86 [inline]
>  __se_sys_mmap arch/x86/kernel/sys_x86_64.c:79 [inline]
>  __x64_sys_mmap+0x125/0x190 arch/x86/kernel/sys_x86_64.c:79
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fe8bf117b74
> Code: 63 08 44 89 e8 5b 41 5c 41 5d c3 41 89 ca 41 f7 c1 ff 0f 00 00 74 0c c7 05 f5 46 01 00 16 00 00 00 eb 17 b8 09 00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 0c f7 d8 89 05 dc 46 01 00 48 83 c8 ff c3 0f
> RSP: 002b:00007ffde3a3dad8 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
> RAX: ffffffffffffffda RBX: 00007ffde3a3db50 RCX: 00007fe8bf117b74
> RDX: 0000000000000001 RSI: 0000000000007000 RDI: 00007fe8bee64000
> RBP: 00007ffde3a3deb0 R08: 0000000000000000 R09: 000000000001b000
> R10: 0000000000000812 R11: 0000000000000246 R12: 00007fe8bf0f4fc0
> R13: 00007ffde3a3df38 R14: 000000000001a43e R15: 0000000000000000
>  </TASK>
>  </TASK>
> task:kworker/u8:7    state:R  running task     stack:32568 pid:14340 tgid:14340 ppid:3242   flags:0x00004000
> Call Trace:
>  <TASK>
>  __switch_to_asm+0x70/0x70
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14342 tgid:14342 ppid:2678   flags:0x00004002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f2bc08caa90
> RSP: 002b:00007ffd5b9ec338 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f2bc09bb860 RCX: 00007f2bc08caa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f2bc09bb860 R08: 0000000000000001 R09: 41db0d9426285180
> R10: 00007ffd5b9ec1f0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f2bc09bf658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14346 tgid:14346 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:kworker/u8:6    state:R  running task     stack:28784 pid:14347 tgid:14347 ppid:1131   flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:kworker/u8:3    state:R  running task     stack:32568 pid:14354 tgid:14354 ppid:46     flags:0x00004000
> Call Trace:
>  <TASK>
>  __switch_to_asm+0x70/0x70
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14355 tgid:14355 ppid:1131   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f5de21e6a90
> RSP: 002b:00007fff1611ff28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f5de22d7860 RCX: 00007f5de21e6a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f5de22d7860 R08: 0000000000000001 R09: 46780758b7766d57
> R10: 00007fff1611fde0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f5de22db658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14359 tgid:14359 ppid:1131   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14366 tgid:14366 ppid:2678   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:14373 tgid:14373 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fa2dfe27a90
> RSP: 002b:00007ffd872a30e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fa2dff18860 RCX: 00007fa2dfe27a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fa2dff18860 R08: 0000000000000001 R09: 5f652800365ccb43
> R10: 00007ffd872a2fa0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fa2dff1c658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:14379 tgid:14379 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14384 tgid:14384 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14387 tgid:14387 ppid:46     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14393 tgid:14393 ppid:2678   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14398 tgid:14398 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14401 tgid:14401 ppid:3242   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14410 tgid:14410 ppid:3242   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14421 tgid:14421 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:23984 pid:14430 tgid:14430 ppid:46     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f622cd7da90
> RSP: 002b:00007ffd1393cf78 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f622ce6e860 RCX: 00007f622cd7da90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f622ce6e860 R08: 0000000000000001 R09: dfc6ef523a5d942e
> R10: 00007ffd1393ce30 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f622ce72658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14435 tgid:14435 ppid:3242   flags:0x00004002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fd05f2dca90
> RSP: 002b:00007ffdd773bdf8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fd05f3cd860 RCX: 00007fd05f2dca90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fd05f3cd860 R08: 0000000000000001 R09: 4535f641cc4c0f28
> R10: 00007ffdd773bcb0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fd05f3d1658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14440 tgid:14440 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fe7ecd82a90
> RSP: 002b:00007ffcc7a7bf68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fe7ece73860 RCX: 00007fe7ecd82a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fe7ece73860 R08: 0000000000000001 R09: 2fdb21dbc668df0d
> R10: 00007ffcc7a7be20 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fe7ece77658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14446 tgid:14446 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14448 tgid:14448 ppid:46     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f7d319bfa90
> RSP: 002b:00007ffe4a0e5cd8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f7d31ab0860 RCX: 00007f7d319bfa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f7d31ab0860 R08: 0000000000000001 R09: df5d5dca07fffb84
> R10: 00007ffe4a0e5b90 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f7d31ab4658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14453 tgid:14453 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ff382b23a90
> RSP: 002b:00007fffced1e578 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007ff382c14860 RCX: 00007ff382b23a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007ff382c14860 R08: 0000000000000001 R09: 48767732b8a00d20
> R10: 00007fffced1e430 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007ff382c18658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:23984 pid:14458 tgid:14458 ppid:1131   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6854
>  __cond_resched+0x1b/0x30 kernel/sched/core.c:7192
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14462 tgid:14462 ppid:1131   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:24416 pid:14466 tgid:14466 ppid:46     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fa2b9c04a90
> RSP: 002b:00007ffcac65ac18 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fa2b9cf5860 RCX: 00007fa2b9c04a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fa2b9cf5860 R08: 0000000000000001 R09: 44ac5dd007bc47d9
> R10: 00007ffcac65aad0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fa2b9cf9658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14472 tgid:14472 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14475 tgid:14475 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14482 tgid:14482 ppid:2678   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f564677ca90
> RSP: 002b:00007ffea046cdf8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f564686d860 RCX: 00007f564677ca90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f564686d860 R08: 0000000000000001 R09: 93e6ddf45d0859c7
> R10: 00007ffea046ccb0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f5646871658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14488 tgid:14488 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14497 tgid:14497 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14504 tgid:14504 ppid:3242   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fe9ec399a90
> RSP: 002b:00007ffee4562488 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fe9ec48a860 RCX: 00007fe9ec399a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fe9ec48a860 R08: 0000000000000001 R09: 0fccf8818db050ca
> R10: 00007ffee4562340 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fe9ec48e658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:14509 tgid:14509 ppid:1131   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14512 tgid:14512 ppid:3242   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14515 tgid:14515 ppid:1131   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14516 tgid:14516 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fcaccae7a90
> RSP: 002b:00007fff73141d48 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fcaccbd8860 RCX: 00007fcaccae7a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fcaccbd8860 R08: 0000000000000001 R09: a45b974d1de31a4f
> R10: 00007fff73141c00 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fcaccbdc658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14521 tgid:14521 ppid:46     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f4322dd7a90
> RSP: 002b:00007fffc607e378 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f4322ec8860 RCX: 00007f4322dd7a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f4322ec8860 R08: 0000000000000001 R09: 5c992bf7597daffb
> R10: 00007fffc607e230 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f4322ecc658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24416 pid:14526 tgid:14526 ppid:1131   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f638696fa90
> RSP: 002b:00007ffe0066ce18 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f6386a60860 RCX: 00007f638696fa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f6386a60860 R08: 0000000000000001 R09: c9a8bb5340cb61d8
> R10: 00007ffe0066ccd0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f6386a64658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24416 pid:14532 tgid:14532 ppid:1131   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14540 tgid:14540 ppid:3242   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f3a9b2d4a90
> RSP: 002b:00007ffe77381b78 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f3a9b3c5860 RCX: 00007f3a9b2d4a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f3a9b3c5860 R08: 0000000000000001 R09: 755e1725d4f4842a
> R10: 00007ffe77381a30 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f3a9b3c9658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14545 tgid:14545 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f560707fa90
> RSP: 002b:00007ffe65145b28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f5607170860 RCX: 00007f560707fa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f5607170860 R08: 0000000000000001 R09: b546563a3277b2da
> R10: 00007ffe651459e0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f5607174658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14550 tgid:14550 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14558 tgid:14558 ppid:3242   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14564 tgid:14564 ppid:3242   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __pfx_lock_release+0x10/0x10 kernel/locking/lockdep.c:5346
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14569 tgid:14569 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:23984 pid:14574 tgid:14574 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14577 tgid:14577 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14584 tgid:14584 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14585 tgid:14585 ppid:3242   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14587 tgid:14587 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14599 tgid:14599 ppid:1131   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14602 tgid:14602 ppid:1131   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:14607 tgid:14607 ppid:2678   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:14612 tgid:14612 ppid:1131   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f5193264a90
> RSP: 002b:00007ffe01417e78 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f5193355860 RCX: 00007f5193264a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f5193355860 R08: 0000000000000001 R09: 5005ebcf5767047b
> R10: 00007ffe01417d30 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f5193359658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14618 tgid:14618 ppid:1131   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14621 tgid:14621 ppid:1131   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14629 tgid:14629 ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24704 pid:14634 tgid:14634 ppid:3242   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25408 pid:14636 tgid:14636 ppid:1131   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6691
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f8d8d1ffa90
> RSP: 002b:00007ffe30417e48 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f8d8d2f0860 RCX: 00007f8d8d1ffa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f8d8d2f0860 R08: 0000000000000001 R09: 44dca94248773cd7
> R10: 00007ffe30417d00 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f8d8d2f4658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:14642 tgid:14642 ppid:3242   flags:0x00000002
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

