Return-Path: <linux-input+bounces-7435-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E4099F7D9
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 22:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8E53286EC5
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 20:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2131F76D7;
	Tue, 15 Oct 2024 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OQTcF17J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VXQgNECH"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7144F1B6CE8;
	Tue, 15 Oct 2024 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022754; cv=fail; b=GWlGCFXVIFwGLvLQs215MOY7jK9C5Jvv4k2AH8YJfsdEBHxvYt8Rg0Ib5KGGPcU4Fg/Op45VE9tl/no5k0XbI4hm0Ey7OvTsGLOgXMk0MmovTkn5bPlT7TtSoThfZ8r5lOFH2z2zHNo000ua4deTgV4Gqow5uVI9leEcFUIfFgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022754; c=relaxed/simple;
	bh=1RM9qmHOge3FDO37iTvqdkAmdhRkXl6oetaMXsEtp1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iPrJ5yscFIpuRWEKAbR1AjnJ36o/pEr9BV+BMoX56Kh8QRkwzMLPvd3jxfcNFcdLAL3V5JZDyz4JzZhOFSQge7g5ylX6s56FopKIzLTO/4XcnDXX7qQPNdSHb2eSbGl3MfoF5rOm+A/bNdcYJkPDD5NJtgDs/89wgU7NLPoruJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OQTcF17J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VXQgNECH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FHthL1024661;
	Tue, 15 Oct 2024 20:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WNrn1D0pS6c9NUecws
	8hruil/r8+9X6KLk+wo46qj3Y=; b=OQTcF17JwpPyM+DUv8z8Ndk1q23vTuPCSQ
	VfKmBqhbMMBKG9jDxmKoK1bD39D6SabpkpfBi7UR5YTHeclOws7NEExQlOcehR/T
	YhWw/v2WNoMwkeb93quB73eYddkiRDJAiQBoCiqwqa1GxsynqBic0k5O4DevQlKH
	UV6czpRQ/4zUjV0LtRfm1wWamIVqNPwp2CDollkiUZ2yCcIIC7FrBsw74e16tGxP
	8P2WjwpuBdij8QtehwuiYg5pYC4z9gU5BsiYgef2eRGlLHzzK4i9W/Xkr+Xs6v0+
	+6TO1QFl3r86put81+TBXYHBqcpKe9WwCk6xedDfhrM4V5xTIz8Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5cjdyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 20:05:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49FJNC09020102;
	Tue, 15 Oct 2024 20:05:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fj7y5nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 20:05:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auV6b9mX58sSaa4CC2t9I4CcsaVnviet5dPPcOMKmptYw8PAiq+JqcQuy1hMH8UYBqDvorW38/zS1JRxeKE7+5fEqoJDgU4kr3FUql3gZ7pPOAq2P1z8zSXLeIaMMBKGP85UpptIIavNsC+A1K0hOa6s8VEHgMMDfDPvJgEz2MSQVlwh0ECIMjRIAMfHHCcUV/JIDsQcj/k3fboNxz7/7IExiR7jJnCa1XrIx1f8jW5vxURzSRXQ1FfrPC3CLzoi9qhU7Ze1ECvsO8lbw9FlyH1pP2oDBqMlRc3PckFlbUBvN7TxMLQ2Jdtk4VUoEta2qzaaID+gdD6ULQWPXGxctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNrn1D0pS6c9NUecws8hruil/r8+9X6KLk+wo46qj3Y=;
 b=aZNoDDd+5Ebw4+euGbG6wRktytpfjjG0F2sdy/wUvmzaTPbHfId1EgzahH2uxoQLpTvKXxunoswH9DfwevmHGdwcZBCv1fnf0XiW+iOLiD3CxrraoZ9ocwWrHeVdER79bFFu4mjM70/btgOD/WtXXoTSGDYq+0kqGs8oMcplEbPG1fLRJlbIogSL/w8KpiRibr2EOWxBYsejKUk/57zdZO2zwHh3anLVLk3UcEG9MgAxnogNpmbZV874ZTkyCbz9VROwEk76UqnTsIMrF/WneCTN6o+/VMMlzhL2ar/8AQkQncBN0f7wmtOzRHcWTxIkX3vyuNeSHlwc7bIxhzKI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNrn1D0pS6c9NUecws8hruil/r8+9X6KLk+wo46qj3Y=;
 b=VXQgNECHdeLgW+f2uoYSYCLpHkjHpPkpWYxM4zlHkTDXzU5PJqc0as9DdcbxfF9On+alXfJ/Rm36ALwrMND8R3uT2jGQqSHeKxLRjN16+UTEURR6ysT0hpJ72nPjAzLyuS9J+6atmNdw/z7YK2Fxj+cAwOX0w/msCEm9VK6avps=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by IA0PR10MB7255.namprd10.prod.outlook.com (2603:10b6:208:40c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 20:05:37 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 20:05:37 +0000
Date: Tue, 15 Oct 2024 16:05:35 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-usb@vger.kernel.org, lorenzo.stoakes@oracle.com,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [input?] [usb?] [mm?] INFO: rcu detected stall in
 vma_link_file
Message-ID: <ji3zt22xdnr2wieepeudioxg6uqthwxtbut6w2ec55lmnnzghv@c4jwoow5u2gg>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com>, akpm@linux-foundation.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-usb@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
References: <670d3282.050a0220.3e960.0065.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670d3282.050a0220.3e960.0065.GAE@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::21) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|IA0PR10MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d1ec728-a80d-4a3b-a8e6-08dced54bc48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RxsbnFtWpMxlcxXBzibQzxBRk1l93H0d9lrqLxwSMRT63Qi4qFOaCK0BRCLV?=
 =?us-ascii?Q?VLdK16WoE4NhhheN7cauXMJ4uF+WBUPhGJnAaRXQHrqAWB+MM/UGvT+DUx4X?=
 =?us-ascii?Q?SD7wxea8xKPI9qDIDOUzSoqDlzPP2dqf4vB/ct8qOI6biJ5XJDgmNUSymTfm?=
 =?us-ascii?Q?XoQkpB5gnzEeCM7z798ccOcTxn+Ex6m3pvh5R/BAuYVnQTh+Evq9WHd5ZJ6b?=
 =?us-ascii?Q?YqvI0Vo2c+8ZNvDcQB5Mu7/fkzS/AciVlIiohPtD6bcMtBUyvr+OIVd2ym8i?=
 =?us-ascii?Q?9CYwKgYGjsbFsLhnQz7nOJAzhazm4sA7yvqS5oms21IVyaF+C4GGO6Xi0l91?=
 =?us-ascii?Q?YLoA5c2j6GgRID38FEG6Zkkc/S+/CLZrF8hWnOtmEC8ZmfvUpNDONYIXUWeI?=
 =?us-ascii?Q?ix1n4BvikMCyNUieMi//u58v/iUJnPgw5Xw1FYPLGW1k8pklazGdU2dBs+1c?=
 =?us-ascii?Q?JaIg7FZLrp3kbcOHlhlc4WPTq5a+rKOq7pf/Gyt74L1BJwgUPWRZyrlhNCbW?=
 =?us-ascii?Q?RPO//ASnAs27DXJRVnyFieeVSod7aVVn1oc1YquVd8c8H5oP0tVc3a2D/4ER?=
 =?us-ascii?Q?bPmWBxfpPQAoi9VwcW4wvX+khNskZfPxrUhCsfI399LFk9r1XNPJQ3qBtfU8?=
 =?us-ascii?Q?2894V537MQWZ3MmJDK9nRqTfQHNpKi/mLmOq26rP7xdcGTv/Mlig780Lro48?=
 =?us-ascii?Q?RxkMB5axAtEaoLuWWof+dx4OA3o8CmOAKS18PHRzw05STPOkYhxWD1B0kqXX?=
 =?us-ascii?Q?NArfIACJYYfC3NK3l22v/ca2zj8tY1RKuVosfrLF/0+SabvwljNNBjZ+M4tX?=
 =?us-ascii?Q?hB/sY1jAjA6L4K05/mfesg9RSuPcg96GfLn+K3l4X94/Z3lxj/6pbcB7e0PK?=
 =?us-ascii?Q?q7gsjz2ZtIb3s85xb1QJbuoB8KlnmcVUbZvzUbKm5X38dXxIz5du/0lodL7N?=
 =?us-ascii?Q?tv+r6IWdXkAMpxYBjqNnBC3jAdSp/Cfnnc1cjYW8wTxNv6Am+TpoaTYvZrfB?=
 =?us-ascii?Q?ZZ70ivL1cUPHhNVMKTk0oxvE0ECCaUBCP9Bo4uWiPzsndriPOELNI+pgckOI?=
 =?us-ascii?Q?l+tfTf6cLSv6SjjI+PGK/arZW9b9AXIt4Ix8Ze8m0zykFGYpyy13WtWUdD9v?=
 =?us-ascii?Q?jIGxcB7Trnk5FlEXs+csXZ+3pS47jGKlalQPRrpRwlWLc7WZq7WdnfI6hGHA?=
 =?us-ascii?Q?n2dHzKrXb7RwgplQcE3ruNwMGpLPMM7gYNb826tnuIyMyEeYbRU9zbwda24?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WTUaNnM9xbrM8yEQTb+42S8A5aCuNbldVc/h6HOQ+A7tsC15GEfyV0aQnvsV?=
 =?us-ascii?Q?Qhv6J0eileUdHplY4Bn9jS7s2dqe9dHC4GDrgZ241DsX7ogXv0Ao9Hdh03R2?=
 =?us-ascii?Q?MhikgLPSuhpzuiyhTVCdxNAo0XhUq4xp55XGqIquZUmH7uPG6/21izUBsM31?=
 =?us-ascii?Q?OrYJ5n8EIz88SGkwQJSq20eiZpTnOWKO0QGnh3Cc3azkN4fN4lHIeXexPCmd?=
 =?us-ascii?Q?yETbscePDuSlyJHdkGO9t7NjU2KOT+E3sVnObvcZnzGdb0VJuOLgUVNacCi+?=
 =?us-ascii?Q?mstvZzhFEPZXsHjUCCY9poFz97H/+EdHpy29mf4uZqoIGjX5+9cr+156KdMb?=
 =?us-ascii?Q?si1JCM8e6x62CuujZgLLcXqIHmG4tVPn3ewdozq3kix9oT5PWz7mT9YQFgOr?=
 =?us-ascii?Q?zixvDTx7Zkeu251nIMzn/oTYb32stLenaM6qROjYx1hYu1CBvKZ44KmwU/fh?=
 =?us-ascii?Q?kBwHu0kyJ8JQg9iRM8Cx8H9O0x+iUVxGnnKm1IkBiIW+NfDYlHckM0Z7y+P1?=
 =?us-ascii?Q?lAnybVcjOG7s5Vx8Env16BQSFI62JAa0nbymzFjsYsox5o5B5Q6VWBPKYzmh?=
 =?us-ascii?Q?EYeAQbfunBFOfL1JvpALlo3KGM6liMZtXif4oZrR3Wf1XSd9ggvJ214WKRrr?=
 =?us-ascii?Q?aXVr4P6ndoTGPwxj+UQ055ATPohKjz4m7Y3VQbgfAinLCPbM2cLp+hmwEZaj?=
 =?us-ascii?Q?DatuQSaKFhKiyo6geibvEt+vNqI/x0C2G8DhX/IMklzY/NUXwrd8QjnW5720?=
 =?us-ascii?Q?PnHFZ09o0tpY9oQDrvgYXBlvJ93LnT4A44Scf7AXsoE2A0pt4I2OqvTC4dc1?=
 =?us-ascii?Q?Ef4bWSfKqH3JRcOQrbms/huQrI+RgfNTylU35hRTZX42zNoGEQjj46yzrJfk?=
 =?us-ascii?Q?bvxE0A/GQckDDu8zo9Wz8FHQQA7Ny4ielw2PtTmzLmazOP7nZMDC4CvBQPV7?=
 =?us-ascii?Q?IlvrLKD9aDCUazndNTS433F9/NT2UX0tK8bmGRCXGsmYooTuoauJba85dhx3?=
 =?us-ascii?Q?/qX7Q5ruVrSCjLO/uiryj6kwmM9dFlW60i2OejaJq00TwfcvbHN7MgCu4YK9?=
 =?us-ascii?Q?kMI/hDEct4EWWKqKgW7wXrfYsOXipHthKEsl9hg8BbcbO+trnHt0N88bbb6l?=
 =?us-ascii?Q?Yjl+g0pcvOjQiZd63zwfTRNZu2FjNM70lj7iMFkGOopqW6PELqY5wsUKc4ju?=
 =?us-ascii?Q?FA3gYi/LfzV83ghXw/ivh17Tm5VP7uDtUXg7NMK7lvIqTKtcQ05khotAX6bc?=
 =?us-ascii?Q?dAh7PPjpZB+fsgtxN989okPR49MUWvuvecbfQrgImZm04ftTZ1kUCXT62eZT?=
 =?us-ascii?Q?+6zyYfI+QU/TJRyO704UGPLvMLvOTv+cTd2hyMIgE3ktMGfYeGZTpeh/ejJj?=
 =?us-ascii?Q?qLBdeInoHhQIsW7cKXnFGe3/fqoup8IJQWd0kSQUfA5Lkk2zUS4pLAOWu+OI?=
 =?us-ascii?Q?9U0mEkxwQZrAhXmmSYGlzfBXipFeBqfkaYKtqlyHqFKa4p5TUfPIftEzhLx8?=
 =?us-ascii?Q?XHODaEaCTxgkOPATp87Egiw+EabRU5GZweZ5ba3hh/resEgN7cFSYACSTtEZ?=
 =?us-ascii?Q?81dc7iWn1yIik/vkezfU0YSMyoc8MwPUJd7XJtdRivcJU7NxTG791KWLRC0b?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lJRSNeP0v8GTx74R2vlz9d3buM4jSTLKLDCrKZN9AKA1MMU67aowoHwO/xezbYdln8Yc+3B5DxvydL9dKhngBJlLgOi4DmHitf2RtvDCncjc1w56prW7oWsPE0yGXGJmqfppUNgc3Ar70p7V7WTCBkRCf+seNIqiC7hjcRF91u0UFV9IMvDhGvivJesIpJK42+EdWuH1R1vLHHEcnXAt6hufhGiPkFXdmCam0iNdpEKviqTDKVs2rQxRZhij5M/9AOtNqTog62PkmL4dhog1Y5paoBzgo5LcDU70AdSDCN29UszdUOaF2HGgbQ/Y3eOGoqxAQ5TZ6NNWrsBYooeb7DeKLgBrMOVyhS5jHU9gIaNjdVSYQOYmatBQP25eI0jo3I3nRV7AHD8ol+pWloroTy+bo5TTv30gCQUyhMmRD7RQX9rXkZEqEMuwxqK/uPhVNQZs6nks9t8Q6EVblbG3qU+OyJEPNBKDmYc0D8kPtsdSDqlYX03crQL/7jXjwXkf+ISaftwmNYDtPMAmh2O/CSpsNVYTLnYMDGygQZQkbKAgMylf/Tkzv1dCf4g0LJW7/P4U1QIOeziaHCvw7HyuWDzIBZ4zEpZ0swlb0Locaqo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1ec728-a80d-4a3b-a8e6-08dced54bc48
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 20:05:37.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /THEQ3OSMGFpRtGwKkg8D/RUu6toOsnfaYAGphrR1WzFzRAuRgaJ6NFBsUQbwHZohSSqbVi+E8csr9oXrB0SfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7255
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_15,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410150135
X-Proofpoint-ORIG-GUID: ZJ3ahtkx5iMTB7ts4A0FTFSrqMQYns-_
X-Proofpoint-GUID: ZJ3ahtkx5iMTB7ts4A0FTFSrqMQYns-_

* syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com> [241014 11:02]:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compatible..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=13425040580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
> dashboard link: https://syzkaller.appspot.com/bug?extid=ce483fd06e2061f44f5d
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17336fd0580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/883c5319cb52/disk-4a9fe2a8.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/caf4421ed2ef/vmlinux-4a9fe2a8.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d8e3beb01d49/bzImage-4a9fe2a8.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com
> 

Let's see if this still exists.  I suspect so, but maybe not.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable


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

