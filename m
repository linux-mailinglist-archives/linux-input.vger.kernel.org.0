Return-Path: <linux-input+bounces-12202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96859AAE2AA
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 16:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FA399A7FCF
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 14:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EDD289E1D;
	Wed,  7 May 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="BWKgJ76U"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01167289E16;
	Wed,  7 May 2025 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627097; cv=fail; b=u+Boo5+1ArwytOtgXH4xKyQ9lAe4vXBSFc5R2cVi8JmRrQVPpWRfNR/aWyNt6pveo3IIB1w8xUl0+UPu+DfkLlj2VwEMTFQxqt01LsBoSvRIl4py4lOFBJXA2SXn4lwKNO5lyPxPg7vhMUwB6p7W+wEIZSXv/40fzvaRUNHGkk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627097; c=relaxed/simple;
	bh=dFthDyvceAXqCf8DTeca4KNURkh+72/fAtHbBpvu4X0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gKhPKp4A+tDADDkR4erOHW81pKBW+DtDdxF9ZnZWTPg62x6kAsx27wEYszDH7qZAIJGSohhlqoD1sHqN1CUmGK7MK3mTvOeMv3mE7QU4QxVmNNluMcbHxaxDOHjkvI6n3zKIwopmdO+a5x2eEGrVLBaAzvL8EwLtC9tXeE7ZjfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=BWKgJ76U; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioVu8PlddZcYskzq+SXol+UO5quLN1d4/10KwqknG8hp8JGfqhyb+CQqnwjNFaL8pUScFaKfv5gtDXIWpoITzhaZZ7X9x9hYVeLBDkQEpi5MraERXq5S2MLtY2BGDNCAE8Q69dF2sI5EVBV6UiCuaB6V/c7R37m2OpjlQAgMlKHSPSCzmql1ecKyz6ZmyOw0lqvGw+TFqncTdqyphv1AkIAVspL4baMgsrc62L0lOc2nXubKzBKt2Q/UrzZCVXTzwggpRC/UDwbs3jUMNR8ywi3N5Q+DXTq2bL4XZXC05+jUHuB2EmPI+09LTG1LA6xDSK/6Hek3oIbQhd9ggRcNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vdj+3z9gZAQ0+C+B4ktuXcXc4D7qPL/HoYYdEnQWhOg=;
 b=sptOve3FfvkfGUdDCFJ0OChpFLAFR0Fp41bGAXPTm50ROOYbwoMjpjOHaEwkCk+3FCI+XaUys97fOxQC4ixEUd7fNPvgPdqvMIkVeBpu90dYVbJxmr67dvDXnvuqHu//yedogQu5tz//6rh5wdCHZ47M/5HsBTXP/uAeJQzgrDbfg3JmXX4zEucxmhjgj78Z35o9EGR8yBMWFuO4w+91wn01QJaZyNT05xFqc+aUJoM+PFDEbLqMyQ13Sg/i6wK/kjvJyKscwXFDpGAUPx/HmkR2kf+JKYecRTaa96j43HVcV7kk7Try/PkEXY+OI7CGfEjxKAbFnQHOpLNS1KChYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vdj+3z9gZAQ0+C+B4ktuXcXc4D7qPL/HoYYdEnQWhOg=;
 b=BWKgJ76Upmcykn2lmG7N2gYBhapvPmCed3BWZclswDKWwhQ/lXjFM/Gk+8onlbpnhIAMlOYQKDot/3VUAy+QqZidMdtHxeQI23CgUrli7R0PM+7/l3aYVA51FgalcY+NXJkCyKPNsjkdATqH3wKJ0trq0MVjISy5mmJA/Vbp2qzyGLiTdBhn3RNZIaxUxh/I3cR7gULZQo5bYn3J6jOBLZo01iaCVUWVTJBC4FHcbSfWrC1sEY8YijnPWQGLic4Y5Aw9RoSUwo6V/UARSJByOAQc7S0UW+E/NcTAhM7MCWpcrJYh3k+A37NIx6tEkT/qVTAnfev25KogwqYU7ld1Bg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB5559.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 14:11:29 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.030; Wed, 7 May 2025
 14:11:29 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manuel Fombuena <fombuena@outlook.com>,
	Carlos Song <carlos.song@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Clark Wang <xiaoning.wang@nxp.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Takashi Iwai <tiwai@suse.de>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xuntao Chi <chotaotao1qaz2wsx@gmail.com>,
	Matthias Eilert <kernel.hias@eilert.tech>,
	Markus Rathgeb <maggu2810@gmail.com>
