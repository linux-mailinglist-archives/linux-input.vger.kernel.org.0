Return-Path: <linux-input+bounces-16138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E13C62231
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 03:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 42B2235BE11
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 02:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C9026B0A9;
	Mon, 17 Nov 2025 02:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="A9h+yVAp"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9E7258CDA;
	Mon, 17 Nov 2025 02:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763347211; cv=fail; b=IZowkVCSLHREI3TTxxpUYVCoeLRHUhUKcH0tvzBoYR0mVXfNNuVci8dZrCEpGZCmMP42Loq83iJrfrYdtYk3sNM4HB6QJ9c6vh2Y6DqPs8oYfKrCMhtysr4yn4ag8Yc5mAI/ndGji8nuoyAbsSErxsabEi1Sf9twfYb/zhYU6x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763347211; c=relaxed/simple;
	bh=2WyoaI0gDlpwcfabhC/w9UyxlBgRpb734vy0jc/1u3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lwau73OlZGQMMCwGiWHjLMyEc4DxPvUO1SI3YV4Cm+EFxaNPmlfjW3PvgR7DjFbgOtaL/CPONwtd5q3nKWHDXSBUzupgTRZtb/h3IhKiGOQeRmS934e8MuOtK+NkQ2pzQDiAVq7kOFNQhehraD3J6j5DcofQzsuVzHtGC9F4EJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=A9h+yVAp; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnTgqiTDkBddKf9ZwgpczU+agYxR/jKKhYIg2ikrEz12Y4Uoquir9bLvAWRz4YwM+gyFucl0pySpiGRPqk0D1anxavJPOwCkvY8Ju5ET5ZIGhIcAl+aA0AIa9AqiiXLG8H8njw0pLcSGYNtgWDzoR6duk5n4e2FhO7Bmd6ZqHdCBovbgI57zLlCTiDKXHYePuvWpb4XWvCxgchOm6fxmqJiklKZ0TfRptEAJM/TnuaLj1SSBXuQ8q+kKaomAB+TcqeE0Ivjmxgu3jgYZLNz7RdSKrloh+3dzSZla56wW1rvWxAXvJZlpGHmRD2Nr5oNIQOLSGwhsJK3fbLB0H5BfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj/V8tI1EIgK1lwpe1YACkZv79IU9Mf+nq+l2nL6GQw=;
 b=rBc9xfRyepf6+GiEI+AG46Njwcox2qMyjmb88tvr6Hmsexqil62TMvVh4r+d47ydsOBVsJKTdQRhj3YtCLhOE8XQ0UwYfwbP8tEYfZGwQdj20IoItODqJE1xr6u8SkI9WEOg/rjfhH/pzMV7bwIOjs+vzL6XmKdrSKkUlhCTV5MXtsIhpmEGP6J1Ittbs9rJhj+Dj7ot+G45oTiutsLAYlw+NmnjVMaTmikOxxk9CB19UNcADkUykcpnHuhA2yEhKAX9y1/3Xa/sCXVOGoIgOMud/0+opE2cDOZkSJ70ABGVwI40BT5WnZ5b/wOW03QbV/HZbiOVarYQE5+1L1/qZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj/V8tI1EIgK1lwpe1YACkZv79IU9Mf+nq+l2nL6GQw=;
 b=A9h+yVApcjkkTxMjo1xKqmT5T4QccpYp6oN9XrSiGNxxL1IfLkF3sz16ZKSa4hG6tEqqOsr9kNwUsxoDYJ9NCN7R5ZVTzb/fGEZqi+SLklglw/rrmtHwVCD6VM9FF3t85vgzlysTIicQ+mMHl8dymqAqk97xP4jp0oNNYsiqkAM=
