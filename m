Return-Path: <linux-input+bounces-15993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4633C4C2F6
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 08:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B23594F2753
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 07:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96B8284884;
	Tue, 11 Nov 2025 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatroncorp.com header.i=@pegatroncorp.com header.b="fvo+5QiQ"
X-Original-To: linux-input@vger.kernel.org
Received: from ms.pegatroncorp.com (ms5.pegatroncorp.com [43.251.60.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45D248893;
	Tue, 11 Nov 2025 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=43.251.60.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847500; cv=fail; b=gCWRcBzu9lYk+/wmyRy7oz0IhffWU7gUZiw4/B/SDU+4HS4GsTuV3KY548sUJbVtgrQad6rWneF1xdJ1p0N1NMbKpxrbzpt/tnbJEREsY64RquTUfBZgVlRtkAQ+4cPfu2r5QkGFIJJSowLQfuQSkUB+/YdFF4YMMKApcQu8zx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847500; c=relaxed/simple;
	bh=uzDsr/6Nf+Zp90iwa+Bs/k1d2CkuqEnW1EQGVilfGCM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p+mugQfpdzYH/T2DI7/73uY4ylrXcw19DdHzFpRRdllLb8OUEUe8Gf6Z5tczpOLcGyWaWNLIxoBNEvMKudNGQjAp6tKGVCmi5knJkaDzNswPLlZ68200qqIE7JFUDF9D/gYBING3kOMfobOF2w6pK6LcdHm7XKYptAJAe02hs90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pegatroncorp.com; spf=pass smtp.mailfrom=pegatroncorp.com; dkim=pass (2048-bit key) header.d=pegatroncorp.com header.i=@pegatroncorp.com header.b=fvo+5QiQ; arc=fail smtp.client-ip=43.251.60.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pegatroncorp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatroncorp.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=pegatroncorp.com; i=@pegatroncorp.com; q=dns/txt;
  s=pegatroncorp; t=1762847498; x=1794383498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=uzDsr/6Nf+Zp90iwa+Bs/k1d2CkuqEnW1EQGVilfGCM=;
  b=fvo+5QiQ467h31iJeUvebRPUKFbXsaxZ3y2YrI5e1qJv4vAjNS6xgfiY
   EfV8elCK/xtkQqR6hYXusriGPABob+DxLaXT8Ecq+jOiEPiyjWl9NjTEp
   vAwqEKwNZTnQaISBmEzqwF/NgzTP76E9lt6oj8hTT7u1jWIGmRUXskfsB
   P9TXMexRw+rPDO3M2//djWE19lIQ01GpmD6xiEdA41ZLwqascD3FsEXTX
   4DzcPdU+82NDmkjL9HesFRL8VD8nv90iyrI+VDPqb1D8rKvob4jvFQXw/
   GumSUkHsGbx5rA80X10V001nnXn4Cbs67qnlqk5PePQe+eXhYcbHLx+gj
   A==;
Authentication-Results: ms.pegatroncorp.com; spf=SoftFail smtp.mailfrom=Daniel_Peng@pegatroncorp.com; spf=None smtp.helo=postmaster@PTW-MSE-AP03.pegatroncorp.com
Received-SPF: SoftFail (ms.pegatroncorp.com: domain of
  Daniel_Peng@pegatroncorp.com is inclined to not designate
  172.18.226.177 as permitted sender) identity=mailfrom;
  client-ip=172.18.226.177; receiver=ms.pegatroncorp.com;
  envelope-from="Daniel_Peng@pegatroncorp.com";
  x-sender="Daniel_Peng@pegatroncorp.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:218.104.34.192/28 ip4:60.250.88.199
  ip4:60.250.88.200 ip4:60.250.88.201 ip4:60.250.88.202
  ip4:60.250.88.203 ip4:60.250.88.204 ip4:203.69.6.13
  ip4:203.69.6.14 ip4:203.69.6.15 ip4:203.69.6.16
  ip4:203.69.6.17 ip4:203.69.6.18 ip4:58.211.157.0/29
  ip4:58.240.231.120/30 ip4:124.9.5.0/26 ip4:43.251.60.0/22
  ip4:192.72.126.0/24 ip4:58.211.157.0/30 ip4:221.224.25.136/30
  ip4:210.80.80.195 include:spf.protection.outlook.com ~all"
Received-SPF: None (ms.pegatroncorp.com: no sender authenticity
  information available from domain of
  postmaster@PTW-MSE-AP03.pegatroncorp.com) identity=helo;
  client-ip=172.18.226.177; receiver=ms.pegatroncorp.com;
  envelope-from="Daniel_Peng@pegatroncorp.com";
  x-sender="postmaster@PTW-MSE-AP03.pegatroncorp.com";
  x-conformance=spf_only
Received: from unknown (HELO PTW-MSE-AP03.pegatroncorp.com) ([172.18.226.177])
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 15:50:26 +0800
Received: from PTW-EX-DMBSC08.PEGA.CORP.PEGATRON (PTW-EX-DMBSC08.PEGA.CORP.PEGATRON [172.18.147.33])
	by PTW-MSE-AP03.pegatroncorp.com with ESMTPS id 5AB7oKXQ012041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Tue, 11 Nov 2025 15:50:20 +0800 (+08)
	(envelope-from Daniel_Peng@pegatroncorp.com)
Received: from PTW-EX-DMBSC09.PEGA.CORP.PEGATRON (172.18.147.34) by
 PTW-EX-DMBSC08.PEGA.CORP.PEGATRON (172.18.147.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 11 Nov 2025 15:50:20 +0800
Received: from PTW-EX-DMBSC11.PEGA.CORP.PEGATRON (172.18.147.35) by
 PTW-EX-DMBSC09.PEGA.CORP.PEGATRON (172.18.147.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 11 Nov 2025 15:50:20 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (40.93.129.122) by
 PTW-EX-DMBSC11.PEGA.CORP.PEGATRON (172.18.147.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 11 Nov 2025 15:50:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuckoL21adR1zcwb1OnBxnBbIOvV0EzV0bclmzQjhiPvSObmbkodWPzkICP4wv4q0puqCo34YBGJv6FBWnVYPvponeV1o0Qw/FHQVnx/qbS0tpOgT3bMdSLirOaVszv8wI85vhZOl/JfggqawHkS7L/TTFZGk2Uzx+I5Z7jhPprivav6cgsl7MmxS3HaoiVXSR07NAiNmF3r84z4drXWftHU9hmJfyYVDPt6g4Gget+BJad1UauMkncVVWeMGC/LvLBqvGY8YUygImRZuDwEfSp61w/sAystUKupLXUwF+J1U7ICl/5CjDBMkQVSkYnLPfTKnwa5fRe3r+MvfQMURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgZdLI5Yd7YR5y+WY/noKGbYwf8FEZWYWXKC7yqZQxU=;
 b=f1RBZs3HjyyeKM6sGuXe5t5Kkw4oCMcbMo2oeM6ChOn5W3xxO3Z/NUDH0rZzL//t1lcf8U9ScsOBwXELYtRKLlBA1IOHEltcdC1UR9ZpwV3Zf/z4le0nsqac4Imep6Ii8NWgfnh6lLuhecAkQVcot8jNAjZS7IQEN4hNK9Ewy3mE15nyVS08h3IPV7xjLyDh7ANhlBsCCHnAo9GXpx871Ut8yMVFvAGjcuaWThuspF63+155IEobd9ROsC4LCafAmRtxH3gAWoRbnBfUAv8jEfChMkzG2Wvo+rjjL6p360PTmhtKqwyUgTgXzXESx07hT7lLVc25GgTWvRN+NtgadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pegatroncorp.com; dmarc=pass action=none
 header.from=pegatroncorp.com; dkim=pass header.d=pegatroncorp.com; arc=none
Received: from SEZPR06MB6742.apcprd06.prod.outlook.com (2603:1096:101:183::9)
 by TY0PR06MB6801.apcprd06.prod.outlook.com (2603:1096:405:12::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:50:15 +0000
Received: from SEZPR06MB6742.apcprd06.prod.outlook.com
 ([fe80::7915:c9db:be14:6bc8]) by SEZPR06MB6742.apcprd06.prod.outlook.com
 ([fe80::7915:c9db:be14:6bc8%7]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 07:50:15 +0000
From: =?utf-8?B?RGFuaWVsIFBlbmco5b2t5Y2a54WcX1BlZ2F0cm9uKQ==?=
	<Daniel_Peng@pegatroncorp.com>
To: "treapking@chromium.org" <treapking@chromium.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        =?utf-8?B?QXNoZXIgSHVhbmco6buD6YCy5Y2XX1BlZ2F0cm9uKQ==?=
	<Asher_Huang@pegatroncorp.com>,
        "daniel_peng@pegatron.corp-partner.google.com"
	<daniel_peng@pegatron.corp-partner.google.com>
Subject: RE: [PATCH 1/2] dt-bindings: HID: i2c-hid: elan: Introduce FocalTech
 FT8112
Thread-Topic: [PATCH 1/2] dt-bindings: HID: i2c-hid: elan: Introduce FocalTech
 FT8112
Thread-Index: AQHcUttn8N3KJjLitkag/BW4IMO4TrTtFeig
Date: Tue, 11 Nov 2025 07:50:15 +0000
Message-ID: <SEZPR06MB67427DD182968980F4C93C08E7CFA@SEZPR06MB6742.apcprd06.prod.outlook.com>
References: <20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
 <CAEXTbpc9=Gt7QrFrtV60+EvKdmBGsVpJxg7yYaa6HfuGGB3OqQ@mail.gmail.com>
In-Reply-To: <CAEXTbpc9=Gt7QrFrtV60+EvKdmBGsVpJxg7yYaa6HfuGGB3OqQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6742:EE_|TY0PR06MB6801:EE_
x-ms-office365-filtering-correlation-id: b8a99da5-7633-4103-1307-08de20f6f3b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|4053099003;
x-microsoft-antispam-message-info: =?utf-8?B?a2VrQkh0Tzd6WU5vcG5kN3J6Q2VJQzZkZUQ3Z2VjVkg4cW9UeHkycThReUVZ?=
 =?utf-8?B?a2k1UGR4SEpXQkM1SWswTldvZUtHcGQ5VmxwTzg0anpWbFc0MWRBU0V1bnh2?=
 =?utf-8?B?MDVZbitab2dCaGpiLzdxMkE5RTJFOWVZS0RXZVJQU2ZZbEs5T1RmWDBoQXZp?=
 =?utf-8?B?M05aQUxTOWRnVm1FY0orcWt6THRCd1NOYjcrNXVJWEFsZUFucFpiOVBHOHBv?=
 =?utf-8?B?ZnNzYkZiU0EvU05oUUswaEVzR203QTIxL0pyMm1kSktMUG80VGZxMXB6cW9v?=
 =?utf-8?B?cTJ0cGc5SjlZeUJJVjI2R0p5bFlBcGRKaklUM1hhOXFrVkFVMGFaTm5CK3V1?=
 =?utf-8?B?MFc1bWE1bUw2cjJnVEQ0bUp0S0lmdGZZVy9kaTYyb0RGVUp0eFpDRWtleGJW?=
 =?utf-8?B?S0xjeDc2R2dlUUFaSDNKMzBVejJuODRrZW0wMXFlWEUyL25ZRzUrdFZQTE5J?=
 =?utf-8?B?RkRRM3EwdGtFMWJ2Zk42MWRUT2hTamhTN0xiQnJTQlI0cVpzTDBvdXg3QVdK?=
 =?utf-8?B?dTFkcTIySG5xbnpueUJvclc0Y1oxRUJzVGQ1cFJnRUdkMXZjaWNXdUhMd1lY?=
 =?utf-8?B?R2QycGwrbG55dmJYaWtwSVlzc0U4dVYzOGVOeENtdWxrRmh0WmxtYzJEY3dz?=
 =?utf-8?B?cTRpK29Bak8rVDlsZ1FwT1lueFY0OHlSSXFDdThNb01VK3ZOTkNxeVhCTzVq?=
 =?utf-8?B?cW5rQ0RLVUxHM25LMU9SOURzRituRGs3R0IyTThQVnQyY21Gb0lTVS9mUThN?=
 =?utf-8?B?NTF0VTZZQmdoRFNaREtxVjUzODMvaGkyOHRWQzVIdnVZcUJTY3NFK0hBZFRN?=
 =?utf-8?B?cEw5MWhqMldUS0Zrb0xpaUlYcEFURmN1TXBUTlpYYkxTb2xJeVpFQ2Z4OUdk?=
 =?utf-8?B?bEFvc0hObExqcldvd3RpbXZKMkVKWkpueXJBVno5Zkd5Rmx6djNOOUxpZ3Nk?=
 =?utf-8?B?MjZPNDdVcUtBQXgzU0t3MVd2WndMSmFWb2hzQXQ3Y1RXNWZRSm5iNERKaDVm?=
 =?utf-8?B?WVdTVGFQNGlPWk1LNnpxdURIVXpYWWkzUFlYVXYrS2N6QmJjVEFwZityRVcz?=
 =?utf-8?B?QXlxd0cyVTQ0dHpxQVVhRTc4NnZPNEZoWm5KVVB1RmF2TFJQVVd6aWdYYk9P?=
 =?utf-8?B?UGVPVVhEZHg4Y1FmMjYwV3pHdDIyTEUzUXlTb2RjUXFvazJZc1Z2L280aEU1?=
 =?utf-8?B?bUVhY2VXSTlWQWk3dlhUL09mOXVLUUR5b1pUWTdMWkVSWnBsdEQ0ZzlvS2J0?=
 =?utf-8?B?S2VXYXlyYjdoTVFrUXdheUZYQzlHc1VHRWFNNWF0eTBoRlBVNFM1Y0RacDRT?=
 =?utf-8?B?YnRiaEFxSm14VnA3S1RDTUh1V0tXWGRPQ1ExdXZRdm5sYm5SdzNnS1pyTnVV?=
 =?utf-8?B?NUtZaVBENEg1OTIxQkltOTY5eHJ5MmhMQUJ3Q09Uc0NJYWxjRC8yMGhuRVRF?=
 =?utf-8?B?ckdURDlwYWxlbXJNT3Q1UEdLK0tpMjhXR0U0aWZWTzNLcytTdzNQZXExYms2?=
 =?utf-8?B?WVYvN0Q5VVVKczZEYTBBaVNpc3Q5RjZHemJmU3hKV3lmWXVCZFpyc2p0aFFR?=
 =?utf-8?B?MUZCODN3d21tdkJsdFY1VE42RmdlL3JFbkxIVFZMVzgxYitRVHdYZlZ3dmx3?=
 =?utf-8?B?YXBkbExmOFBCbU9kSFduU1prMGRWRTl0ejZjak5xR0IzZVpMYVZFbGd3cDN4?=
 =?utf-8?B?NXliN3pzWkRtN1BITXp3YVh3TWtHNi9HdGc0RWVadDFRNUNZZzhIMFR5KzBW?=
 =?utf-8?B?dmpEUGJsL1FlV2twUWJGdWpNQWp5Slh1SGNvSU9JdEMvZmczeEhYSVlGS0c0?=
 =?utf-8?B?MGVIMEdNZ0oyc2NNTTdNckh5T0VFdFpOUDRzaHNTcXVXK2Nmb0R3OGhhSUFN?=
 =?utf-8?B?OTQwK253UXE0NzJXRk5NYWQwTnBaRHdURisyUFB3OVZvSUlrRWFuYkNYbHNu?=
 =?utf-8?B?Z2U1UDVnQXMrajl4OUxCemVNN1UzMktjVFpma3NCYjFjd1pZbk5YdlBFbVor?=
 =?utf-8?B?YXMvWW1hMFNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6742.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0xNNWJDZGhvQ1Fkdk02d2EvdDZvUU1oZW5yanVuUG5RQ1FGWjZQRWxYbHF6?=
 =?utf-8?B?ZUU4Q01MTHMyempZdW96SG1CRzVvU0pEenJyU1g4emUrZktRWmJSUXAweisr?=
 =?utf-8?B?RVhkMHZXZkR4Zktid0pGaUhpR3RURXNpaWVPMS9UK2NTaWRnbjA4UFdVaTRM?=
 =?utf-8?B?bFRyS1lKY3JzWkM1dlhYTTlYdUFBTzNkeFJFTk1GS0ltRTRVT3lLKzh0eG9l?=
 =?utf-8?B?aXBCMVdPak8zc2s4dHBzcU1sWWNqWU8zWXFiWlk1a0xwQmdOSEVrTmIyVlhS?=
 =?utf-8?B?OHc5RDIzV1AyWno4aFZMUFZSdDlzSjg2TjYrYktVYmpHNFlGV1RjVnBRbUgw?=
 =?utf-8?B?YzdoT0k1S08wSTE2RHFaMmNpQlR6dG02SnFsSW9UcTJkR21DSC9Jd1Z4aE5X?=
 =?utf-8?B?Qnh6T0RkNXpZbFVhQzYrMzRKWXFMSzhXTTJhYWY4VnRUemIwVGV5VUlOdlIv?=
 =?utf-8?B?Vno1Zks2UE9XY2ZRYXlXeWtGZmo0aDN1Q1BWQkRhOU1ONjFIbkpydnZ6bHBI?=
 =?utf-8?B?MWw5TndoQlkrSzRwcHlWR2ZneEx1QnYzaTNiU2ZoVFBiV08zYmdJMytRaEZy?=
 =?utf-8?B?YUIzQ3dNcGJ6YWFSQk1kWndLSkxsVFl0N3d0cHp4MUs4NDE0d2IvQzM4blR2?=
 =?utf-8?B?bDFPZ0JwbEM3R1FPeTVZK3VPSU5CWDVITWFKZDhwbkw1WDl6WC9NTUVMQldU?=
 =?utf-8?B?T2wvYm1Pd1g0RTNwWkZrbnBxTTUreUQxZGxBZ0V3UjRGL2dDNnpPZnlhL0VZ?=
 =?utf-8?B?VGtqOFE0M2ZMcjl1bFFCZ0Nma090K1NXWWV2UjRkdGgrUUdnak9TNEVhOWZi?=
 =?utf-8?B?ajJKLzV2OWdaRW5hQjViVVR2RTNSZ2pBT1RHY1hoUU53K1VuSzRsYm50N3BF?=
 =?utf-8?B?SEpjSEFyN05RcFNXYmRuR0ZhdTlrd1c3amdoQ1hUWG4vZ2l4WmJ4L295QmtV?=
 =?utf-8?B?UDlxYS9rUmVSYTV2MmYzbVh6OXRNN3FTb2N3MTVKMjJjZVRVejRGZk9ZRFVI?=
 =?utf-8?B?dzdjU1duSFJaVCtEMkF0a25uSTJXU0dVaHB4VG5jVW50UW9vbHpOMzdpRnBy?=
 =?utf-8?B?Y3hvRzI0VFV1cFhjZ0dFS3l5aWlwZ2RPSnFVQWVzaGFINnF0SVVoR2plM2Ns?=
 =?utf-8?B?SzA4NEhONjRzVlRhM3ZIM0dLcDQzeEhySDVkSTA0cGE3UmpBR05JWjJVcC8w?=
 =?utf-8?B?c2ZoL1dIWis3TDMwdHNnK3MrekY4RklSQzJGNzBkZnZMbWUrWXUrQi9wYzBP?=
 =?utf-8?B?Ym5aNVUvOE8yWXhUU2ZyVjlMdnpoVmVPUS9zWFpJclpUaENZNjY5YisxdzRP?=
 =?utf-8?B?SFpJcFJHRHFUZUQvbHBvTi9CM2tVMmMrekp0NlRnZDlCSXh4VTVwaW9sWnND?=
 =?utf-8?B?MytrZXFLaXk1eDR1UzNJVGhnSlpPV25pMzFvbWNnbGYxaTU1Qy85WngvMXlQ?=
 =?utf-8?B?dnM2QnJZMWZVNzlmamdwNE9KUVdEWVQ3WEpSeXgvd0d4a0xDVm45ZnB0T0VQ?=
 =?utf-8?B?S2RzNDA4QkVINnlBTlZIRk1URy9ldTZYMmI3TVZxU1luNUwydktZWWpDWStH?=
 =?utf-8?B?WFhNaVVpaEhXQWxsT2EzVTcrTUVzTU4zckIySjVvN3M0UUowM1EyM0NlSU9r?=
 =?utf-8?B?THA0dVdnSjNrLzFRTkFEUzd5WDBTVi9EZHdJM3VnaUdPNHlYOGxlcTJxeWo0?=
 =?utf-8?B?WUt0MCtRRkFJMm9SZmgyWWJ5QTB2WnUwQ3FseEdacEp6Tk1hbjF2MG5qeXRQ?=
 =?utf-8?B?NVpuZ3o3cFExNUZiTHd0K0xXZHc5Tm5XdElZcnpIekhQTTZrc1dnc0xwTlFX?=
 =?utf-8?B?c1pmWHNLMXlCQXJuRXgvYmxDS3NsYXF5bmJxMWdNVldDRXZVbGRpc0VtYVR1?=
 =?utf-8?B?U3hlVlM3MEFhbkxlbHZzdzIzeXhYMEpZUnJJVFU3NEhDVWxxU1FDVjVEMk8x?=
 =?utf-8?B?Qm00aENvTy9JcnRuempqNEVVZEl0OUVHa01oL3pMRldzckplWU83bVd0MmVl?=
 =?utf-8?B?SFFBcVplbHNzQS9yRWl6OWJKSXo2amNsTWVEME5Cd0F0VWxudTZQeDZ4bFJo?=
 =?utf-8?B?VVBROWRybEdzN2xXQUlPN283dzg5QkMrUmw4c0hDbWhvNFZWQUFyU0VLcGYw?=
 =?utf-8?B?NFYzbi81WENzeFgzaGo2QXBlNmEvVm4zRlFySVVKenJBYS9MZVg2MGNCWlJB?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: multipart/mixed;
	boundary="_003_SEZPR06MB67427DD182968980F4C93C08E7CFASEZPR06MB6742apcp_"
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6742.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a99da5-7633-4103-1307-08de20f6f3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 07:50:15.5828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ab9aaef-2fe6-4d66-a5f2-129a6671846b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4NDHpg03jvyr5YGE2EErSwazb1DUrizJ3YQHXgk7yrM9ovHwGus15067qZ38SkSOulLdpaK4RzTqGPfGHtnbFqLQ1ARTkcom0tKqNHw1E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6801
X-OriginatorOrg: pegatroncorp.com
X-MAIL:PTW-MSE-AP03.pegatroncorp.com 5AB7oKXQ012041

--_003_SEZPR06MB67427DD182968980F4C93C08E7CFASEZPR06MB6742apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUGluLXllbiwNCg0KSSBoYWQgcmUtc3VibWl0dGVkIHRoZSAyIENMcyB0byB1cHN0cmVhbS4g
UGxlYXNlIHJlZmVyIHRoZSBhdHRhY2htZW50cy4NCg0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0g
RG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPg0KDQpMaXN0IHlvdXJz
ZWxmIGFzIHRoZSBtYWludGFpbmVyIG9mIHRoaXMgYmluZGluZyBmaWxlIGluc3RlYWQgb2YgdGhl
IHN1YnN5c3RlbSBtYWludGFpbmVyLg0KW0RhbmllbF0gV2hhdCB5b3VyIG1lYW4gaXMgbWFpbnRh
aW5lcnMgaW4gdGhpcyBmaWxlIHNob3VsZCBiZSBNZSByaWdodD8oYXMgYmVsb3cpDQo+ICttYWlu
dGFpbmVyczoNCj4gKyAgLSBEYW5pZWwgUGVuZyA8RGFuaWVsX1BlbmdAcGVnYXRyb24uY29ycC1w
YXJ0bmVyLmdvb2dsZS5jb20+DQoNCllvdSBoYXZlIGFuIGV4dHJhICc+JyBoZXJlLiBUaGlzIHNo
b3VsZCBiZSBjYXVnaHQgYnkgYG1ha2UgZHRfYmluZGluZ19jaGVja2AuIFBsZWFzZSBjaGVjayBb
MV0gYW5kIFsyXSwgYW5kIG1ha2Ugc3VyZSB0aGUgcGF0Y2hlcyBhcmUgdGVzdGVkIGJlZm9yZSB5
b3Ugc2VuZCB0aGVtIG91dC4NCltEYW5pZWxdIFllcy4gSSBoYWQgcmUtdXBsb2FkIHRoZSBwYXRj
aCBhZ2FpbiB0byByZW1vdmUgdGhlIGV4dHJhICc+JyBpbiBmb2NhbHRlY2gsZnQ4MTEyLnlhbWwu
DQpNb3Jlb3ZlciwgSSBjb25maXJtIG5vIGVycm9yIGZvciBmb2NhbHRlY2gsZnQ4MTEyLnlhbWwg
YWZ0ZXIgcnVubmluZyBjb21tYW5kICJtYWtlIGR0X2JpbmRpbmdfY2hlY2siLg0KDQoNCj4gK0Y6
ICAgICBkcml2ZXJzL2hpZC8NCg0KV2h5IGRpZCB5b3UgYWRkIHRoaXM/DQpbRGFuaWVsXSBJZiBu
b3QgYWRkZWQgdGhpcywgdGhlIGNvbW1hbmQgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgMDAwMS1k
dC1iaW5kaW5ncy1pbnB1dC1pMmMtaGlkLUludHJvZHVjZS1Gb2NhbFRlY2gtRlQ4MTEyLnBhdGNo
IHdvdWxkIGhhZCAxIHdhcm5pbmcuDQpBbmQgdGhlIFdBUk5JTkcgYXMgYmVsb3c6DQpXQVJOSU5H
OiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlcyhzXywgZG9lcyBNQUlOVEFJTkVSUyBuZWVk
IHVwZGF0aW5nPw0KIzIxOg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCg0KDQpUaGFua3MuDQoNCkJl
c3QgUmVnYXJkcy4NCkRhbmllbA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
ZGFuaWVsX3BlbmcrY2FmXz1EYW5pZWxfUGVuZz1wZWdhdHJvbmNvcnAuY29tQHBlZ2F0cm9uLmNv
cnAtcGFydG5lci5nb29nbGUuY29tIDxkYW5pZWxfcGVuZytjYWZfPURhbmllbF9QZW5nPXBlZ2F0
cm9uY29ycC5jb21AcGVnYXRyb24uY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQpTZW50OiBUdWVz
ZGF5LCBOb3ZlbWJlciAxMSwgMjAyNSAzOjE4IFBNDQpUbzogZGFuaWVsX3BlbmdAcGVnYXRyb24u
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20NCkNjOiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jv
a2hvdkBnbWFpbC5jb20+OyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IExLTUwgPGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5v
cmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6
IFJlOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogSElEOiBpMmMtaGlkOiBlbGFuOiBJbnRyb2R1
Y2UgRm9jYWxUZWNoIEZUODExMg0KDQpIaSBEYW5pZWwsDQoNCk9uIFR1ZSwgTm92IDExLCAyMDI1
IGF0IDk6MzTigK9BTQ0KPGRhbmllbF9wZW5nQHBlZ2F0cm9uLmNvcnAtcGFydG5lci5nb29nbGUu
Y29tPiB3cm90ZToNCj4NCj4gRnJvbTogRGFuaWVsIFBlbmcgPERhbmllbF9QZW5nQHBlZ2F0cm9u
LmNvcnAtcGFydG5lci5nb29nbGUuY29tPg0KPg0KPiBUaGUgRm9jYWxUZWNoIEZUODExMiB0b3Vj
aCBzY3JlZW4gY2hpcCBzYW1lIGFzIElsaXRlayBpbGkyOTAxDQo+IGNvbnRyb2xsZXIgaGFzIGEg
cmVzZXQgZ3Bpby4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdCB0aGV5IGhhdmUNCj4gZGlmZmVyZW50
IHBvc3RfZ3Bpb19yZXNldF9vbl9kZWxheV9tcy4NCj4gRm9jYWxUZWNoIEZUODExMiBhbHNvIHVz
ZXMgMy4zViBwb3dlciBzdXBwbHkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBQZW5nDQo+
IDxEYW5pZWxfUGVuZ0BwZWdhdHJvbi5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbT4NCj4gLS0tDQo+
DQo+ICAuLi4vYmluZGluZ3MvaW5wdXQvZm9jYWx0ZWNoLGZ0ODExMi55YW1sICAgICAgfCA2NiAr
KysrKysrKysrKysrKysrKysrDQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW5wdXQvZm9jYWx0ZWNoLGZ0ODExMi55YW1sDQo+DQo+IGRpZmYgLS1naXQNCj4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvZm9jYWx0ZWNoLGZ0ODExMi55YW1s
DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2ZvY2FsdGVjaCxm
dDgxMTIueWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjM5MTgyNWIyNGZjYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9mb2NhbHRlY2gsZnQ4MTEyLnlhbWwNCj4gQEAgLTAsMCAr
MSw2NiBAQA0KPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2lucHV0L2ZvY2FsdGVjaCxmdDgxMTIueWFtbCMNCj4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiArDQo+ICt0aXRs
ZTogRm9jYWxUZWNoIEZUODExMiB0b3VjaHNjcmVlbiBjb250cm9sbGVyDQo+ICsNCj4gK21haW50
YWluZXJzOg0KPiArICAtIERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNv
bT4NCg0KTGlzdCB5b3Vyc2VsZiBhcyB0aGUgbWFpbnRhaW5lciBvZiB0aGlzIGJpbmRpbmcgZmls
ZSBpbnN0ZWFkIG9mIHRoZSBzdWJzeXN0ZW0gbWFpbnRhaW5lci4NCj4gKw0KPiArZGVzY3JpcHRp
b246DQo+ICsgIFN1cHBvcnRzIHRoZSBGb2NhbFRlY2ggRlQ4MTEyIHRvdWNoc2NyZWVuIGNvbnRy
b2xsZXIuDQo+ICsgIFRoaXMgdG91Y2hzY3JlZW4gY29udHJvbGxlciB1c2VzIHRoZSBpMmMtaGlk
IHByb3RvY29sIHdpdGggYSByZXNldCBHUElPLg0KPiArDQo+ICthbGxPZjoNCj4gKyAgLSAkcmVm
OiAvc2NoZW1hcy9pbnB1dC90b3VjaHNjcmVlbi90b3VjaHNjcmVlbi55YW1sIw0KPiArDQo+ICtw
cm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGVudW06DQo+ICsgICAgICAtIGZv
Y2FsdGVjaCxmdDgxMTINCj4gKw0KPiArICByZWc6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKw0K
PiArICBpbnRlcnJ1cHRzOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAgcGFuZWw6IHRy
dWUNCj4gKw0KPiArICByZXNldC1ncGlvczoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsg
IHZjYzMzLXN1cHBseTogdHJ1ZQ0KPiArDQo+ICsgIHZjY2lvLXN1cHBseTogdHJ1ZQ0KPiArDQo+
ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+ICsgIC0gcmVnDQo+ICsgIC0gaW50ZXJy
dXB0cw0KPiArICAtIHZjYzMzLXN1cHBseQ0KPiArDQo+ICthZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UNCj4gKw0KPiArZXhhbXBsZXM6DQo+ICsgIC0gfA0KPiArICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9ncGlvL2dwaW8uaD4NCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+ICsNCj4gKyAgICBpMmMgew0KPiArICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8MT47DQo+ICsgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKw0KPiArICAg
ICAgdG91Y2hzY3JlZW5AMzggew0KPiArICAgICAgICBjb21wYXRpYmxlID0gImZvY2FsdGVjaCxm
dDgxMTIiOw0KPiArICAgICAgICByZWcgPSA8MHgzOD47DQo+ICsNCj4gKyAgICAgICAgaW50ZXJy
dXB0LXBhcmVudCA9IDwmcGlvPjsNCj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDwxNSBJUlFfVFlQ
RV9MRVZFTF9MT1c+PjsNCg0KWW91IGhhdmUgYW4gZXh0cmEgJz4nIGhlcmUuIFRoaXMgc2hvdWxk
IGJlIGNhdWdodCBieSBgbWFrZSBkdF9iaW5kaW5nX2NoZWNrYC4gUGxlYXNlIGNoZWNrIFsxXSBh
bmQgWzJdLCBhbmQgbWFrZSBzdXJlIHRoZSBwYXRjaGVzIGFyZSB0ZXN0ZWQgYmVmb3JlIHlvdSBz
ZW5kIHRoZW0gb3V0Lg0KDQpbMV06IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS93cml0aW5nLXNjaGVtYS5tZA0KWzJdOiBodHRwczovL3d3dy5saW5h
cm8ub3JnL2Jsb2cvdGlwcy1hbmQtdHJpY2tzLWZvci12YWxpZGF0aW5nLWRldmljZXRyZWUtc291
cmNlcy13aXRoLXRoZS1kZXZpY2V0cmVlLXNjaGVtYS8NCj4gKw0KPiArICAgICAgICByZXNldC1n
cGlvcyA9IDwmcGlvIDEyNiBHUElPX0FDVElWRV9MT1c+Ow0KPiArICAgICAgICB2Y2MzMy1zdXBw
bHkgPSA8JnBwMzMwMF90Y2hzY3JfeD47DQo+ICsgICAgICB9Ow0KPiArICAgIH07DQo+IGRpZmYg
LS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTIGluZGV4DQo+IGRkZWNmMWVmM2JlZC4u
NjlmNTQ1MTVmZTk4IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJ
TkVSUw0KPiBAQCAtMTIzMjYsNiArMTIzMjYsNyBAQCBUOiAgICAgIGdpdCBnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZHRvci9pbnB1dC5naXQNCj4gIEY6ICAg
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvDQo+ICBGOiAgICAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlvLw0KPiAgRjogICAgIERvY3VtZW50
YXRpb24vaW5wdXQvDQo+ICtGOiAgICAgZHJpdmVycy9oaWQvDQoNCldoeSBkaWQgeW91IGFkZCB0
aGlzPw0KDQo+ICBGOiAgICAgZHJpdmVycy9pbnB1dC8NCj4gIEY6ICAgICBpbmNsdWRlL2R0LWJp
bmRpbmdzL2lucHV0Lw0KPiAgRjogICAgIGluY2x1ZGUvbGludXgvZ2FtZXBvcnQuaA0KDQpSZWdh
cmRzLA0KUGluLXllbg0KDQoNClRoaXMgZS1tYWlsIGFuZCBpdHMgYXR0YWNobWVudCBtYXkgY29u
dGFpbiBpbmZvcm1hdGlvbiB0aGF0IGlzIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkLCBhbmQg
YXJlIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCB0byB3aG9tIHRoaXMgZS1t
YWlsIGlzIGFkZHJlc3NlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBv
ciBoYXZlIHJlY2VpdmVkIGl0IGFjY2lkZW50YWxseSwgcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlm
eSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFpbCBhbmQgZGVzdHJveSBhbGwgY29waWVzIG9mIHRo
aXMgZW1haWwgYW5kIGl0cyBhdHRhY2htZW50LiBQbGVhc2UgYmUgYWR2aXNlZCB0aGF0IGFueSB1
bmF1dGhvcml6ZWQgdXNlLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRpb24gb3IgY29weWluZyBvZiB0
aGlzIGVtYWlsIG9yIGl0cyBhdHRhY2htZW50IGlzIHN0cmljdGx5IHByb2hpYml0ZWQuDQoNCuac
rOmbu+WtkOmDteS7tuWPiuWFtumZhOS7tuWPr+iDveWQq+acieapn+WvhuaIluS+neazleWPl+eJ
ueauiueuoeWItuS5i+izh+ioiu+8jOWDheS+m+acrOmbu+WtkOmDteS7tuS5i+WPl+aWh+iAheS9
v+eUqOOAguWPsOerr+WmgumdnuacrOmbu+WtkOmDteS7tuS5i+WPl+aWh+iAheaIluiqpOaUtuac
rOmbu+WtkOmDteS7tu+8jOiri+eri+WNs+WbnuimhumDteS7tumAmuefpeWvhOS7tuS6uu+8jOS4
pumKt+avgOacrOmbu+WtkOmDteS7tuS5i+aJgOacieikh+acrOWPiumZhOS7tuOAguS7u+S9leac
que2k+aOiOasiuiAjOS9v+eUqOOAgeaPremcsuOAgeaVo+S9iOaIluikh+ijveacrOmbu+WtkOmD
teS7tuaIluWFtumZhOS7tuS5i+ihjOeCuu+8jOeahuWatOagvOemgeatoiDjgIINCg0K

--_003_SEZPR06MB67427DD182968980F4C93C08E7CFASEZPR06MB6742apcp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Tue, 11 Nov 2025 07:50:12 GMT";
	modification-date="Tue, 11 Nov 2025 07:50:14 GMT"

Received: from SI2PR06MB5339.apcprd06.prod.outlook.com (2603:1096:4:1eb::12)
 by SEZPR06MB6742.apcprd06.prod.outlook.com with HTTPS; Tue, 11 Nov 2025
 06:39:33 +0000
Received: from TYCP286CA0067.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31a::9)
 by SI2PR06MB5339.apcprd06.prod.outlook.com (2603:1096:4:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 06:39:31 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:400:31a:cafe::67) by TYCP286CA0067.outlook.office365.com
 (2603:1096:400:31a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 06:39:20 +0000
Received: from mail.pegatroncorp.com (203.69.6.13) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 06:39:31 +0000
Received: from PTW-EX-MBSH07.PEGA.CORP.PEGATRON (172.18.209.103) by
 PTW-EX-DMBSC13.PEGA.CORP.PEGATRON (172.18.147.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Tue, 11 Nov 2025 14:39:17 +0800
Received: from PTW-EX-MBSC05.PEGA.CORP.PEGATRON (172.18.209.100) by
 PTW-EX-MBSH07.PEGA.CORP.PEGATRON (172.18.209.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 11 Nov 2025 14:39:17 +0800
Received: from ms.pegatroncorp.com (172.18.129.154) by
 PTW-EX-MBSC05.PEGA.CORP.PEGATRON (172.18.209.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57 via Frontend Transport; Tue, 11 Nov 2025 14:39:17 +0800
Received: from mail-vk1-f169.google.com ([209.85.221.169])
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 14:39:12 +0800
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5599b119b4aso974983e0c.0
        for <Daniel_Peng@pegatroncorp.com>; Mon, 10 Nov 2025 22:39:12 -0800 (PST)
Received: by 2002:a05:612c:274b:b0:553:ca7e:f08 with SMTP id gm11csp1901038vqb;
        Mon, 10 Nov 2025 22:39:09 -0800 (PST)
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-341d04d5992sor9066790a91.3.2025.11.10.22.39.08
        for <Daniel_Peng@pegatron.corp-partner.google.com>
        (Google Transport Security);
        Mon, 10 Nov 2025 22:39:09 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-f177-1588-49fc-6b55.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:f177:1588:49fc:6b55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed1e73sm15237243a12.12.2025.11.10.22.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:39:08 -0800 (PST)
From:
	"daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com"
	<daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Daniel Peng
	<Daniel_Peng@pegatron.corp-partner.google.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech FT8112
Thread-Topic: [PATCH 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech
 FT8112
Thread-Index: AQHcUtXxFkaOQ+Jh9UGcWGDWRa/niA==
Date: Tue, 11 Nov 2025 06:38:59 +0000
Message-ID: <20251111143853.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
Content-Language: en-US
X-MS-Exchange-Organization-AuthSource: PTW-EX-MBSC05.PEGA.CORP.PEGATRON
X-MS-Has-Attach:
X-MS-Exchange-Organization-Network-Message-Id: 6c492411-5e8e-4a0d-f8c1-08de20ed11db
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
received-spf: Pass (ms.pegatroncorp.com: domain of
  daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com
  designates 209.85.221.169 as permitted sender)  identity=mailfrom;
 client-ip=209.85.221.169;  receiver=ms.pegatroncorp.com;
  envelope-from="daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com";
  x-sender="daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com";
  x-conformance=spf_only; x-record-type="v=spf1";  x-record-text="v=spf1
 ip4:74.125.0.0/16 ip4:173.194.0.0/16  ip4:209.85.128.0/17 ip4:216.58.192.0/19
 ip4:216.239.32.0/19  ip4:172.217.32.0/21 ip4:172.253.56.0/21
 ip4:172.253.112.0/21  ~all"
x-ms-exchange-organization-originalserveripaddress: 10.167.253.11
x-ms-exchange-organization-originalclientipaddress: 172.18.129.154
x-ms-publictraffictype: Email
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1762843148; x=1763447948; darn=pegatron.corp-partner.google.com;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0TxzvcO8Ijul3ALJ59ZtrQlKnZ0E0zof1tiecvpAdh0=;
        b=R12OU5F4MBbT+3qqr+TlA6iV1kMyui4Wzs5nRylZJgecm13TTX++8z8llT2f/sgaci
         q8TYygqwAw4U3H2sbW8S4V1XtD6nUuuNgr7FsiPR4KLmzVApY5v01kc/3n2ZCniEOFTG
         z3jW+3ClCkRRps8d5zNbUrVb19SHuvHm/4X3M2Ux3GS2TYFZVQMG1ttraqbtcvRiqcid
         PQZlu9nsg3UwVLrBkkd009vY3jMIutyfAHdUb9Xp87uO8XCOHs9NlWTuZBMxQaGFrmeY
         5az4YTDQCJcMo1uynIRDiykO2ZKGjnJ4QN2F1mNOs4iPwXJ36TZTjiOy+E0P3sbQgvCQ
         gBfg==
authentication-results: spf=pass (sender IP is 209.85.221.169)
 smtp.mailfrom=pegatron.corp-partner.google.com; dkim=fail (signature did not
 verify)
 header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com;dmarc=pass
 action=none header.from=pegatron.corp-partner.google.com;compauth=pass
 reason=100
x-ms-office365-filtering-correlation-id: 6c492411-5e8e-4a0d-f8c1-08de20ed11db
x-ms-traffictypediagnostic: TY2PEPF0000AB88:EE_|SI2PR06MB5339:EE_|SEZPR06MB6742:EE_
x-forefront-antispam-report: CIP:203.69.6.13;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail-vk1-f169.google.com;PTR:mail-vk1-f169.google.com;CAT:NONE;SFS:(13230040)(82310400026)(7093399015)(43022699015)(12012899012);DIR:INB;
x-microsoft-antispam: BCL:0;ARA:13230040|82310400026|7093399015|43022699015|12012899012;
x-ms-exchange-crosstenant-network-message-id: 6c492411-5e8e-4a0d-f8c1-08de20ed11db
x-ms-exchange-crosstenant-originalarrivaltime: 11 Nov 2025 06:39:31.1294 (UTC)
x-ms-exchange-crosstenant-fromentityheader: HybridOnPrem
x-ms-exchange-crosstenant-id: 5ab9aaef-2fe6-4d66-a5f2-129a6671846b
x-ms-exchange-transport-crosstenantheadersstamped: SI2PR06MB5339
x-ms-exchange-transport-endtoendlatency: 00:00:02.8713172
x-ms-exchange-processed-by-bccfoldering: 15.20.9298.012
x-ms-exchange-crosstenant-authas: Anonymous
x-ms-exchange-crosstenant-authsource: PTW-EX-MBSC05.PEGA.CORP.PEGATRON
x-originatororg: pegatroncorp.com
x-organizationheaderspreserved: PTW-EX-MBSH07.PEGA.CORP.PEGATRON
x-crosspremisesheaderspromoted: TY2PEPF0000AB88.apcprd03.prod.outlook.com
x-crosspremisesheadersfiltered: TY2PEPF0000AB88.apcprd03.prod.outlook.com
x-eopattributedmessage: 0
x-ms-exchange-crosstenant-originalattributedtenantconnectingip: TenantId=5ab9aaef-2fe6-4d66-a5f2-129a6671846b;Ip=[203.69.6.13];Helo=[mail.pegatroncorp.com]
ironport-sdr: 6912da10_xtq1nVTT5XMemrG/9sERHcZXj0ge65wYuz6mJpErYhvVsjg
 He9NVffLSqxJ+EunWEjg39RDpmMzMc2DBBUP2Qg==
arc-seal: i=1; a=rsa-sha256; t=1762843149; cv=none;        d=google.com;
 s=arc-20240605;
        b=Ah9zAEhTEVt91tXPSmUJbjL192BSEYSSpNuRzy6ECOetggDQPNNKSQuVeYTmKBbTtH
         gM3QIVxtqj4ioB7aMFy7VP97DcXIwa9u4b/DwcoHqXeywGF8T+Ga85EdY81oegZ4zDay
         XtWmACOSBMfGBSwjWVeOgOIms5Jh2ymvz8gDmjFgjXyW8pltkRL0MKJ5w7UTVmGrskeQ
         EEgN9wQYFBzn5H2ygPm9kEu3Z7TwfWjw0M3Zlllftu2Fdx77lFfXVvA6/SY9iOmEKEw6
         G2T2q1Tb0dllDK4N4pTsrP87K3kLY02IlLECRkpOnBFP5cxO2BOwA+sgq2vi76UKED3l
         7Lcw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=0TxzvcO8Ijul3ALJ59ZtrQlKnZ0E0zof1tiecvpAdh0=;
        fh=nTAQMAL0nfPnf8nJ08dMNPKmgSyU5Dpmd3DvBr7lmtA=;
        b=LrOVH6uxLL2839YPLjOflJD+7dswLOScgNBCdWpdEQnjSTVm8nfUqjECJdcuB7+oL/
         6sLo32Fcn/HFdyqGZLZbb/yDdtJ7NDch6w3jmYBMd+TGZHPNiDTJyrtU/SbVeT0arygs
         ixUdj0ani6cjHurmmFaQsWH8T6h3zGzHpqNqjp0GOpX/JKwDC0fK8Rs1fVNdIozrqf5X
         Wk53PTR+DrKtrF3uFaNT5d/GzcZ1W6+lgFd+oBS1lDFpr7eQFNcvlvmCwW1+W43UZ280
         dB1hHV6LN3zLLJAh7Qd3X0oP+Iw679PGFkHJYI8hqYfzAz2vJKSypdhb6oZ8PMr9f8X4
         GMDQ==;        dara=google.com
arc-authentication-results: i=1; mx.google.com;       dkim=pass
 header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com
 header.s=20230601 header.b=R12OU5F4;       spf=pass (google.com: domain of
 daniel_peng@pegatron.corp-partner.google.com designates 209.85.220.41 as
 permitted sender) smtp.mailfrom=daniel_peng@pegatron.corp-partner.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@pegatron.corp-partner.google.com
x-ironport-av: E=Sophos;i="6.19,227,1754928000";    d="scan'208";a="141632967"
authentication-results-original: ms.pegatroncorp.com; spf=Pass
 smtp.mailfrom=daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com;
 dmarc=pass (p=reject dis=none) d=google.com
x-ironport-anti-spam-filtered: true
x-ipas-result: A0HOBwDN2RJpfKndVdFaHgEBCxIMggULAoFsUoECYTAHUYgkhSyUYIZri1+BEQcqJxEBAQEBAQEBAQEHAQE9FAQBAQMBA5FdAiUBNwYOAQIDAQEBAQEDAgMBAQEBAQEQAQEBBAEBAQIBAQIEBAEBAQIQAQE7Bw4SKYZPDUkBDAGCCwEzcYElAQEBAQEBAQEBAQEBAR0CDRkKcyABDQEBLwgBL1ETAQUBIgESCBqCYYIiAQYRAzYDAQQMBqM0gQVCjHCBAYIMAQEGBAMCA3zaIg2BBYFNCQkBCoE2hTuCeYUdcAGCSYE1eieCKIEVgTuCLYEFgRqCBgWGXYM0gXqELYJTIJBDSIEeA1ksAUsKEw0KCwcFM4EwAyoLDAsSDwkVbjIKE1ISQEEYCGmCWhiBayJoDwaBEoJBgRAGgnyGHA+DeYEDhGl4AwsYDUgRLDcUGwY+bgeUHYIKcoEOASqCBaYZoCBxkESPPYV8TROFSJF3kxmWI4JjIo1mhAmSR4Q+AgoHBxEkgVokPIEgcC+DCAlGHA9XjUoMCwuIcboRawI6AgcLAQEDCYcjinuBSwEB
x-mailer: git-send-email 2.34.1
x-amp-result: SKIPPED(no attachment in message)
x-amp-file-uploaded: False
x-gm-message-state: AOJu0YzhIzAhOCK8ZIE021QDsR5eG+Un/SIG9GA6XVANXHR/3Pmt+AzM
	0GtcwMnPyB0w4zDxcTDQWbiPk4Xr+jmMqfnjUKULdR/E+cOw0AlHeue/RfYIqHp4EqoIHmE1its
	BPWxy+RZDa6dTV8hnFiV8hqSaDft+Z8j5S8PWWB4LJMAZD8Jp9jc1ppEQREMV3VXgRC0dE3VVdN
	R9L+s=
x-received: by 2002:a17:90b:4a4d:b0:340:dd2c:a3d9 with SMTP id
 98e67ed59e1d1-3436cb29cafmr17037940a91.12.1762843148630;        Mon, 10 Nov
 2025 22:39:08 -0800 (PST)
x-google-dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762843150; x=1763447950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:dkim-signature:delivered-to:x-forwarded-for
         :x-forwarded-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TxzvcO8Ijul3ALJ59ZtrQlKnZ0E0zof1tiecvpAdh0=;
        b=vgZcOadslbrzDXrKp4DrOByIAorBTXKP5TwSoJakzf+d5j76Ih8GUguXMXYw87WcDH
         7mNHg2hu0f2a0FEtMAIC/1mpv7jOl5+r/vylHedpMg85nc46XdowG5u17kS1BAGMKbDC
         NGB34F2Iz+Eb8rb/w6PFIFbE1k0GY0xLFxxGEjNNxxy3Q4ZKGsLTVWxYMtBo01J+Ct7L
         9DPV/zNp11nXzofSLg5Va8Hnns/hDumCpLmq2kyRu6/eWQAwNUEd0eSY2dEPwYz7qaQm
         hwhDWsy3a6RfpuIM6BDFMPOQJ10jSi4tW076atqNIePPUO/gHHg5Ak61jkaRozoGqvHw
         5Ibg==
x-google-smtp-source: AGHT+IG5KqPahXbbmibL5vikOZZx0fOqdq9+WZQW+1be30DeSfCc7ofE7W/ExoFor7vmsaV/es1lpA==
ironport-hdrordr: A9a23:NXwFp68t4gszZhgyRA1uk+BeI+orL9Y04lQ7vn2ZFiY4A7elfp
 GV8YVi6farslxhIU3I+erwR5Voj0msvaKdhrNhc4tKOTOWxldAQ7sSp7cKqQeQfhEWmtQtop
 uIEJIOR+EYc2IKwPoSiTPQe71QpKj7gdSVaP/lvgtQpGlRGtsQmjuRYTzrWXGeKjM2TKYRJd
 6y4NFYryGsdXlSQsOwHWkdQuTPzuek5fWWECLvH3UcmWuzZcbC0s+YLzGomjkbFx1AqI1SgV
 QtUDaZ2kxgiZ6GIluw7R6k032boqqT9jI6Pr3BtiHdEFWc7HfbWLhc
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0;jmr:0;auth:0;dest:I;ENG:(910005)(944506478)(944626604)(920097)(930097)(140003);
X-Microsoft-Antispam-Message-Info: =?big5?B?cFcxa0I0bUNYckZpRStSWW9laHUwLytiem9acTZFOExHS3pldlhNSXlsbUVoanhi?=
 =?big5?B?bTNubmNDejhzcDJ0RUZHL0hUdDFzZ3hlYlR5NFRQd1VRWHNlYW4rM1NBdUVHYVN4?=
 =?big5?B?Sjh4VUJnSWVsOHgwUGN4aUh0Zkx6d040SjhEVVN0QlFwYWFKZEVSR0pSZHpsbng5?=
 =?big5?B?QjZzaVZmdXBXVGVGb255ckFyQTRQTVpBenRJU29QYk9vNmQ5QXp0VjJyYWVvWW4v?=
 =?big5?B?eTJqSmpJRzFWVWdUUGVYblhNa3V6WEwxR2F6Yk94T1FXUEZkMjJkL0EzS2R0RDkx?=
 =?big5?B?b1ZhcXlIOVJuMGgvUUYvQTFjUnJrKzcrcU5tb0RwZ3VnMWZicU1iVHlGeExNT1Uw?=
 =?big5?B?ZzNBQVZFc2g1cHZFTkRZVm9SQjFaNlVXdWZ6bjVXOEdYNHg0dEgzRElKQ3lGQ2NG?=
 =?big5?B?aW1hV3QxWW0wSXNjSUtKN1VINmpiQldKZTlMaHBoV2cvVW5raC9PV2U4dEhVRUU3?=
 =?big5?B?cFRiVVNiZ2VxVkdMM3JibDBOSjhGSEVzbjVtREJvMEIxL3lNOVF3N0YvMENIc1ln?=
 =?big5?B?c2hucElKVUM2Y2tmK3hwdkV1dzE3MVhqVkY5cEpLeW4vL0NQQ0t6OUhURjVPVzAv?=
 =?big5?B?NDJnVTZER3dkV2FWVGpuK1NleFRpeWp6WURXc1ZQa2Y0aHVjVFk2ZTZoQVpJVXRm?=
 =?big5?B?MkZiTUcwVVNNbTVOTHFKYmtGUmk4a2ZrNDF5Rytlb1ZjNnc4UkJaY3NJS3hPcmVl?=
 =?big5?B?NjEzYWFSM0Y0YTRjZUhIZnA0UUNaOVp2cXZrZUlMQkFjSWdtSjEvSjV0dFk4WU9Y?=
 =?big5?B?TmlxTUk0TTdza1ZJZUgxMWV4dVdNdkJkcFVhNTZ3YUJsMUhKTlFkSFRMUDFkaG5r?=
 =?big5?B?cVYrMWNmbTcrSlRKdHdBK3RNd0U4QlRaMXI4cWJldmhVdDdCMVhzajlEdHBydDd6?=
 =?big5?B?bjQvK0xTNDZSMzdxc2owUWszM3MwNmU0RFBRbm1kZUJZTFNsVnBzUm1vblA0RzUv?=
 =?big5?B?aHlpU0NjUVViVUgrUytpSTM5eE1BVVUrcFNtd2lxZDZiaW5jMDVOY3Qvc0lXZ21B?=
 =?big5?B?cHY1dXhvbXhzZlhlOFcvTnAyTHBYSThlOEtROEpydU1wMUJIWi8yNlpRR05YZXBl?=
 =?big5?B?YlJLeXpaa2dta1BqUHNrTVZZODl5WjlVbVlTSFllS21hSXplTVpSQVVJNHBIV0ZU?=
 =?big5?B?VDdYQkhKV2lvS3hVWlJLS3lqSHlsdzg0S2NtNEErbXlHUmlGblVENHlTSU0vMWdO?=
 =?big5?B?ZnlPWlVEOFlSdElpdEFiNFVUaWVDVyt1MnpTRGNONm10Q2hzNjl2VmNXa3NFUmtS?=
 =?big5?B?Q1dwS3ovbmVpQnpnUlFCSDFKUGpPOUJkZDluNmZJSWR0VnBQdzZ0SkdRSFlFMlJU?=
 =?big5?B?YW9EZ0J0T3pLdjVOVXpobUdtUFV0cUhJcjk0eTEwSWc3OTI5RFZERmUxSElsWkhl?=
 =?big5?B?aStjdmlWaUJnV0pFWkErdWlvNnpXUlMrYjdyMk1TdWMxYWtHNGk0ejhWSzdFT2ZC?=
 =?big5?B?RUNsSGo2L2VxODNsdm4vRUxGeFB3ZWx1Q1dMeE1UVWZIMFNNdmJJUS9YaEJvKzd1?=
 =?big5?B?Z3Ayd3dzQ1RNZlFScHZoamtCbUdhbDJNaVBHZnJ3VmZBN253L3RUL1ZSYWV2QkZ5?=
 =?big5?B?Y3UxUjY0Q1BuMWI3Skp3NjhkQ1BLZE1aKzlOYUhYMGxHMW9TOUNRZVBrdkNveVZK?=
 =?big5?B?cHdBM1pPcUovTTZZZVpvbjhLdXl1SVo3UTJMSlZyLzZYY2tzbmdia29DWitTOGwy?=
 =?big5?B?LzJUdGx2MVdWV1VZOS92Yi9CazZRRXNVVEVBakpINWpsVmNPbUI4cGlXa1hDSnYz?=
 =?big5?B?b3dEZ01UVHhaSHVjME5kaGoyaUZDV1pSRTkzMEpZcFBnaEtYQTBzcWtBTGZ5Mkx4?=
 =?big5?B?SjZxcTQ3VW4zL0JwMXNHUHplcC9NVGhZVWwyK1RTdGdUMzFPWU1jcGdEUDNKYjJ1?=
 =?big5?B?UHZoalNEMTlLd3BHK2lTbHVUTWlmNGEwV3hEVTFXVVdiMW9LQUZTWm1tZ2NPak9G?=
 =?big5?B?dHVUL1NkYVY0Yml5TlNzaUNsYVNjNjJJRlVPbHhkM3kxVzlDU3ptSVdsM0xkL1Jm?=
 =?big5?B?T0NHV2V2SzNGVHRoZ0FQYjcyRmlmZ3VjN2NiZlBWUHJZSXBYZFEzaE9rWTFxb21w?=
 =?big5?B?WkNBU0dFZmErOTBOeWQzdkZJNXBRMVQ2ZEZ6K0QyY2VPV3haL3U5a2tXbHlYaWdD?=
 =?big5?B?NWhPNDFrOHRYWFVOQWR2RkpPejI1UzFiNzZydlAyYmtVRXJsN3EwOEN6V2JPaG42?=
 =?big5?B?VUE1OHhmZGdWLzZCZHdNcVBXQUdjcFJ2VXhBWmZUMWszSENnNW11Q1ovUENxWEhQ?=
 =?big5?B?L090Z3VmaVkxNktYK1ZSR1Z0NXA4RWRWL1hEcDIwQ3FMMnpWcSswbnpjRlpNSVV3?=
 =?big5?B?V0lIZFRoS1RUaW5JTmxBK3FMZHdKY2tQaUJxUlRVczd1STdmbTBTbXpQeGxKVDFP?=
 =?big5?B?eVRGeEpaRnEvS0YzQ2hyWXNlVml0UnVUaW05bStNSVkyc3o3M3JhVDVlRzMwZGVa?=
 =?big5?B?dUkrTjZSTm5zTllwbWJtZ2N3K0djY2htdlhrZjUwK2JYMTVCdGhoRlFrd1NEVEpw?=
 =?big5?B?UkEyaE0zc2VqUWx4N1orRWQwRnJUeEQ2c3NtTmxwSmdIUk0xY1QvY3paL1FuYW95?=
 =?big5?B?UUhVUk1JL0FzWlhpNUxPVlJKKzJrc1JYRXFoaGxpUndlbXJHaFJJSm0rTTJ3ODVq?=
 =?big5?B?TVkzQ216S2Ivc1h0azdZSlVOREtOakh3SE80QUIzYXpYQTRRYklNczRnc0FsQ2ZJ?=
 =?big5?B?aE9oQkNoVEdJYnN4aTU5OEZ2ei9oUXNlM2RXRzRaZkp6bHVoTFExTloyQnlXb2pL?=
 =?big5?B?bjI4UWw2U0wrTHRhcGR5NmRHeVd0akcyV0M4c1RPZE5Pa0IwandVczV2VG55SWlt?=
 =?big5?B?WVJWQ1JYT3pPNGdaKzVYVnlBTk5EV2FwV0dkSXVhSFFRcm1RNmpkVEVQanhNUUxY?=
 =?big5?B?UWx2YUZRVjFJMU0ydGgwdFpMU0MwOVlDeTA1Wkh1SVZaS1h5S3lqaGs0UDZVMWNy?=
 =?big5?B?aVVqTWc3T1A5MWdmQ1QrcnZmMllHYS9hNk8zcDhRUGdUbkZaNmluWlY0a3hheXNp?=
 =?big5?B?NGVSQTF4YUNKWHo2NTEyRkg2Z1RWMTlxSU5tRUEzOUVnM0hOSnRYaStwRzRqYVdk?=
 =?big5?B?KzUvRTFmbmx3Tm5QNEZOL0ZQbzMwbFE3SDFxTFN4aTNIRysvaU9ud2tIT2Z2eGNB?=
 =?big5?B?amtFN2tKbU5rTFk4cmZPb3hxc2V3dE0waTgzT0NET09qMG1qWUhKQzloZCtJZGVL?=
 =?big5?B?TDNXNlR6aGJGRWI0UGgyNVFCZno2UmpvTS9JOEowdU1YRWl1ZmkvUVZyOGR0OUNu?=
 =?big5?B?aW1xODVYT3ZyL2htUjVzbnBoT0plMHEvWGRHL1JUNlg2emhLQ1VyTVJiY201Sk82?=
 =?big5?B?cHpDYnZnUHBUcVJ0YVlsQ1p2WlByaW9HajFlcVRmSTFJYjdaYkMwZmR0WWY1Qmxk?=
 =?big5?B?QzA2M1NZZkp1OXlYVzdxaVF5RDlzZnFWNEx2MnE0ZDdqTVQzMTUzTnhQbm9ZaFJu?=
 =?big5?B?WDc3dmlUaEFXUThId2pmTmhrNVNlUT09?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

RnJvbTogRGFuaWVsIFBlbmcgPERhbmllbF9QZW5nQHBlZ2F0cm9uLmNvcnAtcGFydG5lci5nb29n
bGUuY29tPg0KDQpUaGUgRm9jYWxUZWNoIEZUODExMiB0b3VjaCBzY3JlZW4gY2hpcCBzYW1lIGFz
IElsaXRlayBpbGkyOTAxIGNvbnRyb2xsZXINCmhhcyBhIHJlc2V0IGdwaW8uIFRoZSBkaWZmZXJl
bmNlIGlzIHRoYXQgdGhleSBoYXZlIGRpZmZlcmVudA0KcG9zdF9ncGlvX3Jlc2V0X29uX2RlbGF5
X21zLg0KRm9jYWxUZWNoIEZUODExMiBhbHNvIHVzZXMgMy4zViBwb3dlciBzdXBwbHkuDQoNClNp
Z25lZC1vZmYtYnk6IERhbmllbCBQZW5nIDxEYW5pZWxfUGVuZ0BwZWdhdHJvbi5jb3JwLXBhcnRu
ZXIuZ29vZ2xlLmNvbT4NCi0tLQ0KDQogLi4uL2JpbmRpbmdzL2lucHV0L2ZvY2FsdGVjaCxmdDgx
MTIueWFtbCAgICAgIHwgNjYgKysrKysrKysrKysrKysrKysrKw0KIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCiAyIGZpbGVzIGNoYW5nZWQsIDY3
IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lucHV0L2ZvY2FsdGVjaCxmdDgxMTIueWFtbA0KDQpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2ZvY2FsdGVjaCxmdDgxMTIu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9mb2NhbHRlY2gs
ZnQ4MTEyLnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjEx
NDI4ODc4N2M5OA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2lucHV0L2ZvY2FsdGVjaCxmdDgxMTIueWFtbA0KQEAgLTAsMCArMSw2NiBAQA0K
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
KQ0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
aW5wdXQvZm9jYWx0ZWNoLGZ0ODExMi55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBGb2NhbFRlY2ggRlQ4MTEy
IHRvdWNoc2NyZWVuIGNvbnRyb2xsZXINCisNCittYWludGFpbmVyczoNCisgIC0gRG1pdHJ5IFRv
cm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPg0KKw0KK2Rlc2NyaXB0aW9uOg0KKyAg
U3VwcG9ydHMgdGhlIEZvY2FsVGVjaCBGVDgxMTIgdG91Y2hzY3JlZW4gY29udHJvbGxlci4NCisg
IFRoaXMgdG91Y2hzY3JlZW4gY29udHJvbGxlciB1c2VzIHRoZSBpMmMtaGlkIHByb3RvY29sIHdp
dGggYSByZXNldCBHUElPLg0KKw0KK2FsbE9mOg0KKyAgLSAkcmVmOiAvc2NoZW1hcy9pbnB1dC90
b3VjaHNjcmVlbi90b3VjaHNjcmVlbi55YW1sIw0KKw0KK3Byb3BlcnRpZXM6DQorICBjb21wYXRp
YmxlOg0KKyAgICBlbnVtOg0KKyAgICAgIC0gZm9jYWx0ZWNoLGZ0ODExMg0KKw0KKyAgcmVnOg0K
KyAgICBtYXhJdGVtczogMQ0KKw0KKyAgaW50ZXJydXB0czoNCisgICAgbWF4SXRlbXM6IDENCisN
CisgIHBhbmVsOiB0cnVlDQorDQorICByZXNldC1ncGlvczoNCisgICAgbWF4SXRlbXM6IDENCisN
CisgIHZjYzMzLXN1cHBseTogdHJ1ZQ0KKw0KKyAgdmNjaW8tc3VwcGx5OiB0cnVlDQorDQorcmVx
dWlyZWQ6DQorICAtIGNvbXBhdGlibGUNCisgIC0gcmVnDQorICAtIGludGVycnVwdHMNCisgIC0g
dmNjMzMtc3VwcGx5DQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBs
ZXM6DQorICAtIHwNCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQorDQor
ICAgIGkyYyB7DQorICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47DQorDQorICAgICAgdG91Y2hzY3JlZW5AMzggew0KKyAgICAgICAgY29tcGF0aWJs
ZSA9ICJmb2NhbHRlY2gsZnQ4MTEyIjsNCisgICAgICAgIHJlZyA9IDwweDM4PjsNCisNCisgICAg
ICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBpbz47DQorICAgICAgICBpbnRlcnJ1cHRzID0gPDE1
IElSUV9UWVBFX0xFVkVMX0xPVz47DQorDQorICAgICAgICByZXNldC1ncGlvcyA9IDwmcGlvIDEy
NiBHUElPX0FDVElWRV9MT1c+Ow0KKyAgICAgICAgdmNjMzMtc3VwcGx5ID0gPCZwcDMzMDBfdGNo
c2NyX3g+Ow0KKyAgICAgIH07DQorICAgIH07DQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUw0KaW5kZXggZGRlY2YxZWYzYmVkLi42OWY1NDUxNWZlOTggMTAwNjQ0DQotLS0g
YS9NQUlOVEFJTkVSUw0KKysrIGIvTUFJTlRBSU5FUlMNCkBAIC0xMjMyNiw2ICsxMjMyNiw3IEBA
IFQ6ICAgICAgZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9kdG9yL2lucHV0LmdpdA0KIEY6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW5wdXQvDQogRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJp
by8NCiBGOiAgICAgRG9jdW1lbnRhdGlvbi9pbnB1dC8NCitGOiAgICAgZHJpdmVycy9oaWQvDQog
RjogICAgIGRyaXZlcnMvaW5wdXQvDQogRjogICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvaW5wdXQv
DQogRjogICAgIGluY2x1ZGUvbGludXgvZ2FtZXBvcnQuaA0KLS0NCjIuMzQuMQ0KDQo=

--_003_SEZPR06MB67427DD182968980F4C93C08E7CFASEZPR06MB6742apcp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Tue, 11 Nov 2025 07:50:14 GMT";
	modification-date="Tue, 11 Nov 2025 07:50:15 GMT"

Received: from OSQPR06MB7973.apcprd06.prod.outlook.com (2603:1096:604:429::13)
 by SEZPR06MB6742.apcprd06.prod.outlook.com with HTTPS; Tue, 11 Nov 2025
 06:39:34 +0000
Received: from PS2PR01CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::16) by OSQPR06MB7973.apcprd06.prod.outlook.com
 (2603:1096:604:429::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 11 Nov
 2025 06:39:31 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::8) by PS2PR01CA0028.outlook.office365.com
 (2603:1096:300:58::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 06:39:14 +0000
Received: from mail.pegatroncorp.com (203.69.6.13) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 06:39:30 +0000
Received: from PTW-EX-MBS19.PEGA.CORP.PEGATRON (172.18.192.62) by
 PTW-EX-DMBSC11.PEGA.CORP.PEGATRON (172.18.147.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Tue, 11 Nov 2025 14:39:19 +0800
Received: from PTW-EX-MBSC04.PEGA.CORP.PEGATRON (172.18.209.101) by
 PTW-EX-MBS19.PEGA.CORP.PEGATRON (172.18.192.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 11 Nov 2025 14:39:18 +0800
Received: from ms.pegatroncorp.com (172.18.129.152) by
 PTW-EX-MBSC04.PEGA.CORP.PEGATRON (172.18.209.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57 via Frontend Transport; Tue, 11 Nov 2025 14:39:18 +0800
Received: from mail-vk1-f173.google.com ([209.85.221.173])
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 14:39:18 +0800
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-559836d04f6so2434234e0c.0
        for <Daniel_Peng@pegatroncorp.com>; Mon, 10 Nov 2025 22:39:17 -0800 (PST)
Received: by 2002:a05:612c:274b:b0:553:ca7e:f08 with SMTP id gm11csp1901068vqb;
        Mon, 10 Nov 2025 22:39:14 -0800 (PST)
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7b23f232314sor3759781b3a.6.2025.11.10.22.39.14
        for <Daniel_Peng@pegatron.corp-partner.google.com>
        (Google Transport Security);
        Mon, 10 Nov 2025 22:39:14 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-f177-1588-49fc-6b55.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:f177:1588:49fc:6b55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed1e73sm15237243a12.12.2025.11.10.22.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:39:13 -0800 (PST)
From:
	"daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com"
	<daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Daniel Peng
	<Daniel_Peng@pegatron.corp-partner.google.com>, Benjamin Tissoires
	<bentiss@kernel.org>, Douglas Anderson <dianders@chromium.org>, Jiri Kosina
	<jikos@kernel.org>, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH 2/2] HID: i2c-hid: Add new FocalTech Touchscreen Chip
Thread-Topic: [PATCH 2/2] HID: i2c-hid: Add new FocalTech Touchscreen Chip
Thread-Index: AQHcUtXxUNs0bMn2fkqB3q1c3jRXpw==
Date: Tue, 11 Nov 2025 06:39:00 +0000
Message-ID: <20251111143853.2.Iad6f93df7a4436f6a84ed7b7493fc468c56ab750@changeid>
References: <20251111143853.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
In-Reply-To: <20251111143853.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
Content-Language: en-US
X-MS-Exchange-Organization-AuthSource: PTW-EX-MBSC04.PEGA.CORP.PEGATRON
X-MS-Has-Attach:
X-MS-Exchange-Organization-Network-Message-Id: 14c470c8-08f8-44f2-4431-08de20ed11b3
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
received-spf: Pass (ms.pegatroncorp.com: domain of
  daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com
  designates 209.85.221.173 as permitted sender)  identity=mailfrom;
 client-ip=209.85.221.173;  receiver=ms.pegatroncorp.com;
  envelope-from="daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com";
  x-sender="daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com";
  x-conformance=spf_only; x-record-type="v=spf1";  x-record-text="v=spf1
 ip4:74.125.0.0/16 ip4:173.194.0.0/16  ip4:209.85.128.0/17 ip4:216.58.192.0/19
 ip4:216.239.32.0/19  ip4:172.217.32.0/21 ip4:172.253.56.0/21
 ip4:172.253.112.0/21  ~all"
x-ms-exchange-organization-originalserveripaddress: 10.167.253.8
x-ms-exchange-organization-originalclientipaddress: 172.18.129.152
x-ms-publictraffictype: Email
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1762843154; x=1763447954; darn=pegatron.corp-partner.google.com;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=539HVCzYtsPJqOodyacxfczakrCXMmx5hlTcSg4yU4k=;
        b=avSMwpBIqFFB/RkDLGtpt/UGdYfqy1VuKEEbfsjxN7jpmY8fjchATIPVLv4Im2Ne69
         N0jIIZyTdn6egHEL/T7xVy3kid42gbJlGOHys1eWJwBHyAojSeLc5wHVgXu1lTzxZ+Xu
         5TBbA01lKzMPJAT1D6c+oJUjoSfAna8BmJglhIc4LMa/rSJsRQ0DSynuwNV5PyYPODdk
         k464sX1b1a//gM6wPrNJgeqaZbWiyST1NbyhqnOPPqz6OCATVecSIvTs3+maYxc+7moM
         GrWUgpx9G8WJXFuAccJukClDm3acLXkAWHQUftsfouq4NfLGMef37B/au6L52Ijw89Gj
         dp2Q==
authentication-results: spf=pass (sender IP is 209.85.221.173)
 smtp.mailfrom=pegatron.corp-partner.google.com; dkim=fail (signature did not
 verify)
 header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com;dmarc=pass
 action=none header.from=pegatron.corp-partner.google.com;compauth=pass
 reason=100
x-ms-office365-filtering-correlation-id: 14c470c8-08f8-44f2-4431-08de20ed11b3
x-ms-traffictypediagnostic: TY2PEPF0000AB8A:EE_|OSQPR06MB7973:EE_|SEZPR06MB6742:EE_
x-forefront-antispam-report: CIP:203.69.6.13;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail-vk1-f173.google.com;PTR:mail-vk1-f173.google.com;CAT:NONE;SFS:(13230040)(12012899012)(7093399015)(82310400026)(43022699015);DIR:INB;
x-microsoft-antispam: BCL:0;ARA:13230040|12012899012|7093399015|82310400026|43022699015;
x-ms-exchange-crosstenant-network-message-id: 14c470c8-08f8-44f2-4431-08de20ed11b3
x-ms-exchange-crosstenant-originalarrivaltime: 11 Nov 2025 06:39:30.8690 (UTC)
x-ms-exchange-crosstenant-fromentityheader: HybridOnPrem
x-ms-exchange-crosstenant-id: 5ab9aaef-2fe6-4d66-a5f2-129a6671846b
x-ms-exchange-transport-crosstenantheadersstamped: OSQPR06MB7973
x-ms-exchange-transport-endtoendlatency: 00:00:03.2931071
x-ms-exchange-processed-by-bccfoldering: 15.20.9298.012
x-ms-exchange-crosstenant-authas: Anonymous
x-ms-exchange-crosstenant-authsource: PTW-EX-MBSC04.PEGA.CORP.PEGATRON
x-originatororg: pegatroncorp.com
x-organizationheaderspreserved: PTW-EX-MBS19.PEGA.CORP.PEGATRON
x-crosspremisesheaderspromoted: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
x-crosspremisesheadersfiltered: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
x-eopattributedmessage: 0
x-ms-exchange-crosstenant-originalattributedtenantconnectingip: TenantId=5ab9aaef-2fe6-4d66-a5f2-129a6671846b;Ip=[203.69.6.13];Helo=[mail.pegatroncorp.com]
ironport-sdr: 6912da16_D/hUIje3hQyAZp54FVJQn6z/STdwh6UXTHrXZWfSWD6j8hH
 h/a+t+Mdb/JDDXtPFel4V8Y6S0bqtd2gob4NQSg==
arc-seal: i=1; a=rsa-sha256; t=1762843154; cv=none;        d=google.com;
 s=arc-20240605;
        b=WQ5Y+R4aKPEMMD2j26fEHzJdcRo5xFXn29XIE28jVcIW/3utUXDoqa7uX1VGezoBuX
         y6xhpqfmbk6Gb388QDXOYZ2dLNsKCHBKJLC6D/h/fBcuV4+kEKJpoFj/hJYLNOuRZ/1c
         kFLayOhxOHZ7Wv/6s4jw7WukjteMhmM3VJeOuSO0u7ZnHvOiSQWV4ivNZpEG+A4mw+U8
         CtcS7XIyPtPOdbNtfi+yFTM5Xr8yt/gzQobeuVh8iZUQqFWkjSN9rM/LHi4onDTxhbi4
         DkZnB9PeOinsVj3vVBh1hVHluhDSpsvvGLgJruGPydaYIu0/6bH/qxt3or6npGlmggRD
         7NYg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=539HVCzYtsPJqOodyacxfczakrCXMmx5hlTcSg4yU4k=;
        fh=AGAVJydr72GrJrAmC3n8rQU+M+QVMlP8/xpgLv70s2o=;
        b=DfkSOgrjQ38btJlIu/yXH1wGhd0XpzaYyem30nchzxTL9nf2gd2R4s5c1cd6AgBxiw
         eh3jdnmM6Rc6eu6uUWIgXuKV4rcJhum/NahEHYtL+dz6GgxPD+yzNOiN1WpFKPDsyTWb
         YvSRzRYkDUqIBM+itOCGTy9/j/vne8PS8uvaUi1cWmjrO2y4SYPfPJc3CdOaxdVPp2vJ
         5iOn/UPkCcHINzAzbhOHrIU3wBoRgrLnEENgu3cMTRNekvACRRsD5UwDr9z2XKvf3jGn
         SRNiNPeyox5IBkrih4+vTklyR8UFwBJiu0PqZEeoD26hLSwpDyCkwXEzsmEnMXkTZ/yM
         4N3A==;        dara=google.com
arc-authentication-results: i=1; mx.google.com;       dkim=pass
 header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com
 header.s=20230601 header.b=avSMwpBI;       spf=pass (google.com: domain of
 daniel_peng@pegatron.corp-partner.google.com designates 209.85.220.41 as
 permitted sender) smtp.mailfrom=daniel_peng@pegatron.corp-partner.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@pegatron.corp-partner.google.com
x-ironport-av: E=Sophos;i="6.19,227,1754928000";    d="scan'208";a="208483659"
authentication-results-original: ms.pegatroncorp.com; spf=Pass
 smtp.mailfrom=daniel_peng+caf_=Daniel_Peng=pegatroncorp.com@pegatron.corp-partner.google.com;
 dmarc=pass (p=reject dis=none) d=google.com
x-ironport-anti-spam-filtered: true
x-ipas-result: A0EXAQBo2BJpga3dVdFaHAEBAQEBAQcBARIBAQQEAQGBfwQBAQsBAYFsUoFjMAdRjVCIfJJPjHAHUREBAQEBAQEBAQEHAQFRBAEBAwSRXQIlATcGDgECAwEBAQEBAwIDAQEBAQEBEAEBAQQBAQECAQECBAQBAQECEAEBIhkHDjuGXEkBDAGCCwGBJIEmAQEBAQEBAQEBAQEBHQImZQYSIAENAQEvCAEPIDEzAQUBHAYBEggahQMBBkoDAQSjQYEFQoxwgQGCDAEBBgQDAgPcMIFNCQkBCoE2AYU6iBZxgkmBNXongiiCUIItiweDNIYnkzZIgR4DWSwBSwoTDQoLBwUzgTADKgsMCxIPCRVuMgoTUhJAQRgIaYJaGIFrImgPBoESgkGBEAaCfIYcD4N5gQOEaXgDCxgNSBEsNxQbBj5uB5QdggpygQ6ZO48OoRGlfU0Tlz+TGZkGIqQ2hD4CCgcHESSBWiQ8gSBwgzdPHA+OIQwWwwFrAjoCBwsBAQMJhyOKe4FLAQE
x-mailer: git-send-email 2.34.1
x-amp-result: SKIPPED(no attachment in message)
x-amp-file-uploaded: False
x-gm-message-state: AOJu0Ywo/pJJXYz3S03JSMTNKhLv1tiswCXr6pXjVHhrQw91/HXfklWb
	CDjv8caEondTypa/XSsHXZbH5rcjTIRtnxUK20flzvKjCX95Lu8lds1BrcHp9UoAyhxa/+o6rsX
	N3rN/cG5Gpx5n5Z0xGFjLRyzi6GcYRoC35ajoS5O7ar18UUrLft1T59La5n6/LnKU4RwsF9o/q1
	Ouu2I=
x-received: by 2002:a05:6a20:9190:b0:34e:e0ba:7bf with SMTP id
 adf61e73a8af0-353a13a8e4dmr15478583637.1.1762843153952;        Mon, 10 Nov
 2025 22:39:13 -0800 (PST)
x-google-dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762843155; x=1763447955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:dkim-signature
         :delivered-to:x-forwarded-for:x-forwarded-to:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=539HVCzYtsPJqOodyacxfczakrCXMmx5hlTcSg4yU4k=;
        b=IL/zAZ/zUy3Vcwt35wRroK3a44Rjhky3EF9UpsWoDKlHHq84zJm/C/7++g6SxljVJM
         7Rtl8BfRz4vFhpSypjzl8EjqNWpyCmHSU25gJqIYRKrEyqjfWOOOBWLduvnUH6REUK16
         5fb4y4pEv5JPP49l3YUNtbKdf0qiiN1J3fk7LyI9J6A2ZdIJw7uVdEMl2gQMOlOe1COY
         p9Gp72ZTk/jazAawpJ3U5AA6IPO6qwUOMj7GbTLeimcH1gdzfLRaPvSq3pF7a8TyDbox
         m5XpG9frcZ38maS6mPSKSslGLW6I6zBPtRGC5gKhyJlei3KT7qtOq2SIhgXtFMIrjGEK
         AeYw==
x-google-smtp-source: AGHT+IFnyvDO6og6u0YFAeJesypLmt9qZ8k5II9mY37Op7AflPX2kiUWHuLaWAwwgHYe4YQ6X6SjXQ==
ironport-hdrordr: A9a23:YsYLoK6bcLgJxp0sRQPXwAbXdLJyesId70hD6qm+c3Bom7+j5q
 STdZUgpHzJYVkqNk3I9errBEDiexPhHPxOgLX5VI3KNGLbUQCTQ72KmLGSpgEIdReSysdtkY
 pDU4w7M9HrEV1ml6/BkW6FOudl7f68y4uM7N2uqUtFfEVPQ4FEhj0JcjpzancGJjVuNN4CLb
 K5ovBgmwGLVTA8T+iQJBA+LpH+m+E=
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0;jmr:0;auth:0;dest:I;ENG:(910005)(944506478)(944626604)(920097)(930097)(140003);
X-Microsoft-Antispam-Message-Info: =?big5?B?cTZkZ1hieHJJbTdQMG5WNXEwYUl5MmRoMVZSTWd4N3V5SllxSDhHMHVsL1lsbys0?=
 =?big5?B?MlJ0VE80NmJaUUpvQXlub2M5ZmkyZEhJbis2bVZ2c25reU5EdzNRekx5S05oRzN4?=
 =?big5?B?NUowbTFEMFR3VnFrY1p5N2hwdWNmdTBqdWhDSGlidVY0UWYxMVpiZnJQMDEvcm1y?=
 =?big5?B?dmk0SjJpeHR4UTRLeDBUWDB5V201WE1LTFpZWjd3aGpYZS9Wd3ZpLzdSMTFmbStE?=
 =?big5?B?dXREeVdhTVQzU2x4VWUzL1QxcXVweWV3aElIOWZ2em1BYUtYTE5FRHRFbnEydDNa?=
 =?big5?B?LzArSSt1Mzc4TndObmFGakZUWDM5L2owSlVyQjN6czhzYjJyWWJuWmpndnBnZTlL?=
 =?big5?B?bWZIWGJxdWg4UjdCZ25QbjgyU3NGTHpEMkxBbUhWUmpxQWZGOHpJZyttcFpUQ0dZ?=
 =?big5?B?c1VpWnlNbU0vUWxDV3ZSNndBemRuR2N3WmRXcTVLV2k5cTFhYmVSR0x1cDcwSHdr?=
 =?big5?B?REc1T2FrOG0zblZSQ0xKbXZlWFZvTjQzaGNWUkxrbFl5ak0wWXlRWUNzaHpxaWlm?=
 =?big5?B?RWpBcTVCWHNaa2RJTkEyVC9nckE5cjc0eVozdTlPbkd6M1ZEc0FrVElNVU1HK1Rt?=
 =?big5?B?V25FejA4NCtwb01LVlVoa0VyaVZTWWhINU41QXlqUzRVelYvWlluM0VtbzI2WWZS?=
 =?big5?B?Wi9MQVpLOXFiQjdpeWZ5NDBNVkh4R2tJZ3hCZFBVcFpMVVdEOXd3bzFLOFVBbk9J?=
 =?big5?B?UVo4T3hZY3hCVnRRenJBdDNCTG9IckJaUm4rQ3YycURKR29ZM0wzaFdIbnhCQW90?=
 =?big5?B?Ty9HbmxNUm1MdVFKTUhmZVlRSVJicG9kQWMzQzltUEFEb0l0bnZDTlVMK2E5V2VN?=
 =?big5?B?ckNvUlRlUmUySVZSalUxaE5EbjJnbHJOM3ZxNjdHb0FPcktxb0psWVUvQzhJVHpM?=
 =?big5?B?bjkrRklXNXZ3L1JwbjRUNmk5bTcxSTVrZDB0Y2JrVTUwbk9Gc1NlcHRzZ0Iza1JL?=
 =?big5?B?WXczUjIxS3Nub0IvZHVmY1h4L05RNjlLNGZrODlLaGFwQUVPWHFtMmEvRzlmOXJI?=
 =?big5?B?aFJRV2l5d09KMGlsejNMUm1qcnJXbXdYbVNpcE1xZDlrY1N0VTVGZnlUOGhrVllj?=
 =?big5?B?SkV0NnNxN0dNeUl2QmF0eEJ5ZjhxTkVNM3Y0Wi9qbHZWU0IrOWRmbjJxa2JIMmd2?=
 =?big5?B?bGFka090RnpteXVRRklBWERrV3J0NVFNRE5tRVprUDhUdFhNN3U0MlpMdnkrQy9L?=
 =?big5?B?Z05GZDJOdjk4K0Jxb0UxcDdBUVBFUW9nZnJnanBmbzg5c29MSjA1dURVNXN0RlN2?=
 =?big5?B?MmVab2habWFlUVJTWDNNQUpoNXYwRzlSMFhaZXdmdnRKbVYxckJmSkUvNjdxOTVw?=
 =?big5?B?bUJvUmtIY0d4bEIwanl1NDNaWXpkWnZnMS92dnVlMUhaR21jTWdGZVVoTXdPZUhj?=
 =?big5?B?UGNyVDE2YTVjbXhndTQ5dXdOd05GSGpCQ3RaSHN1bUVKemJodk8vVUszK2lyeWtD?=
 =?big5?B?Z2ttWStrd2dsamtQcEcvWVVmM1RoZ2tqWWluMkprdzQ2ZjcrdkdnTWN1amV6UmFs?=
 =?big5?B?TUtrZllldmd5UHJBV3F0elZxQnlPcHAzT3Q0TUVjcW5EaTJUYW9PMlRPbkhhbkVl?=
 =?big5?B?aGptTHQxdGs5dmNFL2FIdG9WY2ZQMHl4azZDaDZRWTRndjZZZ2VhU1RsbVo1RlpF?=
 =?big5?B?K3Q2VFNrcVlEVHRmeGZmQk43T3d6VGxMZEFaVmRqb0hJeHFGbklhMzFLaHhkRHJj?=
 =?big5?B?OGdoNUJVelAwNVNaUUVnK1hSVEdwaHMzQjdWNnkxMHNjS2E5UG1pWnN3UW0rSXA2?=
 =?big5?B?VjduL3JjRVFQRi9aMmZ6L3hha3lUVTA2K3B6Vm9JNWJZN0pQVFMybFVkYWtIMDRl?=
 =?big5?B?S041V3EzNk5CVytXMks4Yml0RlJiN2FWVHpMVWx0em9RVG5MRWJsbHBrQWE5S2Yw?=
 =?big5?B?TEp2cUwxQStxRG5QU2l4UjVGWEUrZk9JY3VDSkxNKy95b1d6T3VxQnVoWFJocDFB?=
 =?big5?B?UVA3TWI4eHpSSFVodWc0RjBjZW9xd0pHQWtNSEdpN2tndUoxQklzQVdRc3c1MUlP?=
 =?big5?B?WHUyVjJIUjV4OWhhYTJhYUdodFBDbXhBREVxTkxnNHM4SXJnbUIvb3ZsVi96NmRL?=
 =?big5?B?dlNUeEw0bXl4VUdML1IrWEhEY1Z3RGJrWndvU2lCYktIMGhDTnhsNjRCVllPWWlw?=
 =?big5?B?QklvV0IvTW9zRGd5L294alRLb0E0NUhPQ1FvWDg4SXZXNlA0Mm84bUJON3pJUkZ6?=
 =?big5?B?U0w0a3I0SUhNV09hVGJRUlVwdXJySFJYR3pDcXZ5alNwVlEwUytuem1uTFRLdlRw?=
 =?big5?B?L2V5TC9MMURQT1N4Q0VUMDlzYnNXcmlOTGQxQ2plTXFzVVlKL29IN2RudGJNblhI?=
 =?big5?B?NGNwNERxMWM1cSt5UTUwNlMyaHF6dHlwR2dQMFpnQ0RlOG1mY1FESDlHLzRoWDdT?=
 =?big5?B?UVhmRHR2c2JtY2VOZUh1QjhvaXJNenhkdys2QUhDdXVjWlF4SFhKRXJQTDF2RFJr?=
 =?big5?B?ZWZzMkpwODl4emVzYVp6NXBzcHc4NVJWZFgzNGwycVUwcmNiT0Q2VSsrQXZRazI4?=
 =?big5?B?eTRaeWtZVEg0S1dnWVdxWUsxRVlmZnhGK1NPU25WWjBPU1Fxdk03YUFjUEZLL0FI?=
 =?big5?B?a243SDdRMmRYaEplR2gwK0FHaVN3Q01ETG92RWV4RlNlU09saEJMN3dlZUM4MTdm?=
 =?big5?B?clBwWkZyMDR5NkZKZTJZUks4Rms4Y2kvUHAyazMzdVpKZ2MvZkUwYVBnZGVBMHdL?=
 =?big5?B?SGNxQUtzd2VydjllR3NRK1pEMGp2TDZURWtiRDlldzl3UmVVQXZCNVhaZ2ZmT0k0?=
 =?big5?B?RVZ3bjVoV3pTVndhQVNpMU1FN2ZodjNyV2swRkxzQnNENFRWUlJXM1VLNFAzU29C?=
 =?big5?B?a2RReVRLWWozSnpJd0ZpTVYzN2dCd3I2aDdxeXBXZi8wYyt4L05NV200SzZZT1lt?=
 =?big5?B?QWJuQ3JUTzY4QThvanVhR3BLTzRGK1N2Y0ZsZ3NpRmI4Uy9YSWVGT05OMDRCb0h0?=
 =?big5?B?L2IrSWZ5end5YUJrdWgvNnVUdUV3c3BFZ3R2Qng2c2dUdUxlQ0JjQnlCSEcySWNH?=
 =?big5?B?OHYyUHJLRys3VkMzb1NOSWJtN2xCMzNDTThJMlAxWStvN2VPaDlEZzloYm85Lytz?=
 =?big5?B?QWRUMGVuaGdZalRzeTh3VExZbWtORy9YRVl0amhuODJMN0RndDliUG1vQlREWkw2?=
 =?big5?B?Q2VFelhHa01rQS9EdDQ0dVRpKzNkMmJPSFVORFpuUG1jTVVXYkJUMWtOSnlUVmJi?=
 =?big5?B?eVQzT3h0M0dGVHo5OVVBelZQUlZVNWRsdEZiZE9xRUo4UDNGdk1yUDkzZ3hGZnJ4?=
 =?big5?B?WGg4N2JNT0ZFbkM2U2ZtQjlSTHZDeC82MHNhdnMvV0hiUlNCY0lMckNKOXZldE9k?=
 =?big5?B?L2huOXp1REFUTTA2ak1NTDFoS1hqdnAzampNSytYb2JJR2t0NEJTYXVnV1lCSm4r?=
 =?big5?B?eE1SQ0gxdjJBTXlRdDRmUitxRlZxdTM1bmZ4eUs3Wkx5OEExYjdPRHY5RzV0cGVY?=
 =?big5?B?cXA0dUs2VGJkbmpaUXVIOHlTQTJKK0ZkN0xNWHhpWHM3K1hYZHdmd1BPRFpSSDUw?=
 =?big5?Q?t7gfEd4IpZNKJ8BF?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

RnJvbTogRGFuaWVsIFBlbmcgPERhbmllbF9QZW5nQHBlZ2F0cm9uLmNvcnAtcGFydG5lci5nb29n
bGUuY29tPg0KDQpJbmZvcm1hdGlvbiBmb3IgdG91Y2hzY3JlZW4gbW9kZWwgSEtPL1JCMTE2QVMw
MS0yIGFzIGJlbG93Og0KLSBISUQgOkZUU0MxMDAwDQotIHNsYXZlIGFkZHJlc3M6MFgzOA0KLSBJ
bnRlcmZhY2U6SElEIG92ZXIgSTJDDQotIFRvdWNoIGNvbnRyb2wgbEM6RlQ4MTEyDQotIEkyQyBJ
RDogUE5QMEM1MA0KDQpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgUGVuZyA8RGFuaWVsX1BlbmdAcGVn
YXRyb24uY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQotLS0NCg0KIGRyaXZlcnMvaGlkL2kyYy1o
aWQvaTJjLWhpZC1vZi1lbGFuLmMgfCA4ICsrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaTJjLWhpZC9pMmMtaGlkLW9m
LWVsYW4uYyBiL2RyaXZlcnMvaGlkL2kyYy1oaWQvaTJjLWhpZC1vZi1lbGFuLmMNCmluZGV4IDAy
MTVmMjE3ZjZkOC4uYjgxZmNjNmZmNDllIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9oaWQvaTJjLWhp
ZC9pMmMtaGlkLW9mLWVsYW4uYw0KKysrIGIvZHJpdmVycy9oaWQvaTJjLWhpZC9pMmMtaGlkLW9m
LWVsYW4uYw0KQEAgLTE2OCw2ICsxNjgsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBlbGFuX2ky
Y19oaWRfY2hpcF9kYXRhIGVsYW5fZWt0aDZhMTJuYXlfY2hpcF9kYXRhID0gew0KICAgICAgICAu
cG93ZXJfYWZ0ZXJfYmFja2xpZ2h0ID0gdHJ1ZSwNCiB9Ow0KDQorc3RhdGljIGNvbnN0IHN0cnVj
dCBlbGFuX2kyY19oaWRfY2hpcF9kYXRhIGZvY2FsdGVjaF9mdDgxMTJfY2hpcF9kYXRhID0gew0K
KyAgICAgICAucG9zdF9wb3dlcl9kZWxheV9tcyA9IDEwLA0KKyAgICAgICAucG9zdF9ncGlvX3Jl
c2V0X29uX2RlbGF5X21zID0gMTUwLA0KKyAgICAgICAuaGlkX2Rlc2NyaXB0b3JfYWRkcmVzcyA9
IDB4MDAwMSwNCisgICAgICAgLm1haW5fc3VwcGx5X25hbWUgPSAidmNjMzMiLA0KK307DQorDQog
c3RhdGljIGNvbnN0IHN0cnVjdCBlbGFuX2kyY19oaWRfY2hpcF9kYXRhIGlsaXRla19pbGk5ODgy
dF9jaGlwX2RhdGEgPSB7DQogICAgICAgIC5wb3N0X3Bvd2VyX2RlbGF5X21zID0gMSwNCiAgICAg
ICAgLnBvc3RfZ3Bpb19yZXNldF9vbl9kZWxheV9tcyA9IDIwMCwNCkBAIC0xOTEsNiArMTk4LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBlbGFuX2kyY19oaWRfY2hpcF9kYXRhIGlsaXRla19pbGky
OTAxX2NoaXBfZGF0YSA9IHsNCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBlbGFu
X2kyY19oaWRfb2ZfbWF0Y2hbXSA9IHsNCiAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJlbGFuLGVr
dGg2OTE1IiwgLmRhdGEgPSAmZWxhbl9la3RoNjkxNV9jaGlwX2RhdGEgfSwNCiAgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJlbGFuLGVrdGg2YTEybmF5IiwgLmRhdGEgPSAmZWxhbl9la3RoNmExMm5h
eV9jaGlwX2RhdGEgfSwNCisgICAgICAgeyAuY29tcGF0aWJsZSA9ICJmb2NhbHRlY2gsZnQ4MTEy
IiwgLmRhdGEgPSAmZm9jYWx0ZWNoX2Z0ODExMl9jaGlwX2RhdGEgfSwNCiAgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJpbGl0ZWssaWxpOTg4MnQiLCAuZGF0YSA9ICZpbGl0ZWtfaWxpOTg4MnRfY2hp
cF9kYXRhIH0sDQogICAgICAgIHsgLmNvbXBhdGlibGUgPSAiaWxpdGVrLGlsaTI5MDEiLCAuZGF0
YSA9ICZpbGl0ZWtfaWxpMjkwMV9jaGlwX2RhdGEgfSwNCiAgICAgICAgeyB9DQotLQ0KMi4zNC4x
DQoNCg==

--_003_SEZPR06MB67427DD182968980F4C93C08E7CFASEZPR06MB6742apcp_--

