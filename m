Return-Path: <linux-input+bounces-16145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F7C62DA4
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 09:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 527794E56C1
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 08:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B0131812F;
	Mon, 17 Nov 2025 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="KAkmDjBC"
X-Original-To: linux-input@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447B08462;
	Mon, 17 Nov 2025 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763367056; cv=fail; b=G/g95DD7GhcxVPE97tqaYfvaaJAW5DZOZK7TUowyDFxSWeSlY7YORh6Z5PJnhMTBY4AqLvFz1EP39MSKeXpEJR4OBv8uXRuHNClTfsDLvlWc9pv1v17NjtgAJzRrv3LNB5e7pDNZssaCF31KpZKEQ4MD6GGCbYRHFa60D6prDOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763367056; c=relaxed/simple;
	bh=cVuQ/8ajbuppTmD7S0xBeQy+PYwo9feY31Jd3gEWY18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tkVO8kxZx/JT4F3i/kfhxI5WKzkSlBUHY4ttb3nxxwEoLTq21UJeolYFo9uhNmA/OXmUdHSM9NDoMqFGY16qFRqsUfiFZ9IJPQTDik3GK57flq2Gq0z2EW8x52R9fqMVjTi1HoDAfIy8dkI7Rr4DIiWhbm1ukaHjAnqlflhgYrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=KAkmDjBC; arc=fail smtp.client-ip=52.101.83.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJZ9/l40zSVEIrD+paZxH1CBll8/SJTcMPJIpf/4xJxmQEWLerfIQBrk4D0m0n+eEVFW8QMZczytCjynlrzDtT4+2dvdhpVhfY8MpF1/AumJ1t1iyG1uTYrHDd52uPCNRIKSFIX2wPJBkbDJk0CK5eh+J8ScrI6ETNhzLl5IScN1h38bPERbCssMGxSnJeVKsZCbRAkXNfFM5vuJdGnBpOmcri7vCY07bSjmJYycNoV1c0RtoW427PNn4tP6tyDiipf0YZFAmPEG6wuqr/J2sWxCgph7en7NAJosumQy4UuF30fTZpGl2HRgERSRSjmHSKPAmteqnlx7azUnyhh+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5RT4IWvL0jOJYEeFgoKuUYnO5J8iqWMMDdDYMHVkKs=;
 b=K4n+HRshS0ZaE2/awltsKA186/yUhWvjW2PSUKFe/BPtR67A6KBrcSLFPLDCTpO8q5UdNqFC+3URRP4R+2CVDtBBSKcdH5p5pYyjTGvOVYnGaEeP8aiIMxTiNk8OplI5jNHkmiGzwSJVvV30nZT6shbh63VtBob8/d1mvvmFf4NUb9WGT14trVXb1g4wDUNpvw2uojr5D3j53p9OqaXdalZDyyaFHHPr+e+MplwJlGJJjtB8UQXCaJP0DUP5+JqtJCzaskFy51zsdxX98udN2i/+mOqSAcqFQmmuEIeW+tSXa1ZM7EwK1mBtLwsxGVfHARkeUJaXWAQiEk3JY5QH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5RT4IWvL0jOJYEeFgoKuUYnO5J8iqWMMDdDYMHVkKs=;
 b=KAkmDjBCUIxnqY9oxb8pESmbo+VxnlOoAHNwJALqInuXf6KGAWTvQSLRj1O7Kwgel1fgOA1i24PULxFfZMlN1BKozBdMVKGCb/OmheZK2N2b3X9U7WSsCxTomff7Fa0rGjRNB6WFIyZ4nkVvTRYqr1H+M46ni7QNTB3nkD7HaAs=
