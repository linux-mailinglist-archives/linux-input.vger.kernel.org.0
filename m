Return-Path: <linux-input+bounces-5624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A05955B0B
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 07:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63C0281F1C
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 05:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D101B674;
	Sun, 18 Aug 2024 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="dVwuw0Fz"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2100.outbound.protection.outlook.com [40.107.96.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45494B66E;
	Sun, 18 Aug 2024 05:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723960054; cv=fail; b=ledFu5HlZWjB3os/qSzOuFvedzeMtb4+pRidN/z1iFDAhUNibbjFEZ0iWMlSU61SU0Q5akCjrDNwDhbC7KdDttvghfhUTKChEho1wT9nqnmw6v5zvHDb8dCzHA3ion38dX4lrBf2MPL1neZVXftteuymU56VMxANr4TYiwSvdwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723960054; c=relaxed/simple;
	bh=Yf0dW6KKGdzNbFP2yvW64wlbSO3MPy9kXfB7p3ExFFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BnLKVjZPdtffcMJ3wAOCUdwMYSyPHP5VQ7XCf8+qr42CBJpnLI3X0A3fZ01PyJ88G1UsG635GInwYYWWw/ceYwoZ9IwuQjdkIf4jDK+OUggiOgtDbNdyTpTRodjbiLz2CmZjU5f4DHZ+rPSoahkrg57k2Pfmh9iuav3REkDvgwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=dVwuw0Fz; arc=fail smtp.client-ip=40.107.96.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVoSwAfL1MHHYcLvoQvQ2ePB+xygW4dX4UkqLLKSMHlvqOQ7Zn3ajA6Qn3c6o4og4+/7DZq1FJFlXQR5UCjEEVYcQ6YFtlG+gFRKWDM+xCZA7+w7MbKI2CAYMDPIRufGW3tFIn9OrLOFmqOKs8YSduHNvDsfERMBVTBkfc263klBXdcSCCNb3ScBrANQ9J7IDDLjgStgDr7foWwU2wjsnv+QiYvZMxH7IYklC2LHwKlm22wAw8eaDhlysu/yMzR/lWVOdawa//Wp6jU4xWAi1MWWAk117YWoGVAMFnRZN/yOh/CmUNCb4b3d5IMqmGAyMzMUd/5iDfb7eKZDffeOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvf1zynoDvD/ICh29T3e58pSe3KRfSXNFEagk24VSN8=;
 b=BzsbF4qySdUfMIcmYJbC3FE6SzHejlu5cnunX8iwKfFWSoiu5CTyzF33jF9mCjA5YHJK90sJSTEuPP8y1dHFFQDqJ00RBQ4ZDRGj9NkiTxzvrOkdjmJXeXc4T1K/BzB4a/Wy6r5NXy4QrU1Fjeyr/4JxxOTfsi9LvBmw6isR3kFhcMdTublIKnSjx5KiFA4QNtlocObv7oFXILJx+CgIp8eZr5NlaOnzk3PiD7Tng8lgmJKfSiKbZ5HVO3wxhViOluZiFW4HCKc+/Sk/lLkqWqQswkxfO3bZuuCjR8OClAVd12BvwPuiIZxtfDeh2PDAU/Zy54TBW27iXIrI7EMx8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvf1zynoDvD/ICh29T3e58pSe3KRfSXNFEagk24VSN8=;
 b=dVwuw0FzLlzu0kVt28mpjCG4w5T+xpFPrLjHMdWt8tR+jm+1hMgD1n38wXNhjqEpyYPC1FIUeKA6jjLPRL+urHJPRHuGWiZpShczHZPy4h/uZpYOSrn/Uc/Z85tYSGTRwHfljEmSiQccbXQGti1ktwUbeGYiXCGF80m24SvM1Fw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by PH0PR08MB7164.namprd08.prod.outlook.com (2603:10b6:510:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Sun, 18 Aug
 2024 05:47:27 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 05:47:27 +0000
Date: Sun, 18 Aug 2024 00:47:20 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [PATCH] Input: evdev - limit amount of data for writes
Message-ID: <ZsGK6MGtuPggHfuG@nixie71>
References: <Zr5L8TUzkJcB9HcF@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr5L8TUzkJcB9HcF@google.com>
X-ClientProxiedBy: SA0PR12CA0011.namprd12.prod.outlook.com
 (2603:10b6:806:6f::16) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|PH0PR08MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0cb9c8-72d2-4718-04b3-08dcbf493beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UpSLZPRB8Ul7lfS1jByiQaVNEKvf74v2unu7snFG7WPOGkuv5F/rI96FDNKY?=
 =?us-ascii?Q?MUBb+Fe5F6QrmRB5JP5wb6Ki8Gy7qjum+UYeaKW1iEHszbdOGKHzsbZYe3BB?=
 =?us-ascii?Q?zBSWn7qDeE0ODl0ZJgVt92+X7LRwbWfi7azcWYX9v97flEGuD15y1jxfv98q?=
 =?us-ascii?Q?rA5QnWgKkEaD4zO5uC532b4McWAXNUxM3+jfm/rlS4+o7z6eVnYn8GX5WmSg?=
 =?us-ascii?Q?I2y0gkYomheIbh2VxM4Zu+AwxlRsjF1pg+3SkvNhk7GEEDOfo9itSP6IAuSR?=
 =?us-ascii?Q?qyhn0N50dTILcuI7rYqcLtg6UdOLHWucdcc7XtuCDb+4x2CEL9JZOuJmIE+B?=
 =?us-ascii?Q?YQdUW/X21AsKQ4jxZeTieaHgBQqb/57Bu8r/Zi0C/lPDBd+ID5425hALU0pN?=
 =?us-ascii?Q?ISwcd0+S/XFqnNq+WU/3IwFtGMPg/GIA02zRPKlLBV1wbx7cw82GUcffUF2D?=
 =?us-ascii?Q?1c3IcRcAZ4NIG/Iee2jx0TW8LT1wYxI2hqMz2YktHYsgVkR8MJFekeg448oA?=
 =?us-ascii?Q?dPqUS7wEXp57OQh1knImLvdyuNE+sJXDsCNEyS0SXeCGbTqYcsPlvSqxsVZp?=
 =?us-ascii?Q?STzdWWSwXYH/GOiOYrG0akEq/6MjvD5eRJGNNHsfvSg1LlMLqXS452ykNsKT?=
 =?us-ascii?Q?ClP3YKqMFgOyq3Lrv2vLNZrHyldZzRxHXkHLS/0T9piC/EiPWjhvKTtP9pNJ?=
 =?us-ascii?Q?uS+TZppDfQD3xDXIV9X1U54B/vFHOs98MFH1J/KZgp4e3EKS95ahtKeq0GJT?=
 =?us-ascii?Q?5sniHRsw5/P0dSJEZaJ+u10UwwFekhXbrZSmv/UhkdchhVyb3odoW1JIwg4y?=
 =?us-ascii?Q?n+boKcKfKbPOsC7+lgBN7hN1ulqSM42hekgRYzbil3jGPiuALzCJNwa6ZsSa?=
 =?us-ascii?Q?vE+irs7n7xYMnFmSZ0x7sNqK7T3ZAiQrLGbUILNe/4uN6k417X7MC9xfYxrx?=
 =?us-ascii?Q?rWZ0u/Ji7K3zX7snv42FoivrF9TfQUirbsuhSSKFi7wSLgPdgN2PC3fGqKN7?=
 =?us-ascii?Q?Kqac7QRZ9FZZG81rytpfft28spguHDndLzlvdqnJCb/OK6bb+JyrOk3OQKx7?=
 =?us-ascii?Q?SCzGIeG3pL7I0GK46cV81pqBHSddknSGBuX7nr/b0W7+ZGbWeA4MpnvubNaA?=
 =?us-ascii?Q?5I2OsD8636ltKVFiMCYBXI2ktiZgfaLIXCJ033z6eKcxCFsTGYEwTGxxa4PC?=
 =?us-ascii?Q?8952kPuiow4jA4lAL8Gj8COpB/Lo9Hxo/GMCmj8DLcHtply8/8juUmw4ALvw?=
 =?us-ascii?Q?sxKPIwja6tCQqbk3NcK0uwQOooWL7ToEOf+AvsSE0DxXom7iGNzTPSIHvLiO?=
 =?us-ascii?Q?HzlGsc0mw/cheXMBbPouj0T0/H2Yld2Xac0jFMFSyhSXFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6mBb4/iuC0fdFhL9tw09XYFkyqp3sb1uhjQN2YXG8WoKsmsbtSEfqVy8JeSy?=
 =?us-ascii?Q?abDUpJvjCpyQ2cMDllU1eUPWIAi0uo+kybH7EaNTni0K4UARFAcqrQ6mjMRP?=
 =?us-ascii?Q?K0NZJuYy3bC2QnxD0zpqyPRuKftM35jz2rSRxDOArHx58H+Nju1YMWieO9JP?=
 =?us-ascii?Q?Ie3kwVg3470VHS7ChJYxNVnbB2tknFRJlOJXw1L1hV17GuDcjubrS/lsSZxB?=
 =?us-ascii?Q?9IWtf8Pw8lQqVGYU8o/xTliQ4FQcKTfZ5khTQYeQEGw2KJaCLOhjyuzbf536?=
 =?us-ascii?Q?YfrqXcehZLZ4wdGMIFW6uYH2vxgbRn+Y9VFCuNDluvPK9qrRPPWo5/hwxWrJ?=
 =?us-ascii?Q?ALBcjkyjzK8LSSh4qbsW5L/LkJOC/rxaYo0YxW9sLFNJCHcU7csdE//Tia7O?=
 =?us-ascii?Q?w8PUrAQ5wOAouQFZ0z1XMMSYP/TEyRRvOD4to79ye+n60OcmSc01dxOjqUU9?=
 =?us-ascii?Q?rhD9R4Xt0ZrNw4BO5Qt/9GivyHHnUX2X5y4F7zoJ3qbZE2yMMaoq5txZJkBh?=
 =?us-ascii?Q?8wwyokRt8I+ZHSN2joPEKF1FjyLw+S5sBzLxixT8QUL7A4U3BYznZcKcQlcb?=
 =?us-ascii?Q?zBxA/lu+ml46tH0jMeo1o+dR3yQacLREsWUcS3tSNMU83DKJimcCzMkjEbzt?=
 =?us-ascii?Q?xCrjK85xAH7JT4a5CGtW7yHEM73Zp48pfiKRKFS6yIohacDdwlyf++xn7I4z?=
 =?us-ascii?Q?PknQAicFyB4ITBYrmbSoFjz0cmNydStAOl3GaZuG1Ut8XJYFTpVrZ8XvSFQs?=
 =?us-ascii?Q?bzCCTjhYlOe+pfpYv/I3QUvfYg2wKSIR4jbGixJ6ITb2whpsUz58StCxQud2?=
 =?us-ascii?Q?l/ybdbfscgC2nb7r7OGk/umf0TjejsDIutgH58iwadXLyPyaroYdF3QJs+o0?=
 =?us-ascii?Q?jiWjc5NpkkFFdPZRYfGx349I/mNqV+Z1n/9O6p2Z2tfBIhvYlktFgGrE+qNx?=
 =?us-ascii?Q?VI6fMPDUXUQxb+HlvD/PrafFBGRW9TzH/sf19MMFVH6dd8C6O9C7uzg3Tr8b?=
 =?us-ascii?Q?JswglgaKnFI6e5fyl+NHsxrbndO7QfWe2jWTcCm4ZYoqSsACTG9bGADj4+dH?=
 =?us-ascii?Q?rZaPTexfHwybfs/i/YkMDxf1/lhgR7bRB8lzB9F0mjZhk6ZhtlUmJC+jQL3e?=
 =?us-ascii?Q?uS2+iC8xflAQfY3MYOlK3w4Ty7GoOSO/ex2o7R+EwR9yeMjfN/Bpl7uJ5uRL?=
 =?us-ascii?Q?ZDIu+yLRL++mee0/0tMtVDD6SKK1xyGlJmdowWdCpWch8p1A0iwVyCeKGQTu?=
 =?us-ascii?Q?hQfLIVRS37FnOpQDtZV2MqVe1n6TEK9tBAxCz4RKV7Tr9IzmgklzlC3koy4r?=
 =?us-ascii?Q?OxnSInB24WCBnJbynXaeUqYOqvJDFCoA2fjbRoBdkPch1sBS3aYrQRpnxjmd?=
 =?us-ascii?Q?efNNpkz0W0r7aXef1HoT+0Pu9dHDQbX4WPLyKoo5F63Jslhzr82lXZD86D85?=
 =?us-ascii?Q?Vfrneavdfd3m8/ys4uXXn6PjwPKYGXXurkIMxxm5JMJEMJLwkA1IbBoaCn6l?=
 =?us-ascii?Q?NsTMcRGoumifqdM3DnoT/5m0v82IJ+FYtmDnyu0CZLYmuetiQGjGGQEUKwRr?=
 =?us-ascii?Q?uu4l2xDMR0hqn61XT3ElBNfQ7gzRNGiI6djjNyCp?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0cb9c8-72d2-4718-04b3-08dcbf493beb
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2024 05:47:27.2349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqR5t7oUSbFY1tQc14a0soUj4RlPWeulYWpPp8ufD1AslQE8D6GO7a10Om5QPYkcocAnYbVPL23chTbNmMlltw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7164

Hi Dmitry,

On Thu, Aug 15, 2024 at 11:41:53AM -0700, Dmitry Torokhov wrote:
> Limit amount of data that can be written into an evdev instance at
> a given time to 4096 bytes (170 input events) to avoid holding
> evdev->mutex for too long and starving other users.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/evdev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index a8ce3d140722..eb4906552ac8 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -498,6 +498,13 @@ static ssize_t evdev_write(struct file *file, const char __user *buffer,
>  	struct input_event event;
>  	int retval = 0;
>  
> +	/*
> +	 * Limit amount of data we inject into the input subsystem so that
> +	 * we do not hold evdev->mutex for too long. 4096 bytes corresponds
> +	 * to 170 input events.
> +	 */
> +	count = min(count, 4096);
> +
>  	if (count != 0 && count < input_event_size())
>  		return -EINVAL;
>  
> -- 
> 2.46.0.184.g6999bdac58-goog
> 
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy

