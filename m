Return-Path: <linux-input+bounces-13173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD47AED1DE
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 02:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1C516FBDB
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 00:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD934382;
	Mon, 30 Jun 2025 00:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="TBLFecMZ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2111.outbound.protection.outlook.com [40.107.92.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CC6173
	for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 00:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751242127; cv=fail; b=lCrf/oYvZ+4YnJvy4vLsv9YSOJMdpLKapYzcT24nmoBFjRtHkP9DuuFMy6PZK+G1rKsqTFnZWXsPTnd9K9cN1y77VnyD1I7Fo4AuhUCKYawVhEwYEoEjLjefjBozDJWR4ORU2HGThtcHuwRm5B7wE7B1gCRnkVZLaJ6cC3FOgjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751242127; c=relaxed/simple;
	bh=h6RgDkTVT9zv6iwr23olR8Mn+wpo5MIMkolyjPF9yzA=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dK6O1rgXMVTFZ5Oe/xCnFc52M7nywN5fQSs8PI44hgaAvisBZW58qCFfN8RiJXDXDS5ydZ8G5MvyLel6JmjiZ6KTpkRA28SvrDyMc3b8piUWJB7fI3BB148aMnzO3KD9L5xKlfeWIRLrnzoqZVgXyoE4AQcSNDVVJWsrkrs98nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=TBLFecMZ; arc=fail smtp.client-ip=40.107.92.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNekLG1k21lVt3xoioi9/pkWIllJ5mmK4zxAE4UAlhzluOjZQYMgJlxFYKkX1Szdiw755AivQsjI+NSuocZyHwPnOmSpzszTek3lru6nJyAU8WztrVuW3z+jPMsCXb2Y//VyYLWzHp2rC8nPY0I0mHGf5NBJouSqTtWT7QXN+KpBrACA1wXgp1QqWoc6kyuU3uzC3n/zuya0eNbD/g7IW25Zyvd4Xy1UqGdQ7eMvJvlqAS191bvC6KrrS/7J/+Wq8r4K+pFCV11P/PPasepI4HJPOopR6mCemQLuWjR0yGrP5NIWVmpnNBtha5il8wcMH1szUyL0+ZPScd2bF4shkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hwa8HeS3CkXG27Zj3KQccjkXMpU9Xd/GuTO8PJqO/9E=;
 b=tpgpPxBm/1LLYBPK+kjvZMuqmsKnDz8WeBO4OSb3PhkBY56YB1PkvIXByspC/o+KKAUiIm5pXY318QZQjH8a2jmJlXzfyk7avOPPUUrRkAUwEzi9d1Whr9WjckwfSfvKhgYG5LjUCdiCQndqGGkqG4m0zSNwEr2fwik1Pf7O5BA8wHFQ3mN3MZPBx19vh625NKuWnYBYd60XCPIwwB7VNr5W6/suGtzNoQjkRA4gP9VgnaeWWB0MgF2CnYzxAr/Br/oQSgM9KBuPLDjdtjMMabRhZi6Y/CDx57VEmlEH7N1CoxtNT7XIaplZWhWTrssSvGRcUQIEdvPabmhqMjm7GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hwa8HeS3CkXG27Zj3KQccjkXMpU9Xd/GuTO8PJqO/9E=;
 b=TBLFecMZux4/jVysls814CWFKvlqQL1GcIkvfehPFa+BMSADnGd/35BvFuVPbgIOQoJHMxOgq0uI7PA8Ehy2MQ4HdTh6ynnyjWPdxW6xsVr5WSAq29Vi/xvOFOoLubGhZF+G9vwjJ9j6UmabCQVyF+100qnkvhJXSp4pcHgp15s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH3PR08MB8686.namprd08.prod.outlook.com (2603:10b6:610:15b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 00:08:41 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::e881:2e05:573:2d6c]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::e881:2e05:573:2d6c%6]) with mapi id 15.20.8880.024; Mon, 30 Jun 2025
 00:08:40 +0000
