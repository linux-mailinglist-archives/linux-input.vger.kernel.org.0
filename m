Return-Path: <linux-input+bounces-12597-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D77E5AC5432
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 18:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6D5F7A53EF
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 16:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3521D28001E;
	Tue, 27 May 2025 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="j9O/t90W"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F142194A67;
	Tue, 27 May 2025 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364883; cv=fail; b=o93SaltepsRgYkKAzGIL0OodYiWbMbBucuWmGHXAgt8OSidCtB0c+lsLnvLYtER2QOOcp2NtHHEvn8B5WlrqWQvSzZvIpFzIu2S83fG1PF0IULuJ8OV+MJTa1d1p8t+K/KL3dHJEQyuT3fTE1z2c8yIq8MHFQoYTxCcaWgnApyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364883; c=relaxed/simple;
	bh=AQL9Zh9eCw1lnghteElNHE3j9FDibc2jUpHDFo3firw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=omP5bdAlFsUMAc8v8IjztPNkqpPYJRQ/H32tQUvlL3Pkl7QB4Pvsn3c64q+1ziXk+dpwiWCPjuavuCBMOcUi7F/6foeEP/c0AIvbK+evi+iKnHYgLWs1TAiDFiT8DGTsd87sJeRSS35aRtrEARdgLNbQ0PGjHQDygLDkezTEHGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=j9O/t90W; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfHSUpBC2PidCH/U43vMFeqUYN1CTDtRHDTWNKR/sAXCz9meMVhxwY8wb+MROeAKQi/F8h80jRNN9OW1BCWaTWxWO1dB/otbtwicYg9EZmjuU5umnKC6zFu8d2DLXfTZHthfCj7yYzcxElCaf4+uOdFzqky17MRCrOlSNNvDN2MmtPKoZCUyWuWHv8gUgsPer2Fh+92nEG9/SI4bA+jZ7oeuAUwNL+L71sIMdLeZPBasfv9hV0mKdzxv9K8f9VMh2r9bBEDSAKuCRVTrboe0mmLdKvlKPwytXzoSigk1gLv0zUIY0TbO2j/HAQ7wDMy8ETBo6tqPbfTFqyvs3qHrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON3gyKDVxY2X4X+Z2Jhuwk9FhoeOKhrst8IkjNB0Sho=;
 b=nNA7aKOHIaiI37d6QZbY8Ekn1dUDzeul6u9THQmno2iSCMS4YQeXzhGVmqP61mzNXNA1qiLnSXSxIQKfAOuKKop5SZv8DkU2A2UbfSqGgjKmkcfnsDOe4tvcGYpqt4KiN46ZZgqsXcqWhq+sAjiGxt63dBGJLDM1fTb16pMONt+BSDwwkwx17kxBy7wN75k+u7BYS3EkrXgN609jEKc+hGGFLtcijAsqWZF1mWVbzivV0DSEttmda5qKQwqGFwFWIDYCoQDGUcT6IdvDXEPXhAWXd58sXzhrZRPZJXFlASGZfgKB9Uqg0/LMpxp6Nt1kJlU5YJQDsmwjzIZWto0YDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON3gyKDVxY2X4X+Z2Jhuwk9FhoeOKhrst8IkjNB0Sho=;
 b=j9O/t90Wf6EhSnItDVAlyclB+08Dw3jaC7neuKasTeI1tJX3Xpla85JXQ13CQQ9FVuLSU2Dv0y2hU+WFtHDs5A+sSzuJOe3SzgUwoJN8y8o6QakmGm+4rzhh3wrNxSUbHn7aPIHCL85CbsB9ZmXSbwQXd6b5Y7za6y00RZCNnn7LMPO6LGA1+/HldcJSIB5xvpn3AZFUARnTivs2A3KUp0o/7vm/YppkR2Yvi/mRpzDRKjtFUA4nKT3PhLWVZswGpWycD8CLLQX6RcocMmmp/Xe+a7a2erCynE2WTojeqEcamwkrlU/s+9366uxIYd5AWt+nOVHj57xQtx9QXG0gwQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB7799.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 27 May
 2025 16:54:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 16:54:36 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Kerem Karabay <kekrby@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v3 0/5] HID: multitouch: Add support for Touch Bars on x86 MacBook Pros
