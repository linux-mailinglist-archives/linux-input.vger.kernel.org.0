Return-Path: <linux-input+bounces-8892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3DCA01B3F
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBDAB162EAF
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 18:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961B61B6CFE;
	Sun,  5 Jan 2025 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="ZG1abxYZ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2120.outbound.protection.outlook.com [40.107.236.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853D71BBBC5
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736100060; cv=fail; b=u7PG7anFpcRgYlA+a8MYd3EBbMmTcpSlwhU5pA1xa7gSvRZWns59i1MOCo1u++2akFYZgQ5DuZ+65r728b664YZENYY7morPxDMvs7rMf/GTvwka7kpq07+XgXIWfgjpdp8wWgVS06b810K5JinqH73mwYiAsIFp8pTkUrzPnQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736100060; c=relaxed/simple;
	bh=VSdosymADSJI70gJ/NmU4hZiD2j0REPTabXefzXAqnI=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tXAXmTEMjVGc1ZobHPxr3Dra6yWQ8ChC2uCd6LELE8ILnElBzSRPdoyZuBG7nZ4t0dvZB0atW3/esMwnXr2y4ME9k9Yzr5Bb3uKnNwNqKFwioI+ZSAq4+rXkcgqovJya9S8acyrljbQNDEaryOFkwymDr2azhRDtNTvzpzTW0XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=ZG1abxYZ; arc=fail smtp.client-ip=40.107.236.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2H1//nH89DH+k0Tb6J96SvVTYIcwGaxZ0aTqhe9AUxNkjBQS1VI94ep/+paBlq5nfBToycrVy+VK1BeRgF7y8IpJN0D+LZTYSZBiJ3vH4aFoDmtfHJehObe9QcTc6Gt0mKVg41GkVVzj89tC7eWox1KeCxBpZacLXrV+MC2Ub0q7NsF7TeMRdUSm98d4Qb4IGQ2ZpjyLFLRp5W7OOMn5nEX1XzL2wvFM9V6VLaFEAq8ZlOiMiHpSqezpXQ6Hqvq0TW6vEVA2g/bSTDRfJrSwF3M+trIoKRAWI1BOfkpQHRZrjuNibn/ivj9YhiQ6m4cwB/DIq/azCXzT4WvUo4Nsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bgjkzc5kP3yMiHl20twgVYMxV2wlsYB6B077yJRaWco=;
 b=Oio3wl6DaBj/KIOCQXspZJriDJxlbd18pKe5dpJVJjpNv0BIE1iyvjsOSOpz0GlOPMprvCid8HJSL2BVYgawcDMfrLAK8q9UM2fGTrV+urMLBjVSO70qlvrQ9pz//Vq0jUMwipKXbKwxANjkhL7Dke2axDAPlNMRCie4uqfSfEL/4l0mRYXcID9Bfn1kpeRUFqMiT3kRs9luxI9GKIEKPqzm8Q3bGJG16KHtmzZpYgtIs+mTA3jUVU+YMv5kbQzDU1l6flZaTrxO9CFDlc3/sbioBasSFxrqQSo1lDtA4v9pOArYqgpzxMeuFIn+BxOkOvRbW3enxMleecuU/kkH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bgjkzc5kP3yMiHl20twgVYMxV2wlsYB6B077yJRaWco=;
 b=ZG1abxYZlpxbYXshmc7TotLnalRK5iT2MKhPanAk0QCT+PhQoW/D6WJ/4X5Yr4OP5D4e/8YJVrNmKlu/TObZfCA6HGrf2DzDi4KK0MT5zbBAGMzJpCV8/UEo3gRptpirQqE5RtuqKZ/4U1qFT6W/uCGKMUcLLeKwm7DrMK3skN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by DS0PR08MB9304.namprd08.prod.outlook.com (2603:10b6:8:1b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Sun, 5 Jan
 2025 18:00:50 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.8314.015; Sun, 5 Jan 2025
 18:00:42 +0000
Date: Sun, 5 Jan 2025 12:00:30 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH] Input: iqs626a - replace snprintf() with scnprintf()
Message-ID: <Z3rIvp0hzS+yzvJA@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SN6PR2101CA0002.namprd21.prod.outlook.com
 (2603:10b6:805:106::12) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|DS0PR08MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 2276b3ef-bdb4-44aa-3d9a-08dd2db2df19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pnHYnMEjHon0z1cfLXRCnTU04ugRnRwzWGSFyWoqhLlWslQZr5WqZ9aSKscI?=
 =?us-ascii?Q?tvNS1MfQAicm5rO5SzH/MrMghW/46LPxNQzP4Eq6V33iX6Q2/XKG0Ba+yMMO?=
 =?us-ascii?Q?drwIhfAcufZ0A+3zX06HOVz3nYbQv+8fvOWgCgKDV5u31dE8FQGFfrFioLI1?=
 =?us-ascii?Q?3qOB2fkad58Xy0xPHccvs9dNo4m2kHuDD8qgKH+9Cl/hcal34X/NwmiUqakQ?=
 =?us-ascii?Q?2qT7NyxzFgWR6xMprjWpQ+w6GmqJxohIRxU3/HZ9H01gBxHKAGMAIy5KpDCs?=
 =?us-ascii?Q?oo7hr7zMKf9wgRiPBFlXZI0CD2K3WdouzKcOWirL4eGYub8BKPovBKYh7hsF?=
 =?us-ascii?Q?NsndytGCfgwuKiMfwILl37Ya3Hjuvp1uaYJiS3jqMcuCdRYME++S+8VTr8ze?=
 =?us-ascii?Q?HsB05I9tJ9tTkWq5AiRUUujULrpzCnhkkk7BqUBHcc8fiw5FR54D3lzWCHLO?=
 =?us-ascii?Q?NpPqpKqGXA0+73qhzldaPfrfotIZRq/nSdE2EQ/yZ3sbdSBjrjTnxao/CFwB?=
 =?us-ascii?Q?YcmqHW/45kh1rEjVR5tQGQixBxaWeKWonIPVJw3cTGcJlwh6vRYlyqylofxX?=
 =?us-ascii?Q?ecSwXyMNbsM7ahgukuNTD/qNt3mJ1vDyFbBeiHjzVCFh4njWT7swR2h6FsML?=
 =?us-ascii?Q?kYjWWJgTrrpxHWHOzvQs1g8yRIBeZrE2KKOf4Kye9brZkiOvHCuLgXjg7wKD?=
 =?us-ascii?Q?IirbiY1IxVBSs+0pp+BQtdNNLSmGK8/bH16/zKfrGGTFgr1Lz/IpE/y4mxBg?=
 =?us-ascii?Q?kAZYuap8+rnquix7YYFEftMGMiV0p0vxXBoNhvrkkqlQt7HVtYjbyooL5IpJ?=
 =?us-ascii?Q?22Gk3Z/v0BBb7CdTdXAv5cYc0640ibJ7mUscZJcz0MXtBYzSFZknVt86ceoP?=
 =?us-ascii?Q?OW0m2Sf9vRT3+RwL2zVEcX7VxLk4ZaGuQPREN3CSoRRp1jVromI+oYyuBe/n?=
 =?us-ascii?Q?kRP1zrrIZDH2JLpmwCjS7bIlLDUghgx+4iD5JvpEamKZSrU7ZddR7Jf3PK/K?=
 =?us-ascii?Q?ifeIHEcJ+Bq940FvNBx9oebUZbKl3FmxgdS03dHMBu0LSMOF3a3YGzjOA641?=
 =?us-ascii?Q?SqKOPUl1olUjn8aA3Z/gjOsHUpFWpai3Ag+lxORKLNgLUvUTOgpTSPOaTm+Y?=
 =?us-ascii?Q?rgZLBqO1WCos940cZuzsEotQ3XzCFKJS1C4Fqh1XAtfTeKIG/n4fu33QXSOo?=
 =?us-ascii?Q?M9p3xgCTUCYYgeE4fii+FXqgI6K8Vm7DlwexSrhDQvanwg6oQqETqV/fyDnl?=
 =?us-ascii?Q?9ilPtELIfUqkVhQgq4UQfvcpfEEB6MpqCwA2uiih+o6yLMzh9hpfLm8KYagt?=
 =?us-ascii?Q?0lkfDrP+VNhXgd3V1vgYUiOJU9W/j5v2Thj9/Ouzw99/hXpQPvgwRPnfh0Rc?=
 =?us-ascii?Q?rL+JAdIn/p43oXDEmom1Afm5MMNx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QVJbzjsg0Z3Ej0xrSNwkwJDSODQVc0PR48htehBjCQXch+GfF1PRhjA5j1i0?=
 =?us-ascii?Q?7eTZ7wUPBOAoKMQLYkdl5rCCTjtRH2zelH9pE89JIRSmrTekwvHGRM03zEiN?=
 =?us-ascii?Q?OG20WZ5TWPtFeciuLiexFuWJpJnQOMMZ7VZd51FbCS3gA6TCZ/86tVwLvCFS?=
 =?us-ascii?Q?oDpCoEkTSVllE9IaRDacPF99iFDHUNDA4UodHaA9gS/nT0Z06A0J+t6QWBQt?=
 =?us-ascii?Q?OCawM9YX7Xa93wt4CYXDtB9oWrLv5BgmX/Usu5+cLg5uf+GpAQAOjFNO53dx?=
 =?us-ascii?Q?hpUl9uYs9HRVGyk/ylceUT4KTAjVuEc2nhaAkIE8/1LU4kNbVM8CIFZQLah7?=
 =?us-ascii?Q?Of8qpTzY7HZ4bQzIF357PSvukz+jX0sI2HiiLGSupCo0q9rqFD0oHzvMwgFt?=
 =?us-ascii?Q?a4KNU4SZuVtdpLFK1GSPujii+vw7nMEDd0mhEAF39TBR0yndG6hzpzZkN/mN?=
 =?us-ascii?Q?U97FXHc7sFRgNJQYnM1cR8950+tJ+lft1+Nl8XnB4MfIjD0551JllG1raFqH?=
 =?us-ascii?Q?HK0fIovcGpH4s5UiUT/QJbeXN6E29iZF4V194rcPPCb8QldAuubdMwgxdTkc?=
 =?us-ascii?Q?P6QGQ8x08qZrtsTV99WixZ7YSF135vVj/FtUX0CV3bKBghvGC7lcAsyiS2Ei?=
 =?us-ascii?Q?c1i1tF8i3KNJwSr6syWsRmyu3QRLxfWhtIEa+8DkyVcrEwkX5EhhQoevuned?=
 =?us-ascii?Q?5i6dc5fvWshOnIbArIsyzyFL21nrtSprSwgibZsPVUmTMUt3tAYk+ke/1c/x?=
 =?us-ascii?Q?IO0TW7t1mDj2T7DnqBHalRbCR1llJwgJil5wm8ufpMNVZ3KcQSHOSo6BZWbf?=
 =?us-ascii?Q?Yp5tHhl/YbgHme1L/KFLNf7OPs1yAK1YbQu3bgo0yFEldRHR1uuAJlNcZASs?=
 =?us-ascii?Q?Lh8LvvOlQIab7rUeLOj1y99Cbjc7I5ex9bCmTUg3H0duN2Y4VJjJZqcI0EJ5?=
 =?us-ascii?Q?P72CafvFj3/54ribGCoB/6wV2TKHVFL1QAQHggCUmW0l1JNGWdt87OcTzdw7?=
 =?us-ascii?Q?YJSDym0SXVAA9NWXaFQYNcG2qD9P7IGH5+cBhOvAE+OSzi02stzP6pJfg4WX?=
 =?us-ascii?Q?oDFswQO45FhxRQblWawWM2cvQtpHNMdoxA9XRFcLV+GE1e2GHTBTsY5HKoAy?=
 =?us-ascii?Q?8ibPGZWTfis9KCQEtE9HrhD+s+owCrICizYlZW4whKP0dJaSbLo9fJVBIr4A?=
 =?us-ascii?Q?ODuSHvjG6PsrRbU7o8kaLfnSE5rGukET47rDERs9BmGPqGMStT/nDvMQG+su?=
 =?us-ascii?Q?8L4Z5w2m6SQm1awq7F6U6m8yP7Sf3+pfHifUPnmjON4Lw2vXpfWz91tXyFhE?=
 =?us-ascii?Q?FCQ+dfnUggLjOkBt8w73RbKP8vwBrFiS8TfUlNEkRw204Lw9K7nfkrjfo0Wl?=
 =?us-ascii?Q?tlDG6ciYSlFjZjY9fkapdGlhToXXVAWQAVYOUWBWHDtodfVy8PQQhtU95T6O?=
 =?us-ascii?Q?6TSfJbnGk6BUKBAkFwOi9EeBjY8vRwqnND2/RnJsuHHipZDo8djGhLJ9JA6d?=
 =?us-ascii?Q?i8GQt0ZePXLeN/NhPy+a8cNCO7mNg0C6TYT56QfxEmJ7xo+7vOgxWb5K5h4p?=
 =?us-ascii?Q?nrV2Dym21yeh6VHCIvFhJWj2+QDNYf0FBRsP6fYl?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2276b3ef-bdb4-44aa-3d9a-08dd2db2df19
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 18:00:42.8289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMsHmVEa8Bub3HVSn3ySZR978x8rOE2lwfmlqwZyStz8aSgyiJecIkLajZCNEoLu/PYlv2x99ae4DBKLWeh6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9304

W=1 builds warn that the data written to 'tc_name' is truncated for
theoretical strings such as "channel-2147483646".

Solve this problem by replacing snprintf() with scnprintf() so that
the return value corresponds to what was actually written.

In practice, the largest string that will be written is "channel-9",
and the return value is not actually evaluated. Instead, this patch
ultimately removes the warning without unnecessarily increasing the
size of 'tc_name' from 10 bytes.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412221136.0S4kRoCC-lkp@intel.com/
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs626a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index 7a6e6927f331..7fba4a8edceb 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -771,7 +771,7 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 		u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
 		char tc_name[10];
 
-		snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
+		scnprintf(tc_name, sizeof(tc_name), "channel-%d", i);
 
 		struct fwnode_handle *tc_node __free(fwnode_handle) =
 				fwnode_get_named_child_node(ch_node, tc_name);
-- 
2.34.1


