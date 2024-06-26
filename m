Return-Path: <linux-input+bounces-4631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D04917D10
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 11:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F1E21F23D96
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52E317B517;
	Wed, 26 Jun 2024 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="hEIF55EG"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2134.outbound.protection.outlook.com [40.107.104.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58AC178385;
	Wed, 26 Jun 2024 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719395793; cv=fail; b=p1OcFjbSrLQbYYXopnFIre9kODC4yTOxtZYG/IF3NF5sE7sEp7LY1ZNwE+ueDAr2YICV1XMCFAY7r8tJe7+u+BtAv9aSQzMQ5kJrRAvT/IWb/nN33X939nvzM5Q/Gp1RCFcAGB9p3mXnsA0vfC1/CD8OuF35wYqXsXr+mI2wumU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719395793; c=relaxed/simple;
	bh=G3AcOnh5i+vHzln2znaJAq3MqDCCSuixlQa35tWCX3Y=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=nFuqzNWwDGfSoeM39n97j/nQtEqSv5zjrCHqMX1k+4bV6pXNLx1+eNw+/hN4Z496L00B/K710Gnb8mQhi4WF5C22TW9g7XyeC0/myNDsGFQljXCD01Gq5VfpCSCvTyOkQrj/x4Ufmj/us/l3oEbfGADa7J9JUydzh5esheGS3/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=hEIF55EG; arc=fail smtp.client-ip=40.107.104.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL9jeijUDb6U5W3jalV6Etcwv2qdgD+2/GQyaXcYPMxobbDf/NO4YxTUfDBt1h2he+AaM1KVPcMcHm1lW7UqESoe6Jo8u84KESbFzAV0y6TXD/l8J7pNJ/1rAwGUA09ylD/fD6Ia2XlyM4HdpqKWGj5QWBJVAhJ8FBEL50thzKVpuD5NZ6A3yrAd3jKHxGeAzyuBswLJqCjXSAfkSE97DkfMRShUYiZHHAluzF+w6ebY5ns/+64tAirZalgEVYz2fx3GFpzUM58HuW/KWq1NF3Hb6QYa5CsmCn7TOTPcASMPtpcBCYmrAubirgGeXYcb5w+IQWKK8HaslVL5Eq26Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2++hVseQ/HkjN+M/IpDgyfc1OMe7F4JtbRwrKlA/3g=;
 b=RXx49gLvREAklJ4RZU2XpMdjFhkLPTuK+iu/sJWBv3ADSe7dCbMk4NGiAk9lN3QiGEizrmUmK4hzt9OUekLngKVlmVR+tt2cb4MPRnurnsXP91p76ORQCCG2xXcCvBiMEOlcZAnYkuTOiW9cuuWOCSJgTmekOce6OZzZvWe+EyPxEAXUbmqzYxnOeICtjHHjLGmokIDCcbN9lMtH+Y1Q071NvPsxNiN7q6Arkj+jhF7ZhDyHnP4eTowZ0ZLe59Ye/fSnqRffMTwhyczrkh5Vx3gtzguxtXatBpaL+B2ME9suuM+5q1mrgCZWtO88TgI/GKMhrTwcdGqOddjF94rKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2++hVseQ/HkjN+M/IpDgyfc1OMe7F4JtbRwrKlA/3g=;
 b=hEIF55EG/FuV/kajk1qIyggVe1o9ZKmqI2P/glMfjJcrpuc3KXF1MCnusjWIFSjtr/Oi300O9SHcBtVyYn1vrlKEPnWu50qYZB8ztEStib5GWgbXHo8m7Y6E5y372vHdQo4VlsxHzo/egFSI4fvk7GGWenvXX3rjlDI6sTQeJqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV2PR08MB8679.eurprd08.prod.outlook.com (2603:10a6:150:b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 09:56:19 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 09:56:19 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: [PATCH v10 0/4] Input: support overlay objects on touchscreens
Date: Wed, 26 Jun 2024 11:56:12 +0200
Message-Id: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALzle2YC/43QzU7DMAwH8FeZciZTkuaj3Yn3QGiyXYcGoXZKS
 wFNfXfSIcSBaurRtvKz/7mKkXPiUZwOV5F5TmMa+lJo9XAQ1EH/wjK1pSGMMpVyWsnIML1nltN
 4nlOeBnw9X2CiTrLxwVkFwMGK8hxhZIkZeupWYPZHKzPpdXTJHNPnbe3Tc6m7NE5D/rpdMeu1u
 2PfrKWSDthxrZGMt48fw1v8iXDseRKrPJu9mila9DV4jBxAxU2t2qtVRUMbMUSyCBg2NbtXs2t
 S8qQiaebWb2pur+bWpNGjI9uib6pNze/VfNHa8m3KNcFpt63Vv5pVlbmn1UUjQM+hJdRxO2nzp
 1lj7mhN0YCi1nWrDdTwT1uW5RsV5RELAwMAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Jeff LaBundy <jeff@labundy.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719395779; l=5737;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=G3AcOnh5i+vHzln2znaJAq3MqDCCSuixlQa35tWCX3Y=;
 b=XYCwDdYD5nWQg2tDvArAfgdBno4+UiLHz70J2DXIcFYLCjkRWoUVJ1Suv7VYDs4D7VsarWn8Q
 Ddi9GutmQb8At8tSf1IKy9TXKbqWicQgr642bYDbLC33kNN80h/bLDa
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=hfASRUP6l4lf3Lo2mjLM085/h37dT3m0Qj1HejXDPDc=
X-ClientProxiedBy: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV2PR08MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4a50a5-34c9-416c-665c-08dc95c63a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|52116012|376012|1800799022|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVYxbDhpVU9GMGxYNUhhSE8zcGxvYmp0V2Q0TTlNUHBMQzB0UzVEODkwWmht?=
 =?utf-8?B?cXhNMUN4Y3d0T2MxMkNiSXRGQUNDMG1pWWxaZXlIM1hNOXZ6dXczQysvNUx2?=
 =?utf-8?B?Sm05Uk55R1BwTDlEWVNHd0tmVFhNcnc3OEY4b1BITjgrVTRycXU2NUtHV3Np?=
 =?utf-8?B?USt6dEFIQlFqa29IWWljRU1WZ2RUSGVGSHlJS3BQNjMzMWQxRG9vQzRITmg1?=
 =?utf-8?B?N2FHTDlXbHYyT1Y5U3JabmZoMHUyNTNYNUlBTko3SzBpN3BSWWswSUlsWHVz?=
 =?utf-8?B?V3UzZ1FXeGpSVjNockQzZ1h5cGcxZEZSVnhtVmk5U2JtT3RaZmlTa0xLM0J1?=
 =?utf-8?B?VjF5SXFySGViOGk0dm11Zzh5K1ZnNVBjSDF4dStvS2xxYjh0ZTFwNWc1UFhn?=
 =?utf-8?B?TnN3YU4xNVVMOE5CWTN5MlZQN2lkR1hTbDFFdDNNZVRwM3NsRG1rdEtuYy9Q?=
 =?utf-8?B?djl6ZURIbUEyUCtuL2JTbUlHSmdEODlYaEpaZ3Q0UjVUdUdrdW1KeENCYUlH?=
 =?utf-8?B?YitrdG5SMThQbGlqRjZNRUZId3R5NVRXNndrZGp5Q3ZrWXBlSmE1YVF3aDBI?=
 =?utf-8?B?RERFV0h2TmErenVmV3FwTmRiQkJIV3VuNmhFTVdNNW8wd1QzaVlmMVoyak9W?=
 =?utf-8?B?S01HdVZZMWpiaFhXejBpT0lueG5nSXVZd3FRUVcxeC8vV21FQmd6aDgwQUdh?=
 =?utf-8?B?bGQ2TnlmUEp3WU1EWTFhQkZHSklFSEhIUnpuM3R2a1REY2hFTDFzcDFSSktC?=
 =?utf-8?B?LzRLMzNKcjkwak8wR1MvS0tZTitUMGZFNW5jVitMMDUrR0tpTFhqZGk4bTRr?=
 =?utf-8?B?Wjd4K0ZNZHIveGlON1BPQzdXMWtNM3hvMkFnUmN2ZkJMTW5haHp4eVdDb2VD?=
 =?utf-8?B?dkV3ejdIN0ZHWTF1WUZJMUNHRFFsaEQybFlBa3lsa0NiQzQwNks4TlF6SFp1?=
 =?utf-8?B?bkZZbTNxNHFpWVZqd2JHY004b09RQWg0Z0oyeElBeFNxK3ViNHoyNTZIbmZ3?=
 =?utf-8?B?NGc2M2JFZEs0dVJTRVhxYXNVWW9PaWVHOFlqU2FHaWNxMGVUdStIcEdCcEJn?=
 =?utf-8?B?dm91L1VsdUNRY0hKVVZuc2g5ZTdoNXhtOTQrbjRGTk5lbXA4ckl6RGNTNHAw?=
 =?utf-8?B?ZnBMQ1RDQnkxZ0RMUFBVMUhQUW51Z0lpRDZ2aDJOSHBhbnFUOVBXS2dEZ1dk?=
 =?utf-8?B?VnJNTWNwYkRrc21WVng5U1FoNmJqQkxHb1lUMkRjOXRxWHIrOWZTaDZOTWRO?=
 =?utf-8?B?RlFLSm1YbC9ESkkyNmJUVjlpbEZIdUozOTMvM1I3cHFwRHFOditkYS8yNFAv?=
 =?utf-8?B?ZzErL3UzNmF2R3RrR05Rb04wbzNMdEhLc3doVXFUYnFIV3o4OGh6QkRnRHZp?=
 =?utf-8?B?VVZtdUdPQ3JWb2tkZFZ3VThYaXpJN0l2Z3RrcUV3cXREMEE3amJsRmpiVXBs?=
 =?utf-8?B?OU5vRHpOU2pMUjUxNEt0YjZBWjJGM2dKaS84dXhlU2MzcDljMVlXSnNIUStR?=
 =?utf-8?B?eFliM3pNVzFXVHpjMkd4eUlKUlRIbUJNWFpiWjBJdEYrMG1ZYzRPenl2MnNl?=
 =?utf-8?B?L0oxWXQ1cldXa2dFd2krblpRUDNZKzc3dTJUTjdlMDFqYndqTGtCNUp3d1kz?=
 =?utf-8?B?czNDVjN0bDhsaTVIbXBvMWZnaWxMMHlJcCs5Z3h6Q05pTUFtSnFsUmNrUmhk?=
 =?utf-8?B?THV5aitYUTYyc1ZvQXROMkRJKy9qN3B4bmE4WFMzL2RXL2ErdzEzOFFFd1Zm?=
 =?utf-8?B?YjVkelpTWWdjb2RqVXFhdWRTRkRuZjhiUCtLRDJ3UWh4K1VxTUM0THd0VjdE?=
 =?utf-8?Q?z0CEtTJaR/GxC9+4qors/r8qCklMxAJB4o8vw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(52116012)(376012)(1800799022)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVZXTGtsay96TVNrL1YzWVdHMmN2MTBqMUNoV1NySzh3V0dzNHQyVUQrY04y?=
 =?utf-8?B?RUVxeUpVM0tPWms3clh1Q243bk5zMDk2N2h3YWtvYlVIVGFXVE54RytqKytV?=
 =?utf-8?B?SktCYnN4dEtmNHk4RHNsSElJV1JXR255Y0dnc2pINzNuV2NmcDhrWFlUdmkx?=
 =?utf-8?B?Y0Y4aDBZaHV3dUw4MERNMU9QYTNkUWtWWkgrTkIvT2IrZHpiV1hYZFNhNEhV?=
 =?utf-8?B?MVJIeFE3eUpRNFlzcnBBM2Q0YUVLa0RSZFVBSTVMUnlualIwSzlyRzJIeGd2?=
 =?utf-8?B?dHNDS0lFMURMZ3hia0gzZ2dGTXl2WlR0ejBnUUZRQkRpakF1aW1hN1p5cGtB?=
 =?utf-8?B?ZnRLb3BINEhqNDZyeDA2cXJMKzVzaVNuUlVJTE4vZTJEYzNtSUpoUGhZQVls?=
 =?utf-8?B?SEpoUUh3WlRDWnRMVXZIQU9tQ0orYWhIK3BGbU8rVTB3cXlvWTZ1cHN4dEYv?=
 =?utf-8?B?VDVGRnJpRWRBNUNURmN5S3F0ZjF4NjgzMkFaVWVlQkNEMGkvc0laaklhRHFD?=
 =?utf-8?B?UlpwZlcxYkFCL2RkQTVMMUNpRUhGcngvQ1FLVWFKYWhhdGZpWlg0YXIxK1k5?=
 =?utf-8?B?VVBLRENoUVRHU1VFcWh2dEZyK1BvSVBLWG80TDNjejdiRlRPQ0JkdGlDSTNv?=
 =?utf-8?B?OXFMOFJKNHZjZkR0VkVXbWdZS3FqMThHakw4Nkt3TjRWdjJTN2NEaS91RXVM?=
 =?utf-8?B?Ung5UzJ5Yk1haWRRcHp3Z3VPazVaSVMxcXdMV0tjdERMbGJTQ2s0Q1g2NXZX?=
 =?utf-8?B?cXBpMURaY3MxQUd0bi8zNkFmNHJxUm1TRWl0c0EwQVZnSE5LeFRxaHcrdCsv?=
 =?utf-8?B?VmVSdm1SNmdheStyb2ZacnVCbzhYV1JvOXY5bXJTT0tnV0E1bU5kcWdVVDVR?=
 =?utf-8?B?YkFvWldSQm5PbW5HRjFYd1NjTy9UWTRyT0M3OHhwRXcxZ1QyQksvMDd3V3RS?=
 =?utf-8?B?UlViR0tod3ViTnJWdGRqT29jQmRTQkhxeXROWlFNa1VERmErOVpTdm1rZWk0?=
 =?utf-8?B?QU5QSXJHbkFqR3lGc0hMQzQ1bmNrcWJxZ0pxSEpvcmdaWmtQYnpWeGFNYWg3?=
 =?utf-8?B?d1hSQjE1ZXZkL2VDNWVRS0d0VGVvSlFESmI2ODFuNEVIdld6aVY5OFpMQ2Uy?=
 =?utf-8?B?Z2llM2RMRHFkMXI0M29SZWRnblAzVk96MTFEODkvUnNEQWxFRGhML1M2ZTI3?=
 =?utf-8?B?UjNuVCsyZjF5NW41bTZGSFhSTHJjaUwzTU1ZNzFqREFaNTZrRUt4VVI0MVpQ?=
 =?utf-8?B?L3dYSGZhTDFoS3p1U1ZyQ0UxV2RiRm1IeVdlTzZMSi9oaXVxS09KYTNYVDZj?=
 =?utf-8?B?VkRHUndLbW13N3JJTHZndXVNSEhrMWxIc3NBQkh1SGpLTGhXekRCRTJQaFVp?=
 =?utf-8?B?NC9oT09qdjU1N3NZNDhvVGtVTytMaDJLejBPai9icTZJaXdrUTMyUzRuYStG?=
 =?utf-8?B?TVFiMW5IZndVa1I0TWpxU3F3Y3pSQTBncGs1akpucXhhVGMvSzRuMkVJSEFL?=
 =?utf-8?B?K1ZBWTNWdVU2dVNOSjdCRUlFc0Z3ekpQZERVc09aSjN5M1o1VlkvQk5QOFJT?=
 =?utf-8?B?cHArb0pHRUJyWFByNnpSeXhWUTdia2ZPdmFXbGtmY2ZXa1lFMGFkREh1UEdP?=
 =?utf-8?B?RmtPdktJblBodTZOS2syb3U0WWlrend4bGpVbnFBVnd6S09NNUxhVWtrOW93?=
 =?utf-8?B?bzV1OHBUeW1mWTFCQUh6cElvc3c0YlZEdklCbUVjYVVuL1NQUHZ1dCs5ekls?=
 =?utf-8?B?dmU1WkwwUFlRbzU2djBoODhnSldQblA0Z0ZuV0lCQkpSK1Q0Qlg1dEZDWVlr?=
 =?utf-8?B?b08vNC83RmVSRjhRMmxQWmtTa1FCQTg0SFZ1aWpwSlAzWjAxU0xKYkxGUVNj?=
 =?utf-8?B?emFMaDJPK3hDNVVmcnI1RjRlNmc2UDlqbWJYR2kyWXV2T0FaWkRRNEJRQ3Z5?=
 =?utf-8?B?WmVyU3UxU2RPUm9NZWhjZFpVTDlib2RaT29OMEg3RlZzSEx6TGNoTVJ0WWRR?=
 =?utf-8?B?K3JaQ1YvbVdPVEQ5ZE01TnZvN2FidDZrOWl0TzVKU3djZG9ZQnFxRzI3QjFW?=
 =?utf-8?B?ZTh5UXExWnpLbWNMN0hyTENpM253dk5nT0ducFhUemFCMUoxQXNwOVFlWHJZ?=
 =?utf-8?B?L0dCQkVxbVdvOGV4MlV5ZU9leEhXQ3N1dGlLTDZkQTkrelIvTmhCRDBFNXhN?=
 =?utf-8?Q?3pkZAh9kjPKJq3bM7kNZfKI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4a50a5-34c9-416c-665c-08dc95c63a49
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:56:19.5054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KCQgJkiRPXJpiJ09ydmQ9cqmbwjN7qr8p94JVlp2FhyUg09fk83KOt3RQGDnuYlFDhPpTy1rJidYzWkH7v6UV9Wa6fw/pHCjKtRgzjAxhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8679

Some touchscreens are shipped with a physical layer on top of them where
a number of buttons and a resized touchscreen surface might be available.

In order to generate proper key events by overlay buttons and adjust the
touch events to a clipped surface, this series offers a documented,
device-tree-based solution by means of helper functions.
An implementation for a specific touchscreen driver is also included.

The functions in touch-overlay provide a simple workflow to acquire
physical objects from the device tree, map them into a list and generate
events according to the object descriptions.

This feature has been tested with a JT240MHQS-E3 display, which consists
of an st1624 as the base touchscreen and an overlay with two buttons and
a frame that clips its effective surface mounted on it.

To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bastian Hecht <hechtb@gmail.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Changes in v10:
- touch-overlay.c: use fwnode_for_each_available_child_node() macro as
  there is no point in adding unavailable objects.
- touch-overlay.c: initialize error in touch_overlay_map(), which would
  be returned uninitialized if there were no touch overlay segments.
- touch-overlay.c: fix fwnode_handle refcount (overlay must always be
  decremented before returning, fw_segment in error paths of the loop).
- Patch 4/4: update description (the feature does not add a second input
  device anymore).
- Link to v9: https://lore.kernel.org/r/20240422-feature-ts_virtobj_patch-v9-0-acf118d12a8a@wolfvision.net

Changes in v9:
- touch-overlay.c: trigger a button release if the finger slides out of
  the button segment to be consistent with the button press when sliding
  into a button segment (see touch_overlay_button_event()).
- touch-overlay.c: (nit) remove braces in if with a single statement in
  touch_overaly_process_event().
- Link to v8: https://lore.kernel.org/r/20240320-feature-ts_virtobj_patch-v8-0-cab6e7dcb1f6@wolfvision.net

Changes in v8:
- touchscreen bindings: fix description formatting.
- Link to v7: https://lore.kernel.org/r/20240119-feature-ts_virtobj_patch-v7-0-eda70985808f@wolfvision.net

Changes in v7:
- General: return to a single input device implementation.
- touchscreen bindings: segment instead of button in the label
  description.
- touch-overlay.c: define button-specific data inside segment struct.
- touch-overlay.c: remove fwnode_property_present() and check return
  value of fwnode_property_read_u32() in touch_overlay_get_segment().
- touch-overlay.c: simplify return path in touch_overlay_map().
- Link to v6: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v6-0-d8a605975153@wolfvision.net

Changes in v6:
- General: use a single list to manage a single type of object.
- General: swap patches to have bindings preceding the code.
- touch-overlay.c: minor code-sytle fixes.
- Link to v5: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v5-0-ff6b5c4db693@wolfvision.net

Changes in v5:
- touchscreen bindings: move overlay common properties to a $def entry (Rob Herring)
- st1232 bindings: move overlays to the existing example instead of
  making a new one (Rob Herring)
- Link to v4: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v4-0-5c6c0fc1eed6@wolfvision.net

Changes in v4:
- General: rename "touchscreen" to "touch" to include other consumers.
- PATCH 1/4: move touch-overlay feature to input core.
- PATCH 1/4, 3/4: set key caps and report key events without consumer's
  intervention.
- PATCH 2/4: add missing 'required' field with the required properties.
- Link to v3: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v3-0-b4fb7fc4bab7@wolfvision.net

Changes in v3:
- General: rename "virtobj" and "virtual" to "overlay"
- PATCH 1/4: Make feature bool instead of tristate (selected by
  supported touchscreens)
- Link to v2: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v2-0-f68a6bfe7a0f@wolfvision.net

Changes in v2:
- PATCH 1/4: remove preprocessor directives (the module is selected by
  the drivers that support the feature). Typo in the commit message.
- PATCH 2/4: more detailed documentation. Images and examples were added.
- PATCH 3/4: select ts-virtobj automatically.
- Link to v1: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v1-0-5ae5e81bc264@wolfvision.net

---
Javier Carrasco (4):
      dt-bindings: touchscreen: add touch-overlay property
      Input: touch-overlay - Add touchscreen overlay handling
      dt-bindings: input: touchscreen: st1232: add touch-overlay example
      Input: st1232 - add touch overlays handling

 .../input/touchscreen/sitronix,st1232.yaml         |  29 +++
 .../bindings/input/touchscreen/touchscreen.yaml    | 119 ++++++++++
 MAINTAINERS                                        |   7 +
 drivers/input/Makefile                             |   2 +-
 drivers/input/touch-overlay.c                      | 264 +++++++++++++++++++++
 drivers/input/touchscreen/st1232.c                 |  48 ++--
 include/linux/input/touch-overlay.h                |  22 ++
 7 files changed, 476 insertions(+), 15 deletions(-)
---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20230510-feature-ts_virtobj_patch-e267540aae74

Best regards,
-- 
Javier Carrasco <javier.carrasco@wolfvision.net>


