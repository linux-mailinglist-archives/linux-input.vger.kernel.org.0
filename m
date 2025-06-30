Return-Path: <linux-input+bounces-13192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E01AED972
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5C41778A8
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C5A25486F;
	Mon, 30 Jun 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="joFVF5SO"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011024.outbound.protection.outlook.com [52.103.68.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A8253B59;
	Mon, 30 Jun 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278257; cv=fail; b=Ob2kSdKPRMnw7j7nil6ggxLQVgkTyD/aBgjAPiWIZHYTbPv6ZJWtW7XNFoMwL9Hy/bMh8Lp5IK5GACZQwC5pTymAKzd4lC6thzz94Gx8NQo8ieM3kwMFiMQvrPuejkUk7l6u2eEuJQ5ZfnULoyaxpBA/N00QgfDR+afj8IBmFKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278257; c=relaxed/simple;
	bh=ewDlNOZ7l4XlAjsBhVqIndzDDqS8JWTFaOpwxNnpn88=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ednwpC2ZDORW/NBmtYas7UaxjcsK1S/rbE7LbvM2N46Ivu7sBRZtSzfXGMD4mRrCuh9a6XhyHC2vn6dsGLPN59hSDh2cNTKySvaUuQyTSOF96WHzsr6SEc1cjHrma+AaVl8W05OG7YNbk69clyD7V9wWXaqGzM/06O6h3c/5vgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=joFVF5SO; arc=fail smtp.client-ip=52.103.68.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBcfEoE5B75vwLsLtiSeljyraTqVM5aTfI/ArSr57lVCO94oqTsrjpIC+K36bGg/d3NfoZ13vxDGHI7nxYiOVGrO4Lx/wu2CgA7LZLgMMNRhqgWNFoBCKoNjVaaZW28+ov7cfllwOlJU5JPL+T1izuEocLBnvKhvmQixbP/LvzquVkt6b4XHOi3EQm9vXYquz9fBkSXdh5n0w2ThQSL8NHKb+jUBqA8Sopr+ajBYdi+T2z7sCpSRIRp+aqFYXEpz6JKSTs5wq0ruOedbCKZZ3mV3s0k59J2ZyUn8J0/4PJ+KP1M2fljIcxAzxKVptCO0vQo7Lt1cPdbeH1Hrjl8a5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkOSmG33EtNR8CpLanyqktqD1gP+CbB00zIX73W5Zz4=;
 b=AAF1LmL4VBTXGg9gSYkRd6W6+KzLn4ZY84QybEQP+kygM1xtBrpZQy4UpBOUIxY13cVDAN3RwFBTm2me4VvY/yuI7OMNttPNipExtAUGCCb2yNOGMFJxEArTavnSadHBFE4BuMsIu2B2QgVqX5uMnpYvhDx1cx+oppsE8z050ZjB1tsI6+OUGTIrXVss+UrmzKWkKYjWvFUbe2APzaKjO+zD1bNL9hL0EgljXUzYkkb5pOhJccqNo8mrxEXJu7TXTXptCka+PelLXevopQnqbfTUxCKFBsIMiUnGXTGoAnhbWsnfiRy8/2giAK9JN8eNzxYq16kTBpjrSc6LQn0pDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkOSmG33EtNR8CpLanyqktqD1gP+CbB00zIX73W5Zz4=;
 b=joFVF5SOlsJWaEEhyFU4kAMVPAAG4xePKRqnf+aidopQdO0FGUIyhq3nfUCFwnJCRrOgcj3Spz3qtaXzhDm4K/x8VWx+O4Xk0l0Lid2Es+MkX9a0QGjxYEdrPgvaKkgK/mkzhoIYcHJraz8qP/x3k8gnv9IxprkbjnaHyxP5c7rJx+YgeQQUW0fBc/MwghXH/tzx5laO0nALRTn6W3rlLeR28dWgbBQRD4uV06kDeyc5UoFGBF4RfsG8MFN8Om0pefFcF4K0Ipqz6BbyrC5a+B5n46euEDz0yI8iPzeNJ0DVtZ77AmDi4HLBt5BYG+X/nvyLqdoU0cUuXgKocV+J2A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNYPR01MB10948.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 30 Jun
 2025 10:10:50 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%3]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 10:10:50 +0000
