Return-Path: <linux-input+bounces-6416-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE4973CA7
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 17:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C73C283193
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 15:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F99B195FEC;
	Tue, 10 Sep 2024 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="jbbgcqkp"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22937191F9B;
	Tue, 10 Sep 2024 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725983269; cv=fail; b=WUN80QIrN/yMqd6/MQi8ku5mdAgddTOrknHL4EEaHSWHTqffST14B7bOEmCU/UAUlk8Swca0gKOUNgnYEO+m/HKvd+SbiF/9c4HX2Ym5/0Q7ZOPW/LQcUEvAXWUqcpfKMhiGuuAdmTE48418nioLKQZZAcIkC1HO0zptjJICDrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725983269; c=relaxed/simple;
	bh=v5TZttHRhH/Ure4tCF/cA5Oqcx9VPqzzhLTcA2IQ4oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O5WvnKicAjlP78jEN9IQfB6ivDRTwkD+ezEr7BWnUnksONKag1FzQpPUSLc2MXs7jNdnUu/JTcDDBCz8CNdTpzupoxeiXcTUawL9TpPD9X53VOsHdRtEQ6+GiQV+XbdP/YRCx9rwTIJ1R7ySFqHARghWPU7GdIa3Yw3LJnOOtMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=fail (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=jbbgcqkp reason="signature verification failed"; arc=fail smtp.client-ip=40.107.223.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZHww7ZEWRtMT9rygfmNeUzsa2EMQ+Tg6IMZgzNiRV7+ChxlkMZQUcaF5PDN2E/W2owNA08bnJcXP4mY8M9+fUA1GXOi9Y/ucaZztnGd6g7Ua72WXj1I+4zImy4M5JGBDtHD1lcyo7Z+rs/r+2wbWT86swFP4pJf16bFOCiYUyFU7adi+LzZ+6sLa2vrQU4i+YEgO9wrIziV+SehblVVOtCELPkmHjG3BpUSGPiiWAPcnqg3n8t6bAX6fTdihCN1DmqWa+3se7dgmWKcg8NlC6uaKTzmcU2/mipql+OphOfK+b7eeEebwxChN/Hwb1/FXwhiKAkrzv9Zj0Je6dw3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcI5txnJltHAaK6fy0IjJbeybicrEjAmq0xnZ5O7sEY=;
 b=BTfNqs1HH0kybK0ywVn9S9YsOMjPQTRjb+cqp3WUXQDSKBir0M95u32li3HxQPNarh8Dx7ydUqftmO+0ylOIvpRznVaD7isuQGrhEUqVJ7luoPsxPqFKvOVQAC3/rUQhtlXCNjljIzEW3Xab6OOX3oivZP02Ur8GPR+DKV3LBPdL3VTsqQ8WPIhHVy9LDrWlCjFTcz4JMC9YIRdr7j9eHpgGMUp/1+UZ5kXXpV55Mmu0PRj0x5AH0LjabChkB2FRbb1kjo4wkci+ClC+9HI1Pt3wq9gpi+wU8OPh3BP3hFl2NVKhpu/P7D/2aDgpV6f1TKCjSJZb+qnzB5M3NMfqHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcI5txnJltHAaK6fy0IjJbeybicrEjAmq0xnZ5O7sEY=;
 b=jbbgcqkpMAyZjAeIih8RkWvKHKJHk23RYTUxl49p0fjvVvBEE0+6KlZO+RC0xDg3ZHmoPszywKPDK7pd6S5o39ggEeW8J9owq0XQg8jBXRGnS6cz1GFGA5Z9dtxXu9IBT9+TNJaJ0pLqiQ9RBYRCRCl0xl6Grn0gq5JNEwtLSnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH3PR08MB8866.namprd08.prod.outlook.com (2603:10b6:610:19e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 15:47:42 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 15:47:42 +0000
Date: Tue, 10 Sep 2024 10:47:34 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 2/2] input: add driver for Hynitron CST816X touchscreen
Message-ID: <ZuBqFm9OSAXejhOf@nixie71>
References: <20240910115158.74502-1-kuzhylol@gmail.com>
 <20240910115158.74502-2-kuzhylol@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910115158.74502-2-kuzhylol@gmail.com>
X-ClientProxiedBy: SN7PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:806:f2::9) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH3PR08MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 9387cb44-0dc9-4356-c42c-08dcd1afe7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?HRRcVDfciH8mJEGSoX9mZl9SB5QSE1xKoMueTjm53i9l65vJ+RtWiIExYH?=
 =?iso-8859-1?Q?DcUzeeREOenqvEfjLZVX9WtYpS7FwKVPbmByoiy0zlrEaAEAJN1W6PdPNy?=
 =?iso-8859-1?Q?uuXYyEqiw7fpMYIq5HlG95oco7z0MpQ21RWbDWbs6dYLOoXBR/7TLOgBHz?=
 =?iso-8859-1?Q?A8LqdLhKMuEHmyVb9oJOfRqnFDYsfKIeM+VWioUBV+ocHYjOEDhndei3uJ?=
 =?iso-8859-1?Q?ofyiwwMKr383/GdCnxra3NtlFf3u0gy1xpHMbBx+m0dfT5Fjuoi/+/4ASJ?=
 =?iso-8859-1?Q?hJb551CeWEOblPguuX9H7AOl0TejfBdcqh1Fa4Ax++Yd0LE211DUU9fRd7?=
 =?iso-8859-1?Q?3BsSoLH60ZUJ80lflytWLQkG/EIMaEo1Lb9Qkz4KFPaC2NXFU8uDLIf/kn?=
 =?iso-8859-1?Q?0Ol9ATBe286MgKB7CTXx1P7q1jNYuDvbke+Ylvdjv0JZ7n++1rqMTGpluQ?=
 =?iso-8859-1?Q?CgOcOrmExldpqoT6dvbAQ275Ttd7W8sykgOlOiiNxd6+Y4sr3ZKSI/YEQN?=
 =?iso-8859-1?Q?R5XF2ongLP6+zypLcfA69jUGRe2vKRUq6x61RyLDaGuwq5x9dMXGzFuV9e?=
 =?iso-8859-1?Q?Y2fXc9Zd2L4sLGUNin1lGuCQJ3qYZOVatB7fBaZGXJTPEbPLjvwaqFCyAf?=
 =?iso-8859-1?Q?1dFt5yQzgc9vjQjq31NUCEgUEiQvzxJUmduC8nesyLPU6QOAWnDX7rVnJJ?=
 =?iso-8859-1?Q?9oJOtLwmxkBUT4IZAiYe9wLiQNp7OPnJw/5WInkFzXSgWKL/gSm+XTNoW/?=
 =?iso-8859-1?Q?5/uVPZr2420GvMF4z8iUxnFL+B7wUs4n/Dtvu34un6bYnE4hrw69sr4DMW?=
 =?iso-8859-1?Q?XPO7WjlumZlDtC7qtCaUgc2QyZ5OnpId+Ci7BtWv4Yq7cyArSqiB/WDVHE?=
 =?iso-8859-1?Q?h9ONZ+3U4SX0r9s0mDEwpd9e+KfXF24bQuhyyXg7a5Vmk2g96l362Wta+n?=
 =?iso-8859-1?Q?ieNDaGmmCdeSqlcLPsaFROgJKoCfQJ4sIfyX2OQWex27to68dJ6ACIvrMU?=
 =?iso-8859-1?Q?8zUC/tDQDoly/TiB0y+0Wpig+GJ1xADi4XvcgtGiisYRI1YmKveCMLl4vZ?=
 =?iso-8859-1?Q?cJ54EuNmW357UQe/3ZU1hO2tuhaDQeCVTuxMPKE6CoWzUHwtzFZJzMlJn6?=
 =?iso-8859-1?Q?3AHPimf2musN6p8ITLAPOOM017kJj0tu0+VBosoMvKp/T3T6uDo5YwpMEH?=
 =?iso-8859-1?Q?ilS2h3kVM0jF4Cw594yWgkKsUqmA9+w/2yEMmvRXDReAJRRtsEqUY80cuP?=
 =?iso-8859-1?Q?KWIt01lyN067rvQFw8H363cdcbAnog2fdQXnmATwa8aVdqZ8O1ADv3B//y?=
 =?iso-8859-1?Q?4gl6ypPINpfMRqGXfA02A8aVxXxv+spQ8t5n4m+NtDq0etDphzcyoNmp2e?=
 =?iso-8859-1?Q?qHBYny0ILxxEVMx5sSDuhrzxtqR+rFNg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cO7dPG7DBE3+MkEgod70OLMmHxDNuXz6KGbv6uGnkkIfrrOJc3186ZJumB?=
 =?iso-8859-1?Q?fkavX7ehyOMiYB8/U+YCjBUB4yYxJWMZJtGymeSwU8CWQ4nkQODl5DO7M1?=
 =?iso-8859-1?Q?vtUPguOZQQxqEhgU+PpPwSXcL3J7Ouldd4lSwRK8kiFU3PydYdgTWSNdRE?=
 =?iso-8859-1?Q?TM7L+/cfs3tPDp9QNvOMu4BuDQm4JpUwr4BrU20TLpPWPfFQ9BNYy1Y6H0?=
 =?iso-8859-1?Q?AS6sufqTVNx18gLucmX+nYyBVi2BfvZkyi6h/538GIr62voU7dLRKkW2yc?=
 =?iso-8859-1?Q?9j7pzf0lBQcOgV0K2znq3TevAsC5KJD+HDh3ulNx7PgUs6M+QAOiSdhMrX?=
 =?iso-8859-1?Q?UKnajDdVmH6CcMRoVU4nRStYPSt2yx54F4OjiO8ECqU7qdISedNDVHvcwi?=
 =?iso-8859-1?Q?W4KRRLXr4UEikQ0gtUM730tF2ZLRLWvoGDjhaj991Q73DP5vw38+DuhxRz?=
 =?iso-8859-1?Q?sSb/0lI5PTBWDGY7hlqMjS8i4CfltvYr2WHiOdQvAt+Sg3ERP1S20dDo0C?=
 =?iso-8859-1?Q?rLYiudwsVsaj1rft0KTZgUsx6I691WoHZh/dJ1K/ab9xjzDBiQ7gEgMwMo?=
 =?iso-8859-1?Q?+S8sDRWUQHzDNnvw3LXIppiFuY1NGf6bv9oIJnydEWlX4f4wTmMtqm1Psw?=
 =?iso-8859-1?Q?6ddhojCBOC339M8qsK8hhiUCDpalRmuW0ymkqmooaJqCVolCxLa7GYOP6D?=
 =?iso-8859-1?Q?7m0AhvPFnA5vVCcfEnyLhvXQbXKac1Wi/nHBS3RGtSl27PiEIeXQxsPd72?=
 =?iso-8859-1?Q?yRJx7hi1ZOwvfYCiTy04DF14vZkccdfbpf7Cd1s8V7/cmFh1pNwAoyOE2S?=
 =?iso-8859-1?Q?cc5GknBOwkkh9NFF2Ayq0V2P25P5SmYfFQkh2P1zfkSmtgcy7/yaRcRLfr?=
 =?iso-8859-1?Q?oCiQ8ibbf7V4byaHVwU0qxRoeXOMtD3F1wLJzKiNjdBnkw1h1KP6HpWaiV?=
 =?iso-8859-1?Q?+udzkeM2Tqk5r0mmBIrnGLG4enJVl2GrI3z9wCqfYCkP2Y0d76IVqTZDlI?=
 =?iso-8859-1?Q?bYJcJI9i/lWLQgLXFCFirp1GEKxoSZ6SsnzSGkPO2GmsLgjFtkYqvTuAYz?=
 =?iso-8859-1?Q?yy7LUzRfOSKqBg3qB99KRS1F3MkBiINB/XE+BX3/azeHWaFY4UqC627PBc?=
 =?iso-8859-1?Q?yvbvTNuqKu4roVBaPRtWf1xrmH/VLCoF0le6XiWklDCp1WPYuVFTcwT0Se?=
 =?iso-8859-1?Q?U6Fcbw0oLx6o9HlVB/F+N9JT+gmDf4CSbaba6VCZQfyHQMsiJjcX0No1Rz?=
 =?iso-8859-1?Q?U3Jcm47LMM2FJh/3qWzZjSZ/OzerzPRf6QCfZ1p9/9REGVCN3MakwZyCYE?=
 =?iso-8859-1?Q?i0l/uCNHLi0BZ8JFaWG8PK5qdY5k+OJkZGHkI4Bj5H+6/CnLhLqrojQ0E3?=
 =?iso-8859-1?Q?dNsLnKRZ4b5jalbbywsYcmkuRWWQGoeh7i54W6GKQsWypCSaL2kHqSWhwB?=
 =?iso-8859-1?Q?o1lUoS9DISlFLsMaq48vjpGt9a8ACrE2a8NQQw3AvSDcgJ8hQZv+YTCF63?=
 =?iso-8859-1?Q?ZJp99Wcgh4YHtz+sQ6cwtg8naKU94MrezBGq/3q68+elWlPiLDXch9aFlj?=
 =?iso-8859-1?Q?yDmkchi8eyi7sNQizlBW1ko1wKMcAUbu8NiEzy6PVbw1O8LfiGHgN49VTi?=
 =?iso-8859-1?Q?Jq1kdn+5OABHSf7J8AepU38vToY4C1Do80?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9387cb44-0dc9-4356-c42c-08dcd1afe7ff
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:47:42.3155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUFXyodbd9+4M4IZAky5y4lcydI+emC0OSvB8AiXCk7UEg20B/T7/2Hp4lVGZfpnq9ISdVa+N2nGZ90HZA5GDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB8866