Date: Sun, 29 Jun 2025 19:08:31 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH] Input: iqs7222 - explicitly define number of external
 channels
Message-ID: <aGHVf6HkyFZrzTPy@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: CH2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:610:54::25) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH3PR08MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 5219cd4e-fcb4-4df6-cb0f-08ddb76a4385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xW6HdLpzGbTvxaSu/HoVDcAkMwVIxDcaH8BNC/2+LCOz2nCinRYJBndHlFYi?=
 =?us-ascii?Q?u1VDa3rK4BQhvPMRO11UnW3PBB5564bDOExibXrFGiaGJdLpYzmleO3Bx0Bp?=
 =?us-ascii?Q?Zdah1la37srzBSCrDS8+egB41ZZCiSSUlteSSlExnuxZmPvO0U1wvIDD3dqY?=
 =?us-ascii?Q?sBTTEk4ioCcbPiYG0GGlO4zFKyqqyUYmEOW2/AT2lc/E8pTbPxVRodjTSqnH?=
 =?us-ascii?Q?Lywrxot1hw+fTWhmz55fP2AeG5IM7QuQXJV8iNF6nuKJKhAjRCWu5oB2EaaA?=
 =?us-ascii?Q?Q6to9BYIJlOVoKc0sAqcUbx8YER6SUbvL+VqQ6/whtVbn7MHCuOyq26Rn40Z?=
 =?us-ascii?Q?kIblkf1ydKdEeMmTQ8Xe3Gzq/iOOkSuvG8rk2RrXzGqy1Ve1/SRWqXzsNlL/?=
 =?us-ascii?Q?M53+ql9firkafTUAXWDFg2ok1Gz6YszqJLEIvlLwKWjIeO3BW6LGJ0YPs3DG?=
 =?us-ascii?Q?+tGgUy+cLriESXbg+/cy+N8ofCqJpZdJCf253/tTExZuF3ibx65dzBl2zERy?=
 =?us-ascii?Q?KYqCEWGve790pdTp1oL/qkLCt4q9uzWAvapVZYoiKUimqYYlEK+mu7QEbIPl?=
 =?us-ascii?Q?xvRyZXGK7HD+yDF1cqcYo9Xp8x68ghu9olSLB+3GG9S5qBfz+4CsX7/OC4kM?=
 =?us-ascii?Q?/vz4toBArIT+Hf+FHD5FgC4nKIvPydnNM86fiRW/aS3BieHmilzdCU6u56Sp?=
 =?us-ascii?Q?QtEk6AGbv2XaB4DjaAZA8eErhU32up9KD3xEAhkoz5BiY86XSkf86YPFgUEg?=
 =?us-ascii?Q?8j72QY+WeDRQUtzhdajS0BgMoBJrQWybkFwLizLFUx+WO9MdBc1F5NDFmWE/?=
 =?us-ascii?Q?bdoiRvah8+IsU7eQZI4ODophTQ+lnxP7Id9mGnG/T+yF/treonxm65bkx31T?=
 =?us-ascii?Q?xK2IM6VOb8ZZKOFEDDa6iD0TQjCf/SvtVGipRJZRDI+c8I+6JXT2sNrAembJ?=
 =?us-ascii?Q?JvR+r7cOxeb5TnsRtoAxPYfZOz5OjhsXBAO/e4jZvLAR/QfDJcsVV5UgDbZX?=
 =?us-ascii?Q?FC5dekR/TKK7MeexYHxPuPhUDN3IjWANGWO/tnq9D/h9ftsGlqwns9bfRgZf?=
 =?us-ascii?Q?fItukok1HdG9Xfgkg63JlpSNUJ2IxF7P8rRLw4+lmB3GTLs6FoK1oqQ7vedC?=
 =?us-ascii?Q?GwjWoqlyOX0NiGsOpbR8RMKhMLVbVtywTSZyuXzDueduPn/GHCzjDJHwLTij?=
 =?us-ascii?Q?mCLWHfY4dBmCL2eBilWWsRkWqEAC1RmHUd1wwY+AMggxTEBYijzV4OQU9d3F?=
 =?us-ascii?Q?qqalzXiFiXxBU5q6gZKLh9Bbec6Yq784R9VlCqByBWQXPFPyd5kJMfasjeTT?=
 =?us-ascii?Q?yp0kyH7eX8bFF2ZGMB6vtsHrAj7oEzIWo+ELWMtomApzTCVqyNP0QLkfoqcf?=
 =?us-ascii?Q?sh98vvxtKfm1KFubiZamRoRK7lo+Ot/3xEDLMTbttQNymT90fLJsjp6WL2QQ?=
 =?us-ascii?Q?lDARjR5UWZ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5BXAvfzk4X7wEBFWHLM7ysheVeiN2CwCkQS/BCn37Fp04jzgcVwTFCcNmj92?=
 =?us-ascii?Q?2kXYYUFoVz/u7T1AZlPbSeN1dD4zZYgtdGrx1l1sEUJnV9mKdZGY0H3d2FCG?=
 =?us-ascii?Q?0VO0q1bma/SHMp8Yuqn5QIsgAnWNjAvGf0F9tsrA/lZoQiDxtIYGg5BgAZ9w?=
 =?us-ascii?Q?CjROEPUXWto/kj0CaCl56duvMJsUjOnexUWcUoWKsn3KTz23mqvSU4NUFehI?=
 =?us-ascii?Q?blJ4lhcJ5F+R/kn1Jxh30MJzM7rsCUnCT3mL1mRclFdyzEj1rwbyR0eauF0L?=
 =?us-ascii?Q?JplwtMEWAIrClkGxhPT0GQb0+0Bo5mMOlsuBN40wJvL5XwrpcqNbkf59T+Ph?=
 =?us-ascii?Q?iZ6wGaFqU0k52VaIFEn9etQ+ojtd1A8mpz7UbR2hRXDca5aa4ZnAheswWClD?=
 =?us-ascii?Q?SlqENc5jS7OoRQkUuWRuwxWLpAsl+ClRS6BGTgs0aZpAUDvY0ozpQGqCW2a0?=
 =?us-ascii?Q?+2vdufDj/S2I+RFnKW65vjVeJ9IIx/EZWZ8PJ83qqTKQ2MBi81QkixwhF+Fa?=
 =?us-ascii?Q?417m8S5HTG359tDL5gcVNXQV+LuGcYu4vUSdA427A+Tj9k8FxUXxkpWm5sUk?=
 =?us-ascii?Q?f4rdJTMhS5k4lZ7xsidItqoqP3nClzImFevxH0UlH8Tm9z69q4gveSo/5wp/?=
 =?us-ascii?Q?4gNgz4UITj2dQQHlub+IK0Oj5Lkxid8k+UunIRv1ruOJw+86fmC8K5Y3gMiH?=
 =?us-ascii?Q?Fiq9kEv+rjPgjX3rpYto3NbGyRBVCkgM5QIVnMeQe0yWTkr5r2z7qs/6mJQD?=
 =?us-ascii?Q?o71fcdLq5llQOl0diHDUSw0f0LlTc91KWClPgzYWujKUssThybH1wwhh4ivh?=
 =?us-ascii?Q?cgTorcm2gI0IBmxSjnjZOz1MV9JvtIVbhwpZe/Jeg0eEwiR1kT3mDY7atrhR?=
 =?us-ascii?Q?CYhOp1P7xQSVZ24n+FQ4GR3Jxw+8LIFakoRw9CgTbInu5x+akgrz9OBeJQAp?=
 =?us-ascii?Q?iKA8JDj28JPOznUAiB4O9Ddv7ZAwIfW4nHxOoSGbsZ6PPxo5hE1QVKOrAMkf?=
 =?us-ascii?Q?Rds5g4hDOoB49yCI2/gYgQV+l6dsCHYaUvELwX0VoHWJOL64iFRez2HcWujC?=
 =?us-ascii?Q?tByQl3KFoZrc8fWJb4bMUq2vloLO5be40WFORDhJ5nn5sF2xHB//lOQd9rKz?=
 =?us-ascii?Q?CcoSb866FhOpEPE4sKFt8XhZoEkAnYJvcoFhCeQBHaHoG6KVEvxvVB1XmLvZ?=
 =?us-ascii?Q?VQpa8PjfzxzXPYh2caE3aAXE+CmNy7IE5fusi/ZvrrYcjsEtyUzDzWJcgASR?=
 =?us-ascii?Q?pGvUKgXZDPvPvPkBwilFUhZq75ugadQOnr1T7XBQcyBEfZI/12JQd+zWB7Xp?=
 =?us-ascii?Q?D+dGM+I7yc7kXZdQKR6KF/pOfjmFozuiyjKruUB78zlwKDyVz2Y75EmjO8AM?=
 =?us-ascii?Q?EuWRhjn4FZxsRrUUckG0UndH3xeVz8HTGYSF19mY8L0f2FP4SGWy7EZ5zKGF?=
 =?us-ascii?Q?iYsY1sPytT+bhfGWTzFd0LzoJ9FGoYdLtU2P7i7z/SCC7Zmy1lEpwkdx8+VD?=
 =?us-ascii?Q?P6aIwsfqpT0ELUBZpV8XnIaOIfQ3PEjNUb3WFvQ9E4JPU20RqLb1OKDM776f?=
 =?us-ascii?Q?Mzlkc0K70r3fw9lo03YCeVHCdJ950Yn/imYD2+rP?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5219cd4e-fcb4-4df6-cb0f-08ddb76a4385
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 00:08:40.4502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOlbszxYZenwFB+aoPSEOkCIUUSkvdI1pR6WG7dcFYjZP53uXugNGnFM7jfG/Nv3MM5Qh+KkXlEivz4bgATtTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB8686

