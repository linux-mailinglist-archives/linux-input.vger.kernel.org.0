Return-Path: <linux-input+bounces-10395-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B7A464CC
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 16:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB4819C0162
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 15:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B4B229B3D;
	Wed, 26 Feb 2025 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="kroBcgpQ"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2070.outbound.protection.outlook.com [40.107.105.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F36227B94;
	Wed, 26 Feb 2025 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583744; cv=fail; b=B3NCcQTHgNvkT4DplnJ/PhwMB3EMepPxfxTlJ2MOxmd70XfRIBOc3uv0sNeZDZ5JopfGdFLGyg3/VMHj57R29ITk0l+apMne4dlHUPmBSOm077rrminRz4HlrdNZ8Ag9cv48Dr8CC+8Cb+ra68cHDrnH6s95cIfAbTNZ+Acvfzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583744; c=relaxed/simple;
	bh=HfgAgpRWF1+N5pPVvy3JxWPjoOay57lGgWRKwfofpuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FcgaA4NEi4pz7gJWqMd/dv8ef8xnd6zl0bthqGuTzHT2t8eSfWHJBY6YN1Wkx4MJNSINtbbJZl3FMcNIBMGsXStnMgZGShx8Y57tf+PaNyuEaVmGE5ahGRO/b7fZsQszaImjikJGwtwxeRPei2NOEOMCM7L/bj5YJP5tD+xaf+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=kroBcgpQ; arc=fail smtp.client-ip=40.107.105.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osJOnq/vqXa/EHb/0cw2yGPK34pdCaZrNA4vuwVF93sk7nGcFXZHXyJSPILUSUSbPXMo7gUxrU7uxy73u4rVNZ9RT+0Dr8RhWGL2Uxdqyrc4HIosyx53E8nW0oUiAhi+QMT5x9hty84So+584/UiVPpQUD0MFuratg6wvUByr/cfi2Lw9E9qMfKF6CHWAEuyyLAGGpEmvpEO/TJChfJvSBAQFhGqng68Ps/ru2Bej24/rl0zaXifiIRC1STO+31NYoXA4mNEID1qFbQZagDj9aiIiLKFzIQEUO3ojvi1RqjnTwjhZ2q47z5UrV0E1WbO7XdPH3JwxmJhkKjQwg6ueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLNDjyicvauPORHe0Ra5t9h2sgc1kzpLwwZLJLFTU5Y=;
 b=lR5CZWprdvOo2B1GKKKUQVa3Za4CIjcipnrLfmzT3YReF17gFU/3Rvzhy7djKfyGENf6+rsoNNqYSn6uoTskf2Rqa0+iATWA8KhB1/FiD95GLU5+yziMrwyOpKoE9j9pSkltFQqm5SdRkIK7eVG1DLwuEpcyP9OQOXf7b+mxUt/QOwN3KPaW3Ikq6gcwKzxEV3JxEvJeybXU0LxAapiZaR4Vlb6wXRvYEIro+6jWBssZOZH/1LsV4ujrkA/c9WEvQlvl59nTUKmxa98XX/2Z5misfxQsI/RNpJ1SzB4eAVQgR/cYNcdZ8ofyt/b7V/y9TOqzHQtEvvBRHLxndaEiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLNDjyicvauPORHe0Ra5t9h2sgc1kzpLwwZLJLFTU5Y=;
 b=kroBcgpQU3voB7LT8Br+i18l9iA90jTw6r+doEpYYJSLQV8t3sGVF+GvMA0vOr4dde5tzZS+GoaymslWciaE4x98T+x4lpmNR8qNkjRO68jk8a2vfLKhG62E/bZJ7Bag58N5Gn4zhzghD77iB1j2gUVTned3mI6r8A83YI3WBAAPGVIMIii13NHN+Ohv+0mD2AFDBU9Q+0eU1Ovyp6GDqMKZc0j+P/Mq3+TOI0DnGKNYRsyXyk+YgbbanXjB9gd+8QkZCwaEEhgwZDtllQ4w1gLHgrEm4srBTALsgZxakE6f4Fn4jlvnYTpkJ76ZzXCIgkVhYTbt0Jt5v2hA6Hfw2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB9118.eurprd03.prod.outlook.com (2603:10a6:20b:5b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:28:58 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Wed, 26 Feb 2025
 15:28:58 +0000
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
	Markus Burri <markus.burri@bbv.ch>,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v6 0/3] Input: matrix-keypad: Various performance improvements
Date: Wed, 26 Feb 2025 16:28:40 +0100
Message-Id: <20250226152843.43932-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0177.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::11) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: 2772fc54-e85f-455e-fa13-08dd567a49ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t/b7Fzk9G8nPmF6jcaAJPPvLm8zTPXuB91SCjeRlkK7BxtupOVrhfHRWDndF?=
 =?us-ascii?Q?BNaeQdMgaNpaaG96hN4k7cTocgLNa1TfOCZgNZBs4hQ/Vmc9d1pfiTdcgEGz?=
 =?us-ascii?Q?mIvZLwU8yWynuN7RxkhdVBEoTNtaDadIOE4JygDQ9afsZPwmJePqU+O75TrD?=
 =?us-ascii?Q?iKo2OU3ux8Tr6LP9AC3GyvU5P2gB/SogVHCtJFZmwK1rGopy9YMNHBDhn9Jj?=
 =?us-ascii?Q?8H3kD19Tr3vxloXHRF4oBc0t4ocVQsJkPMsbjVL+xrt3NUx1u6khiiZ7fMNW?=
 =?us-ascii?Q?6B0X5k06L31arVhUkq4OgWqlSYDL+e7HwXICN/asCz/o52rUGxutQQr/r7iO?=
 =?us-ascii?Q?mrApnQ8feeAuH1ygI5SOMr2sHkXpH3svsRZmatCfX5h6SyiOsLsS7+YzQ0BM?=
 =?us-ascii?Q?Y2h8zUJ6d+4PHNjFQmfn6pHOaYMnU55i2oiPPt1zW0XlUMZJa/c/R3wi5JMw?=
 =?us-ascii?Q?eowLLJFz7TvleguR9EYkyYQcDX642MxZbKEPdeGoUo7KCoxf2ivNmBf61RyJ?=
 =?us-ascii?Q?r1LbH20TzSDSajg48Rc/5Fx4C2ZJEloiWR42aiXcu2rMykJByhfi9a4EdJlE?=
 =?us-ascii?Q?fMnh5MhWMlm7gjzEGcVHHpKaD+UGybkxGnlo14RxBP2L5qkTb10uS7v4Msf6?=
 =?us-ascii?Q?WAtEBVboIujgt0EgVgMTrfxAQr9+W7U+JluO/MQsCK8JTfBTAX+U7MJ+nYR0?=
 =?us-ascii?Q?g0yHteeLMbunvoVDa9GOc+USmD9JafyHqJ67GiLebrSFVlPzBMUfS0ZH62kh?=
 =?us-ascii?Q?vZh2sKIflPYxWG8aQVTIfsch+43zDZGqVxbwiEGEh7yEINxquPJb8E1rIsp9?=
 =?us-ascii?Q?PcX4h9+zq1dgkm8xpK+SD0mQ6u8zRvIzkvEVmYHMYNGc6G8bUeXCxULKVfEd?=
 =?us-ascii?Q?3DG761fblXSMUsp6SNkDQMMFSMWVRlcUZi8w0/69l9wNMmTxilQ7P5edDmce?=
 =?us-ascii?Q?3/FWep0x+iWI5S38Xq4gITuUwb6d5u31b1OLuBNR6TcRCPlwBqfjVaTm2AMn?=
 =?us-ascii?Q?mRXQ5LoX5o2L6L4TXdlNlLSS1EKQD5lnrRRttBUvsm7Dzqpznog/rqLDEGOk?=
 =?us-ascii?Q?bvjtsDV2lKW5FrC0Wx3tLGWDX799VX8nIZHHdbREroEEmKEap7NLapBHSTMo?=
 =?us-ascii?Q?M7iIsdKNHgTETLvEZPjb/QMnSjYt0PyYdCZAQT99LWMcaVIwr30HjYSwQOYI?=
 =?us-ascii?Q?q5rxQac2Ejrlwh16qCkuKFtS7oXJFbR6XrjxxKd80etCIchxfs+WQiT9FciR?=
 =?us-ascii?Q?4o684F4h3t4UrpExXxzxpSIdlsorRnuAzQPzzi/DVM0Ss0NsUiEINBOt6B8z?=
 =?us-ascii?Q?+NmFEyscEkNk+U9sMBWT/VohI2DaLHGdxhOcM1gMVNw5qV87qUIhTKXJ3q38?=
 =?us-ascii?Q?XdI3qEBZ571E5tLiUcBerLTsQ6xyMaYfRlZBuQ4lweUjjLT5mKt8nr4419Wr?=
 =?us-ascii?Q?1nRWNduYHisavJI0Pe1pKK3PzIpN7/a9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lk+0GDvnzuenB+uUQSaoTlNfiJ+lN3fBpLAxQR8fSkJIbeJuJtWq/43TY87e?=
 =?us-ascii?Q?9ziKq5iZQKYlUjEYoswPQGpn+gSaz31ti5cT1jXj281oSpInixKO6q0HLj48?=
 =?us-ascii?Q?hGG3CWlT+RpuW6retdMf8cci0LlHWqEASddsef6aYkhiHy4qWp8qWkG7ugC/?=
 =?us-ascii?Q?zWrATkiS5jil0+YZN4XlU9/CG8IdfR15qvBrZAUebFNGuzfeVGB4ztoCCLK0?=
 =?us-ascii?Q?eGQn19iFzGhR/y54YROWube9NY7XFH2zsh5Akc1x+O5VGrlyvfkLzZ2KlxQE?=
 =?us-ascii?Q?puRLNOmm+gXOeBTS9fVrE1Bcryv86enuqUiUZ8/cJtYnInMX1xxeUI2VMVcA?=
 =?us-ascii?Q?OvnxpXiEpTxmk3DH/Q0o4f+3hQjg7G+7E9EEj1Sn03ceFDggJWVf5O3WHJe/?=
 =?us-ascii?Q?b+m1mglkkDy7nEqgrLPlCyhsMz4p0hFqggYd5JofGvvzFEt1Be7gW7RBw+Nm?=
 =?us-ascii?Q?UTHTJBD7hdykisgQYOieJmrCH6MU1wPGUrO9+KHm9eFY0YMWkCLwrqWlsRDU?=
 =?us-ascii?Q?xZ0cxAf1K8hMZni2E4xRsC1g9WfLFCcSj8oO7DVsRTRmq9b5UTrFaOk2qKCS?=
 =?us-ascii?Q?15JPywHdcrWPC/VnxJ1yp5lpqwo28nVbuXV5lTnSGXY1DI7kYrhSwXlA6qtD?=
 =?us-ascii?Q?Ga6qMEOPcS9EDorgeHe0aQogRYi6idn3xR7ozdE3bf9FaQaKRNjRQgDKrIED?=
 =?us-ascii?Q?vYuoGgmBmxL1Ca/tqYKghWXoXhmvlqhUBsmM9w7bM8TEYK+BKHZZNFPJDAvz?=
 =?us-ascii?Q?Oa/MDopCsUL0a8G68qha0F4VPDVbZw1ddzn1ODFwbhuaw43296paTou4M5Wt?=
 =?us-ascii?Q?3cR1NnNgIhrWdiukdfR3uHkkNNfc1t8TvT4FFSUnhe4PZJs5zuiD3NFmmt23?=
 =?us-ascii?Q?v1I35heuxf6CvuZUpa16dzQMj2NQmzbeK97yFSQr/xcSThHEkiPZraQsfJ5N?=
 =?us-ascii?Q?ZdwaGFoJ6KtOBu6kFndfEUHKi3v8po8OPHvxxAS76Q7iQeYi/XnVgZxmAU9H?=
 =?us-ascii?Q?vyvcy7KClY8HwVhM8jlOsnXPEYnxbB0HeqyBKWGlUK7R8DWXytqJ92Zgo47H?=
 =?us-ascii?Q?UdXrlCsygT8DtIBPg3QxeXAuzGdMoue3IFv96B9LtxGFpSHsMmptvHTXttqj?=
 =?us-ascii?Q?nOsVESMLfUZQZO/ri3/Vcstxsny+OWK69ukM+zSWKBii2DtNOmDSnmD2fuQZ?=
 =?us-ascii?Q?hq1hHBaTDnJKY0MhxrG9PQfbDj7Oq7X6yMqK4BaBDMP9wQKSXitCeBt8+cBj?=
 =?us-ascii?Q?NbfLFg2pACETYCUqS0oLPgUt4nGyvyYoSFhgjWcraZu+ChNBALTVg8w3j1Qi?=
 =?us-ascii?Q?VTU2ZhvOp1AF8zZfP596t68w/UHO8bfmLaT4Ap970hZHr7m9sQY+UHpSu7Ck?=
 =?us-ascii?Q?hGOsvK2VyLKxtJYR8yhrQ8hXqOZagiAyIPr8ZllIQOUjmRD5fCIVU5ASFAsf?=
 =?us-ascii?Q?6vR6c0NN3JIWX0dDGC9ohhkYOv7WiznFxR5bqIAhI6mDkc7DAIugrEYus6/q?=
 =?us-ascii?Q?qnRGo3zphLfCTnwiu3GOwhpxDyM0yn5V1+AqwJPN4etI4As0NUiMPUXmhZAO?=
 =?us-ascii?Q?HTMiuK4d9WGPyYCxdTrFAYYXH5lh4ZFVloJaMqOL?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2772fc54-e85f-455e-fa13-08dd567a49ed
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:28:58.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylqHpfdJyJG/fGJVetKgZM3ZejBkT5UvCBKa7GTEzjkfH4RujosFztGqawrRtPy1da7cNjThKid/4i4TBzfcEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9118

