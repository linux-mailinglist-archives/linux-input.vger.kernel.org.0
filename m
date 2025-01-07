Return-Path: <linux-input+bounces-8994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A81ADA041B0
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 15:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74DAA3A7419
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 14:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0181F891D;
	Tue,  7 Jan 2025 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="QB6Xcgxh"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2057.outbound.protection.outlook.com [40.107.104.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956FD1F8911;
	Tue,  7 Jan 2025 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258551; cv=fail; b=IY+mlPAtMn8piG59XNRiNJdjpxMW6Mv3U9/70exFqOIAFamp05hIPUDLQS77Q8MNBPLqIWYdyOqOorGT8Wk7lpDLCaCUCThpCbowvO5OC3jhkCcB1IF0O1NxFCSHnT3VISI+HfAIDD83mHvDbU376tXRnwQwf3HjzTpnntmZx8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258551; c=relaxed/simple;
	bh=bpGyT5QE2pudSYX4/47SZnhGAxke48Ga373MHnOqXmA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MXCMdQXzBYx65sVzXRvNYqfiXZxwWKhHNg1WU9Oypq1WEiRMZNnEIFNpSYXEWtgo5l/PQYx5uvJRDpZ68SSWqLwtYXjHl3t4tBIbZTwlZW2zJldsg/7Un4rzVQDOTxSAtA8yexAEnoSmCfsOJbDhu9+oPyVN6NE4a6AaIMQlkQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=QB6Xcgxh; arc=fail smtp.client-ip=40.107.104.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLJkESeua8UHDmA3grWUzhfaBkgupAo9TYdY3oniRF08Hw3gbkSV/7c3V5eBBxRWtv6A0SXYeqZqHvQvUagGFeGEdWVgyzUtZVb9LJ6H7YimF9UOQtrW+Wa8kiMBRYq/rKBEGc6FSfzBcLLekZKXIDuANd+4ZBn1zsRHQY9WPGRJJsK55Avj+Xm0efKD90WooGH3ktl6Cga0d9RrGjyxuY4f/GexfLDQRxJ5B141tECnXRGgbohQ3PO+/294vr2vRcvFAwr6AWzM29fvTNvT4PhDo41cKagKmYIVvxA6cHduAO3IXYj0AV7jCnrt6bMfQLFgS7G8qvuCkuwyOf+JQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpMlfF90AAIMw3k8n417SLD7fslUiiVC/CZ2CcBuQ1s=;
 b=A/ZxbE5NAFpe9b6v5CYRCkHRhP2zs9h1HcMUvCiVttlmFqV6iC5kud1f9UIYyQSc4PyNsOLBw+e0Nrd3+G32xv7ePmWbGj+R7Dle3m+qp5Yn3+DO9BKQnzgZFV0j/yrfMhmWXcuPzMeAetCCvM8h+PTOnrHCScEmlaTpb21AgxiFdLv/1b8UFHo79OARI6BsIcvUTAqp1TcbF0QhgeQ2NrTyNPecQh9hZHZ3sP1XykgRsYSGHvOyM1g8n8A9OE5Fn0MBfJIjCM7GtQpIGkcxpXPzfY6oER521ZnZtUZ0o66SCG9s8dbItkBDwSqsmpufBlE4PQCH9OU5c4q5l7a4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpMlfF90AAIMw3k8n417SLD7fslUiiVC/CZ2CcBuQ1s=;
 b=QB6XcgxhpsbDpnaDoniJWTeVDWfS87Enu7LCK75llfY++KarT9FoX/BhfN5bOxrD0J3pVshKbgonHFUxLaxijDmM1oVIjWJDBizebHhBZfTSZIZ4KM29nnJUVYLLXZaL/jG6eRXGAHZ1iq2kWkBN26CQrUzKVxWqY7l4uLvVH3eRHSbk13YiaIPhvtUBYYl4+wMy0x83C4ZPsmBO1Nk0E4yxTHSRDWzXSqI2rJ/d2LdfyRxVwN09IXL4I3Xctb2O5EnEk8yu/jUe4oxcM3x5kliBXkJ5VdFbNXvIc7UUI2Q9JQ10QO958KYjBqR1+9rP7jD2rxCFfbnRWaqIN5CCsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM9PR03MB7852.eurprd03.prod.outlook.com (2603:10a6:20b:433::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 14:02:22 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:02:21 +0000
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
Subject: [PATCH v3 0/7] Input: matrix-keypad: Various performance improvements
Date: Tue,  7 Jan 2025 14:56:52 +0100
Message-Id: <20250107135659.185293-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::17) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM9PR03MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 2242724e-59e8-446c-b09c-08dd2f23e7c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X2GmmgRobJ5Yairb13rPzEa10VQJ7wRXZL1BYyo3NL9MsD43pLtit6Ptd8Nz?=
 =?us-ascii?Q?kYra7XAxn104iv0EPleSKZDLkEHIz9w0cZU5OEU5tcSGBVziT5FIke7hRa12?=
 =?us-ascii?Q?Jy8dU0zq/PpppGXViTbvFDmrx6zs6XpSC6qj/XzQpMNzcxXxZmKu0kwLM8Xo?=
 =?us-ascii?Q?qnqu9I3aIqzeJwG6OVmSgFqUY7soxVd8WrmnpsoAu3XIXXp9Whym7PbPcBb7?=
 =?us-ascii?Q?BEcZw4jOzzCn9yN2cjcnIjzt34BWz7Ecq95DQzgXRChbyOPBSYQGnQFJ0/jm?=
 =?us-ascii?Q?yl/pRGCUl+9ZDVzv9A9S1E5iyrYJtKeF1y4T+FutPpIgQiRe5bdv79hmPvm7?=
 =?us-ascii?Q?fev3cYuTZ55EAF628Xy+QgSqaj2LrPR52tSsMN1fR+4E1jsuSMBXOo9WyYiz?=
 =?us-ascii?Q?GvwQvFSqAAainCMwuJ1z2Oyb2vH7c1ngH2U26+LFzyOx5es4V1diHC7zp0ZE?=
 =?us-ascii?Q?XgkTGO3rbCjBznHWWuNO6ARfENIdCF9la4+9k1P36a+Q87SDC84dh3ctuKqk?=
 =?us-ascii?Q?QRBqHGd7NtDrmr1waQc2bMywn093NVeTC+v4W91ivK4uzESYLA6jOW2tlg2Y?=
 =?us-ascii?Q?IIxpdQpPWQM4hysq8kqke/10bn7sK07F9v0VGJPdBCXlJz+gET8PR9isTsul?=
 =?us-ascii?Q?+13qj5qoWFJhQW/lQe8ymPanbrcNKLjzvdowLRBA6+gl+HRB4ARcOnyXhSXL?=
 =?us-ascii?Q?5oEyd7Hu+U+L2gBalVHLUzDuz6M6G/MoiKMwkjq30PZWnEcCJmAFpgHKPVz1?=
 =?us-ascii?Q?+QgvqCx/NHENGxTAAsr8v0pGYp1i0A+S/fF5OcZk/OMlltkYRlpFqI8nsiwd?=
 =?us-ascii?Q?vhY9COmnb50TS7DS59iwLMoBgjhzgYIPCXiUjHzw4dF+4CBwjpz2McepgZEB?=
 =?us-ascii?Q?VDxIIRLop5oQJ3Cksyvuhuxh4QlF+LiLZDKuj1zr4VpgE/hx65cbQI1MOtk0?=
 =?us-ascii?Q?diI/i0M3hQeUF/tFpcO8/jxwlj0ltznVputt6PuG3g6vz2uwoTUmbMlX7f92?=
 =?us-ascii?Q?kXzHnT0V01JG46QwVxeDkI1XZTsrhM1RDkByiGHtjuZNvFvmwW833ls6fg1L?=
 =?us-ascii?Q?fN24wP19fGSNlnCrfl8RJOSu7GTc3rC5vkwFjcoZVqTOfyrxXsGpdOM4rHTf?=
 =?us-ascii?Q?oY0GSv/GWujBeR7eSj7nyPV2BTHxABPiJU+PuFG0cTZxunhi57/QLUKQ8/RO?=
 =?us-ascii?Q?f8F2KMCjCoeS3OoOqnq8sl0xQYHyzlpMePnKLGRXzBq8yjDDkd4X3qL/HF/3?=
 =?us-ascii?Q?QRqpNCsrfmTqVLU2epakaaGrpAi+20sLuLFM44C24WdInHYKbqPzxYnYmyjM?=
 =?us-ascii?Q?RHMwbRWXw6sQ2ix6qepzzIdmTMyufo6LVZdntCv4gM+WGqCwTY0cqm2scgT1?=
 =?us-ascii?Q?I8Wx7zHkGgs/hLW1TG2AP3xFwYxSnsb3RNR5KRLbuUYq7WhO3r43fIA5NgtR?=
 =?us-ascii?Q?c0YQFaM1YITcCxtzm6nKXjz58rEGCOYm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1II3lk/mHHkbTZYFtQmPcH7feBwWzLHvisL2zVR917RwAw59oqTaR4FNLBS/?=
 =?us-ascii?Q?kU4eH3MEDbxP7TlPwEW9ZKkpsr/ztlRf31KqJmwJhMIO+1oFI3VjOqBpZn/2?=
 =?us-ascii?Q?NWF8GcQN34UHi/HOvtqqwWdnFEYOoapweqVXBe0pzsSDEW46oxLZpQ3mo0PH?=
 =?us-ascii?Q?OEJiUUATGSRLrTAOj5L5KIKZeNWVnloRLBgFs3xUoNruxF8WzZG1ShMhAqht?=
 =?us-ascii?Q?4/+8IEZoCQGu4wYLskWwVyeozqmBA1oQBFWGFWpO8QwlO5VAorMD0kVkhjoJ?=
 =?us-ascii?Q?vECidc2QZYufN9f4CN4nbe9yt4BIaT6QrlOGuoxtxjzt0awZfmkSptDa0HZ/?=
 =?us-ascii?Q?QbM0kzlcDE/giwOOjeBuEYe2w1sZcslw/6Fv4RirSTvYfIHJF+Geud+nfmgN?=
 =?us-ascii?Q?d2q86V7rNEA+dV/73I5/2WEz4HMOCLcvkW4j5qtGCve0RUiHVvri2EFDGijS?=
 =?us-ascii?Q?Yjr+2TnPgb9KqUzZpkAGLSr/lUYNy2QRX/C2ivjMboOYBV0J4WgNi9bDws4a?=
 =?us-ascii?Q?HxQ+K5HbYBYhsdG8HXsLYg1Yd1iXYLWv7QIxUM0te3Ea70JyFJlWJIJ09Ik6?=
 =?us-ascii?Q?yAFehf2w+YVz+2AvaiCfc+nf0xHihhporglMqrD9pRe9dMLYumkRaL0Nife9?=
 =?us-ascii?Q?0iHgQp1YztmFPPdfUSUIBtQDwuFCBJjw1exI0vC03aH8t8Yznhe76I8eNvye?=
 =?us-ascii?Q?/ExVXutDuoJJ+dulLstn2fRbNA+8IB1+PqXQwV/K80GmU9D07uisJgsIKCWO?=
 =?us-ascii?Q?yu+NsUVV06qyorx9E79YQ1snPiNY/73fEBGx35B+USInUtgYYGyh6P19sbd9?=
 =?us-ascii?Q?57RP0Dn7I9QeJzoGL7HNfwHNHl4uc6pbOwXBWexEVFm+2FSJEZCCX/8vyJWv?=
 =?us-ascii?Q?NN4JvncQYG3qShs+FNCyqKzwHXtsyalrC3kcWh7b/xfvbnN9Q37Xc6J/hF+X?=
 =?us-ascii?Q?f9tiLXmcj2Ca0j3peWFkl0+mGc7ktN70nJhpMSr7W5BfjLsI+A2uZO5SSdOI?=
 =?us-ascii?Q?2vcowFliATbZecKKWZYYTdcvyJ39jeKWwh/BvuXvMdzM3yiR7pPQ6OElcbzV?=
 =?us-ascii?Q?gQB+8tbOB0ejX4GZf/wMA4n28cynez7j3HAZxtJFoSNWMpkKwWcJgHIsjReR?=
 =?us-ascii?Q?G6zd1c5q+9c4UGsXyG8jRJyLfHyOzpT2iabKSGTRLXvN97qBQm+sPuQip3lA?=
 =?us-ascii?Q?GaizEgrB6zbK/7xKX2EPyqBsawqQAxO5ypS7Cxy6D9A3EjJ65EQxUfLixwWl?=
 =?us-ascii?Q?N5s34IaQOUpI3s6bauwZ2QE0N8hh+5t+oWkrpvSRpVURvgUcHyqVR/vx2/cN?=
 =?us-ascii?Q?7Z7+44TTtXCrjkO3knJg7UAa+AfPGyrJigaWJF8fs4CWDSq0M7EVhLELkPJ+?=
 =?us-ascii?Q?ePENuYXpJoFten1EyHIkkS4LYvMwW2a5ZduteXSgY9M/Zpu5DuQFuzMj36Cx?=
 =?us-ascii?Q?ud2drzuvrEWUUUn58JPiYJaiXft84sibYi0C0OTpckSJ53/dwhlgztItBzKe?=
 =?us-ascii?Q?IOWimcRjWwWxN50y2DqOa66O/dx5jnosOZg8JJkqB9LODC+wCBtR1nyFjY4V?=
 =?us-ascii?Q?T+gQpq3L18FJIwCQ8Ixp/ceVnQ4BjcFGkKeR9tOw?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2242724e-59e8-446c-b09c-08dd2f23e7c5
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:02:21.6814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFaYaS65woSiVH1OsDBYKXo0SkNLxgvLnUWJkiUFsErASZgI1QWPMytfXWzdMW8I1TeVGz1cix2xjPtdVPUXvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7852

This series is needed to avoid key-loss if the GPIOs are connected via a
I2C GPIO MUX that introduces additional latencies between key change and
matrix scan.

This series applies on 6.13-rc6

Changes in V3:
* fix 'references a file that doesn't exist' in wakeup-source.txt
* remove copied and depricated properties from gpio-matrix-keypad.yaml
* extend patch description to clarify the changes
* rebase to 6.13-rc6

Changes in V2:
* added patch to convert dt-bindings to YAML
* added missing dt-bindings properties description
* removed [PATCH 1/6] Input: matrix_keypad - move gpio-row init to the init
  it would revert 01c84b03d80aab9f04c4e3e1f9085f4202ff7c29
* removed internally given Tested-by and Reviewed-by tags

---
V1: https://lore.kernel.org/lkml/20241031063004.69956-1-markus.burri@mt.com/ 
V2: https://lore.kernel.org/lkml/20241105130322.213623-1-markus.burri@mt.com/


-- 
2.39.5


