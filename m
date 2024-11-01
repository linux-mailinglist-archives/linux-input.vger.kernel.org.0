Return-Path: <linux-input+bounces-7831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC39B9004
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 12:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22DDB1F20FBA
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 11:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2825E18A93E;
	Fri,  1 Nov 2024 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NGISiOpO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pACQ3i9j"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955471D555;
	Fri,  1 Nov 2024 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730459526; cv=fail; b=RsVPtW6JuX17lrktJHaGFayfmaofX8s41oUKaDr47ZJhG5Q+NpkUwYTdaJYNvJIMDlnphfZD6YISHrXnOf7//wVZlSEeo2yvRz043C3OHuL8m9LwRNnoRAuc2XriLh0+go4xvOiJoZpT8N3wIxIM3PA3r70KntHddVOn/AK0WTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730459526; c=relaxed/simple;
	bh=Wn8i7V77myalYxZ48yUigwK1uPlMaogDeomwUyaEXHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dXe5X7V/z6Kn3ZB+95N8Q7yxko3pWOAOVFlL89Mh6ryvuosO6YeQzMVDMIpjyet+XPISkvbZGKnwNDDCQCbPH+IeuIRUDaU4KWs2IuowqXTVKrmkMm5/77EiJhgZb7vrCGURmderPs14TIyHsQNmAFUIj9os+OqzxBEv2fNQEns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NGISiOpO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pACQ3i9j; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A18fd0F017192;
	Fri, 1 Nov 2024 11:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=dOGFoKZR5O0+cxCWK/CarbYBq6AaWdQ9r/3XQX4yQN8=; b=
	NGISiOpO8NHH0glBIIo6INa2hPVujNTXneiRILuCa/BZKC9t+UDyscZBs948Zauq
	TbjlMDEnyCGWpc49xfJIaX2X7/1Z2BPfFfN1YUZhciEvmWFDhVdyXufNtyW3MN96
	Q5oztKZrppH8jpBMF8Wv3l+Y+hxc2tawBLChmjeeLNEr1fYKucQDm9AmIrzGu9jY
	Fs7MqH2UGTKK4h/jUY2udH7INEGLWO/V4R85GnYdudZVrQyvorl8wOh6x2RhldEM
	ntJN+oAZ43522w3kW31248JWCy9EafYPWKFw0FLGeVNVu0GYIM6WQP/J0RoU2eoT
	mzyCFq2+WH2Q+B3u1poS2w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc942k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Nov 2024 11:11:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1A6AfW040616;
	Fri, 1 Nov 2024 11:11:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnasu4x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Nov 2024 11:11:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBp1ljMFk/YvpVfqQqkobOOFKKKE9tlmTdn6D/PzyBf6O2GSSsgoXjEZL4wzeDB/Ly5alktUyIwgulog753TfJoYdpyRpmK8vZjLU3DkjI8u2/MfANRfVh7tkSGA6kS7CU0sBhhnouYmZO3xA8HNhtFAaA+l94SdpxbDymOdf0mSysn7q9+is/qidbvyGionRgbu13CvyHjbpOx6wpPOSX3Duo8eHoNlm8L3C7HQroG8Wedoe7Z1g/FjwRBga7Kkta1D82JW6KO3pjXUOAe3EI/X2hEA07o+ZyqT4PVTZbNslZY6QbQZjX5AvvLjTYveUhrKGzg2+tDId4nNd6+olA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOGFoKZR5O0+cxCWK/CarbYBq6AaWdQ9r/3XQX4yQN8=;
 b=xaizcA+OXiNcR92G4F9f/YdKWx39hG3wB0VLjow1Q+W6LN9a+sAbMVSzfub+UttZAmhr6Q2Dpm5ex84vWPHsH5oEtLShHzW+kJTxL7ShUVBKxXddrxEjTxf2j6vMVaB4eoFLNkEGY8MlHrNRcf7kKu1QBP0/MvM7HjOicnAXlVdhcwfxRiiWloJqmyH1mJYrAxk8q2v7voOYRf65M86c2hCMZaf+l1mdaCnHvSQuPJrGq5TrWBsJn4DBpLfNImSVtQjZziyRwkeectSeau9nWHFuAyMDfyA8YSKNkJlCdhKum/5++MX5dsHDhkDFx+YZOcP6YCazF6eGbkIjKts2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOGFoKZR5O0+cxCWK/CarbYBq6AaWdQ9r/3XQX4yQN8=;
 b=pACQ3i9jhvdtSFErG2xg7QNqW4SUlqzwKJbk+J27rg/FzBAjrd2liML2oeXf8lob2pHmuPrP+p1jncSf1dNqrzXRmgJK0BU28oc4vXP4vOVr3auwugF0O3nyIiE3yDQ5tw7WVFfOUhj7prnG7dFqw29T+ak2Dkc3e+jYHUMnshg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4789.namprd10.prod.outlook.com (2603:10b6:510:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Fri, 1 Nov
 2024 11:11:46 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8114.020; Fri, 1 Nov 2024
 11:11:45 +0000
Date: Fri, 1 Nov 2024 11:11:42 +0000
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
Message-ID: <2023ed50-9aa4-4bc9-8283-82a84c55bc36@lucifer.local>
References: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
 <6723b31e.050a0220.35b515.0165.GAE@google.com>
 <2928b6e8-3928-411d-82b8-6b17be266deb@lucifer.local>
 <CANp29Y6OdSOrP4q+1QL9bZU7SnDkMvmSAkFAGM0VqX9gwnZghg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANp29Y6OdSOrP4q+1QL9bZU7SnDkMvmSAkFAGM0VqX9gwnZghg@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0426.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::30) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ba82d6-16e7-4e41-2f4a-08dcfa65f902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MG1icDJqdm1aTWZ4d2xnSkRMZGh1YnVTRWVQYVZXTERHTkhXM0p2L01hL0hq?=
 =?utf-8?B?bWJyRWJBS2dQd1NsWExzU0s1cFdUWHZIQXBIajdUL20zWkIwdEZhQjJIb2Er?=
 =?utf-8?B?Zm9yTWV1NzY1aXk2MUd6TlhYZFdFWlAzekV4QUMzaytsY2FPN0lpMmhoQXdW?=
 =?utf-8?B?bDB2ZHoyT3ZiNzNGWmFKVzQ3bkVSWXZLNmZqdG94U1lrVi9yQ0wrSWNaZVpJ?=
 =?utf-8?B?OFRPRW5uMEFncWloRFduY0lXK0RqTHZjMjl2ajdMWHN3bFluUW9hMXg3b3dz?=
 =?utf-8?B?aDBXdnN0M01JVWNMZG01d05xY1NmRHRqMStoOWRGWE9Oc1QweW84S0lVaG5N?=
 =?utf-8?B?RktsZHlpLytSL085MTQraUpmbER6Q2JOMS8xSStnYVNGWmdjTHZ5T20vSkU4?=
 =?utf-8?B?ekdmanhId1I0MDNzczhBbys2K2orTHZGK2VuMTRQYlhhN082S2NSWThPWTJF?=
 =?utf-8?B?cFIzNmhaYVEyODdwRmMrVXh3djV4ZkkxeEwxRVVraVgwaW5Sall4aXVMdHhi?=
 =?utf-8?B?d2lROWUyVkhrY2pGbjAxS0dsT1ZaakN4KzlpbThpbWwzZ09CL243T203cGlo?=
 =?utf-8?B?Z2xaeXF1R1h5ZjlyTDRnMllCVlcxNFh1WG1jcGhZSkN1TDRWSXlWd0VhaThL?=
 =?utf-8?B?VnlqMXZ0bXJXZUVQSWRCQzM2bFVwREtaMGEvVDlkS3RTRWsxTzRGTVdTU1dz?=
 =?utf-8?B?aUpqK0JuWHd3Y1I3Umtlb1l0M0lTdXBwRXUxa0tMYVBUOUlOL0VvTzRnQXEw?=
 =?utf-8?B?M0haVXhqQmUrZVU5TW9VdXFTZExsdGZjc0xGZjh4cFpTVGQ0VVVhUm4wYWRY?=
 =?utf-8?B?MVFEZjRkQldWVDMzMVI3NGFHSnJkTTZyckJPcmQrWW1MMVNsM1RiWDNqTy9j?=
 =?utf-8?B?bnBiUi9wYjZMY0dnUTNMWlNiNUhVWDZzNDlRZG96WlhDQk03aVZUMW1EcVd4?=
 =?utf-8?B?VFJocjgxZTZDdWN5YWhMc1kyN0s0Qm85cys1TFFzcU5MWEMwRnJ6Q0VKRGwy?=
 =?utf-8?B?VGVSWE9sWmZtazVGQnF6bjN1NjdZaUFiYVhWeFdIekx5Z0RUdllKMFlPKzc2?=
 =?utf-8?B?dVJrbVBtYVYvNEpWcm1WYW9Cb3o3MFJmVk5QTTROR1ZXUG1WL2RRY29Ta0Z6?=
 =?utf-8?B?UDYvbE5qY3lCWEtBYlp1TTdkUlp0NFNDcGhESi92eVBmc0RGWXVVZzhzUE5C?=
 =?utf-8?B?WkExRkhtZ0MyMVNFblZuTi9xNktrVnBTSjRZSmp2R29qdzBKcnowRnZXajd4?=
 =?utf-8?B?MnlFMkJrMGo1Y3BsUHJxTjVXZmRQeTRCdUVycEZzcEkvbEdxZ2MvVW9LTGJu?=
 =?utf-8?B?STB5UG5xRElSNjQvSU1rTVJWdEd2VHpPbk53NW8vWE9EcCtqWWhSVmU4dGli?=
 =?utf-8?B?QU5uNXZjZVNxZXd2QmtXYVJBaUpGWUhXYWhrMUtCdjUweFZZWnh2S0hFQTBp?=
 =?utf-8?B?czVXY1dtdlM0dDIyTEtOU09hRWpuTHI3eEgrbzcxbXNsMXozZEJsVmJYTnpi?=
 =?utf-8?B?MVhpdUEzaE52bm4rZk0wNy9XSHZSejBwaGFsYUZGTEtXMmVFbytmdmdFVVhw?=
 =?utf-8?B?dmxjU0h3MmtNM2UwQ2RwMWdWaFhOdEVrSUNyVG9OM3ZXYzR5MWFKem5JWGdm?=
 =?utf-8?B?WU1PTmNMWEtBREk1UnZJUThBTEtRMFZCRnlsU0MwK0tyYWxiNlEySC94eEsw?=
 =?utf-8?B?TUVtbTlSVnY1VDd2dS9iNGxqMDBoQ3UvaUhSVDRLMld0ZG0xZnphSFFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnZtNGNpblYrRVNzVjNJejZNdkJJb0hxWU9lOFZ3WFhPVDlyQkVMbEVnUGht?=
 =?utf-8?B?M2ZqQ25CTFJnbWpSOVgrcjRnWXlsQkJSN3luWXo5c0dhcDZIUDcwd3V4OUhD?=
 =?utf-8?B?OWk2cDNUclVQc0FSb1ZLRzI3Qnl6YTNTeEg1ZWVMQmlkdjlObWtSb3pjU2Fo?=
 =?utf-8?B?eFlPM3l6dXg0MVpDb2wwNTRlOGU5UXlpYksxNUo4OVdnWG00QW56dzV3SmlD?=
 =?utf-8?B?UHozZC9CalAwa2llNmJFOFpiSHc1cEVWc3RTMlR6dEY0cGd0MGtMb1BybUtu?=
 =?utf-8?B?NHh1azlDUDJSVnNta0pIb3pDY0d6a1BoRld0TXlqTC9UNjFKcDFqQmJIWGpn?=
 =?utf-8?B?ckFhSjBXYklaSmZERVprbXZWdFRLbUQvZlNoNXdHdlZvWTQzUGZZZ3IzT0FC?=
 =?utf-8?B?Z3U5Sk5YOXY0NVhROG16cFMrOXBBMnN6eGxOUVZwVGtGOGRlalcraFE1QWpZ?=
 =?utf-8?B?WHBTbURYVnZSOXBiU2RiUkdCRDBUS3BKei93QmdVei91UzRVZU5jYkNTYWpD?=
 =?utf-8?B?LzdSSFh3U2Nldlo2UUQ4ck5relU3dUM4TE4rR09iUXd2cUw4aGlHa1FoUjZm?=
 =?utf-8?B?QW8wUE95YnJoU3ZqZEcrdE41cy9kbTIxTWdxK2VRYStTN1VIcndXMFNTbVpn?=
 =?utf-8?B?UTZXSUVMaExNMjdhUHNKVVdxb28wYWF5cUtTYVY3U28wTTVKdUVVZHBYb1Zo?=
 =?utf-8?B?TUxnbE5iUER2UFhkbzBWa3BFdFBzd2I0Z2NFWTBpdkw3aGxJL1BxUE15d29u?=
 =?utf-8?B?SmVGaDc3MHZKeDBGMXJDSDNFNE9sRk1jTDR3Y3lqVlQ3cUVkMW1xbVlMSTB5?=
 =?utf-8?B?aFlkVDUwUTNNbjAxK29PREg0dDJSdExtcEZ3WEtmakZnWjNMamVqZjBwc1ZR?=
 =?utf-8?B?VkFOSWN5alZPcjVrRytkREg1WW8vSWRlMG04TDU3d2kxNlJMSTB6RFZxRWpG?=
 =?utf-8?B?cFNCTVRwSkc1R2FheVdPejRuUUc0Zy8zekt3Rjh4VnZsWnZEU2FyWEt5TTQ3?=
 =?utf-8?B?M0gvWlBvYjJ3bTVDcVA0amY2UFhQaW9aRXRaRC9zZm16dDF6bkROWm5IWHNJ?=
 =?utf-8?B?eGxxWnBSNm5ybU9Bcnc5eVVKTG1YV20yY2ticE1pWnRhd3ZQNjFVQTB6bnVO?=
 =?utf-8?B?YmNoNFF1YnY1eU1JelB0TmhBVVE4c2poZFZQRjJGeis0U1Yxdm9FVzJJNjhI?=
 =?utf-8?B?TWJWNXlCeGNmaENIQndkUlNoVzRxR1paUDRDK00wc3E0b2JXdGgvYnQrNEtD?=
 =?utf-8?B?WE01MmVhRDUreHhQdVVYOVNYOWlCOENLTTFnRU9IcUdsZVVQVVU0Zm5GSXBw?=
 =?utf-8?B?a1BrL1dTS2JYNDBaNUVObVJla0NtRGpBd2VvNHdVTmVCQXhCeFY4d00rL1Bq?=
 =?utf-8?B?YUVEK3pNUG1LYWkybEFpQVptMk1aYXNuelRqSlhTb1hOLzJNeGM3SHJGdGwx?=
 =?utf-8?B?SUVDd2lyOXVZTEk3V1ZZK3BWR0lVUTBPTmdJWkRKaC82bktSak1FZ0xHM2l5?=
 =?utf-8?B?TWJyN1dMZHJjL3FwaVVuZ3VIOHA3dG05c0o5MitqVDdXc1lGTFFlZ04zR2da?=
 =?utf-8?B?L2h1aVZ4RVlJeDU2QmJCdERwZGNBeUd0QU5FTXJPelpRT3V3c2Y1bGpXaEFp?=
 =?utf-8?B?NGRQVEtEeU9oQjEzRjNUc1crajB1ZDlSTmRsN3Q1eVppNG4xUnFyMU9Va094?=
 =?utf-8?B?UlpPUUlqSU02NUJzelB0YnlYOHNIV0RnUzRrWUVtTUxMcFhCQUpFTzRoNk9y?=
 =?utf-8?B?Rk1PRDV3RmxDSGtZaUUwMlUvdjdQd3dudDF1RWRpU2laQmtYK2swWlFxK0Jh?=
 =?utf-8?B?UW1KVFIyKysvdU13TTMreFJJL0xyb0NxMXcwL2dmb1NhUzhiV1JvRkt4WHdQ?=
 =?utf-8?B?S21hMzhyVDl3eEc1NzVoODU2QzJLTmJsYkszbXdYOEgxNUZkOXFrYXlUU0N6?=
 =?utf-8?B?NzZpMG9OMk9lQUkzSUNpTktOV0RqcDFXSVJXMU1ZaVRVcWZTT0FQOTZIVG4z?=
 =?utf-8?B?d09qUGJZOVloNXlGem9IVEh6OWF4WldTSlBtQmkyaEJaM2czS3Arc0JsWDd3?=
 =?utf-8?B?cy83U1EzZGt2ZUM1dm4yRklPakJJc2dOSTkyTlkxMHpVT01jYWFtT3V2TG9U?=
 =?utf-8?B?UlpRTjJVVG1Ra3hLU0tDS2Q2SW1EZlJPRENsZ1Y3RW0zZzF6bXhTM0VnbjVy?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QmzQoWuypYGBrdH90glWMZ6TLUU//dQaX+s5vHEoHNzoSIuAUPDPlp8cXuo7uhzXnqeURw2Se9TX+stxRgcQaOUIuaNxiV5nDrxS/ftwLCx9nXMAxtZ3wwP1PJIdeIoNzpZp9k0mTbvYrSfSZOOuS8jMHATnG5RzkrJOB/mwC4t8DAOJ85jAPC26wo6/yug8q8vnPToRRDt7X53OJaq26hdwssieR2AYZCMzhzKEmayEVhKTllDz+gHcINZHtvUBmDsClx596dLZ897ELWhwFX3P8kD/7mtNG2XPdjtQIILq2ZWZkDkBiqa7qfvH4X+m72U4WYP728mop8wHd9QRaWISph4njOnONA64tnaDAFUhtdLBUhhARCnm/n4ZURm5zkD3XHYjft0mXIxxw/5HIsTwN2g9XpI4VmRms/YtPqFqw5gFiGFLPkJtKrQqHDERI4bFnRojSV9vE4ceaoPgOhOzPZAL57MjgEGaEm9rwkI2i1Q/T56ykJoHVDut8ygHnPIosFKAmw9Hr61j3HW9TIQfZXBjSNT53/pKuSvIjJgSoIsvVuZnehpdF966EJhwrRtFLrU3E9VsbbxHSWuUpY/txJxyXhpdXURlvHzYwvU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ba82d6-16e7-4e41-2f4a-08dcfa65f902
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 11:11:45.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmyoYObAvIT2viKC3uiVBsPcQbXXRXTQ+lGQhJ6+vlMpLf1WjK9nb84xvZe2D1Ke1sqZh5//+c4jV0e0iukvXC1UL1vU/X2d0zHOEzPmo0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4789
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_06,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010080
X-Proofpoint-GUID: K6-MeiFbVB0q1cZqAwYLCpyg6Y5pdiaT
X-Proofpoint-ORIG-GUID: K6-MeiFbVB0q1cZqAwYLCpyg6Y5pdiaT

