Return-Path: <linux-input+bounces-11466-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A42A78296
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 21:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64AB63AEE46
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 19:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FED220E70D;
	Tue,  1 Apr 2025 19:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wacom.com header.i=@wacom.com header.b="GeOUotEl"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023120.outbound.protection.outlook.com [52.101.67.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC42D1DA62E;
	Tue,  1 Apr 2025 19:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743534408; cv=fail; b=UQfWbYqn3avzz99EujBGxy9iLCUA4sacsVzHzKz7MSy4iv2QtQHySObEJlvRvdvhNl2B1HirU+l8u4OlR09bQP0TA0iEdKN/nkEvxKVnq/XI+fpWXF+Jxo/0aFuHshGQNOKzdunYoXbvcM56CHnD6SmFc/8UN2RwSkJXk3puf6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743534408; c=relaxed/simple;
	bh=bVEj9CGXPx+I/ikC4miO/Oaeix6ZXKOFOmabhvncfVY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cjBihCxgzGWAoEx9kGK6A4yKCM0AkSnLgIwkDKAQ47kwnFJvzfsITOE+ACG5+XimntVrPUi8TqlhDFiocaQmffSYGBN8xLIp9SewLIbcYr0OgTj5uoB1mGTECeWAxY7RHR92dujPTFkUrUvbNt/rFVP7PT1tedTOw7JXd3jlBKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wacom.com; spf=pass smtp.mailfrom=wacom.com; dkim=pass (1024-bit key) header.d=wacom.com header.i=@wacom.com header.b=GeOUotEl; arc=fail smtp.client-ip=52.101.67.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wacom.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wacom.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZLUYhyyJ8SfncKHtMc8USN6As8e57CKYNMV88YkI6fSpimXEyIJ+NzyEsuAnCii34qYpOQVlo5nwylFba0huwTq7kyy7J/tuMIjrovvhxHLHcFLQrA64G1aBjgn1mnuIVKMa6quslNOeUeNMtys4kdjCJVD9SbJ8mCEIgejXRn5JwqMqB1qLUW5G5Ne//vGkE1nEG9Bd9hHVyc2Lme89FdFN3fSxAwAIaVcm/5PZ3tkDqNYRLKUS3ql2ysUHw89EcsJQQYXOnzBbTGalttHx8yo0LxFtHf6zrfKcY3Gan6BwUGChsDPE5vj8u9hQbmOHiXcA0EDtiz8jOFcNxdlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVEj9CGXPx+I/ikC4miO/Oaeix6ZXKOFOmabhvncfVY=;
 b=hGROLvUNu7HWCtDqfzmRlisH1/up6tVDJERvGE4z/g4Wy6paT/DRGO8Kazf+fNgz7xpsjoAifGDFMMKjiLtXIpuqt8Dny5nbwglSU+1Jc0jSomUwawKoTknTzjzR9h6l36jHxGG6BAlEMsR1y+TK0QJd45Bzkcimg46E6uF/mKcGruTr1APJ06+xcCuqGx8cPE+N1D0k6A2tB/YqObrpBO96XpYiGXixEwQrHUzZ1OOBFdKMIfjjIzELUr1DeNpN1rADnFiA12k/MwK/oEbuLZnncb7YZ04URp7rbZLUSr2JGnDe0B5s1OkuYSU7hh4DiEtdIPto5hx7ZHn9OitHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wacom.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVEj9CGXPx+I/ikC4miO/Oaeix6ZXKOFOmabhvncfVY=;
 b=GeOUotElhx+gmdK01QkcqkWtiWoMoQFULYpE+zDltI1UOmHR0WOJRRG1FNMc7//X0QeELPlWP712zVkX5PA7eloKYHKRUQ+Aiq8FtAZfygmfGE7MZ4s6a2j1rTaFVNMhnxFCsCM2TSUCsBBO0Jom/9JNAhOBHqaGmYG5Odc9wYI=
Received: from VI1PR07MB5821.eurprd07.prod.outlook.com (2603:10a6:803:ce::20)
 by GV1PR07MB9142.eurprd07.prod.outlook.com (2603:10a6:150:8a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Tue, 1 Apr
 2025 19:06:38 +0000
Received: from VI1PR07MB5821.eurprd07.prod.outlook.com
 ([fe80::4520:70a7:ee8d:5168]) by VI1PR07MB5821.eurprd07.prod.outlook.com
 ([fe80::4520:70a7:ee8d:5168%6]) with mapi id 15.20.8583.038; Tue, 1 Apr 2025
 19:06:37 +0000
From: "Gerecke, Jason" <Jason.Gerecke@wacom.com>
To: Qasim Ijaz <qasdev00@gmail.com>, "Cheng, Ping" <Ping.Cheng@wacom.com>,
	"jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, syzbot
	<syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] HID: wacom: fix shift OOB in kfifo allocation for zero
 pktlen
Thread-Topic: [PATCH] HID: wacom: fix shift OOB in kfifo allocation for zero
 pktlen
Thread-Index: AQHbowX4XaNjuIxHiUW4IRPg928H4LOPKAyx
Date: Tue, 1 Apr 2025 19:06:37 +0000
Message-ID:
 <VI1PR07MB5821D612EE852EC35C2E095DEDAC2@VI1PR07MB5821.eurprd07.prod.outlook.com>
References: <20250401125912.73044-1-qasdev00@gmail.com>
In-Reply-To: <20250401125912.73044-1-qasdev00@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Enabled=True;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_SiteId=9655a91b-107e-4537-834e-d15e84872626;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_SetDate=2025-04-01T19:06:36.577Z;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Name=All
 Employees
 (unrestricted);MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_ContentBits=0;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wacom.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR07MB5821:EE_|GV1PR07MB9142:EE_
x-ms-office365-filtering-correlation-id: 5dea186f-5810-4ad7-9357-08dd715053c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZThtSVR5Nnd5ZU5MMVhvVDBTZHJwaGhYKzVTejdRZER1WXBSUGtrKzFDQmIv?=
 =?utf-8?B?MVJPS2x2QzBDTGUyQ2N3RDBGVVh6OTNxcVJGdlE4SzJTOGdabmFJSmJvSFNq?=
 =?utf-8?B?ZHpPWGRtOHdFSWNBUnV0YXNMS1g2UWpsT2VZTXg0U0hTZVlKOUtReVZGU2c0?=
 =?utf-8?B?WFdPMzd1OUwreEJoVDFhMzU4UUcySzZEamZNci9rUDdKbmNrMWNSQVpQMDhp?=
 =?utf-8?B?dEhIdUVWa1ludDZlVDZBNXBnUWlsQ2RodEwrY21KNGJBK2VPdnRTMEFXb2pX?=
 =?utf-8?B?TUZNS1lVTFo1a3VUOS9rYlFuOTFWcTRLdWhWN2x6dzlZUW93ZGpSWGFxR2Vj?=
 =?utf-8?B?SDcxSDJiU0huaXgwa0R6ZkRoRHlneU81cFZEcm82VW8xME9Da1drYTNFM2J1?=
 =?utf-8?B?Uy81ZlFrUzZhOXZzS0RxMWEvVDRoT1FiZVhQdC9mSFY4SUtlOTRZekxBc1d1?=
 =?utf-8?B?VVZEMFdtUVAreWxMQ0lpU2NYZmZHWmdVUmtURERYazZzT1dqb0ZKcWFYcWVJ?=
 =?utf-8?B?QjNlaWxpSjFvY0d6allVcGMzNzdjck5XRFNGdERleFpmQmVoTGRKSzJVQjVh?=
 =?utf-8?B?Z2xTb1hpWHpMWnNJZGc0YURaRkdlSVFpdGUxT3pRUW9DNW9WR295U3ZSUUVl?=
 =?utf-8?B?WHJUQkV6L1V5am5HWXpKUHY5UzB0cDdUZCtKWHNJZjQyY3JzakxQRnFwRlRV?=
 =?utf-8?B?S1BDdVNIVGlQZWRhenFhaUxVREZwK0JLcVJ4VVR5bDJjWW9XUmYxclgxRHRD?=
 =?utf-8?B?TWhKdW1pQVJXcloyc1ZvVEhxN29HTVJZVy9CTlFvdysycFJ2UUdRWUhrY3FP?=
 =?utf-8?B?RWtETFBrb0RiOEEyZ2RMeWZydkFTMk10MStIM3c5ZHhXODZnQXhDY3dURXV2?=
 =?utf-8?B?T3Q2L1RmUnExbitOZ2s5ODU0ZERnTm1iMWwraGluMFVHUHl0NGc2UVZhamtv?=
 =?utf-8?B?NkNxZEd3NVRiYVJ0VUNqZUI1Z1psU3BxSWMydmRVTUdVZFhzSWljTVBUczI2?=
 =?utf-8?B?dkZ0bzBsaEg1YnhmdllGRXpTRTRseHN1NEdlbWkvam5WUnRpRWE0RkJkYTVC?=
 =?utf-8?B?OHdocm1BZmFNTzdRcXVaRVhucVMxd2hKRFl5RGVUUUtEOEtxRndKTkxzajVu?=
 =?utf-8?B?enQrUnJmbCtJZnVLZEFHUm56QXJ0OEVCLzlQTVNFS3hnNEt0NW1uYVJTdSta?=
 =?utf-8?B?SE9rUWo1Zyt2TTliOWFNYm9CdEJEUldLWW5ZZWNmWU82UWFpdHI4UXozYWEr?=
 =?utf-8?B?TGhvVlpaM2prRTMwT2paR0ZMdkZPWWh1bUc4RVorUVJJYmh4b3drb1RodG1p?=
 =?utf-8?B?RU53Y0IwSUZxbUZ0ZlJYZ3hsRFhuc0Z4S2FUVjRYVEIrbmk1dURZeFRMRUR6?=
 =?utf-8?B?bTkyRER6UGp1dHRZdEEzNHJIbWE4bFE5Y1lpNjBwNzhZc2wxOXNIRjdPdDdY?=
 =?utf-8?B?cENqdVhYYlU2dC9oUHhCYldvL1hrbTh3Y1Jnb2JBdlNoOEIzSHpTVmVVOGZH?=
 =?utf-8?B?WDNQNjRZZG9JTnVwV3hnMXBmczVyb25PY25YbVFyMjZRa2pMSS85UlArR3lM?=
 =?utf-8?B?bmFUQnhOejRROXFRdGxmcFM0VCtaV2U1ZkJzN3dTNVAzZk9ZQ084NTZoNEZu?=
 =?utf-8?B?Ny92SytnUVhCRnpiSWF6UHk5bGdURTRyam9XWjZoNlRBNUN4QlNRTmdPZ1Nh?=
 =?utf-8?B?Wk44UjBQZEZSamRUeFFMcjhXdmluTnFPTjhOQnRhQno5WFdwbXBMVk9icTBN?=
 =?utf-8?B?UUd4bGl5d3oxYi8rMWF1WjRqdEx3Q0NjV3JxZ3Z0aTlMSmFQQ1M4eTBWSG05?=
 =?utf-8?B?akliakJQdHNjdmtjUktLZFF6cFpxYy9xU3RGcjM2UjdtOFdkNW5jaUIwelJx?=
 =?utf-8?B?NWViaVU2My9NaUZJVVZqS2RBR2dPejYyZ2hqZlNXV1JOVGhJb0JpNFBzcDdx?=
 =?utf-8?Q?VcdgK67x9kI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR07MB5821.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OStXVjh0THpHdTVBdWhvY1JmWmd4cUtOc053WXhPWXVhQ0hOTlJ2N1R6VTZ0?=
 =?utf-8?B?WVcxYVlhT1F3amNMSlNtN2cvbkRIWUVlV3ZSMlJsMVNLQXRFWnpzZkdrZnFn?=
 =?utf-8?B?d0l6N3VKTjRpNVQ3VDhOTU9zdnJ0Sk1TaEdZMlpHR1FVQWpGelBwZkovNmVx?=
 =?utf-8?B?R1JqeVh6NTdjZWZPTTZOMUwyTWd3d3JPYmFZaHdiSzN5M0ptSGRORnMyK0Qz?=
 =?utf-8?B?TXp6NnVjTTZ5WUFxUE96MENHWmt5Q2FoVW1rYjBvMkNLWXhIcHBRakhQell4?=
 =?utf-8?B?NkNlc25yd004V1JqT2x1WVhOSzl4THVjWkVDbklPRlhnSTRiRGdUWDVrNno3?=
 =?utf-8?B?ZFNTRVFGVm5HWUhJNUIrUFRGV08xSGJFNFdPWjRqSlNjQ1Z6MWVSV2EwQjNQ?=
 =?utf-8?B?MGh0SzFsaXVjVkNIWEw0WC9oaHFCUk1ON1BuZlZRWXJTbE5tVUdQR2Y0S1RH?=
 =?utf-8?B?ZHp1NWkwNXQrWlVjc2wxYW02ak0rNks0d1BDcW5NeURDWWYzM3FHTFV2alhM?=
 =?utf-8?B?WTlIbVZVM2wyTlhhVkhmVmRaQUdRclU3QnFKb1BUV3dYazg3cTZvVG9vOHBV?=
 =?utf-8?B?WXZRZm80SWdxQTZFV25wUS84RmZQTktETUNLSUFGRVZWRGpodDRrbkRtYW1p?=
 =?utf-8?B?V2tvWGhHU3RIZmVRTXZaZmVwOEp6ajNpd3BnUVF2RlpFYUlCV2ZOMGY2cHp2?=
 =?utf-8?B?ZjBUVTFLd3lXS1I2UFdzSFREUkdxMDJOb2ZNR3NrN0tRc3N0alpvTmk1R1Vm?=
 =?utf-8?B?Nncwb0dIdlNDeHZMdWRxWnQwVXpoblNtMG4vNXpkczFudDdtazhCZVN4eUp2?=
 =?utf-8?B?NDcvWnBFUWwwWE90VElhRlc2akVlUjRGN3dYdnBMc2g3bElnLzFMNFJTeXRz?=
 =?utf-8?B?YmVDT3RpZlZvV3NSd1ZCS0gzeXN4WFludVMxR0dmRkNuMk5NQnhKRC91S2oz?=
 =?utf-8?B?bC9mOFdPeWhVYU9JK3UycGs4NFoxL2g5MkhqTEQxSG1mWE9GYTZQeTRBQlVX?=
 =?utf-8?B?MWJRcmtmblpMaUhYeGliU09XMWQzM0NHanNnTzB0VDVYVzJua1VKVUhkWFRD?=
 =?utf-8?B?bDJSTW5RUEFFUmFONytoK1BzZFE2MHNzaEZHNndQaTF5cU4xUXh6UzZYdkp1?=
 =?utf-8?B?d09qclVBNTZkL0xpWHpRb2haLzZQTnpVMzVsUE5Ca2ZvaERNWDRqTnFxN1ht?=
 =?utf-8?B?QU9XZERaTUN4RjRKWHpKanFzMHJPVXNXS0hjZ1NVaVQ5NDV1YnJqbjhmMkFa?=
 =?utf-8?B?a3pWS3NCYzdIZDZyNTlvZTlTeGdMWG1GOGV5bHNqQXpLK1loUjFXaXlSWUMy?=
 =?utf-8?B?dGUzQ0Y0aVFnM3Z5cSs0Y3BaYkZQSVBLaURhdzdwNWQrcnRraDBMdTQybWds?=
 =?utf-8?B?R0ZHTHBJSU1QbkUzUXE4MGozUWFyeUZVbGwyY0Y2djZLY3ZEa2cxcjRVck5u?=
 =?utf-8?B?UEM1b1ptemVHNFNuUDFhTzdQL2YwbWl0L3NndlFnY2ZRT2N0WWIrdnRyYkZR?=
 =?utf-8?B?K2pFblRjMmRqUm0rTmpQMW5xemN2cVdqa1ZURFE5bVBpT1FYWitIRkRQVEp3?=
 =?utf-8?B?R0pFZlZTVFZseW83SHJPRkZlNHBDcFlDeklzMVVyZmJYNzI3VFZ0N3RnbnU5?=
 =?utf-8?B?cU1XWDU2ZWlkcVFXbk8wUHhwbzJaTXoxNGsrc3YzVHFVWms1OTdZR2hrcWZ2?=
 =?utf-8?B?V21HalpNanB3RVlBL3BhZ2wrREFNWGhaYlM0aXdzNkdMcjRLWUJZYXpSS3NM?=
 =?utf-8?B?bU5hSlZWaklSa1lkem9BUC9LdFdiRUVkT3hqaHg0Und6MXoycEQwQnFwSjlB?=
 =?utf-8?B?QkRydnJwSm5BN0FNR21FdTRzeDd2SkQ5d3QwK0NzTXE4MWtxUDJoTThEay9x?=
 =?utf-8?B?WWU5RjAxbHhSUGZnODVLbitCdFF3Z0QvSW1WemhsNFdtejRLMGZDUHplOUNG?=
 =?utf-8?B?Rjl6N0Q5R2VMWW9iQ0lsUjBXYzY0NU0wMEc2Q3M2TFE4eElvZTFSVHFKQ0hQ?=
 =?utf-8?B?ZVFXT2Q1VEQ2UmI0NVcyVE5lTGxpcFJzNklnTVNjL1R5YjN3bWt2bWVGdStG?=
 =?utf-8?B?UitESlQyUHl4N1oyM3NZaXExT3RRMmtrSFFUR0o3a3pEcUY2dFFLakZYSFc3?=
 =?utf-8?Q?wOUaSuHPw7abgWgX+yUeMSWIK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR07MB5821.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dea186f-5810-4ad7-9357-08dd715053c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 19:06:37.2966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9RjYuKebAvHGzqXK+vKmp/+F+TvalXUk14Qnr9f9MvBIgmCZpBHm121A2n0ivqZsFCZTr3JHE9dW06llLlfkvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB9142

T24gVHVlLCBBcHJpbCAxLCAyMDI1IGF0IDU6NTnigK9BTSBRYXNpbSBJamF6IDxxYXNkZXYwMEBn
bWFpbC5jb20+IHdyb3RlOgo+IER1cmluZyB3YWNvbV9wYXJzZV9hbmRfcmVnaXN0ZXIoKSB0aGUg
Y29kZSBjYWxscyB3YWNvbV9kZXZtX2tmaWZvX2FsbG9jIAo+IHRvIGFsbG9jYXRlIGEgZmlmby4g
RHVyaW5nIHRoaXMgb3BlcmF0aW9uIGl0IHBhc3NlcyBrZmlmb19hbGxvYyBhIAo+IGZpZm9fc2l6
ZSBvZiAwLiBLZmlmbyBhdHRlbXB0cyB0byByb3VuZCB0aGUgc2l6ZSBwYXNzZWQgdG8gaXQgdG8g
dGhlIAo+IG5leHQgcG93ZXIgb2YgMiB2aWEgcm91bmR1cF9wb3dfb2ZfdHdvIChxdWV1ZS10eXBl
IGRhdGEgc3RydWN0dXJlcwo+IGRvIHRoaXMgdG8gbWFpbnRhaW4gZWZmaWNpZW5jeSBvZiBvcGVy
YXRpb25zKS4gCj4gCj4gSG93ZXZlciBkdXJpbmcgdGhpcyBwaGFzZSBhIHByb2JsZW0gYXJpc2Vz
IHdoZW4gdGhlIHJvdW5kdXBfcG93X29mX3R3bygpIAo+IGZ1bmN0aW9uIHV0aWxpc2VzIGEgc2hp
ZnQgZXhwb25lbnQgb2YgZmxzX2xvbmcobi0xKSwgd2hlcmUgbiBpcyB0aGUgCj4gZmlmb19zaXpl
LiBTaW5jZSBuIGlzIDAgaW4gdGhpcyBjYXNlIGFuZCBuIGlzIGFsc28gYW4gdW5zaWduZWQgbG9u
ZywgCj4gZG9pbmcgbi0xIGNhdXNlcyB1bnNpZ25lZCBpbnRlZ2VyIHdyYXAtYXJvdW5kIHRvIG9j
Y3VyIG1ha2luZyB0aGUgCj4gZmlmb19zaXplIDQyOTQ5NjcyOTUuIFNvIHRoZSBjb2RlIGVmZmVj
dGl2ZWx5IGRvZXMgZmxzX2xvbmcoNDI5NDk2NzI5NSkgCj4gd2hpY2ggcmVzdWx0cyBpbiA2NC4g
UmV0dXJuaW5nIGJhY2sgdG8gcm91bmR1cF9wb3dfb2ZfdHdvKCksIHRoZSBjb2RlIAo+IHV0aWxp
c2VzIGEgc2hpZnQgZXhwb25lbnQgb2YgNjQuIFdoZW4gYSBzaGlmdCBleHBvbmVudCBvZiA2NCBp
cyB1c2VkIAo+IG9uIGEgNjQtYml0IHR5cGUgc3VjaCBhcyAxVUwgaXQgcmVzdWx0cyBpbiBhIHNo
aWZ0LW91dC1vZi1ib3VuZHMuCj4gCj4gVGhlIHJvb3QgY2F1c2Ugb2YgdGhlIGlzc3VlIHNlZW1z
IHRvIHN0ZW0gZnJvbSBpbnN1ZmZpY2llbnQgdmFsaWRhdGlvbiAKPiBvZiB3YWNvbV9jb21wdXRl
X3BrdGxlbigpLCBzaW5jZSBpbiB0aGlzIGNhc2UgdGhlIGZpZm9fc2l6ZSBjb21lcyAKPiBmcm9t
IHdhY29tX3dhYy0+ZmVhdHVyZXMucGt0bGVuLiBEdXJpbmcgd2Fjb21fcGFyc2VfYW5kX3JlZ2lz
dGVyKCkgCj4gdGhlIHdhY29tX2NvbXB1dGVfcGt0bGVuKCkgZnVuY3Rpb24gc2V0cyB0aGUgcGt0
bGVuIGFzIDAuCj4gCj4gVG8gZml4IHRoaXMsIHdlIHNob3VsZCBoYW5kbGUgY2FzZXMgd2hlcmUg
d2Fjb21fY29tcHV0ZV9wa3RsZW4oKSAKPiByZXN1bHRzIGluIDAuCj4gCj4gUmVwb3J0ZWQtYnk6
IHN5emJvdCA8c3l6Ym90K2Q1MjA0Y2JiZGQ5MjFmMWY3Y2FkQHN5emthbGxlci5hcHBzcG90bWFp
bC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9
ZDUyMDRjYmJkZDkyMWYxZjdjYWQKPiBUZXN0ZWQtYnk6IFFhc2ltIElqYXogPHFhc2RldjAwQGdt
YWlsLmNvbT4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFFh
c2ltIElqYXogPHFhc2RldjAwQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9oaWQvd2Fjb21f
c3lzLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9oaWQvd2Fjb21fc3lzLmMgYi9kcml2ZXJzL2hpZC93YWNvbV9zeXMu
Ywo+IGluZGV4IDk3MzkzYTMwODNjYS4uOWIyZjNkYmNhNDY3IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaGlkL3dhY29tX3N5cy5jCj4gKysrIGIvZHJpdmVycy9oaWQvd2Fjb21fc3lzLmMKPiBAQCAt
MjM2MSw2ICsyMzYxLDggQEAgc3RhdGljIGludCB3YWNvbV9wYXJzZV9hbmRfcmVnaXN0ZXIoc3Ry
dWN0IHdhY29tICp3YWNvbSwgYm9vbCB3aXJlbGVzcykKPiAgCXVuc2lnbmVkIGludCBjb25uZWN0
X21hc2sgPSBISURfQ09OTkVDVF9ISURSQVc7Cj4gIAo+ICAJZmVhdHVyZXMtPnBrdGxlbiA9IHdh
Y29tX2NvbXB1dGVfcGt0bGVuKGhkZXYpOwo+ICsJaWYgKCFmZWF0dXJlcy0+cGt0bGVuKQo+ICsJ
CXJldHVybiAtRU5PREVWOwo+ICAKPiAgCWlmICghZGV2cmVzX29wZW5fZ3JvdXAoJmhkZXYtPmRl
diwgd2Fjb20sIEdGUF9LRVJORUwpKQo+ICAJCXJldHVybiAtRU5PTUVNOwo+IC0tIAo+IDIuMzku
NQo+IAoKVGhpcyBsb29rcyBhY2NlcHRhYmxlIHRvIG1lLiBUYWtpbmcgYSBjbG9zZXIgbG9vayBh
dCB0aGlzIGFyZWEsIEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCAnd2Fjb21fY29tcHV0ZV9wa3RsZW4n
IHNob3VsZCBhbHNvIGNvbnNpZGVyIGZlYXR1cmUgcmVwb3J0cyBpbiBpdHMgY2FsY3VsYXRpb24g
KHNvIHRoYXQgd2UgYWxsb2NhdGUgZW5vdWdoIHNwYWNlIGZvciBlLmcuIEdFVF9GRUFUVVJFIHJl
c3BvbnNlcykuIEknbGwgbG9vayBpbnRvIHRoaXMgbW9yZSBvdmVyIHRoZSBuZXh0IGZldyBkYXlz
LgoKUGxlYXNlIGFkZCB0aGUgZm9sbG93aW5nIHRvIHRoZSBlbmQgb2YgdGhlIGNvbW1pdCBkZXNj
cmlwdGlvbiBmb3IgdHJhY2VhYmlsaXR5OgoKPiBGaXhlczogNWUwMTNhZDIwNjg5ICgiSElEOiB3
YWNvbTogUmVtb3ZlIHN0YXRpYyBXQUNPTV9QS0dMRU5fTUFYIGxpbWl0IikKCldpdGggdGhhdCBt
b2RpZmljYXRpb24gaW4gcGxhY2U6CgpSZXZpZXdlZC1ieTogSmFzb24gR2VyZWNrZSA8amFzb24u
Z2VyZWNrZUB3YWNvbS5jb20+CgotLS0tLS0tLQpKYXNvbiBHZXJlY2tlIChzaGUgLyB0aGV5KSwg
U2VuaW9yIExpbnV4IFNvZnR3YXJlIEVuZ2luZWVyCldhY29tIFRlY2hub2xvZ3kgQ29ycG9yYXRp
b24KdGVsOsKgNTAzLTUyNS0zMTAwIGV4dC4gMzIyOcKgKGRpcmVjdCkKaHR0cDovL3d3dy53YWNv
bS5jb20=

