Return-Path: <linux-input+bounces-9060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67247A05D23
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9E61882D24
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 13:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48411FBEB3;
	Wed,  8 Jan 2025 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="nnck73Nz"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10671FC7EE;
	Wed,  8 Jan 2025 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343926; cv=fail; b=oXdx5piIBSlpil5Pgi4mGA3H9idyA6DTlHmMOFcd3MVtkfIO780pymBYmeJHo7KWmMcQRVveryL5HQRARtwPS1tfpomnBTsVNrSkjHzFOUooomJrNXiGsCeDdSkWxK+42kf454ndethldBVpskNhaH44mgXwiInWf6GeggM92tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343926; c=relaxed/simple;
	bh=2Z1teY3OcJIyLgiqndT6qbnDpBq07+V5KhwTI5mld10=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Gb+fdwRkDPG8bglsIS2U7VzQBwRNkfHVKAbsyvqV99nUZupvNkSx62VLHagEcwnc+IgyWSLbBkoP4c/jTj19ESzGwRfc1xuKDVgnWLnnJxtewu1o48EQ3OKoDFRD6O9+T8e1fOPD5wYwuGsApi9/tfvSlO9glX3B8QIWl6UGd/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=nnck73Nz; arc=fail smtp.client-ip=40.107.20.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw8ihxgkzfWnDC8ADO/7t00sP0hLZkjBNme5ilVJndWi8mchZ9M39KE9PuUymrFwRpQoRohP9/DApxT3T/SJ0brCEv1KhxzLHjrUg7g7kLhIy+HyVS7ESQZB13gzwzKIEVS1y7+JXE7hZs/Nc0zyYIImxD2ppzs0m11gKhAed+vgqOHBo5JhoasDrIoRoXoQxvk4XMEGj7ADyVmIoPd2IKIehwaInpxZtle5Ybl/8eDP+/orMlThtBGD7MSKMhB4txaIi3uKLcNLbQAopO0FV2o1CJYJU5j3dXv1gVjVEObcU1pqnFVfIzGDDzr7bMuJV2/iq46DOhRDvpHl73dgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TsIflodAKFXxOc4kD42XN2FqgX1uO0hBcykerJprxc=;
 b=zNmOIyRx17qIxqottEQGClldlw2y6slJFD5+aBUxPnb7saYmfjM4FuUA+0AtieS8G834B/VZqx3Ag6OeN+eEM5Lc5YTe8xfjcSfztxC9ZsoJWQl4tQP07Yy4zYipi5bqEZGXT2aeDooZgGQ8VjPc42kc7WBywMJBh9Hcnce0zN8TkoL8twebgkPcavWCNrEVjRnsW96ygjoT2y9sorpLWXNt4vVskn/oC0YuqHWpm9TQh1bjpz7NLIQ05GuALzjHIpczKM+kGJOTUFNbIOe5s43ccxRy9VjwEYqYESocyprNOQlxqtOC9JiR3aXysgKIqVsIVwTIoO/uxlSH+F95AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TsIflodAKFXxOc4kD42XN2FqgX1uO0hBcykerJprxc=;
 b=nnck73Nz4md8zZDgqDvdOa+TSWSiE3CuYbGtCnw4IHseumCbq51KVQjmn63GPDL8GDTmxVZGSNbm+RtbJ+0GJJGjYm07kgUF3A3PhU+LGn5Zwgqlttuvb5KtxwZWFlYJ8ii58d5pvldLrU1bxk9CxHKTRXSehAYCpDpnZDM/00o3xfnNcLEFAULNCjgRuExRFCRzBc++XtG5kNFj3dNleYtRPM8i49ypZWgSfdSKIeK3bYsnWuAXtqK4TmM1D3qGZ51HoqRI1Ru2jcGk1ij2nxvSfwEInCKvhLKf14leW43Wz1Lq6uRz1t5gkA+RYiQaHlmLg36Esi/ptmTtS8+mXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM0PR03MB6307.eurprd03.prod.outlook.com (2603:10a6:20b:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 13:45:21 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 13:45:21 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v4 0/7] Input: matrix-keypad: Various performance improvements
