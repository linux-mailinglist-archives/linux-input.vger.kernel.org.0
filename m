Return-Path: <linux-input+bounces-11810-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640AA90C04
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 21:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86943A9498
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 19:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDBC2045B7;
	Wed, 16 Apr 2025 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FOrmY4u3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W7EYP9YC"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF52D1DC9A8;
	Wed, 16 Apr 2025 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744830837; cv=fail; b=WFemafqkn+xfLfCkjRyajXqLR2/Waf0gcU/2VLhxePOso5rABep6CQ4IktuYEAqZG6D6I1eJjAltoVFkIMEhPJVCxFRVexkdOy6QiYoYHgEoEhyu7jVJJxP7zIEjB6FdKdpu396j9BqxHetxQ6+kPfo6HLQIXZ9ASobPZdXmOv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744830837; c=relaxed/simple;
	bh=Foj+tVt0cyQW5qSOitgJh05P37POy7g62zBDCDP0OhQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UfyTHJaRdb3BO4I6dwOVuWbB34dgxCwsGw09B7/BOGBMyKnB1F9aDcKf8mNC5NA/K1g2rvMzl71mb0pWea8R6tsD7g4LRTai0ZCwqL4HCc/vfELPKc6lmj78TjJN18i+iMKLvJLmPBTPeP9ZI/aNbrz/laQ1MSkeldnC+jE9HDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FOrmY4u3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W7EYP9YC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GIuhn9006490;
	Wed, 16 Apr 2025 19:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=0RoVsl1w8WrBTBVdtcgwNEvPpdHir+/+9xr4MpoIy7E=; b=
	FOrmY4u3NITOy4lRdiC8EqJxQuIP0gWhzN3Jp93CDk2LhGGrOhddbHs54kr648kr
	T9jUtFMj/gNwD2mhtgj6KMiI89zGkZfx8NWksIQWrs84nufjc7CiKb09pAiLLWsf
	Zi4k9lwcJxwxgLjIX0fUe1q74iyti/nVUi9uL/AMGYnu5ahSZn8O9kjMQf55WMJG
	BpViu9Wjz9gahqefNDLj/k02MbbNdvxYrGK3i7zoKDd7SkCMJ0A/jRKuROPXRbo/
	G8aYOzmEDLaZw8vMv1GfFb/9kODiofaOCQztkGXMepZOb/xIz7GA4J18U8sBsmY2
	OyrdQ7pKWgAau9fnCRN05g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619444nte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 19:13:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GJ9WEU038842;
	Wed, 16 Apr 2025 19:13:42 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010005.outbound.protection.outlook.com [40.93.13.5])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4tdmec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 19:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDoTxEjRs1TKD+jrOrGs4H9JxQFbTpg2JK7ma2rUnABkcd94YJkuAQP3fvmfc8uIo3e7GwUxXjEtmGE1dTj3G7XXt+3JyCuVdNGdVHGFIB3yg8BBlAr9WPy6v6wDlVBakVN2V2QSd76PigkzW7PHiTe52x6D8BOwnSSlIvKlW2743f1+AmSiWqKuTCTuYOZeGT0HlI8e7a6IZZuBzlaTFuMyUcTfaIBMrV5Zr/3zIvKQMUNoiEtr9IvmJ94TVK+nsrm+A57fKGIhK+HHX5XC3vRyGkS084Sy7UUctJG1g2a5HfHfHzSTIYzE4myuc48KCSlwXaVuQFyrUN/p+byNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RoVsl1w8WrBTBVdtcgwNEvPpdHir+/+9xr4MpoIy7E=;
 b=DPDjxrA0f+uGCDb+dVZrt20DtELCEpGmFZKadBW7PN62KXcVaL+hI9qQHUscW99grO35pKrqxTgjrYlGz1HGIkofWdMpviLjBUq5fRZZPHnK8b6woEc2eIyjL5PC+MAUQ0oxOofuj+6qh5yv/tTwuUmifd2Xd246RnTQfPHmEeG3pv+Jbo7E8ud7upBIUlUpbLBST2JMqII3BaQ3YXbF/+4bGxGABcfjuJlB65XY35rqU7DPoj2OpPvEsZPzdIk0mqSgMyBI899V4VtkStMsAMnZfjses27o1Gaw3IcHsWZmSvhbeKuoIy30WlcxWVBE619s/2FNtf2b+Z9ZbPNhzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RoVsl1w8WrBTBVdtcgwNEvPpdHir+/+9xr4MpoIy7E=;
 b=W7EYP9YC0xofN5DL0Ixtvem67w7r8//LVknW20K8VukY2iNn83369FdYhZWzVbl7wYYEy506Zr3oqLwLZwGRte7pK4AjcQAoSgpyWyav86U9fgY5MvH/uXH+HtOlOMU+8RtAVpcbUyIxT/4OXPlzrLOdDfoXzLK+yOqChSuOZqE=