Message-ID:
 <PN3PR01MB959796A52701ACD2703157B1B846A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 30 Jun 2025 15:40:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] HID: apple: avoid setting up battery timer for
 devices without battery
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <PN3PR01MB95973218D6B4ECDAE8ECF60BB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597321C9A619D3CB336FB23B87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aGJaBJLwA7vbq32k@fedora>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <aGJaBJLwA7vbq32k@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <ee9c3f78-0dec-4446-8edb-fc36dc0ea55e@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNYPR01MB10948:EE_
X-MS-Office365-Filtering-Correlation-Id: ff136d63-a5d7-4d7f-0afa-08ddb7be63e3
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayELNF2Vmhju1u70eQ9JKDE9gOdwvQv+ywTCjRzqB2dUKZmo7B1Cp0E+cNqEXc4chwN8j1tcwq2Mp+xPXGbtvXPHnSSOICUQOokVbQMOXJ9SrX0HPwKmxJ5mXW3ujpIbdKcZxflErZ43TkX27+xsQ07PNP8newxhitAZ38tbQ69N+cTV1evI2sMkfzQAefXDy2XyVruP0y/gMygci+wOp759O09zisUuu2htilxD8CHdKA7HsehMhLijgWDwTcJGSdgbTtvkd3cII0WfuFSIyO2vUoPg52dhpGri0uoB8p7750yZFcBrArlxEJmgQLFnNARhpNvp8zILR4zxA/lB93TxT+ST54GDgHN/5s5Lu1HxK2QQXt7IUD9LTtzMg7UxLdmUtjVuS9iUZHA9PiEUcYEEelOS+sokJD2O5CZwF5evqnwHRZHvHAkP6+46gdExmfW0Biq7yQ2gXv8JrnzcVTWw1E9bItaueXqcDfsRZg6/oIZy8UKfPNPKCmWPxjm5OMqrtSGMBFEgEmDBzN+cLmgcRIQ/NQKjvkg/IzedXCmikIdSlFAF8NkdNy5lKGSqteBLFEfXSNsXC5yZtl8wAuGKrSzx8y+9uNA9p/vpn+3xeFM76EpLfY0C/BwLkGt7+Dnrq8pGGgL4TfcXoN0GpCSgLF5s/xHEjQcrFScgV5aT5z0BJoocwbkhPukLYzOtoX3c/fW9EK9xInCVZptOkOY9YlrcG5UTpZw=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799009|15080799009|5072599009|6090799003|7092599006|19110799006|41001999006|52005399003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0k0eEM1MUJvQjBIMGRaUDFrcWZvczRLQjVuOFRaeE1HQkl0eVNRem5sL2NI?=
 =?utf-8?B?MUdYSmVRR3VEbGE1bVp5RTRaVnoxdzRnVU10R1M5ZGU1ZnFuS0l4TzN3RjJx?=
 =?utf-8?B?RUxZSThZZmQ2MHBkb0ZNK0x4VkdaQTVYUGtGVjVVdnk2ZlJqaTJnNGlQSVdh?=
 =?utf-8?B?djgvM3IwakVBSDl5VVpIbVBVUVVoTTJHK01XRnFkYktvT2g1V2tNdHVJTnpk?=
 =?utf-8?B?K2gwWU1yYUxBSDExRmc1b2hBWUxuaWdGU05LWkg3WFQvRllyN2NtYVJwVWho?=
 =?utf-8?B?STV3M09qS3NpQXp1K0NEK0UyNDBSUWVRZ3RtaDNuQlh0Q1ZVUyt4VUZON3Bl?=
 =?utf-8?B?TnJ0WWZLVzFUMHYzZlVsbTd2RElvOFF0NW1YMUF4V3JoRWJ0ajVGeWdYLzNT?=
 =?utf-8?B?WWt4UXhNT3FXZlAzUVoxV2hGK0w4TU1wYi9iRjAyeENjZ3NKWXpFSzlPVzZq?=
 =?utf-8?B?aUFPeEd1bEY4U0d4c3loWUtCVHlybURWamwzT2phREp6TzBYekhGOTJsSnhJ?=
 =?utf-8?B?dFVEVE5BeW55OEhBR1ArMFo2bW12N2d0WmsyL3RZbVU1Y2VEczc4c1BVRTFX?=
 =?utf-8?B?blZubERvNVhHR0U1YU4yNjcvZWJvcm1HODNCNGNTWDNyQlJjWEJCeThpN1Fn?=
 =?utf-8?B?cXpaT3pVMG1hNlM4cmw2eC9jazRYM3BSNjFsQzFBWFhScmc3QURPdS94Sm8r?=
 =?utf-8?B?M04vTlRYWmNLeC9ySHB4T3dOOXJpTTdQTEhWZkFMVGNXVlRzbHROTldRNDNL?=
 =?utf-8?B?aWJrYmdPWWM5Nlh1UHd6WkE2UTFBMW5ibFk1N2VoR1BMZFhnQm8vZHBGVVBm?=
 =?utf-8?B?eE1rMk83V3Rtalc4cFVXcXU5cytVSlloVDUyRlBJTTJ5S0pKRytVcFVuMzdH?=
 =?utf-8?B?aWxnTXEzUDdSQUkxTlQ5M0tRWlB1Z1VGS2t4aHE5eEFlelBFMnhOaSs5K2JT?=
 =?utf-8?B?cWRJVWFacXdEMmpoSnFCbytMaUpsM1puVU1XcFdHU1NhNjd4WDZxMEtBazMx?=
 =?utf-8?B?R2puSFdpcnBWeXAzTlRpN3hyS0NrUmlNOWl2Rmc3eGxCeFdUbUNIUE0vSTU5?=
 =?utf-8?B?aUpNK3FKWmpScjI2QmpDUXllemhSR0l3M2QydHlhQnBHT1JlM0hHOEljcm5O?=
 =?utf-8?B?N2E2d05WQnhncjM5Vk5kQjZlN0w2ZHlKNHdodW1PRGJmeUdSb0d2LzErNkov?=
 =?utf-8?B?eE5ON1BpeU1NY0EydmVmRXdzYUYxWHJBVEJIaXhTeCt5TjlKSlE4ajhnNmhL?=
 =?utf-8?B?S2pqVUQ0SEpnL1Bob2RQS2t1MGIwRXQ3THdIbU9jQmdpU3BLd0hTSnBtNFpp?=
 =?utf-8?B?TXNWRmxLeVRldHJXTHJDWDkvd2Z2UzRwb0pMSnU1cDJmWHJjK1lMYXMxdFlP?=
 =?utf-8?B?TzdYcVJsa1R2d2N1T2xyUytDa0VuTE1jRkVzSm91cUNqUUdyZGc0SGYzKy93?=
 =?utf-8?B?Z3RXcEVWVVlrRnV2ZFlUUFlPUjYzK3kyOTNVQll1Q2tmNG1ncjVIM015b2lT?=
 =?utf-8?B?OWJQQ3VOWlVlaHJaV2FzUGg2NnNtYzZRRmFMVjhtN1daSlNVaUZqNG9qK0Rp?=
 =?utf-8?B?TWZLd3NEb01jM1FuQkV4cTFkQ1NOS2V5OXBkL1FWYlRuUkZMemJDWms4WlBa?=
 =?utf-8?Q?Ui8AcXHAAt3L1PbWlcUGHIMDBK5Uag7NURKsepEh8l2c=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3h3VDVqM1pKWkl2UzlaU0hoWnhZMU4wNk5hdjRjNWxjMU5LWFBXUW9iNklt?=
 =?utf-8?B?UWZsOE9haVhPQWtBKy84NC91S1FpYlA3bzhOZFpRb3J1Um5OOFdvc1pEYzJH?=
 =?utf-8?B?WWgzQU5BZE1sRUFDazRQODhVa0FEQXJlcW9tZVJ4TnFidGZiZ2QwOGc1Q3dT?=
 =?utf-8?B?ZHM2eElCZEsydlhyaFliTGNKNkRYUVV0TnZqQS90RjRDc21WTHpXMGt0MFlL?=
 =?utf-8?B?N0V0eHd0R1lRdzgyNzNFVlVCL25adzh0c2VlY2JMSWxZK094aHBpalpTUVRY?=
 =?utf-8?B?Ty9uckNEclN5OWJaVTZLR2kxcGxxUENBNWRGMGtRNSs2WThDSzZRUlNNTm1R?=
 =?utf-8?B?alZ4LzQ4a242YmhlaVJ3WUdpejRld3J2eUFnNndBVjA4eTJJU1BwaXBjTG56?=
 =?utf-8?B?RjFWVEgxSVVBTm9vRTZsaUZzN2FpVGNQemxpMlY2Q3ZqL2dONitiRnUrY2ZG?=
 =?utf-8?B?MHBDZVQ5azBjdHZHQ1dsZlF6c3AxU2taYVEzdmxEZnYzQUNEb3Vwc0RRU1U3?=
 =?utf-8?B?SFoycWZ6ZkV5dGZMbDRFeWhJcGRyQm5jT2krTXF6SCtjcE8xQTBsbnRrNHBU?=
 =?utf-8?B?NXR3akphYXo5K1hlaUcrcEM5QXFJWWRuREZSVVVwVEIrMlpRc3F4L2RPMkIr?=
 =?utf-8?B?aEpiQlNtZmVkMEdZUm40TUFrRmVaamNpdjg1R1ZqcjMvc3NFYlhiaUFCYzFo?=
 =?utf-8?B?NVBETjM1SWp0RFJxZmxDb2FXYnU3c0dMck9DaG5PdGljbUE5RlZlSWdkNGxW?=
 =?utf-8?B?b3BGc0ZtbGRsOVRGUFBjUmV1emlGdzJ1cFRBZ1lqWUNMUVdKa2k5WjdQcVNp?=
 =?utf-8?B?azNsaS8xdVhWWmk5VUwvQmNRU09EU0xtVVYzbXIwblloUHpsMkw0NC9uL2hX?=
 =?utf-8?B?TjdKQVMrZ0x3OTZwZUlGZ09NYjZGcEJGQVluV1JwSEYwcXoySXRobFpoRzhP?=
 =?utf-8?B?QnpNUCsrUDNHK2VlNTZkRnEyaGwyaE55eWVhdjVCRkYzWVRuSkl2NkhiN1F1?=
 =?utf-8?B?TTNkWmlFZkFIeUpXNHdhdzZpVFc4Y1VEZmJNeFdTdGltd2lNTzdGS0RtL085?=
 =?utf-8?B?enJic1kvdkZFMVBEZmw1OEllZmtZTjIwZzJ6YW42cDVUODg0WlBENXN5eWVE?=
 =?utf-8?B?bFpIVUpzS0J5U0NONjFGeFk1aGNwNVJCZm5MMnE2ZTdBZVJUcnN5bXlYc2Nn?=
 =?utf-8?B?clpwaHBZT3ZXT0pic2FXdnd1TDYzcndJNGwwcTNHUGs1NHhHRlZvMlVvUU45?=
 =?utf-8?B?OGJWeS9DSXVEWHpaaTdrTmt6L2tSM3pvMk9HTDY2Q0lpbHhST1QyQm1pQTBE?=
 =?utf-8?B?eGgweWx2aEJMVE5CV3BFVms2V3NFQlY1c244WllrQTA4Ukw1TFY4ZzdzWjd6?=
 =?utf-8?B?NXd6TDJjVDdOVEZQN0dOczZuSVRSaWJhYzNNbWhxWDByRHUyNTVKbFdCY2pa?=
 =?utf-8?B?SXB4dVE1UXM2bktDUlRXKy8zTTdFUEVzV3ljMzVyN2hSYmY2cWIzbnZLcGo5?=
 =?utf-8?B?bUdEV3hlY0ZRdFFZRmF4a0ZhWmFmS2E1cjU0MzB3R2svOG9SbURGaEl0aGJj?=
 =?utf-8?B?WXNqRXpsVzFYYlZmODNVNTNYL0lmTHU5WnN0MTc5eXB4SE4vVzF1a1JqTll5?=
 =?utf-8?B?UHlTdXgrYS9uY1NUY2FmU3ZqUXRTMWVnNXZ5SGRSU2FHZWovR3BMZWE0Z1B2?=
 =?utf-8?B?dysxMU0zaUZlTmkwTWFSajZWY2JIVGt0L1RiM1J6T1h5OTVYeUh1RnlodS9J?=
 =?utf-8?Q?tx2Jlcjt1vONMjMg76pDff0/f88L+6Y3Yv+eATv?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ff136d63-a5d7-4d7f-0afa-08ddb7be63e3
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:10:50.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB10948



