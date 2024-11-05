Return-Path: <linux-input+bounces-7868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F919BCD6C
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 14:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC57B1F22469
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 13:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C91F1D5ADD;
	Tue,  5 Nov 2024 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="u9L8G+Db"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013014.outbound.protection.outlook.com [52.101.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E15B1D5AD8;
	Tue,  5 Nov 2024 13:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812153; cv=fail; b=aMNfrOkdSW75kLju2ZGMb1LgDTnnF8L6bZIKL4IdKZ0m7054VOGV558O1a3hBIop8ysggwvHdYedc5j4yuirF4Y3s3mEecCG50t/6Bk4N6SWbtNUd8Y3mlOaVs3KW9RcCMl5jngI38QoAUwRPyJj5xr6D48994G5qfLMLcVJjTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812153; c=relaxed/simple;
	bh=97cminfygcJ0WzWaNhgmGf/NrEmvXLur+La72m6xQV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y9bS93Hl+wv3Wpu/9VGi6cCu3VjU1U/mMrlpzb+MoPTmPChZyRFZA0gUfXfHtCKk7SUyJgnXTknRU0PCNnQtqxm9zNH9OD6XGWiY1YqqENYaxYay09drvsa99lgHXKjW3BevgFjLqahbtNKKsTPHLzNWdfXT1dFuqbXpIf9ZhTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=u9L8G+Db; arc=fail smtp.client-ip=52.101.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfYqKD78TqDpZ3AqywSugHLkpfG3qAlCVPQUBN58SNaX4Wewgax2gkXizmbTm4wgUT+7j4E/7+2/45uLsTz1S+vverYzda4szCz1ET5GIVboW7NnTWWD6gRBvaUQAAxIcfJ7772YtksVOYq37i1OmwsAa2t3rHqAqBa8NVRAwQiP2TbWZDIGpdZLdcTT2LAIdNcqzxqCfj3SDyLm6+brm8PQd+ZgkYBReM0FwUm8aSO3GXI46t1rLJRV4/l1ZVbwTAsZRImJyoADUjtYTRgVuScqtPAYKkfPK5NWb8ASl/0g8yZ9pp37soFXYaYr7c4umkic7tZF4vrAA78eVGhnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYej+qYxT+3Dl4xThFc85ZgKB63Vt4xcWAkfH3Rx76g=;
 b=w7PWLg5979Rb4RDyHC39AIWUGIeBievSbKCGXJ3nAActCS43yxm8vHmn7U0fMemXrcPYTiWLuwIrUubcunKc6niZocE0Axroca1OngSoDUyvz1xiiXimrCRta48g6jF/rLelEudW40Mnb5LLmBNfrpNLOYGwk4Hqh7fai2pED2oOrukJG0BWVyC97QewTR/9dFGLN5JlpRZiSSTFAa8EHXkerWy1HQVCXewHmud3qiwjavW2Pt9wvsziuyRyeAnDFM5B1bqr9kEPaPDTNvGe0Z8Ii4rRRDG4nOf/o96Z/OFLrhgfyrYzcsEF3PwAlM6GeCJJC545fP6GicbDqI2XSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYej+qYxT+3Dl4xThFc85ZgKB63Vt4xcWAkfH3Rx76g=;
 b=u9L8G+DbcHN3E8lYEa0jcqlkFqQyzC1LsHyR8QOSkur2SoLw2qhMfIgyoC1hkJs3CGZVmB+bE7Rc468MrsVIcHehVU1hWBkDW4EcwUvm1EeFKCz18cmVUElipk7k0rvuKv5wCpjOM1wYJc9HWh7AKJDdTkbp5f3ZRzRJW+RILWKSYSCpofeuhlByGLkOm2S2LT3Bq23uKXe6N4JmlAb9ErDVZFg1TesEu7W5Sp9e/3o4+DKf1LCoZfSaTyT5Y1KcgCNxAs2pW0csMhl1FbbrjSdl82gJN+BlhKHaGx9lDgXmL4tC/M5I5wONCDKUiTdo2R6E6XzMCywi7sgfKx54DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GV2PR03MB9377.eurprd03.prod.outlook.com (2603:10a6:150:e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 13:09:04 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 13:09:04 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	HeDong Zhao <hedong.zhao@mt.com>
Subject: [PATCH v2 0/7] Input: matrix-keypad: Various performance improvements
Date: Tue,  5 Nov 2024 14:03:15 +0100
Message-Id: <20241105130322.213623-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031063004.69956-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0195.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::11) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GV2PR03MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: ac48a5be-6116-4d28-ae79-08dcfd9b05c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VppQWzj0lT5CJUuMa/pXM+NZmTYLaHX/Tgm0S2N0T3CGKRwARDzKZ6gJhOd5?=
 =?us-ascii?Q?sUSLY3v52uCcYW+Y7/1p+WoL6Ot5S2F6mjqHVADk9srYrCk3gJGjUcCdT5dg?=
 =?us-ascii?Q?gdiW/1JaaOzTxha036VtWjrW6eT7w0TtK3SyGV8WQdkdqYZ1Nhc1T/YzRrAu?=
 =?us-ascii?Q?CqsEvDjS3ymV3z4bkKfi2OOQtOq1EROnYhUaqdY+ZQylsbAeJzULcDBWp4yY?=
 =?us-ascii?Q?ekfTHMlyeGKuEoQ2NkAEp+TES9mLTUtLF7Wy5DrMLgcEqtnf1zSF2gcHXTsi?=
 =?us-ascii?Q?7juvrNSjhIj01Dt3ZguojzzhebahLue/XkfYfKI0xoac6UxOHUJGSeshfGE1?=
 =?us-ascii?Q?ugtW6rPe94pxCXnuruv+wzqegv2CvFQe2ChpPhPsWy5aMUH7bukTV9rmrVpo?=
 =?us-ascii?Q?2d7gnEW583BZ5UL8zudqBH/QGXhDSqJgMm2TWDZkLBSapIEEAOLG3aYAZHln?=
 =?us-ascii?Q?mYfLHh7zAihYEQBS6GJ0AckDtDPBC8l32eqtNzvhl4rj8KTVfanAKxbvNiA0?=
 =?us-ascii?Q?W6bsmiJeM+sZfxsF5hHkA+mwcY89VPkkvXWuBXZrEgpm3qyvhh4hPiiD2u2l?=
 =?us-ascii?Q?99cQ+c20PvhNiBoy0vDm3Ru01kfXviG63nxZQra8YloLleoUOiW/x/6WcPdb?=
 =?us-ascii?Q?y7K8TP+4It7szsI2UA6SH2yirnuE/aAbkCdiOoIRlN5sXT8oRS7VCN91E/8t?=
 =?us-ascii?Q?93UaowBvayy/hZrDUyB8ukZRz+nGSfCcaU16DqcYOi4dfRkIuA6cM1xsDO9+?=
 =?us-ascii?Q?115TdAO1T+j+DBIoQtmkRBox1E83pOfDZvHcDoJUHsKzrmupUR7ueQgBWyDi?=
 =?us-ascii?Q?XDETGQoKphy0bJ4Hjhy626FE8XBALfOiaAXK5XPTLNzv1jP4HJDJyv7m8GHL?=
 =?us-ascii?Q?g8406H0S6+Lvo/7q5J+jv+GMOLUme+3qKS+fwFjHs6jnGtNFNCC6qhH7cuqK?=
 =?us-ascii?Q?AhEy1CE+TnLH9ECH5X6AGEg+51BV0/BV+loetsTKfwMFhN2D5yrIrTY1eDIx?=
 =?us-ascii?Q?ifHGHr0hOsaRykV1vuaqvmjpCdYsVDx31I5U9spYBbUvD57VYG7bXimI2ONx?=
 =?us-ascii?Q?k0kbXWDHIn29oMsKQzeJLtSh6a4xvu9qeQqMaFd5Gl1VuVi7LHqm76GgqGNk?=
 =?us-ascii?Q?e9h4UcORGNYAUHEgIF9kb2YNfaerhzau2XRae52hwjbUViIknTJr+YZU66XS?=
 =?us-ascii?Q?mPHJkmko7FDrtQIdXMqfMhyG30UJjs5vDrdkIqCe05LzwXrh17nG9+jFyrZe?=
 =?us-ascii?Q?rISs4YSVhVBAZySkDvFJsiXzLWGapmONKYwTPE3lVZ+1o0Yrwt4DDCHyPCeh?=
 =?us-ascii?Q?xSA+FdNUfPYbHt5/rucfDw9qufrteCU9xx4M1Hl+L0pmiLfetkBpflVjxcYA?=
 =?us-ascii?Q?Y79V3QJwjp+GfP5lZbWEnlyaiBCJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ig38GHIS7qXSbYkgdANK2jpgEzcIS618cpyADVgZmt17YRQs2Bh6tjnpRgML?=
 =?us-ascii?Q?zGn0CT+55C/jxlu3mE4QPngSW22oVKSK+oQDXkYXXjD/J8jpoZTFJOFPFoiN?=
 =?us-ascii?Q?F0y7k/rXoGAsEqp1+58Vd2xneOSzj73YUzoSNosTv1ZUbtS6z+1lwP3anbNr?=
 =?us-ascii?Q?Id8MiSYmvJurCB0fZA4j9Utrwkv7s5W/6ysGXw4AzWTYBN3VwqxFjXVMKgsz?=
 =?us-ascii?Q?qLR3nsJtjuFsL7JwgpxJqwJoylkx98QpO6sUn3oyQNMsWAJQzx+HevZpc3mG?=
 =?us-ascii?Q?kcTM/ISA9p5ZnsVcM82kHFi/iLFySgRLn4zjwkRhj4U3OA2x4yV9qK2CiXji?=
 =?us-ascii?Q?wU6Btn33FhcOPjw82sHJCqjvyY8RJ0ZmPI1intgD4NXdiK9aaHRK1h4ZhgmR?=
 =?us-ascii?Q?RBU31DVutlko5ak9Jkwnigsk2wPzalj06NJ0wlssRk0CsIY3UdwcrLevzsC8?=
 =?us-ascii?Q?z1HSFWWhyWHVSZSV3dCLqTrdzMEGuN3z6a0HOz7h145z6Q1GktwKSTSq2jDe?=
 =?us-ascii?Q?+utoiVN3eckG+r+v6Gg6f9oU2b0fWSexjyd5K3VOeISN16r9VFxRVerah4Hh?=
 =?us-ascii?Q?jfxnMjBEFsQDpyUS75C9egtFGLwwrr33ahTYRrJh32UmF5Bnw5+ZynwbcZMk?=
 =?us-ascii?Q?ciZho2XqZHCnxBDdjgKeg1leQQDY9XybRDjwE2bvIybtHRfqQE7xhzOVLht5?=
 =?us-ascii?Q?q/LurucJdC3PcQcqHeYOZF8Jah0zmKXzHS9cWjLCDjUMiZk5FeTZc9duK5C7?=
 =?us-ascii?Q?YoTDFGHS9juBP59Xr+pOmn4w5/o6jtXO99GySThJX+3yoR4vx1aiYw0EKS/k?=
 =?us-ascii?Q?gSgUIPvNqjCEz+ggtWVVQ6QIlSc2CDJ6mjmqPDzxsWhLbRVxDez0cG5rGUPg?=
 =?us-ascii?Q?yG6cApNkjQGwGf99uKPmTDq7Erl0l3UM0XSu8B0fhZum8XQxVLUBsLOGZdrv?=
 =?us-ascii?Q?9pV6JOKdmu9k6nQ5WeFmw4OzmBIGyFTv5ziGDEtdO3bwb7w3mh+i/i1/sBST?=
 =?us-ascii?Q?2mwTZ94fKyYbiJgDhks0Zml9dEIZBVHUHI/cFeCAmq1v4gcY9L7IbJNcYs2a?=
 =?us-ascii?Q?fjQrXJIskR/fRACoodStEVTEZPgA1+APBzj6TYU+JjH/QSa1tQnBOjsrpZcS?=
 =?us-ascii?Q?/aExqfWZN2SbDsuVYJDWCHaG14uePliJQ6g3WEhM9S5euedzrGAvYQvtISH9?=
 =?us-ascii?Q?LV7HqoXmx9fqnQ3QWR+SFE9au/JO0koQOQLEDbfzEMbGjO7WbkkuFgQv8912?=
 =?us-ascii?Q?wB5BHq+aMv0y22YlcPaV22Fm6/Owbn4miYvbMoWR2DTpuaGBle1+6julWQq1?=
 =?us-ascii?Q?K25s6kPPz7tvrwcXSK9DGENcGzOHG/KrfsUgXJ/MwCpVjN7lbE8Tf9OrOWtx?=
 =?us-ascii?Q?ncULbs04c8QLT1r69WWGDdFGlnc9hWtSuRwWsvpyPgJ2IjAJcDlN2lqP0ewb?=
 =?us-ascii?Q?+UGbrA7S4cm4UtURymkjU9yIqz5pDRRyA3oR4SDjhnbseaJxFf8KpoGDzEv9?=
 =?us-ascii?Q?z7lcJGqehp1N6lqcnO1Z7BQfY8L07vCQfh4yXJhQ7MKejqCz2I11kaDpzYQs?=
 =?us-ascii?Q?OkuoEh7GNyR2E8ky7XKCx217CfvRZgryM3w3tzUq?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac48a5be-6116-4d28-ae79-08dcfd9b05c0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:09:03.9883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtDQpKUGTDDtuD0JzsYDRYtd+vGggQFLjMtzXcCMD7XgH5d4Ps3GrRdlWzZdfZ8R7wh+id+YdwkYEPW76bTrvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9377

This series is needed to avoid key-loss if the GPIOs are connected via a I2C GPIO Mux
that introduces additonal latencies between key change and matrix scan.

This series applies on 6.12-rc6

Changes in V2:
* added patch to convert dt-bindings to YAML
* added missing dt-bindings properties description
* removed [PATCH 1/6] Input: matrix_keypad - move gpio-row init to the init
  it would revert 01c84b03d80aab9f04c4e3e1f9085f4202ff7c29
* removed internally given Tested-by and Reviewed-by tags

V1: https://lore.kernel.org/lkml/20241031063004.69956-1-markus.burri@mt.com/ 

Markus Burri (7):
  Input: matrix_keypad - use fsleep for variable delay duration
  Input: matrix_keypad - add function for reading row state
  dt-bindings: input: matrix_keypad - convert to YAML
  dt-bindings: input: matrix_keypad - add missing property
  dt-bindings: input: matrix_keypad - add settle time after enable all
    columns
  Input: matrix_keypad - add settle time after enable all columns
  Input: matrix_keypad - detect change during scan

 .../bindings/input/gpio-matrix-keypad.txt     |  49 --------
 .../bindings/input/gpio-matrix-keypad.yaml    | 110 ++++++++++++++++++
 drivers/input/keyboard/matrix_keypad.c        |  39 ++++++-
 3 files changed, 145 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml

-- 
2.39.5