This series is needed to avoid key-loss if the GPIOs are connected via a
I2C GPIO MUX that introduces additional latencies between key change and
matrix scan.

This series applies on 6.14-rc4
---
Changes in V6:
* adapt dt-bindings description for gpio-activelow
* remove applied patches (https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/)

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

[V5] https://lore.kernel.org/lkml/20250110054906.354296-1-markus.burri@mt.com/
[V4] https://lore.kernel.org/lkml/20250108134507.257268-1-markus.burri@mt.com/
[V3] https://lore.kernel.org/lkml/20250107135659.185293-1-markus.burri@mt.com/
[V2] https://lore.kernel.org/lkml/20241105130322.213623-1-markus.burri@mt.com/
[V1] https://lore.kernel.org/lkml/20241031063004.69956-1-markus.burri@mt.com/

Markus Burri (3):
  Input: matrix_keypad - add function for reading row state
  dt-bindings: input: matrix_keypad - add missing property
  Input: matrix_keypad - detect change during scan

 .../bindings/input/gpio-matrix-keypad.yaml    |  5 ++++
 drivers/input/keyboard/matrix_keypad.c        | 30 +++++++++++++++++--
 2 files changed, 32 insertions(+), 3 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
prerequisite-patch-id: bb305aaedfe8c51a577a4995259b03dbc918e22f
prerequisite-patch-id: 952ec63bb9d0c7a79f87d9e47386eb87e2a0075c
prerequisite-patch-id: 6e4d765fc9f3ca7bd204b9b461f64adcafb815c0
prerequisite-patch-id: bf32190799d208ecee6e241204278ebd5835270e
-- 
2.39.5

