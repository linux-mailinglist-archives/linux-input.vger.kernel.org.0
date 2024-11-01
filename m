Return-Path: <linux-input+bounces-7833-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2F9B910A
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 13:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D3791F2121E
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 12:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AD519CC32;
	Fri,  1 Nov 2024 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RYrzYYWq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kJmbNFeC"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE8175D2D;
	Fri,  1 Nov 2024 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463281; cv=fail; b=qo5PWvA7hxsNc57ayFjz+6MMWAiGSjRqVfHOz9O6z/MkgUx3BvAxJ5DLV346YXG1I2REaU1z1J09X5ES1KkpPD9ph6JXfNppYOjBOK09k4bTYE0YyhJWhfo2YI8AJ58jbJCJ+z3wDTY4iEWOULPvJEvZmqVAMymFRnebQxg+No8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463281; c=relaxed/simple;
	bh=Eqz1rlm8Jf5szGtULWaDKvgxqWeia1G/qZMPuCv2ujU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YHtECtv8GB8+YVl/C6N1BxOxvLytekEStwmQ5oWpROyz9K42dzHx4UmHzYcA9nMzStx7CDOveUQpUuCyDjxlCS/QjZGnOatZjQWxYe0gD5u2AlcyG3g6Ls97EyBaihGNCkfM0n8Ig1sl5sAgquEFeGyaUNLQ0wdP8fFKpfBbq2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RYrzYYWq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kJmbNFeC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1C3Y82005926;
	Fri, 1 Nov 2024 12:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Eqz1rlm8Jf5szGtULWaDKvgxqWeia1G/qZMPuCv2ujU=; b=
	RYrzYYWqsivMu0kqYTJATVFSSXvuGgZVBMBNhanL14m6ThdjO2+BP1Q7bTwj3jgm
	kq4qhMMLMjqKPXgBNcvBskKey9MPndLbA7Wfz/mHwdcbjoCUWGKbkCNrHZ+NNsVr
	3emjGsnsr1a2E4EzYdUXJAjgHqYHoL8SwUGa+c/cfcBI3vX8iEw2D10K9wWBWGZm
	TzfrmRGxWcpyKHlOekzCeX15qjnI5M7WXQG8hzLVcxZMnCR2R0bgJ07VozrkygSu
	vABpp/okNStM8/Upi435zsaOIZl2k7ps8GiegwZnU4+XRgs0EVdYmLXXgkE5y6ml
	ELcDLfpgTmiUC3nRdY3cGw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxv4va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Nov 2024 12:14:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1AaW1p008675;
	Fri, 1 Nov 2024 12:14:21 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnedec9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Nov 2024 12:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqlP0rFJTkTN0+oG420E+fVIXid3hMFIHe6STw5tEEPxV72DA0Xxp7JOt+8ywCWOZgteYLzKzS3uoPQQTLfg4QvfVZsCTWQdiSTrxqR7dyLL1bnJRDav4YnaWrS0yZ/qm9b423mFBEqKFm3/OAl38xjZTRo1OgKFCmQ1sHLbLzd9MccQZg+f21oJr8AAkBXt1CkN0imGwg9FOvvkumlbaJD+CHUuU11P3ouPAo9vlOiNNgEj234dKSd0qn4ZVbANTbWhF7Rm4ec9FQ/8ho7KvNvnCM3XqbrvY+oLGf2Fe/34lY6BkJ7C/bycUr+m5qnXiVWpA5XkyO7Hgliqeva14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eqz1rlm8Jf5szGtULWaDKvgxqWeia1G/qZMPuCv2ujU=;
 b=yPTFbMfyq/+7fZLuer/YcbfST6LHTq+Ezj02nk39T9HQIncPkzqDvp2HPWAFvqucE3logM1uY9AYLSiKGGHKXRgIOsrxKhqOmAJzRqKEdSALNpAYmULpbyhtDHPvXwIxedtF31gsnpzcdj0hVTwM43G9ugBFVOvKBywfF8Iy0u7CdUSBNJNyrIvgOtzoFaihQ7cwdb2jgq3ZBVT8djEWYLgSVTJWGwGcB8P6epF41NvEKG3Gik8C87Y7jCcSMXLyqKhW/hiNEc1D4ed6F1f4mtbSYxIiAe0sEKCLO/JetnLBUGVkr19KVzRXhosrYaOWTKY8+jlSpy2sM6F1gex8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eqz1rlm8Jf5szGtULWaDKvgxqWeia1G/qZMPuCv2ujU=;
 b=kJmbNFeCqqrTXT9YxKTLrtxX+4Mau4KNTJ/bss2ewxJM81GCS+II7q/AKli/g4IMbZgcI1pDyCkeRM9LX6WZO6EVsrPyjmTwj47Di73PyfmGDuuElZXLobNEh4DMz3lOkwGL/TmAZWoVWIn5+9S9Db7Kpfynj6Hhun2zdSX+6Mk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4536.namprd10.prod.outlook.com (2603:10b6:510:40::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.25; Fri, 1 Nov
 2024 12:14:19 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8114.020; Fri, 1 Nov 2024
 12:14:19 +0000
Date: Fri, 1 Nov 2024 12:14:14 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Aleksandr Nogikh <nogikh@google.com>
Cc: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk
 (2)
Message-ID: <f908337e-a910-4f35-adc6-5c48f4a1bb99@lucifer.local>
References: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
 <6723b31e.050a0220.35b515.0165.GAE@google.com>
 <2928b6e8-3928-411d-82b8-6b17be266deb@lucifer.local>
 <CANp29Y6OdSOrP4q+1QL9bZU7SnDkMvmSAkFAGM0VqX9gwnZghg@mail.gmail.com>
 <2023ed50-9aa4-4bc9-8283-82a84c55bc36@lucifer.local>
 <CANp29Y58o0O8jTSP_SpBLVp7VK0bM4Svo7jBNZgDpv=s1DWJqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANp29Y58o0O8jTSP_SpBLVp7VK0bM4Svo7jBNZgDpv=s1DWJqQ@mail.gmail.com>
X-ClientProxiedBy: LO6P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: af063768-792f-4577-21ff-08dcfa6eb62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M25MUzgrVUxyWThqY3FFR0FUUEJ1NnJvVnY5dXZBTGE1TVB3NkNTM2FHWTh1?=
 =?utf-8?B?V0xJbXcrUm1BYjdUTHJ6ZG1vblVnMHM5UXMyYWt0M0xSRGFLcUovT1JjNVRK?=
 =?utf-8?B?UjVXNFl0NDR5UjdYb1hFTmx1cytxSzBOYkFwZWJmLyt0dHI4THFoZnAzZnYz?=
 =?utf-8?B?ZjE1TGcwV0UwemtXdHN0QWNGbXkwaDZkNWkvY1FNZFJjY0hpRTY3WmtWYytZ?=
 =?utf-8?B?SHprdGlPNkNJb0x1VkExWFlxL3E1bmlYa1E5eUc3bnJ2Z3Z4eEx5aWlFWnNB?=
 =?utf-8?B?SHVyZlhJT2xYSUJSVHdoYWUra3d2OEljUXd0RjJmK3ZkVit4bEIyamVYTVE3?=
 =?utf-8?B?bzEwaFQ3ZEJiZnhZSlEzTUMyOVBNNmsvbE9QeXErVHJJZG9YVm9IL0lWcFRt?=
 =?utf-8?B?bTFDdzFxcVdYUUhxb24yNGhxYlc5MmE0WVpTaHk4dkdpSjRQQXhZOCt5T3Ra?=
 =?utf-8?B?MlJqak1Bc0lJRzkzS2ErN2UzWTJvNlo1eXdVNUlqTFZYdExvc01qNkVxMVQ1?=
 =?utf-8?B?Snh6b0Z5NzlyZG9nQ0thZ29mN2RDM0FGNlB1V0VrRU1QVDlWTGtqTitKd05x?=
 =?utf-8?B?ODlyZ3BDZCtJdU43THpha0REYkplb1FHTDkvSXFaR0hhaHZrQ0ZFcWlySURM?=
 =?utf-8?B?cGovOXcxS21NWlJlaFdzRHhnS2FHRGhxVHhpelJQV2lnZlU5WWE1QmpGcXMx?=
 =?utf-8?B?cFRFbWdpNjRKM3FHTmJTMVY3cjJ1bEVWRmlkeW9pbS9QZ1JVT0c0bU1ZQzlC?=
 =?utf-8?B?OGR1cndMRVZxM0QzWkNCcWdBekl6WnJsQmlGYjFsVjVaSUw0Q3ZkS0dRdTJF?=
 =?utf-8?B?cWtwSy9KTXlIeVNGck44ZVFKOERDU25hTFNwb3BQcWNjUVErWUcrZUF4R09a?=
 =?utf-8?B?R090RDVqRU96REV1bVpxQzFoRlhHZHd0YkUzTlhJS2tpODBYcGZ0MHJYeWpH?=
 =?utf-8?B?emtrZTFnSXZyYmhTanN4RmR1VUpEeGNyV2N6Mnp6bmQ0eXZZdW5JV052Y2xt?=
 =?utf-8?B?Z1krMlJvcnh6WnY3dmJBcXVEOXIyL3B6aFYwVmhOV01YZmFLejMxYUQ0a3Aw?=
 =?utf-8?B?K1J0blFkb05CR1JCdzh3TUF6dDQwMmFzNkhlZTFMRjhSMDIwcnZjcFVkZFdx?=
 =?utf-8?B?dVFpZjRla0QrcDN3dXFGKzRjNlUrVm9yL1pDcUx1QmxIVEdhbmJvaUN0dTQx?=
 =?utf-8?B?akh1dmZydGFReFBqOUkzL2tHajBka1BHV0hJWlVDZVlkNGxURjdWcUZ3RHBP?=
 =?utf-8?B?Sy9rWElRMWN3azNvZHQyMFNFbUVtTFI1bjNWbmU1UWc1SW9ORjlhajluSitB?=
 =?utf-8?B?RHo4SlJnN0dGT3NrSlNCTEl3OWgxNTlpVVE4WWJyMWdQdUZTZTF1a1RwNkI3?=
 =?utf-8?B?MzRSY2QwOVV3MnZUMnBQU3VSYUZRYmc4YzhqYWk2akNpR3h4MzFEek5zMnoz?=
 =?utf-8?B?cnZpL3VzM3MySDBEK3ZuTm82b1dPbW5CWCtvUEIwaTAweEhvVElmazE1WFNS?=
 =?utf-8?B?S2pUR25kNDZ1SkNWNEh4aDJSZlZCWlNKVHhsMk5IOUxHVGZjZWVOYXhPVzlv?=
 =?utf-8?B?a2tiUi81SjN3U0RBZ0oyTUZ3aFQweVZEakxQOTZPWWlGNS9Cejc3YnFuY0FQ?=
 =?utf-8?B?YytYNGVIYkVLRkRNOThZbE4vNEgybW1EcFUxTUJyYlVKdUR5NjcwUVYycXJw?=
 =?utf-8?B?SkJDN2xjOFNra0xFSDdNZitsWXhKS3MzWXBTUmlqUFd1ZXNxOFRoRnZFUmZC?=
 =?utf-8?Q?3opBYB8zXvRCnCVwjfG8UvlQYUzZQbt6KMdLBwZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NOdndWUDV4RDd0Y1ZpTGpsbEN2U2k2OFJpRFREQVQraGRjYkNuWHdBWXQ4?=
 =?utf-8?B?WGl4T0swaTBET1EwZ0Z4NXFMdC92RUxvNmtuOU0rL3Y1RHdIOG5nT0lZWnpM?=
 =?utf-8?B?OWpxZ3V4RXdRRm5TSzgxMk5zSnZTRThCY2ZQbmRpWmQ3dHNOS0gvd1JwMjNw?=
 =?utf-8?B?bUE0di9ib2l3MU5TWWNLSG9ZS2JtTStWOTZmRkFDN1J2eHZHZ3BNWTZNbG5W?=
 =?utf-8?B?WTFMU3U0Q09lWHNiV25rQUN0UXYwUFJQT0dWSWF2OVpnT1A1TU9JL3JhNDNZ?=
 =?utf-8?B?V2dWelZwQWQ4TnlndDdMcThpWG9Ub2RMd01WSDhLa0x2N0pmOFJvZmlhVjFU?=
 =?utf-8?B?blQ0MWhkN1JpNDlmTytMNXBoVTl6aEhkUm1QWDRGcWlNalUxdm8xRWdHN0hs?=
 =?utf-8?B?ME9aMDFKc21GSklmZFhqZ1pNelpZbFBkTGs4YWw3YVM2Y2xlR2oyRndzc25s?=
 =?utf-8?B?T2ZTakFuSDRIOG1IUW1yTThLOUJCcXdFR0RiZldDd3EreVB5Und4OUJwTTlr?=
 =?utf-8?B?V00rRENjMjNJaDVzQzJmWjEydGFuSGg0elFyK3J1dG9ZcFRRZEd0WENuelNr?=
 =?utf-8?B?bko5SXRqVlJydnJMdmV5ZXV2a2o3TENnclN2TmpUZ0tvYnVTVjVRL2NlbENz?=
 =?utf-8?B?RHNlNmphcDRzWmo4Mk84dnIzUUo5ZGFpNXhsa1RUVExNbkxlYTc3emtQSUky?=
 =?utf-8?B?NW1oZTNPRGdPQThrQUdrTGRJUjh6ZGNqejdsb3A5Y1pLYUZWUWpKVWd4cW92?=
 =?utf-8?B?Z3RpeEdjR2ZObGNxZHEvTW9rN1ZuQnZySDJ2d1VnUGdVQ2V6c3c4cUFiaU12?=
 =?utf-8?B?VU13em05K2xEOE13bFdRNnF3cm53SjcvRFBOUmR6YnhMSTZZRU9GZm1CZVpv?=
 =?utf-8?B?U3RtYzlTSnJXZXJza3hTd01rTnQxV0QwcitvSTgzMGZ6aDlLRzFqbGJtYVhp?=
 =?utf-8?B?M3dROTlqbHNLOUxqdnh0T3FBOTJDa0NrSHJCL2xlNkJqREFXbFNEWEVXWkgx?=
 =?utf-8?B?Q0p3eXgrRktaU2RLdXRwdkc5dXlnY0RLdTA0TkMrckdrc0g1WEtRZEVueGdm?=
 =?utf-8?B?SHFvNFl4M2RhVkdKY1c4Q3hTQml2QkFLWmo2UjFwZjU0bGJKNmhTU0J2d1ly?=
 =?utf-8?B?ZzNIN04wTElmVGpjdGVueHF4SzZYdytSSXM5ZnUrQlpqVSt5U29RelVPcHR0?=
 =?utf-8?B?ZGFLQnE4VnZqY2FPUC9LZTBUNDd5ZWdkRTc4WFVmaFRzdjVxMENQSFNaZUln?=
 =?utf-8?B?Q09NaGNqMGRJZzEzM2FCbHhzK2oxdTkzUFVGc05ERlB0V2NKaEZ5bERsOXVP?=
 =?utf-8?B?cUtWbkdSbDJCZUN2U3JwUTlzc2RocGx5bVdHNXAra1lJOW5oMEZzUERsc2dv?=
 =?utf-8?B?SWpaNUEwZDJOUmh2RjU2Znc4dlJVKzZieUM5b2tmOTIrVjAybFpLaXRhendq?=
 =?utf-8?B?Wk9pMytkRkpOUUN6TnJYSnhyRGNHNzlKSkRmS3p6c0hGUU9kT2J4Y2RGYkxz?=
 =?utf-8?B?OE1lTngrU2VDQUVXay9uNHV3VXp6SEdHNzNwWHpxSy9Cd2xpbkc4N2NCT3Nn?=
 =?utf-8?B?aFFDd0NtWmY4NThqcU93NVZ3UWNSUWpmekpGRGlCUlljTzBTZXNmODl6bEdW?=
 =?utf-8?B?dFZBWXJtd2N0aDJxV2FLUUdkRFdzQ1V1bXZQT0RDOE11TnJ0Ums0a2ZCUWoz?=
 =?utf-8?B?UzMzL3RIQmlaRVFaUUlweDhlTkFyUEVSUHdjVmxIdHE3TzdhZFJqWWJUY2tm?=
 =?utf-8?B?anhTK1A2bjlwUXhkNVNUOHJ6eFIyZHd3c1dkYVhUV0g5M0E5RHowWUxZTHly?=
 =?utf-8?B?ZzVGWmdkZzZRL3l4VGFqL1hqUmVzTGlSRjR3cTNwcjE4NnJGUXRFaUtnSitj?=
 =?utf-8?B?QS9tcHJFMW50b0hYVmFXbTlYN2RZUTZ6dUROSGhuMVZ3YlBIRTl6c25uSE0y?=
 =?utf-8?B?ZUw5Wml1aTZKaTF3ZVcrRjZhTWh5d0IremZqM2ljL3NaNWpYUmRKRW5ISXQ2?=
 =?utf-8?B?L1FPd1VIcUdKcnMrT01uRWZRT0lZUGMvTkFXTmgyMjVkcTkrNTRSYUJoNmgz?=
 =?utf-8?B?SzY3aU81UTFkeUo1MDFLUTlhWmJWZlU2NDFBbEdGN1lVdTFvdGt3azA0OWZE?=
 =?utf-8?B?SHovTW9mZVJFV3hTUGZBOHFMbkdMWGpsVUVweUhsS0F0ZzdoMmdtMFRQN3J2?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	psOtQ4MXH3eDEZXdfIrH97Z72lGbx2kuBtcGCgvgY2xFExg8ht+NjK7mJybFSeGkW0USeItolOx8zi64Du8ihw20gQ8DnqtAtK4UAsDhr0MhbsppJ4xHYg5Baiy5uAAND8rRBnK/Zds8DnxAfRiz8f9zy0mKczgHFxA7/yg9uw2ocNjdqLMOb7hxI0fTU+xSvCZYUk+KKrzcBEirAOIKWbfZkQMSZICSSfNXCxYYyJePvaT9Ad8Htyh1uyx9KzojZ+FwK1x1sMvx7Av7QAMUuFNS4W2LPimSMb6eL55E856Qm8jdVye2IzwB8TroWl24W2ct2mSZt3atLzDhj0nPpk0hGfuHFHAf8pRm1GHbxPUY4wmLRuCHGvH1zG8d+3w+B/WmEAJLSFZQgtIstuFdbnfNvGMDI/OuDRg2+Eh4nyZOZ6264NTuGlw690QgcxMMvUlyNPQduzyOv1evUYOFv5h9oBaIMv5jJYAXsIP5JYg5NG7Hw6FwKoYxlqz99OkN1rxImMCaa4NjM4dmfuWTsC1/jOipygiwc0w//HwUvwslc0qFlqlGlFDBn1EDHUvVNor38n54Y/zsOa5R38mLRqJ5Tnny/geW/EKv7dSxZ3Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af063768-792f-4577-21ff-08dcfa6eb62a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:14:19.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yiVioIODe6Oh6NaMneIUHRLzWBYR4wwBkzOWScWw7nDv52Y/M/OEVY9BGF3B09FaQO9gLhkYZXQe/97qTPCvUBK87UL9RjV+uVm5GcuisQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4536
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_07,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010088
X-Proofpoint-GUID: e2NoxlVwVgX_t6M9UGNz-fDk95s0NLB3
X-Proofpoint-ORIG-GUID: e2NoxlVwVgX_t6M9UGNz-fDk95s0NLB3

On Fri, Nov 01, 2024 at 01:09:24PM +0100, Aleksandr Nogikh wrote:
> On Fri, Nov 1, 2024 at 12:11 PM Lorenzo Stoakes
> > Maybe worth setting CONFIG_RCU_EXP_CPU_STALL_TIMEOUT to 0 so it matches the CPU
> > stall timeout? At least for builds that also set heavy debug options like
> > CONFIG_DEBUG_VM_MAPLE_TREE?
>
> Oh, that's even simpler than I thought it would be, thank you!
> I've sent https://github.com/google/syzkaller/pull/5455, it will come
> into effect in a few days.
>
> --
> Aleksandr
>

Perfect, thanks very much!