Date: Tue, 27 May 2025 22:13:12 +0530
Message-ID:
 <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250527165417.24165-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 0988116f-91fe-4f1e-f049-08dd9d3f2943
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|12121999007|19110799006|15080799009|7092599006|5072599009|461199028|3412199025|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Szg4BXORiN0ZSoZRJ5q2i4Ty3lyTsgO4bfL2grXZ+9GbqZBRruQPp6nfVucm?=
 =?us-ascii?Q?TcdnqUVPUDXWBtcPon2XBxf8WQ+T6sCjGWvgfSHHPFVZbNku4rh3mhLc6MQh?=
 =?us-ascii?Q?cy3XAtPX8haSsJw7jFMtktT8gCPOVD2v487uW5u4JGK4srqfH06m1nsGN5/t?=
 =?us-ascii?Q?V28d5wR+1QK4in4+GDZ5FU81xkCbgI0GiDnBCTeQj06TJBDr68GAdq7f0oTq?=
 =?us-ascii?Q?RLk5NOro84Vm8NGLSyaKDyQ127TeD5RJdMdM3iQz71PmigzoysOYMPYxDpjd?=
 =?us-ascii?Q?tvIWTLdZ+adepA2hGWBUymf4C1FOJA6uuNztgphD3Xkaw212BcabocCgBe52?=
 =?us-ascii?Q?dNIinmQFU+7onOsORrmBPXYEyuInCRl4n3ssITD6MEotYGPwJj3csmiojsFr?=
 =?us-ascii?Q?fRp3d0ggPDyfwkqPZW/iLGXx9osqd7LySPGv8LqhhzY9+jWNKFI387wi4vih?=
 =?us-ascii?Q?g1M9stzgg+fhvVDI1hZifpADTr3cW8OWpf4VrPjVNze8+WrAC4IA7gsEjbE4?=
 =?us-ascii?Q?683e70LtxAcUlWWp81g2zXV/HA6quXv04E7sHXQzkq9ptm6XU/XTiXsRPBWb?=
 =?us-ascii?Q?+Q30uzVkHBwbgW+Vmjy9u/sX/S19WTsqqayzZfBxyRu81pyaHMjT/EYB7Wvi?=
 =?us-ascii?Q?M4UzSlLKC10GSUkUYauYbrk0Kg2bcAsQzwWYSnkSsbDjR8+/wq/SlPZZe8Ex?=
 =?us-ascii?Q?TnCWCOmEO1S4NHhrrXLZBpx71GPS0P+fLDK+a7TfctKH5Cwe16HBvhJog9G4?=
 =?us-ascii?Q?9AP30QdfMd0Mf04mEI2FUGvCA/xlmHCDSpJTn49R7zziCI1wTMS964h4nXWg?=
 =?us-ascii?Q?FIr0eY/FYoXIGHblkQQZchp1b1FEBnVmi4dVNkCYCrc7xy+1PeDuMDrTI+ib?=
 =?us-ascii?Q?fL8prYCLgI7DoUycJV4hgvcUYWqLhViec+3jeELQcg+p2mA1sxn2AKu5XeY1?=
 =?us-ascii?Q?tawlLYhuE6eV+7uWzfbMEE7Qy2L/mfmFRgcO6+g/+rDTMe1e+fFZKo3CY5QY?=
 =?us-ascii?Q?ver3wsB8kQe1hyfC/pvuGmm0/jDQMYe2v1M1zW5or6jHZoiMcCbYB0FrxbcK?=
 =?us-ascii?Q?4T+MN6QMFSXAsinlQtIgJMYdtJKqzBDRCGzJtoe1OrYIhameOosoHBWvSY+W?=
 =?us-ascii?Q?8GpphAGllctxgCMoQdA2nj4WipVwtt0U3Oj2+fMNDP/GQjejCJwU54LoiFLI?=
 =?us-ascii?Q?SIhxzNDmo5CEv0z0YNhMtFDqTW/hNCK9DSKRhA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GgMAfrKcoq3Dwb0mv/y2MxcNFS6aEruAbhQ6SyZNB9qvxyBWYJw287x38v/P?=
 =?us-ascii?Q?iMh2A38hC48/aXK2kqrJFg6qod6t6r82v4tNkqF7tTikunoD1sXUX08+bPyx?=
 =?us-ascii?Q?WbwY/VE99c2K6qy6nPqUjUxpDCCBZt7fLuc3G9JvD/m1fe7r/m0Qls5JLIh5?=
 =?us-ascii?Q?ihsBi8Y1VJFNzHjvrItmiFgkECRM/tQ7ncYySzSLyFTT2p/iiDV3hzVb6jz1?=
 =?us-ascii?Q?TevuwFEvBge7m4moWBShT9xRfVGw6xiE0Z+P5sq6fBR5JGSICINoj8sx+OTB?=
 =?us-ascii?Q?gDGzzbhBlAoFqfHUyEmPTKFQXcGbEGAJ5s0J3VwTgPK8/asaQmfmWvKE4p+G?=
 =?us-ascii?Q?Z9Vz3tJZY5fs1AYAUykZZ8V8S6W4RNBIqzNlJuokl66Wkj9wShKm8IFGjiAS?=
 =?us-ascii?Q?R4cpLHc5SYsX+/3OHB59hmGejw27mkQM0h3T7eJTsYIjvZeqe6PxYawPtaj2?=
 =?us-ascii?Q?+9G0CQxFHrXIwzrE0OuV5zhrhv/w0xdCpaCt8l7hc5HXZhC9Puiuk1gxKxIT?=
 =?us-ascii?Q?sbD993eQb+IhGGLNEulCR3sU/qryLQOAPTeByeTKZ0/snhnW27/89QWxQk3p?=
 =?us-ascii?Q?QmmxgYGjnoYzwQRu9NeeERLwJOZtxD7kPy0rZyFkHojKyNqISqibtzuvcDa+?=
 =?us-ascii?Q?SpwlaGXfzXnWXzj+RUwkCFlzhfjEDjMYS7ovdWVeNujSnIxua/Eu8W19XErR?=
 =?us-ascii?Q?elvh2V3z7/hVb06bXYx+IymHLdOnRAtlDwYoSowHUI52g75fss/WYvojlLBb?=
 =?us-ascii?Q?BsufJ/+0oyAMRQi9Fqzxvyhg2rO5SXQ4a+7kwUnKvM2Tg5rK/M2fNkXoggtt?=
 =?us-ascii?Q?j/xISNp35nQL5a7eLouZ5c8sYrj5D49EaHzsEucUwNMprqA480WuI9ITyuRg?=
 =?us-ascii?Q?EoSlhcfcVxQZ7fSHaYGZCJPAHJ31Vbnv36HKIUD9FB6A7QYVzxZ5W2eZySMC?=
 =?us-ascii?Q?Ihdjsoh9E2Ks9qhGSxtWtdn8cb0tnis//yEm1MGHl06C7xg1lrQQeUn0ay19?=
 =?us-ascii?Q?ZK1W/3VwMCJ1GDtFcR05C3IylnsKLkeU6ANvmWuEqB+WcI5uuWMOTkF8IY0C?=
 =?us-ascii?Q?3b8HJpAa5gKOjnsX2FvzfO9KHC3njAgwMCXKFhYL3MHb2v81Pjv/cnrY8MQq?=
 =?us-ascii?Q?2loL+noXuZFtuk+/cfSDL6DsLQcqIzckDD11x4GonzaUYJtLIyB4V8vNa8Ro?=
 =?us-ascii?Q?7RxIViZVL6BtwTwD6xCpwQvchId3ykdtzFe/W8Iv6uwWnCOhUYXgrXRB2bYk?=
 =?us-ascii?Q?nHcq8t9DEsu7sjFZs+MVVCaT30UvExyLl6stFhcPIgjwORtjCxYszdaA6yJN?=
 =?us-ascii?Q?dn8=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-18ccf.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0988116f-91fe-4f1e-f049-08dd9d3f2943
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:54:36.1462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7799