Hi Oleh,

Great work! Just a few comments throughout.

On Tue, Sep 10, 2024 at 01:51:58PM +0200, Oleh Kuzhylnyi wrote:
> Introduce support for the Hynitron CST816X touchscreen controller
> used for 240×240 1.28-inch Round LCD Display Module manufactured
> by Waveshare Electronics. The driver is designed based on an Arduino
> implementation marked as under MIT License. This driver is written
> for a particular round display based on the CST816S controller, which
> is not compatiable with existing driver for Hynitron controllers.
> 
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
> 
> Changes in v6:
>  - No code changes
> 
> Changes in v5:
>  - Update commit based on Dmitry's feedback:
>  - Make GPIO reset optional
>  - Combine declaration and initialization for i2c_xfer
>  - Return 0 explicitly where possible
>  - Rename rc (return code) to error
>  - Make Touch processing call return boolean
>  - Improve error handling for i2c_transfer
>  - Use get_unaligned_be16 for getting coordinates
>  - Move touch event completeness upper to irq callback
> 
> Changes in v4:
>  - Update commit based on Dmitry's feedback:
>  - Move abs_x and abs_y to u16
>  - Remove __packed qualifier for touch_info struct
>  - Hide tiny touch irq context to stack
>  - Extend cst816x_i2c_read_register() with buf and buf_size
>  - Remove loop from event lookup
> 
> Changes in v3:
>  - Drop timer and delayed work
>  - Process touch in threaded IRQ context
>  - Fix chip reset sequence
>  - Move input_register() before devm_request_threaded_irq()
>  - Re-arrange and document input reporting
>  - Set u16 data type for event_code
>  - Remove double tap event to prevent continuous double side sliding
> 
> Changes in v2:
>  - Apply dev_err_probe() for better error handling
>  - Remove redundant printing, remove dev_warn() message spamming
>  - Get rid of PM since the touchscreen goes into sleep mode automatically
>  - Get rid of IRQ control and IRQF_NO_AUTOEN flag
>  - Reduce timer timeout up to 10ms to handle touch events faster
>  - Skip registering of non-gesture CST816X_SWIPE event
>  - Shift input_register_device() as a final call in probe() callback
>  - Specify name of i2c_device_id explicitly
>  - Update module description and fix typo
>  - Add necessary spaces between lines
>  drivers/input/touchscreen/Kconfig            |  12 +
>  drivers/input/touchscreen/Makefile           |   1 +
>  drivers/input/touchscreen/hynitron-cst816x.c | 259 +++++++++++++++++++
>  3 files changed, 272 insertions(+)
>  create mode 100644 drivers/input/touchscreen/hynitron-cst816x.c
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index c821fe3ee794..02f40d0fbac0 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -481,6 +481,18 @@ config TOUCHSCREEN_HYNITRON_CSTXXX
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called hynitron-cstxxx.
>  
> +config TOUCHSCREEN_HYNITRON_CST816X
> +	tristate "Hynitron CST816X touchscreen support"
> +	depends on I2C
> +	help
> +	  Say Y here if you have a touchscreen using a Hynitron
> +	  CST816X touchscreen controller.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called hynitron-cst816x.
> +
>  config TOUCHSCREEN_ILI210X
>  	tristate "Ilitek ILI210X based touchscreen"
>  	depends on I2C
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index a81cb5aa21a5..a92a87417a97 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
>  obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
>  obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI)	+= goodix_berlin_spi.o
>  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
> +obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CST816X)	+= hynitron-cst816x.o
>  obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
>  obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
>  obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
> diff --git a/drivers/input/touchscreen/hynitron-cst816x.c b/drivers/input/touchscreen/hynitron-cst816x.c
> new file mode 100644
> index 000000000000..3886617e6a71
> --- /dev/null
> +++ b/drivers/input/touchscreen/hynitron-cst816x.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for I2C connected Hynitron CST816X Touchscreen
> + *
> + * Copyright (C) 2024 Oleh Kuzhylnyi <kuzhylol@gmail.com>
> + */
> +#include <asm/unaligned.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +
> +enum cst816x_registers {
> +	CST816X_FRAME = 0x01,
> +	CST816X_MOTION = 0xEC,
> +};
> +
> +enum cst816x_gestures {
> +	CST816X_SWIPE_UP = 0x01,
> +	CST816X_SWIPE_DOWN = 0x02,
> +	CST816X_SWIPE_LEFT = 0x03,
> +	CST816X_SWIPE_RIGHT = 0x04,
> +	CST816X_SINGLE_TAP = 0x05,
> +	CST816X_LONG_PRESS = 0x0C,
> +	CST816X_RESERVED = 0xFF,
> +};
> +
> +struct cst816x_touch_info {
> +	u8 gesture;
> +	u8 touch;
> +	u16 abs_x;
> +	u16 abs_y;
> +};
> +
> +struct cst816x_priv {
> +	struct device *dev;
> +	struct i2c_client *client;

I don't see any value in storing both the device and i2c_client pointers
in the private struct; I think you can simply drop the former.

> +	struct gpio_desc *reset;
> +	struct input_dev *input;
> +};
> +
> +struct cst816x_event_mapping {
> +	enum cst816x_gestures gesture;
> +	u16 code;
> +};
> +
> +static const struct cst816x_event_mapping event_map[16] = {
> +	{CST816X_SWIPE_UP, BTN_FORWARD},
> +	{CST816X_SWIPE_DOWN, BTN_BACK},
> +	{CST816X_SWIPE_LEFT, BTN_LEFT},
> +	{CST816X_SWIPE_RIGHT, BTN_RIGHT},
> +	{CST816X_SINGLE_TAP, BTN_TOUCH},
> +	{CST816X_LONG_PRESS, BTN_TOOL_TRIPLETAP},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +};

