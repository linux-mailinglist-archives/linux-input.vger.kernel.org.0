Return-Path: <linux-input+bounces-3747-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4688CA009
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 17:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB0C51F21C62
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 15:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C039B136E37;
	Mon, 20 May 2024 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fxheH8/9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LBdbBeXC"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9A13699B;
	Mon, 20 May 2024 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716220089; cv=fail; b=VQSDV1ctcVFJvzKDUpD3s+TNjrETECr2xuNPqjcvp0xnPMAPiZzZxz6jVOK3rwvYSl/BjZT/rMkB1jb2ErpmwNRl4aDS6jH+fM42GS2gCgQvKS7ua1Z1rcbGVFBrVN2PrX2fb3AQMWefPkSkf46yyM3HYFaWQoQxv1/eOu/5ok4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716220089; c=relaxed/simple;
	bh=T9BUAhS1PEcO7f2+6VuOa2U36A99xtDRN7eP6IZL9cw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jKwcHNEjk52p8rymruFfZi/Uw8P/eTm1T1rSr1VuBDRZeq6f74/6esrC2rg44myMIoPDrN8LkoRFZtt56z7n5TMJ2+jyAVYjB93SJaGEJjct/EqiO+6vYsyJDfQN0GJhOnLtWQLJO7u2y6/EvIqqu7Fedn9nFvQfnBAWcq+wbtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fxheH8/9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LBdbBeXC; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KEGIc3008285;
	Mon, 20 May 2024 10:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=T9BUAhS1PEcO7f2+6VuOa2U36A99xtDRN7eP6IZL9
	cw=; b=fxheH8/9+fSVak6r+z/s7qAqmRvVmNZPsXf28cu77ds0jm8JH+Cn4dt3t
	T0uscf/dt91V0n1Q85LF5Vvjn43NsJ906x0Ex2+k64idNcaINCoPS2zPtr5J/tL1
	7Vv3fj7P1mqEfIpIeVDSK97Frms0EH0W4BItQ10/TqcbYpWE8ekPWRuCjFFbRmQk
	vtR5usjN2Vrj+P6d0ta1vbPE3o7E+S4EWR5fAr9Ut4Vr5VlPZ9uH+8fIHVtPsmzB
	M8rviMni3D5071t3YSXRzO4HapGik48G1/+A2Sl4M2wstiIfEJDGZ6xlLOmkNp9z
	YjgdbAf+cjYbPL+M7x3AQv7NIXRiw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3y6rrjacbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 10:47:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWAlE4Ky2rw9eu8I25FSQBFEonLhVAK0jDtYrLzjzaQkt6lpMMiJzcuYmL7ysXNXKcW0tpDIu5/Vbf8rC1ZuMS/oRdeApbja9AA7RLUylPaLha+L45Eb+XUYwAYr56uTTA8pOlfgqDS6SIFHGa4hFHrJa0z+z03JmTel3px61j2TsF4bhs9M4pCz1rWM2lLi7iDzeNWZkhBUgyiaTWyZ/8fUJLjC8FkD/TiEYKHGdXAC9rQsLE4PYHob/24GEd0Kb1htbMGcP0aN1ky5DUdZUayfqS0vr2t4VqSnM8fF17Fr2yb+M55TzUIZ3Jii5LpP9sxvrDRkZsmWgtntNFRmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9BUAhS1PEcO7f2+6VuOa2U36A99xtDRN7eP6IZL9cw=;
 b=V8B3f4FS/LLCGcmwVuY5RBBm8ea0Mqpy/Awz7kcOGnIkZS/oFAlRE4vbsqxWGtWP6nekXAE3Hj5Vn23XY65n06+P0Zsf5YfEcujG7YXbCMNiJ7JKjB2x0snSvAIP8HagY2gHlQW0oGVsQnUuFcLNYedqMReeHtLSiyA1gIyYGgoYJ1RuNYPrfpI+2dl22cgo3yreoGml04s41KNS0PRTPtWciLTL1j3gmQVzXoYXGNnBZOvTyIXZPZj4Uhll7ZIfGHz9B/Go+UOxoNVav4NRUOnoh7jHy3ZKUW2+EAM8lAGEyVtDkl+lO7Ln/9Vq0uuUxLawsdhqMX0/Mrt1VTRwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9BUAhS1PEcO7f2+6VuOa2U36A99xtDRN7eP6IZL9cw=;
 b=LBdbBeXCBS3+2uTKRbTVywipb3lwrCYSdKcY/fF15KO4wwfAmz/QS05PfMV+S9QpaxaZHWiRgAY9GIzjTPCjPxKBnt3CQp8ngrf0+rsnGTWSu1fWve2ibUhcCzRJKNnGvAcuX75KyxMsAEVyrm6aQlnKm6lMlbSWBsOnzXaXRNQ=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 DM4PR19MB6173.namprd19.prod.outlook.com (2603:10b6:8:b3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Mon, 20 May 2024 15:47:42 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%4]) with mapi id 15.20.7587.035; Mon, 20 May 2024
 15:47:42 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>,
        Mark Brown <broonie@kernel.org>, Jeff LaBundy
	<jeff@labundy.com>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>,
        "open list:INPUT (KEYBOARD,
 MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Thread-Topic: [PATCH RESEND v10 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Thread-Index: AQHaicn9EuAYDNhWQkWTae4PPhg13bFrl+gAgARirwCAFc4egIAavcQA
Date: Mon, 20 May 2024 15:47:42 +0000
Message-ID: <6744E01C-8442-4250-A264-FA2D98ECE34D@cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-5-jogletre@opensource.cirrus.com>
 <Zh8JimSH4cFZsy3o@google.com>
 <A0925B5F-F8D0-4270-B510-385FE4A38F84@cirrus.com>
 <BC84DC9F-65FB-4553-A0B9-52151DD549DB@cirrus.com>
In-Reply-To: <BC84DC9F-65FB-4553-A0B9-52151DD549DB@cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|DM4PR19MB6173:EE_
x-ms-office365-filtering-correlation-id: 1ba3800d-6c75-48cd-2fdc-08dc78e42fc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|7416005|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SWx1N1pGSUh0R1lEcHZTMW1ZcTBJNXpmMVp4a1JlNTFUcDFFMXI3c21wb280?=
 =?utf-8?B?c1hxcnAyU3VTUXg5cWdBc3pxZFpQZHNLdDYxNUVBcDJpS2lKV1dITzd0MGYr?=
 =?utf-8?B?aERMYVNpaFhjSWt3L2VDelpVQU4zeHZ5ZU45eFZpbWZFdUo0MFFrNEhHTERQ?=
 =?utf-8?B?RDhXNzYzVUFCYTk0NXFpdFpEUFB1eFhyVCt0OTZVL3FqUGNVL1NVUEVqS0k3?=
 =?utf-8?B?M1RNYjJvN1VJNEpEY0dHeldEMEo5a1FjMVQ4dTFieS91ejJjOUFFWDF6cnpx?=
 =?utf-8?B?clJmM1JnRlllMzk3K0p6anVRWkdXT3pVcXpsZ01iWFQyWTJzbkF6a0JGcGQr?=
 =?utf-8?B?SWhpWjZIN09lQnBZdlNWZFBpRjdzSDlabWFPdTNncmVaWExMSklPNVBrd2sz?=
 =?utf-8?B?L3VLKzVuZ3RHbWVVU3lnNktPS1FHTUZoNjBHSzhhekdDT3UrSzFSVHVUZTJX?=
 =?utf-8?B?aEhTWjdmMHd6eDdkTytRVUZXMW9Cclp1UHZaNDFucW5ianZFcUlSVmcraHZp?=
 =?utf-8?B?RHYzZWNwT3BHRzFRcjg1RnhraXRNNjhzak1YaW55TzVlTDg5cFNzWHhMU3Zs?=
 =?utf-8?B?andrQmdaN3JPelBDamxJaVZmTEk2U3VQWU9HdVgxOGROSUFKdkxiek1CL2Fx?=
 =?utf-8?B?SGhqZ0s4R0ZhZDdKRWRVZGFZZ2d0Tm1CamJwaURLNXpYeFd6Q1BNM3lkVkhq?=
 =?utf-8?B?UFBSOUxoZ2JLc1cxSEZ2emRPSUFnTVAzbUNGU3ZzRHZ6TlN4YktwNjBxbTZy?=
 =?utf-8?B?MVVZdmxvMFFXZVV6T3c5UDRRMHZ6TzBGUmkyajRuRzRBYXJYNWZPQWxtVXZU?=
 =?utf-8?B?dTBBbldHNXVrS2dmN1o1eW5pOTErdHFnaTdJTWhpWXV1SVZyTXRiZ0pVam5w?=
 =?utf-8?B?b3BpV3ROWnhuK1lwdnJQUUlybEF0QW5IRER3Rm9ZT3ZES0lPdVhHVmdETmxp?=
 =?utf-8?B?ZEVZTDZ4K0ZwOVpqT00vTzRzKzVZYWZOcEdnaWhYM0ZIU3VIeUxaVVhkVHVD?=
 =?utf-8?B?TS9IQnBlNU5IYTJhKzBxWkNidytPRFlEbHREeFdvVC94TDRLUWFOdEpRQ2xE?=
 =?utf-8?B?OGpqYzNkOFYvUHpnOFNsUkRvUzVJVjVCbFBIdDk3dzlNc2JYTGpURzRWTmRI?=
 =?utf-8?B?RGlLSC9YZFNmbHR3NllobkpNc3FwL0JnUFQyY2NRVUVxVndyb3VDdTJFZU00?=
 =?utf-8?B?bXNJL1hRcTN1SWFudHZTMHg4VUFjNEdVbUJwUEsvQ29SZXk5cnhMWTdVNGQ3?=
 =?utf-8?B?ZXhYazdwVTZQQ2pxYVJHMVhYa3Z5d1hQVXB2eGJYeGZDTFZUajNtaTRHTEZi?=
 =?utf-8?B?V1pRakxzQWhyS2RrVThwNnZUcGNSMDlFK3lHQS9NVTZ2ZHdLWUZHUHZQcHhq?=
 =?utf-8?B?aEZFMWxJS1dhT05RMmFNNzFoM1QzUkRWN0FCSFpBUkdiS1E4VnlkREdPQ2V2?=
 =?utf-8?B?RVZtdzh3UFBWdW1ZeHdYeU9uWENxSnhiTW5vMllBUFBJakYyTnYzVmZRZXli?=
 =?utf-8?B?NDA1bnNqTUJPZ2xoQ2JXd0xCQnBOaVdFVXo5OWx2bjlXeW5oUFhCejczRUJT?=
 =?utf-8?B?TnE5MnlPWjVXMXBxcWtEVmpLbmt6a1ZqVXFIc3ovMVg5WEJkKzliL2s3MEkr?=
 =?utf-8?B?bHNzUW1mQW1tRGZ0MFl6RnJjb3RQajdQbGhLdzM5SW04M0NQOFRtd2EvdXBn?=
 =?utf-8?B?YlB4MEdneWVyTEphMXFnK2I4cVRUeWxXb0ZYam44dk53SXZidnNEeGFXbzhE?=
 =?utf-8?B?Vjl0YUJBWm5ZQ21KODZSdFJsR0pOWEdvTmxncnBUZ1R6KzVIY1dONEVkYmo1?=
 =?utf-8?B?L3lNWkxndUx5ckJrKzhUdz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aERrbHRkT3N1dUNZNG9pOFR2eDJWVnRzMi9PQlUreUVWcDVSa0cxdmNCNUZD?=
 =?utf-8?B?V283WEc5K0ZJSlIyT25EN3Q1MmVPVC95eDBXTVFOeWNLdmx0c1dYWE8wb284?=
 =?utf-8?B?RHJBaFE5d1I3NkNqeW4ycHBuRnF5Nnh1SE9pd0kyL3NVL082L1dIRHZmdGRI?=
 =?utf-8?B?Z2ExNmQvUVBSYlZFd0owRDVoTEVzQ2NUY1Z2VEl4aUdxWmJEUHpXaFJ2Ukpl?=
 =?utf-8?B?SkZqZGRXRUd6YjNrOWg3UWFFZUpESzhhNGZVdkV0RHhSQWVSN2Z1ampweUpo?=
 =?utf-8?B?Mld2TXJwUkNORXUvSzl5Wktlak9XV3QyeDMyUUFENDJMckk4a0w0N3BPYUdE?=
 =?utf-8?B?am9PTzRJZHZkamNnV0dzNTMwUDV4dE12OWNhQWtJdW9JMHEzYmsrNzNYTVNO?=
 =?utf-8?B?UTd3elduV25jTmhnWmtHMUkrMUNxeU92cmcvMFVGVWIzb3p6UnVWanltMkJv?=
 =?utf-8?B?R01KWUU4S3M4OWdvcjhVWlo5ZXJWSmFsYVNWVVZhTmdsYmZocnVDb2ZNSngv?=
 =?utf-8?B?eWtoRkxONlM2T0ZLb1hscklDTHRxVUV4S0hFRStQRk1VbkkrRDY0Z3d2NDlY?=
 =?utf-8?B?d2NtVUlja25Vb1gyQmRwV29XOEdoTmRvdDliMy9CbXUvNXczRGxua0dWUnRL?=
 =?utf-8?B?Q05pZ2ZZb3J5V1IyTGFGMVcwOEEvakYxOTFTWi9EYWpReFdnK1FJQ2FCU0k2?=
 =?utf-8?B?RUUvcDFrUDdkK0dZdUwwczBrVm5hUEs5bGFSUHdFZk11Nis1SmxyQlRlRUVY?=
 =?utf-8?B?azVXbVMvRjVYNW9mTTRlK2lJSXNGeXhhS0xYL0d4KzZ0R3Y5dWZUeVgyd3ZV?=
 =?utf-8?B?VHovQ1hRSm81S0kxbWMreUhzYmg5ZTlsQURKQUFKOXpvTmh5UU5oa0lxdkZm?=
 =?utf-8?B?SXFMbkhybEY1TllDbHZ0Y2JGa2wzOE1NQVBKZm42aEVqZ3ZSZkM5bmRUVWps?=
 =?utf-8?B?UndKWHlyQTlqdWhwY29uWE9xUjVjTFUweEhaV1J4eWxPdGQ3Q1NmRFRuOUNk?=
 =?utf-8?B?TjMvYkJ4di9vMThTR2ppKzBmeXNjcGc2dFBoOEVsakxmUTVDaGlocCt3NTdF?=
 =?utf-8?B?SXVlTEpibUlUTmN2ajMxOHJpeU41cHd6MVh5eWdrVGpoeTlCTVhwOWVhNEdw?=
 =?utf-8?B?aHpyV3gzNjdVTjd2MnlIVUhNTmRqZVpBY1FiWGhwOUxBSkNRQUlSS0ZaS2lH?=
 =?utf-8?B?WFRjMStTZFdPUWJIeHp5VjR3ZnFQTnJNeHpGUm9rNncxcklCbVhJK3ZtVXhh?=
 =?utf-8?B?blF4a3dVSVBmc2I1alYwUlJPYktEaTEvS1VEMjNiWFlraGZhT1JpZGJYTlNE?=
 =?utf-8?B?TDFVYkpJSWRNYVlhUDJYenJSRFVrM0FMZHBOdUhRTWQ5TE1MZG5pbjRvYkNx?=
 =?utf-8?B?amNGZmhnTDVCaVQ3OUZVdldNSURLVU05RkRpUi9yMnBHcGJFSWRUd3ZPZGNL?=
 =?utf-8?B?M0dnUWFJSDNSQWJnektKQVZmRGIvdEJkd3ZiKzN5c1hPRWtFVDRJbzdBMEx2?=
 =?utf-8?B?a0hMTWc3L3h1V1hFSm5wQlY1eE0rVy9VcDNZUEMxdkZDTWhrck9ZSEhHZU94?=
 =?utf-8?B?bTNKYjdRVTVmTGlPeUUzcmpWb0Iva2t0Z2YrcWx6U09hdVV3bWZzMkNQam5J?=
 =?utf-8?B?K1htVkdlUys3VWRGUkVuQ0l5TUZQSXVxa3RzalVaWDlhekpXZGNpZ1JqK05x?=
 =?utf-8?B?REhwVC9EYWh5Q29ldVh1enl0WTV5bmtoQmkrQW1vZDhScmovYVI3SGxoSnJO?=
 =?utf-8?B?ZldQUHYxbFAybG9pak1hcEFiUFZBSTNYb2J5VXFUV1U5Nm9ZMElaMFRYUFhD?=
 =?utf-8?B?SkRoV3IyaW11emlzeGNHSGU0T0hEdlY4VXhZKzY0TkVPK1YxWnMrN3RwY1hp?=
 =?utf-8?B?L0IzbFZjdDFBZmU4ck5FSk9Db3VrSnRTdHE1cFNXR1ZBcm5JZncxM21NMlVh?=
 =?utf-8?B?NkhQUitVR1FCd2Y0aTR4YjhzbEN2NkNDZTNqMTdueHo4ejNoeUFqOXdOLzQ0?=
 =?utf-8?B?S2ovM1pEWVN1bmsybGF1NzZFTCtzWHAwNGhaTGFDVThNd1JQMk9wRVRNRWtR?=
 =?utf-8?B?dGc5cWxKcWlWd0tkaDBJcTRsV1UwSFRXQnFRU0UwbUtpWVJOZ1RaUFFOQTk2?=
 =?utf-8?B?bHZCZndXL3RMbnhXYmp5cGJ2aVRLVTAyZkwrWDVxNFpTQUxJN0hOUlJEbytS?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44DFC7591FDC0442938EE6695A4B2872@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB5688.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba3800d-6c75-48cd-2fdc-08dc78e42fc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 15:47:42.8943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46n7yQdHfEf1a57owmMYwZv8jEI2ZE4t9wzgfN2Qmi+5V9NI9FngIBEmHkhNJXoW4gVLggRKIRN8ECr5nTMkyRiniKmP2DPKd7f0Nad1jKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6173
X-Proofpoint-ORIG-GUID: l8baxcrD3hIb8hdwasA-d6jh9v0drZ1D
X-Proofpoint-GUID: l8baxcrD3hIb8hdwasA-d6jh9v0drZ1D
X-Proofpoint-Spam-Reason: safe

SGkgRG1pdHJ5LA0KDQpSZWFjaGluZyBvdXQgdG8gZ2V0IGNsb3N1cmUgb24gdGhlc2UgZmV3IGNv
bW1lbnRzIGJlZm9yZSBJIHNlbmQgdXAgdGhlDQpuZXh0IHZlcnNpb24uDQoNCg0KPiBPbiBNYXkg
MywgMjAyNCwgYXQgMTA6MjXigK9BTSwgSmFtZXMgT2dsZXRyZWUgPEphbWVzLk9nbGV0cmVlQGNp
cnJ1cy5jb20+IHdyb3RlOg0KPiANCj4gSGkgRG1pdHJ5LA0KPiANCj4gVHJpbW1pbmcgZG93biBt
eSBsYXN0IHJlcGx5IHRvIGp1c3QgdGhlIHBvaW50cyB0aGF0IG5lZWQgeW91ciBhdHRlbnRpb24v
YWNrLg0KPiANCj4gSSBtYWRlIHNvbWUgc21hbGwgZWRpdHMgZm9yIHRoZSBzYWtlIG9mIGNsYXJp
dHkuDQo+IA0KPj4gT24gQXByIDE2LCAyMDI0LCBhdCA2OjI44oCvUE0sIERtaXRyeSBUb3Jva2hv
diA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4gd3JvdGU6DQo+PiANCj4+IE9uIE1vbiwgQXBy
IDA4LCAyMDI0IGF0IDAzOjMyOjEzUE0gKzAwMDAsIEphbWVzIE9nbGV0cmVlIHdyb3RlOg0KPj4+
IA0KPj4+ICsvKiBEZXNjcmliZXMgYW4gYXJlYSBpbiBEU1AgbWVtb3J5IHBvcHVsYXRlZCBieSBl
ZmZlY3RzICovDQo+Pj4gK3N0cnVjdCBjczQwbDUwX2Jhbmsgew0KPj4+ICsgZW51bSBjczQwbDUw
X2JhbmtfdHlwZSB0eXBlOw0KPj4+ICsgdTMyIGJhc2VfaW5kZXg7DQo+Pj4gKyB1MzIgbWF4X2lu
ZGV4Ow0KPj4gDQo+PiBUaGlzIGxvb2tzIGxpa2UgaXQgaXMgd3JpdHRlbiB0byB0aGUgZGV2aWNl
LCBzbyBJIHRoaW5rIHRoaXMgbmVlZHMNCj4+IHByb3BlciBlbmRpYW5uZXNzIGFubm90YXRpb24u
IElzIHRoZXJlIGFueSBjb25jZXJuIGFib3V0IHBhZGRpbmcgYmV0d2Vlbg0KPj4gdGhlIHR5cGUg
YW5kIGJhc2VfaW5kZXg/DQo+IA0KPiBUaGUgc3RydWN0dXJlIGl0c2VsZiBpcyBuZXZlciB3cml0
dGVuLCBzbyB0aGVyZSBpcyBubyBjb25jZXJuIGFib3V0IHBhZGRpbmcuDQo+IE9ubHkgYmFzZV9p
bmRleCBpcyB3cml0dGVuLCBhbmQgdGhlIGVuZGlhbm5lc3MgY29udmVyc2lvbiBpcyBoYW5kbGVk
IGJ5IHJlZ21hcC4NCj4gDQo+Pj4gK3N0YXRpYyB2b2lkIGNzNDBsNTBfc3RhcnRfd29ya2VyKHN0
cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4+PiArew0KPj4+ICsgc3RydWN0IGNzNDBsNTBfd29y
ayAqd29ya19kYXRhID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBjczQwbDUwX3dvcmssIHdv
cmspOw0KPj4+ICsgc3RydWN0IGNzNDBsNTBfdmlicmEgKnZpYnJhID0gd29ya19kYXRhLT52aWJy
YTsNCj4+PiArIHN0cnVjdCBjczQwbDUwX2VmZmVjdCAqc3RhcnRfZWZmZWN0Ow0KPj4+ICsNCj4+
PiArIGlmIChwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KHZpYnJhLT5kZXYpIDwgMCkNCj4+PiAr
IGdvdG8gZXJyX2ZyZWU7DQo+Pj4gKw0KPj4+ICsgbXV0ZXhfbG9jaygmdmlicmEtPmxvY2spOw0K
Pj4+ICsNCj4+PiArIHN0YXJ0X2VmZmVjdCA9IGNzNDBsNTBfZmluZF9lZmZlY3Qod29ya19kYXRh
LT5lZmZlY3QtPmlkLCAmdmlicmEtPmVmZmVjdF9oZWFkKTsNCj4+PiArIGlmIChzdGFydF9lZmZl
Y3QpIHsNCj4+PiArIHdoaWxlICgtLXdvcmtfZGF0YS0+Y291bnQgPj0gMCkgew0KPj4+ICsgdmli
cmEtPmRzcC53cml0ZSh2aWJyYS0+ZGV2LCB2aWJyYS0+cmVnbWFwLCBzdGFydF9lZmZlY3QtPmlu
ZGV4KTsNCj4+PiArIHVzbGVlcF9yYW5nZSh3b3JrX2RhdGEtPmVmZmVjdC0+cmVwbGF5Lmxlbmd0
aCwNCj4+PiArICAgICAgd29ya19kYXRhLT5lZmZlY3QtPnJlcGxheS5sZW5ndGggKyAxMDApOw0K
Pj4gDQo+PiBJZiAoSSBhbSByZWFkaW5nIHRoaXMgcmlnaHQgeW91IGFyZSBzcGlubmluZyBoZXJl
IHBsYXlpbmcgdGhlIGVmZmVjdC4gSXQNCj4+IHdvdWxkIGJlIG11Y2ggYmV0dGVyIGlmIHlvdSB0
cmFja2VkIG91dHN0YW5kaW5nIG51bWJlciBvZiByZXBsYXlzIGZvciBhbg0KPj4gZWZmZWN0IGFu
ZCBoYWQgYSB3b3JrIHJlLXNjaGVkdWxlZCB0aGF0IHdvdWxkIHBsYXkgYW4gaW5zdGFuY2UuDQo+
PiBTaW1pbGFybHkgdG8gd2hhdCBjb2RlIGluIGZmLW1lbWxlc3MuYyBpcyBkb2luZy4NCj4gDQo+
IFllcywgeW91IGFyZSByZWFkaW5nIGl0IHJpZ2h0Lg0KPiANCj4gSXQgYXBwZWFycyB0aGF0IGZm
LW1lbWxlc3MuYyBoYW5kbGVzIHJlcGVhdHMgYXRvbWljYWxseSwgaG93ZXZlciBmb3INCj4gcmVh
c29ucyBleHBsYWluZWQgYmVsb3csIHRoaXMgZHJpdmVyIG11c3QgcXVldWUgd29yayBmb3IgcGxh
eWJhY2sNCj4gZXhlY3V0aW9ucy4NCj4gDQo+IFRoaXMgcmVzdWx0cyBpbiBhIHBvc3NpYmxlIHNj
ZW5hcmlvIHdoZXJlIGlmIGEgcGxheWJhY2sgaXMgaXNzdWVkIHdpdGggYQ0KPiBoaWdoIGVub3Vn
aCByZXBlYXQgdmFsdWUsIGFuIGVyYXNlIG9wZXJhdGlvbiBjb3VsZCBhcnJpdmUgaW4gdGhlIG1p
ZGRsZSBvZg0KPiB0aGUgY2hhaW4gb2YgcmUtc2NoZWR1bGluZyBhbmQgZGlzcnVwdCB0aGUgcGxh
eWJhY2tzIHdoaWNoIGhhdmUgeWV0IHRvIGJlDQo+IHF1ZXVlZC4gQnV0IHdpdGggdGhlIGN1cnJl
bnQgYXBwcm9hY2gsIHRoZSBlZmZlY3QgaXMgZ3VhcmFudGVlZCB0byByZXBlYXQNCj4gYW55IG51
bWJlciBvZiB0aW1lcyB3aXRob3V0IHJpc2sgb2YgYmVpbmcgZXJhc2VkIGluIHRoZSBtaWRkbGUu
DQo+IA0KPiBUaGF04oCZcyBteSBjb25jZXJuIHdpdGggYWRvcHRpbmcgdGhlIHJlLXNjaGVkdWxp
bmcgYXBwcm9hY2ggZm9yIHRoaXMNCj4gZHJpdmVyLiBQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0
aG91Z2h0cy4NCj4gDQo+Pj4gK3N0YXRpYyBpbnQgY3M0MGw1MF9lcmFzZShzdHJ1Y3QgaW5wdXRf
ZGV2ICpkZXYsIGludCBlZmZlY3RfaWQpDQo+Pj4gK3sNCj4+PiArIHN0cnVjdCBjczQwbDUwX3Zp
YnJhICp2aWJyYSA9IGlucHV0X2dldF9kcnZkYXRhKGRldik7DQo+Pj4gKyBzdHJ1Y3QgY3M0MGw1
MF93b3JrIHdvcmtfZGF0YTsNCj4+PiArDQo+Pj4gKyB3b3JrX2RhdGEudmlicmEgPSB2aWJyYTsN
Cj4+PiArIHdvcmtfZGF0YS5lZmZlY3QgPSAmZGV2LT5mZi0+ZWZmZWN0c1tlZmZlY3RfaWRdOw0K
Pj4+ICsNCj4+PiArIElOSVRfV09SSygmd29ya19kYXRhLndvcmssIGNzNDBsNTBfZXJhc2Vfd29y
a2VyKTsNCj4+PiArDQo+Pj4gKyAvKiBQdXNoIHRvIHdvcmtxdWV1ZSB0byBzZXJpYWxpemUgd2l0
aCBwbGF5YmFja3MgKi8NCj4+PiArIHF1ZXVlX3dvcmsodmlicmEtPnZpYmVfd3EsICZ3b3JrX2Rh
dGEud29yayk7DQo+Pj4gKyBmbHVzaF93b3JrKCZ3b3JrX2RhdGEud29yayk7DQo+PiANCj4+IFlv
dSBhbHJlYWR5IHRha2UgdGhlIGxvY2sgd2hlbiB5b3UgcGxheSwgdXBsb2FkIG9yIGVyYXNlIGFu
IGVmZmVjdC4gV2h5DQo+PiBkbyB3ZSBuZWVkIGFkZGl0aW9uYWwgc2luZ2xlLXRocmVhZCB3b3Jr
cXVldWUgZm9yIHRoaXM/IFdoeSBkbyB3ZSBuZWVkDQo+PiBhZGRpdGlvbmFsIG9yZGVyaW5nIGFu
ZCBzeW5jaHJvbml6YXRpb24/DQo+IA0KPiBUaGUgd29ya3F1ZXVlIGlzIG5lY2Vzc2FyeSBpcyBi
ZWNhdXNlIHBsYXliYWNrIGJsb2NrcyAodmlhDQo+IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQp
LCBhbmQgc28gcGxheWJhY2sgbXVzdCBkZWZlciB3b3JrLiBVcGxvYWQNCj4gYW5kIGVyYXNlIGFy
ZSBub3QgY2FsbGVkIGluIGF0b21pYyBjb250ZXh0LCBidXQgd2l0aG91dCBxdWV1ZWluZyB0aG9z
ZQ0KPiBleGVjdXRpb25zLCB0aGV5IGNvdWxkIGN1dCBpbiBmcm9udCBvZiBwbGF5YmFja3Mgd2Fp
dGluZyBpbiB0aGUNCj4gd29ya3F1ZXVlLg0KPiANCj4gQnV0IGFzIHRoZSBjYWxsYmFja3MgYXJl
IGFscmVhZHkgc2VyaWFsaXplZCB2aWEgdGhlIHdvcmtxdWV1ZSwgdGhlbiBJIGRvDQo+IHRoaW5r
IHRoZSBsb2NrcyBhcmUgZXhjZXNzaXZlLiBUaGF04oCZcyBteSB0aGlua2luZywgbGV0IG1lIGtu
b3cgaWYgaXQgaXMNCj4gc291bmQuDQo+IA0KPiBCZXN0LA0KPiBKYW1lcw0KDQoNCg==

