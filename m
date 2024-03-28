Return-Path: <linux-input+bounces-2609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8588F520
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 03:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F03CBB2390B
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 02:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F162024219;
	Thu, 28 Mar 2024 02:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="NO43hvjj"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04olkn2092.outbound.protection.outlook.com [40.92.75.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F924B34
	for <linux-input@vger.kernel.org>; Thu, 28 Mar 2024 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.75.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591640; cv=fail; b=gBdRZq/69PPMtm7KNYDKeygFDDtYd8+Rl41lo1y3qGB9YRAUCIVT7CfaTFJ7ZMK2YYeBlzQw7C4p2qzlnPObW4psUK77WLMGAnytR+Z0JwVsRvxmUlgjjM7ZAKhOlh5ddsYrGyfH8SD43SNGwWV+2pKpfJB8eELO/e3DP+EwF+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591640; c=relaxed/simple;
	bh=Gpmi+2SEJ/LVt9RucdqUuwnbBsLNTBcqOw3bwEWtRb4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hefB775D/cPrKi8r/u0vvqDeoX9NprtDNljrSzNG4lJrE4rlb4NRBHCRIkMUlirqLiUH00OSuew0KNjGP8hgb/0rTZSdFl6LQS/WHs0RNi8/K1hyd5bE9AnWAyFBE12Cioyh6rbZ9qjEL0aPQcIATeMvUXPcWCAoTVLZNvU0sEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=NO43hvjj; arc=fail smtp.client-ip=40.92.75.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG5KdpKPpecc+vFPfdACMbDNPH0xSJFUUjF5dc6huGk/vD/9vQOkwyhtYk6zhP5LM0VI2Qxeb3X1uKmgpY1XD3u83Iu5gxcqCbIVtc2EFbHAeCo7gTSti9r+1u9wOD9aB42cTV6dZvF2ZiYrotWJP5kKrl+VJJKvBmZLb5R8rvqyueK852RKcjn46eTzbduC77sOE1DCsALzV+iEZOGJvrh5BtzxluzMe1kBNRWFehXZTSfJ/xZFZAXtg4/s1PaMQlC6+w7U09EqwfJq7bzd1TmL43XyaBECQylH8PYfU8ZoXygSvGkCHvOdx7GYvREcEwfIi4ul/qaomORU9ZhC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPrXqUQp0OW3LCfyzGhrmFAUDybNvlAJ7/oLLkP8V1k=;
 b=W2DBYTyrMLQr7Vj3DscOyeg0gAhiMb36Y1QnrFyryTX45d4X9L3uyIo/F6CsHQ31qLI8LTdtQtMIEKIXErxHTClwqcoSVWggID8KhTja8RmUu6LvdvrPoUi9ZdM5AAOJb+0LT+oiJmITVD5A+uZGbsr4BuPxIkLUH1ANNfzUpRgQI1Z6TjpdFEz13ulk7isyLfgHB8yeV8qElwMygXPr2numqQ5Stei9cdgML8a2IZn3fKVxSyHUh3Nlj0z5smKteawPc7NZLDJN5nUGzxqx1+j/SZzamGBn0n9tv+f88JNDwF+HJUu0ZYoGoqkQnWQl20Z1x1N22/1HQEIc0gtY7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPrXqUQp0OW3LCfyzGhrmFAUDybNvlAJ7/oLLkP8V1k=;
 b=NO43hvjjKE6or2sQFCNA4H4hAHmsjW8X0mpJxY4hrNo4mSPBSZ6D2krMuWI6uzGgXOLoZBimEWMN6iJtxto0dEFJwJ8I0kJNfoOgTbc6m8B3oEZosE0q7mBjqzXlu8OvXe31HIgCxI9uZuEnVGDB0Pq2ITYt0ZLnFvGXzarpEZZLU+6e/UCITO+hG5NZ/wDHN2ZxJtZZNlHHm0yXnWEYYAanGO99IN7FCF2ozoSR+sBmymcIO888YFmfm7fy8lT3Z2e7+2ZBt+L0HV1fxkg3AGU0x/MmZlCImUa1YLKVmMY7KFFiM0W2WpFcoV2lqtw0+H/a5/R+cPeKZmWQVNC5FQ==
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:ba::18)
 by DB8P189MB0871.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:166::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 02:07:16 +0000
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::bcb9:1083:b7d9:e9a7]) by PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::bcb9:1083:b7d9:e9a7%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 02:07:16 +0000
From: Milas Robin <milas.robin@live.fr>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Milas Robin <milas.robin@live.fr>
Subject: [PATCH 0/1] Input: add gamecube adapter support
Date: Thu, 28 Mar 2024 03:06:50 +0100
Message-ID:
 <PA4P189MB1469A4E2A0633A2091BC9FFFFA3B2@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [2cuiXx49HvQFCSYWfuAd+xIzvm3d4HBPiuiLH9Ksj84N0X9pLh7UWDmFJWQqUHdO]