Hi all!

This patch series aims to improve the Touch Bar support for x86 Macs.

The `hid-appletb-kbd` and `hid-appletb-bl` drivers were upstreamed into
the Linux kernel and are available since version 6.15. They enable the
Touch Bar to display a predefined set of media and function keys, exactly
the same it does on Windows Bootcamp.

Alongwith that, support for the DRM mode of the driver has also been
upstreamed in kernel 6.15.

The DRM mode enables the Touch Bar to act as a second display, just like
macOS. So now you can add a widget, put a clock or anything else on the
Touch Bar as long as you can develop a daemon.

For this mode, we needed two patchsets. One went to the DRM tree as the
`appletbdrm` driver, and other is this.

The DRM driver is responsible for displaying whatever the OS wants on
the Touch Bar.

Now via these patches, in the DRM mode, we can use the Touch Bar as a
touch screen. The Touch Bar seems to be not compliant with the HID spec,
thus via these patches several tweaks have been done under the cover of
a single quirk, MT_QUIRK_APPLE_TOUCHBAR. Originally expected to be
upstreamed alongwith the DRM driver on 6.15, these patches seem to have
remained in a backlog.

For the case of T2 Macs, apple-bce [1], the driver for the T2 Security
Chip is also needed for all the peripherals, including the Touch Bar
to work. It is still WIP, and will be subsequently sent later to the
appropriate tree. Till then, I'll suggest testers to get the driver
from [1], or more preferably, get Linux support from https://t2linux.org/.

Cheers
Aditya

[1]: https://github.com/t2linux/apple-bce-drv

Changelog:

v2: keep parse at original location in patch 5 as suggested by Benjamin
v3: Reword the cover letter to update the maintainers with the latest
    situation, and re-prepare the patches on 6.15.

Kerem Karabay (5):
  HID: multitouch: Get the contact ID from HID_DG_TRANSDUCER_INDEX
    fields in case of Apple Touch Bar
  HID: multitouch: support getting the tip state from HID_DG_TOUCH
    fields in Apple Touch Bar
  HID: multitouch: take cls->maxcontacts into account for Apple Touch
    Bar even without a HID_DG_CONTACTMAX field
  HID: multitouch: specify that Apple Touch Bar is direct
  HID: multitouch: add device ID for Apple Touch Bar

 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 62 +++++++++++++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 5 deletions(-)

-- 
2.43.0


