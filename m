Return-Path: <linux-input+bounces-7400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5899E468
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 12:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D42F12837B1
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 10:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3275E1E412E;
	Tue, 15 Oct 2024 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Js9Ceq/O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oI5txcas"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0664683;
	Tue, 15 Oct 2024 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989077; cv=fail; b=izBXMxjCb+03afXzb9BVrlKxWj1WmKHH5eBt+L7udz9HVh93HqjlRD2LAotWrnaFlzncGwCfnrJJHWPxqzl9pLfzeCXRrN90m8QXQa9LkzmPU2QTy7KCttsJITqgfaTzPw+Bj/ZG1P73CWnbA0cQidZTgBWfWC2XVr/0aufWfDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989077; c=relaxed/simple;
	bh=iJbljleRu0Q1/MMyYAA3ejtCVnJlCrB1VbuVa3Nceeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jg/Y++veiAH4YT2GxT5GoxSm3snEBbeZy+oW5ZMzNwLFBBWjmHmd4cvq69dxer0Encjbq6nopJQwR2Ge+EWjsLXzcSNXTVq5w7Scf5rBNjxBCK1Nmw7tq1RAGGZ4CREJ9a61gbilyJO6fSFTDmGQVn8Sh51aiIri/Q/vaW6e9xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Js9Ceq/O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oI5txcas; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FAFxo8012603;
	Tue, 15 Oct 2024 10:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=pHlxfqIYiymkIJTw06
	2VUmU5O4yR1zRQOZfdc708Mtg=; b=Js9Ceq/OOQDtUulKHqQiLnyJEHEP5UQZnh
	AJkQO9NZu5WXHQdtUihj3RQ1bPfFW2yExYPfWmrKGHGjHNFAkqELmpsqgHwBqeV5
	nyePm9HSO02s8FNSfMvNfpSmOJj+Ps0NykyaFK0x8bz+Z+EsdQC+ka/P0tNMwgPQ
	Dn4UmIWwrXyM8hCjCvfThOhYoK9FuBO1B67mMiS9CH/1qc1aJGmWEaqVNHHnRzGG
	QIru+1AjYXXw4Tq504T0jS940gstdm9/V39/jCrbvvc/UD57PDyTx8e6iq6zubnJ
	j2gejBytqBnzsnUGmrdMGAF9+a4tNy4KqaQODffx5tzeYIvESi2g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5ch11t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 10:44:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49F9q2A4014817;
	Tue, 15 Oct 2024 10:44:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fj787eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 10:44:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gx0S5ZjxSnfi1JzMaivJaR+Yo/Vx0G6OqLoiTchHmmBypa6SojUXjPSJ2GeyISL+VJCnmWofxoLL1tbdQWwKVKm8m2003g0ZMsn1hI8lPWuqD1b+gHNbxGsFeJoNP8rJMJat7BsAFvAzJVPvPwETuVmK7P7rJh2hOq4zH5/nN555KwP9AkHmHEM9EnJ0KT+3nvlB1nSB1AdzDYqxH0P8jkLLy+zE6lX+mUAuu0r71G57belMRUE6bcBdaAwapGko7eWwo7hsBoOzeYphOElmENpsS3W/JJRpoeJ4lFhvhrhky3ciUoShYIO/n/VQZmbKJfZ8gaB0PueDcc5RO+VxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHlxfqIYiymkIJTw062VUmU5O4yR1zRQOZfdc708Mtg=;
 b=uGJx2SjnAL9avBWqNxLCKgNl/R7TB+mW8e+BJNSJGmhdqdJGn4BiZ9pdxpikShLdJF9rk6M02VUpFqfJ/CZniGuiUT84+Z7Ssdr0KQZ7qa12F/ng7V4W5vxTQGJwwzEJgUmPp3I+RsRhnZXU3Ptt3vES3jY0QWqzqw+PTtGRJkDvyM53aCoGyGbCkuSEp+Ku/TOSTle6wzLdTO38/DPdCsTRblYyHqKAaANqi4Wjut7Xzgt5vd5A1GEql2Cc2OjldqjysnMLozwlPsws1U5NT7NXpRROrrZJD8KoaDukH9LdGoMvrWsGjhkh4k+AZ8mXgYByWR156BLg+nCUihsybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHlxfqIYiymkIJTw062VUmU5O4yR1zRQOZfdc708Mtg=;
 b=oI5txcasy3pnkVYCgPNKRA6V03kZGk1KA3CsL2hRKRjyMpFP/CzJ/PyLkI9f6DpIp6jQssKD1fAC6OOpQo2lcHLo+XpE+40otrBW3lqlTb0x25ATRgtEATVXG79E4cQbJ+ms1AHQJX67YCdkOhx5h6aJ7q3C9zuV164OfP0dsKA=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by CY8PR10MB7242.namprd10.prod.outlook.com (2603:10b6:930:79::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:44:02 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 10:44:01 +0000
Date: Tue, 15 Oct 2024 11:43:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, liam.howlett@oracle.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [input?] [usb?] [mm?] INFO: rcu detected stall in
 vma_link_file
Message-ID: <63c90757-54ca-4f7d-8e7c-055ea1e4d071@lucifer.local>
References: <2442e7bd-bf62-4a1e-af45-8b36c088b071@lucifer.local>
 <670e44a3.050a0220.f16b.000c.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670e44a3.050a0220.f16b.000c.GAE@google.com>
X-ClientProxiedBy: LO4P123CA0506.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::19) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|CY8PR10MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 376b1277-b258-469a-f689-08dced06481a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UjY2lHU6ICnRQYDGYnKl5Un+Vnw/hE6KsxBkuVt/2tn219mh2JmAJA4CLwWz?=
 =?us-ascii?Q?Ycdzk6dE+W6SK1K7Ir+yiv0HZzuqn04mhlXTFwcTiEgBSFu5feDBjLUMY/tW?=
 =?us-ascii?Q?umpXpwvUyydaMBWH8z+1vLLjG6BfJzS7noHH4JHKBSvgDlACknEQm731mVb8?=
 =?us-ascii?Q?b46oYtUbkPZ2SfHz0yhnst1dHUVIKfyCH5jJjjx7PRMF3D/YIsr8ic+QU/gy?=
 =?us-ascii?Q?IY+oBVWN4HHiGgjfP5Hznrob1vYe5c+Vzd260pRQQXxPLLWySztPZ12soX7l?=
 =?us-ascii?Q?XKL5nFW+Z7+LBGxxTAxxo/pGYf6P0JQhZqfiyNDpy7yxdwlNbe5FUQ7Vf4cm?=
 =?us-ascii?Q?bVdKbM8xpxjbuVizfShIrJN6v0XtU/JTZOZhXyXfTsfoDHRpyC+zYC6kzirB?=
 =?us-ascii?Q?5iHFCPuejK9lxB5x8RsacpJILQZW3qErR8szMIqaS+fvUZ02484iFt0kApOp?=
 =?us-ascii?Q?q1b9IRz+0ufTkWojGNUuw6iymEPPkut+RnjfDl6QJN7MCKahMSl/L59/3shb?=
 =?us-ascii?Q?sffX0n5iyqfymkI2e+pOGHTb1fna3wsR2usT+SoUmuoegI9dPo3u6kv54/sp?=
 =?us-ascii?Q?00M6I3iAAJBZDJ/Ic1PuViiqBJt7ayjVPeKT130tlfyRIg7oNM+E5VEkib+b?=
 =?us-ascii?Q?xjbtdD1w+NqCMh6NqGkJC9gCEn3ARc+Cs/gQ1wdv7NhPVWc/BjE9LLUA5KHP?=
 =?us-ascii?Q?g1BLaTBOulYahbrV9h/SJ9ZINix0cmOhVY5vbqpBTdT7n8KebjxJhwGTFdkR?=
 =?us-ascii?Q?0uBiodnBSNU67KNgCM8uuc4tty+qpbrNkmwqtGFioOPLs1ERmRe4yXUpB/cX?=
 =?us-ascii?Q?PNK8kK/89tDnrSSb9wft3U/aeoGx02J+FbH224Ku/3QieY2nEH86DIKCOraK?=
 =?us-ascii?Q?l9ZXGMy4IM/x+4akXagf++/7hQQAstzOrt2lcyRKDZ5Zzq/I6jFZJBlcZAJc?=
 =?us-ascii?Q?iR5pVL3cW4J7NTwyos0HMyqYepyQRHeNOShn9GMp74xb2bvgzg0YzuWsrsg9?=
 =?us-ascii?Q?4Oh8oNNqBDKG2dknEcNWJLiSNKTqgLywnMz3JiryzZtoMRjc9ImxWDwmbUvt?=
 =?us-ascii?Q?byG/EkGwLgnX3B7UpLZV5VX0DfYEHdIc8KHcxZMlzX6u7VdvDdDzXUA77PBk?=
 =?us-ascii?Q?jWpwbLm22wJODefsi7n1Z3TM7QhvAb0pp71gS69LVtYKjD3IAFMyXCE9e5s8?=
 =?us-ascii?Q?M9fAt5CvE1g1esppLRbKD+2RWD50py/T3feTZDIFUfXJKCaXOcpb/P8SooQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zU1AO8O+H6vuryOV75lSxwfI8zc17Yyu8ha3wxIoesCtjE4yDherxLrd6btM?=
 =?us-ascii?Q?I7Lx2MiTgTV2166kbXPMQ7DdK6gp015W4BeR9vW6vO/QuTE0G+mdTanM5Lw0?=
 =?us-ascii?Q?mzGS17n6d0i45QP0FynQL8WuDGHZAz/Rwt+kL59pk8e7T5RtifE4woI6gzV5?=
 =?us-ascii?Q?1el/AmnChV2W+tbp4/6E6hw6DBq0SZw2PIOTqSKVyMp/+oyaHVVcnamE7KB7?=
 =?us-ascii?Q?9++0oaTiw7dhSL6mBbZadeMGhF8mu4y+QMINT0Cv49CkhkSWk/rJSSWumtZr?=
 =?us-ascii?Q?Q4/COiCrcjqv89/lmWVtmjh+a8qcQQRgVvMV5aD9q0Tiq9E2UvMx7s14KfJl?=
 =?us-ascii?Q?HStQ0sHtBdJBsKV+auE2FY3+RPZ/onP9I2gU1mxjR+tyMB+UKZRxo0NLSD3l?=
 =?us-ascii?Q?zMDOCQAgWFzI4q/Vexs547kSSh4p6NFI+3/TWg1LP361AMg0GVFB91uhGFxX?=
 =?us-ascii?Q?j1zQ/etL5tkkkKr10qwaJqSKGTLOnWJ1AYXrjPFZOZzVfgUwrIZJMRMptsWi?=
 =?us-ascii?Q?WpePVp5eSvcqUBQP8tT6gwb65hbbCuj56Qmm6NIEE92+9g0kAowER5IAut1w?=
 =?us-ascii?Q?JBRBmgnXwdgrwKSfU9vLN5gqAkDMQcRI4OThMI3oq19tsyg0wSSGTSAqtsug?=
 =?us-ascii?Q?mwraAp4iI763YoUdHlOlkQlYXjktVnRxIvcXpPYt9lTjJe0vAT0IlWQn9uJ8?=
 =?us-ascii?Q?TsFAD0QeKp1m54A2lV+dsWixRI49UWHFDdYdG3OIcHVGiutEIPT/l67H7R4X?=
 =?us-ascii?Q?yNAQG8tpx7/tT5wf4L8rrwSvaBh2yao37TpRMz4q4O2iCOuOKPqbPGs139+M?=
 =?us-ascii?Q?6iTEI7uKaDwO6iU2dO3yMMbsT/EMvuRcAna8s8vB08ZoM9kerodXANM2XNzm?=
 =?us-ascii?Q?iVnNCX/5YtLyyRbHSGcMOMlBiyzjSM2slgOOVZpRG2SefEEygzHAN0cYUvEx?=
 =?us-ascii?Q?cVVtcNtVhuXssTMqRceN+Ykps9O/ozauYpXzRsoIP7fF9UvvOTIQKO3SSYJU?=
 =?us-ascii?Q?rSLFx1VUEVbMTcTRMHZK9z+ByYioZjvVF/TaGecgnwLLgH7MkhjEPpjKgYVq?=
 =?us-ascii?Q?3TgJtxUN1+p9dJiFo7fKPPWkS/OkBd/gHmzd8GrgmkxKK/dWU+3z+a03THvX?=
 =?us-ascii?Q?ftwFm4j7ou0CmIOVLSAUZ5YciZ3rUr94Ubi/7R08rdfPV8Jcd21OSWLG1GnL?=
 =?us-ascii?Q?exZjghfxusyQZbLsTpqPFWy86e8meyZIROm6qLTzuxfpoH4yhy9pQkLyuUxU?=
 =?us-ascii?Q?QJiElAynd8IC1Em00EV7Y3jD2Mw8kOe1liGvGalrzzLt+10dOBsghx8GjLn3?=
 =?us-ascii?Q?ohmMY80bybpsEk9+YiQfQiNOwif3rWDsJb0JR4nwTDPUZ09enobgVd5uax/x?=
 =?us-ascii?Q?NWNERI1Psb8oeW4vEAlY4DpUQU1Q0U20J6mN165XKkaHn1mZC3GyJ6uoDt05?=
 =?us-ascii?Q?n4Toa2TvlA8zx6y1w4SccfvEQuVHcDsQGLloQUnt6bdJ3IhL0dNCzJKPpEqv?=
 =?us-ascii?Q?WcSksZX3y+UHU615kWFx4h5BspXtat0Th9bXIKcYbNrBSulMRt+qniuf8ejp?=
 =?us-ascii?Q?YjvG3dv4yAqIbGgLSek6w8xn5uBE5fkxbfzwlKaCH43Pd3PLVtfKAO8uvLOM?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xYl9woCuPWeqkp+DqotMcv9vYUrat+KHPbpjPge1f6F5IOD0QIFBCp3MesCfJbeuYVFX64NicXqJxwG4ro5AyGYgn0QZ/7fFbQb/ucieuIJHqW+C7h+R6EE+h9vTYUo6V3KW2tnLfJI5x6R3WNboxQEs/tFJhPM9IIgXs5SMckYrmRaKd3k1JljqZ1PTABik0jfnBBOMMTfqjUK3MjtXbq5S8khBciosDOQowPhZNRr9/NNWvroLXp93HmWLvfwduI8q+kPpahRiWm9eoPzn5EV4cqYZUE2in54AdYE5cEUT4qDF/bC3rMk9HfnqAoWDnDOgpSs6FLe1i6EwdbJEGxBlc7j+5s/VLsvRpmdIxGYJtg8iGgPoSVqhT9zkd/A0WFA98PsQgpFjgbu3tRQCwDJ/dVXPDLeh3BGq1TgZNvYnRVO1KDgv79EFJ5Lvx888UM2CVEszCeD6NASsaNQLqciJ7QIcSS+B0OmPI/5UZ+N5YtVCgywyE9fJTR9p7QxxXOIua+3UcRjPv87FBCxgl8DXPdodyOg9u1F8wvbtlvmPRAhHQPhvmXBVXiSlxKDELAnCtYfJTsDjUsV9kK4HToFeg2JktYqbYCkw8DZd0lw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376b1277-b258-469a-f689-08dced06481a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:44:01.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2aAmtru+c8eK+U+jBOlQRroCoNl7+N2hNBMZetNqjQW8VNm4cvklAuhQzfj3qI/Og2tSk0ForRmzwV5VHEj3y96hmWFhrOdLiAZLcffSsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7242
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_06,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410150073
X-Proofpoint-ORIG-GUID: MvcC73u9ekFGrwFgCocxr5-1xI4Y8jdq
X-Proofpoint-GUID: MvcC73u9ekFGrwFgCocxr5-1xI4Y8jdq

