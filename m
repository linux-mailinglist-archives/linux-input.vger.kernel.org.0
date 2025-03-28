Return-Path: <linux-input+bounces-11338-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0BA74C88
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 15:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34F2B1684F2
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 14:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A490F1B4235;
	Fri, 28 Mar 2025 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="rj0I2c9A"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011028.outbound.protection.outlook.com [52.103.68.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE69D1F94A;
	Fri, 28 Mar 2025 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171999; cv=fail; b=cPHFA+Qcn1G8fLwhLrhzprpdT3WjI3fvp/Q6owj09xrZK/S6tbK6Si/KthmIPvUkfRuCCjvcIw2Zq7XPYERPcxgftECLyLU6nFbuDJVK1e9miHL5qZDb4PlD8eFPo0CAfGRJSsIgOXvhxTjep8bKyhNST78jBJfAi+iRNJgQ9yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171999; c=relaxed/simple;
	bh=1AIRr9YEGxtYd3AxD7N0NZ4kyG7MKZLq5fQTghUeZkY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qvbUAs1WvMaXQP+A1P4IIr+wPJuzJUuPJh7PyuU9nE/tszOm4VYl8z9lMQWhAATDUOfu9ou0/iVAKA8WvnhYmeIOOiUGxSYlBr6lrpcrmX4Hzfwv7xPGbJVimEfi+3Orvj2bkE3StGWaWQLCIkza1qHutdvioSl1xx79Hgr+qFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=rj0I2c9A; arc=fail smtp.client-ip=52.103.68.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CW2yGvzEaBD9DaRT8Oi8N5Z4GeIVTcozuXM9080DKbh59n1VfseUiUMYgAIB1ZXMy0GiDZRk1HktmFLopvKFodROfxpDHK7x5gb3oMn7y9KnAzGvniXZpNrH8C5mZgLTiG0XeMg2l6RZe5jE6RFRlcyOcOfcpp2AxdyXWSTjsob3ZthGujB8soBpbGYJMYSrwN1g5TR4wib5vQ+EnsYeadQW+fYz1TENF2pLXQ2OIyMA6Gr/E/IZFZjP5nrEZCAOtw5MmwHFnL5lSxfy577mD/Rmn3BS/i3jKdY4ZEtg/YOyejCsPy92XnVl3OHdzmgDjtuwC14CU0zZuwa1E6v8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvV1x/cfhJFhNJ49gWM0//K7uDAzAo/MGorxS0bKcH8=;
 b=DBGB+MW+2gVTMBlmLvE3TiCSIE6fQ7/qgzGVIXkBuElmdBkEZBCN773wiKi1WeAzkrwfkbUnAGg3P9m0ZKU9aimKMX3ValWzngoX/JQ5d6xQ5QOLoEwc1E8RI4NvKE/k1bWEwQTb17Q7k5hjAcJKW2GnCWDQEkHZAExkpD0j7CeWU2N0VxCw0/s2h5uV2dqfNQOgZ66NaYj1OaWT07f9wWEUJNw0ivFUQLQHl3OE0EbeVfhhOpFxP243zd/noGDAA3mwzwdZO+18sSeKFtxYFbACNtlyxPta1YwEvVor8AfRXOr11TBYnkckoigEtp3VMlGna/t+jPq4PrGdTorenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvV1x/cfhJFhNJ49gWM0//K7uDAzAo/MGorxS0bKcH8=;
 b=rj0I2c9A1FAMGEQAY7Yr95QMv9mJGmYofR8idFjSmKFYL5qj7nRAmL3dOUFjnSdqr8WkygM50YPkb27x80FPLA30Io9DLouIqscMnVMIVsVMY4FgErroacRiezSY2FUA81BF82Mjvk5X8DmFsy+/7Swq0SjhAUo4Vq1pRGHnWTMRYObqH1rIhsuMV1Bw3uaLU9Sm3lJ5FhL4N7PO6W7Po04KI3KkADrep/xx/gZLqUuz/Ou5okcCS502M3TdLiH5H248RanaKWRf/JVb9b2bdMNu4xhacEvoh+ytClHq3/BnAIYqbtHXE22shklsSkOtk5RDc5lT0s5lUN17usS36w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:26:33 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:26:32 +0000
From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Aditya Garg <gargaditya08@live.com>
Subject: [PATCH v4 0/5] HID: apple: combine patch series for all patches recently sent upstream
Date: Fri, 28 Mar 2025 19:48:22 +0530
Message-ID:
 <PN3PR01MB95972CBEF8CA49C10E8E0DD7B8A02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::15) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250328142625.12980-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PR01MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 656b6c37-6824-4038-a14e-08dd6e048957
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|5062599005|8060799006|7092599003|15080799006|461199028|440099028|3412199025|13041999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vZK4RaYJ2LbddbTmn3A7ROb/iQL+aYcNn0OX+Oq6zqcjP288kVlL7rY0fAP0?=
 =?us-ascii?Q?L+QtYHUZjQCXFw6C4AsB3gi/vLBl98EFH/L8pEgW+rAs0xMqhgTHQqj45Kth?=
 =?us-ascii?Q?qc7tm5pYywCR2W+J7XDFYixbyzwus/+ArojNEqkvgBa/fBnuQV81A7mFW3i1?=
 =?us-ascii?Q?Cl/PSKL9sHHmUZa+BSKD6fEZrqT69N5s420KWRSeUh3bOjHbO+mc7JZwrtKH?=
 =?us-ascii?Q?1/0R2geMdA5ZIpeBPucLI+Kq9829x81C6OD4j/G0c+sFLjHPyU1/2sneb0xy?=
 =?us-ascii?Q?R1aHqOj+gTq3qsWofqi17hOIFKhUckinoxssbW2LVHOOOWYhvFy4olbXckaF?=
 =?us-ascii?Q?zhTpO2NshiTu0wEZb7ne/XdZPVORvQY+Zcm5H8oz2h/E9nmTzfQiIv31mN+a?=
 =?us-ascii?Q?VANzrDgRcmca5UbxbCzEUwEqc8MbW8F12T0a1XPZcHOYn7MqIDUmZA5nQGAS?=
 =?us-ascii?Q?urkNywIjB9wxT0zpjyfopyIONIWQv78mWxYe0IDKXfEx9iT+vxnCCiLILcFO?=
 =?us-ascii?Q?io2a1fHHkXKCmPLxwD1P1BCPkG8AbWsinZRO1WyPMvMRyki0gvkwA6p3dgLC?=
 =?us-ascii?Q?d649S9wGL4nQHSTne67/PwMHDe6ksJFRK1B9wKtCBsSD3uN5LCx9jLaHT7as?=
 =?us-ascii?Q?bkf9uS1QiBt+FQXkjzXeeBOUYdK1N9dKNUg1Fl9EmBFiR1oDTqzHN7veUPr7?=
 =?us-ascii?Q?2xftmhn4UFoj53ybreZZ5njEu1WvPe2WXwm+nVaqR2jJ9gubid+D9A8+/JBR?=
 =?us-ascii?Q?FJM/TO7AxwqlEQA7XN40IkvkFPXI58qamPeIaHo6gQTAJSMoteSly08QwY4J?=
 =?us-ascii?Q?86B56OapB216uETG4S2y6TdcV29dQ/Ih7CVdYTvac9x5hbV9XqDyjLYu0t8d?=
 =?us-ascii?Q?B7n1HYlHjq9hFRCsKr4GkvGIm+b9+3mmuDep0zB9879EvfHkJ6zk/6ZsO4oZ?=
 =?us-ascii?Q?AZkd34+66Oh2iFuPYZrwmCVkc0cjJPxuWExuHF67Rt/EyEKAOSwCRyseKMIQ?=
 =?us-ascii?Q?69mFUYqBJ1kdDT4pztMVZBh1zh/Ddk9o3dPdwthPFULRYwznuNcoSPOUo3Yu?=
 =?us-ascii?Q?XbaBwrNFm8b76HQGENmBXWcZh+878R1jCL2X/MC/IyKo7VmO6sDVnkBcjNDa?=
 =?us-ascii?Q?iNQsq/lo25s45w5FJXz5QIupIg8ROePxuhkUy9C8yoZxtxkxTAMDuTG5EAuj?=
 =?us-ascii?Q?11l3x0rjcfGbi1j1S59VnpcKAmWC2GRxeyTulw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Izk47qasvj/j89gH9Slxmm3Cw34AZSJYRdxdAYCQ4uDe4bXbVBMxMha6zIkd?=
 =?us-ascii?Q?15ehPerrtWl4Cy46PAUUKG1odgRr1WJst8ejc2r9vOG34SMJSy63WY0RCMdF?=
 =?us-ascii?Q?KrnC+m+eu6lVH/y1wkXb8UHRuk1JbyxKH1UmXVxomkUigEasIrQUtVIxkt5+?=
 =?us-ascii?Q?Vj4QkZyR9PmXp/PCw9ws4Zjai7uxvC/cMK4U/VHUWDW/NT+tbiEmHJ5nH8ZC?=
 =?us-ascii?Q?VmtEzBqO/cq6+LFo8iaiYy9kq52MMCuMDreMDyTbv4j5b0VB/rLDP+fF1ILe?=
 =?us-ascii?Q?1WkX1oH+7w3a6P7MI6IA04zonhdVboxaA/okpFA80952XAiO6CA4+r3R0aQw?=
 =?us-ascii?Q?BZzIYbSVMetCk61WHE7hA7+luwi7ihK8pVNcPXTIMCgDQleYsEYrWAau30yZ?=
 =?us-ascii?Q?rJJTsTnvOIOOWRMJjl63qCPzDyOlbkT7cysvHFKB6135kolByccFXL0SmwSe?=
 =?us-ascii?Q?Lbcis5zLHVRWT0WoT4V8+VrIHdsA4gBkulAZaHfQ0Im2mCkgOCFBvNbHneFx?=
 =?us-ascii?Q?ZTkqqNZX9Ia+ykRY1vnuU7zK7xyeXGXGolJmublA7Eyh0gQvtDjxEYjT0tbV?=
 =?us-ascii?Q?oIuLGhD72D51f5+LMTyrlCGOyGC5YDbgXeDjtwD1QAjp5D+rIXCruI684leY?=
 =?us-ascii?Q?GKmmEXEUqrw8fr9IxOsCp/SbGHifmIaqOU+jiH6AMS4qckondrKnnMjZDFgM?=
 =?us-ascii?Q?1UcLKiF7mVip99fMy1/arwT5S0c0SF2rcw8gR79QdfYtN1Ng6kwTXZcAWVOj?=
 =?us-ascii?Q?bcaEtkPZ4LCWDrTjmvYxIgbW52wWsGI1A5mwmcYKLZHTJIn2dqudHqgEFXPs?=
 =?us-ascii?Q?HeFb2D1iOR0Orqdo/vv1xAAW/X5oxvU7k/l/6qa4dZANpa85QoopNEGiWT4y?=
 =?us-ascii?Q?Qoi+1sffm6M4UKZgYAM1RwcRTD/NHRHLBbq8nIYbw0tf+eaQ4qs2j8xrSkN5?=
 =?us-ascii?Q?j54+Cn1JJ8LwR/8wPX1i+bQ176J9NzPt8meowRkwqwScBYxd88xYNH7foRrG?=
 =?us-ascii?Q?9nHH4tV9zrYKvC9ijkqcbJvMoqVfCh1iG7VbIdorYZ7+AOc5BRP4YnNVr9g2?=
 =?us-ascii?Q?nkt51onJlRiyrz14Pj9cTnOqZc4ZM3gCHLA6pAOYe1JLt0vx5sXhftYImU2U?=
 =?us-ascii?Q?M7XVg6ksOoklAy8XTstCdYp32XobIZX7//l4fgobRPU7vPXgh4YvzWLzidXV?=
 =?us-ascii?Q?yxqrqU5Gm8PfOPYasdKFwUriDUyiuJI2CHpB5uRZaHTwgqCHtC/lbiI4GFZO?=
 =?us-ascii?Q?TC5pRnu8L4IAfsmIL6/4u/AvmhW3nV/MGSWOl+lWsvdEwOry6UOOiHCBiEJQ?=
 =?us-ascii?Q?J5Y=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 656b6c37-6824-4038-a14e-08dd6e048957
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:26:32.2312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9105

