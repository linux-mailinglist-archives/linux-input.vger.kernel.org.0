Return-Path: <linux-input+bounces-11302-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB6A71EF2
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 20:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10C6F3AD3CF
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 19:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663F917A2FB;
	Wed, 26 Mar 2025 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="ptWLcIcZ"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazolkn19012057.outbound.protection.outlook.com [52.103.33.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D7C13C9A3;
	Wed, 26 Mar 2025 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743016573; cv=fail; b=XTHR+fbiIvqarFOU9076/clIcQPhGIEehPPvOtXvCk8o0zy5Sd3SY202BD6ngCErEAI+V7L2B3tEhhcYfS4mcRF1gx2FjtmoyS21cqQRj+IDbKSRGvnWAo2qA6j8ldAApP7F+V43juRWcgc9qTQI2G2D2M1E02Ce8XyakIz7XMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743016573; c=relaxed/simple;
	bh=flgOyPNNP+9UZ7GrCLfMTu/QYG/XR/jP5HGu3KlPhRM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GERwg8aMYvBDEorFnGkIaNuJVKHzKlVdOrmAk8wIdydnMpBIi3IX8lwuWDyNjgkfEoDrprNAgxUwfCj01Jg5ozC5TaV4JD9gxLl6MIYsu6EWte+h1V3gDgF86g+9qjL4n8IzDacn6lPxPvSIYXWsWV6fJ4PGeMqA95klgAQNHUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=ptWLcIcZ; arc=fail smtp.client-ip=52.103.33.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSA/VWYsZbYuSvu2Mwie+xJP2+XNCfDw4uFl7zTx+yxD3bU+1rMRjMHVFY7mZAac4merxcYdQxv/aP83ghVNDBt2CvnqaDE4EQ0M9DEA5S8SMqqAC1/y7NQJ2uv1de7UyeDuRYKbQYJH4nWNAQ3EWhD5ML7uixtoGfOLY8T/FIW0/fgCghLL9t6dzm9YRYmLlwy5WG1JwQqgXSdzC1rZVIEzqjw7ZC0rUC11+MlgHzgQQsdBtpTHEl1q0+5sjVTURhT7h3v76rTXz3UyUrA036qt1m33+P9LjcDJM2RffRXn+W4QG0+88uuzJFC8T4eci4pnleAoCU7olqk1dS5CXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vor+PS7NOZuLQM9yD/ejH3iM9F2JK7Kkj/fvL4Kysk4=;
 b=L2mAgeaXsKwqtMV3HC1u+SmGwzP9E8xqLf/qMNtxF1Esiu7coWO99ZXsgFCXMr34Kp7mTrShEvCrFS+wYuSwLefRFcJUeIpWu7R+OOXkNXnoXS0WJHB7lLlRnuX3PJaHLn4plis4msUDRnNqH/FDy4P2jCzaN03ozAgzGsdnGI7DaWAYdRffrB4clq/3rUYjejNLuOJXfhwWfsmTX7UG90G5mRBYtZbzaDCnHPdt/+sqEVtVWgzOgm/pmkQSoscDTkRaWMTBRVkcC4FbCmWLgfr4OyGAA7djL1K5iDdJ/58Wr0n8mmZGFnDufGngFps54qL7cFWwzfO8ANKQf+NANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vor+PS7NOZuLQM9yD/ejH3iM9F2JK7Kkj/fvL4Kysk4=;
 b=ptWLcIcZUD0Z8pL/eCQT/ZAtoGFTgcl+tL+uxzgTTn/pRX6jXYO0zKZzXKRZ/12dVUpohvhnD5povhcf1wQKgoISzFyc6f9PX7f0N1ZLTjtAsppTBF9UbDUzTv8SJSPlkwLw7cRsF6Rn2IwWjqNniW9W4S5hfijTAyP6H8c+7E2jOJDo9w9D9WJn5N3BBKqWnBqCwRuQhitUzuf28T96tfyC6jkzEJ3NmaUYJpAFXKIPzr7pjFQ+/HeyKw78XkUbxYLGSkactX9aZMiLeXa8shzzQWJ3wXQ8R2wrbp/wOLBTOyGj0ksZbT7zoiaQ9ygzVHaSW+523ojLPnh6cOBZpA==
Received: from AS8PR02MB10217.eurprd02.prod.outlook.com
 (2603:10a6:20b:63e::17) by DB4PR02MB9503.eurprd02.prod.outlook.com
 (2603:10a6:10:3f5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 19:16:08 +0000
Received: from AS8PR02MB10217.eurprd02.prod.outlook.com
 ([fe80::58c3:9b65:a6fb:b655]) by AS8PR02MB10217.eurprd02.prod.outlook.com
 ([fe80::58c3:9b65:a6fb:b655%6]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 19:16:08 +0000
From: David Binderman <dcb314@hotmail.com>
To: "even.xu@intel.com" <even.xu@intel.com>, "xinpeng.sun@intel.com"
	<xinpeng.sun@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: linux-6.14/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c bug
 report
Thread-Topic: linux-6.14/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
 bug report
Thread-Index: AQHbnoMyJSSxnBJen0yPctJzXXDeUA==
Date: Wed, 26 Mar 2025 19:16:06 +0000
Message-ID:
 <AS8PR02MB10217E34D616B6F5213660E1E9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10217:EE_|DB4PR02MB9503:EE_
x-ms-office365-filtering-correlation-id: b3bdcebf-60fc-4b5f-284f-08dd6c9aa86c
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|19110799003|8060799006|8062599003|15030799003|15080799006|461199028|3412199025|440099028|102099032|21999032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TiOxDr/NwjAfxSacV8PEK6CxUiDxFeapVRCcjoz9C5H+XxgXYxncUin0L+?=
 =?iso-8859-1?Q?GeWGXNWCeguwqJiJuL1PMAxSimgKTp98LF9hF6zbxp1HGkW5G21hq5bdnY?=
 =?iso-8859-1?Q?Vrans5+HU6rUoBPuClPYjVWtSLXifrveEzecVhdTr0d6CYbiwNjU6IapAZ?=
 =?iso-8859-1?Q?ZPtMPqLZDemoU1KPrZP1oT1jsPSZamJPR9XPgyZwo8RMgUJT4DMT2PsgzO?=
 =?iso-8859-1?Q?bdFJRRsEyUA9EniW/yIIAH/6H4PqQ+Mo0Tk80z27BJK4TNkExk9SKIa9Dd?=
 =?iso-8859-1?Q?Qw7XDrwYCbhNiYK5Tuk92U0ExTOEYGDDA5EHCsVh/6GVVA5TZX0h1jtPtq?=
 =?iso-8859-1?Q?3V3uT2ViauEBVMzLNI5son8++HJB9Kvw7eGMQaYP3L7f/o6JnWJD1NtPGs?=
 =?iso-8859-1?Q?rpJbv1/Xexw05opUmMajb7eoHafTzkul84m3vYgDZEzK+nTf6cC5ZVBLq1?=
 =?iso-8859-1?Q?QWEx+Rb1vgmcaKbmBMvTrEeDYWsGEXVXC3WpqXdmeDaa32IAXMLwdkAbfR?=
 =?iso-8859-1?Q?MnOf4LeHVCTacPimdAeKAUafHcvUSBQcTiLY1Bu2+BH4B9cxuSSYRXEeek?=
 =?iso-8859-1?Q?OY/n1fl+v8VsD++BxN8x+PpluVSHy75YJL3NpkUXFmXnSs5mvili40A7vO?=
 =?iso-8859-1?Q?0oGu6cx6Lbub5UAVdlmmtoNK0YSPgLP6iT6tz8YkEw8V3jwUvLNYB0VCe7?=
 =?iso-8859-1?Q?F0cqS7ecKUFlkve9C/9j56KxdRbJIG7pst2v/XlUQv3gTMhC0cQ1PHzc14?=
 =?iso-8859-1?Q?gw6k96oJ+/Iz2TxyM6ZiU+7I6hCNxWUKdXRZB6zub5BOT54oCY3Ti4AZhM?=
 =?iso-8859-1?Q?xOEWT0GoIp4+q6t9nVKyzI2Uazabfm+mgCq02weCkRLyQZlBhOz5bPtn8q?=
 =?iso-8859-1?Q?FgGcTH3wvty5h7RXF9z0WeWYKxrEzPsOTqwHAIMKrzERt6dlZpJ9oiIgDU?=
 =?iso-8859-1?Q?ut12QH9mEZCKtW9x3RQAV8IPeM8cwcwcn6PPK2n2WWD2Nt8FlnAHoXReYN?=
 =?iso-8859-1?Q?MNxYozxQMkDkldL7kIYwIZsK2A1Ql9/5G+Jrr2yvXezbyzP/ngOAjFSujf?=
 =?iso-8859-1?Q?Vi8NaHP5uDf/WCxTHoeSBgJIQiCHhMi0grf3QGfVXWqh4iwK3fTZkZiYlZ?=
 =?iso-8859-1?Q?T2kK8WVwZz/1R/gKpwwR0JDR5g67rTxYcVqZP3NG/qjbjK5PnfkeYyQFxV?=
 =?iso-8859-1?Q?xdLE67eGuW/GjA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NfBeA1X1TlDy7KYBh01FgG2z9ECaSQY8rnFSI7CYFsXlCXhz6EBEXqMiU2?=
 =?iso-8859-1?Q?pIPPjjBzjavErsmRqA/lp7Xr+0RGYwYqu9QgVsOEusMkxg+1wM3wpQSNMq?=
 =?iso-8859-1?Q?7DZfd3qkntmUYjwsFVhNPoJ2bFNIvOdfJ8roCdsrHVyqBLC5rX4VvoUzJj?=
 =?iso-8859-1?Q?On7YLRLPiTTD5cWIgcyKHseYavr3Q1JuitJD9Jqof4QvJQg4kR8gvSIjKg?=
 =?iso-8859-1?Q?FzAOvkI7JG1Rnpxz/CDm3z+lUJm2179CmdDFzPSbwzuTVt/ZOAVjlATHEn?=
 =?iso-8859-1?Q?jf02QN8QqbyYF1gxdj190KOuTLbYRSbLxemI1BJrtIQgNqiYsBnkhZcXMa?=
 =?iso-8859-1?Q?iZ312mKEDYVUY8WOCpr7V5vfGoLJPBm5POyMq175N/xocDWYhAbusqjLe6?=
 =?iso-8859-1?Q?tyrO6ey43qubhn/Z71/6EVSK2Thu+dpXIY5OVRYs78/mPRTWZcRjMqduiu?=
 =?iso-8859-1?Q?/K3gXfhFMOYbOTY2RuUkTkm5TTOptvVkW0+fuJqPY7U1dSsBNmcm+2cb14?=
 =?iso-8859-1?Q?kJdlUvS36lk7Flbz37w6JYnvv0ZOHpwHkFPoZ8/GyXXESiaHtZoPNqvrJs?=
 =?iso-8859-1?Q?9z6uov12t5Lt8IX1N/9lYPL4rc8JgJHOOYZ/Ph+xxRGGVBMaGPDZDYJWVL?=
 =?iso-8859-1?Q?47vnFYB/e96WwMtA/8vd5+EU9xU67YBK3CwyLxQJEU9kWsPOPfMmbVtnJz?=
 =?iso-8859-1?Q?MsM6ZO0bf2RPayK0G/1+WhoDpddr2bx3E67VvbzYc2MyCHkLS1sN4xtOLv?=
 =?iso-8859-1?Q?XyL0BjDjtT7FcYwTTp5z1jHvGyvzgFMtE4A5/C3xHzgAigv8y2NuVx49+v?=
 =?iso-8859-1?Q?9QdnijU/p49lwXQ5Dm8zanmwjDSJu1JWMlBSe7bnta8xtpSMxg3/VCBFQB?=
 =?iso-8859-1?Q?X+IkEE17SwbOn1T0Mjo8o/5K0kor9aL+DV3CQc6rWhj5xYjvx7x9OewEy5?=
 =?iso-8859-1?Q?EA4JvXTOqcjnAAcf5dZJ+2nSk8c4rMVEgzcKUVj75lu7sVmtkEB21G2t1h?=
 =?iso-8859-1?Q?7RiDc0uXS+4vXi328kkmne4eXT6wl/SOAYvG2J+u0bZW0iPc7EZLsnZe+G?=
 =?iso-8859-1?Q?WqLbkkjdJp7R5SB9ozkKEax7e8l6HpxnSZs58ItbhquwgL3nOkJyWJA9b6?=
 =?iso-8859-1?Q?LszSwrKpFypw08uWL1Y5x0oqe4nfWgAelQV4LYsL0xns/EvdMGfz1NE//i?=
 =?iso-8859-1?Q?ZhtUJaOoD56X91zM11kYLT2cp2bfb4HMM24B7sGcvqB+RSLNcexCAH83oe?=
 =?iso-8859-1?Q?iPQr7h/A5sRnE8cocyUA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7828-19-msonline-outlook-12d23.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10217.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bdcebf-60fc-4b5f-284f-08dd6c9aa86c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 19:16:06.2404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9503

Hello there,=0A=
=0A=
Static analyser cppcheck says:=0A=
=0A=
linux-6.14/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:24: styl=
e: Boolean result is used in bitwise operation. Clarify expression with par=
entheses. [clarifyCondition]=0A=
=0A=
Source code is=0A=
=0A=
        if (!config->sgls[i] | !config->sgls_nent[i])=0A=
=0A=
Perhaps || was intended instead of | ?=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
=0A=
=0A=

