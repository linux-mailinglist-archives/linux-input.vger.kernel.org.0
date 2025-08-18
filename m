Return-Path: <linux-input+bounces-14075-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11DB295D2
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 02:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7242027AD
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 00:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F401DA4E;
	Mon, 18 Aug 2025 00:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="M2n67gc/"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2101.outbound.protection.outlook.com [40.107.212.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D0731771A
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 00:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755476437; cv=fail; b=NYTGZWrO47kWJbxmeOowWEWeJ2ywBYgMO3cXmaGbV1JcwrzyWujAVSY+djM6FewmtXValAmWMOD6iWwc0znKZzDu2GGRpW6ZlwmnOymliz0Ws+IYH6FzHEkK6HJgXXXgkBXWwIRTXbfSuWIeemnlr9elR/WIXW68EtpsNZg9uv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755476437; c=relaxed/simple;
	bh=toKJNKGzN9tcOocIrw8kB9F8NQ0W2CON3iTqmzcVfOY=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FSeOmIxqJGdgzlkZz76VJI3/0znVdADZCcpB0i/eszOo/mUa5q7KKAqJ6CICc+h/sWlkXgcCJblYCj55Xl8ToB0oLbxaBDIc5gK62TjVXKbm0g/kVGWocDR7oW/B66tkwK78XtWkBionzdJyadNVa7BS1smJfjrmwRHLeCI+p5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=M2n67gc/; arc=fail smtp.client-ip=40.107.212.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faZXZHVKr4k4YZBNA7p6oKW1itq50W8rYU/qKAy8h9lqY0DA2L+iOu9kaRQaAevAvdVCSs2TfzI1jmG9zxUlyQPOoMUwVkJhSQzWwPBpa6+qBW8mQ175OaW3d60fkThqXMMgOuAIAvNp1brajlf2TWKXJIBFv7p+VoVVSYc9D2bdCaQ2qhoMYVIwTL64kHFR2GM7qbuZd7ciZKNB+H5y0I0iFf9StD6p4LSrqfwL7yfgyU/XeheWUI+6ipNsqd2Ury4csVyybgqaTthxWjdMCOmTtwxNQB4lWZFj9Ule0gNQBUzrxDMOCz6b29d71cBqzKtFkJb3f96sU3E5JDefkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLmahp8Zz+vKn6E8RAtFaQU2QWE+MQTSiY5+mEnRUOc=;
 b=W5bNNg+jQFToxTHadJ98U1OVygAir40ATDsTGd5lFQq+ZIH2QG1Sz0Q0/D3l1iWo/WSIZaIxeAChcWz6InXFMJCX+1s1YAcogdD4i4d/klsZZmuaopKFN3/tkajP5DYTAmSpvwnMEcdyXYH7kNLTQDyyMFDQFKNMRczWUB/cArtYL2puk0X6PwjGSHZWP915r44xkmW9lOOU1zd8ob5HlB6rAu1B7YllSPAZjUW10OocGWqKxOPYB7uxYjRvm7u+6zIAPk8x7Xddm2VrzHCtgekVxZgOVe6Ng3vhnYQnXx/fA3GU10rfOvWI5iipLNSyhiJ6ZTFd59j700bDJHN0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLmahp8Zz+vKn6E8RAtFaQU2QWE+MQTSiY5+mEnRUOc=;
 b=M2n67gc/l1jCtIdaYnC8j8NPfSUPVJ+kAxqFOEP/Hqnvo/VsrHUYockNXH93lMurPeTZvhjZBE8ya106mQ1zI3LNpL2k5yqs6EQufARrfTI7yOWU7u33HAxtAHjZuLxIag/2UaKpVA/qmcUHZeqLqSil5xTrh8MCW4M+Pa3jGmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by DM8PR08MB7366.namprd08.prod.outlook.com (2603:10b6:8:13::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 00:20:32 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::e881:2e05:573:2d6c]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::e881:2e05:573:2d6c%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 00:20:31 +0000
Date: Sun, 17 Aug 2025 19:20:22 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH] Input: iqs7222 - avoid enabling unused interrupts
Message-ID: <aKJxxgEWpNaNcUaW@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: DM6PR07CA0132.namprd07.prod.outlook.com
 (2603:10b6:5:330::25) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|DM8PR08MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5d73a5-a2e5-44f1-8707-08dddded093c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w7++ois+j+yFwreiRF3jliWTRCou9M9jRxWTRaOM09GBamDJotqy0V0REPcc?=
 =?us-ascii?Q?Pj0v6Kxb31C52ELw5uQUETZeGk3uzPuuR6j9X3YdL8wOnFdbwZp48Cnp/gR/?=
 =?us-ascii?Q?pygCBJyWMjxob+DTM+ezr35VDtCtWX0k9OYumm9yfbvwfYRg/DbY/WUehDWV?=
 =?us-ascii?Q?UMlErROap7AglgQPq8fleDMAk2RTSmlYu34H4PgjHdpXSTOfyO7F4ub/d/h6?=
 =?us-ascii?Q?lBOzMux3EEcM/qyjiMJh4kt9yAO+KHAA31p2VngH8k4OwoCS6UTw08sROw3X?=
 =?us-ascii?Q?aJJ1fsO1b6AFLssJSOAIlnme5K3K58wGiQe/rw7yrjQ7V2RVxtfF+4ZRCeyF?=
 =?us-ascii?Q?yLmOk6TuuISKrKSFef2C1/a+94eFWZJJYLBzj297+uS/DgObvg4y6l04qXv5?=
 =?us-ascii?Q?QDx39LL0gi1HnRnfjEPH1WVOR+/C1vKp/TpWWZjQiOarcqS8tcoauKcfmRf+?=
 =?us-ascii?Q?1ble9MpZDc43zztlaRWga2HKGOYM8BhaFDVIV2bBVLkqjqR3MLlIgNgvjZkT?=
 =?us-ascii?Q?WiKPC7/sH8DSlbfDuXiaDuf3C9jKeye902ZAya8cx6L0HffB0e3IIPF2j7Kp?=
 =?us-ascii?Q?ah6LcU7w7ySEweT3vDasM7LakuPLbulZBCnx1KuHOYyXJSJL5M5GgFl6uSer?=
 =?us-ascii?Q?rhcV2ghcPmWJfUGCxqA2knOpaNce60C5Uf2yPC7FE/av2GGxWiJm5uqMjmnF?=
 =?us-ascii?Q?R+VtKt0faKv24OKnbL8NHb1sbyt3p7F5i7zEq+nwyKM9gNRLVHmuPoE539dj?=
 =?us-ascii?Q?zweAgV4COF3qEQ2vv21ON4s7p1FsRXDpPR9gka+5PW0Rk1y+qFzVhKUaVuKf?=
 =?us-ascii?Q?WJaIsxALy0y4vCIMKK+7GsdRS46a0MKW75GRFCddgCOONfrFLCFsJlyF2zfA?=
 =?us-ascii?Q?bD3GQvW1pNR1Z+sIB1RMIZkwIgycye60A4NfitcEeoQ5KhkCf8OjvCtWUHcP?=
 =?us-ascii?Q?LGJg9fPzdi6eGNj5M4iJG8+FM7LGQ+4SRFL3EASNObVKjwEMVo/weq0N3u/T?=
 =?us-ascii?Q?gJtLGXcGWfDpqarO/P2B88nBHUJJJywbBtWAZvjaqGolDjMso1hWfwhpLuHj?=
 =?us-ascii?Q?ZZEwyr28QdMJw8MBO4PYnzsMgLVuvAZf7KQpYnft59iTk+/4FaX/WNjsJnzT?=
 =?us-ascii?Q?Q3ol1KiE15BecyMXRussBZHAdD5mZ8IKY8Oe7+aMIF8GXard+51Rwc5to4sw?=
 =?us-ascii?Q?NQ9uI8MffYuO8brGA/CmPo1k/363BVeWiXIXYI2To5nosfArpFC9otXsOjkN?=
 =?us-ascii?Q?feJVdvCA18MEHftw4Uge9PuysDCc1B7mch4eVs2FKAz8qTYpdDpXwxLkZ8aU?=
 =?us-ascii?Q?C/E/UdgWUqjUp8iNxHvh/8H++G9Wve6JWWZubl2nB5OszfiIvvlb2wOrR7VK?=
 =?us-ascii?Q?F+iy7i+xkCcvY6kBeB+rmWGmBBM5X6iEG6jSfzpHipv2PySPmQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AF1dM7kAc1jiN3vvxILP0+vlVHuN6rM7D/o2iInUtF+nJtqtO2BgGLgOwBOd?=
 =?us-ascii?Q?tTyxhJK6yaD+vBczxCM8vmnWw31IFkCw8iekJJIOgZtrSBbV5Caeldhc7c0z?=
 =?us-ascii?Q?Jhbp9PRlt6t0TwkVe3x+U8XfHj+slpNT+SZFb2OcnGx6cuHiyMQDGPoHpsBQ?=
 =?us-ascii?Q?QXiRoEZGap9mxQNpj1utL72PfOn2CBu59mNwO/cqhv0ETvkBUNpyNqJdKDi8?=
 =?us-ascii?Q?Fg1V1HLmlh+qgsTyovxH/YFmQU1iKunlHB97DCUSdgZzK09jPJOrx6Os8u6M?=
 =?us-ascii?Q?u8PAe0LghNBujPcHzqCmZp8gNtpSV5kUWBeWCQj9+UMI4Ho2eDKrKgv5+gE4?=
 =?us-ascii?Q?r+xDomgKmqMjsvlqSwDNQDCyEjEBSochQy5+A+DPoDs2+ee5lKjDsKuPtIsf?=
 =?us-ascii?Q?LTfSuRaSnQMSgcu7MjYQBc/+O5+G+iO4w82/5MmLGjK6fi6rnG29gzRWOi8/?=
 =?us-ascii?Q?T9fVKgWu8j317iA6vDMARuEeESuAot32bWuqiXbC8zO42L4K6y5mc89Q4d48?=
 =?us-ascii?Q?1u3i/i4nszk95OmzKBVtMncKxzRV/8/QKK7Cmt+9lfudkgb6aubUY3op+DYp?=
 =?us-ascii?Q?ZTi/74ooZ9wUJhUCUs4tE40BAyTQqDk1qq/Bu/ePpZ9xyRIjgTYfRkJsWvio?=
 =?us-ascii?Q?Qt1csyssF+I3jM22Xxnb605iKZR9+mrG2UIOQTUiuxTj/ppV5pwrzTMNYJgS?=
 =?us-ascii?Q?3d6AQ4bwvp/b0mXFtVj2zGaLcMMD2m4tAKvAYsYIemkTiMe/KfvFM8z1b6xb?=
 =?us-ascii?Q?aIEp77My856zLuPA/H16UpLgAJ5Azs07LdNSMGBhKQYGVZtHrDk0yFyN8KK0?=
 =?us-ascii?Q?rtt0BpwQqIXzPL2cSjlKwn653jx2EIrjbAqc720NImJ31G7tT0z/5jq1Jk15?=
 =?us-ascii?Q?lo0uWFpCfdYF4TrfbrmmMV4p8aiv5gP2p6Mz2o25o60XA8vU2gfPV49Afpb5?=
 =?us-ascii?Q?jDtS8Y7KbQsuM9Rrs61zopecoGtkVm+Su3amc2krIf5zCENIO6HxuchIwPcD?=
 =?us-ascii?Q?+BEgoJawrSwmPCjk21OTwvBBhLHJQ4GLPZJZOomtfKviX2Bh82FBX7ZBUNZl?=
 =?us-ascii?Q?N1nqHfNutdUvYtFSkwij00ogcu09sv2z3durQCSXEZ/YsuweSSyncO7K9Abj?=
 =?us-ascii?Q?oP7MoSqjNDTeGJSEMcBS81Zr/nEBzT+f32L2iJj9oq7KNQlLaPnWSz6h7S8E?=
 =?us-ascii?Q?bMg7eVOWnirnOPVIPXGeLhD68ksUiobtg6PfjeB363JzEfxFffbRACtBJHkG?=
 =?us-ascii?Q?pnkofawddAyaxQUAjsQACDUyQxUhmRSnC6WBzxGask6oToT59+fw/QEitewk?=
 =?us-ascii?Q?C+UeGkHrwCIu1cYCZ69yJCcUSnqlhCQ+k4N1ik7heO+64qCvRlDK1uC2WTid?=
 =?us-ascii?Q?f+qzuhx6wYx0IPWc/qCR/HCYCA9WIst41wmEGjIFb/n91C+t6xA92Ao7qGzC?=
 =?us-ascii?Q?WCQcCDdyqJscjyI1+hYHAQ7ybqX1nF+R0ijWSkSpltzrb2ylhTgZkC+vKgrL?=
 =?us-ascii?Q?vB0hRCx55B/liwZ8sAc/Fuh3rqk1+KkyxFgm6/8EUlf2TT4thIgoKN8YFTm+?=
 =?us-ascii?Q?5zGGdgMSUOV2A19O3MjzFlRS7AiX7PjiRCXYp3QL?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5d73a5-a2e5-44f1-8707-08dddded093c
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 00:20:31.5491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcGy+sDzIvObArqP5LBPeOwZYbLY7BImrkYIb+kf9HMpbBQtuDL8YoxfH/F2A4T2+qEkRTUfEIfCLRzxnD3x3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR08MB7366

If a proximity event node is defined so as to specify the wake-up
properties of the touch surface, the proximity event interrupt is
enabled unconditionally. This may result in unwanted interrupts.

Solve this problem by enabling the interrupt only if the event is
mapped to a key or switch code.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 80b917944b51..ea26f85b9e9e 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -2424,6 +2424,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 		if (error)
 			return error;
 
+		if (!iqs7222->kp_type[chan_index][i])
+			continue;
+
 		if (!dev_desc->event_offset)
 			continue;
 
-- 
2.34.1


