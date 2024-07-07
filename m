Return-Path: <linux-input+bounces-4886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AFB929996
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 21:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C451C203A8
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 19:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472203A8CE;
	Sun,  7 Jul 2024 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="IBTDCP0o"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2124.outbound.protection.outlook.com [40.107.94.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7728DD1;
	Sun,  7 Jul 2024 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720382130; cv=fail; b=dA4/EKinvysF7cjQBHucVUD3VhREackj6AHP3FTheTPdH0kZayN+gL2+yNn8RBL3oOFQnAhCEo1Ajct7q/9xiVWjDYG2z/m+1KkmBhAUaRuAyyn222DuRcO3z0sgskRPPO2N6etVrjJ/xz7XjP7PVF3lgJQv+nlvFOWobfovsFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720382130; c=relaxed/simple;
	bh=Mh0Q1YyRE97AxXaXI/NzmDZDuzEBjsDjc7rYs2rIp38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iYgRFhWdfS01ujP+oaRKGURKvmFWIlP8BOGNcKK4u8xQySLODXFNgC5+c0XFGl1GQHrdnW4ytgRl2ae0Ajf50E8XRiBR8bNBqqdAiRlEtx3YRc8x2nT69DeXGdC4cxZ+zsMcosF0zsthmSh+v9P6q3slXbPtsYg5V9kL6hXLX6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=IBTDCP0o; arc=fail smtp.client-ip=40.107.94.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZy1oiUBZEYz7t3Zp4BIf7LAtf7MFswWtfDmDwZwRCC+aJQuc7Kg4Qqv6035WNMr+MbVm5JOaZnK4d/Re7U6YpdKzmIC9VpM9vdRzljgRszkGmGI32A5g+ptIi0FH2Qd6ON9fvsFmXnRZkGfruermbIm3AUfpk8bftDBJ/dMhHpeoewaAGxBuk3soAad6CyQYMhZtHM9+KOsNQjekcChCHlT1neytCuVoT8dmQ5pzcYSYC6Foz0SkwXfsK7SVStIgh5oT2cfZbDYMKsSKzPsNLe6uPRImxXiHJv5QXRo63fd9+Sd6oaYlu8glYzeP4f1uHFKuvyQuecVwZ+rkPRznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGHyRQkmOCz5lT9Wlq3wFVxdBrmmUJ3BCeLDfItJV9o=;
 b=kEPEczFoty/C+7DRxAC/9fhYw9Oem2hpYuvXMhBHjiwftB31J+Wg/nIdaOtdp44e25wKRP8IVi5A6ZM8Z63RusY1r1ZRe4kZMUtSNwj4HEHUImFeQMbnVIa/qV8E8ARl+ceSbf+lVoYsNISr8Wh8USSmejPeBR/YvgfsLQQZ2mSK4KFdGVf6ZOvik/JqrhGhwMCGjwpW+stJ3l9f35o+L232k4vjl0Arj49YVTwZMkmjpt738Im9ujHXzxNpPsV0rsJY0UJiy1ALMVJRhESw26QhSKw7GHnFMWwi3E5iE/lnyUQd9paXMHiWDpkiCy0MkuQW01lA78q4n7auTsfadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGHyRQkmOCz5lT9Wlq3wFVxdBrmmUJ3BCeLDfItJV9o=;
 b=IBTDCP0o13KQ+IVzSabcNT6+tEiz2wJm9cmm54HzCLvGPa7jmYvrvivaPf/z6+9aYIw7DSqJ9C93doLfhQCbOvacpKjnAmxD+SNhQQz1qUfl1GtQiP/X66v2t6RouyRY/1P0taLYz6nBD2O1WSNQbk3LO4ldlefFsDX4hIbk5Nc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN2PR08MB6431.namprd08.prod.outlook.com (2603:10b6:208:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 19:55:26 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 19:55:26 +0000
Date: Sun, 7 Jul 2024 14:55:23 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] Input: simplify event handling logic
Message-ID: <Zoryq51EvorLIPLA@nixie71>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
 <20240703213756.3375978-5-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703213756.3375978-5-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SA1PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::9) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN2PR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: eb478312-b64d-436f-3159-08dc9ebebf1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?11Ysxa/34KVjub+1b0SLP4AnUt5kOi4rXND29w+oIuEvDc3mgFWnG4rk/CmP?=
 =?us-ascii?Q?va/uX9aVicSXU6qxUbK8jDWRuCEn07T6JiW8ZaahbPKv7lvtg3VpIjBneRTj?=
 =?us-ascii?Q?C/XDQBexuZJtp6+WK3GCo5RK15ELFmXAZ+kuce6Bw1Uh4rJKeDRpNtzZy2st?=
 =?us-ascii?Q?TnvS/eygvJ5uPxKDxP1Af6dZYmtCY8Vh+NmyDvSGbHhmqF5J4TErWR/rtujg?=
 =?us-ascii?Q?5AQZi7Z+XMxJio9dbcEexSt3Gwd9OkGYp0ySg7XgVcdxEApi1kd1tmd2cFFa?=
 =?us-ascii?Q?DWDF8Tmp9EdPoY5cp7caIcE2nB9P60QmRTYqAvnyBpahdyuWfXbAU6G/oBiD?=
 =?us-ascii?Q?CEQ53zuID8rUK5kCHNMzq4ZgAZ+9+YwVjxeAmkiw9J1pR/0J/U1T+Gx/7KAQ?=
 =?us-ascii?Q?xYeCxATmdzu258vaKXJLS+J5LWxNfJPS5V0o0M2imrl1X7vXMj9UlSC7y4LX?=
 =?us-ascii?Q?wPcgHyHMb1q1RH71olakolym+n+wUwJ71+7/R0dgZxzgxw4u3qgfbPDek85l?=
 =?us-ascii?Q?hM8nGo90kdRY/gTTITWNKbhIdDNTMHl5ESN7Aq8YvyM30mFkoUvgBQVBeNcT?=
 =?us-ascii?Q?19V4hRGGeW/L+hFZCuLM4amCYmgy19yqrXjaGKz+j3uUdy11S7wcp2WVOYls?=
 =?us-ascii?Q?kPOJMzVRvw0AaT4+/6IwRNGOfXChXxOL++g9V3K/JMsn34ZCiUbGUUhiwn8g?=
 =?us-ascii?Q?BDVTFnEB1XpHlT3H6Zzluc8MzSfp1TxcnEYQG4blTDjQ5NFGUwFg6ptmHSIp?=
 =?us-ascii?Q?XW6MGTQ7eL3eOJjj99wejamDGOr+Hs9U1rI/4xxNxVIuU2bkqhJfYLt6Brbh?=
 =?us-ascii?Q?kyzFInz1qxYcMg+Kg0C0emp8SgJZ3Z3BGl6byeTzU2Wgn1xQkn5bFe+0UynP?=
 =?us-ascii?Q?EgCeSDJbgLcTq6QA/5tokNwIciVKIF5zYZsS0wG6Z5lwvf1iMFnDJFgoHWJg?=
 =?us-ascii?Q?jVXxWmQYTFiN+/epjEVkW88547gbkj5ygZtrlAFS3xeF57wI1yLuBnRa24CT?=
 =?us-ascii?Q?8HzYbyrFOvBrZvkFzLvuUfa6J84H57inKWh2Rocn028YqEWI3++iNjxmhTha?=
 =?us-ascii?Q?C/5pyNLBhylHP+PZVQesM7koONYFxoDlCN2CzHZAY0cFCoHCivng8QEzqiTb?=
 =?us-ascii?Q?3zxa4lfuBVZ36hXY31lHQaWG9b/7jb8lukfCsuTpsTM9i25hXVBeQq/q3/kS?=
 =?us-ascii?Q?AZyOCXCfs1LsA0jSXQ2Nam29yyETufwirQL+/jJUA+J3VukHyUAABftAqSWj?=
 =?us-ascii?Q?jcNAuGUNC7/jiEc1QvMvf1TrGdVGyj6VFskQNOJ0xG7KX12bqvCYlVVPC6Z5?=
 =?us-ascii?Q?sp/aOsrcGbESVmtCjXBpZ0lS1qtI4iWuW4rERLIzjGNsfg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AvtVB1acBtgMWN41rpzeGkBf+kTH5MGttLzYhD4n8H4rjPwAA8xj2DRFivsH?=
 =?us-ascii?Q?uxQECgeF1yXdGnuueIOWs+lJnt4KKVV3n8f9/I41o60ZetrwU5lWbMrLrXaK?=
 =?us-ascii?Q?tLatjRo5ajW/CLnkBwaXQ5LvUcY+FObz4IbxYaE/TvWHEuZAfyBarJT2EQrd?=
 =?us-ascii?Q?mp59dqzEGAnQZ21mSEjqBTT/tK3IIFjpo3ERgSz5NpWyGYRQRyCG99lGOjNW?=
 =?us-ascii?Q?34SIRk5yx7h4B6V+vZ95IocvyRPuNvKekoloNd7QRrhZQsv6BcV3dGAjZo7p?=
 =?us-ascii?Q?XA2OW5IdfCQu0OpXZbCFvAS0KIVhhcpiMhof5yOCkWg14ZCTUgMNCNlP21PZ?=
 =?us-ascii?Q?BjtYPwjNGg7pQXs+pe1PzoPPstnIl+xEprRZm9lKI0ZalA86oLx/Svmr8EFN?=
 =?us-ascii?Q?Vp3/ueRzJ3DOArCWQSUvRvWG2BdzoBv08pIACojqIzV7VYn8CiFwaGCWNhQm?=
 =?us-ascii?Q?mWoFLhpXK9Uh+IRAxRyasMBN7OzR9TTenEQvvof3I9/i+lB7sTAI+alO0z49?=
 =?us-ascii?Q?+WzPhuxD9TfYVnTEttHLtWuxGxqm85/0+hfgI9UHOOCQtHJEgbWYn1su8Gx2?=
 =?us-ascii?Q?2PRu3TPYBSx09iLhTSL8ez6hFzk2YM7V9yurWIyrlRePWoqatoqSuMk5nIIo?=
 =?us-ascii?Q?LAYZOhKyC/CHd9PoSEg54NINJh47cROuaKHeHNPkrw18lkNX0wxo+WLEaMHC?=
 =?us-ascii?Q?XnRUa2OAuqLNN/NDLU3xxsXoTFgwtdHq4heY5QVcQKhuevNrmEt9+v86FZwD?=
 =?us-ascii?Q?kkOcTTvzqYvo1bdaqpl5tpaRMjtJKRCBA6C8jcWsdkOuAs46uiccaowa++lR?=
 =?us-ascii?Q?VO042TuBSGMIFj236NSMuZeFWhN1SPDl13JXbDO+FpPvuY8MlkRzVeQcyHQx?=
 =?us-ascii?Q?Plrb9CzkRKUu6GNccU7HbZ9BfzRRWhrepCflPgQVcosaEqZvLFVpEh/2lvnv?=
 =?us-ascii?Q?0WzpmbaFGUlFW559lSkOW2PpqYoLux1qHzMihgkFrGNRTuRCucuQMt41GE8J?=
 =?us-ascii?Q?Hu+GbuhjC49mME2/FBnsQKLJlKJl+a8ye3npC/CAIBOu9Y3crhPijmKjQjfF?=
 =?us-ascii?Q?X7VpC1/MRz5yRlDXEk/v5rcK1/F95PGFOG4+ehVw5I0+WNJg+h0q+U+Ch4q5?=
 =?us-ascii?Q?mwoqCltIXFMVzyMKWuA3OUJgLOUo7iBzMwnDrDbmYw1sWlKQuhHvk5eEqeEq?=
 =?us-ascii?Q?IMhw6lGYcN7g1eKVP7tVmAvxrIMMmLId1nKM8hrUvEoAjDZRqNA++YXpjYwb?=
 =?us-ascii?Q?26axStB926P8XgsX8E4+1g0aRcVO2JUXFxJEDPx3iyDpqe/62bS4dLtno9wF?=
 =?us-ascii?Q?7cxHkXFa8Z5ViDdH1/p026e3gvRFw/5AXe4jdH7Lx8y88Zgwfj0WOu76y4ON?=
 =?us-ascii?Q?rlmciLEceQLdWygEOGfHcbCXXxX3m1PJfFRmkZwNNxWLSTAeD234jnb+NEe4?=
 =?us-ascii?Q?E0K/GRscYdkZcBheg9qzC+C7IBYQe2Xemh2Pg4P3QiyA6S6ohj+y4wCa+q/w?=
 =?us-ascii?Q?RBw5werWXG0jWNEFdYrIZEmV41m62IXgcY9VYIXQc3+GMNtwCrs8X0gGB/wZ?=
 =?us-ascii?Q?DDkehbwmrLFIgXoTKH352a16d8+FRuIdBaXdQCJA?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb478312-b64d-436f-3159-08dc9ebebf1a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2024 19:55:26.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75qsSuSwT0RQu2mXhCq9l/7K6qDFW7oIBoVNSyAmyV4VJGTdGBJBXkdjGu9jQzJ/cRzAkLmjCAgRkdGFCl8w9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6431

