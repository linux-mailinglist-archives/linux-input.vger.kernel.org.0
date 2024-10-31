Return-Path: <linux-input+bounces-7812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCFB9B80BA
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 17:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1E761F221CC
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 16:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DA01BD020;
	Thu, 31 Oct 2024 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bVnnB9CM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nLA5xlJr"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB69B13AA2E;
	Thu, 31 Oct 2024 16:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730393962; cv=fail; b=rLU9yS7i1HhokO+jI7maleo26QVIVn06W1F00FKuedFWOt7vOdRfrQP5RfEHijRu/iqMBg/lkxrcxkyZG8HvkIGFKorR+dLgAtZQjKERfXetYoARmSUvs66py8X9SIGBW4RnpC/Sq95Xsgxfd3JNbVzpvS3lBhhU/HMq7mFHXFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730393962; c=relaxed/simple;
	bh=SATBY3bGufC8WxrdfuPuj3WKAUtDnSodCeSkieOpuIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eLc7sKKGGoplNF1rqsu/9a6QeJwW4mJ/j3Dw/qw/PydloDj1EI/ys1XKzadnc7+Vq5NnqTEv7dQm3yIw6B4Lsksz/UKLzxO5tPNO0grndjR5YZVpMdjcVljpznA0Teio9tLhKwchHg6/bIikkErhsMu29V+IY+jPriRffoTUt60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bVnnB9CM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nLA5xlJr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VGtraF014200;
	Thu, 31 Oct 2024 16:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=5MMUBZaXktnyDNnKXe
	BDyGi98EWqEJ4sytIvX6+Z/mI=; b=bVnnB9CMjexuwdIhEoROFxvoXftjhjy5uw
	Df3ETNeplnwvzSzv02498IeneuETHYfw+RlJIex7pMbz4jisVw4zSF9n+Zy/kvQc
	24JIZI4yAlakJEwWjuvWujOsf1JCt69yNV/6bz5JmsiIoI1OFufXYO35ZQk+jnFy
	hx1D7pO2P+It8YpqZJdnUqbTj2jbQ5pa6WcS+kc/nklJ1fMJzhsgxjAzd+ryDsmv
	AZq/cGKhij0l/HSF74yUAbJQXW0k23nx+qTnfJaR0wPXfn//3mmMiA8sSnnUPuQK
	PnwC3xYDVbmEFHcltu3eSaxh1lAfRQNGF/9fsCmK/iqI2SWkGExQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc92rst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 16:58:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49VFY7eE004982;
	Thu, 31 Oct 2024 16:58:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2x65y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 16:58:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwA2Y46ZhjBXBYYiP/SvAuh0cWLj0E8TUOUybJt2135qOUaMfQ5S/jkw9UXv6SJ3u35k8YU8E24aO2GveXLgK3mIDgioK3j3rmMK59M9YLsiKmk68cpVY3lb91Zly97Na6XwuSrkS90SdUexO0LRXyUUIa951ueUjRm8iFyLxKvJISiQt5/vLWsrgul72qHxkZzZIblEjLxRyNtNe8Mg/UwANSo7QpSvuJ+LGWoPqXsGxCF4NlWLftr+YyHxez2KEP/uzUWrPWiW6lAX7vWltbFU84r4iOKwATYYqwNPeRA2t4qnqB4gMH2Mz7P/b/XQ56HWei72yOb6EXayfTvwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MMUBZaXktnyDNnKXeBDyGi98EWqEJ4sytIvX6+Z/mI=;
 b=Y0AyQlzp68NiyXUEtkgVdelcqdOfQDh/DxXVxP2UPrjLWonwGDy8ZZwnL5tbUSK1PppIDLLvRAjHCfpaoV8tRggKTe5fv+G6W2nH/izgB6403SKmv8bOA3dYP6oUjRZ28t608FpQwdDVV4NVNkralTSczCty9GHYwafir/2AKTkaquZLEuZOzTEMTtTdzwpB+E+LceO3VlrxEcg01lDTUZzDau47rfjdVfGdVKtT16NmoRsJg9FT6Tb04MHORM16NXp5xnRJUoA7Pf9zIxC2DRpzu2gL3J10BX3BIQBBSvELOyNJB03M1accGy5/utpINNd+XiUd+3Naouamm0kc8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MMUBZaXktnyDNnKXeBDyGi98EWqEJ4sytIvX6+Z/mI=;
 b=nLA5xlJraUG2xaBlrXXegaxnQK6cRFNuD+ZpUw/YZEXxeGmZrTNw6+YPVUe7f/aOSLH09oIwt9NaKoHgl/m+csTP40OmLl7J0WgbejoaZgoADxKzagxF9VJSLIgvlKSUwltn5+bHhRAcsuJWXANTHHqnm5xqnufERMp7DoAQ/yc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB6102.namprd10.prod.outlook.com (2603:10b6:8:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 16:58:33 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8114.020; Thu, 31 Oct 2024
 16:58:32 +0000
Date: Thu, 31 Oct 2024 16:58:29 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk
 (2)
Message-ID: <2928b6e8-3928-411d-82b8-6b17be266deb@lucifer.local>
References: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
 <6723b31e.050a0220.35b515.0165.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6723b31e.050a0220.35b515.0165.GAE@google.com>
X-ClientProxiedBy: LO4P123CA0658.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::7) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bb9bd5-e812-4bd6-781a-08dcf9cd403d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ekok0tlQB7cQtSuuu2hTe9HRPDNahHXL7pPYcd89AcBSGAfF9F+OlLr22x+R?=
 =?us-ascii?Q?9ZHFgLXc64jnfcYxfzoxBaHmXwXIBShLCcvUTiqdrl/GpbMskIMHU77X/rbK?=
 =?us-ascii?Q?Jc1lBD/6P7UmA3u9xq2bL48hD3sQFNy5s4eatmiwTG7PDDgRi/y4F5oG17E9?=
 =?us-ascii?Q?NvwpNpKkiTxnPVJ6W+CFvBiUAJepSBRVwToROD6W97HXVH3dx1jC0wNKMVLI?=
 =?us-ascii?Q?CDQMOqaPHV3REua6yxaPf3Zn4I5Wp1d7HW5cgsV//2X7fxs6cw79IlZMQhWk?=
 =?us-ascii?Q?L9kprHql/l6yf0w1MRFQ1Kcrvgmx2SHCi7QKoEcXGcgtxi8S+bSrZW4kNR5r?=
 =?us-ascii?Q?2+5XBMGDrwlC3bmy+PfqF2hmeEpUKgtobrFxbrDYIcReYqQkAh2Vhqb9spZV?=
 =?us-ascii?Q?GTmLqUztUoUVgUtOnl07goFtZSjaeRAgIkEK53vvP+TCAZCV1Wa3ML6QdUIO?=
 =?us-ascii?Q?90Qevzzt6PzfXQEO/iPDQCrIDgZQKL+6LBQ1PM9akLp/K5OvEuMKaqVj44AM?=
 =?us-ascii?Q?YUPNeprB20k09KKgB4SmihT08jk6NtIkF/44vBqiyJK39EUo+CFsGRIPfzmQ?=
 =?us-ascii?Q?snWpLuQvP+hbxXjEb5Pc53h4YJ+eea1mV6cgmt3JR4kM8wj11hARsdPtcHS1?=
 =?us-ascii?Q?IM1RNb09WUmGFx9JKCjfXgL3EfcG7fEkOb3oY4klKuH2iJ/fZKEiscV13/bS?=
 =?us-ascii?Q?nZkd31qE2ty/TjsoXWo/Ick3ycbDyS9jgtVmyYg+z8TWPR4Z7ucClAl2tPTd?=
 =?us-ascii?Q?Mhui6cfH3DTuJmQ3UalII1vlvo7U1v1I15Q0L4gyq3l4n62Y77NHU5yhu+Ts?=
 =?us-ascii?Q?vZvJqrbaVTAwTrLSEEv9vPzwndiSKn4zFWTwmuTAQVXX4YPMjqsqUstDDSoR?=
 =?us-ascii?Q?hfGKcbHLToJPZBd/QZvBmr4hZv9XlxH9o0KigG78f+4FtiaYH17B1Y9mjZhc?=
 =?us-ascii?Q?R17+xskwCTgQJ/510inUzswi9ACqGsf4j0H126M5AwI1vGZls3xndBVVMqKe?=
 =?us-ascii?Q?fBI2cGJVkG8gVWXbr1WeTzvHx1hBhGC0YGCdNMZDq4FwjdWsHpWoYfkaJp1+?=
 =?us-ascii?Q?Fr3Ww0RqPvr5jbOq4Ee4dxDZh3Pi8DIvZG6A2t8kCanT+IVIVae2JzkA4/0k?=
 =?us-ascii?Q?d8W7IO5jvZ8HfjwluN4KwtDferEtqZN0x7gUzriKuGf23X9Y1TVcp2B1eMVX?=
 =?us-ascii?Q?p9PElJEJ/Amu9HR85OhAISn/W5jCW/GEWsqhMYZ+mGLlUyDgJXuJz8ySxshK?=
 =?us-ascii?Q?+64QFnaNyGDeuMWu+3UX9tdbW/VYxuar+Sg3rf3UGg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pm/xlQbpnuFuIUzLMuIyOy32wRQIb+zjDAXD4BATOfo0tn2hEqqKmL5/Zcvs?=
 =?us-ascii?Q?DNOQUZWXO+EhA78B9+f5t+WAn4p9sC/DC79cyvdxYMlxQxR3e5MFv0cZr/oO?=
 =?us-ascii?Q?uRovh5WLdXgiAnZxIQWucT/CHnVlvbudtkC6MKVl0E7T+rd4p0DXbZRFBJDI?=
 =?us-ascii?Q?Bmm36FPisamWjL9Lb8vFk+GRnz0bMoBMjHZn9rQt8s2WgA1/3VWVWqM68nOw?=
 =?us-ascii?Q?Haxa05dnsNgL2o9RkwnKOxY2DVWMXaZ9M9DdieD+a+aR8OvpkURv8LvallNJ?=
 =?us-ascii?Q?egHEGNaOZ5JbxQ99zgWJ19aofjLHhntLxGfgzZHxXUn1rs09ssPkKCD7azpP?=
 =?us-ascii?Q?NSv2ciIH+l48fLkmWPR9vf38XyWlTTw0Jwmi0PUpgtT9Hx/1NgvpRg7OkKlr?=
 =?us-ascii?Q?wXB0C6t46uO3bar1dAwijCSiZJusV7hYLQDq28SJOeRNcSUO97sdZ056XOLQ?=
 =?us-ascii?Q?6FdQRkWMUokpYkflFQLMIUNc4f7/OHiy8ouxvMoUiX/MS2IBWzHE/Ml3Qowf?=
 =?us-ascii?Q?v1s81cZBh8D4Wv81HFyT3A7PI2IIuSOecIMkjFGuIBrS8vz0RFYb+asuoLx4?=
 =?us-ascii?Q?yrjAJbVxHJDHQMufWDUPrftD3txu8Ez0I0iMSTTP7RdzzL9iLTQMYUdQeV+3?=
 =?us-ascii?Q?a/Rz92Dn4WXI6jESE7flqOK3ZEYFx1tT5D2zXLjIIjFKDsyvzNinldyKBNMt?=
 =?us-ascii?Q?uRotdoec5aRUh9EiWWGKiKYnhJKrZkLiRZOKN4oeQoh1Nb+tvixrLvPE++MV?=
 =?us-ascii?Q?N0jYEwEy056BCIGDlIEoOXyBlz0X5HZCWwjVXFhCe1rbOnRW97eyzWkOARNc?=
 =?us-ascii?Q?npZ97M2zRzYjffd2uTt3fL1Kt5x81vhNo5duEgKPcxqcAR1acG1FmT9r+euF?=
 =?us-ascii?Q?7dbU3chCqeULFbHoLvAMPbe71PrTLiGu148leCTKrvbKfwKIvwvRFTStDLCE?=
 =?us-ascii?Q?qaz2lk3iAMXJ+12d8vjcxqqCVRPDQh7ZRAU6nKpF40xVujIYGMSBksY0lmsi?=
 =?us-ascii?Q?1eEyDboLlYfrw2wgQV7/kumKXrh/D7hOA3pn/sk7FCtn6U1RDRTv/On9XwCN?=
 =?us-ascii?Q?JWnpeoGGtp+kb5PzVr384JWYmU+77H0+3m26EivaMFPYa9WWl7Y/vvQpAzfy?=
 =?us-ascii?Q?P9IaF34Gl6AJHiwjdB3ZE+CJ9fLtQfkSnKAa/3bgiQ4trCTcWM8AKCff7Sin?=
 =?us-ascii?Q?cW47R0pw8mIA4GfHaAY/8HzCde5EjP8ygO++mBJoItoT5tgBGFSDCXYHc/Fa?=
 =?us-ascii?Q?1ARqPC/s91/laM7btPqIiXefYhRyHqZyGHQ8W2WTwWVWFer3qIJYpaLLK/y8?=
 =?us-ascii?Q?z8CaqhMHq+PlYNXKcrLg3LfuVOMUgiQWZ1Iq9axQ8PtTqlhIp8w6Sd5XkoVT?=
 =?us-ascii?Q?aHutIzp5lCF7ICBdEjydonkjxhuRuswumKwQe6DJyXA/6mo48Mp6GwttoPgP?=
 =?us-ascii?Q?mKi381unUS3JudE8dSoCxwLWnv0RhhN2txLAiWkaku297Tpq5XY8H0nx6wa+?=
 =?us-ascii?Q?MPoKknGsNNppxTdtDHv9JNBTrphei/lg0dGmFCZWlys81rq1ANV63ZhIXGsZ?=
 =?us-ascii?Q?KZMtGcFbDPOuynNUldn3WlGNY7FNcbZMbvkhYrsd9o168chIteYgNxsTg5A/?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7U047Fgrj/sLKEonE9Fn0daLfVtXoXxeBqmzK5GmOLry0L9qVxzYd8FOJKM6uIg7H1i4ulwt54ydEgS5npT1bybJrREebV0KbycM2lAqGDNLM4y0eN55Y79k5INkdKii0By3vDx3D301N/1fkUHPi6iTZouio1HcSd7fb/TXtbsjl+RZxKuZ7ZW4iqqC7+3Ghi2CNdxwvoxnmPCeLRNPuP+Hy0VvW1/lt1iR44VuETNrAasTBjyGvWQVLVxBx0wmjlB6QOlphkLFr4aKJmGCIja2ANsaBZo/9mjBiXlB9M0K33JSfIxfuEt6Yp0Qy9c+WHGVFDJgRXGbX0zzxuawCuWqrsHUbMCEbWkQiKCuJXx4PM2rKIVIZXhqd7Ska+ojrv8k4LVKfT17SsOPOjkU8MgBQWQKTVuvqVZl7bRlMFfApSiREXCSLPo9deIB47tMlCrrJczbojJMcz5pVLYgDGOR1XAV0a/0BhKNciiE6ahVDgI5uLCxUzItFitcNIvEyquYCgAp9rDTryEkJ/sTZHuVs5nqLYLbWIMA2ApZC3Ml/v31MZBHutTM0bzyPJSo0+0OjXuT1+sSeGc6kAUp7xua9B5mp6biZcyY9XMsmqM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bb9bd5-e812-4bd6-781a-08dcf9cd403d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:58:32.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkGwBRxEqcCl6O5x4gC4pRijl5MvxsEM7jL3QeUwUwX7QgTBedvMYF2Xiatv79GTco0J7BK5N1S/bVYEPrE5OEK0FooLS3kCyWaSDUMSmdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6102
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-31_08,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310128
X-Proofpoint-GUID: aV4xCkUrmyi7n7FuCxZLfvIJP9EGHKK0
X-Proofpoint-ORIG-GUID: aV4xCkUrmyi7n7FuCxZLfvIJP9EGHKK0