Received: from DUZP191CA0066.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::9) by
 PR3PR06MB6619.eurprd06.prod.outlook.com (2603:10a6:102:6a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Mon, 17 Nov 2025 08:10:49 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::f1) by DUZP191CA0066.outlook.office365.com
 (2603:10a6:10:4fa::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 08:10:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 08:10:48 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 17 Nov 2025 09:10:48 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: jikos@kernel.org,
	bentiss@kernel.org,
	dianders@chromium.org,
	treapking@chromium.org,
	alex.vinarskis@gmail.com,
	dan.carpenter@linaro.org,
	superm1@kernel.org,
	guanwentao@uniontech.com,
	kl@kl.wtf,
	Qing-wu.Li@leica-geosystems.com.cn,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: liqind@163.com
Subject: [PATCH V3 0/1] HID: i2c-hid: Add API to wait for device reset completion
Date: Mon, 17 Nov 2025 08:10:45 +0000
Message-ID: <20251117081046.3140656-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Nov 2025 08:10:48.0563 (UTC) FILETIME=[AEA05C30:01DC5799]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|PR3PR06MB6619:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1ef099a8-aaf0-4aca-51fb-08de25b0d16b
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e6c9peEoLns/KOrLuPXqZwoith03f7Ut2hvfAzGZY+M0DUPQyy8C4xR/kaaE?=
 =?us-ascii?Q?qfyTrCZQ3FwWpXloLZqqgJ0Gn12Rj30GKMLJz7GU9VtjMyPm2iEpJS3Lo6U5?=
 =?us-ascii?Q?zz/zDKrhj6zwMMXZReS2VSHsVIG0KfnORAoMHzXNiReZF0ZsHzwPePcnn5Fd?=
 =?us-ascii?Q?aWZL5+hQaNksLfWxFll+OQJvh86WXWAdUAYztiI17QF7550u3avcqs1UfxNl?=
 =?us-ascii?Q?EQhYPTj9d8/b0rGLQMq76+q8v9D99RTf9ZkSUAzVOLN3wtXi4WPjY87MTtb5?=
 =?us-ascii?Q?6UAVyr+CLXboWTIguNy6dHHd02FjTQhxwPFYekJqmlAzlYNJ0GLXN7xYbQec?=
 =?us-ascii?Q?2c4vNPtbSM8yCNKxhLYMKJNQpILiErdYMeMyl6pH0tDhcIZVr31Ulpp2btoW?=
 =?us-ascii?Q?KDTHQEJbpeueWh3wRzNjekrGhGqt8JeORgn3bmkwPAtjROmjfLmC5CYUIEqv?=
 =?us-ascii?Q?SFfSJdoV5mj3SoUeYm35H5KT6U7jMU9dzga82JhZi8TNrhvf5EJwFKaY0Rw+?=
 =?us-ascii?Q?LYxuWXYpL7xM+LjlYCVCfQilbPjNV93DapUMerLI+20y5U3n3N4PmE211/BP?=
 =?us-ascii?Q?C9erDqeVxdrgaWtr0V44BZ47JRHz+MgfVGQrpbjxfaAQesd9FqyGAD0Ec3Zq?=
 =?us-ascii?Q?esgAlK/zc0IFEh6a4bMTMNUeCkS6y6mAJlWT0C5Fy3473eJChYkHgipbHugx?=
 =?us-ascii?Q?3WWVYKyPErMpVarMxCaJ5d/l75f9fp9RrnD8RK+79vvwvRg36bYQJxnnCV/g?=
 =?us-ascii?Q?r0vLwYIvC7CyzulhlmSiDm3yXTV+IX7zfY+kJ6IYG+lGXCz4JXSs3zkW9xMi?=
 =?us-ascii?Q?qxxpX7m9jEATo0t9huMWubxVx4Cv6bq7giUdPn8KB6POrp+jU/LiyOHtcruA?=
 =?us-ascii?Q?cfrIefWdjb8pKc0Knj+P5EMBpdaI1d/6eR8kYzvYFkDyVo7uPwXgsmCLAEDt?=
 =?us-ascii?Q?KKqIoDkxjiRlID7uEuspqb8c3MZXz3lWaywWDyS4xsZDpPkxMwZy/k5186QZ?=
 =?us-ascii?Q?HnIsqFW1kMx7/sjWxVHkcgqAJhnJ30w6cC9L0u7mfAT8KWjcCDL8mVqMU62V?=
 =?us-ascii?Q?8AxhJQesNRIjLFM8nf2vSzTUYRuEdk7uGOFXtSwRQUeV7RHDr1wtUMhBPTne?=
 =?us-ascii?Q?R6yNMYTn03wZcNfYXxl5TLG6YqUciVh2VUL8LOr25p90ffLLgCjkkfyodsay?=
 =?us-ascii?Q?+i3qWykG5DMDncK+Xs9oyglJR03Md/e2ZuL7fFOte8NCCH5ci9guaauGlfts?=
 =?us-ascii?Q?JglB07EY5SDt0Z53TdfyJ0UdKjURdr4nbxYoWt4zc6YDiuLmAMWXyQoIk+Ar?=
 =?us-ascii?Q?eEjyyp2ZQqWz3g8Np8BSrw5HkYf1I1fybVbOrS73vAKnuM8fOI7nS2VOdaWo?=
 =?us-ascii?Q?6hyAhswWDaBQtqNEN39R4bMPeXjS0ESCzTb4LupRwBKpcus7asR1iX2QKMp/?=
 =?us-ascii?Q?MMeOeh49L0XnsnYpg1Xas/NieXCacLM0cBhn2gH+NHDjSqU5gCCe0SahdGUk?=
 =?us-ascii?Q?p2NBhVygWYulmLtDqndgEe+pDn4RoQ5XlqTP767k0YgJFgMBukpBFGAx+8DV?=
 =?us-ascii?Q?4f+0icdy+FLMlrwwlvFwkTta5qHNO1p8DgMotCZf?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:10:48.9715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef099a8-aaf0-4aca-51fb-08de25b0d16b
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6619

Some HID over I2C devices need to signal reset completion to the host
after firmware updates or device resets. Per the HID over I2C spec
(v1.0 section 7.2.2), devices signal completion by sending an empty
input report (0x0000).

Problem:
Currently, i2c-hid-core consumes this signal internally for host-
initiated reset synchronization, but device-initiated resets (such
as after firmware updates) are never exposed to drivers.

In i2c_hid_get_input():
  ret_size = le16_to_cpup((__le16 *)ihid->inbuf);
  if (!ret_size) {
      if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
          wake_up(&ihid->wait);
      return; [1]  /* Signal consumed, driver never notified */
  }
Why drivers need this:
During firmware updates, the device becomes unresponsive and will
reject commands until reset completes. Drivers need to synchronize
with device reset to avoid command failures and properly reinitialize
device state.

Real-world use case (HID client firmware update):
drivers/hid/hid-hgs-fw.c:
  static void hgs_fw_upload_cleanup(struct fw_upload *fw_upload)
  {
  	struct hgs_ctx *ctx = fw_upload->dd_handle;
  	struct device *dev = &ctx->hid->dev;
  	dev_info(dev, "waiting for HID client reset\n");
  	
  	i2c_hid_wait_reset_complete(ctx->hid->dev.parent, 10000);
  	
  	mutex_unlock(&ctx->lock);
  	hid_driver_reset_resume(ctx->hid);
  	dev_info(dev, "fwl_cleanup: Cleaning up firmware upload state\n");
  }
  
  static const struct fw_upload_ops hgs_fw_upload_ops = {
  	.prepare = hgs_fw_upload_prepare,
  	.write = hgs_fw_upload_write,
  	.poll_complete = hgs_fw_upload_poll_complete,
  	.cancel = hgs_fw_upload_cancel,
  	.cleanup = hgs_fw_upload_cleanup,
  };
The full driver is currently under development and will be
submitted separately once complete.

Without this API, drivers must either:
- Use arbitrary delays (unreliable, may timeout or waste time)
- Poll device status (inefficient, increases bus traffic)
- Risk sending commands to unresponsive device (causes errors)

Why existing APIs don't work:
The empty report (0x0000) has no report ID and is not defined in the
HID report descriptor. Calling hid_input_report() would fail during
report lookup in the HID core and the event would be silently dropped
before reaching the driver's raw_event callback.

Solution:
Add i2c_hid_wait_reset_complete() that leverages the existing
I2C_HID_RESET_PENDING mechanism. This provides a clean synchronization
point for device-initiated resets without requiring protocol violations
or invasive changes to the HID core.

The API is I2C HID-specific and requires no changes to other HID
transport drivers or subsystems.


[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/i2c-hid/i2c-hid-core.c#n548



LI Qingwu (1):
  HID: i2c-hid: Add API to wait for device reset completion

 drivers/hid/i2c-hid/i2c-hid-core.c | 27 +++++++++++++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h      |  1 +
 2 files changed, 28 insertions(+)

-- 
2.43.0