Received: from BLAPR10MB5315.namprd10.prod.outlook.com (2603:10b6:208:324::8)
 by DS0PR10MB7978.namprd10.prod.outlook.com (2603:10b6:8:1aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 19:13:40 +0000
Received: from BLAPR10MB5315.namprd10.prod.outlook.com
 ([fe80::7056:2e10:874:f3aa]) by BLAPR10MB5315.namprd10.prod.outlook.com
 ([fe80::7056:2e10:874:f3aa%7]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 19:13:40 +0000
Message-ID: <a03efee0-3470-4d7f-9a63-3ec9f1ae4f3a@oracle.com>
Date: Thu, 17 Apr 2025 00:43:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
To: Werner Sembach <wse@tuxedocomputers.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20250416171809.557674-1-wse@tuxedocomputers.com>
 <20250416171809.557674-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250416171809.557674-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0080.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::20) To BLAPR10MB5315.namprd10.prod.outlook.com
 (2603:10b6:208:324::8)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5315:EE_|DS0PR10MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 800358b7-e853-415f-d945-08dd7d1acbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTZqYmEwNTNDOGVPczRaS0lXazk3MmFCUFpJWkEzZTR4STVMNitIWWFBVzEv?=
 =?utf-8?B?aWtKeUdKbW55VUMxc0pSV2kxYnZYQWVZTnlVaFc1SzVqRVpkOW9QWCt2WVJJ?=
 =?utf-8?B?WThvRkpQK2hGN1Y4NytSbHNJOS9OcjA2Z3ZFY1VoMVpycTI0Y1FubnhORWVW?=
 =?utf-8?B?dTRWQUJDUU9vZmd3blhjb29wQlRoMnNHSEE5RnhOTGR0U0hWZGFxaVFxT1Nu?=
 =?utf-8?B?ZjRKQ1RXVlVZUFlZMHZtZGhxWEVlUUJzdUxYY0lqbTJOQ1YvaWozeEFhKzc2?=
 =?utf-8?B?c2lnQ3JlWGtPVk9jTERXdE0yUEU0Wlp1UXVWNjJ6MlpyejRpL1V6WXV4Ynlp?=
 =?utf-8?B?VXZKbElQR2lkYXhoWUJ6cnVBVGdZYXFaN05Nby9EMmNUWksrMDFZVHM0dHhE?=
 =?utf-8?B?SENjLy80czFaZHlkK0Nqd25VZ2FIUFovSExJOWFQb252UCs3WHZ2T3BCRVJz?=
 =?utf-8?B?SlA3YmJmWW0xRjRIeGhFUU9xUkZid1FLbWFjc3lRTGg2a0tVY0Q5LzI5amJZ?=
 =?utf-8?B?NTdqeEN4dVE3SDc5OFZYckF4ZjlkSGZsU1V5SCtCRDRCbkRnR2F1ZGVhbjZm?=
 =?utf-8?B?OEF4c0kwRFdaWVR4OUlpVUtMbTlVOGhucWxEN3MrdEFxR1Q1UjdRbXpOWFlj?=
 =?utf-8?B?aW8rTU0wM0orcVN5VXJBeHlUNUFwelJOVG13VXdSRy9aUE1RM3J6Y2NaOUdr?=
 =?utf-8?B?K1NiVTJUZTVOU1huTFhhWXFsd3lZWXBQZ2Y2OXdGOWlCSFQ3czF6WFZSMDlI?=
 =?utf-8?B?dGlTOU4yN2F3MWVtT21PVXY1enBINS8rVTFxVUF3cFpEOWdlR3ZpTUJLYVZ1?=
 =?utf-8?B?cVJWcXREbnZqVWR0Nkc5NFkrSXZ0SFhabEVFd3paV1gxYTgxclBTa2JERDlK?=
 =?utf-8?B?ZVM5Sis5bDN0dmc0Wk1OTDdqYzlSaGlsSlhTWGg1OStCVFFMYTlMUlpBZEJY?=
 =?utf-8?B?WkJ6ZFhmMk5nQ2s0T21vdTQzVHZwRGZhS0xybjVoL3ZHekFlcHBvMnF1WXpE?=
 =?utf-8?B?S0d0RW5XbjkxcWRWSHBJY3NaSXVuRGk1UjJsNmdZSVhLanNPMU4rUlBOejRm?=
 =?utf-8?B?RW1WYXQ1UEIrRlZkR1JxbWZoZ0k3OFZBVUpVNjBQQ1NENllFTHI5S2NOU09q?=
 =?utf-8?B?ekdWQVUrcDB1eWNYWm82WkJhQUovUVRPU1NaN1ladmVaYmdXdlNVbW1zdWhT?=
 =?utf-8?B?QTN2aC9YbEJUaHdVZE0vZ3podXA1ckR6NncyQXdpOTZSSCtyVmR5L0t3NWNZ?=
 =?utf-8?B?a05qVTVRZ2lCQ0QvRFBWekY3VHJkWE5CSWlSNEM0VEFpc1R1eFdqcnpjMDgr?=
 =?utf-8?B?RElJMWRab01OQzBjTGgrVWRBSlU1MjE1TGVncEoydDJqejVCRHRlV1R2Zy8z?=
 =?utf-8?B?Zmt5L2kvbGhDTmF4MW13T2dFYTA4UHRvMzdFVkZ2RlJ1SXZaOWdIL1lxeHdJ?=
 =?utf-8?B?V0UzTWFmZ2Jvb0VMWFE0c0YrT3VjMDBORktWZk42bndtdFo3QmFteGVzVlZv?=
 =?utf-8?B?T09ZLzhoTlFiWk5qZ0NnejlwMjlCVFROZG9HL2NQUUhPVlRTejJydDBLeWVE?=
 =?utf-8?B?cVhwc3NReXQwbVgyZkF1aXJFNGJJVXNSL1NGcVkrMnAyYVJtS2tNT2VYcXlq?=
 =?utf-8?B?alF4RGg3VHN4WHpEKzRody9vR0dZSzZ3QnlGd1lmaU5kQVQ5WUErVCt6aTVK?=
 =?utf-8?B?ampybHVhRHZCWWk5VFFISUdyazA1Y1VpTk9YQXNzdm1oRlp1c1U0dUFpMzVy?=
 =?utf-8?B?THhoYTBHTlFQaWU1YVF4aDE5Rm9jQkQ3bDVTb2Z4WmlTYlJMSTBnbkhPNkdG?=
 =?utf-8?B?QWFsT2RQTUorTXRERzJ4UzZNZCtteWJ0eWRCamJ4a3FBdXZIQldBcEtBRktW?=
 =?utf-8?B?VDcrdVpEcHFsU0h5blRxTWJzWG9QWnVmQWo0ZDUrTDNwYTk2SS9FblBKVGlO?=
 =?utf-8?Q?pLdy24esPkI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5315.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVJhWGplaVlDYlRjN1VRT2JaWmJUVTFVS1ZFdjB0cWNXMGV0NkJIL01tZ1hJ?=
 =?utf-8?B?dHl6ZG1CYlBuWG1QUFVyYmEyUFk1WjU0dEs2Ym5qRk9ubUhMTlpoV3RwMDBt?=
 =?utf-8?B?TTlNN0grN3oyQUV4dGJ2QmgzS3VhZjE0cGNpOWlZL2MyV3YwaG4zL013MXdi?=
 =?utf-8?B?UzFyRHlNNkFTTk1oVXZQNEM4bWI1d0thdUhKdnRWdXdEZlVOUjVRTVFtQlBa?=
 =?utf-8?B?YTF6b2EwTzE0RU0wbDRCTVNmVThCSFdJNk1YUE5pZDNadWlzdGlVNFZpbTFE?=
 =?utf-8?B?ZHhmUFNkcVpVSjRzU2o2T204NzhrQU0vMnNBZWM2SDlKeXlaQ0drVHdwdXVy?=
 =?utf-8?B?UnlQUWE0cXVjR01wNkErNW05ZWRQbEhkWUVsYXJ4VEU0N2ZqYmY5ZE9pd3Zv?=
 =?utf-8?B?Y0J2T2JvbmwvN2VpQ20wS3lOS3Y0YzhCemh5UitWVGFrNmFWM0VzL0N0V0lM?=
 =?utf-8?B?Q25wRXUvdlM1MjZKTjFPWHRBOEhIUW1mZ3lXc1MvU2kxNlZZdzNUcUN0WS9j?=
 =?utf-8?B?M1pDKzE2dmRTNlNnMXlNMEhWQW9RejNRWnIwdzB2SVV2akw0OC9SckZDMUJx?=
 =?utf-8?B?Z3RzUFV4UEQ2R0ViamdJUXdCMU1KdHphMmJMVkZLMkFwZ2xxVTdzalF3VEZn?=
 =?utf-8?B?WE4yZGpYTXJGYXloMlNXYnRYVlE5bDBaU1FnY1N3Vmo1M2kxWjV4UXJ1eGVQ?=
 =?utf-8?B?WmJtbjkrOVlFR2dIQStUTmlnYXRsenRJT1RHUFk3NElZckMrUUwrSDM3QmE5?=
 =?utf-8?B?bkRJU1d5ejB4bnVGUDVRbGV5VkZGWjM2dE5NQzdwdVNrVGtnZmw3WlRnbDRx?=
 =?utf-8?B?T01iRWRhMDZyQTJnMFFKMncvaUVvOHBsaHR5eFdOWGZ4bXNTajR3cm1renM2?=
 =?utf-8?B?VVNnQlF6N1Y4c1N4MVZkY21jT0RSVm9aWVVkMnVHZFZVMmFtVGpoYWUyOVpq?=
 =?utf-8?B?NzAwRVVHUE5QRDNBaGpDeVZhWDNjdW9zNXUwZzQvNTNxUTIzVmczTXJSZnN4?=
 =?utf-8?B?RDJwTTlPYm1taVM0REt6b0tKVDJNeG4zWG5tNFVDcEkzR2tkRkxlWEZrbjFQ?=
 =?utf-8?B?UlM1dXJyUThnYXdwdnJ5ZFZDS0tNOVBKREgwSWNHWnBVQVpuWldtUjArNzM4?=
 =?utf-8?B?TUhGYnE1SHkyWVV2Z3FZWll5Rm9RM0lYNnpxVHpYRmVtUTgybUlGTnVzRGda?=
 =?utf-8?B?VjFtUXlvbHdCSFJoWkVQc0sxL1BpelhPTTdaSDhtaDlLTzcvT1B5NmFVc0VL?=
 =?utf-8?B?TlNwZURSYXRDUXhORS8xTllscVdjd2lnbjdYZGZ4SDgwZ2RpQzZSRXJvNTJV?=
 =?utf-8?B?bnpaN3UvbXJnZzBOR3FGbzVLK2ZRRUZHYVVqZUxza0phVHdrYkVOTVFLdGZL?=
 =?utf-8?B?T3ZjTEo1c0dvK05KM0ZXbG81SG9tKzNPSDl3UTRPdGlPRCs0RXNFVWpnRFRK?=
 =?utf-8?B?aVdqVldnZW5HbllVSyt4MXpsenZGTWU4Zkp4MGZUZnMrWkFFYVBYMU1Oc1Ey?=
 =?utf-8?B?dFh5TE9nY25IWWJRdTFDVSs3UGRleVNDWXlLdi9qTldMbWw1YUxQRENVdk1C?=
 =?utf-8?B?eG5zeFhkeGR4VHBpUTVWNldVSlE2aDdIT3NZRjJaY2JFRHMrMzZMUG0rVUUy?=
 =?utf-8?B?NzZKMlVyRXM1bXdFNXBOalhYd29kV08wajdnNjRRRGpLQnltbHg4RmJMT3FR?=
 =?utf-8?B?N1JHTlpaYlpIQkdEZWxreUtmL0JIOTVxOWJ6ckhydzZYbGJxWVkzTUhiYW1E?=
 =?utf-8?B?bml0Yng0TlJ6Um44NkFvd1pkUTRPMG5EQTJyNFIyTktSb0YxbEpmYUswQ0V5?=
 =?utf-8?B?Z2xrRzMrbjFaUG9TTW9WS0ZEMHJyY1F0RVZhdkU1c2Foa0FVd2h6ME5IdGpp?=
 =?utf-8?B?UTNhV1ZmMkwvRlF1OUNQeUUwdWZwc0crYm02NlBXdlNmWWx2MUVGNlloNXBN?=
 =?utf-8?B?b0FyM3JUakpyMjJqdndXWlphS3BiQ0ZQcXhVRFJxUHdhWm54RGVqTGk3QXNx?=
 =?utf-8?B?cUpMTlNseHUxbHk4eXVHZUJ0eGtCN0dDcDNzVElSZnZVU2dMVjBrTHF3b0hn?=
 =?utf-8?B?cUR3K010L1hGQVJqQmhhSkJQa2p2TkFSNGdJNGhhQlRuSzU0VlB6ZDVHd083?=
 =?utf-8?B?L2pRTm01M3A5SmV4L21SS05reDhGd0ZkcnhqcmRERlQ4cy8xZkFJVHVyeTBE?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7CzSrKtNLoqYO+2jB3219AyOpiuc7usfZ+cvnRZi1I1Z4jslFUHbpWUa53sn6azidef5bEJiA/UeE0su4j3kKd9t4KI1GOQX/ozajmk4mps8zLBXWI+Uif8IN7OrPZ6EgXUR7A8R70kSEnJWD2nGM9lHBckoYibz46u3KkqHA3CVFqRdOxLyDTpU2tcl17A2sGKhXuRKx6DT29of/rrxcW6XavgEWX7l0gpWnS1OzioQnr8B1J8wzYZ2VP05/UGf78sWMiBam9T6zRus2KBr0kewf2YxWgGMCuV2otM0a9MF9KSqR+OVr6savZvbvZSzXD8yrFfMvzq3namNSLAPZe3/rnJ46ZDCo27RiyDWPc5hDxbPHpqSgU5LL+t9LgimZsDyQ9z+tuxQKg6dW9SAreXDVVSafYCAbHXPCM4rrj5+UNa5/B1II3vw7jvHcparHbHVqItz3OP6fn9ZPhsDrmXjXdtcqJr8uSo7v6E+ZfMVtvgh9NjWSQin+OlgjRgQXiX7pHRFkISYjpyjwXyR2L/KwIQRGZqCWSoJeTMlc4N9Pdxe56bEWCUkWVcA1RBFO9PocKAoU01CDRg7SohUMlZF1kBHZdH6OjLGaPc56o0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800358b7-e853-415f-d945-08dd7d1acbb4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5315.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:13:40.0580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmgI+QgGd8oQFNjWKwLeJk3ckxbRC2TY/LqD2LungF+2UkZKWZDVXzNhwSTWaiOcVYCsvYspPy1O/N2Y1YzbILuEvd1Ew6fUN6IUt9e6z/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7978
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=890
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504160157
X-Proofpoint-GUID: 1YbU89fWFovo1-NyncAqld7_nToXD-IL
X-Proofpoint-ORIG-GUID: 1YbU89fWFovo1-NyncAqld7_nToXD-IL



On 16-04-2025 22:41, Werner Sembach wrote:
> +	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
> +		if (rep->lamp_id[i] > driver_data->lamp_count) {
> +			hid_dbg(hdev, "Out of bounds lamp_id in lamp_multi_update_report. Skippng whole report!\n");
> +			return sizeof(*rep);
> +		}

typo -Skippng

> +
> +		for (unsigned int j = i + 1; j < rep->lamp_count; ++j) {
> +			if (rep->lamp_id[i] == rep->lamp_id[j]) {
> +				hid_dbg(hdev, "Duplicate lamp_id in lamp_multi_update_report. Skippng whole report!\n");
> +				return sizeof(*rep);
> +			}
> +		}
> +	}


Thanks,
Alok

