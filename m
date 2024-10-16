Return-Path: <linux-input+bounces-7481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC639A021E
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 09:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 470991C20860
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 07:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F41A1A3AB9;
	Wed, 16 Oct 2024 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FUq9A2ex";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RMjJRnlJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41CC18E055;
	Wed, 16 Oct 2024 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729062426; cv=fail; b=RXi9cIOGOLpzreEN46XylWhnIFUfr4MyDA54hyC/0usjiIrmm+2q51hh1IUcmQ3UmDDirQ4ZjBIijaq8nsbR2kpIzwGqVviF2Vi55yRHGXvrnbHnpX5onla3VlJH5j21tpIwFGJUHoJZdL/fD3L4TUopMMo6iXOi8pvwR/q1IJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729062426; c=relaxed/simple;
	bh=+GZY5Q+gGMi9USQNGpTY+PdiBllLGG79AgVnkzGuBt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jID9qhPbRmTT+e2Cp1L3XLXES39u8elSZHJUGdh0PVZxhq5XI+ri7HaZSeSrJSHkeoYfw12cnqPyW8ZOJfC4Nz0XGWMPI/Wjgyk1/IXrCAALGymTDz0a1plWKTKOVlB/S6A1fyVH1j0Vf0fkDpBZ8MvZzs9DoGvCBCWfw+NxKn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FUq9A2ex; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RMjJRnlJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G2ONLi022882;
	Wed, 16 Oct 2024 07:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=53aUAV5pNiLbm2/6Hm
	I5rLCVxD/kXCqhLWoWrrLwLMY=; b=FUq9A2exNPpN3MMUU4dpGRXlXcrlNSPX5s
	3AHnQnfcDfgh4lzGmkRXf8Rxi04qkCA8QI89ESxEDkuujmfQ/1vTIDNVVFqo5SFn
	1GduOWumWD/qpDTlOGuonIF1zzXXRSPRnC520MN4kWdYOV3haLC5wkvp6iVl+FK9
	F5me+C28f0eBbAbR54LJLmoHfEwi2CMBupuuPAw47F9xuKMMF3ZwmB+zjQjJG9Yu
	g/8nm7sxXsHYEKRfdh5S8U1v/5kVc1D+fr+9D+cXzwDT/XD4FRpz6UuLQxyeqqtU
	OlUN9PCr4+is0Ezly+C6BSXw9PkUnbwv/L5w9MmI5MAD2P7vphfg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h09jh9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 07:06:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49G5G342027236;
	Wed, 16 Oct 2024 07:06:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjf0mm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 07:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+pc6SGuV6pfg2k9o45LCJWyCTBnPbNOEiWqRUTv3DKCC3ZrRIaVBlV40EU1xm/xiJSffhAtJ7gzT5YJZjGJonnfgxJog3WVc303N/ow3nv0/xaMfzCOa4r09NJWxHecLU9NvDHMF58UzsT7eY5R5YRkOwIY+HGS6dFZuJoIAfbAhZx7sHeFPOUxpdTVe0woDtVqpnSuybv6ovvWjHIBPwlfGqa/iro6vMt0/ehuiuJJYbVItRUcat6wePuaGPSrG4uB8rWanyfHCfnahaOt1sT1T6O+2JQfHX45kHoGKgZQYR9lT0VAAqGGQOer4udQ9QKAfEsdCeXYKWxqBdf2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53aUAV5pNiLbm2/6HmI5rLCVxD/kXCqhLWoWrrLwLMY=;
 b=Ofc3g9nL2hcspbhjUUhmV0G2T0vtweQx/aWqr7iS4zdxiUaYAkxbHiX1YufkFD00sc0tU7GGCWOUEhTzJDjvOHrmM6XEcSvK/elA5eW/SANVFlC5qzBaBMpjg5lZUgaxSRWim/i74gXaByxhkglMUpOnVVwWOLmDY30SbCh1wbw2DRi+VZXqo2qKD2QhV4x6ToJz9TxWIIu4SRR5oIaRLuGRCtsJOhI/Y41VBE9wL9IeTWT+xHXTHfRDZhu4bj65e1B1b3/eqoPqpALskdDAnRNTyT/QRrSVinKySAGaGD/wiRpamT/CrX0/mFpdpBN02hl6yhKmncfAH5U0oRTENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53aUAV5pNiLbm2/6HmI5rLCVxD/kXCqhLWoWrrLwLMY=;
 b=RMjJRnlJD3YLzPqF7KohRKWE8DTpZCNUQ1PgFEyRPtjBYOJQGDd2RV04WGsiuDumUKoNPcUHUoOJErZl4VfBu2/dv5ujotJdJK9jb0ImV+/8DuaQB2lSf45fb9bPeK0pLpSap91mD0qvUJkNOO6ZnEJ8f+92pq2oZ0iHjIcjwnQ=