On 30-06-2025 03:03 pm, José Expósito wrote:
> On Wed, Jun 25, 2025 at 07:46:03PM +0530, Aditya Garg wrote:
>> Currently, the battery timer is set up for all devices using hid-apple,
>> irrespective of whether they actually have a battery or not.
>>
>> APPLE_RDESC_BATTERY is a quirk that indicates the device has a battery
>> and needs the battery timer. This patch checks for this quirk before
>> setting up the timer, ensuring that only devices with a battery will
>> have the timer set up.
>>
>> Fixes: 6e143293e17a ("HID: apple: Report Magic Keyboard battery over USB")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>> ---
>>  drivers/hid/hid-apple.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
>> index b8b99eb01..b9f45c089 100644
>> --- a/drivers/hid/hid-apple.c
>> +++ b/drivers/hid/hid-apple.c
>> @@ -959,10 +959,12 @@ static int apple_probe(struct hid_device *hdev,
>>  		return ret;
>>  	}
>>  
>> -	timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
>> -	mod_timer(&asc->battery_timer,
>> -		  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
>> -	apple_fetch_battery(hdev);
>> +	if (quirks & APPLE_RDESC_BATTERY) {
>> +		timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
>> +		mod_timer(&asc->battery_timer,
>> +			  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
>> +		apple_fetch_battery(hdev);
>> +	}
>>
> 
> The same here, the `out_err:` error case uses the timer and it can
> be uninitialized.

Ah yes, good catch

> 
> Jose
> 
>>  	if (quirks & APPLE_BACKLIGHT_CTL)
>>  		apple_backlight_init(hdev);
>> @@ -985,7 +987,8 @@ static void apple_remove(struct hid_device *hdev)
>>  {
>>  	struct apple_sc *asc = hid_get_drvdata(hdev);
>>  
>> -	timer_delete_sync(&asc->battery_timer);
>> +	if (asc->quirks & APPLE_RDESC_BATTERY)
>> +		timer_delete_sync(&asc->battery_timer);
>>  
>>  	hid_hw_stop(hdev);
>>  }
>> -- 
>> 2.43.0
>>


