Return-Path: <linux-input+bounces-4153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E48FDD1E
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 05:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4969F285495
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 03:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A0B18E29;
	Thu,  6 Jun 2024 03:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="fglMZXQO"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2102.outbound.protection.outlook.com [40.107.93.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7311DFD1;
	Thu,  6 Jun 2024 03:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717643071; cv=fail; b=FOS8j3LaDF385bUks8WTlb1IkMMZYcgmvTUzE9y4Tnt+nKygpXitbbjp+NhcUZjzhoRVptwngKq9//kgDnhU6GQoCSpbmGFD7SQT/L6LwT7uR8T0hLBcUOMGuhNG61D73nZDUrKBtLBRqXFzAPUscZl/4c73b+J42o2YqTfN3Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717643071; c=relaxed/simple;
	bh=nXzJ4KOlUJ3CDU1n8P7jhVQqtSz5ihtNB+2Ocmocstg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ty4Gtnf8tTy/c9HF4+l3yH8PkcdnZGbPrJEmlN3cmHuCnPsB760HxB+oXxTCCwrSuvHl3n/XbjqKq8FVbkJLOnl1XnV8jbLzEMheQ/R4nRL/JF3A6m+0A2wLhEVyPn4e9xFaYPiDPLdSz+jEkKCicDajL9dLvVHh6Us8t5V16Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=fglMZXQO; arc=fail smtp.client-ip=40.107.93.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtC/N6uGBja+iMP/7ConU4nr7ljFV842iSGH98OSusr+dky2MWH4HkZR4av+wJMW7h4psjpllxOp78ESPcQvzhscwSEapQGC7xXOh32R6zNLhezpivVv4f7MEMRUVs3m3CA5wIJPew8WuioZmub7sL9iipLl0ta9ZqnS7PBnYVM62FdYt03hyitLVQZYezVUYhDjIclfbLybzR944n9MzZ4IqOpXrNhHhje9keLCMdX8oU4NDRe3XAYK0ZlvPSDjAE1JzxVrbj5D5v5qUL/cPHfpyN+ObVmnN9RcRj7tr2FDWIy34JLUjtRC6tEP5zxnvZxjYcXyoDQNNNyXN0EJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ2maVuF2C9d4HcH8OITICnyo6T9KuAgZFlkkpe+ZIA=;
 b=K9GVqvU16AipntFbRwltZ2WkbW95mJvF4nxpTdyyvlyRPmm+K17NakpDktD087qg4aBM/xFUpeOVqSB+KnYp80yQu5adwuR/igMSW4gBj6PGKsp4HRqP9IDJl94SiRis9rFfCwfjGqzgfGFjiXkPxx8+pDzpWU2GBLJPz7vsIJvQwHJr+AWzKm0B8BYqCmzRoMBpd943P4uECmTE6fDd/yIa1AS3cPfKD6nobwcVCi6qkYh4SvYvHlfo/Lq/h08wItx9+56FsQGg7K+gcr1eUWylah6tOlbk99xvSHPoiaQRVHcHLBvrDit4ZwEnargsqkdBYVpjBhSU9JqTtl6XMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ2maVuF2C9d4HcH8OITICnyo6T9KuAgZFlkkpe+ZIA=;
 b=fglMZXQOdL6EwXehrlNPnp5FAKiE0CYOMRhkxOUvwobXNJQZNb30dvI6PEVyQGUKcrjVQUFvLzTSD5TR4pHIrpuZn0njaKVpszjYPjp+y7NQYPBeA9Wv39a/2xMy1H3XPXz9WsUZiiU1w/9S6jdZbzdjft+ahB5/HGVY+J8jIsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by BN8PR08MB6289.namprd08.prod.outlook.com (2603:10b6:408:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 03:04:27 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 03:04:27 +0000
Date: Wed, 5 Jun 2024 22:04:16 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: wangshuaijie@awinic.com
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	liweilei@awinic.com, kangjiajun@awinic.com
Subject: Re: [PATCH V2 0/5] Add support for Awinic SAR sensor.
Message-ID: <ZmEnMPhKzqkJssQE@nixie71>
References: <20240605091143.163789-1-wangshuaijie@awinic.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605091143.163789-1-wangshuaijie@awinic.com>
X-ClientProxiedBy: DM6PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:5:80::28) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|BN8PR08MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f06f197-7907-4d15-7332-08dc85d56032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fz5ARuZ+Mcc81adV/7Kyn8sBV3Q/NMEbxHgEqmq9rMOg3srfHn5vEY4KDbmw?=
 =?us-ascii?Q?qQ2GpElL7eWR6BaB6Vs1K80wp5dliefKmXlUg40BEf/k3fbkyn3GwyGvpCGE?=
 =?us-ascii?Q?V+iqKaDhHzng3ND7grMloqwfOYrTXyFxBa+tWRQIOt0dzsaRjYkX8SwTkyuu?=
 =?us-ascii?Q?4Y5gQFrCStLAW+s6bzhJsdDQFBQ8ms5bxATYR3oAvsbpjX/KJ66zEhtWkHi4?=
 =?us-ascii?Q?0Md2w6Z6xN2joiEUAsQKcIZjsDnWcY8SAvQ5m4dJEorIiUF/0CqISGl2lXq8?=
 =?us-ascii?Q?tkHfiiVoJZA3fpu+1fxMKAFdksXGhL3M+8hV0znmYKCqD71XD43DuKm9FJfo?=
 =?us-ascii?Q?OQzzWWai8m2zAyDO4Bmc+0YGT3CJh7McMXpiC3bBBowsCiNr29jOQaKGY7Gd?=
 =?us-ascii?Q?s1WGP4OxpcFW2kKWeVGs1K/Tbp7rCThtCIA3cbzLte5WKUflmAfiDfzdbSzj?=
 =?us-ascii?Q?4rvEbp6/h612fl3nkvDTFqHxYj8mZS2Y3xP+GnyXhhAf9WmUlX6mYbxs2Id7?=
 =?us-ascii?Q?t5AmWhjISDmJ8iMEZkWnkOGg5hR9k1OzfeWUbwe/1XgjRy3pxWbrO6etg+pi?=
 =?us-ascii?Q?ReO3c3SJ6O5JeCVhxMK+CT5oO0DPtc2KBCOvc8iT6vvWSjrAUIWOcAQrnJbd?=
 =?us-ascii?Q?H6S7D2xXz9tDm3t3E52x9aJ4c0hY0rM1HGq8L/ttOL1PXcEdn1RSFiYp4WQF?=
 =?us-ascii?Q?IaZ22Tq+ytCO0BXwT3ZM/3TT4VgIp56KXbBkgE/GVlxzYcD0D23dyY6CfCdQ?=
 =?us-ascii?Q?84/Li/XiwXyvyPwE5MUwQoUI/uuJoeyZioGP/2gD8m0TPyCPiVCy3FanOIX2?=
 =?us-ascii?Q?KAqItb6CC7oShJpgpVWuKRsVm70UlvfoDNCeFXRW+I+Mf0ECeUD+4shkE5Vp?=
 =?us-ascii?Q?uF51+QqwsyOeGZ6cvfX6GUFWmgmflE8xmHDOypv4nymuOe2Vll/o2yKQIpKF?=
 =?us-ascii?Q?GndHNDqnPHyvRf/swHivyDbknVNGOxs3E/3bTrVX58ilFVDHbiDTxnoYpmZ+?=
 =?us-ascii?Q?uHDCRxg44uPgAwPFhoCzeSsIzx5KSYteZDlrm9EBdPAorutaxrcvlwk+ocGH?=
 =?us-ascii?Q?tNeH/82eqLs0LQZokSg55hYnacs49vgHZldpRTg2lfPxBLwtE0fIaO0lA92N?=
 =?us-ascii?Q?DFaxJtxm9HHmKZODgXQczW6OhPQzG0B+ipWV599BOmMtVgI/btsMIgQm90JG?=
 =?us-ascii?Q?EbnV5p4/2vBAmgJ79Xiq+MyH7qiL62UPbiHZZaDgEjElKmdAKsaDRKrLZnnZ?=
 =?us-ascii?Q?D7mhwNtPcxPQgYLVP6XWb1lJkkk4KnoSikUrBuaQAg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xQaJU0f/7P6F+4OtSwrLoODQOG2DVakqvYeFAo0Bvgyvd0+VQ8ehUptsvKfC?=
 =?us-ascii?Q?FZ5P/RmuIREnKLz58bImVnuPzECEmXZGC81f+bcuD/YC8/OzlU4YnBPeq1ML?=
 =?us-ascii?Q?WNcfL7rLdXP0q+Gy7QzA+XZPlAF7kg5hgtP4wp0hzkhBFFiAXUKkOXzYpeMG?=
 =?us-ascii?Q?Fq8SIarM/CpdFn9KJOVbUg3eHfljKLOF9oPDbUu+QNIx/i3Aj0LPaW4CKUKu?=
 =?us-ascii?Q?rIGWKa3h/8r5EhRXugiop+uxzcZJhICv+FQmuYkHKJlQULT33gBJLb68rhEF?=
 =?us-ascii?Q?3a1WqBavhlHD+MeLf1KoB0q+KHIC/QYqVwBkuFXR/HWPGxzWRP8DRKAFAsW3?=
 =?us-ascii?Q?oeOrr+L0c+lpRJzJKg6hE+NSGGN+qgQmpye9FniTcIdDLpoPA2gLR+BSLjcf?=
 =?us-ascii?Q?DAqYpKT1fU/iVKRuyg85COLTEzYA3KlGdTiFXJbYKsGdT2WD5/jtY7Un1wyu?=
 =?us-ascii?Q?2fDaM9S5DQZyQ2HD5Ew+dSzI33HwhPJux7zMzCwUF9vVGi08OHo0iifLXSbo?=
 =?us-ascii?Q?N6UCObNP7lGm8DP2TSjEvTKzYB/eoYezXRVG3ebpx+GuwiZjBJYadIP4bfiq?=
 =?us-ascii?Q?h7ERd3hDrCaH60s/jO1ClSgj79yKfL07lNkYJsJN4EBkf35ZNQnv2YH9IkOk?=
 =?us-ascii?Q?FXYEX87z+osBUEhiLA+phlLISGx1YjjBlV3Yrx3mureF5rvMPoj1vG9i6IRe?=
 =?us-ascii?Q?4wOxVWX7EWb4rA4KvcerWBh10Sk6o4n0HSS424LI7z7xsnA926zYTeSMa3gQ?=
 =?us-ascii?Q?vQHnHtndq0Xk9g5KjFByowb7pafrOUbzmAJLeyziUt9P+bPahoV/Wqyls8G2?=
 =?us-ascii?Q?woKz4AH8HpZ8lfshCJQrclYkAByvBPofjKlCKbMXM0/9lyYihXUi/pzQVVUd?=
 =?us-ascii?Q?rWL02xkMAoWzJPmperkrBpwLWAqJkwUxbUUvJTZiIvCG6gKHWttfQT+DiYbH?=
 =?us-ascii?Q?PodVXhJMQ1oHKI/457BMV8juPOj31XSbHymp6ozNkeDIui2aniEno+4kRQMd?=
 =?us-ascii?Q?hgRdmdrTWVfifBT8wz0mZPUVgmH9LDFR22AbDJvX8QJuZZaE2rOc90GKdCkW?=
 =?us-ascii?Q?8CVI6ra35Qp0N8THa+llZQZ0V5v10/4mcJUZdtODX38hnmh7Zf76JvkDEieL?=
 =?us-ascii?Q?yc5+tisTcDTIq6qMqyQdtN2E5H+uAmcTXyrKixHODHr9S+awXOi837Tq1Mjh?=
 =?us-ascii?Q?uwTibC4yBiWMlLaydt2ZX0XfxOVU/WcZ56iiQG1RmpZGugbHRO/O61rdUTu6?=
 =?us-ascii?Q?vACZz4CiH2tFxCsz+aUEBdSUQBHsqvdXAYNG3XLykvhp53OdprHnOYFE61hn?=
 =?us-ascii?Q?PaDsAMnzZk5+qYT025yagAI+ybYZQUPP2fxro/lbrD3I2qSOZ7AJPee/13ib?=
 =?us-ascii?Q?mNC6i9r3h9cFsiH51by6ZsTmBS8kJwKkKD2dX9E7eIfcfEmVatVedkJN5+Pd?=
 =?us-ascii?Q?j6tOaJ0wDIowLCxPeJnJep3bx9JpKoJqMhe3fKesd/2DKz2Su+BS4UaapZs9?=
 =?us-ascii?Q?XUg/xB5+BoDN3Ob0ghKfnx7GtUOQ54BVz9iSE1RhAMfE2GUjHsljwOnJfpMr?=
 =?us-ascii?Q?UXE9bGN3NMxedRgYfFUXl9KuG8fXoldyRAh/mFfd?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f06f197-7907-4d15-7332-08dc85d56032
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 03:04:27.1666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUP3r9KJ4eFeE28FmH3INDvw309C/DRdqci5MC+LgIFI/2nFnlWY6byfT/hZbWXFrCsSFndjjMjnYIhOAYHpoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6289

Hi Shuaijie,

On Wed, Jun 05, 2024 at 09:11:38AM +0000, wangshuaijie@awinic.com wrote:
> From: shuaijie wang <wangshuaijie@awinic.com>
> 
> Add drivers that support Awinic SAR (Specific Absorption Rate)
> sensors to the Linux kernel.
> 
> The AW9610X series and AW963XX series are high-sensitivity
> capacitive proximity detection sensors.
> 
> This device detects human proximity and assists electronic devices
> in reducing SAR to pass SAR related certifications.
> 
> The device reduces RF power and reduces harm when detecting human proximity.
> Increase power and improve signal quality when the human body is far away.
> 
> This patch implements device initialization, registration,
> I/O operation handling and interrupt handling, and passed basic testing.

Thank you for your submission! It's always great to see new devices
introduced to the kernel. Maybe I can give some high-level feedback
first.

Unfortunately, I don't think we can review this driver in its current
form; the style and structure are simply too different from what is
expected in mainline. Many of these problems can be identified with
checkpatch [1].

To that point, I don't think this driver belongs as an input driver.
The input subsystem tends to be a catch-all for sensors in downstream
kernels, and some bespoke SOC vendor HALs tend to follow this approach,
but that does not necessarily mean input is always the best choice.

SAR devices are a special case where an argument could be made for the
driver to be an input driver, or an IIO/proximity driver. If the device
emits binary near/far events, then an input driver is a good choice;
typically the near/far event could be mapped to a switch code such as
SW_FRONT_PROXIMITY.

If the device emits continuous proximity data (in arbitrary units or
otherwise), however, IIO/proximity seems like a better choice here. This
driver seems to report proximity using ABS_DISTANCE, which is kind of an
abuse of the input subsystem, and a strong indicator that this driver
should really be an IIO/proximity driver. If you disagree, I think we
at least need some compelling reasoning in the commit message.

Regardless of this choice, this driver should really only be 2-3 patches
(not counting cover letter): one for the binding, and one for a single,
homogenous driver for each of the two devices, unless they have enough
in common that they can be supported by a single driver. Mainline tends
to avoid vendor-specific (and especially part-specific) entire directories.

I agree with Krzysztof's advice in one of the other patches; I think it
would be best to study some existing drivers in mainline to gain a
better sense of how they are organized, then use those as a model. If I
may suggest, consider referring to drivers such as [2] and its cousins
in the same directory; these are capacitive proximity sensors that can
be used as buttons, but SAR devices tend to be built upon the same principle.

[1] https://docs.kernel.org/dev-tools/checkpatch.html
[2] drivers/iio/proximity/sx9500.c

> 
> shuaijie wang (5):
>   dt-bindings: input: Add YAML to Awinic sar sensor.
>   Add universal interface for the aw_sar driver.
>   Add aw9610x series related interfaces to the aw_sar driver.
>   Add aw963xx series related interfaces to the aw_sar driver.
>   Add support for Awinic sar sensor.
> 
>  .../bindings/input/awinic,aw_sar.yaml         |  125 +
>  drivers/input/misc/Kconfig                    |    9 +
>  drivers/input/misc/Makefile                   |    1 +
>  drivers/input/misc/aw_sar/Makefile            |    2 +
>  drivers/input/misc/aw_sar/aw9610x/aw9610x.c   |  884 +++++++
>  drivers/input/misc/aw_sar/aw9610x/aw9610x.h   |  327 +++
>  drivers/input/misc/aw_sar/aw963xx/aw963xx.c   |  974 ++++++++
>  drivers/input/misc/aw_sar/aw963xx/aw963xx.h   |  753 ++++++
>  drivers/input/misc/aw_sar/aw_sar.c            | 2036 +++++++++++++++++
>  drivers/input/misc/aw_sar/aw_sar.h            |   15 +
>  .../misc/aw_sar/comm/aw_sar_chip_interface.h  |   27 +
>  .../misc/aw_sar/comm/aw_sar_comm_interface.c  |  639 ++++++
>  .../misc/aw_sar/comm/aw_sar_comm_interface.h  |  172 ++
>  drivers/input/misc/aw_sar/comm/aw_sar_type.h  |  396 ++++
>  14 files changed, 6360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
>  create mode 100644 drivers/input/misc/aw_sar/Makefile
>  create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.c
>  create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.h
>  create mode 100644 drivers/input/misc/aw_sar/aw963xx/aw963xx.c
>  create mode 100644 drivers/input/misc/aw_sar/aw963xx/aw963xx.h
>  create mode 100644 drivers/input/misc/aw_sar/aw_sar.c
>  create mode 100644 drivers/input/misc/aw_sar/aw_sar.h
>  create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_chip_interface.h
>  create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.c
>  create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.h
>  create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_type.h
> 
> 
> base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58
> -- 
> 2.45.1
> 

Kind regards,
Jeff LaBundy