On Tue, Oct 15, 2024 at 03:32:03AM -0700, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: rcu detected stall in do_syscall_64

OK I think we can rule out the maple tree bug.

I don't see vma_link_file() in the splats below so I'm thinking this is
unrelated to mm, probably?

USB guys? :)

>
> rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 1-...D } 2664 jiffies s: 1445 root: 0x2/.
> rcu: blocking rcu_node structures (internal RCU debug):
>
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 2532 Comm: acpid Not tainted 6.12.0-rc2-syzkaller-00039-g00c5e66c934c #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> RIP: 0010:io_serial_in+0x87/0xb0 drivers/tty/serial/8250/8250_port.c:407
> Code: 79 b5 fe 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1a 66 03 5d 40 89 da ec <5b> 0f b6 c0 5d 41 5c c3 cc cc cc cc e8 f8 f4 0d ff eb a2 e8 81 f5
> RSP: 0018:ffffc900001b7f08 EFLAGS: 00000002
> RAX: dffffc0000000060 RBX: 00000000000003fd RCX: 0000000000000000
> RDX: 00000000000003fd RSI: ffffffff82a065b0 RDI: ffffffff93633660
> RBP: ffffffff93633620 R08: 0000000000000001 R09: 000000000000001f
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000020 R14: fffffbfff26c671e R15: dffffc0000000000
> FS:  00007fce9143b740(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000001b2ce5ffff CR3: 0000000115abe000 CR4: 00000000003506f0
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
> RIP: 0010:do_syscall_x64 arch/x86/entry/common.c:51 [inline]
> RIP: 0010:do_syscall_64+0xc0/0x250 arch/x86/entry/common.c:83
> Code: c6 bf 15 79 48 8b 50 08 f6 c2 3f 0f 85 3c 01 00 00 90 90 41 81 fc ce 01 00 00 0f 87 43 01 00 00 41 81 fc cf 01 00 00 48 19 c0 <44> 89 e6 48 89 df 21 c6 e8 d3 4b 12 fa 48 89 43 50 90 48 89 df e8
> RSP: 0018:ffffc9000182ff28 EFLAGS: 00000297
> RAX: ffffffffffffffff RBX: ffffc9000182ff58 RCX: 1ffffffff14ac131
> RDX: 0000000000000000 RSI: ffffffff8727f1c0 RDI: ffffffff8746eb40
> RBP: ffffc9000182ff48 R08: 0000000000000001 R09: 0000000000000001
> R10: ffffffff8a56428f R11: 0000000000000000 R12: 000000000000000e
> R13: 000000000000000e R14: 0000000000000000 R15: 0000000000000000
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fce914b1773
> Code: 00 f3 a5 48 8d 74 24 88 48 b9 ff ff ff 7f fe ff ff ff 48 21 c8 48 89 44 24 88 41 ba 08 00 00 00 44 89 c7 b8 0e 00 00 00 0f 05 <45> 31 c0 3d 00 f0 ff ff 76 06 41 89 c0 41 f7 d8 44 89 c0 5a c3 41
> RSP: 002b:00007ffc56b7f150 EFLAGS: 00000246 ORIG_RAX: 000000000000000e
> RAX: ffffffffffffffda RBX: 0000557975a80906 RCX: 00007fce914b1773
> RDX: 0000000000000000 RSI: 0000557975a86480 RDI: 0000000000000000
> RBP: 0000000000000007 R08: 0000000000000000 R09: 0000000000000001
> R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffc56b7f258
> R13: 0000557975a80178 R14: 0000000000000001 R15: 000000000000000a
>  </TASK>
>  </TASK>
>
> Showing all locks held in the system:
> 7 locks held by kworker/0:1/9:
>  #0: ffff8881066e5948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
>  #1: ffffc9000009fd80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
>  #2: ffff8881097a7190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #2: ffff8881097a7190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f40 drivers/usb/core/hub.c:5849
>  #3: ffff888106ab5190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #3: ffff888106ab5190 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #4: ffff88812c375160 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #4: ffff88812c375160 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #5: ffff888119b1da20 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #5: ffff888119b1da20 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #6: ffffffff89bd6b08 (input_mutex){+.+.}-{3:3}, at: input_register_device+0x98a/0x1110 drivers/input/input.c:2463
> 2 locks held by kworker/u8:4/54:
>  #0: ffff888100089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
>  #1: ffffc90000547d80 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
> 2 locks held by kworker/u8:5/236:
>  #0: ffff888100089148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
>  #1: ffffc9000163fd80 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
> 7 locks held by kworker/0:2/679:
>  #0: ffff8881066e5948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
>  #1: ffffc90001c1fd80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
>  #2: ffff88810977f190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #2: ffff88810977f190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f40 drivers/usb/core/hub.c:5849
>  #3: ffff888105a8d190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #3: ffff888105a8d190 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #4: ffff88812c377160 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #4: ffff88812c377160 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #5: ffff88812bf35a20 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #5: ffff88812bf35a20 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #6: ffffffff89bd6b08 (input_mutex){+.+.}-{3:3}, at: input_register_device+0x98a/0x1110 drivers/input/input.c:2463
> 4 locks held by acpid/2532:
>  #0: ffff8881082a5230 (&dev->event_lock){..-.}-{2:2}, at: input_event drivers/input/input.c:397 [inline]
>  #0: ffff8881082a5230 (&dev->event_lock){..-.}-{2:2}, at: input_event+0x70/0xa0 drivers/input/input.c:390
>  #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
>  #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
>  #1: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: input_pass_values+0x8b/0x8e0 drivers/input/input.c:118
>  #2: ffffffff89387a98 (kbd_event_lock){..-.}-{2:2}, at: spin_lock include/linux/spinlock.h:351 [inline]
>  #2: ffffffff89387a98 (kbd_event_lock){..-.}-{2:2}, at: kbd_event+0x8a/0x17a0 drivers/tty/vt/keyboard.c:1535
>  #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
>  #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
>  #3: ffffffff88ebb100 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x7f/0x390 kernel/locking/lockdep.c:6720
> 2 locks held by getty/2605:
>  #0: ffff88810f74d0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
>  #1: ffffc900000432f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xfba/0x1480 drivers/tty/n_tty.c:2211
> 11 locks held by kworker/0:3/6516:
>  #0: ffff8881066e5948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
>  #1: ffffc900026cfd80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
>  #2: ffff888109797190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #2: ffff888109797190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f40 drivers/usb/core/hub.c:5849
>  #3: ffff888130c4e190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #3: ffff888130c4e190 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #4: ffff88812c376160 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #4: ffff88812c376160 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #5: ffff888131021a20 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
>  #5: ffff888131021a20 (&dev->mutex){....}-{3:3}, at: __device_attach+0x7f/0x4b0 drivers/base/dd.c:1005
>  #6: ffffffff89bd6b08 (input_mutex){+.+.}-{3:3}, at: input_register_device+0x98a/0x1110 drivers/input/input.c:2463
>  #7: ffff88811aa2e2f0 (&led_cdev->led_access){+.+.}-{3:3}, at: led_classdev_register_ext+0x51b/0x9e0 drivers/leds/led-class.c:515
>  #8: ffffffff892bb7d0 (triggers_list_lock){++++}-{3:3}, at: led_trigger_set_default drivers/leds/led-triggers.c:284 [inline]
>  #8: ffffffff892bb7d0 (triggers_list_lock){++++}-{3:3}, at: led_trigger_set_default+0x5c/0x2a0 drivers/leds/led-triggers.c:276
>  #9: ffff88811aa2e208 (&led_cdev->trigger_lock){+.+.}-{3:3}, at: led_trigger_set_default drivers/leds/led-triggers.c:285 [inline]
>  #9: ffff88811aa2e208 (&led_cdev->trigger_lock){+.+.}-{3:3}, at: led_trigger_set_default+0x70/0x2a0 drivers/leds/led-triggers.c:276
>  #10: ffffffff88ec69f8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock+0x282/0x3b0 kernel/rcu/tree_exp.h:297
> 1 lock held by syz.3.23/8804:
>  #0: ffffffff88ec69f8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock+0x1a4/0x3b0 kernel/rcu/tree_exp.h:329
> 3 locks held by syz-executor/8833:
>  #0: ffff888113c743f8 (sb_writers#5){.+.+}-{0:0}, at: filename_create+0x10d/0x530 fs/namei.c:4019
>  #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:850 [inline]
>  #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: filename_create+0x1c2/0x530 fs/namei.c:4026
>  #2: ffff888113c88958 (jbd2_handle){++++}-{0:0}, at: start_this_handle+0xf6c/0x1430 fs/jbd2/transaction.c:448
> 2 locks held by syz-executor/8851:
>  #0: ffff888113c743f8 (sb_writers#5){.+.+}-{0:0}, at: filename_create+0x10d/0x530 fs/namei.c:4019
>  #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:850 [inline]
>  #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: filename_create+0x1c2/0x530 fs/namei.c:4026
> 2 locks held by syz-executor/8852:
>  #0: ffff888113c743f8 (sb_writers#5){.+.+}-{0:0}, at: filename_create+0x10d/0x530 fs/namei.c:4019
>  #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:850 [inline]
>  #1: ffff88811061b508 (&type->i_mutex_dir_key#3/1){+.+.}-{3:3}, at: filename_create+0x1c2/0x530 fs/namei.c:4026
> 1 lock held by modprobe/9577:
>
> =============================================
>
> task:init            state:S stack:22000 pid:1     tgid:1     ppid:0      flags:0x00000002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __schedule_loop kernel/sched/core.c:6752 [inline]
>  schedule+0xe7/0x350 kernel/sched/core.c:6767
>  schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
>  do_sigtimedwait+0x42f/0x5c0 kernel/signal.c:3665
>  __do_sys_rt_sigtimedwait kernel/signal.c:3709 [inline]
>  __se_sys_rt_sigtimedwait kernel/signal.c:3687 [inline]
>  __x64_sys_rt_sigtimedwait+0x1ec/0x2e0 kernel/signal.c:3687
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fd5ca08a23c
> RSP: 002b:00007ffc7f2936d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000080
> RAX: ffffffffffffffda RBX: 00007fd5ca2c013c RCX: 00007fd5ca08a23c
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007fd5ca2c54a8
> RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000000
> R10: 0000000000000008 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007ffc7f293738 R14: 000055ff5f932169 R15: 00007fd5ca2fca80
>  </TASK>
> task:kthreadd        state:S stack:27024 pid:2     tgid:2     ppid:0      flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __schedule_loop kernel/sched/core.c:6752 [inline]
>  schedule+0xe7/0x350 kernel/sched/core.c:6767
>  kthreadd+0x5ba/0x7d0 kernel/kthread.c:755
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> task:pool_workqueue_ state:S stack:30464 pid:3     tgid:3     ppid:2      flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __schedule_loop kernel/sched/core.c:6752 [inline]
>  schedule+0xe7/0x350 kernel/sched/core.c:6767
>  kthread_worker_fn+0x502/0xba0 kernel/kthread.c:851
>  kthread+0x2c1/0x3a0 kernel/kthread.c:389
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> task:kworker/R-rcu_g state:I stack:30288 pid:4     tgid:4     ppid:2      flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __schedule_loop kernel/sched/core.c:6752 [inline]
>  schedule+0xe7/0x350 kernel/sched/core.c:6767
>  rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
>  kthread+0x2c1/0x3a0 kernel/kthread.c:389
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> task:kworker/R-sync_ state:I stack:30832 pid:5     tgid:5     ppid:2      flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __schedule_loop kernel/sched/core.c:6752 [inline]
>  schedule+0xe7/0x350 kernel/sched/core.c:6767
>  rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
>  kthread+0x2c1/0x3a0 kernel/kthread.c:389
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> task:kworker/R-slub_ state:I stack:30832 pid:6     tgid:6     ppid:2      flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __schedule_loop kernel/sched/core.c:6752 [inline]
>  schedule+0xe7/0x350 kernel/sched/core.c:6767
>  rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
>  kthread+0x2c1/0x3a0 kernel/kthread.c:389
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> task:kworker/R-netns state:I stack:30832 pid:7     tgid:7     ppid:2      flags:0x00004000
>
>
> Tested on:
>
> commit:         00c5e66c MAINTAINERS: kasan, kcov: add bugzilla links
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
> console output: https://syzkaller.appspot.com/x/log.txt?x=127a045f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e56f1fcedfd0b54e
> dashboard link: https://syzkaller.appspot.com/bug?extid=ce483fd06e2061f44f5d
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>
> Note: no patches were applied.

