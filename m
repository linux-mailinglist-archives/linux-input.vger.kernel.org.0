Return-Path: <linux-input+bounces-16530-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A3BCB3211
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 15:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48FDD30422BB
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 14:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94ED232277B;
	Wed, 10 Dec 2025 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="VseSZarJ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="VseSZarJ"
X-Original-To: linux-input@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023114.outbound.protection.outlook.com [40.107.159.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0021423C;
	Wed, 10 Dec 2025 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.114
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765376535; cv=fail; b=awAahZt1hHxpzJq/oijNdlEglPjlw9cWK81SLZoGxhWVazn1q4DrLjUt4koBiWEKg0ugF0qv31tgSI4N93wKpbBVy0NVX3HMSEEr/8XAZdDKEL6U7axFSGbWE++Jlf1SJRrNizfVAhXE/eMxPcFin1zfwPorpQbgf/oKI0EBL44=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765376535; c=relaxed/simple;
	bh=EgttHxV270j1bUWTRTK1SdurWvhFi+xxXe/sK4F0kjM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jDF4DNQXDfkhnycb0dKeElMXMUBXiXHYSdnX6LC23eD0f8JQbfukwDyLRYJGB+xRK4dJbtj07SzXTyFscyUwD+1gYGQ7YHGPokJ32K9t9OZoEd6gbuN+LWgFOOgvQ4hdxlzp34sBVk/5j08Yzw5gRcjTjzPONgeU8aVT3Tz05jU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=VseSZarJ; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=VseSZarJ; arc=fail smtp.client-ip=40.107.159.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hW/aUZvSZiEQS1IgPToydBSWOfoqb/I3Tx9FJgNaFRd7o9cixEBzNPrqzTRr8Blc1MgYpO8PMmpsgf2KWLJ87An7Yth0wlJI3Ts88eqtrxTXbvjzNBV64XNTxJr/SkC6Zp/hzuWnDHmzLowPYa06918vOIQshszqFl9tHrI5qXS3jLALYMnCPbc5babA5DsI52KzZArzaYsnjFRYCXa0lLTwl72I0Phikuut0gxQgNaCj/K10ZD1kAF8FtaJG2ePRGwnZB4fxecvxDpQG08eZVsdp81FoXcVVzz41U/i/KTV+xTxY+v4cViBpGajs0sJvz/mBtc7QkRaVNgzi57quA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgttHxV270j1bUWTRTK1SdurWvhFi+xxXe/sK4F0kjM=;
 b=Nf0KPiFqRr1+1UEsG4MOe5DCgpXxHmHksa4/4Vg1kbkQthEzeRoUfdqN6bQlZDFNHffDZIrATkoHFI3Su9oH2CEl3nQOoKDiI/s2E3cyDX0HfM+d2toD5sPyCOAYGNxe72eDk0nai741RTBM8O2CKnxuaL/lzQR24DPkhBFLgT7ZmSH9JUPxkKfB1DN70f2drYT9EmHhh6ENDWxWUJmSJICTgfIa/TGiAmIqhCKXAVKi/JxQPg2BmZCAjEFqRBcXnak6BPf7c9tdUsD2Nv61Wa98saUXaZdlOxMATC+jP8FOj88bGpGlWX+MmaP7DSu45LyDMpfN2nv4eFUvOHpG5Q==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgttHxV270j1bUWTRTK1SdurWvhFi+xxXe/sK4F0kjM=;
 b=VseSZarJujJCPqrq6JC5mY2Oe410zbXayLoYoo5wF2bsbBaXYTRjlKoAYl4tDqxNprLP0Jo0qN3tJSrPQzZ764WhP3J7HWkS5/EW6L2LLLKMrac8/++QSjsCwCk2Uh1jLYB9elJbmQ5C4IX6oYwlNnZAcBbCYeEuNEOJEGu6UUw=
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by GVXPR04MB11544.eurprd04.prod.outlook.com (2603:10a6:150:2c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 14:22:08 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::1e) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Wed,
 10 Dec 2025 14:22:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 14:22:07 +0000
Received: from emails-724928-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-47.eu-west-1.compute.internal [10.20.6.47])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id A328A80476;
	Wed, 10 Dec 2025 14:22:07 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765376527; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=EgttHxV270j1bUWTRTK1SdurWvhFi+xxXe/sK4F0kjM=;
 b=AMJpftYbchc5n3cl5E5HdfYKWTXpJldUZVYodfNUWq6T+2YsG5ygY4ypPLcad4+myIthC
 S93qQzhLLwhg2S4j4Ya3Ekm4hBBSOxyofuegTmJweWmxlzjBB4dqi+2iEObHVChxYkAxaUG
 FGVO2f2LFTBBRw9trXKVN2jj5RwL3Yk=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765376527;
 b=RPv76bSIbi4hpPukBk90CY2nkPQ3OsF6e8/hdjlLUaYjqx5BFZbqok+DACCn+/SbNOb6L
 1RRALiKYIZ1huxvJO4SNqBqyfHcIZxt3aPGFL2r4Wf/YstPr3UsbrNNJfy1bsFj4ha97SoV
 xYiY/k4V+FIJzPWAelZ5O1I1uemwL9I=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNJE6xq11P3TjmBCcOmoCdG31XqF7A4XvsCNCxjRwC3uqj7OjCkne8Rgm2GpyQAANKyHQpMXvYksDlUSG9EUcSJU4CpHdKlpZU2zHgQQRUep4wRsURaK6e1HXeIxw+NJWr2zzUQwX8LQ33nhLKlVuh18Sf6S68yat07L+glu4cR+fqYHDrabIWQPwC1shz6lkjLT67KSnbwEmCLn/L5Ka9SxLZpPSnvKGTAOa7ODcyClPsX15kNRpYu0nOo3devhTDAioedPEpiWmxWk3REz9VnMiKDdrtnaD2vZGA2hDAwptHJXbj4k2V17sytnb+4w0FUGntosY4SmwU1RavuRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgttHxV270j1bUWTRTK1SdurWvhFi+xxXe/sK4F0kjM=;
 b=d3FW+47OxpdHR38tmwib0x6PrfVspHkp8ZUUUhg8JOkEZpE5EGPxvQjcWJYvBsUDCCDGV/XqopyPYIGAVQSN9CnkUKWYnOEIn1YsFSG2aXLKV9kv1NRbzllHjr4FfbdIPnps3rG0tKeEKUgwhJKkUpkllRidR+gVmFcxxY28UqUqBMseom/9sK71Ue/xy6Rkm5DsogN/wFDAnKq9xhsSVoZ+/qKPWQ1jCooFuSHJvHIqck7xnrDTEMJsOOE85Lu4954HPJnPcKzpvcNZDtqAbJ+DoDC9ry75fQ7UQivOnjxFKZhQf5Oc+5G1Bk4zY3a41a1+wu2CAlNVaEJboK7dqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgttHxV270j1bUWTRTK1SdurWvhFi+xxXe/sK4F0kjM=;
 b=VseSZarJujJCPqrq6JC5mY2Oe410zbXayLoYoo5wF2bsbBaXYTRjlKoAYl4tDqxNprLP0Jo0qN3tJSrPQzZ764WhP3J7HWkS5/EW6L2LLLKMrac8/++QSjsCwCk2Uh1jLYB9elJbmQ5C4IX6oYwlNnZAcBbCYeEuNEOJEGu6UUw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AS8PR04MB8883.eurprd04.prod.outlook.com (2603:10a6:20b:42e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 14:21:56 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 14:21:56 +0000
From: Josua Mayer <josua@solid-run.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 7/8] arm64: dts: add description for solidrun
 solidsense-n8 board