X-ClientProxiedBy: PA7P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::17) To PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:ba::18)
X-Microsoft-Original-Message-ID: <20240328020651.358662-1-milas.robin@live.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4P189MB1469:EE_|DB8P189MB0871:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f0d425-68f9-4d9f-8af0-08dc4ecbca24
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tEAiG4OrL+HwzqpAyQYMR1/RFYTtgN+D5bsrRA/3yxmPuUaDJXErMke0tjvrNajp2GipM6MmhaCKalmJPbgVp8OlmI0PHZ2z8uoEjj6ba9sOydXHzAZeOFWxZOaTygg0UXzCARkEICPoYXt2isPZVXXkeWPD7XtBJgiJJ4iqxP/XSVR2IuvpbvseL3aAEGPEregiIl1AaQRUPxnPYzBMHMXoq/zVMpqzsVQQvmrLHk14qaQMANtbsg9Tm27ImXhTzReGi7pfe4mf4c+duWqmh0WFylrcSO60DdT34+oOCexeAqUrUDYILZjFn3F5gc03qAGiTz7ZOhZpGluzTOcleK9taSOkIdZM5XRI7ywEoFk/VU5YKI4tdYUcYbvShJX1dHQ7keUITyOBuqiWf69cLM1pglYcKZp1AEg4ZMMQwvwQFtWxm8QS6vf1aVIjaxo6m/XB8zijYDPkqf4WIHn2YBKvjX5aVShTjvWggfAsIWX29Qudb9zo2fJbCMr7vXPpuZsdVP4jyvOsKZFPwaG7XPmCBSmdYP3aRERFWkuUFV6WxJgKlm81lEAlADuBQ5YPLI2YW+14VECDxxT6nrz8v058GzMxBvpjDNv7wKNFqtegu1oe3H2bcaMNdcq8SRj3/C5EOPnoarzDU/ttVOPQhfCyLqur2py6inKiT9IlyMIVIOBs3B2QnA3E0v4i7kZP
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N04xT5nvK2i6TfzFyHpq0LVKtxEJmc7TzSKMnR/EtGFsIW2jtxwB8fun62iK?=
 =?us-ascii?Q?bt5/0hYQ3aYv+7s4LQOv1uI0EGS+bCmot/y9jBQ51TR6/xS8NYywW4PFso1g?=
 =?us-ascii?Q?6CRG52NHWJnPyZpBVuXxmNxfXYf2BgX81Uj0RIIeFDkbCkDX5oYLLHv5c+2S?=
 =?us-ascii?Q?FhJx8MI3jJeMOTUgs4txIfeKXFu2fSu67dKbHvhWOaTV2xDaBhVvWYes740G?=
 =?us-ascii?Q?3qMYxQ8kmXkLgKbcSYZ5X4sC0z6SyNtKBOjxahK8h+q8XxNOfAnu2wYUpyNO?=
 =?us-ascii?Q?Pc05IBePyVnOiMxP0Hkx2a7Amx49aledtHoi788IwkdCM+M5TMgEILEgF9o3?=
 =?us-ascii?Q?mydKsF+4YtrbtpB1BE1fDMjCbNkCzPhrphW2MxgaCIRZZoaFHAa23Ma7PpnJ?=
 =?us-ascii?Q?gXfLfxuwjbX9I5qw7scnq25X5OuUojGxEwKHY3XYpkhReOzga0/Fgw7Ktm9S?=
 =?us-ascii?Q?0aH5enbSAiT2h1HIiNMVxQJG3Bx60v/BoWyMPsMd18TX4x7dXBd5pxOBhzrh?=
 =?us-ascii?Q?kAEljCv7t+fBolRmqzCQcguLLFYeVnNeaP80aYcm68sakiGb6jvbkH0M0syD?=
 =?us-ascii?Q?REpqVs+9qoSKodab6ahp/DwfGXHYG/lY6eDPvllgqh8Yv2Xbygd2nqQAGyUQ?=
 =?us-ascii?Q?VWYlj40r8U3sB9sIZk9B4dafOg7MjgTN07AEkEPEAf+sPhP4foVEBuqPYdcA?=
 =?us-ascii?Q?/zeaNCdRnfVBFAqmr8GPYhC40gpGj1sg3UXwdwtjGLOOyDwn6gBxNpRm/Oi+?=
 =?us-ascii?Q?CzH+SAe2w+vGuoccjsUpTZfos+C+bmNnL0KRJwPsMcMzo3/SRts30CU+1mlx?=
 =?us-ascii?Q?4ofCp8djeiC72gD2yRkfckHyQT4wDSalDcFzOziOhWTP9PBpyoPf4vxtTV4C?=
 =?us-ascii?Q?H+cRL1f8APVuQZpwP5jwRThaHqbdmYqwCt9ad2taA9utKP60EhInGQ/S7DTZ?=
 =?us-ascii?Q?HBye0sdvdLUVC+PPK6malIed+W8q8VL108iKU3vQj3zvXmdVaj/y7ZhREYni?=
 =?us-ascii?Q?wJSCIgVQ35nj12AQ3cBIDp/0g+lwkatvnXGGRxkTYdUspeT13L5sZjZNVroM?=
 =?us-ascii?Q?WM7n+2D4KdgNP941oTWhYNHlMOY5bAjbnUVJiwdhwuout6HvqEtEdBCkggdy?=
 =?us-ascii?Q?TC0BhLHswzMxQMSc8MrPiScs6kx9dUJ1kbHJETRt8/7g/+TH4N46Mo4J7yd5?=
 =?us-ascii?Q?qU49pET7JHf/vR8zib6pywLgRbSGsG7ahqjrzoZAYI7Ub0t7SBsS22LDwwEn?=
 =?us-ascii?Q?LPn5YPdcXCkr5jIupOM2AKmv89fpkjwoDt8tpCcRwt6ytdqrCAYHAWZ39TBz?=
 =?us-ascii?Q?gdc=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f0d425-68f9-4d9f-8af0-08dc4ecbca24
X-MS-Exchange-CrossTenant-AuthSource: PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 02:07:15.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0871

Hi everyone,

This patch add support for the Wii U / Nintendo Switch GameCube adapter
This is also my first contribution to the linux kernel

I tried as my best to make it based on github.com/ToadKing/wii-u-gc-adapter and
Dolphin Emulator project as well as the xpad driver.

There still an issue with it as the device report itself as an usb-hid device
the usb-hid generic driver take the priority rather than this module if usb-hid
is compiled directly into the kernel and this module as an external module.
How can I fix this problem ? The module function properly if bind manually or
if the usb-hid module is not enabled.

Also I'm not really good with parallel programming I tried my best to make sure
than there is no race condition but would be grateful if some can check too.

Thank you for your time reading my contribution
Robin

Milas Robin (1):
  Input: add gamecube adapter support

 drivers/input/joystick/Kconfig            |  20 +
 drivers/input/joystick/Makefile           |   1 +
 drivers/input/joystick/gamecube-adapter.c | 607 ++++++++++++++++++++++
 3 files changed, 628 insertions(+)
 create mode 100644 drivers/input/joystick/gamecube-adapter.c

-- 
2.44.0


