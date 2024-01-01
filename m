Return-Path: <linux-input+bounces-1064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED619821530
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 21:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DBA2B21060
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 20:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D4BDDC4;
	Mon,  1 Jan 2024 20:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="KOTzKeUF"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845BDDA3;
	Mon,  1 Jan 2024 20:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tg2He895m54aXB2gwW40CgUqrXQSfWZvaRqYhXPKk7H9M4QN9wsLhvMuaCR+d3Kw0YAhglSiWo8FOtShVeIxW5Jiph8AJtdUsvwiGhZtFJWnXkTUEZvTcGlU/wQhGWoQAGozNvt+oNHbY7SFMqXDGI/wjkZxjQ62fuy8vqRZsuPyJUXFAqTjFNK8XTEesSo6GLSzyQ1KE9uWZb+0rfoz9CLjiN+tlWi7dprvmPNnauxwKSwwY3MjAcKUTRW9dxbYpZWaE+753uZJ4sZbb3nqugEZOvrMoMNHTnrVW3YJPb4j3nPhCVV5vZ4vKSl+xohRUcTjbUjEH9DZrAtzCiZnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KPQumZCveqfA3Mrm3m/88qTA8UYTGgDAGQ5xZZ+ZuY=;
 b=IPiuPF6KE3q6TKZ+nhsJshXOzzxrVVLU+DF7CKaTd6h1Qp0OXOS+xTXiLeY+QpkqhYO2du0/YZxIQ620PSgbVeC9ZVKWHHfxQjCkNEjRc258I7uxe5FX3Ddxe49GmSMLC2wy7knMPWxGzkjYylt9RBXIUHOcZkFhogf+u+O0V9OW2BgsC0PE9+wtY0GTJfRuZo0SyXG0tNsfRdGC/DJe8t2V/wZEhdxK4juCu+Ydx8XMu8ZzLOVAZF9lbME0xLykPXKnhBSNumOX37u44w53dWwa20dFEtqtcSXO3imsNeJXTHwtWA0Igdu50IvNjCsOS6tFjT3FbtHeHibxz4aBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KPQumZCveqfA3Mrm3m/88qTA8UYTGgDAGQ5xZZ+ZuY=;
 b=KOTzKeUFJy7idq0anuo//MfG6X9lL7MZMF9rtzyVnuweEQTu3u+H4k5UHbvfcFLApgAwPNQrpPzv/4MHcOsqu/ugfL6rbD0QFrMbzTR3/XfPV0iQeqkV2x28xjhKdmF13GVIJg6h+7ei+ZYJ6f2UR8ROgEuRnR343zfPxOBymvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BY5PR08MB6423.namprd08.prod.outlook.com
 (2603:10b6:a03:1e3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.12; Mon, 1 Jan
 2024 20:00:21 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da%4]) with mapi id 15.20.7159.010; Mon, 1 Jan 2024
 20:00:20 +0000