Thread-Topic: [PATCH v4 7/8] arm64: dts: add description for solidrun
 solidsense-n8 board
Thread-Index: AQHcYsN34BMHkIYXIE+OxPRVBNrNurUMzP4AgA4uJoA=
Date: Wed, 10 Dec 2025 14:21:56 +0000
Message-ID: <eb258010-3778-4852-833d-a51a6b3ca36c@solid-run.com>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
 <20251201-imx8mp-hb-iiot-v4-7-53a4cd6c21bf@solid-run.com>
 <c06e5a6b-6150-4771-8ff6-b2cda0863a21@lunn.ch>
In-Reply-To: <c06e5a6b-6150-4771-8ff6-b2cda0863a21@lunn.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|AS8PR04MB8883:EE_|DU2PEPF00028CFE:EE_|GVXPR04MB11544:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf9206d-f69c-42c5-3f56-08de37f78009
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?L1lpeE55VjRxNXlCekR2MGlpVWoxTmtTRkozcGU0eDBrQ0pYd1JUdWIxTkxk?=
 =?utf-8?B?T0E0MStWd3U0U2VtZVBMdGZCcEF3aU8yQjF3bmJnRU5MWm13M1VJdXVSWld4?=
 =?utf-8?B?UzNKc2w5Vk52VVp2OW1WOWVtVjNqRkJaVjJMeEdUcG0zTFhPc0c1dFZNMXdT?=
 =?utf-8?B?UGg4T3V2dFp6QXFqSVZ1MzY4dTZvVFMwcGptdVgrc0Q1MDZEeWhTeVN1eHRy?=
 =?utf-8?B?bnNwOHVpeTF3Y0UyaEF3cDhpMVd5V3A5aHJEZW4zM3ZwbDBoYllPbUhpdGJu?=
 =?utf-8?B?dVcxZytRdS84cHFVQmd4eDR5aVRENzhLRXdXdFNLdnpCUWNJblRvT3NlNkhx?=
 =?utf-8?B?Q3oyd3NoQityMk52QjI3b0Q4VUlic3R3MkthcnFXc281VEs2eXN0K3FBUWg5?=
 =?utf-8?B?VU1MQkoxZ1B2anpXRUQ1dUJOODFaY3VlNXRvRnFPL3ViTjdNalpmc2MrUlhH?=
 =?utf-8?B?VExoY09hNGJIcURIT1dOSU1Wai9ma3MvZGxsSmZyTU1wWERTTEZ5YllkWEFv?=
 =?utf-8?B?LzFjUnpBbU8rTWFFL1R3d3NLRzBiVytIazdOdERrTG5aeTRVZStpZVhha0FE?=
 =?utf-8?B?TG9XRW5lb2hmTDRnaFlZUWlGZVc4RjNIMlFCWEM1VS9yNWR4cmhVZ295WFlu?=
 =?utf-8?B?aDVrb1lDZWRva0FWdzRiWXBYWStFNVFBMzJicGhCcjh5OE1YMlRKdGpLL0h6?=
 =?utf-8?B?b1RSRFgwN0xJZjFEejhlOGF1eGh1Y2hTbzVFM2k5Ykc2OWNIUlFMRzVYU3pD?=
 =?utf-8?B?Y3F6VGdabE5tNzVuMkhKL1EwdVhQQVpZUGRubng0ZlBManNNMUdhbGtZRkVB?=
 =?utf-8?B?alFVYWRRNXQ2S1ZMM09teWE5OEkrUUorczJJYk9KR3NtdDUvRDlocmo5MkVL?=
 =?utf-8?B?cm4wVXZHWWtIdVRKamQyd1VGZVB0dXFGT1NvK3NJdHZHdU1sZEd5NkphQkF4?=
 =?utf-8?B?dUwzS042T29LUWlEbVlGQ3FSWndBa01JK3l4QnBScWNBWUxGUHBvTjJMYWND?=
 =?utf-8?B?bjJLYXF2UnVubnlpM0t1QlhBS1A5dzVXUWZqaDdOT2R1UG1PRldSbGNxMWxa?=
 =?utf-8?B?dFNuSmM2VW04RmJJQkJqWjk0UzJKVytUQjVwQmJzaEdoZHk5aEN5R3ZvcWNP?=
 =?utf-8?B?cXRjRlFES0FIYkZVV3lNenROVE1XU0JYbG44SzhUbGllNmZwa0FQUU1nbzRn?=
 =?utf-8?B?REtmMC9qSWc2K0xvMFhRMUxMa2VVSEk3dCs3dHljb3NGcTJnZkdOSVZjbnlQ?=
 =?utf-8?B?YlZyUW9qZmtPbjlGR2x3WExkc0hmS1FQSUZmQms3aERzV05ib2ZuOW45Ymwy?=
 =?utf-8?B?V1RhWnpXemV2cXcwMERmNWx1Mi9jWEJXcU5xRXROdzNBTVJaREE3Nk95TUxx?=
 =?utf-8?B?NTdyeHFiSHVmWGVmT0lTajdDUUdpbkJVZjVFR3gxVG1EV0crRkdndzZTWmps?=
 =?utf-8?B?bUR6K1VWbGZNZU9ObW0rV0N4Vy8wY2c0UkpLeE9nME1mV3NXM2R2NEJuMHVY?=
 =?utf-8?B?cmk2aGFLdjcxS3NHb3Z4SWd6eDM4Sm9OSk1YNFpZbFkzdDJiSjRJcU9KTnlQ?=
 =?utf-8?B?cm1za3lJUmU3KzhNcS9laTZxRjFIWFFSK2QrL0RiaFdnN3hjM2g5RWZBRGpm?=
 =?utf-8?B?eXpMWXhFTXRPNWUydzEyTFVyNWdJTi9Rb21vcCtBMjJzbmlna2owUmRVTWRB?=
 =?utf-8?B?bnlFVmVteVFETSs2Z2JUeHNLM2ZKakFjVlQ2UG9qTXpadWc3dkU4OUw3cTEx?=
 =?utf-8?B?RGhvcmJ3MDJaNEJNZjFnTnpQSHdQMlc1cGNFT0V2MEh6aFRCQW53K2xGSGll?=
 =?utf-8?B?TEhFWVlRajg1ZWxvWUZoUkJNSENqSGFDd3hOellZeDFJWmphWVpqd2xOYVhR?=
 =?utf-8?B?aUp3SG14aGRpVWVPNVA5UmxWOFd5aTEyeXdIUnNzTXZSWEdiWkZWS2xxK1l1?=
 =?utf-8?B?VytaTkhlTjVpMkhaYVRPMmtYZEFDR0JaUndkMElQY0VjMlAwRXFxMENtUSs2?=
 =?utf-8?B?dGpTcmd3LzgxZ2JTZjg5MlRyME9sY2dEeUpkem1DWWNLZHBxMlhleEI4ZHF5?=
 =?utf-8?Q?ExOMto?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A468E7B512436B489ACCBD0D0A8CB483@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8883
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2bb68971d05649e08e0ffcd6ab0b6fb1:solidrun,office365_emails,sent,inline:991cf95667f5b51cb511ae74a6b72571
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8fa0060-d703-4f3c-4888-08de37f77954
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkhBdFg0VkkzTjhKdGhuQTdwVldURFo4cFdBYUV3ZC9IVTJTWmJCYmtoV3Nz?=
 =?utf-8?B?bWRRbkM3R3N4eEN4UzlYNVhrZ2ZNc2JqYk1MQVlLZHJUZnBVQkl6WlUrcU9I?=
 =?utf-8?B?OEExdUk5Vlh2SkcvMXljT2tnQkFVZFpFZ2pnczl5c0JpSlhQWURSZE5DQUEx?=
 =?utf-8?B?bUVWNEZwaWdidmRZaG00V2NpWVlOdXFUMk1yTXZPU1kwT1JzQTZFVE5zZ0Rq?=
 =?utf-8?B?WDVndkUrWFVMQzQrbFlPNzNKVW1vOXZHdldnTjdSU0xlSEJXVlk0T1FnNms4?=
 =?utf-8?B?VDZDd3pOR0pxU3VUQ3UvSytId2pCdktweHM5MHJCNC92dlZlT0VSOTNhVkIz?=
 =?utf-8?B?cTRnZUFKVlZKSlo2U2MzM3BNRHVTZkROdGcwdXMwME54ZWIxNGxPSk83dTBk?=
 =?utf-8?B?S3YxVTZ3bld1UW5kK05PWlRxZmM2dENQV0hiREdhU2c3RnJZTklwVHd2ckpO?=
 =?utf-8?B?a1ZMOXFPOEpIZmF1ck44eXZWQ1BuN3V2WWdpaXNja21tL2cwMXE5ZVBuRkJJ?=
 =?utf-8?B?Zm9Cd1IxR3hmUy9hM2d3SmZ1N1A4VWEyMFFZV0FZSGY0UGtkYmRGMTZPc0Rp?=
 =?utf-8?B?d1ovSGx3RjQvbVB4Vy9GT051RFBVUlFkdXhOMk50QXlXSTBhREpDRVl0L0kr?=
 =?utf-8?B?R3llcFFJTE1WT0lNMzlSdm4vRS9KQStrQlR6bVRENWdzQjhKQWdzL041cFY5?=
 =?utf-8?B?OURBRUpwWThNTGc0SVlqZ040SUthL3BML3M4TlJtT1o1ang4SEIvOWk0NTFz?=
 =?utf-8?B?VVhwbFh5UWdHYnFWbEF0cUZmZ2Q4dE83TDRMblVlSmgxM1NwelZSaEkzUU5P?=
 =?utf-8?B?SlRxVjdBblVkMkJVcUZvVldiL0lCclNpV2R3Q2FjQ3pJMEhodDM5cERZditv?=
 =?utf-8?B?WWhNTFUrNU4rb2ZnYXFGVWNjWjJBRjlYSmdCQkFuak1Hb0NYY01ERjdWV3p6?=
 =?utf-8?B?clJ4V1ZNamRyZlBmLzVxT044ZjNwV2FxdC9iOTl3K0cxTDFmWWFRM2FCeWZo?=
 =?utf-8?B?ZXpPcVg1LzROTVhUUTd0YzE4eXNXT3FDTFprVm5PeXl0L0NHWi9BVDBVaExV?=
 =?utf-8?B?d3V2dWpFL0RBdWNDN0E2UVpNSWFKTklHNGNIQTlzNWRuckVyaktsOTArK2pF?=
 =?utf-8?B?amR0bmZRWDRLckxTdnliT0lYRTg1ZXQxMWdTd2RPSldNVlVtSFY2cW1yeTdo?=
 =?utf-8?B?eGoycmxJbHJEL3NFeUdSNlFwZlI0TmtETHcwdE1CMFdXTDEzdlNHSmxpYjFL?=
 =?utf-8?B?ZGRxNEJVV0RzV1cra1BzNEpZbGhWMlRDbWpzNTFwUDhtTnMzWGJUWExOdXlD?=
 =?utf-8?B?ZkpSSGdNQk44MzE2UVp0WVcwRmVlUW5HNU5WN2pjK0lMRVJBeDNYay92aHF5?=
 =?utf-8?B?eE1QdXFpNkFUSFY0TS9pdDZNRHpIRkI1NitPcHdnUVBoL0wrS0FLakZiYjQ4?=
 =?utf-8?B?SEcrc1pXV0l2ZWJJMGlIb0Z2Z1VzWTczUFlqSmg1OUN1WVcyZE1GOTZVOWNN?=
 =?utf-8?B?a3k4STl4RERsU0s2QUF0YjZlRW5BUEJtVStFZGxPVHdmSGlGOHpERWVOcjFI?=
 =?utf-8?B?NUpsTnAzeXV1UVpLN0xZZEJSR0hEOXlqTFBVTkxvN2J6eTNNY01oeEdNRUVj?=
 =?utf-8?B?enZhTGp5TTF1ampwMG5qam9PZmovSmw1Ri82ak5wKzdFOEhuVHpmVmxreWp0?=
 =?utf-8?B?alNmY2Y4d2VrVERtWHFBSUZzaGZrR3Qybk53bC92aUQwVEJXV2x1Y1BFYVpt?=
 =?utf-8?B?dGNTYVMvb1QyM3I2OW1VV1BTNlczY01QdFYrbTZqWHFKem1GV00zYXV5VXVS?=
 =?utf-8?B?aHhxWE5hVUxDZkRpVUpSTFpFbytuS2k4YWtpWUJmbHVtY1dCTndnbk50S0dC?=
 =?utf-8?B?M3E1N1cyM2FQckhNR0NUOS9mQnlGYjZuY2J0VUo0YzllYjJZT0tzTnBoRDhQ?=
 =?utf-8?B?T2J1OGZRZ0JxVUZKZGNBTzgwUmJPWURuSXZLWTFVSXl4NGIrMWVyR2ZmOEl5?=
 =?utf-8?B?VjdKZ1BLbnQ1a2cveTdsbHErSGQvYm9PbmcyVkJSWGtoeE5EUURaMkRFbkcz?=
 =?utf-8?B?QlBSY3orZUNuWkZGOWxRUjRTMmdqOFFWcHp1c2tGa0NlWCtJV0ZHc1Y1bWNk?=
 =?utf-8?Q?X/YA=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026)(35042699022)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 14:22:07.7285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf9206d-f69c-42c5-3f56-08de37f78009
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11544

