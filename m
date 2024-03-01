Return-Path: <linux-input+bounces-2137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE8B86E5B3
	for <lists+linux-input@lfdr.de>; Fri,  1 Mar 2024 17:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48AC21F22964
	for <lists+linux-input@lfdr.de>; Fri,  1 Mar 2024 16:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FF21FAB;
	Fri,  1 Mar 2024 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="otZ433Ug";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DhkrTXfu"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11D7EB;
	Fri,  1 Mar 2024 16:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709311020; cv=fail; b=rNDY3o4+DdXAGq68XkjBSuQ4QojY6tKQfXhIvH5uLvFVR/1apOHhNYNJ1uHH3Mz9cZdNEHtr8vLJvmzmhayfcf4Bqpf36k0lb5dzdpD6NghGAHbPuBZrOfqDgtQU1kMlxREGYNRU2A2yHd1MDlBiTh59eUinZ5Vmy067FwWufVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709311020; c=relaxed/simple;
	bh=dPniNcbs0aUqvQoaBDg0k1xMe8/X4c22emE3UzqEHbc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JcigFPqREvRFon+Hc+baYekdqjyusI0DicDcsRj7E8rWyqZ79IAr47zOBv0GEgFHKVUHxEGg+NCeW2AYhnx4wAQNAgJeo0lqnirxEih4XWpEPUN7R0RoZztqT+T2iJ/sLzvO0QUu0swMpBGSjeAtqE7So+V5GnEln+qP6GtkWzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=otZ433Ug; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DhkrTXfu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 421Ewj4o003464;
	Fri, 1 Mar 2024 10:36:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=dPniNcbs0aUqvQoaBDg0k1xMe8/X4c22emE3UzqEH
	bc=; b=otZ433UgKWM6GEhUYpYv+7uM5wTbBB7kjbRaJ1nNMSk1s815LzqqaeF5P
	JGd3vvnnnIAFpXNMfp3uxyuo/8S5oG/o0pInOkaLDesPJfsKqrv6dO/9QikN3kgc
	rEpa2BKt1we8rK9/qMd+fJ2KMzG3iJL5VkEQHIgQ8dj43/LdifhlSj13KnB5XOQT
	Jfxt5U6AINjuGKPDCD+uTMCuTW/5upGg1Icjk4zAKaMN1VamuuB/DK4ZnZwwuVVz
	Biv6+iUEzdssHpSVLUewtVn9nRpR1wYNKaOgR/g17r5wGay1gzh62Pu4kEvFwBrQ
	un775to0FQfIQrR9EcjJbWRhnB7pw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wkh8r044v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 10:36:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA+igDn/9fMbRr1WgGNVpEHJcgf/2U3PR/5fc0HYVRzUfR+0GZwv3Cg8SLsHFRRM0qp/WO9bHO2t42YVu2gA2jRymcWnUObQRprU2pLdrgVFVqgmBvjF6VKlGfeQJyp9hVS2/81PHmPw9+vbw4cMg/PxWhHsZoZM5sDpHRYce9BKYXom6rJSfv4KHFEZlkvnl/E+7ITHcci8H+ZXEKf7CQcY+/QB28QVD04KPhzg2wxdsovhZjgL2U/YbvQk4aFqouGc/8rozeylOoBgrm7QLEWlWkF15aFh+X7y35v+5RzNk5fDGzXKPjpM4CoN9Zp3saBemN99Io4QQKoVlgD1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPniNcbs0aUqvQoaBDg0k1xMe8/X4c22emE3UzqEHbc=;
 b=MntCAFvZY6FNHFGrQcba9L3iQ5iAbQRrZmOxwoNTmOgbGUESNLPaX+tEfRAeP7ianVC2DRK5x49g+QxsUCQrTVodsh935wfOs1eaTUpQ+kz8Xl9QosVHfhedolhbWUVmjWbyznjvmB3NuprhHGQLDp3hIks6klynxZUchiu74t+gCrHcbhe0iGxVVeIQItUu8ZXA/yyjnZ66p6jgD1jTQhF3I4An9igh+pFZavBZmYLp/7XwPCwfNWK1jn2sKGwgVL+mFe1KJ8P2yC2xrxtBhC/sQtoze9WCkACNC0UJSNVSqFIIa1VfNZUw59a67/nIN21foYAqBvLPH5HQT+lsAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPniNcbs0aUqvQoaBDg0k1xMe8/X4c22emE3UzqEHbc=;
 b=DhkrTXfub3zNzYI7eECXtikcQhsIzPszw4Z70LIXO3DnHoYhJwNKIDdm0lB8gcF316J5PE55CeWiDck022RDLMVO5MzZHnl+WdSZLpcg4vX3vPZAMU7qFG6sgZ7psSwlJ6QOPKvcN5QOb+LexOOQUzKxfWjLWgJLEk1SSxvc4Ao=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 MW5PR19MB5483.namprd19.prod.outlook.com (2603:10b6:303:197::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 16:36:48 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac%7]) with mapi id 15.20.7339.033; Fri, 1 Mar 2024
 16:36:47 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Jeff LaBundy
	<jeff@labundy.com>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Thread-Topic: [PATCH v8 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Thread-Index: AQHaZF4UgIr28UNwtkWTd9HzyMQhiLEiqcUAgAB6wYA=
Date: Fri, 1 Mar 2024 16:36:47 +0000
Message-ID: <6DD14CBC-FAE2-4768-AD77-347229FE9AC7@cirrus.com>
References: <20240221003630.2535938-1-jogletre@opensource.cirrus.com>
 <20240221003630.2535938-4-jogletre@opensource.cirrus.com>
 <20240301091716.GA1688857@google.com>
In-Reply-To: <20240301091716.GA1688857@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|MW5PR19MB5483:EE_
x-ms-office365-filtering-correlation-id: ec2783d4-d845-46e1-931e-08dc3a0dc9fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WvqI23D6FUreQ0SLe+3Y/iKumsD+zUxtK80p6rBP1quSH9FAqmtmLm3tjxwrkS/FK35XXJnka76sMAbIUf6f6rqa805D0aBAlWdZJVdBIkes6bQ4yGZRqnZuj5/odbd7/mp4kifewSBOtOKRZ/T9S0kF5uFIYJxnIcUWT2cyOUrMslLurc1Akn1byYAsolMB3rQXQksnyaIiuYxcwi16tnIxQMVCz3YReZmUn4LKISFTWmuNKI0qi1+WwYgK3w2B7K23rXeLIfCfbchpr83V8pcGF5tIyxpYUbBic3t7oMDL441ovp9x2lmnIM9khu/QGenzD9dUoTKT2otAnL4drLiLfd69RFSgUtLhrLlkwf/2g4Vq302sMMT2icl6sIniApaAZiKBMod02jjmOy8lDbYUHps+c/FG1+lyfc4XIiuoFb/3BgTtGL+nIcSPvKuxdSsE6lhjmQwHO6hVDSmYt94AciisK8ojy7Q194iSyXS1SYPtG8EO4nGQ1HbIo5WCb8tnr8mAo9M/pVds/lEah9r79PJHdIK/1VE/Yi2jGuKyouqgXWy7XhXmMOGhvbX7sO+/cxnP5Bm3m7SFY2lWK5UaJiIjzJojCYNge3iT+XzIgb4Osio9Fp6Shx/CdqtDInU+Uw1/n8TFDfAmugbiT9d4LZkOH8j/dkv5+s3gyEykcp5Mpv6BGS/uYGr/LCHg6aM1GGNOwiYsD5pl5t/Itgsxgk79nb/a2UYoMhuWipQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MVVEck9GUWJmOVgyUEVnVWVWdjlmdityS2Zkd09oRlJ6ZkM5OVVLSXBFRjMr?=
 =?utf-8?B?UUl1cG1xeVJrZHBncTIzY2tFQjREZ0lCWXgyaWllSW03KzY5Q0tQSXM4MW0v?=
 =?utf-8?B?NEJqZ0RWM09MUGlUUkJkMFRISmJOYmlpRmxQaGd1V3VGSHA3QklGSUJ2UlBm?=
 =?utf-8?B?dU1uVFVQU01reFI5YlV5U2ZTdEIvSk9xMmhqeE1KdGkzQ2YwNFB2ZDFFRkFl?=
 =?utf-8?B?UGd4dmRSNmdhMmd3aGFpYlVLdnNWVzMwaHNDMXFYTHFFc0YvMlN3UFlsd3ky?=
 =?utf-8?B?Qy9lbXhTSzZsQ21tYkJBaFQyQlAydWMyV2dFUXkzZ01YTzFFeDh4R0hab0FH?=
 =?utf-8?B?VUpLTFBxcmhwdkZ2ZzFwMVkwblJNQ0VGeW9CeHd4UWRFbFpnSFN4RmQvNWh5?=
 =?utf-8?B?Z3F6SGN3aHo5Zm1BUk9vOHlwbmNZYy9OQzRCOTE1YUphWGtTS3YyTkplWU0w?=
 =?utf-8?B?YWg5bnlOdlZaR2puVStZaUdiYzRWVlIvZ24yU1I1aUVXUXA1UVg5UCtyaXpF?=
 =?utf-8?B?V3VLcjdQZVlVb3QzSXhxdjRLcm9OcVdSVjdqUmhHOW5sbVFlM1lrbjVBTUR6?=
 =?utf-8?B?Z1RIZGJ5NEM1bWphUWZHcWRiVzdqcklRVkJmY1g0L1orMlB2UnZFOWRWM2xm?=
 =?utf-8?B?czVVc2x2WnJoQnpFTElneWRrd2NHOEw5N1NIVDdxRTBzNUk3Y05GK0ZtVzVW?=
 =?utf-8?B?aFFyaWVwRlJjbk5SMXpmUVZuVC9xMkIxLzB0bmlSM1kySXFxc3FjdngrV08r?=
 =?utf-8?B?RkNyNkU1dkxqUTdkakx1bHg4eVRhcllrWS9BVUFTdmN4K1owRnlhMzZsTkVK?=
 =?utf-8?B?Vlp6NHErYzQvTFI1QnpTbXRhbFZ2a0ZDU3poMUlWVW9tZUVBOXZaT0lPUEtx?=
 =?utf-8?B?VmNSdnowejN0SzRkL0o3SitudmQ3OHdLK1NHV21lRDlKeWYrc2l5akt1Qkxp?=
 =?utf-8?B?U01WbDVhMG5QT1oxellFODFqRjVZWkpMODdkbWcxY1FITjljQkF5NGVSZEQ5?=
 =?utf-8?B?OGJaNmlSWFR0R1pNb1FhSTQrM090MDV0NEJtUUVTTnNzekdGUEk0NU1pRnZa?=
 =?utf-8?B?OEhUbXMyT3NhdytOMWtTNVJ4MUFaUWNzUzVQUWM2aVhaZ1FEelcvQUs4cG9Q?=
 =?utf-8?B?N0JFOGoyMi9sc20zNUNSMXhnRFpMRzdaRzFCKzJHOGoyNEE3OWNNWmtpLzFL?=
 =?utf-8?B?MU5mT3dTTEg5a3ZOOHI5YXBRbFRsMWxzQ0cyUVlRODQvYzFQQkxlbmIrWnhY?=
 =?utf-8?B?VUpWbW8rdnZ5dXJsczFhdDdkTU9hREI5ekt5THBNYnF1eUdzRXNaVnhydlZ4?=
 =?utf-8?B?MVRyWUNwR2RVL2FZZDU3RkJpYitWV2FmWHFrOW1KRmRsbkJwTWVXV0VzdXJl?=
 =?utf-8?B?dUxtTUhtVW5jZXNYNnpMTjhxZUtZMUpZMUdQZDArdXY5RlFCc0JxNUI3V1Vz?=
 =?utf-8?B?WU9JbXoxVHVXaGRaalRWdk12Rnc0bWZmVmZNTmlRNHFLUloxcXFZclZjeVk3?=
 =?utf-8?B?QkRXNURyVjJROHVoeUF3VWg1a2xzTy9BUGdVU2JvRlNuSnBiZEdQMytwSGhL?=
 =?utf-8?B?eFFINWRMQVhXc01EMDFvYTE1QUkwZ1g5RmZwNlBKN2NGL1hRSGtOR0Y5YlRS?=
 =?utf-8?B?ZW9qVmY0c21NYnlkaWFMb3dpZW5tbkx0Q2xNc0NVRVhvR2ZOQmhRSjBnQVph?=
 =?utf-8?B?Q1gyd3hPSndrZkVUVTU3bjQyTWloeWNOVkhHZnAvdHY3SnFNYk5wOFhqcE9I?=
 =?utf-8?B?SGhOa2ZZT0dreFZoZU4wdlc2SjZrMjNBZ1dtOXhMVHdNaG85UVJ2TVhpc3Ev?=
 =?utf-8?B?V1NDT3psWU9vaGhMdExSemo5a3lFQ1g5b2FURitmaVp2eFZoUklVRTA4VlNm?=
 =?utf-8?B?ZUNEdVNPalVsSFJuNXpSNU1ld0hIVWF3bmg4WENzYXBuUmpMd2lxUDY3VFRT?=
 =?utf-8?B?T202bHd4d1dPcU4xa3hOSzdCbTlraTlSUFo0azFNK25lckhSOU5CUXE5cDg3?=
 =?utf-8?B?SGhBSXE4VXk3SHR4dW8yTnJiZXJjM3BUc0JkOXhaYStQL0lONy96eVNOYjQr?=
 =?utf-8?B?cWEvTG5jMUJLMEdPMU9KcG02UFBwWGtMU0g3Tlp6Wm9QQzFEaUlIY2JzZVFW?=
 =?utf-8?B?L1JuREwvaThlUE96czhPTUhzMG1BT0FVY2pLVy9VTTlTMWFDbzFqNnUyTXZh?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2B50DFFA1D1D2408CE112D400DF05D6@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2783d4-d845-46e1-931e-08dc3a0dc9fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 16:36:47.6790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZU5m3jHuShU/tJudynnsPs6k5HbMUUuIk6cfvxzYdBm8+5C12eYVPDzIsMKoVrIdjAJ7u0K0uVMA5HaLbbTUbWGIshDE2AtwRBiZ9HELrIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR19MB5483
X-Proofpoint-ORIG-GUID: 3G8u_NSWf9lVoP_lXTTc_XjxLgynvqf5
X-Proofpoint-GUID: 3G8u_NSWf9lVoP_lXTTc_XjxLgynvqf5
X-Proofpoint-Spam-Reason: safe

SGkgTGVlLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gTWFyIDEsIDIwMjQsIGF0
IDM6MTfigK9BTSwgTGVlIEpvbmVzIDxsZWVAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBX
ZWQsIDIxIEZlYiAyMDI0LCBKYW1lcyBPZ2xldHJlZSB3cm90ZToNCj4gDQo+PiBJbnRyb2R1Y2Ug
c3VwcG9ydCBmb3IgQ2lycnVzIExvZ2ljIERldmljZSBDUzQwTDUwOiBhDQo+PiBoYXB0aWMgZHJp
dmVyIHdpdGggd2F2ZWZvcm0gbWVtb3J5LCBpbnRlZ3JhdGVkIERTUCwNCj4+IGFuZCBjbG9zZWQt
bG9vcCBhbGdvcml0aG1zLg0KPj4gDQo+PiBUaGUgTUZEIGNvbXBvbmVudCByZWdpc3RlcnMgYW5k
IGluaXRpYWxpemVzIHRoZSBkZXZpY2UuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIE9n
bGV0cmVlIDxqb2dsZXRyZUBvcGVuc291cmNlLmNpcnJ1cy5jb20+DQo+PiAtLS0NCj4+IE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICB8ICAgMiArDQo+PiBkcml2ZXJzL21mZC9LY29uZmlnICAg
ICAgICAgfCAgMzAgKysNCj4+IGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICB8ICAgNCArDQo+
PiBkcml2ZXJzL21mZC9jczQwbDUwLWNvcmUuYyAgfCA1MzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+PiBkcml2ZXJzL21mZC9jczQwbDUwLWkyYy5jICAgfCAgNjkgKysr
KysNCj4+IGRyaXZlcnMvbWZkL2NzNDBsNTAtc3BpLmMgICB8ICA2OSArKysrKw0KPj4gaW5jbHVk
ZS9saW51eC9tZmQvY3M0MGw1MC5oIHwgMTQyICsrKysrKysrKysNCj4+IDcgZmlsZXMgY2hhbmdl
ZCwgODQ3IGluc2VydGlvbnMoKykNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9j
czQwbDUwLWNvcmUuYw0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL2NzNDBsNTAt
aTJjLmMNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9jczQwbDUwLXNwaS5jDQo+
PiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvY3M0MGw1MC5oDQo+IA0KPiBN
b3N0bHkgZmluZSwganVzdCBhIGZldyBuaXRzLg0KPiANCj4gQXNzdW1pbmdseSB0aGlzIG5lZWRz
IHRvIGdvIGluIHZpYSBvbmUgdHJlZSAodXN1YWxseSBNRkQpLg0KPiANCj4gSSBjYW4ndCBkbyBz
byB1bnRpbCB0aGUgb3RoZXIgbWFpbnRhaW5lcnMgaGF2ZSBwcm92aWRlZCBBY2tzLg0KPiANCg0K
WWVzLCB1bmRlcnN0b29kLg0KDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBjc19kc3BfcmVnaW9u
IGNzNDBsNTBfZHNwX3JlZ2lvbnNbXSA9IHsNCj4+ICsgeyAudHlwZSA9IFdNRldfSEFMT19QTV9Q
QUNLRUQsIC5iYXNlID0gQ1M0MEw1MF9QTUVNXzAgfSwNCj4+ICsgeyAudHlwZSA9IFdNRldfSEFM
T19YTV9QQUNLRUQsIC5iYXNlID0gQ1M0MEw1MF9YTUVNX1BBQ0tFRF8wIH0sDQo+PiArIHsgLnR5
cGUgPSBXTUZXX0hBTE9fWU1fUEFDS0VELCAuYmFzZSA9IENTNDBMNTBfWU1FTV9QQUNLRURfMCB9
LA0KPj4gKyB7IC50eXBlID0gV01GV19BRFNQMl9YTSwgLmJhc2UgPSBDUzQwTDUwX1hNRU1fVU5Q
QUNLRUQyNF8wIH0sDQo+PiArIHsgLnR5cGUgPSBXTUZXX0FEU1AyX1lNLCAuYmFzZSA9IENTNDBM
NTBfWU1FTV9VTlBBQ0tFRDI0XzAgfSwNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGNz
NDBsNTBfZHNwX3JlbW92ZSh2b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsgY3NfZHNwX3JlbW92ZSgo
c3RydWN0IGNzX2RzcCAqKWRhdGEpOw0KPiANCj4gSXMgdGhlIGNhc3QgcmVxdWlyZWQ/DQo+IA0K
PiBXaGVyZSBpcyB0aGlzIGZ1bmN0aW9uPw0KDQpTZWVtcyB0aGF0IHRoZSBjYXN0IGlzIHJlZHVu
ZGFudCwgc28gSSB3aWxsIHJlbW92ZS4NCg0KVGhlIGZ1bmN0aW9uIGNzX2RzcF9yZW1vdmUoKSBp
cyBleHBvcnRlZCBmcm9tIGxpbnV4L2Zpcm13YXJlL2NpcnJ1cy9jc19kc3AuaC4NCg0KPiANCj4+
ICt9DQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBjc19kc3BfY2xpZW50X29wcyBjczQw
bDUwX2NsaWVudF9vcHM7DQo+IA0KPiBXaGF0J3MgdGhpcyBmb3I/ICBXaGVyZSBpcyBpdCB1c2Vk
Pw0KPiANCj4gSW4gZ2VuZXJhbCwgSSdtIG5vdCBhIGZhbiBvZiBlbXB0eSBzdHJ1Y3QgZGVmaW5p
dGlvbnMgbGlrZSB0aGlzLg0KDQpGcm9tIHRoZSBzYW1lIGNzX2RzcCBtb2R1bGUgYXMgbWVudGlv
bmVkIGFib3ZlLCBpdCBpcyBhIHN0cnVjdHVyZSBjb250YWluaW5nDQpjYWxsYmFja3MgdGhhdCBn
aXZlcyB0aGUgY2xpZW50IGRyaXZlciBhbiBvcHBvcnR1bml0eSB0byByZXNwb25kIHRvIGNlcnRh
aW4gZXZlbnRzDQpkdXJpbmcgdGhlIERTUCdzIGxpZmVjeWNsZS4gSXQganVzdCBzbyBoYXBwZW5z
IHRoYXQgdGhpcyBkcml2ZXIgZG9lcyBub3QgbmVlZCB0byBkbw0KYW55dGhpbmcuIEhvd2V2ZXIs
IG5vIHN0cnVjdCBkZWZpbml0aW9uIHdpbGwgcmVzdWx0IGluIGEgbnVsbCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGJ5DQpjc19kc3Agd2hlbiBpdCBjaGVja3MgZm9yIHRoZSBjYWxsYmFja3MuDQoNCkJl
c3QsDQoNCkphbWVzDQoNCg0K