Received: from CWLP123CA0191.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::19)
 by DBAPR06MB7015.eurprd06.prod.outlook.com (2603:10a6:10:1ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 02:40:03 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:400:19c:cafe::6) by CWLP123CA0191.outlook.office365.com
 (2603:10a6:400:19c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 02:39:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 02:40:01 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 17 Nov 2025 03:40:01 +0100
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
Subject: [PATCH V2 0/1] HID: i2c-hid: Add API to wait for device reset completion
Date: Mon, 17 Nov 2025 02:39:58 +0000
Message-ID: <20251117023959.594514-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Nov 2025 02:40:01.0614 (UTC) FILETIME=[78EC46E0:01DC576B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A9:EE_|DBAPR06MB7015:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26e99e7d-1f69-48d4-6eaf-08de25829b95
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?heRyRDQa5RS1D167unXLlgY0PQeg0dKolBjEEOgP2XZPGEcsXM3tY3D3MiQP?=
 =?us-ascii?Q?9Njo5T02nDzLKOebTodG8RSOUgoV2Al2IgCFdmxOOnA6IE0W0GIrIEkcryI6?=
 =?us-ascii?Q?UfzcHpHwVg5om0sQBNqrb4q3WcH3mhyV46eza+amBc1s3/IRqmnpx+tVNMoB?=
 =?us-ascii?Q?RuL2Dy488POT2e3cInVi2QNH0bliodTc3dgJOC/MrmmWqujtbmJcNEa4ryeB?=
 =?us-ascii?Q?pY2ekYqR5XW1KLQDr9iR3DNolMRHswcb7hBWo5qzdv02WWpr4wVdrFOFUO6M?=
 =?us-ascii?Q?vDozw4Yln1IYb72sMAnik1fNVHpwAlCWM3V/zm2C5glUIiTCHLKEfssHNXNg?=
 =?us-ascii?Q?asiHcGvK5sWwL2iY7+/180ETpF8wldREQinpWlG39pMBlJ/MAM8qeuXxQk2t?=
 =?us-ascii?Q?kt8DKzX88+SjRpxpKX3FDStgZSMMg0QIrosM26kQiRQpnLlwfE4rG5f0idDn?=
 =?us-ascii?Q?tPHP4rQtuEiwmK/ej9EV4MRCXFkjQzLhzhRFkm8NTiQhjVJzTmAYn6Qe6JQ4?=
 =?us-ascii?Q?Gf71uJfR/W80wRrazyfRZq0tVaQheax+GDaBz6P3NQrqYq8Ij4jC25E7oe7A?=
 =?us-ascii?Q?tuipOzlrV3/XAZg3GQt7Rm6753eSX3Z849xf5VULfHzb/nH+WysaNCWPj0zG?=
 =?us-ascii?Q?ZmN6aVIm1ZI6VttklZ01zik/lQq8YS4fi3o2WDiq0F0+akrb3CQ6c9uhxcPe?=
 =?us-ascii?Q?EaBFyFzlTIDWKwcQzbGZ7LrFYAELvg8Jw2r4/eYJfyJswAijQcWZ9liCg4/X?=
 =?us-ascii?Q?D37QlI4FChtLqRhqqXtq0MBrDeqWwmC9005LtrYR7O+JNwOC7iLgnL+XOojy?=
 =?us-ascii?Q?nptEaU+FssubqBcpAOsHnC2zQTxg9pOMvjOOfiycyuDUxwci1/7SV1NnhIgO?=
 =?us-ascii?Q?X2lTEM4iYDRgfkMAAxRpeUTdotLbCQqLRNKZuGQDArNOtm2X8FWlWT3GYXyE?=
 =?us-ascii?Q?QghWE9M1HKc0zXixigzn/sCNVh7Hct3BHxgmzRQ2DG3EGNR/B565b1HLuaqu?=
 =?us-ascii?Q?aWl4Ujnwjo+Ql1UtWmbEgLPT8ov8dHUA9ErX1H4MBZH8lmkWpwsoDd4kzSNL?=
 =?us-ascii?Q?EOI/Hq800zhntfWAwQnw7jYfMey5qdkPyYvtiRiBdxRTC/RJ0BQYFfevQGUV?=
 =?us-ascii?Q?rZCXT3JBMAv/mfJc6IOo8MpdX4SGbUlD9sjcvbpVmID4njLH83D0YwcQXd5d?=
 =?us-ascii?Q?gz0MsnHJmaqcDv/18/28MsgiKFuopzj1I5CIq+sB23WZ2hS8gk6ArISTD9Wt?=
 =?us-ascii?Q?x01JcfmYw2VGWHQxkM/uMwsNwvNes1Bjs/0FdaH+y/RbU/UcsVG9GcJj8k0V?=
 =?us-ascii?Q?ds01GsDf2QzSaUW80famJ3lc2FHbGAIJYnHvKCocrfXMU48MNr+CO97gIpN4?=
 =?us-ascii?Q?fm5i4xNHbEFUn3u4tzC2lqMlGSVMC4kShdgNMMeoRD7tdfzWXvju1n32tQOD?=
 =?us-ascii?Q?IGTBvBtjileBCvlWo9ZjQj8hHylq7sHSpR+TIeAl61+y+NPv/UDDrhvBrBoy?=
 =?us-ascii?Q?TpziPOvYzgAQSNp5CevDRLI/Tr78KwmC+4duEZko5JgQgOsI87dMuRtPKG3/?=
 =?us-ascii?Q?I/XmnRT37umr1uunN1l0Tvw0bjEHdcC9xNy9VFcu?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 02:40:01.8362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e99e7d-1f69-48d4-6eaf-08de25829b95
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7015

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
submitted separately once complet.

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

 drivers/hid/i2c-hid/i2c-hid-core.c | 28 ++++++++++++++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h      |  1 +
 2 files changed, 29 insertions(+)

-- 
2.43.0