The number of external channels is assumed to be a multiple of 10,
but this is not the case for IQS7222D. As a result, some CRx pins
are wrongly prevented from being assigned to some channels.

Address this problem by explicitly defining the number of external
channels for cases in which the number of external channels is not
equal to the total number of available channels.

Fixes: dd24e202ac72 ("Input: iqs7222 - add support for Azoteq IQS7222D")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 80b917944b51..6fac31c0d99f 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -301,6 +301,7 @@ struct iqs7222_dev_desc {
 	int allow_offset;
 	int event_offset;
 	int comms_offset;
+	int ext_chan;
 	bool legacy_gesture;
 	struct iqs7222_reg_grp_desc reg_grps[IQS7222_NUM_REG_GRPS];
 };
@@ -315,6 +316,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 		.allow_offset = 9,
 		.event_offset = 10,
 		.comms_offset = 12,
+		.ext_chan = 10,
 		.reg_grps = {
 			[IQS7222_REG_GRP_STAT] = {
 				.base = IQS7222_SYS_STATUS,
@@ -373,6 +375,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 		.allow_offset = 9,
 		.event_offset = 10,
 		.comms_offset = 12,
+		.ext_chan = 10,
 		.legacy_gesture = true,
 		.reg_grps = {
 			[IQS7222_REG_GRP_STAT] = {
@@ -2244,7 +2247,7 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
 	struct i2c_client *client = iqs7222->client;
 	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
-	int ext_chan = rounddown(num_chan, 10);
+	int ext_chan = dev_desc->ext_chan ? : num_chan;
 	int error, i;
 	u16 *chan_setup = iqs7222->chan_setup[chan_index];
 	u16 *sys_setup = iqs7222->sys_setup;
@@ -2445,7 +2448,7 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
 	struct i2c_client *client = iqs7222->client;
 	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
-	int ext_chan = rounddown(num_chan, 10);
+	int ext_chan = dev_desc->ext_chan ? : num_chan;
 	int count, error, reg_offset, i;
 	u16 *event_mask = &iqs7222->sys_setup[dev_desc->event_offset];
 	u16 *sldr_setup = iqs7222->sldr_setup[sldr_index];
-- 
2.34.1