Hi Dmitry,

On Wed, Jul 03, 2024 at 02:37:51PM -0700, Dmitry Torokhov wrote:
> Streamline event handling code by providing batch implementations for
> filtering and event processing and using them in place of the main
> event handler, as needed, instead of having complex branching logic
> in the middle of the event processing code.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/input.c | 109 ++++++++++++++++++++++++++----------------
>  1 file changed, 68 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 7e4f8824f4fd..40a04154f99d 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -99,45 +99,13 @@ static void input_stop_autorepeat(struct input_dev *dev)
>  	del_timer(&dev->timer);
>  }
>  
> -/*
> - * Pass event first through all filters and then, if event has not been
> - * filtered out, through all open handles. This function is called with
> - * dev->event_lock held and interrupts disabled.
> - */
> -static unsigned int input_to_handler(struct input_handle *handle,
> -			struct input_value *vals, unsigned int count)
> -{
> -	struct input_handler *handler = handle->handler;
> -	struct input_value *end = vals;
> -	struct input_value *v;
> -
> -	if (handler->filter) {
> -		for (v = vals; v != vals + count; v++) {
> -			if (handler->filter(handle, v->type, v->code, v->value))
> -				continue;
> -			if (end != v)
> -				*end = *v;
> -			end++;
> -		}
> -		count = end - vals;
> -	}
> -
> -	if (!count)
> -		return 0;
> -
> -	if (handler->events)
> -		handler->events(handle, vals, count);
> -	else if (handler->event)
> -		for (v = vals; v != vals + count; v++)
> -			handler->event(handle, v->type, v->code, v->value);
> -
> -	return count;
> -}
> -
>  /*
>   * Pass values first through all filters and then, if event has not been
> - * filtered out, through all open handles. This function is called with
> - * dev->event_lock held and interrupts disabled.
> + * filtered out, through all open handles. This order is achieved by placing
> + * filters at the head of the list of handles attached to the device, and
> + * placing regular handles at the tail of the list.
> + *
> + * This function is called with dev->event_lock held and interrupts disabled.
>   */
>  static void input_pass_values(struct input_dev *dev,
>  			      struct input_value *vals, unsigned int count)
> @@ -154,11 +122,12 @@ static void input_pass_values(struct input_dev *dev,
>  
>  	handle = rcu_dereference(dev->grab);
>  	if (handle) {
> -		count = input_to_handler(handle, vals, count);
> +		count = handle->handler->events(handle, vals, count);
>  	} else {
>  		list_for_each_entry_rcu(handle, &dev->h_list, d_node)
>  			if (handle->open) {
> -				count = input_to_handler(handle, vals, count);
> +				count = handle->handler->events(handle, vals,
> +								count);
>  				if (!count)
>  					break;
>  			}
> @@ -2537,6 +2506,57 @@ static int input_handler_check_methods(const struct input_handler *handler)
>  	return 0;
>  }
>  
> +/*
> + * An implementation of input_handler's events() method that simply
> + * invokes handler->event() method for each event one by one.
> + */
> +static unsigned int input_handler_events_default(struct input_handle *handle,
> +						 struct input_value *vals,
> +						 unsigned int count)
> +{
> +	struct input_handler *handler = handle->handler;
> +	struct input_value *v;
> +
> +	for (v = vals; v != vals + count; v++)
> +		handler->event(handle, v->type, v->code, v->value);
> +
> +	return count;
> +}
> +
> +/*
> + * An implementation of input_handler's events() method that invokes
> + * handler->filter() method for each event one by one and removes events
> + * that were filtered out from the "vals" array.
> + */
> +static unsigned int input_handler_events_filter(struct input_handle *handle,
> +						struct input_value *vals,
> +						unsigned int count)
> +{
> +	struct input_handler *handler = handle->handler;
> +	struct input_value *end = vals;
> +	struct input_value *v;
> +
> +	for (v = vals; v != vals + count; v++) {
> +		if (handler->filter(handle, v->type, v->code, v->value))
> +			continue;
> +		if (end != v)
> +			*end = *v;
> +		end++;
> +	}
> +
> +	return end - vals;
> +}
> +
> +/*
> + * An implementation of input_handler's events() method that does nothing.
> + */
> +static unsigned int input_handler_events_null(struct input_handle *handle,
> +					      struct input_value *vals,
> +					      unsigned int count)
> +{
> +	return count;
> +}
> +
>  /**
>   * input_register_handler - register a new input handler
>   * @handler: handler to be registered
> @@ -2554,12 +2574,19 @@ int input_register_handler(struct input_handler *handler)
>  	if (error)
>  		return error;
>  
> +	INIT_LIST_HEAD(&handler->h_list);
> +
> +	if (handler->filter)
> +		handler->events = input_handler_events_filter;
> +	else if (handler->event)
> +		handler->events = input_handler_events_default;
> +	else if (!handler->events)
> +		handler->events = input_handler_events_null;
> +
>  	error = mutex_lock_interruptible(&input_mutex);
>  	if (error)
>  		return error;
>  
> -	INIT_LIST_HEAD(&handler->h_list);
> -
>  	list_add_tail(&handler->node, &input_handler_list);
>  
>  	list_for_each_entry(dev, &input_dev_list, node)
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Kind regards,
Jeff LaBundy