SGkgQW5kcmV3LA0KDQpBbSAwMS4xMi4yNSB1bSAxNDo0OSBzY2hyaWViIEFuZHJldyBMdW5uOg0K
Pj4gKyZmZWMxIHsNCj4+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4+ICsJcGluY3Ry
bC0wID0gPCZmZWMxX3BpbnM+Ow0KPj4gKwlwaHktbW9kZSA9ICJyZ21paS1pZCI7DQo+PiArCXBo
eS1oYW5kbGUgPSA8JnBoeTQ+Ow0KPj4gKwlsb2NhbC1tYWMtYWRkcmVzcyA9IFswMCAwMCAwMCAw
MCAwMCAwMF07DQo+PiArCWZzbCxtYWdpYy1wYWNrZXQ7DQo+IEhhcyBXb0wgYmVlbiB0ZXN0ZWQs
IG9yIGlzIHRoaXMgY29weS9wYXN0ZSBmcm9tIHRoZSBiaW5kaW5nDQo+IGRvY3VtZW50YXRpb24/
DQoNClRoaXMgaXMgY29weS1wYXN0ZSBieSBwcmV2aW91cyBkZXZlbG9wZXJzIHdoaWNoIEkgZGlk
IG5vdCB2YWxpZGF0ZS4NCg0KU28gSSBtYXkgd2lzaCB0byBkcm9wIGJvdGggbG9jYWwtbWFjLWFk
ZHJlc3MgcHJvcGVydHkNCihzaG91bGQgYmUgYXV0b21hdGljIGJ5IHUtYm9vdCksDQoNCmFuZCBk
cm9wIHRoZSBtYWdpYy1wYWNrZXQgaGVyZS4NCg0KPg0KPj4gKwlzdGF0dXMgPSAib2theSI7DQo+
PiArDQo+PiArCW1kaW8gew0KPj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiArCQkjc2l6
ZS1jZWxscyA9IDwwPjsNCj4+ICsNCj4+ICsJCS8qDQo+PiArCQkgKiBEZXBlbmRpbmcgb24gYm9h
cmQgcmV2aXNpb24gdHdvIGRpZmZlcmVudCBwaHlzIGFyZSB1c2VkOg0KPj4gKwkJICogLSB2MS4x
OiBhdGhlcm9zIHBoeSBhdCBhZGRyZXNzIDQNCj4+ICsJCSAqIC0gdjEuMis6IGFuYWxvZyBkZXZp
Y2VzIHBoeSBhdCBhZGRyZXNzIDANCj4+ICsJCSAqIENvbmZpZ3VyZSBmaXJzdCB2ZXJzaW9uIGJ5
IGRlZmF1bHQuDQo+PiArCQkgKiBPbiB2MS4yIGFuZCBsYXRlciwgVS1Cb290IHdpbGwgZW5hYmxl
IHRoZSBjb3JyZWN0IHBoeQ0KPj4gKwkJICogYmFzZWQgb24gcnVudGltZSBkZXRlY3Rpb24gYW5k
IHBhdGNoIGR0YiBhY2NvcmRpbmdseS4NCj4+ICsJCSAqLw0KPj4gKw0KPj4gKwkJLyogQURJTjEz
MDAgKi8NCj4+ICsJCXBoeTA6IGV0aGVybmV0LXBoeUAwIHsNCj4+ICsJCQlyZWcgPSA8MD47DQo+
PiArCQkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW8zIDE5IEdQSU9fQUNUSVZFX0xPVz47DQo+PiArCQkJ
cmVzZXQtYXNzZXJ0LXVzID0gPDEwPjsNCj4+ICsJCQlyZXNldC1kZWFzc2VydC11cyA9IDw1MDAw
PjsNCj4+ICsJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvMT47DQo+PiArCQkJaW50ZXJydXB0
cyA9IDwxMCBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiBUaGUgYW5hbG9nIGRldmljZXMgUEhZIGhh
cyBpbnRlcnJ1cHRzLCBzbyBjYW4gaXQgaW1wbGVtZW50IFdvTD8gSGFzDQo+IHRoaXMgYmVlbiB0
ZXN0ZWQ/DQpJbnRlcnJ1cHRzIHdlcmUgdGVzdGVkLCBXb0wgd2FzIG5vdC4NCj4NCj4+ICsJCS8q
IEFSODAzNSAqLw0KPj4gKwkJcGh5NDogZXRoZXJuZXQtcGh5QDQgew0KPj4gKwkJCXJlZyA9IDw0
PjsNCj4+ICsJCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzMgMTkgR1BJT19BQ1RJVkVfTE9XPjsNCj4+
ICsJCQlyZXNldC1hc3NlcnQtdXMgPSA8MTAwMDA+Ow0KPj4gKwkJCXN0YXR1cyA9ICJva2F5IjsN
Cj4gVGhlIEF0aGVyb3MgUEhZIGRvZXMgbm90IGludGVycnVwdHMsIHNvIGkgYXNzdW1lIGl0IGNh
bm5vdCBzdXBwb3J0DQo+IFdvTD8gWW91IG9ubHkgaGF2ZSBNQUMgV29MPw0KV2UgaGF2ZSBuZXZl
ciB0ZXN0ZWQgYW55IG9mZiBzdGF0ZXMgd2hlcmUgdGhlIHBoeSB3YXMgc3RpbGwgb24uDQpJbnN0
ZWFkIHRoZSBib2FyZCBpcyBkZXNpZ25lZCB0byBiZSBhbHdheXMtaW4gd2l0aCBzdXBlcmNhcCB0
byBjb3Zlcg0KZ2xpdGNoZXMgYW5kL29yIGVuc3VyZSBncmFjZWZ1bCBzaHV0ZG93bi4NCg0KU28g
SSBzdWdnZXN0IGRyb3BwaW5nIGFueSB0cmFjZXMgb2YgV29MLg0KDQpyZWdhcmRzDQpKb3N1YSBN
YXllcg0K


