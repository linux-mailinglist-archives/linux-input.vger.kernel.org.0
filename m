Return-Path: <linux-input+bounces-13037-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2FAE85F9
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 16:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78988189A51B
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 14:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BCC26656D;
	Wed, 25 Jun 2025 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="BFqmikCa"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011031.outbound.protection.outlook.com [52.103.68.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0B17333F;
	Wed, 25 Jun 2025 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860992; cv=fail; b=Her/4a+WfxQu5FoqEdGRkTe18N311iGaADDAzhJ5LKm6DWMTcmULh73ae5F7ZkpKCeJzM5C9tM0tgTsA2DHsazE1rx5p+xcLfqPkL7hZRHbUiyNbccYTYr10nj7D5N/JeFEFRHIkEnmSFHmkkjxZuJQP56rcPZmy0Umhr7HfTqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860992; c=relaxed/simple;
	bh=nVGQkHgfeeoDCUehyrjVdgCr7A4747GtKC94VF0FJEc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cma2xJbr2xNPSh9sG54xwL8E755gvBXseIqPYhu6qQENEjpVATL78WYY0FfUGWAiH72ny90zDeyuoVHJEuRDzRbDEsd6T5AVLYatkisEMkK6IEYJPYXzyYjTH0gcvUTtsXrdpkW731tuudULbQWlcbRXelZwf0vFMS1Nko+Rp7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=BFqmikCa; arc=fail smtp.client-ip=52.103.68.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4GkiusLDrf9vSwOk32HUF6yuR4z7AhPZLnCr2i6jSFH/baUMLXjblpCmBL0QLgH7b6UV93wXkSFxUvO4vcic7KTMAKwHxMJ+4m4ksFiBcgjOBEgE6vGQBjgnQxJ8zmfOHwsKDT+VfvwgWHFbPPNb3+E9AhY1nOPDZDY39nqakmPfBaRvFT7ydz86lqhCjI8flgxW9F38aVJbHJi7+rJH+2UgVjTaUU7QrCPcJAp6V5tw5iezx7RwW2EzyhrxGz2Hp83Tv+JwltsgNwAsUC6j1IN+vVzgcPu//RfyQMDlGAujeis4CX8jiak5Zz2ujiSwWk1SUB+/VN1a5MEznGzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBEcWhj98xb9tsJMzRLK4IAbnXYGWskhhBR6fZJHsjU=;
 b=BziQgwREsTWaiVOqEgm88lvL+TYjd4hG4/ynv5x+abSzs/N2/5uRyuEkIo30X83nTyPevEZp9Zt7TX7Gg2nEdR1BQIdpBjlC9LnfbA8r6j18ns3YlmoPNn0N+oM/cU7sKtfDVfJh5SxLvIp8i4nbh4r4p0QY6Cc8qlhHITf8Mve5g3b3evysaA0tXY8SiCAaExqyxf6kES/K7umZS1nP/wMksbqg8YdF/9iwr2ucwGefAGvlL4KK6Fc9RKuvLdOZUzHtHS687hT+679ppDhGpA8BF9Pq6ooaKvWDhIGAAGYZ/VuT4nGkIDaEfhqhkFXY3YeVxDiixRH1nfC4JHE5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBEcWhj98xb9tsJMzRLK4IAbnXYGWskhhBR6fZJHsjU=;
 b=BFqmikCa1brpIIl2fB2ZNlxDNiYi8HNn3FmUqmPH4ajhLJ5T7UtHU1ORqEhrcQI8bEmw0w4Tb3/L3KpLr+5qKPh08bSfrKEMfhcI6eknBv68A+O2yiBg3i1pPoobA888wmJlWxdiaLUtqqvznOCUxCGvsoAHL1YTzcBuPiC6IhlPneR8sFtHALIlNcNZuNbXZdmJ7oLHvEn6Ahs7lRoGDtYR4StWbh57IDbTumgYvophDKo63fgacWBLrVotGXqYYWqs8A/Dg1uP+XtgF+ign0cA79sF8G6wLK7zeLnUUJlb4oNuhKOujsC2OmVLXiz8i3o/E2swajp+Uz0TJ3FjTA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB8883.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 14:16:16 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 14:16:16 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 0/2] HID: avoid setting up battery timer when not needed in hid-apple and magicmouse