Subject: [PATCH 0/4] Input: synaptics - enable InterTouch for new devices
Date: Wed,  7 May 2025 14:05:14 +0000
Message-ID:
 <PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b5::7) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250507141114.25077-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f34a0b-ce1a-499a-dcf5-08dd8d710fd3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|15080799009|8060799009|7092599006|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p6mxa7OTWRb5zNqyiBk9oaWFCtLfMysK2PBiDQj7Rw8KQ7bV/QwpJizBG7IT?=
 =?us-ascii?Q?fkXuEprQpBeMxtUqxrptbNr29QF35A/H4e6GfE23NuCYfKCO/AprunuQoUsE?=
 =?us-ascii?Q?2uJy8qlWwe9l0sTwH0dOOMnPELhA+ahNW9Shgxd9i9Uu1IR3mi/jJTfNJOPY?=
 =?us-ascii?Q?WPVqxu9gkEO4NMPMur/ilW1P/eUYKcTumgiextRuw6ZQ5f/S8B19bWqfs6Hj?=
 =?us-ascii?Q?rvt0//3/CIR4OV7IlxCCxNYI1j9JoP3/vwFBle7yPsWrPYV89N45SeRCk3tv?=
 =?us-ascii?Q?+XfBCbTP9po00A3YgT6+9EiRMbawcZ+gYlGBdg7bG0N5b2GoIJpIuhXSzrsW?=
 =?us-ascii?Q?Xkl8PUYDwpS582xjKTtltnohJeKNRCsMF3ini7/Ap4UN2CHf8fmIwp29Of2/?=
 =?us-ascii?Q?GVZdrr/SUAbXVxpzS2tq4y5Qna0gei1sLsSrQ96pc/UsvAGmhvI29Ol+3x66?=
 =?us-ascii?Q?RA6W1RHfrKm4jNDeoVHvZ2D4CxbqpVwmvIaw8aijStB+dSrqJEhisvYdjNna?=
 =?us-ascii?Q?/aO8PB8h272plvFeCRpgdPCvEyxz/WstsQDajszEd36SwTT9kDiKXfqkGZPk?=
 =?us-ascii?Q?QCbhYsMt9BC2QDSLb2N5p22IJIW/W23gT0YKlGBbOTVaPCQGbOG7Un2B+EKy?=
 =?us-ascii?Q?Bt5m9UR32i79+28cJ7GVEG1hzzrLVstvdeTg+j0qFTMxinPZT8PxcSqmpsdy?=
 =?us-ascii?Q?fc8P0Dv7GMDc+xTWWAHz/goOz0M8Td8v6W6x93Gltg/34gIppsY+iaSckbKD?=
 =?us-ascii?Q?UP+zRMEHmRV4R2WUY1PoUrGJq7aa1S6JqeoAN1agxAEPsZfaC3xQzGKoo9Ai?=
 =?us-ascii?Q?W/dhaWmCjr4ySkXgwTEgrSeglt71gLbsbVh+y0nYEgtOpgG61TWbwDSs3eFg?=
 =?us-ascii?Q?d/kJONJTeRQwsuAdTIF4rQIwkxaxxp3ej8QI7sCRmMhZ00nAlJLomJwYoxRd?=
 =?us-ascii?Q?cVp2VCPMgpo6oSvCqa7WOuQH7Gnds08KS2vdJl1oRCgGV13MW0ozSVFRy4+r?=
 =?us-ascii?Q?ktcFrBILIKCBvuZfuVLBpEbDLHv5dCyk2OqpA0ZLQd1ORoWJLa507kJB0xVU?=
 =?us-ascii?Q?o5pTLWR/jo7jVXuGf3Imw51LSkMc6x0VGon4smmmhCTO+iBYyYE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ReKlJl8g6IyRgziJqOp6cG5GqO58rEJwcNSFzk5k5wd6LFnVTkvihGRJ8B1L?=
 =?us-ascii?Q?0EVAMrlz4BTwmH/oPxsRPiecKhRGKit4WZKJD4KGEfOM1loTcGIAvv4FrI0R?=
 =?us-ascii?Q?mxVIlCSczb0yPXcpVPqTusK//6iU6e90vEtsc6sf2kktVnIKZb66uOjjbETz?=
 =?us-ascii?Q?VKOJF/xayIZytv/5ihUh4aFW1Ifwc4r1TjY/PW3Dku8f7+kO7Lsov9EI+HuK?=
 =?us-ascii?Q?AC/8/gXui1uXDtO3IAyAfKbzc+F8I+rlbrWgO43xrWct9rr63lFuxDQ6pHvH?=
 =?us-ascii?Q?mh4owcBti29d/0KmwYPE8BjpZYy1ziF7J8VHGRH2Lha/KkyVLVVELy4rSRbZ?=
 =?us-ascii?Q?VMPHd7MGubD9264w31WvAbpzi9fcyMhMnrkPIOo0FdWHUropn/tt2Esnz4za?=
 =?us-ascii?Q?JkPP9iiRdULxMsm6XwuIyvXTD/SuJnlmW4H856AokO+SFOQe48F36320fTtb?=
 =?us-ascii?Q?CldxhKf5v5YvLUAVlt8O92UcyPxgT5l4ZelDZSL4xDBAq1aax/a2jZPJra6Q?=
 =?us-ascii?Q?yERmZB6hR6h+GAQhycARy3gGzoP6GJIoJS2Rk5nuIJnWh6cA4Lge52uWE9ul?=
 =?us-ascii?Q?929Ci1V/8labpf1dt+M0SLkeEFT+lTGWELVm5CjkltV4MANIJQM90zbu5nIA?=
 =?us-ascii?Q?4Jijz2cchU0GPTC0ISHCFwwH5PrdsrZeif3WQ6/EJvNblp9Io4A2ovmBGRcw?=
 =?us-ascii?Q?La905ausd6LQKgfVmfrQ4OchYRO/QqYPXT2FnZ5gJ2Nr9TwcS60qmzvYgAI/?=
 =?us-ascii?Q?rud/VBy8F6DRo+ZvAXD3Ev4Y6RSg1DdIqxDa5IcToF/+BwhrVubrvUmVFXQP?=
 =?us-ascii?Q?sW8NSf0cvrhnhZKdXcKRL61tjJcN5UIzdXaQFCQK/EqhgPdUuohpJy7H+dMc?=
 =?us-ascii?Q?CgEOqRd1HwO2fMAVzPFIGp5IhyboTaJsXT225kIc2kpr1E9RN11qU9vnGjZG?=
 =?us-ascii?Q?v7IdCTPrCqRoJKs+PL1sEbd3RLlMlaPK8pAB+R7+CxI5vEUOhf16JXxaGsZ/?=
 =?us-ascii?Q?uqF6o/xhUVJWQ7xPDp+t27E8cd0jfIzhbJDkZAIaqDM+IyUJXDqCkSbSQxjc?=
 =?us-ascii?Q?cuazOm6tpEQ3YZ6T4q4NHgkQcLTvgfoZT3mQ6Yn7Kym89ex/Gy5hY/IOyZgA?=
 =?us-ascii?Q?JfULbtH7M+dhyvUWL4KlCthOD3R5ABGGy6UBF38VbGbDE7zGpmdzB+Bu/E3z?=
 =?us-ascii?Q?CWiVdpJI2mF63lddc9WHsAywhdbzw5b/wWvb7ABWcxKfYVnpO0i3+XScBVo?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f34a0b-ce1a-499a-dcf5-08dd8d710fd3
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:11:29.6780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5559

Hi all

The linux input mainling list seems to have receivied reports of requiring
psmouse.synaptics_intertouch=1 for some devices. This patch series adds support
for InterTouch on the following devices by adding them to the list of
SMBus-enabled variants:
1. TOS01f6 (Dynabook Portege X30L-G)
2. SYN1221 (TUXEDO InfinityBook Pro 14 v5)
3. DLL060d (Dell Precision M3800)
4. TOS0213 (Dynabook Portege X30-D)

Aditya Garg (3):
  Input: synaptics - enable InterTouch for TOS01f6
  Input: synaptics - enable InterTouch for SYN1221
  Input: synaptics - enable InterTouch for DLL060d

Manuel Fombuena (1):
  Input: synaptics - enable InterTouch for TOS0213

 drivers/input/mouse/synaptics.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.49.0