+Alan re: USB stalls

On Thu, Oct 31, 2024 at 09:41:02AM -0700, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>
> Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> Tested-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         cffcc47b mm/mlock: set the correct prev on failure
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
> console output: https://syzkaller.appspot.com/x/log.txt?x=1304a630580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6648774f7c39d413
> dashboard link: https://syzkaller.appspot.com/bug?extid=7402e6c8042635c93ead
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>
> Note: no patches were applied.
> Note: testing is done by a robot and is best-effort only.

OK this seems likely to be intermittant (and unrelated to what's in
mm-unstable-fixes honestly) and does make me wonder if the fix referenced
in [0] really has sorted things out? Or whether it has perhaps help
mitigate the issue but not sufficiently in conjunction with debug things
that slow things down.

Because we keep getting these reports, that mysteriously don't occur if we
re-run (or hit other code paths), they seem to hit somewhat arbitrary parts
of mm, and because CONFIG_DEBUG_VM_MAPLE_TREE is set we spend a _long_ time
in mm validating trees (this config option is REALLY REALLY heavy-handed).

I note we also set CONFIG_KCOV and CONFIG_KCOV_INSTRUMENT_ALL which isn't
going to make anything quicker if the USB gets laggy.

I'm not sure if there's a human who can help tweak the config for these
hardware-centric tests at Google? At least tweaking the RCU stall time
anyway?

In any case this continues not to look likely to be an actual mm issue as
far as I can see.

In [0] we were stalled in a validate call which would align with the idea
that perhaps we were just dealing with a very very big tree and getting
slow down that way.

Cheers, Lorenzo

[0]:https://lore.kernel.org/all/967f3aa0-447a-4121-b80b-299c926a33f5@rowland.harvard.edu/

