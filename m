Return-Path: <linux-input+bounces-15997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E6C4C6AB
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 09:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3E40188C702
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 08:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF01279787;
	Tue, 11 Nov 2025 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatroncorp.com header.i=@pegatroncorp.com header.b="hYi3fPI8"
X-Original-To: linux-input@vger.kernel.org
Received: from ms.pegatroncorp.com (ms5.pegatroncorp.com [43.251.60.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20ED224B15;
	Tue, 11 Nov 2025 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=43.251.60.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762850116; cv=fail; b=cNL9226MHlJyYjAMIMJGP3MVnoa9bnV2/yJIt5eWA/sFP4hZQ9ocEoLNyKcUqGztlCcjEk1sOofCuEVtATx0J2RxPUySxsYc5RRVJeObwVmyP9eHwg4XL2oSS361KdzDuiZCOlK07ldHerTDAiPk8RuTeWOTmxSAVNCLORjey1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762850116; c=relaxed/simple;
	bh=gFlyatsR0cjkNgHtWOOPqtkMINMQmWuVj3l3NZ0vVkg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7PteoF3/TBJZIGTtpukQtg9JcAWVuSHroV57Kl/SN/PkE3ecmyx4uhq63ZCEorTkhZDVc/MS1/FEI2KXnt9O6YXoQ+pPrz+SaiLTg1nqJGSM9BdIR/BliGYhKbs2ZgTirirS1YOUFoIfQQr1LHDMbdommrCw57VkOdMG/qVsE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pegatroncorp.com; spf=pass smtp.mailfrom=pegatroncorp.com; dkim=pass (2048-bit key) header.d=pegatroncorp.com header.i=@pegatroncorp.com header.b=hYi3fPI8; arc=fail smtp.client-ip=43.251.60.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pegatroncorp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatroncorp.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=pegatroncorp.com; i=@pegatroncorp.com; q=dns/txt;
  s=pegatroncorp; t=1762850114; x=1794386114;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gFlyatsR0cjkNgHtWOOPqtkMINMQmWuVj3l3NZ0vVkg=;
  b=hYi3fPI8JrmAVhUdpn2Gsf5KgCSzlVZsTwvU1OmG3FGdFnqWBNqwgMtJ
   z0n8yhzBEScBkn8yCyaft6tZAURYOJz9k+Df5d+lBRPulfkt8xYchHNbX
   12l6wrEwDaGNKRAM/GjA3s5UV+OA0foMNboW9YKwFb63mOaP9tZGFeu8E
   IxlEAIAFC31GeiDB+Xp77c3glyJL9YZpHZ0gpGqSm4YpH89m7h1NXddL4
   EUWcW5KIoS/n8nqTUQ90+zja5Z3+5J0RXGjMZMPHmZJGUhVsy3MzlfNYc
   j+sT0eW9Ng+BRecgHR7ONmMcXMxWlBGilYptmchqPAP30DueDm93wP8zC
   Q==;
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
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:35:11 +0800
Received: from PTW-EX-DMBSC08.PEGA.CORP.PEGATRON (PTW-EX-DMBSC08.PEGA.CORP.PEGATRON [172.18.147.33])
	by PTW-MSE-AP03.pegatroncorp.com with ESMTPS id 5AB8Z5sf018460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Tue, 11 Nov 2025 16:35:05 +0800 (+08)
	(envelope-from Daniel_Peng@pegatroncorp.com)
Received: from PTW-EX-DMBSC12.PEGA.CORP.PEGATRON (172.18.147.36) by
 PTW-EX-DMBSC08.PEGA.CORP.PEGATRON (172.18.147.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 11 Nov 2025 16:35:05 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (40.93.129.98) by
 PTW-EX-DMBSC12.PEGA.CORP.PEGATRON (172.18.147.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 11 Nov 2025 16:35:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtB8PN5+M+cKwepMn0ulsSvgwwtTlBxTQJLKqoU0ZKraNB972NqOXXsh3u/W+MvZ/6NQS0N/UqeeX+0ySLLkuJ116iUt1C9ekkjyiuahrfOpNM0NoHN/z1QYuDqZe3BHauFH4kw79fhY+n9oh8C23XoierLyrp2GEY5PFH21WqVYzwTgWtJyCFmCLeNY3BKf1MKUjtbKI7fw/vuz/VKMbDznodiYfJ3Zx8Qd2DWLX5V3ZMVWu3rokafzvhiXrLHHGVqJ+UP38CAnb0xGH2PRL7+CQWILMvygEEBxbMA81BWWltkfhlCdCspZoY2+3AWAzqLIW4amtTdFibL0Wt4qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFlyatsR0cjkNgHtWOOPqtkMINMQmWuVj3l3NZ0vVkg=;
 b=sA/a53wuZrs9M9IuEeUKpvKPKJhkJvMce7wKTYjGlZECEIy29n+vhObAxx4vW93SIxdGV6ODj9Lat7LOmH1eTd0iwKP/MfziprRmyETkWQQ86W2/voV56O8V3NdQAqs3tDH8t2u3514LHoiksGkbuPclYH+aNxIyH7z39MvRVULP1xQgc8YXGaH6jyFTO7P9R1hyC2ibPyKQCjfRjEO0U0NUZDR+punEoUER7UdkQy5C+ZkrZQHFvw83R/RhqjAjIvWBEcaQbfElSHd1ULnEZJql6dSBCV0zuqDDdOziQVds29tVb/u/v5NmKMLoBegtgP9kh6h8geFgIRZUSwJEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pegatroncorp.com; dmarc=pass action=none
 header.from=pegatroncorp.com; dkim=pass header.d=pegatroncorp.com; arc=none
Received: from SEZPR06MB6742.apcprd06.prod.outlook.com (2603:1096:101:183::9)
 by SE1PPFDC587DD38.apcprd06.prod.outlook.com (2603:1096:108:1::42c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 08:35:01 +0000
Received: from SEZPR06MB6742.apcprd06.prod.outlook.com
 ([fe80::7915:c9db:be14:6bc8]) by SEZPR06MB6742.apcprd06.prod.outlook.com
 ([fe80::7915:c9db:be14:6bc8%7]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 08:35:01 +0000
From: =?utf-8?B?RGFuaWVsIFBlbmco5b2t5Y2a54WcX1BlZ2F0cm9uKQ==?=
	<Daniel_Peng@pegatroncorp.com>
To: "krzk@kernel.org" <krzk@kernel.org>
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
        "daniel_peng@pegatron.corp-partner.google.com"
	<daniel_peng@pegatron.corp-partner.google.com>
Subject: RE: [PATCH 1/2] dt-bindings: HID: i2c-hid: elan: Introduce FocalTech
 FT8112
Thread-Topic: [PATCH 1/2] dt-bindings: HID: i2c-hid: elan: Introduce FocalTech
 FT8112
Thread-Index: AQHcUttn8N3KJjLitkag/BW4IMO4TrTtFeiggAAMxICAAAJVgA==
Date: Tue, 11 Nov 2025 08:35:01 +0000
Message-ID: <SEZPR06MB67428F386E3E56D0710AC7EBE7CFA@SEZPR06MB6742.apcprd06.prod.outlook.com>
References: <20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
 <CAEXTbpc9=Gt7QrFrtV60+EvKdmBGsVpJxg7yYaa6HfuGGB3OqQ@mail.gmail.com>
 <SEZPR06MB67427DD182968980F4C93C08E7CFA@SEZPR06MB6742.apcprd06.prod.outlook.com>
 <28eea826-09e4-4b0c-8845-50d4cf9bac7e@kernel.org>
In-Reply-To: <28eea826-09e4-4b0c-8845-50d4cf9bac7e@kernel.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB6742:EE_|SE1PPFDC587DD38:EE_
x-ms-office365-filtering-correlation-id: 5b7da269-d51f-4368-9c58-08de20fd34dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?MTlYNU10L3pzeWxnU0FOQWR4MU14dHlESjlzVDdZZ2t0d1RjV1RtdHhXZ0hB?=
 =?utf-8?B?NnNGSlRmcW1RZ2g1TDd0MTBDc0NHT2drNjUraUJuaWpqU0szKytrNmhQMXhM?=
 =?utf-8?B?SjdtTzRDdlJnWXZtT1JlK0RKYmpxVktxa3pJTzc3VGV5cWNuaXlENVd3SUVM?=
 =?utf-8?B?T0pHZDVMRUUyTzNjVWp1aVNzTDh4VWtTWVNadzVNM2liKzFhaXpnalJPbU8w?=
 =?utf-8?B?dE9sbzRzOUlOWmxCcWtVZ2pIbE0wN1BQMDRiRVdGWGVRd3RWcjZnWHQ2dGhU?=
 =?utf-8?B?VWtZNllRNXcwb0FteXlLMi9PT0svclcvd25hMkZpbUx0d3JBejZOWmUxQjRv?=
 =?utf-8?B?dXFzbC9BZ2pMbGJIUFJCQUpSTGdGMFl0eUZ6UGk5WjJ3WWE2RTJQNzBhRWlC?=
 =?utf-8?B?NWdBZUZPd2NWcER1VDhHNU9INGpkUk1uaDhXd3BLN29SbGVacU1ua3E4Qlhu?=
 =?utf-8?B?NnVEdzNKZlF5KzZhQTdtMFBQZVIrdXZ4emFqMStLNlNPQldDcDdoVkdtZ2VC?=
 =?utf-8?B?d2daUHp1QWMrV2RJZ2F3RndWTjRDZTBCS2FQY3lJNXlkZXBvcHJNMWkyQUtQ?=
 =?utf-8?B?WkJSR2xPYTVlSkhXNEx6emk0TU03T29JOThVZm9iSWFGVFo0Tkpxak5Wc0Fo?=
 =?utf-8?B?K282ZVhhU1MxbXZOTmk5bzY2NktOVHJ3d1ZBcWJVa2VCNmNlUnVYajVBcnJE?=
 =?utf-8?B?bEtscFExbkk2V2trbnVNUWxpK2ZTdlB1aWYzN05IZStXQkZ3d214VU5ieHBD?=
 =?utf-8?B?enZveWYvNDYvMk10YXk1c1ArWGRRaityQ1lNL0gxU2tEYzdFSjNYQkRiUUdH?=
 =?utf-8?B?OWRycTFFalZjaGFaWjdmdFR5SkVQeW5BWmxvWnhOK1BBdlpuSlFwM2tBa0pa?=
 =?utf-8?B?ejM2elJWTmRYbWdlZHJhT0ljRjlkU2tPYUducWFLRkpnZXVVdlVWZkpkSjhn?=
 =?utf-8?B?aTJIVm1waFJzaEw4bkZrRTJWdUtSd1BkdmpFNDQ5Tnk0enNiRmY0Nm1JZzFq?=
 =?utf-8?B?YzRLUXNNRHh5eEo4bjRqT2FTaU9xWlpwa01QeVVhb21VcHVPdjZXRjZ3bXVK?=
 =?utf-8?B?dXg4bWEzZkZaMnNqN25zdldpWGpQQnU0cEhIbnF5WTZ2OXJnU0JKQ0d3NEcz?=
 =?utf-8?B?OW9wWjdSMzBYTU9tNjJId3NHY0FYV0hVWmROWEh3TnI1ckx3L1diT3N0VG1G?=
 =?utf-8?B?ZXRNWExXSC9CVGdJb3lrSy9JcytGbFdYV2todE9hQ0RVVlJlNkJCc3Jpdmxm?=
 =?utf-8?B?ZElrN2hiSHlsbGdjdWx5K1RDUEs0eVBtT0YxajdTTEI4L2wveHBNUjBwQTh0?=
 =?utf-8?B?YzJPSDgrc2N3UjhKdDd1SjMxam45UEJSZGMzNE4yNlBzTTI1dlN4VlhyUm44?=
 =?utf-8?B?V2NoTUpsSDdwc2txMlhjR2FQakJrN0FaNzRRNlhUY0VSSVB3aC9PY2xPL010?=
 =?utf-8?B?amYvTVROZ2loRXJlUU9wLy9uN2RoTU00bFNlSVBmak80UFhRMStLSHdpMDA2?=
 =?utf-8?B?VTRPWk1mWUlBd3c0cEYzUUNQakRnWENxenFOamNoeFoyRUtWc3VRdmNKQkNH?=
 =?utf-8?B?Z0xnMXFJOGNqMGlHdWxDWHZhVUtEeHNVUXZnUTREVXVlY01HRjBYcVJsbEkv?=
 =?utf-8?B?dW1USEFpYVorYVpCT1BDNXlqUm0za0VHSkRBN2lpTFgrSXhxYTZhZzVycU4r?=
 =?utf-8?B?TkcyTlNmdXdDTVJlNmk2MHN5U21nQmQrWXNvZlpoMTZGSkN0UUE5eHBNL3Ra?=
 =?utf-8?B?blVYb0g2VzlDWjZqVGczMTM1SHVxNXFXcSsxc1JCSklwd1VOOGN1WFU3L0I2?=
 =?utf-8?B?dTVzUThyVlMybWlreFBlalFSMmMwclAyUzVwSC9ZS3FFb3A5cWRpOGpuRDRK?=
 =?utf-8?B?L2xMQU1aMFlQc3pXUTZ2T0JIUkw4WjhXTmZNYVZ2cENUSUViYkZGYmEybGdp?=
 =?utf-8?B?OENHc210ejFaZXBZRGV1d3NQRjUvdmFmMzNsUXcwME1mdy9DNFR0a3NQY3lh?=
 =?utf-8?B?WDkwK1lIamI3bUNSSVRwcnZLMmRkS25ZZzlMM2dBbWkybHhwQ2tXZ0V0RWNp?=
 =?utf-8?Q?7miEqE?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6742.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm9BamdIWFRWUlNEcGpNbzQ1QTc4TmFSY1VRaWk2OXlEbXFnNlU1WFExMVND?=
 =?utf-8?B?eTJkT1FjNTRhL1FuclI2NEZubU5ycHhNTW1EblZoSlVoRjMrTnRHV3VqUXdl?=
 =?utf-8?B?TDVVbXZmNkgzdGVnNm9mZjF1NkJTSis5ZjZKWVlpUWZHVmRmNE1mTEw1RVlN?=
 =?utf-8?B?ckV5S1c1MmJaZTlMNFAvME9BSXUreVFhSUVmNDlFaEQ1VWJCUWxGK0g3dnlu?=
 =?utf-8?B?UzhkOFV2eEo5OXgyejFRbFBsVjVRTFZvS3hWbFJ2YTlPNFpiY1RvYjd0aWpQ?=
 =?utf-8?B?VXJXWEYrU1NnYzZQaXVhbU1qUlp6VzgwRGNyUDdxUkRwamFVNVIrWm1hN3FD?=
 =?utf-8?B?R201WmROR0lwWEMvcWVRY2RtN3o1MFIrb1JGNXg0b2haS2swUWg2WUJ4d3g2?=
 =?utf-8?B?WWcwSjBxT2UyV2ladldGOWsybDlPelpocHlTb3oyaFA3c3J5dHUzOGttaG15?=
 =?utf-8?B?Vnc5SVNRb2UrWmdiVXErL0o3RHJPbXA1YXdVNG85SkF0cDNJaHgvL1J1QmNj?=
 =?utf-8?B?UDBBdzZZQ1liRTB2MENEMkVCMkl2YlZBNTZZbE5PY1AxZDNYUnNpWGVpYjcw?=
 =?utf-8?B?VS9BUGpLU3J6YlJEV0FMZWVpb2RvcEtQcDQrOGZLeFIwRWZrTWJwOHZoTmJW?=
 =?utf-8?B?ODRVbVRkWlh3NGxQcS9pSG9OZTRZd2puMHVkTmVMUlJIbXhiYUZ1UHBZMHRl?=
 =?utf-8?B?dXZLc3VCM00wK1RHbXoxZHAyRVNyM1BKNnoxTW5aYnFDRXpIeEI4RElEQktp?=
 =?utf-8?B?V2o2MzN2N1dFQlNLcHFRT3NnQWIwOE1kbm9wd1ExZTNJendYeHIwenRCQ0I0?=
 =?utf-8?B?N05NSEc2NnlaclN4LzRwZVlIQVdVSGJrOXNDTjNzMkU5U3FjckFtMmNwY1Ns?=
 =?utf-8?B?TEQ0R2tycFpGcFk4NDVmb3J3a1hvV1htbkZWekx3NjBORWF3elU5ZVJZZlNz?=
 =?utf-8?B?QVluME1CZTlqN3dqM0hZQnFhaUdiWEFMU05ISlBYam5HRWxZanhBVWwyOTJH?=
 =?utf-8?B?a3RGYjJIVmp3NFYrYXNJSG1CNktDR2pSeGswUUtjSEZrNmV3YzNDcUhSNmtv?=
 =?utf-8?B?RUVJc1QxdnZUSGpWZ01KT2s0d3VtcTMyRnczTkpuZUdXK3FTeDZ0K0JvWkVP?=
 =?utf-8?B?Uk5pcXJ0c3ExamlNTUs1WTlDM29iQUkwREx5ZG1ndnlmMWsvNFJqbXBPSWY4?=
 =?utf-8?B?dlU0clM2Y2k1dHNMS3FwbXJkOFBKekIxUmxYSGw4cTB5VnlwcXlhK0ZFVEll?=
 =?utf-8?B?b1pPWDdVdTgvRDcrcXhNY2IySUNkcU1BeHhzV3AvZE1LK0RXckRXaytnZFps?=
 =?utf-8?B?TUFPOUdFRzlEZ2pMOFpYL1VoUmpuY09sdnJKVmd0MU1jOWxCT0xLbHRUb1Uw?=
 =?utf-8?B?U05WVE9JbkRRRFptdElzajkvTE1XeW14ZHp4SmxWald0enk0Y3RIUTIrN1Qw?=
 =?utf-8?B?TGhBTU5OdWtIVkRCelB5ZGdvWEtwZElhWi9XZWlIQ1lGZFJ1dkpTbEFaRnds?=
 =?utf-8?B?YVROWkxXSmdSV3NMUGNLcDE3RGl4bmpRQ1Q3VTJaTm9xQ01hYjdmMTU4WjFQ?=
 =?utf-8?B?bHZ3cUJDZm1iMEdQUFBJWDlFR2NtbVF5SVVZWnVyUVp0aVJsZ3lCdDZWdmFS?=
 =?utf-8?B?UzMySmhSTTNsSm1US2FSL1B1VzFab1dLSWxIK3ZZZmNjcm9qWU5DeUxvaGlM?=
 =?utf-8?B?YkFNOGpnNDVXNk5XdjlJTHhWZmk3WjdzOWZkOWpmSEZ2M3MySVlWd0ZUY3h5?=
 =?utf-8?B?cE53QTl3YmFpZ1lSdW9vQXJDV2pJaHc0WkVPOUpyQ2VXMk5xeWMwTkY1NzVw?=
 =?utf-8?B?VkEwOU9wWEd0WXZJZTZhWm42S2N5bE0vbVpmTm1LeHhxY21yRGt2d0h1ZG5n?=
 =?utf-8?B?UmZVOTJsa2RDQ0UvV25wVnhzaWJlZlJnOEQrVkNPZXA3OTAvdjArSlRFWkFT?=
 =?utf-8?B?dzJwR0k3R01rSDBUc05YaTZ3aXZYVjBXRXZ1cVAwYkpuYWxUcnlKdzZmS0hq?=
 =?utf-8?B?Q3RZcTREUko4d1ZFY043VkR4dWxvMjZ6SlV6ZEFHTTNnTXVOMVBKNzdORlRx?=
 =?utf-8?B?cW5QVmlxVXZrT0o4b0l6QURMejNLNDRKdlJ4RW5WL0tXQnBzQU9JQWoxY3dF?=
 =?utf-8?B?SnBsdHgxY0tBWWpFVHRrWEdLNVhwWEZwaWovNWY5WUVLWUR6ZjNISzdaTTMx?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6742.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7da269-d51f-4368-9c58-08de20fd34dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 08:35:01.8449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ab9aaef-2fe6-4d66-a5f2-129a6671846b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivZ+UepnJM1WDvE3l3wp7h3MyiHxJMnnIc9fjo9jM58m9SaYl2N8fGsjp0lJOQa0ObD5vkKZ/J1P3cgEwJSSyNuiApsOMqNtxo/m6mASdHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFDC587DD38
X-OriginatorOrg: pegatroncorp.com
X-MAIL:PTW-MSE-AP03.pegatroncorp.com 5AB8Z5sf018460

UmVtb3ZlIGFkZGVkIG1lbWJlcnMuDQoNClNvcnJ5IHRvIHNlbmQgZHVwbGljYXRlZCB0aGVtLiBU
aGlzIGlzIG15IGZpcnN0IHRpbWUgdG8gcHJvY2VzcyB0aGUgdXBzdHJlYW0uDQpDb3VsZCB5b3Ug
aGVscCB0byBjb25maXJtIGhvdyB0byB2ZXJzaW9uIG15IHBhdGNoZXMgY29ycmVjdGx5Pw0KDQoN
ClRoYW5rcy4NCg0KQmVzdCBSZWdhcmRzLg0KRGFuaWVsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBrcnprQGtlcm5lbC5vcmcgPGtyemtAa2VybmVsLm9yZz4gDQpTZW50OiBU
dWVzZGF5LCBOb3ZlbWJlciAxMSwgMjAyNSA0OjIyIFBNDQpUbzogRGFuaWVsIFBlbmco5b2t5Y2a
54WcX1BlZ2F0cm9uKSA8RGFuaWVsX1BlbmdAcGVnYXRyb25jb3JwLmNvbT47IHRyZWFwa2luZ0Bj
aHJvbWl1bS5vcmcNCkNjOiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5j
b20+OyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IExLTUwgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IEFzaGVyIEh1YW5nKOm7g+mAsuWN
l19QZWdhdHJvbikgPEFzaGVyX0h1YW5nQHBlZ2F0cm9uY29ycC5jb20+OyBkYW5pZWxfcGVuZ0Bw
ZWdhdHJvbi5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbQ0KU3ViamVjdDogUmU6IFtQQVRDSCAxLzJd
IGR0LWJpbmRpbmdzOiBISUQ6IGkyYy1oaWQ6IGVsYW46IEludHJvZHVjZSBGb2NhbFRlY2ggRlQ4
MTEyDQoNCk9uIDExLzExLzIwMjUgMDg6NTAsIERhbmllbCBQZW5nKOW9reWNmueFnF9QZWdhdHJv
bikgd3JvdGU6DQo+IEhpIFBpbi15ZW4sDQo+IA0KPiBJIGhhZCByZS1zdWJtaXR0ZWQgdGhlIDIg
Q0xzIHRvIHVwc3RyZWFtLiBQbGVhc2UgcmVmZXIgdGhlIGF0dGFjaG1lbnRzLg0KDQpObywgeW91
IGR1cGxpY2F0ZWQgdGhlbS4NCg0KUGxlYXNlIHZlcnNpb24geW91ciBwYXRjaGVzIGNvcnJlY3Rs
eS4NCg0KDQoNCj4gDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIERtaXRyeSBUb3Jva2hvdiA8
ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4gDQo+IExpc3QgeW91cnNlbGYgYXMgdGhlIG1h
aW50YWluZXIgb2YgdGhpcyBiaW5kaW5nIGZpbGUgaW5zdGVhZCBvZiB0aGUgc3Vic3lzdGVtIG1h
aW50YWluZXIuDQo+IFtEYW5pZWxdIFdoYXQgeW91ciBtZWFuIGlzIG1haW50YWluZXJzIGluIHRo
aXMgZmlsZSBzaG91bGQgYmUgTWUgDQo+IHJpZ2h0PyhhcyBiZWxvdykNCg0KSSBkb24ndCB1bmRl
cnN0YW5kIHdoYXQgaXMgdGhlIHF1b3RlIGhlcmUgYW5kIHdoYXQgaXMgeW91ciByZXNwb25zZS4N
Cg0KVGhpcyBpcyB1bnJlYWRhYmxlLg0KDQpQbGVhc2UgdXNlIFNUQU5EQVJEIEVNQUlMIGZvcm1h
dCwgbm90IHNvbWUgb2RkIE91dGxvb2sgc3R5bGUuIFdlIGRvbid0IGFjY2VwdCBoZXJlIE91dGxv
b2sgb3Igb3RoZXIgY3JhcHB5IHdlYmNsaWVudHMuDQoNCj4gDQo+IA0KPiBUaGlzIGUtbWFpbCBh
bmQgaXRzIGF0dGFjaG1lbnQgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBpcyBjb25maWRl
bnRpYWwgb3IgcHJpdmlsZWdlZCwgYW5kIGFyZSBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGlu
ZGl2aWR1YWwgdG8gd2hvbSB0aGlzIGUtbWFpbCBpcyBhZGRyZXNzZWQuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb3IgaGF2ZSByZWNlaXZlZCBpdCBhY2NpZGVudGFsbHks
IHBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseSBlLW1haWwgYW5k
IGRlc3Ryb3kgYWxsIGNvcGllcyBvZiB0aGlzIGVtYWlsIGFuZCBpdHMgYXR0YWNobWVudC4gUGxl
YXNlIGJlIGFkdmlzZWQgdGhhdCBhbnkgdW5hdXRob3JpemVkIHVzZSwgZGlzY2xvc3VyZSwgZGlz
dHJpYnV0aW9uIG9yIGNvcHlpbmcgb2YgdGhpcyBlbWFpbCBvciBpdHMgYXR0YWNobWVudCBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkLg0KDQpEb24ndCBldmVyIHNlbmQgc3VjaCBjb25maWRlbnRpYWwg
ZGlzY2xhaW1lcnMuIFRoaXMgbWVhbnMgd2Ugc2hvdWxkIGJlIGlnbm9yaW5nIHlvdXIgbWVzc2Fn
ZXMuIEFyZSB5b3Ugc3VyZSB5b3Ugd2FudCB0aGF0Pw0KDQoNCkJlc3QgcmVnYXJkcywNCktyenlz
enRvZg0K