On Fri, Nov 01, 2024 at 12:02:25PM +0100, Aleksandr Nogikh wrote:
> Hi Lorenzo,
>
> On Thu, Oct 31, 2024 at 5:59 PM 'Lorenzo Stoakes' via syzkaller-bugs
> <syzkaller-bugs@googlegroups.com> wrote:
> >
> > +Alan re: USB stalls
> >
> > On Thu, Oct 31, 2024 at 09:41:02AM -0700, syzbot wrote:
> > > Hello,
> > >
> > > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> > >
> > > Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> > > Tested-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> > >
> > > Tested on:
> > >
> > > commit:         cffcc47b mm/mlock: set the correct prev on failure
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=1304a630580000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=6648774f7c39d413
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=7402e6c8042635c93ead
> > > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> > >
> > > Note: no patches were applied.
> > > Note: testing is done by a robot and is best-effort only.
> >
> > OK this seems likely to be intermittant (and unrelated to what's in
> > mm-unstable-fixes honestly) and does make me wonder if the fix referenced
> > in [0] really has sorted things out? Or whether it has perhaps help
> > mitigate the issue but not sufficiently in conjunction with debug things
> > that slow things down.
> >
> > Because we keep getting these reports, that mysteriously don't occur if we
> > re-run (or hit other code paths), they seem to hit somewhat arbitrary parts
> > of mm, and because CONFIG_DEBUG_VM_MAPLE_TREE is set we spend a _long_ time
> > in mm validating trees (this config option is REALLY REALLY heavy-handed).
> >
> > I note we also set CONFIG_KCOV and CONFIG_KCOV_INSTRUMENT_ALL which isn't
> > going to make anything quicker if the USB gets laggy.
>
> These are necessary for coverage-guided fuzzing. Though when we find
> and run reproducers, we don't actually set up /dev/kcov, so I guess
> the impact of coverage callbacks here is not that significant here.
> CONFIG_KASAN is likely slowing down things much more.
>
> >
> > I'm not sure if there's a human who can help tweak the config for these
> > hardware-centric tests at Google? At least tweaking the RCU stall time
> > anyway?
>
> We currently set:
>
> CONFIG_RCU_CPU_STALL_TIMEOUT=100
> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=21000
>
> The expedited RCU timeout was limited to 21 seconds up to some time
> ago, but I guess now we can safely increase this number as well. I'll
> send a PR with syzbot config updates.

Ah thanks, just sent a reply immediately prior to receiving this :)

Maybe worth setting CONFIG_RCU_EXP_CPU_STALL_TIMEOUT to 0 so it matches the CPU
stall timeout? At least for builds that also set heavy debug options like
CONFIG_DEBUG_VM_MAPLE_TREE?

Cheers, Lorenzo

>
> --
> Aleksandr
>
> >
> > In any case this continues not to look likely to be an actual mm issue as
> > far as I can see.
> >
> > In [0] we were stalled in a validate call which would align with the idea
> > that perhaps we were just dealing with a very very big tree and getting
> > slow down that way.
> >
> > Cheers, Lorenzo
> >
> > [0]:https://lore.kernel.org/all/967f3aa0-447a-4121-b80b-299c926a33f5@rowland.harvard.edu/
> >