Date: Wed, 25 Jun 2025 19:46:02 +0530
Message-ID:
 <PN3PR01MB95973218D6B4ECDAE8ECF60BB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250625141604.35609-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc82f79-2342-4a0b-7da3-08ddb3f2d8b5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|461199028|5072599009|19110799006|8060799009|7092599006|440099028|53005399003|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S9py+KYFB+7yFGZf+fA0OEh3lExVgkR9I5p7kPU6Gb2N8GGLoZKkZPTfyESw?=
 =?us-ascii?Q?QU2oyKjL2sBZ5cmu0G99PFvaYKuPsZ/RZE1pqhW5Ws62hyzPc4AqFUScuQ4O?=
 =?us-ascii?Q?mYVZrHHS8d54q/pxS3JWGwg2+OjYDuMVMeB0AJzMUK6okEgJRtl+iCxXvhdW?=
 =?us-ascii?Q?miP4mM+4QHna7RSWSlCgX25CLRuUdxrcRhFIQHpExpXqaScDstR4x+PrqRrH?=
 =?us-ascii?Q?m+7uyMWD5agDUON5B3kXcVeqFPqsAjQ7v5QH8GU/ozVSSD4Cegp2z46hM5SP?=
 =?us-ascii?Q?73i80uhWMH8qNKQGA/n/kL1IzyEiXgpmk9G/bo/nFGShG48f4XjEzb6ipudn?=
 =?us-ascii?Q?+CObof3SyGqt/Z6nO/crmXm55NKogELcHoQavJKcaeQYhQniPsC+n6mxgMy3?=
 =?us-ascii?Q?cmICofn60CFhrBNHQZTTptBkVhrrSjsox4qZxDjJ53uiLxZhWYYG8SOUwKKw?=
 =?us-ascii?Q?mTFVpqy/0VjWxnLW7n9lkgSPbrO725XZsr8MAA/Dn0cskFRqNn4DXAgkGegD?=
 =?us-ascii?Q?7tIRMyeDkAHUsWKnjnOukywoQU6IjAX61Kxy7sAw+KfZVGSHqmxB9izEhvFE?=
 =?us-ascii?Q?MfhAfdOgkQFscVNjSA2Or2yAKyUE3+xDMcD1E9VoYNmUR+isrSf/FXdIs1Z3?=
 =?us-ascii?Q?lPPBoauJB94RiMNAzMRX66PDsXj//qf+Iu7b7IShV/sqEHgnMpIzmwCpZSZM?=
 =?us-ascii?Q?8+DKV2Qm18NXmTguHXhhnCSMDVB3op9Q5U6nP8qnaKAOZKTocAGNxsWZBnvU?=
 =?us-ascii?Q?lj4t15LwsNIJ93l9JWE1F1E6oYNj/KhkbA4AEhJ8vLqY12lRLB8tb0ZZQ9S7?=
 =?us-ascii?Q?S1BFrfKK3Fob3skGhSmWKXHHvWChShZ1DaY2GsboVcptT2yOK0g2UFrblCnT?=
 =?us-ascii?Q?uAXo2VNsSxO/FoygAug/GFnj3yranpTVq49z0tTk82PJaHQYp1FcjY+pK5Sl?=
 =?us-ascii?Q?96gzeX7myskEWQJIXoC2Gd0ce3t2S21zd/rFKG0p9oNoYMZC8qKnuJr5JD05?=
 =?us-ascii?Q?37swgwnmGTwtVz61amgYqDcVQbtkor1mcPJVmOt/gwkyIVAf1CT7qp+pHytE?=
 =?us-ascii?Q?27pHHqwPxTJ4E6qceLum/53/LVQrAsZ/hJkNj+YLyFeBU/cQfpBe9gXgmOU/?=
 =?us-ascii?Q?PLYX40/ncTmO/ac38ZJVt4sDoQld2AfpvvTlLlMDeM5oCKciSym4qHw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hj4hyhe3XzM4sqNGqkS3unjT//ZkqnMlJypg2BvGHJ3qZ+az01ChnHffP1+Z?=
 =?us-ascii?Q?I6RbBgAv2EhwYGURRj6nU1btud1qUrD85lWyAzYfCHj+hMDZCKZQQPR31qOL?=
 =?us-ascii?Q?R37ZkqIUNIqT487O0RG5KU0JqKC3/tfdJeIXQuXLnRv5Wj2IvHJE+cTsAu5U?=
 =?us-ascii?Q?JEE6reJ8xDAnorpZ7g+YK32HHc96RPnfXeg6XesTSw24NqJg6MYNJl11y5bR?=
 =?us-ascii?Q?CmdV4+8Ijg8rgwTq4xL1KrRHUpgf0Lg3bZpSRWdT+rJGYCdvkBBEMftwCzRi?=
 =?us-ascii?Q?xhTVpFg4cqzkyoNxkRW3p0o4Nfcj7Q5wg2ELrMJdnYjgy1CR8zl0U68aAxUq?=
 =?us-ascii?Q?DxqfaX+s1ELaPZQNC01qrOvlf41cWgvyR8/frezgW5OVpgl+BtCWIuu0XOo1?=
 =?us-ascii?Q?FvbLG7hI+kDVMJAIf4kBYcqwC1Z97wzJfsf0TISkJfDm6mYtR7WAadzBoY5k?=
 =?us-ascii?Q?Uz0beXb2pbvA6P7pRoduzwNi9UhEb7DoxgmEvy84hDg3AIcquhdy8B2rbETe?=
 =?us-ascii?Q?l2z7ofkv+6dCUI2AvIzoOzp6hOBYQ2PvHYflBAU9c/fwTFUfD3xgOHzHmuDh?=
 =?us-ascii?Q?fxsbMCbJgY70exrMwSEALCw2OmpyXpM41oR2Dc1HwYDzS7z9g5GahQv2wfNR?=
 =?us-ascii?Q?4OITXIMUssjPImRmyKqTsVVBuazngw19EzcS3oWP4rwSqW2xclh4ZHkmH6D6?=
 =?us-ascii?Q?1GH+mHJuVpxDM28lpMJDU1kgx5jXicax4gD7g/1DMQFxTibHoRhR20zVQ6ng?=
 =?us-ascii?Q?u9eHOPrASCTD/m/jKGKUhH85K8HY96tyY2rW3UytVW0kOIAPvwXkLnsGM/bQ?=
 =?us-ascii?Q?885hkl6g72bmXVoOcaqGxkQOop2AwbyMkShxNZ0a3yO0B0SnbkqbcvdCmmh5?=
 =?us-ascii?Q?iLobDUo6DawAjoICqudulcUDam9DlQmpEyCOLxnRnep00H2gtalNw//SeXKH?=
 =?us-ascii?Q?uhX8B1Cij86bgv0Fr1M+T27HPsn37OvTFKhopCpA8LDf2XmX0TqtYcmw2KyB?=
 =?us-ascii?Q?XrdNBNCJIrGrNrZetDjo6jzjKcAjHTK0xt1X0k8Nb1HPGH5tlXCOG9vU4HPS?=
 =?us-ascii?Q?3u5vaFzTGLTekVSXFvTcR7A65lrX4R3w5NL2EMUBnIX/PQ4clxWPHB1iYpsz?=
 =?us-ascii?Q?7Y4XV5qXLg4Z3Lev4LQn9neKYS+rAiFrXebtwb4B4GmNicetvAGf6+0xSwSk?=
 =?us-ascii?Q?fDEa0VDhhR9+b3YgLW4O2W49QLDLMBKLW0Me5ewIesETdJyWZk2k8+V+AeRd?=
 =?us-ascii?Q?dJzVrBGVp9pgGlIAyHwdd+gtSyE5DJhbw1K91/NQQTCGz22RuZ2TD2FxrKaM?=
 =?us-ascii?Q?eA/aovHWWn2daScjqPy2evqP?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc82f79-2342-4a0b-7da3-08ddb3f2d8b5
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:16:15.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8883

Both hid-apple and hid-magicmouse require set up a battery timer for
certain devices in order to fetch battery status. However, the timer
is being set unconditionally for all devices. This patch series
introduces checks to ensure that the battery timer is only set up for
devices that actually require it.

Aditya Garg (2):
  HID: apple: avoid setting up battery timer for devices without battery
  HID: magicmouse: avoid setting up battery timer when not needed

 drivers/hid/hid-apple.c      | 13 ++++++++-----
 drivers/hid/hid-magicmouse.c | 36 +++++++++++++++++++++++-------------
 2 files changed, 31 insertions(+), 18 deletions(-)

-- 
2.43.0


