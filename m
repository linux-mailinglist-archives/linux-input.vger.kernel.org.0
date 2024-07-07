Return-Path: <linux-input+bounces-4883-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33B929990
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 21:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FF811C206AA
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 19:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B113A8CE;
	Sun,  7 Jul 2024 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="Yjd1rOd2"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2090.outbound.protection.outlook.com [40.107.237.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626BC28DD1;
	Sun,  7 Jul 2024 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720381996; cv=fail; b=b0BBB5bTTjloCENUGLCTHizvqAWZwrB2jEsxMNcJ4fpSHYbVkXic7vnFaPmrrecdSMNm4HlRgLO1G/JpCfGDfzy2bC2qMh4zCNrAux9LKDsLpk1rXKqo9ZPuX79FWQAiD58rw4S65bFZTKXjxNtCQwXGObMsRdOPVbsaJrwetfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720381996; c=relaxed/simple;
	bh=cvOWcjnU/DApaZtoU4awDejhQSNfpx3971rSpm4ErJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FhlTMZKijfPgRhoxgYa5HYfuZCyRRQ649vaBXjK+kBvTDahvZVMveOR4zPTqcAPaJG2LoTWF0CraqpDd+GY5anvTtHTqO7eiO32jZgAm1NHvw+uJ2z/PV1eVq8lOrLamXPbVzJTaszVYXY6TNVx2DOtT9jUoomHxhy0YKFKWBN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=Yjd1rOd2; arc=fail smtp.client-ip=40.107.237.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oah2MzlzWEmmtvwFqv/0quRgTzee4NIbVYZB4ul2dZ8rfrX39Hj8hDoCLFlCi+XhH+exDJjbIhLbZ1ZorEyZMV2CAqHwofcCEaDXc8yo6z4A4s6yrU/edl+yPoYZ/qK4TselHB4hkQs5EHDhJ3uPmDeUlwwKkXC6pcyZybiZ75rjngPYMu+rBXaOwzYUyzso/MAvCmbSTkib7WuOzn0kcpwCyr3kj2/t7VYmjmuLi7cXaxIHucqa3VNP6+ber74pxViP62jCKRNcIv0bJUlmK1siRPhGqfltNRqAJQW7M9D8wxfxHu/LOyjh7lmxTc3cWgExAZDyP7sSkgtrK1nRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7KKCXn0jssDWErk3tB1/0/4BGcVysjz1XbyInDCgKg=;
 b=AnO5+q07YsDRcyur+xrZoqjo+CVu2SvVtTwZ/Ejkr0L/34FEXwk9jRq6o+SIhVQ2/mcr21udsSnxA3Crn2in7yUYptqaoeKEV9cmZSU5+h7FqhUKtUqgJwuoJHBR+Q/3Q7c5c+fiMO+YcuPUckqsLUVk1pzzSyWuvFU0Cn83M1xTiK5V/LmBDfVWew5d4Vn8moyuKXYIiL7UQ0I4DdoMmL9ldG36aJjM0zlAjUsJavQJKyqUJBH31yQZSvnXf09Kn3lgxexdf3T1C3s1rFBFqhLmKWwxrw0J2m8Fz4ZNqJlI2Qx415NkCvun7rzsUA0jxCpxtCYHpx8Kz6+xf/br+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7KKCXn0jssDWErk3tB1/0/4BGcVysjz1XbyInDCgKg=;
 b=Yjd1rOd2f9s6kLkxAFwwwB87LZPDodTOrt7x/sMA9HF7qvyIzvR/T00hIScFZqzIf8QUzHsSaVHhQnBwtOMfNYuN0nvTS6yINRPxSqvCeO9dBA/jAA10yEGvvWozAiVWqSHF603PH5QhTRbhCVSkHRIWH0oXqoOTzxw6jf/qLyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN2PR08MB6431.namprd08.prod.outlook.com (2603:10b6:208:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 19:53:11 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 19:53:10 +0000
Date: Sun, 7 Jul 2024 14:53:07 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Input: evdev - remove ->event() method
Message-ID: <ZoryI/zMBIkZCst8@nixie71>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
 <20240703213756.3375978-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703213756.3375978-2-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SN6PR01CA0027.prod.exchangelabs.com (2603:10b6:805:b6::40)
 To BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN2PR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a010fb4-c51e-4534-d0a5-08dc9ebe6dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+tUMELWLCSQZtVLeufVj+SEXpJQy8e8hupygnsWd6eHWC/9kxIySJBqZiR8K?=
 =?us-ascii?Q?KP5iY4ZJuYhhOelIl8mKgD2n7IlQe2v7tfckTckGWbOIFvobuXdv4RlhdepC?=
 =?us-ascii?Q?P0EgJnKINa1hjfBKC8wSBHZcOwkBXb6GuARwr974cwQoDLeSpX+TMfprRCWT?=
 =?us-ascii?Q?27TtfN5us6PCnpqz8VUYE8weKfPIlU7eDuoQ1sbXnYNvd0cACvLZIpEZLDFh?=
 =?us-ascii?Q?f+7sRCE92J6hfcfztzR6f+xLZG0QTcY9XRcug/WLrJGWFSnkDk5LNPBmt9rr?=
 =?us-ascii?Q?WLx4NoyEyrXKbBIv7c5ZGju2xgDA2c+GFw+C+RLxO5x8hZov8RpmCUNoEEcX?=
 =?us-ascii?Q?DY2qwgJnDdjHAEh2jaRpO0XGDb08Lo1R/CZFAQxEillSmoqLd6NV+74slGLP?=
 =?us-ascii?Q?kjhQVOwssr1WP4Y9ZHemwnrycaqXVbZy9nHGMfcHyPIjH2aZH8CgubpOs9AB?=
 =?us-ascii?Q?S/7tzuifGNjD+shkBZw9pCwrKQKQf+HRpJjuxeVPD/zMs6qMp7LLDkyH+ttA?=
 =?us-ascii?Q?+Rz6bVD7AoT+Q92J1Fqq1MhhZjhD3fmcHlDD9jWm2WFvtdnfDimCExMjfLox?=
 =?us-ascii?Q?ctska+z4Vr793Hdbl5YRDfFJOwW0BEq89UlA0dsamOuY/zXaM9RvPAZE8FWV?=
 =?us-ascii?Q?mwXYXnNcVeUKPilFEbffri9JyT7uizHClhx37FgBDS2RYiAqiVSgP1ZFpDYG?=
 =?us-ascii?Q?5OZMoFQUdNw/htJFM61PJj0vRkqZiq3eQkv/gU2d2odSg/DFCvaOHY7R2C5W?=
 =?us-ascii?Q?cqS9UaG6b1iJAB18PqnUQ2tYbMHGKQfd7hcy7D7Wwl62HLFq1FxlKcrJsWa6?=
 =?us-ascii?Q?t5ds4Z5+nkuTo1fAUuWQae8TXjg+ZmNJg6TLwaicbFjCN9OThhacevT1du2E?=
 =?us-ascii?Q?T9gYn20qd1cxG1XoMlAWcv4/3xKp0NirudZJ9JBuOiPvzfyV7tOEy7uxiPvq?=
 =?us-ascii?Q?sy8T7wKUwPj6qcGiRyC0bapHOPDGCxuShnDWeMq6hEDY0u3CPEjutMN8lGu6?=
 =?us-ascii?Q?XgdwXR3lOOZ79VYm7FagaSBKLk5gPnvKTWRZo3ba0tpSOuooeQQwZT4aAb7J?=
 =?us-ascii?Q?sMQQ7dUoCXdb87EuXAQ1sqF1olAtxn3j7VPXFeT714xqaN33A6eeja+wfOt3?=
 =?us-ascii?Q?xUK1lBU6y0NJ/uZr0qmW+6jSy8fy+jbUMP/fnai1uqNycFR85LLiJxlYn/ho?=
 =?us-ascii?Q?1x/58yAZgJ4+hYOKm5WG3twpFKpV0ZAWE0E7zBF+SMBtuMopKz2LbmypzZ1r?=
 =?us-ascii?Q?gW6cKdGwTzMJ/JHdujQFds8Y6Puz04mlI0GgoYta5AhqCcaXHVG+xb9Jsfy2?=
 =?us-ascii?Q?Ci8qHAexrr258EYAFqG2XgYF0cHthnkSWWcINYqynMUqfA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w8oXQRedqrWJNx4TpU/Tnzqf21WJy2IE9e/tVZSGoVVpKqNqVcGTycG3bNME?=
 =?us-ascii?Q?nts62KBJZes07EXDxB3+mQtP1tyg9xoH5Z6PRs88RSeSpAEVO742dHSsZ/Se?=
 =?us-ascii?Q?01IcVImw8eRMQyCydUewZP2qJ1iRm2PrqT1YBpEIvgk1BEdf1sEp1j1KT3fk?=
 =?us-ascii?Q?vU4yp2YKC5ZjF30BlyLjZftQdSja6e/5lGdEBBdnMON4NMLlN6A+RTO9RaP0?=
 =?us-ascii?Q?B/iQSrjghd++gK8zyt5dwbmGioKP74C2apDXQSiQbQOc1BTfFa3YcjAz69ET?=
 =?us-ascii?Q?3MQ03xGzlUzXxGfLywItkx/Q6JUK7mTgEpBWwcoKtjHDXHAlYsGW4vF4GXiu?=
 =?us-ascii?Q?YTCwPVAeygec5tDf4v3kd+hKSmT3+d+PfBjkqpWkUfNN5FZDl1Kyw0OFyjZR?=
 =?us-ascii?Q?4Rn/1MmIIJ9hzhVVAJ07dSTGdGF/HU158SBGupGzCgswesdutdzx2ZsSAabG?=
 =?us-ascii?Q?cucSLTCMwCTPRjpERkGfeMvtT68gwIwT2sszqc1tf8kR80dbOoQzgfQ/Ph2r?=
 =?us-ascii?Q?edtk3akGi+Q6VYZH//bhey904dNudVyOwMGYWNr2CThZhVHAgpSUQJOlA3GX?=
 =?us-ascii?Q?h2SgbEaD1snlqb/VFX2RFaMo8/e4TdZdnX6zOt3lQ86IWlnk00DQvsVz1lWj?=
 =?us-ascii?Q?AQv+2sPs2UhC4z8Z6EYe7wOl41tSVavQZki6Uc0kW1E5UCK7rpqDR2qGFbLD?=
 =?us-ascii?Q?cbY+hwoPvEL/zNiZa5Et+oMDMY01QQOtxADGAFFepFI9yehoN5N+0P7WNw9S?=
 =?us-ascii?Q?Lv1GtLypgmRg8oE8A9Z4QgUovJrRqbl3pVxUn300yR2WotF0Xa9yxJJqInfx?=
 =?us-ascii?Q?/uVLpgel5Xy6CKQyXagi7HQKaONfWZ3LNEOP5Vr0YQMqKo1b283XKzYSCSsn?=
 =?us-ascii?Q?dC7/5oYANYZTSvLmdInyS4l8NpYaPBXNE6DNogTVEC33tacZnp8ZDCeERVdL?=
 =?us-ascii?Q?9zdJRjm+fc+tZSERlo3bJIugKq2BB2dvNOP32lU40XA5semMuHL4Qyny8D5C?=
 =?us-ascii?Q?M9XfPKnS5I/XYdTPVXvGEcK22C/YQUGwKFTNzQMvr4K3GXJG7rYimeH9ImwS?=
 =?us-ascii?Q?VaeGoxgAxqZ8ENfYWvkHAsMfkz2wlX8T3pGzxhF97PqVNSHOejZCkb6GwkTn?=
 =?us-ascii?Q?dPXstKhEmZPbI7IhXF5TpbGWMTldKIxvBwS2f0758ZdOMDTt0L/7tA90lFFT?=
 =?us-ascii?Q?bkvE/0XcJA46n/cypF/i7OMF9rsei5Z4LnTLYUThx9sawIFRl9MMF9EmDW6z?=
 =?us-ascii?Q?d+6Zdi+MFwL9um3cvOppl4Dt5yP1+J5TIFHLCDs82MJRIsvmgrE3oMrvf7va?=
 =?us-ascii?Q?KhFXafQ/Ixls27jtrLfksBVxcr+v39sK29saN/xfeoixjIYR22hUPkb7/xSP?=
 =?us-ascii?Q?gHQoolKkjjbhcKp4Z+cJt5v9CQ/cBQh28m/pQNW5eoxScaNCJSMSJoCWKtZA?=
 =?us-ascii?Q?FlRD/maAV3BJAMAUOqUWOL3yxXxX+t+NaKVzO4cmeRdlKzLzHkebB6IBGyxE?=
 =?us-ascii?Q?gjDvqncgBoUOtDynuHEwiipZekMLG0H35HVa4fDDfmfToJxPiPV/7EKkH+EA?=
 =?us-ascii?Q?eZEAwV7e/S+SsPGE+hp0R6EOfZ5t1oxM4vOaI5Sy?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a010fb4-c51e-4534-d0a5-08dc9ebe6dcb
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2024 19:53:10.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yrty3mW0xgG2HIXVUGfWHWBYSppoFpnN674Iim6pCP5RxcA3ZZBkQ49bTlnhSmzEysH7UpRxNZDEYfUT7AxUYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6431

Hi Dmitry,

On Wed, Jul 03, 2024 at 02:37:48PM -0700, Dmitry Torokhov wrote:
> Input core favors ->events() (batch) method over ->event() method
> if the former is defined, so there is no point in defining evdev_event()
> as it is never called. Remove it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/evdev.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index 51e0c4954600..05abcd45b5d4 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -308,17 +308,6 @@ static void evdev_events(struct input_handle *handle,
>  	rcu_read_unlock();
>  }
>  
> -/*
> - * Pass incoming event to all connected clients.
> - */
> -static void evdev_event(struct input_handle *handle,
> -			unsigned int type, unsigned int code, int value)
> -{
> -	struct input_value vals[] = { { type, code, value } };
> -
> -	evdev_events(handle, vals, 1);
> -}
> -
>  static int evdev_fasync(int fd, struct file *file, int on)
>  {
>  	struct evdev_client *client = file->private_data;
> @@ -1418,7 +1407,6 @@ static const struct input_device_id evdev_ids[] = {
>  MODULE_DEVICE_TABLE(input, evdev_ids);
>  
>  static struct input_handler evdev_handler = {
> -	.event		= evdev_event,
>  	.events		= evdev_events,
>  	.connect	= evdev_connect,
>  	.disconnect	= evdev_disconnect,
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Kind regards,
Jeff LaBundy