Date: Mon, 1 Jan 2024 14:00:13 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	jeff@labundy.com
Subject: [PATCH v3 0/4] Add support for slider gestures and OTP variants
Message-ID: <ZZMZzeX77VeHdIeL@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BY5PR08MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 0797b7ee-ccda-4263-55ca-08dc0b04488d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gGnAa8Y1GkvR07BAZPZfqcakVXoIJELKkoUkmL0fgcAT4b612svTGtA5Pm6IKBDiyjOWMoeIIDanI+J/c+vGCeQAvbmmcMV4CXEKTdNktf45UTjZtwXZxUDAaxIzFjQIJLa7yS/QlWa3NVKPvXzsrZjQ4lnwLzx+ZvUjC30SOr6IAaQsjUsB8OlKARgV4GKAvc5B4+qAWOHAnLiVB3JLuIfPuIaXND/9wevqRNUVuMmz1POLeuTa5YEoRCrRMt6YKz9HfWgfnLu0uI0/X9rRAhCndP9ygiiAoOJW6QLaMG0aNw8tfcljzaOp46akz8wsOwe2kMAsBuBf8d3y4QD5Zq8zS6/k944TeZzqrcL7VgBTY9PugMlnPCEQcEhhvN8XtMRXGe+a0smatEM32rA3JQCUmL/He6dvEPF56XLPahBinMKoICAGJyPhIO6sTXdXYdrus1q+1fNyGUfFrFB20ssf3964atEY5tVUCFIvdsnNz0M3VeqapZBA/8Ro8h3cYAZZIAh7oxN/L2YvP++SstvYvguXWBWQxSme1qSzjqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39830400003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(5660300002)(66899024)(41300700001)(33716001)(83380400001)(107886003)(26005)(966005)(478600001)(6666004)(6486002)(6506007)(6512007)(9686003)(38100700002)(86362001)(66946007)(66476007)(66556008)(316002)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9kMUx6Jzf/j5Yau9ltmjImjZb8ac4N/N531/bg4PAgB79pSJWG2YogjM0xHm?=
 =?us-ascii?Q?qBmXTKHQsptUdKv2prOGQ1Plt/XMAR26RWhG0ToQ8syRXfyNp0QQhqZdU1j7?=
 =?us-ascii?Q?AW7c7Rj4/YCLd7Fmy+ezr+vstAOsQMoMDG4cLdMdDypujodKkiOYOb4Qg26W?=
 =?us-ascii?Q?lXbRcfPF7ZdCZ8ZdkJiaxvqT3nEDyWxfKxO/d29LQ1/9JgDTZf8xoq6pnPV0?=
 =?us-ascii?Q?CWNnZQwvBRacy2t4lpRd08NcgUy82mbMfNGtYM3sewZfEqmitIPvw5nAmMTE?=
 =?us-ascii?Q?MnBv3ZZcCe0SwnyJMk8Fk514Nc01r5Pnvoz07xM3YveMWwWSRJfUGRwnw0s5?=
 =?us-ascii?Q?G88sWg58LBKFlGPZ8HgtLRtrv9ZCI2AN2tcDzd3Wxf5yAY1xGCdzq+YL6kLK?=
 =?us-ascii?Q?HKChd2H7W4dne8vJVpq+mj0VNP1JLrQNooW0+AZhCqfN3y0HVvWEaRAuGwZ9?=
 =?us-ascii?Q?8fnGEn3nkaHrecCscLGwn5Qj3F9abircSY1NFQ+TKuGt7fyevZWTa2vEIInA?=
 =?us-ascii?Q?Mq8CgbEXiIQ7FLFG/Bi4bsaavUBFLxzJnG1Nc0j1WxFxpAYPTTNliu+z6xr6?=
 =?us-ascii?Q?7if/T9Rxaq+mSQHta+kbYZS+LuUYawhrICtY+s2JBYzDfrpizHGMD3X+n/Up?=
 =?us-ascii?Q?JJL61q/VAydsPxFg4e7poXmzAgXRdnACdOJY6dcfcZDxdNMBqk/tIbLekkw7?=
 =?us-ascii?Q?vxJdf4YIf0VZeVbeIkSvvC+xfb5qHkPx/0G4wUCUF2flTikWD3md0SMeV8oM?=
 =?us-ascii?Q?s7y3VGYTNT+x8yC4N8mGnZuQXa0chCoJ9hf/UObV2PxWOC0T7yqOH1vMYmUI?=
 =?us-ascii?Q?JQ4Nd+5Ert3GA4m/Kfb7S/5a8cbpqZhGgtHxawf9JKP3gIMtkjlr6yiXEg3K?=
 =?us-ascii?Q?mjTJ9nWwy0jhd8y02ZqJf3hsw9fUiwZRvB0FzqrVzYHEG/y98StBcfD/xNt7?=
 =?us-ascii?Q?yBdGd7Pc+4xeuU3k6cUb/0E+VGAqbxK5nATaLm2xo4Hu972wT8KOfd6LVfR5?=
 =?us-ascii?Q?AVFsQ15zGxOzFzcvTYpy6Yzr+7aqKtKJeeoySPxaxZavt4CUk263zOq+Hjm8?=
 =?us-ascii?Q?XcyzaUck8hZJjMsIclDqq5ujAsIY1J+K1EWwklQcl6uExQ7YvhA/BpyU78Dx?=
 =?us-ascii?Q?1Ixe5hwWcYOfBF/eKWSC4vyloFeYljgRRdYnLGARhN5tqDBrbzKBCLXxjvkm?=
 =?us-ascii?Q?X2sZhu2jgZzgMwcvayW/VQ86mBL9h5a2AO3Nk+PQTxxYEQm6nVPRKCF9W3qa?=
 =?us-ascii?Q?eatYGgsH2ht8wpuo/8UxZslnTCcnia5VBdw9JJCImp58zEYKHRSrdcVXWT4B?=
 =?us-ascii?Q?pL5xNFZwAXngjytaJWDqSCtPk8cnA5uR3PWrjXSv6BFNxnNVQLRw0Huee/sV?=
 =?us-ascii?Q?1LQSMoWKbIRFbWcUpk/8Kp5nDun9ntqaGxA+LkRaixh/XgbbmoxWsJwRJlwc?=
 =?us-ascii?Q?qVeQSmB/GRGACKm23/DN/RYqx8/leyqCKft2E4sLchXr4z1Mylq9GIB/zZtL?=
 =?us-ascii?Q?e9qG2gW6qB0QBkLMbw/pP++kNrWvb4Pr9CO+sd5HDHHyNRSy8KOdQzZITQ6X?=
 =?us-ascii?Q?Ehu5r++TaTM3+7lHkZ0acTvHyz1u1rZOpvmnQLdS?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0797b7ee-ccda-4263-55ca-08dc0b04488d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 20:00:20.6585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTHPm8t0ySYzS/sgSdNUVelmKtABYDE0unU3dzaiK8EXUfcwP/hjdX0r6CaX3setNxv/Krb6YBp4CuGYLxWI6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6423

This series introduces support for some additional features offered by the
Azoteq IQS269A capacitive touch controller.

Patches 1 and 2 add support for slider gestures (e.g. tap or swipe). Gestures
are recognized by the hardware itself based on touch activity across the chan-
nels associated with the slider. This feature is useful for lightweight systems
that do not post-process absolute coordinates to determine gestures expressed
by the user.

Gestures are presented to user space as keycodes. An example use-case is an
array of multimedia keys as seen in the following demo:

https://youtu.be/k_vMRQiHLgA

Patches 3 and 4 add support for the device's available OTP variants, which
trade features or exhibit errata that require workarounds.

Jeff LaBundy (4):
  dt-bindings: input: iqs269a: Add bindings for slider gestures
  Input: iqs269a - add support for slider gestures
  dt-bindings: input: iqs269a: Add bindings for OTP variants
  Input: iqs269a - add support for OTP variants

 .../devicetree/bindings/input/iqs269a.yaml    |  98 +++++-
 drivers/input/misc/iqs269a.c                  | 312 ++++++++++++++++--
 2 files changed, 377 insertions(+), 33 deletions(-)

-- 
2.34.1