Date: Wed,  8 Jan 2025 14:45:00 +0100
Message-Id: <20250108134507.257268-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0039.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::16) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM0PR03MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fb8769-dfb4-4b28-c77d-08dd2feab23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hX5ErlC6P+3Kf3iRIxwE2sMrBjHMP1Il0rbpcA2Xbt/wJA7P9wUrkaqEv0Qj?=
 =?us-ascii?Q?f5eEUJTFBgbkvjOCvCrjIgl98GAwdnDuHZAj5jU/nM2K8e2wu/6Au9LgP0eu?=
 =?us-ascii?Q?24mcousdX2IsJYWw7iGeHq61SzmnlmJhdyYrc6jL1XNi1Z7PeABdTSWJjYrF?=
 =?us-ascii?Q?Sjfa7E7iLmWqpZ0An0xTWwIKFh3JF2bYTVms5M9HNfunjaANNiN908lBDEdK?=
 =?us-ascii?Q?NKGNEd7CXpOD0eJxPFp5QBpaHtKeHkSReh6JYNNOK3J7JCtzRPURyG5S10Lc?=
 =?us-ascii?Q?s4aL/5DnllJ6vlzgK5weAbxFG6lB1v661wsU2+AvBt3OdwRQvtcsXy0qSvVP?=
 =?us-ascii?Q?si5tAPxhCLMk5Nu3uhX5XilSPh3lX7XbxIwKnSb5bm/10b/O0xrV2tRxOVWZ?=
 =?us-ascii?Q?FZTJ2pMpqKuAhjDkIs2lkwry+suMOmrtHy50VMsoCUmxE8Xx1KQi83iIVuR0?=
 =?us-ascii?Q?9KQXkrqovROffQ1UDZaXjPtZ1QDeEK5Y4LGI1HAPEOZt1iimkRhCa418Nla8?=
 =?us-ascii?Q?8SUhMG0hl6d4m2Noda/trdig3jm3YxcwZnzyK26qE8LeZ5QtcM6QrfQaOGZn?=
 =?us-ascii?Q?TsCBJvNS3MImkDxO3L0MJLgnxKSNEP44Lpu/lR23uBfPFlhxf6/TwFOIF9Vg?=
 =?us-ascii?Q?SQvEH8YV1cTaeJoaC6Pmu4c9VWq8i9Dzx9THTWw3IwmSzJRZ8IRvD1rhU+i0?=
 =?us-ascii?Q?K3ejsZOoPxL/jI77Utfu+ObpAhb2ZXhq5PaG3UuT7XlNgLae8rwAHObBdyoj?=
 =?us-ascii?Q?poxLaErQ9Z22e/HkUig4aTwFW6ya5sOjPTCr37+oeXxNcTD7kHIDr0asKT/L?=
 =?us-ascii?Q?ZzIr5ihHKmK0epxqtan4jkMU8wNoMYr6i9txyoZaR48Jbu06U6EPgrHLavzz?=
 =?us-ascii?Q?2RcHJe1sl/6JDkWaAujhASxex77+tuBLzb7tm0mlgotxtjD5sYt+5ZntUsFz?=
 =?us-ascii?Q?vhb6OlXYXnCjZT73ak1IBcRtVQtu+bpNDm4IUHmVwAAKb9JxDtvBv8su+TS0?=
 =?us-ascii?Q?2pEY0BMqVzRUZxjwujCS2ZYgbBR2f9yyouO/UMVS46qIobweh1ofbPVOaVq6?=
 =?us-ascii?Q?WwPzn8Gk1NMAeoqH9VHx9K7iMaTWudIA39xGcwcWK1pjgReoK10cx0Vhw7Dv?=
 =?us-ascii?Q?RPpiJ3nDtFxbDZf3Eg074TfRk3C1OoPAVdDqpCGHM7vlUys2bNz5VisPN4ET?=
 =?us-ascii?Q?TgJ9JgxlZgk/I+dFoCJhzQyjtyCiog4jS+kC3uYOCMxWtv9VZ3LKT65c/klR?=
 =?us-ascii?Q?Inc1P96KXGsE6oayVZKiNZOwJ6oLsmBfCf35Y9+ohGHcXlV7qJl5F6qzqSZP?=
 =?us-ascii?Q?xmzbxCWPbJOEpFcRUkBBB9XYVkKTh3z7mvGAr0HH3Mbw5cVp7tijxcwh3E2V?=
 =?us-ascii?Q?YhsV4M+EzRr2040j7veylzK77gYeRib0ALzM1IHRUqIrtk1/hUtIXGKOy7Jl?=
 =?us-ascii?Q?aGbSFqMxi9VvmdaScfhBuBFh7S4WcmS8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4IJlvtBJn8HnH+CcR4XFS+BMXbLe6fMb5zK1K/DCk8l4qgUQmUv4W6iU50tP?=
 =?us-ascii?Q?ZSk/PLBCmNBU9Hn4AomFw+i1w77yAoyYnCr1hdVertu5GOen5PFrDEu6SSNN?=
 =?us-ascii?Q?FCvjv7cYAPooQTO7726VDty3CqLBEt1f44tjRvMunn1ZHzxEy7alKRNeppn+?=
 =?us-ascii?Q?K6L8cuc/yWYIGiWzDssTlJgUD7ba+Ss5ulVI/c18+rYLy9mwSa4hY1arnG11?=
 =?us-ascii?Q?efTTQAMxMAqNM7SOdgUs9xYPn7EnlEsiHv5eIzX8VvOrs1kPcTDGdZuH2TwN?=
 =?us-ascii?Q?TTIfZX9obx6ej3L2HkvVsybVoYlmh76gxhYPuYlM6gQ5mo9k9+A5ZyJMk5F1?=
 =?us-ascii?Q?RH3dslelezP3AY/HeAdwyao8TVBnvkn4UW3vjOtiwlh/TnvtzY6CDhneEKP0?=
 =?us-ascii?Q?wvKBUOQRCaeOZFOX4umuF22YTRtUgKAN9b8SfVCUUQlHvAYy+oP0PbaoI+aj?=
 =?us-ascii?Q?/plInnAevBa3iZlA4mCXqStcEoJab8wTs9lSe8JihWSttIJFfVfogmfVu2Pm?=
 =?us-ascii?Q?zl1QEMc+7mVpPgrHZirPrSVv1ECkaesi65FF16mUPZ25fMc3lMA42IKwXN9k?=
 =?us-ascii?Q?8nztKeJaFhTE34o+c29jOKkQgrBA98h9FOhGENtYpeUPRV6kPfHHcDkhxOGu?=
 =?us-ascii?Q?/qbYUPF72lk0ns3hVVtOW6im6wui1D0SC0luyOK3thnH0FCXWXNIaONf4LTu?=
 =?us-ascii?Q?uGZd/yUPNXLoYEkVLe9m3mj1IJMWN7jja2Ut05QmM39QYKdxaXM9ArhInGEY?=
 =?us-ascii?Q?fBGL0LbbDxcdPcEeYcn5bsDywmWb6eNElMTD/i0JAHrtixv026GNRsiOwwk1?=
 =?us-ascii?Q?LMNyz6K+KsLp9mgbXGL7lF4HciGP3rA83mDCC4+Gy0t9m1iTlJm2z+fEGyoJ?=
 =?us-ascii?Q?th/bmo4oLTUZtPFx4MmCl0mK/H/Sm9JhabUTZOD0/Kv0YT3AxZ2MXyY5Cq/K?=
 =?us-ascii?Q?OZOzZCPBwOWA0gfh3C8w7tK+TyHmrUGbnSioS95xKECsh9zjyeXpUIqvxV8O?=
 =?us-ascii?Q?bg7f/Pt9k3G9LEN9jWuMMSsi/lfOmOFvKCGl1GFDDqdIuVXv2n6QIRDELLe/?=
 =?us-ascii?Q?kC1CRWXT3BjgyZCR3Icvl3tgZREkbnnVF0Nv0lc7UHJ5on0uwZ43l1Xhu6zd?=
 =?us-ascii?Q?t5q7vrH/OOlPyERioEiX4o2s4oeW4BHX6f3VMz0vehWq/1RmJGwf1vJo083K?=
 =?us-ascii?Q?QFCvTEAB77yxbUEZ1Vr4RNEc3OoVW97jIjdmreNstQc5atDRwVtmALU5TfAU?=
 =?us-ascii?Q?wJ1qVINEbDdw5SuBSLKcrGZgUNgOqBjUyhEw5Z+3pqroOex6+GgmxUzIyEIa?=
 =?us-ascii?Q?es0ByyLnrHZOo34yGDZIjfOrNAXhz1K+tZfP/IwmEAqYhKeQCGdnZyJEr2ci?=
 =?us-ascii?Q?6V2h349zlODRXz/obvhkrJs5Dy4FXuieyE55NlBgD41/QQvqf/8gXIbTe7Z4?=
 =?us-ascii?Q?fmFwwI4+wMNNkL/oDnQeXtJUiuQeYjR57a2IEYJRj9kAnzHb3froMb/MRaWD?=
 =?us-ascii?Q?dIvZRnt6oB5Lxu1W5L55uInrO9+OFD4OClh7vYMoMNhEJwf/FvPIN+HB9eLr?=
 =?us-ascii?Q?LXGTXfpL7BgWkzUQQlGMg0MhrcnBRFpqotfOchku?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fb8769-dfb4-4b28-c77d-08dd2feab23d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:45:21.6980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIuoSAbJ7xtP1FcHjHyPxAeJ3oOGOFZJwjCpslvj6JzAreAyLSv1Txa4pTLAeGzaQ8i5qJaE7+cv7DPRFf9DxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6307