From: Aditya Garg <gargaditya08@live.com>

Hi

This small patch series contains various pending patches for hid-apple in
a single series.

The first patch moves the backlight report structs, that were incorrectly
placed between the translation tables, to other related backlight structs.

The second patch makes use of switch case statements for the ever
increasing lengthy device table for fn translation.

The third patch removes the unused APPLE_IGNORE_MOUSE quirk.

The last 2 patches add Apple Magic Keyboard A3118 and A3119 USB-C support.

v2: Add A3118 Keyboard
v3: Add A3119 Keyboard
v4: The "from" email in patches authored by me was different from the one
    I signed off using (thanks to outlook's weird oauth2 requirements).
    Anyways, I've managed to get a workaround to get outlook working
    finally, so sending them again properly.

Aditya Garg (4):
  HID: apple: move backlight report structs to other backlight structs
  HID: apple: use switch case to set fn translation table
  HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
  HID: apple: Add Apple Magic Keyboard A3119 USB-C support

Grigorii Sokolik (1):
  HID: apple: Add Apple Magic Keyboard A3118 USB-C support

 drivers/hid/hid-apple.c | 126 +++++++++++++++++++++++-----------------
 drivers/hid/hid-ids.h   |  10 ++--
 2 files changed, 78 insertions(+), 58 deletions(-)

-- 
2.43.0