Received: from PH0PR10MB5611.namprd10.prod.outlook.com (2603:10b6:510:f9::16)
 by PH7PR10MB6281.namprd10.prod.outlook.com (2603:10b6:510:1a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 07:06:23 +0000
Received: from PH0PR10MB5611.namprd10.prod.outlook.com
 ([fe80::d513:a871:bbf9:fce2]) by PH0PR10MB5611.namprd10.prod.outlook.com
 ([fe80::d513:a871:bbf9:fce2%7]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 07:06:23 +0000
Date: Wed, 16 Oct 2024 08:06:20 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, liam.howlett@oracle.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [syzbot] [input?] [usb?] [mm?] INFO: rcu detected stall in
 vma_link_file
Message-ID: <bacc4301-be1a-4f3f-9da3-1543cbf9874c@lucifer.local>
References: <ji3zt22xdnr2wieepeudioxg6uqthwxtbut6w2ec55lmnnzghv@c4jwoow5u2gg>
 <670ed017.050a0220.d9b66.0156.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670ed017.050a0220.d9b66.0156.GAE@google.com>
X-ClientProxiedBy: LO0P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::20) To PH0PR10MB5611.namprd10.prod.outlook.com
 (2603:10b6:510:f9::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5611:EE_|PH7PR10MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d098c61-0c5b-4cd2-dde5-08dcedb10b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z6DnI9UiBiM/O9SjWOACcKB4zdOinekq6W0OXldXhNI5x45G9qQWnEuKt6W0?=
 =?us-ascii?Q?Zi0EEm0kt44g1szmD7wNJJYXbgHXkw0Qi75mLWBfGmPeMs16qRknW6hJaWP/?=
 =?us-ascii?Q?zRsYg/PG98uLsh2uvT0XbHWjxxI+tMgrmPYDFHq9hik5EB3caKrsiDAOHocB?=
 =?us-ascii?Q?vQYhC5a0NOwqZuhTao+KagEp3Yije8cOfqikHR4NTywx2QOuK39rsP5TmL1n?=
 =?us-ascii?Q?dlvqIeC7ne/SAj+pNwBP9H/JQYCmp80hzlvdlHoRWOK5Ybs71K6fTAsze++c?=
 =?us-ascii?Q?bfMxtNPpal7IqRwIEZG4pxPmJ1dAApCBDrorTxCHdx3nQ2POJL+yh8q/owBD?=
 =?us-ascii?Q?L8fhHRx0lyTmdEoRdCozh/eF3tN7rhj8hPDRueOkXcZTsnMqynp+jtP7hrAz?=
 =?us-ascii?Q?z4g1Fvnreel5Izj+C28g/2XXZpwURajGw3TjL1eDF/7c7XEwXDE9c2FDo2Tc?=
 =?us-ascii?Q?p72wppgdO0/e4x48TTwC5wJII4YGdgz3gaJRvPudLMjio9NVqJuL6p838/7v?=
 =?us-ascii?Q?yQF4lhtSbTDqxugArUsP/WmOSe9CPuNMou6H2gdnhWtJsEMUfrsEmxzZXHg6?=
 =?us-ascii?Q?txgLtPMPI+ddU9fZQ8JDkuBH3nl0AP/DgjFvFpexd/JFIQWRphp2HYC4PKjC?=
 =?us-ascii?Q?w2qkno0XbwPJu1jI24EdS6W12plwaBiTZLbo4diweUcpmunIWNCV7x7g2xu1?=
 =?us-ascii?Q?5DfhHTnm3dfeIcySjV3JRhm4+9i9vAOTU81GduWU7Qt0jwJSBsLeUpeSupcm?=
 =?us-ascii?Q?ErqzaSy4OhQDOGDZ4UgXAIfROEA9nog1sE2W6N+Cc1GtlRBbAQjuJ+9GGQs4?=
 =?us-ascii?Q?dNOfkS0+LQRCcQT7XXz5GJb9zhytEsn8Pioy6K344/IwAXpVd61GnSUNtRf3?=
 =?us-ascii?Q?EbYEf41bsuHxg8hpeesbPTCH01GsVnTkkUZUSfn2GeXvHFeBUHKSkpgzr6+u?=
 =?us-ascii?Q?A9csr8lLhFhFUQgt/K0m2VjpdV5qvLxMbXqjAE8A1eIexDmhdpDRgo5zkV5t?=
 =?us-ascii?Q?XqHn77XkNBntXDQzuG5Hv9jRcXOJHwIZDPjpmfnPk5p/2B2GKv6/Meq1iIVh?=
 =?us-ascii?Q?8r3rJx/g/7Y+nGKEQDF820tu3cSCc7qylSN5bfxA1/v0v8K/LaxBEJsrELfk?=
 =?us-ascii?Q?oxb7TpeWWbapBxBTOJzXrKEmL59as4/lqqn62N5GKLq4zkLHCd4ADcJp6HxT?=
 =?us-ascii?Q?6ops/JPm44lYHlb+8gM3lh70OdgmE7uXIAVhNCfoj9sMIHAaV5/HCpH/ZHw?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5611.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hs9L2es7okDnPcOIsct1ahRu20vLlB62s4MEvt9D8QN64hgb8qU0xv0C/jr+?=
 =?us-ascii?Q?DFhd8rKKM+e62eSHcNQwr5QRSp0uHGnBXxvi7k0uFHh4fxAIuPWdBJ7lJN/Q?=
 =?us-ascii?Q?5US8TnLjtga+EJNYtn1iR/qm4Xmq24oN6xy9QxzFJmTQLCoDSX1izbRJrnxH?=
 =?us-ascii?Q?dXUyzM7smRtkIPpely/OIM5l/DI7Bt2EsxKKyBn3njrWXQDX9NQrzfWfdqfx?=
 =?us-ascii?Q?tBjey30vq29y/kq8lNzL18bxgYZE3cGh3CxtXjSmQUqxpRyLn+MAGT2vMKVs?=
 =?us-ascii?Q?xvSYXslhUD0oGfXJWEv1n03zl+YYOBUvruBEGRDCpzs1TyOBFeBst7XRmTb8?=
 =?us-ascii?Q?M7qX+XWgKlxMzi4VbmePXJT0OqXe7MG9BDP8CjNAPLGwYYja6G/ukT3iC8BC?=
 =?us-ascii?Q?jflXNCs4q/RXpvJuJkCUyaLeW9kde1mD6L2VCJQKVz1OxHh52XaA/RiFJclp?=
 =?us-ascii?Q?5zV1RLJy5V6AuNcTeH5XAkbxKVXsLZUu/EBOSzFDoXJvkrf3XbcrP7hZMG8g?=
 =?us-ascii?Q?3qoS8ZQZ6JmFIuyfPiRpSeccUmfTlkkL4uPC8/Gch+N+uHoBU4YMK/rp9ORa?=
 =?us-ascii?Q?ntyIwCwV2tyTQIiDutBRet23D20FLf9zzVqn+G08drov7LAKWJ03MS6oJFzH?=
 =?us-ascii?Q?ByBW5N6tu4Rgp9vMUI1lgph4J1bWca6u76RbXr0Sy4dAIiW2ifhR0PCXLYjg?=
 =?us-ascii?Q?B1ye3zla4ENenQjSdqNrls/btei4HsTyIAy4sdUm5jX9LzpLRsiH23/gCGeC?=
 =?us-ascii?Q?EYllG+82rdS5Mff8BQM3nTATnvP8q4hHYaUrr/OWBUphxh4sexObEOnysmjY?=
 =?us-ascii?Q?sSshC4RtDejIHbv7+S1yOg3yjZCMoQMuLizo+JR81iRJYD94Y/fHc75xY3d4?=
 =?us-ascii?Q?K8qtsIbwIEDQxiO/1RQdSL6tYq8LFg/BBSsKoNryQqzteCEnKeEo0xuDrMh4?=
 =?us-ascii?Q?3rsU8ph4vI48Xu939lTsTVhWVpCOqVquYX5zWGtO6tuGSjjy/IGFesflIrOc?=
 =?us-ascii?Q?acKUknEit9bwXPW/0m4z9nYmLKQDUL4s/GBJjCRL36xHXzThlugN8kRONNR5?=
 =?us-ascii?Q?PCDDaqDBDOwo/Jtbq2we3GmpwFrSGUNHZ0HnunTgnWkYymkhHUllhboEaXQp?=
 =?us-ascii?Q?WB0hmkbhSEFs6K15gJVqr5c4uZEGetYLNVl/w8YQymeWLKlILY42XuAJR7K8?=
 =?us-ascii?Q?mPKQmI7qEU/9zQ9GBVPWzpzJ9LxLBwxEmTA+0Ojg3nx2CyiAAVXn4CijYYST?=
 =?us-ascii?Q?L9tn+zjuje9f9PeJDyCL4RkayA1e2d1DIfUr3Mi6MeBNSduHbyJ/XCiBy5dp?=
 =?us-ascii?Q?nsyuof1sMu+V/3lGYcmX9Itch86rITYey0hmLAS/igpcJ+F6hK4tsd9O0Hsj?=
 =?us-ascii?Q?ksQxJRJxW+uon9AFc2hOSNYHpjZfb+Q2ZxHQ+ENwfEMRyBOuw04n3j6OzUPM?=
 =?us-ascii?Q?R7v0a78i2kQUTCctMxk+AuncQH39lwSz9quYSBvSQF7qqI500iIORqE8pY6a?=
 =?us-ascii?Q?x4sS9nCuLR3D8jEz+8HUK9WgwoAlriEFLdVo+YjrqzBVLJr715MFkJP73jtl?=
 =?us-ascii?Q?1Vcf0ZfN9dLR4fdukdL1IhIzJatUyO5fGZyQcm6l5QaraN1ErYHT0y6N2hYq?=
 =?us-ascii?Q?LG1swApzvS86BceHA/3hs1rzJNArlqC3XA3lgfFEI5oVdvMWTtPvozC+nZ4e?=
 =?us-ascii?Q?jUl3fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kOIMKbpExv/+8s87IKkbbfTo0WC9ycfTJuWNhrIBXeZp5oge1eCbbKkGzT9uDF29Khd+nePcIrTtxXH7kV9J6VDvJoebqKobo7D/a29oH9vpRUA45llVnkdqH0E4jxWkhuyRQDJYmkUs86tLYphU8xsYtORgJgUXGoMI36UxI0EfF3fn5+WplWj0794mhleTGbXQkgPzWId7g2FSd2BHifbPRdV1FHVbds3cBxmfBMtcykVE8GsH/V+zI+US/NeMkP3RPrKq4RbiAD1YUejmQs/iG6OasvVuZb6LAJoMZ6KAgtVIIuZjPWg0vag3nLwcDw8Lb1cP8lObxrytFZ8pUOTZuX3WtQqUK09p50efCCThIDFQ/AM6i/7VIZ5LJu873CikaQLbgIXpczFBP5CDpkSZN6RtYb8IgRMOAOqL2UxYm6BydNvwZR70YX8ji1gUUW9syy5fn/tEseyAy4LRAvaCSPND6NaeOc5QjxKuuUJojLNM1K20p7nPJ64FGg6cIAQCLQWfhz/hiIu7q5/9HBGYLWvqGA269Qd0XAplTnydqL6lhbAJh26zUb/rkNa+skZu3EfgoX+ZPtTJJ9AAqj+NeufiYwV8vOO0V70Qj1g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d098c61-0c5b-4cd2-dde5-08dcedb10b28
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5611.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 07:06:23.4730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbbZa+gts1sPERCZ6oKNv3BX+DA7PGy/GKW+VXbuPjEOZidkkmqrJ18j25Ac+mWsX7mJ+QqEDpnPMkT2Cnl/yc0uNn+0WYerxSH0cx+Ht8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6281
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_05,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=979 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160045
X-Proofpoint-GUID: eRRt-OzE_a_PdsWw02LW6Y3d5aufaP1G
X-Proofpoint-ORIG-GUID: eRRt-OzE_a_PdsWw02LW6Y3d5aufaP1G

+ some people from USB/HID subsystem.

This is really not looking mm-related, as for a second time we've asked
syzbot to re-run and for a second time it's not hit any mm-specific code -
I think this is misattributed - could somebody from the USB/HID side take a
look?

It looks to be something that isn't reproduced by a specific C program but
by a syzkaller USB configuration [0]?

Thanks!

[0]: https://syzkaller.appspot.com/x/repro.syz?x=17336fd0580000

On Tue, Oct 15, 2024 at 01:27:03PM -0700, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: rcu detected stall in corrupted
>
> rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
>  0-...D } 2647 jiffies s: 1489 root: 0x1/.
> rcu: blocking rcu_node structures (internal RCU debug):
>
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 UID: 0 PID: 2536 Comm: acpid Not tainted 6.12.0-rc3-syzkaller-00033-g80bf308c69a9 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> RIP: 0010:format_decode+0x94d/0xba0 lib/vsprintf.c:2571
> Code: 41 bd 4c 00 00 00 48 89 5c 24 38 e9 fb fa ff ff e8 68 6a 6f fa 31 f6 31 ff e8 3f 6c 6f fa e8 5a 6a 6f fa 31 db e9 82 f9 ff ff <e8> 4e 6a 6f fa 48 8d 7c 24 38 e8 24 d5 ff ff 48 8b 6c 24 38 0f b6
> RSP: 0000:ffffc900016aea48 EFLAGS: 00000097
> RAX: 0000000000000000 RBX: ffffffff8728c721 RCX: ffffffff86e6726f
> RDX: ffff888115f1ba80 RSI: 0000000000000009 RDI: 0000000000000005
> RBP: ffffffff8728c722 R08: 0000000000000005 R09: 0000000000000009
> R10: 0000000000000005 R11: 0000000000040348 R12: ffffc900016aeb48
> R13: ffffffff8728c721 R14: 0000000000000035 R15: 0000000000000005
> FS:  00007fe77c367740(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000557a1e480818 CR3: 0000000115f98000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <NMI>
>  </NMI>
>  <TASK>
>  vsnprintf+0x13d/0x1880 lib/vsprintf.c:2755
>  sprintf+0xcd/0x110 lib/vsprintf.c:3007
>  print_time kernel/printk/printk.c:1362 [inline]
>  info_print_prefix+0x25c/0x350 kernel/printk/printk.c:1388
>  record_print_text+0x141/0x400 kernel/printk/printk.c:1437
>  printk_get_next_message+0x2a6/0x670 kernel/printk/printk.c:2978
>  console_emit_next_record kernel/printk/printk.c:3046 [inline]
>  console_flush_all+0x6ec/0xc60 kernel/printk/printk.c:3180
>  __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
>  console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
>  vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
>  vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
>  _printk+0xc8/0x100 kernel/printk/printk.c:2432
>  printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]
>  show_trace_log_lvl+0x1b7/0x3d0 arch/x86/kernel/dumpstack.c:285
>  sched_show_task kernel/sched/core.c:7589 [inline]
>  sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7564
>  show_state_filter+0xee/0x320 kernel/sched/core.c:7634
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
>  sysvec_apic_timer_interrupt+0x43/0xb0 arch/x86/kernel/apic/apic.c:1037
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
> RIP: 0033:0x7fe77c3dd773
> Code: 00 f3 a5 48 8d 74 24 88 48 b9 ff ff ff 7f fe ff ff ff 48 21 c8 48 89 44 24 88 41 ba 08 00 00 00 44 89 c7 b8 0e 00 00 00 0f 05 <45> 31 c0 3d 00 f0 ff ff 76 06 41 89 c0 41 f7 d8 44 89 c0 5a c3 41
> RSP: 002b:00007ffcef9c0fa0 EFLAGS: 00000246
> RAX: 0000000000000000 RBX: 000055591f199906 RCX: 00007fe77c3dd773
> RDX: 0000000000000000 RSI: 000055591f19f480 RDI: 0000000000000000
> RBP: 0000000000000007 R08: 0000000000000000 R09: 0000000000000001
> R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffcef9c10a8
> R13: 000055591f199178 R14: 0000000000000001 R15: 000000000000000a
>  </TASK>
>  </TASK>
> task:kworker/u8:1    state:R  running task     stack:32568 pid:9565  tgid:9565  ppid:28     flags:0x00004000
> Call Trace:
>  <TASK>
>  __switch_to_asm+0x70/0x70
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9568  tgid:9568  ppid:1114   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:kworker/u8:9    state:R  running task     stack:28784 pid:9576  tgid:9576  ppid:1148   flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:6861
>  __cond_resched+0x1b/0x30 kernel/sched/core.c:7199
>  _cond_resched include/linux/sched.h:2031 [inline]
>  stop_one_cpu+0x112/0x190 kernel/stop_machine.c:151
>  sched_exec+0x1dc/0x270 kernel/sched/core.c:5453
>  bprm_execve fs/exec.c:1838 [inline]
>  bprm_execve+0x46c/0x1950 fs/exec.c:1821
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9585  tgid:9585  ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9599  tgid:9599  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9608  tgid:9608  ppid:1148   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f51cee31a90
> RSP: 002b:00007ffd78235dd8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f51cef22860 RCX: 00007f51cee31a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f51cef22860 R08: 0000000000000001 R09: d9f10af76f91c837
> R10: 00007ffd78235c90 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f51cef26658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24416 pid:9615  tgid:9615  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7febdbac2a90
> RSP: 002b:00007ffdc4cdeff8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007febdbbb3860 RCX: 00007febdbac2a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007febdbbb3860 R08: 0000000000000001 R09: 9c513921461b8e44
> R10: 00007ffdc4cdeeb0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007febdbbb7658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9621  tgid:9621  ppid:11     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f439b8b7a90
> RSP: 002b:00007fffe0ac2d68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f439b9a8860 RCX: 00007f439b8b7a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f439b9a8860 R08: 0000000000000001 R09: ff9d4db23f41e35a
> R10: 00007fffe0ac2c20 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f439b9ac658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:D stack:25424 pid:9627  tgid:9627  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9640  tgid:9640  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:24416 pid:9649  tgid:9649  ppid:11     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f9ff0b0ba90
> RSP: 002b:00007ffcc7ed1848 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f9ff0bfc860 RCX: 00007f9ff0b0ba90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f9ff0bfc860 R08: 0000000000000001 R09: 53b7f4bb0ff00e10
> R10: 00007ffcc7ed1700 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f9ff0c00658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9656  tgid:9656  ppid:1114   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  __pfx___lock_acquire+0x10/0x10 kernel/locking/lockdep.c:4387
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9664  tgid:9664  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f260c278a90
> RSP: 002b:00007ffca8cbcb18 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f260c369860 RCX: 00007f260c278a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f260c369860 R08: 0000000000000001 R09: ec1b067fce940b65
> R10: 00007ffca8cbc9d0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f260c36d658 R15: 0000000000000001
>  </TASK>
> task:kworker/u8:0    state:R  running task     stack:32568 pid:9671  tgid:9671  ppid:11     flags:0x00004000
> Call Trace:
>  <TASK>
>  __switch_to_asm+0x70/0x70
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9672  tgid:9672  ppid:1114   flags:0x00004002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f395cc9ea90
> RSP: 002b:00007ffff1d03df8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f395cd8f860 RCX: 00007f395cc9ea90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f395cd8f860 R08: 0000000000000001 R09: 0c83ee7b55e5651c
> R10: 00007ffff1d03cb0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f395cd93658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:9678  tgid:9678  ppid:28     flags:0x00004002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f4fb9369a90
> RSP: 002b:00007ffde76a6918 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f4fb945a860 RCX: 00007f4fb9369a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f4fb945a860 R08: 0000000000000001 R09: 56a7058e5d32bb87
> R10: 00007ffde76a67d0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f4fb945e658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9684  tgid:9684  ppid:1148   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9694  tgid:9694  ppid:28     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f306776fa90
> RSP: 002b:00007ffe0ff593a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f3067860860 RCX: 00007f306776fa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f3067860860 R08: 0000000000000001 R09: 7fe3f123c3d90a52
> R10: 00007ffe0ff59260 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f3067864658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:9701  tgid:9701  ppid:1148   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:25344 pid:9710  tgid:9710  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:24000 pid:9714  tgid:9714  ppid:1114   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fe83ca73a90
> RSP: 002b:00007fff91de4128 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fe83cb64860 RCX: 00007fe83ca73a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fe83cb64860 R08: 0000000000000001 R09: 0380a4352b815b7d
> R10: 00007fff91de3fe0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fe83cb68658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9719  tgid:9719  ppid:28     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9726  tgid:9726  ppid:28     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9734  tgid:9734  ppid:28     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f880ede0a90
> RSP: 002b:00007ffca15eb9f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f880eed1860 RCX: 00007f880ede0a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f880eed1860 R08: 0000000000000001 R09: 6855b1290ac23e74
> R10: 00007ffca15eb8b0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f880eed5658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:9737  tgid:9737  ppid:1148   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fd1ff7caa90
> RSP: 002b:00007fff7f497088 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fd1ff8bb860 RCX: 00007fd1ff7caa90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fd1ff8bb860 R08: 0000000000000001 R09: 93c7e6092e4e8d94
> R10: 00007fff7f496f40 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fd1ff8bf658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9741  tgid:9741  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f3b768dca90
> RSP: 002b:00007ffed6373f08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f3b769cd860 RCX: 00007f3b768dca90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f3b769cd860 R08: 0000000000000001 R09: cbb88f32d31ba940
> R10: 00007ffed6373dc0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f3b769d1658 R15: 0000000000000001
>  </TASK>
> task:kworker/u8:1    state:R  running task     stack:32568 pid:9750  tgid:9750  ppid:28     flags:0x00004000
> Call Trace:
>  <TASK>
>  __switch_to_asm+0x70/0x70
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9752  tgid:9752  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:kworker/u8:7    state:R  running task     stack:32568 pid:9755  tgid:9755  ppid:1114   flags:0x00004000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9760  tgid:9760  ppid:1148   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:kworker/u8:1    state:R  running task     stack:32568 pid:9762  tgid:9762  ppid:28     flags:0x00004000
> Call Trace:
>  <TASK>
>  __switch_to_asm+0x70/0x70
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9766  tgid:9766  ppid:46     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9772  tgid:9772  ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f42d3bdba90
> RSP: 002b:00007fffe30e2e08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f42d3ccc860 RCX: 00007f42d3bdba90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f42d3ccc860 R08: 0000000000000001 R09: 4e69d63dc7a7fcc0
> R10: 00007fffe30e2cc0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f42d3cd0658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9778  tgid:9778  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9786  tgid:9786  ppid:11     flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9796  tgid:9796  ppid:1114   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f68f99e1a90
> RSP: 002b:00007ffe63673f58 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f68f9ad2860 RCX: 00007f68f99e1a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f68f9ad2860 R08: 0000000000000001 R09: f47c3fb77550af2e
> R10: 00007ffe63673e10 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f68f9ad6658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9801  tgid:9801  ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fb781c83a90
> RSP: 002b:00007ffd60d9ea28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fb781d74860 RCX: 00007fb781c83a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fb781d74860 R08: 0000000000000001 R09: 215fd20ce0e6152e
> R10: 00007ffd60d9e8e0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fb781d78658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9809  tgid:9809  ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:24000 pid:9818  tgid:9818  ppid:11     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f9722143a90
> RSP: 002b:00007ffe05d6de28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f9722234860 RCX: 00007f9722143a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f9722234860 R08: 0000000000000001 R09: 6b4b8080cd93a00c
> R10: 00007ffe05d6dce0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f9722238658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:9825  tgid:9825  ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9835  tgid:9835  ppid:11     flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9845  tgid:9845  ppid:1114   flags:0x00000000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fdda0a27a90
> RSP: 002b:00007ffe05bd09d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fdda0b18860 RCX: 00007fdda0a27a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fdda0b18860 R08: 0000000000000001 R09: ff36ed7236d48a13
> R10: 00007ffe05bd0890 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fdda0b1c658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24000 pid:9851  tgid:9851  ppid:11     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fe833113a90
> RSP: 002b:00007fff2a01fc28 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fe833204860 RCX: 00007fe833113a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fe833204860 R08: 0000000000000001 R09: 35ed84c02d71e9d4
> R10: 00007fff2a01fae0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fe833208658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9857  tgid:9857  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f3964397a90
> RSP: 002b:00007ffd9166d4b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f3964488860 RCX: 00007f3964397a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f3964488860 R08: 0000000000000001 R09: 8f528e78319cc9bc
> R10: 00007ffd9166d370 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f396448c658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9865  tgid:9865  ppid:11     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  </TASK>
> task:modprobe        state:R  running task     stack:25344 pid:9874  tgid:9874  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ff415499a90
> RSP: 002b:00007ffc31aa1ed8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007ff41558a860 RCX: 00007ff415499a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007ff41558a860 R08: 0000000000000001 R09: bec4dee6b5bd8695
> R10: 00007ffc31aa1d90 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007ff41558e658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9880  tgid:9880  ppid:46     flags:0x00000000
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9882  tgid:9882  ppid:1148   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f6775f63a90
> RSP: 002b:00007ffc48cbf6e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f6776054860 RCX: 00007f6775f63a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007f6776054860 R08: 0000000000000001 R09: 2978e367673e3d81
> R10: 00007ffc48cbf5a0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f6776058658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25136 pid:9888  tgid:9888  ppid:46     flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fa6ea053a90
> RSP: 002b:00007ffca5ca66d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fa6ea144860 RCX: 00007fa6ea053a90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007fa6ea144860 R08: 0000000000000001 R09: e7a3475f3e0f6286
> R10: 00007ffca5ca6590 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007fa6ea148658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:24000 pid:9895  tgid:9895  ppid:1148   flags:0x00004002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>  do_exit+0x1de7/0x2ce0 kernel/exit.c:990
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1088
>  __do_sys_exit_group kernel/exit.c:1099 [inline]
>  __se_sys_exit_group kernel/exit.c:1097 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1097
>  x64_sys_call+0x14a9/0x16a0 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ff086b4da90
> RSP: 002b:00007ffc358ac5f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007ff086c3e860 RCX: 00007ff086b4da90
> RDX: 00000000000000e7 RSI: 000000000000003c RDI: 0000000000000001
> RBP: 00007ff086c3e860 R08: 0000000000000001 R09: 29caad31773cb941
> R10: 00007ffc358ac4b0 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007ff086c42658 R15: 0000000000000001
>  </TASK>
> task:modprobe        state:R  running task     stack:25424 pid:9901  tgid:9901  ppid:1114   flags:0x00000002
> Call Trace:
>  <TASK>
>  </TASK>
> task:modprobe        state:R  running task     stack:24720 pid:9911  tgid:9911  ppid:1148   flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5322 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6682
>  do_task_dead+0xd6/0x110 kernel/sched/core.c:6698
>
>
> Tested on:
>
> commit:         80bf308c mm/mglru: only clear kswapd_failures if recla..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
> console output: https://syzkaller.appspot.com/x/log.txt?x=1600445f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9878fe11046ea2c6
> dashboard link: https://syzkaller.appspot.com/bug?extid=ce483fd06e2061f44f5d
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>
> Note: no patches were applied.