These really should be configurable via device tree and not hard coded
in the driver. At the very least, if the touchscreen is installed 180
degrees for certain platforms, the concept of "left" and "right" changes.

> +
> +static int cst816x_i2c_read_register(struct cst816x_priv *priv, u8 reg,
> +				     void *buf, size_t len)
> +{
> +	int rc;
> +	struct i2c_msg xfer[] = {
> +		{
> +			.addr = priv->client->addr,
> +			.flags = 0,
> +			.buf = &reg,
> +			.len = sizeof(reg),
> +		},
> +		{
> +			.addr = priv->client->addr,
> +			.flags = I2C_M_RD,
> +			.buf = buf,
> +			.len = len,
> +		},
> +	};
> +
> +	rc = i2c_transfer(priv->client->adapter, xfer, ARRAY_SIZE(xfer));
> +	if (rc != ARRAY_SIZE(xfer)) {
> +		rc = rc < 0 ? rc : -EIO;
> +		dev_err(&priv->client->dev, "i2c rx err: %d\n", rc);

Case in point: you already have priv->dev, but it's not being used.

> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool cst816x_process_touch(struct cst816x_priv *priv,
> +				  struct cst816x_touch_info *info)
> +{
> +	u8 raw[8];
> +
> +	if (cst816x_i2c_read_register(priv, CST816X_FRAME, raw, sizeof(raw)))
> +		return false;
> +
> +	info->gesture = raw[0];
> +	info->touch = raw[1];
> +	info->abs_x = get_unaligned_be16(&raw[2]) & GENMASK(11, 0);
> +	info->abs_y = get_unaligned_be16(&raw[4]) & GENMASK(11, 0);

This seems like a good case to make cst816x_touch_info a __packed struct
with abs_x and abs_y declared as__be16 members. You can then read into an
instance of this struct and unpack as necessary, as opposed to essentially
having two buffers and copying one into the other manually.

> +
> +	dev_dbg(priv->dev, "x: %d, y: %d, t: %d, g: 0x%x\n", info->abs_x,
> +		info->abs_y, info->touch, info->gesture);
> +
> +	return true;
> +}
> +
> +static int cst816x_register_input(struct cst816x_priv *priv)
> +{
> +	priv->input = devm_input_allocate_device(priv->dev);
> +	if (!priv->input)
> +		return -ENOMEM;
> +
> +	priv->input->name = "Hynitron CST816X Touchscreen";
> +	priv->input->phys = "input/ts";
> +	priv->input->id.bustype = BUS_I2C;
> +	input_set_drvdata(priv->input, priv);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(event_map); i++)
> +		input_set_capability(priv->input, EV_KEY, event_map[i].code);

Nit: it's much more common in kernel code for iterators to be of type int.

> +
> +	input_set_abs_params(priv->input, ABS_X, 0, 240, 0, 0);
> +	input_set_abs_params(priv->input, ABS_Y, 0, 240, 0, 0);

I see the binding includes the touchscreen helper binding, but you're not
actually using any of the helpers. Assuming that's intentional, please drop
the reference to touchscreen.yaml in the binding.

> +
> +	return input_register_device(priv->input);
> +}
> +
> +static void cst816x_reset(struct cst816x_priv *priv)
> +{
> +	if (priv->reset) {
> +		gpiod_set_value_cansleep(priv->reset, 1);
> +		msleep(50);
> +		gpiod_set_value_cansleep(priv->reset, 0);
> +		msleep(100);
> +	}

This is a style choice, but you can save some indentation by doing
the following:

	if (!priv->reset)
		return;

	gpiod_set_value_cansleep(...);

> +}
> +
> +static void report_gesture_event(const struct cst816x_priv *priv,
> +				 enum cst816x_gestures gesture, bool touch)
> +{
> +	u16 key = event_map[gesture & 0x0F].code;
> +
> +	if (key != KEY_RESERVED)
> +		input_report_key(priv->input, key, touch);

There is no need to manually filter KEY_RESERVED; the input core
automatically marks this key code as unsupported upon registration.

> +}
> +
> +/*
> + * Supports five gestures: TOUCH, LEFT, RIGHT, FORWARD, BACK, and LONG_PRESS.
> + * Reports surface interaction, sliding coordinates and finger detachment.
> + *
> + * 1. TOUCH Gesture Scenario:
> + *
> + * [x/y] [touch] [gesture] [Action] [Report ABS] [Report Key]
> + *  x y   true    0x00      Touch    ABS_X_Y      BTN_TOUCH
> + *  x y   true    0x00      Slide    ABS_X_Y
> + *  x y   false   0x05      Gesture               BTN_TOUCH
> + *
> + * 2. LEFT, RIGHT, FORWARD, BACK, and LONG_PRESS Gestures Scenario:
> + *
> + * [x/y] [touch] [gesture] [Action] [Report ABS] [Report Key]
> + *  x y   true    0x00      Touch    ABS_X_Y      BTN_TOUCH
> + *  x y   true    0x01      Gesture  ABS_X_Y      BTN_FORWARD
> + *  x y   true    0x01      Slide    ABS_X_Y
> + *  x y   false   0x01      Detach                BTN_FORWARD | BTN_TOUCH
> + */

This is one very specific implementation, and too restrictive to be
hard coded into the driver. As mentioned above, please consider making
gesture key codes configurable by way of the device tree.

> +static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
> +{
> +	struct cst816x_priv *priv = cookie;
> +	struct cst816x_touch_info info;
> +
> +	if (!cst816x_process_touch(priv, &info))
> +		goto out;

This is mostly a style choice, but it would also be fine to simply
return directly here since there is no clean-up to do.

> +
> +	if (info.touch) {
> +		input_report_abs(priv->input, ABS_X, info.abs_x);
> +		input_report_abs(priv->input, ABS_Y, info.abs_y);
> +		input_report_key(priv->input, BTN_TOUCH, 1);
> +	}
> +
> +	if (info.gesture) {
> +		report_gesture_event(priv, info.gesture, info.touch);
> +
> +		if (!info.touch)
> +			input_report_key(priv->input, BTN_TOUCH, 0);
> +	}
> +
> +	input_sync(priv->input);
> +
> +out:
> +	return IRQ_HANDLED;
> +}
> +
> +static int cst816x_probe(struct i2c_client *client)
> +{
> +	struct cst816x_priv *priv;
> +	struct device *dev = &client->dev;
> +	int error;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->client = client;
> +
> +	priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "reset gpio not found\n");
> +
> +	cst816x_reset(priv);
> +
> +	error = cst816x_register_input(priv);
> +	if (error)
> +		return dev_err_probe(dev, error, "input register failed\n");
> +
> +	error = devm_request_threaded_irq(dev, client->irq, NULL, cst816x_irq_cb,
> +				       IRQF_ONESHOT, dev->driver->name, priv);
> +	if (error)
> +		return dev_err_probe(dev, error, "irq request failed\n");
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id cst816x_id[] = {
> +	{ .name = "cst816s", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, cst816x_id);
> +
> +static const struct of_device_id cst816x_of_match[] = {
> +	{ .compatible = "hynitron,cst816s", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cst816x_of_match);
> +
> +static struct i2c_driver cst816x_driver = {
> +	.driver = {
> +		.name = "cst816x",
> +		.of_match_table = cst816x_of_match,
> +	},
> +	.id_table = cst816x_id,
> +	.probe = cst816x_probe,
> +};
> +
> +module_i2c_driver(cst816x_driver);
> +
> +MODULE_AUTHOR("Oleh Kuzhylnyi <kuzhylol@gmail.com>");
> +MODULE_DESCRIPTION("Hynitron CST816X Touchscreen Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

Kind regards,
Jeff LaBundy