This series is needed to avoid key-loss if the GPIOs are connected via a
I2C GPIO MUX that introduces additional latencies between key change and
matrix scan.

This series applies on 6.13-rc6

Changes in V4:
* deprecate gpio-activelow in gpio-matrix-keypad.yaml
* change reference to linux,keymap in gpio-matrix-keypad.yaml

Changes in V3:
* fix 'references a file that doesn't exist' in wakeup-source.txt
* remove copied and deprecated properties from gpio-matrix-keypad.yaml
* extend patch description to clarify the changes
* rebase to 6.13-rc6

Changes in V2:
* added patch to convert dt-bindings to YAML
* added missing dt-bindings properties description
* removed [PATCH 1/6] Input: matrix_keypad - move gpio-row init to the init
  it would revert 01c84b03d80aab9f04c4e3e1f9085f4202ff7c29
* removed internally given Tested-by and Reviewed-by tags

V3: https://lore.kernel.org/lkml/20250107135659.185293-1-markus.burri@mt.com/
V2:https://lore.kernel.org/lkml/20241105130322.213623-1-markus.burri@mt.com/
V1:https://lore.kernel.org/lkml/20241031063004.69956-1-markus.burri@mt.com/

---
Markus Burri (7):
  Input: matrix_keypad - use fsleep for variable delay duration
  Input: matrix_keypad - add function for reading row state
  dt-bindings: input: matrix_keypad - convert to YAML
  dt-bindings: input: matrix_keypad - add missing property
  dt-bindings: input: matrix_keypad - add settle time after enable all
    columns
  Input: matrix_keypad - add settle time after enable all columns
  Input: matrix_keypad - detect change during scan

 .../bindings/input/gpio-matrix-keypad.txt     |  49 ---------
 .../bindings/input/gpio-matrix-keypad.yaml    | 100 ++++++++++++++++++
 .../bindings/power/wakeup-source.txt          |   2 +-
 drivers/input/keyboard/matrix_keypad.c        |  38 ++++++-
 4 files changed, 135 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml

-- 
2.39.5


