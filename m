Return-Path: <linux-input+bounces-9127-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C995AA086ED
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 06:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81A4B7A2C32
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 05:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2432054E2;
	Fri, 10 Jan 2025 05:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="eYwMlA5e"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0510A746E;
	Fri, 10 Jan 2025 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488197; cv=fail; b=Teu0NqJzfSUsHLuyei3cnDUg8GWpkTddeAtPTv/HC7BDfMFNFCdCZFgv1QzfjlG/Uhon26T3REeKTFd2lwTLHq9/mo0P/EX7gfMuNvuqh9JYgZJ+QXr3tFgW7mt0MQeUFj3aagkj8yfW390MF7sW23S7qEaYWz/52DR3MerhHQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488197; c=relaxed/simple;
	bh=4tNLmq7VD7rWPfsy5TKsccodxLqAYv4L4Vo1OF4xwnM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Q2GDOH9tuIxgJRD88Vsy8xxmjzXd8tXh0W+HTTITpXR79/6Bcodg0VM/N8EW2VBCOuIlApcc0lwcRWueQSZkKCT6mgEqwJ+ryciBtuNZqRZWZ7fWhvrD1Xg04iO/OQ4JQ/S9DHEC0SQkStGwaG/oMNNDaQYbrGmTqKbyqGwuK5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=eYwMlA5e; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9CSiMbZRmbHsuoVe0UGu9HGtajg+yL/+KKTNUF8kOAI8rBNGf0oalP9nugtglVB/ezFMXxyCmq7+OBWRXqoW1IXsu/N5BmXSbgYPcjJMaxX07z1O/JKoIQ0Pgrwvi1SkHW5q/qWD6LwTlkPN97D5zfdYOcWJbmJM3Gu+FNqUdmIJEMUZtUovA6ha64rMveH3yI/j9HxhRfmyWl1HwI0AsXb/IAfZQoFcFxQuVS7G65IxN4Mz2Zf1z3fIT5PFbdlnrNy4Cc1snk9OxxBBSncJG2wW+N9M0cHm+wZ28kedI0ur3GBjVwjKJJKGimKlYb0w8Ge2lE8EhAIHKDZ30iWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J55ApGHmRuM0X84KK4cSWJnXzMvKyBMS6mxWiupd80o=;
 b=orTyZONlx/AnRdeceUwVHX1Z+ER3zVPvQE8aF/jbCJuvzLOrrFn6nEfgKGHhhxyfuCgE3Tpa0Id5FAZk7CqxMtDM033LRgMPR2J1uH2ft/vHBaVr1QNwWno01CLl5vnsEw0Tux5ZDY4yGYmsexYMo9KO6Kv4d0MGc5MQMVvK0jH1EUzCDomcnL/mynIWiZbGnTVa1hp0jJfuo+nDQm4f7nyCdCrc8jLNUPvv+2FHNOUxP6X//SZOE5m7BH88PTgO4V8I/mFUQyX5tN3/tymhKm7yfmYFVxyCGIl6QCo3K9vr9pbnrGhtLUCbw/0ss8RrBRzKqSszzfZ+w0tD/EJCow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J55ApGHmRuM0X84KK4cSWJnXzMvKyBMS6mxWiupd80o=;
 b=eYwMlA5etRfB+Sbrro00vM3EWmMoaxBBlSk+ReoxhZt+pi1cIF8ASm6EBInXgln55uLKG2bJL2p880xCfQ9/HHazzKJiWvefNPLJDhfKgo0YSWoGqep15L6Pzjq0Q3OZUwhrE/jcvfCyfKVRrdooYAMaFO8GS2HrHSQbW+NcjEVqsnjHCNC1trtmPfD5aM1F6lQSt2s6jMiW7mYYSW1p8wXdBVwWipOEYtLrJhvliaFxrwLbOIzcJ5GFrCJhlv6W1dkcK2YqQHJsxm5eNMUEPYGuazFP+U5wp8ZQI40UgBuo8RpJGrpbB7A8mzagUBOfREVokU6J8cqZ/lXJDtrIQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6435.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 05:49:51 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:49:51 +0000
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
Subject: [PATCH v5 0/7] Input: matrix-keypad: Various performance improvements
Date: Fri, 10 Jan 2025 06:48:59 +0100
Message-Id: <20250110054906.354296-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0105.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::20) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e5a8e3-ba88-4683-63c1-08dd313a99a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?272K7QiGcTVM4h460yHt2VBP3VkrIV0hxcF0bvOvloZm9+zVDMYvw4TzMoQP?=
 =?us-ascii?Q?kpWljNBNuZzyq36toOFuJY910CnA5UN7XuUaEcxuMMFzRn+co3WaJfs6PkZW?=
 =?us-ascii?Q?xFui7lhoDFkTJOgEHXsw4daUD+SY+pEXpdUfpD8QVnn0LsUKXKIQqVhJ3ooG?=
 =?us-ascii?Q?0WEdhQxE5CTDMVT/05pGizYXUyKmD33X/RngWW/6qcvsTuhoClihWfBQW5dg?=
 =?us-ascii?Q?FkJ0IpbR8eLymPeo9FIiO1k2SqqYO2fwMVIhIkXHOxxflybfKVmBUmM4GlBd?=
 =?us-ascii?Q?FQORUQaRXPzwn0fHdrzZ5acoUTCYFVirVY3z/U5+I2o4Q4yTPa7bbjC2Vj/j?=
 =?us-ascii?Q?50f239jHnhyT2ZlJ2b2O8iWmoapm0peZ3iIcJ8/QaqJ2vT8RG2DwIykZSI9+?=
 =?us-ascii?Q?I6LvTw2f2YnS13HZWos2JIQoqr2qKzBeOfPSscRrHKtVkGfyrFd2La2O7DO7?=
 =?us-ascii?Q?TdkaVVnjbp52w74dRUYla5h+hXdGCXdES3u2dA+KsXlwxHoPjVGhSx1gO4sj?=
 =?us-ascii?Q?HeLD4XSFlSYIRDQA95to9BbInMtJmgs1Q8sfOwicigeHpTs/WBP0Pdrr/7Nv?=
 =?us-ascii?Q?98NAE2MHmcKVYCQz6czuYDd66AqnGhk+r5cQ28AhGdAbel+aDj7mpFEheIPj?=
 =?us-ascii?Q?JxbL957i9X1fNuCZVM+I7NZgOA0U3A7DBRNiaa01AgJbMYLP9+I0vw2CVf4Z?=
 =?us-ascii?Q?fCfI3OqhD/PWde3gG1mQ/SaI5VhKqHnHR3dcp52qjhWaWlC2tsCbEHTWvIz2?=
 =?us-ascii?Q?5hfodSkPRjtJdHMhXmA3m8CSJtcXmEBDOhJYjYtUzmv06aNKg83QeXmVpRiv?=
 =?us-ascii?Q?djnnYIRX3aiFv7X4a2C5HWYBnqen+x5chK24VGt17DKD6rvhDBs//NmyPmD1?=
 =?us-ascii?Q?q93qfA+WTUwaZAyVJ6vYglTnURujimIII9MCvMEzixpEZ5aGQKQdU0mAfigG?=
 =?us-ascii?Q?WanSu785y4VkbDEftpEMYLommEjNkTy1enGNnGTtOdqRj1UcJ4tYRYNQEMnb?=
 =?us-ascii?Q?zVPWeKeQHA5PjEwaQBzPuk0bd0KOGJYcJinunMwMoZES8mhCl8KFROjgZ3/m?=
 =?us-ascii?Q?Keeo1m8GHFuFsNulfV0Br9M2BSv1s8n9VMU4JbihYCgTTcw017T+kEnRhXLG?=
 =?us-ascii?Q?mR/HgNi7AN1ekAIXsX8WDYik1zyGLFNnIxiZI5eidLPv1G/9Jf7d1rhvf3am?=
 =?us-ascii?Q?v9Svse9AIypjxsnPUYvDr1DbnCb7zQOF9p5qrN5lLLxlZcdweCGCEsXQNmTr?=
 =?us-ascii?Q?OSMNpAH6d+JVMQOL0Y3EyF/aXSsh3XIEFC6Xg3E0R10eNeP2IfyzeCz9wPZv?=
 =?us-ascii?Q?sjnx+0Je+HnMvd9HA3EaJRvO3lHe64aHxSSmZ4xe1QeReg5B8BOMquMXAYx2?=
 =?us-ascii?Q?2Y7nyMHlguquDuiE41IsBSfOd8hKOwJNhVpEB5+SPd7VD5lpBf9I6DbBUStC?=
 =?us-ascii?Q?HGLEchh5cPCy8d6iaTQvwV8SHLpM8itA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MoAyHKHlMV3K/1bEGXO6g7FVSSAnkWzbUEX/1nSyVxMAkKslpwpm5EN4jzzw?=
 =?us-ascii?Q?//y7AuevtcrgSy6IlhXOxNH+lWGXi9tv0zFs9UXeLDRz9m4N+nuZVlTcNFA0?=
 =?us-ascii?Q?9v5pFdwZwKDk1vRtkEknW9NFWgDhaF9sztN5AqBh7/fyC5ypqtjOg+pFiZnQ?=
 =?us-ascii?Q?QQSYy8rOOeGQp3GaROXio+foyGV2vXwEGvBHBCuhr7xTjRnVcBRfaaoiN94U?=
 =?us-ascii?Q?LkAYtWOVlz6vQ/yeCKeT6bzM1JpEzQ6jR94umcrwSQhUjIWN1JadW2qxiGEF?=
 =?us-ascii?Q?WQ3fxt7W2CFbRoWFGax3DuK4IPYIjZcMFxsCAi2urClQMHP+K51SP/Z4XwjO?=
 =?us-ascii?Q?v364+n6E0C/1SeWbvC+pkQXAK+crJyW9BvUAZjtSwHCE/IBXPhY7M8O5cwHC?=
 =?us-ascii?Q?Sxdzw0op5PN8Hvx3JD1st9GgB/X483tlMRBCM+dFgnmRxOH6sPAMVCDuIM8C?=
 =?us-ascii?Q?Ot4CQiA814fySl9sPoxO94ynB6bYHpjdGf2U5FUdlNG+k6hZsoH5XPvabWcr?=
 =?us-ascii?Q?8pO4S6WNPIRaafofjRdWbYFnbK4yGPjTp9jOvcRvgMvIaOn4pAWAm4+tv6Ig?=
 =?us-ascii?Q?YGiBmxUaYR+AdZW95vX5w3SL4yyF1oIAoLcibHIVOsrImsXVBwstCGADsPOV?=
 =?us-ascii?Q?QR7F/7iFFDxIlkVCljjOF0OL9a+Oacl9D9K0Vur6GzcJ39vx3mOQGgah6egB?=
 =?us-ascii?Q?O15C/8cn0AWZunK5brUziELQ26BvO6TwWkbDoHlOpQrHr6ixYGZynmV891jb?=
 =?us-ascii?Q?4fJaIO2zrP+S/3/hIDsOcybFVB83pTjennNMwm2gaozrnhq5UQOVT164SMHt?=
 =?us-ascii?Q?PjUPuXAWDIHjqo+GwDowdqmrC59M5X/vAXzzMijva7Gs6SRPSJaSe5FP9yOH?=
 =?us-ascii?Q?CFCvW5/5CoeT2q3OemKV4EvtnIl+O19aSocYQf84otVhGqhqJcPjVbcecVO4?=
 =?us-ascii?Q?24mbD9GF6Y8ufHPym2vNOCDlZfweprEXgsvtn2/jDhefOH0BbyXfpMzwb+Fu?=
 =?us-ascii?Q?3gDm0FUj96E+JLzZplJUEkBvOjd0VXZo7IvfYy6PCXKqf0Y2IwTZMi8IHL5/?=
 =?us-ascii?Q?FCQYyg5Nh0yVHL7SdZh+IRtnt6UZiX9vT+OqbQEbXvswiQuK8CTyY3zjrONB?=
 =?us-ascii?Q?MxtPpymUtF9ruCvKOwuNbkjNnizYC/4pPF0EdeLrSWYbxb9g277zfryabNEn?=
 =?us-ascii?Q?0u9MiCAum2Qw3MGPau+SSGM1TI8KKSwGvKeH7zgxvF/ZpROQXeIW4YBo8opk?=
 =?us-ascii?Q?anp1UnK1FrIEW2wT000yyWovNHunNK5udVppSLrMP8SrerhjVkFDCtu1rHw6?=
 =?us-ascii?Q?xagdytNXkTywPD8P6MNq9kgX6lcZcHEgEgUQL8U4mDUih3Dix7Wn/MKFNVKa?=
 =?us-ascii?Q?9jkWdERHKq5CucL+FIMfWh4zl99Q10kjuG//PKuUaFiAffklEPTxowYYlbtN?=
 =?us-ascii?Q?WJClGv8x3+zhEEovo8ET/p2dCmqLx80XRflHbavvWa7NGlv1xHu0dVOWjNd9?=
 =?us-ascii?Q?vBy6vUo7sCZ+EcoFODN7Gu/FHAlDPkOw5lUla4bnLL8piFrnt3gvoYmmTTuI?=
 =?us-ascii?Q?BJeCJeb7iJXvR5nDAES4TQ2euDZJkU+1VUkfJ7PU?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e5a8e3-ba88-4683-63c1-08dd313a99a8
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:49:51.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRTlvu3rzbEh2oAb6IuswXPrVFe2JqJRJd0R2Artvn9vI8Mo1c0MkcEOdfoCxhBZBE1Jr/AGEan1MZGb49w2uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6435

This series is needed to avoid key-loss if the GPIOs are connected via a
I2C GPIO MUX that introduces additional latencies between key change and
matrix scan.

This series applies on 6.13-rc6

Changes in V5:
* formatting and typo

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

[V4] https://lore.kernel.org/lkml/20250108134507.257268-1-markus.burri@mt.com/
[V3] https://lore.kernel.org/lkml/20250107135659.185293-1-markus.burri@mt.com/
[V2] https://lore.kernel.org/lkml/20241105130322.213623-1-markus.burri@mt.com/
[V1] https://lore.kernel.org/lkml/20241031063004.69956-1-markus.burri@mt.com/

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


