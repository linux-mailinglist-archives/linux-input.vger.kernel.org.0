Return-Path: <linux-input+bounces-4885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D355E929994
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 21:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89438280D0E
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 19:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809D03A8CE;
	Sun,  7 Jul 2024 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="uDWGNMje"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2094.outbound.protection.outlook.com [40.107.93.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C204228DD1;
	Sun,  7 Jul 2024 19:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720382081; cv=fail; b=GlkwYfli1ve/DH7h8FgBZCiyJypqNCg5v1bWsHdwPMw2Ncec2mTZGeZeZvVIW/rW23wY7BB3QEMv2SLorncLnr75f3d2omkKRhxam4FdsxYdQI8QekB02SVV3Pp7lAygz0PuqEsBzRhNJq7VPjSMpkFNQo/hycGJC+Ei8XHwiHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720382081; c=relaxed/simple;
	bh=/fM1Tz4KWHHutDp+FHKIMZH9nRlZtBP3PKee46DomPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FicbW6kigrCVts0XB7vnW4vKVtt6UalCVOwlYvh2iNVyn0VUHsEyA1Bnu+hIn7MBCXgrHptI0zsN3HPl7hE+HW2870qr4D5+nJUVVFn3aV6h6uh7xMiHy3AbLc64948k2ak4p7fOGAv+JcdUvkH0azNQO7Tt1PiMmjhSM1GGuZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=uDWGNMje; arc=fail smtp.client-ip=40.107.93.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e216YScMBadIVMnTFj17zltpojksSs1BKePndwoRJ7T4m8uJYhOosazIn0paVpo7sZthGlLSMerN7SMnLDT2aKFBZyUwUx0NNlFRCtdhSEXuy+vlbaTN0+UcauMtuHl0mizUH5UzTsCJX0C/YvvUReR13rktVpJKRven/czTK37fqB9AXMsHf6F2TKDTd+HpiaA0R7TOElo7vLKrtk27AaqUNiU2xLeBiIfmCiwDwvelGa1Xpda6CxIES8U+4kTXhKhTkwNjFSwBASvgSZW4iyimpPS1luu34HderxfKrRVeHKO1FWgbiryF/9m9cGqPL0rg6wuhaqv5o9dTGK48xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzCqk3PyezL0l3N3zHamdF5x2OLtUtxQI+aGDrmazck=;
 b=SxGOM4iL+MWxaARK6dkoRAssSj2LWHZ/oq4jcCi6UEBHc6KrORg0Go1/+HnvxOyRBciNiQIqtqQQADyTgK3IudP8cHHqiNBPmEOpzBCRyBFv2f9KcU2+O/GhHwDUC6eA15oyFI4f07prs98MZBnqqchWEeqfJLpgH9OfvY8g2aEXj7YaIICI0ml1M5OI2ixigvEtb6Tjanomts/sZVngLpe7+z0I46WYUJSVxb3sBcOJ5KaRDEQRfaSA2zjqhyYVudbWlBCt5uT6FWvb5edR2Qg/P/35mDgd1SZpuq1LbpMV+g7OjtvOCFNzUMtXxiWBkxdYbtIjnAWnLZXlFTulXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzCqk3PyezL0l3N3zHamdF5x2OLtUtxQI+aGDrmazck=;
 b=uDWGNMjeQ8DfjvTCr/UFw1NIn1Gvs2RujJl5G3YihB6xu2Dy4+RR3l5dlmQT2y5JZ3KwenlLVEFfGrWkNzCX71alEgKinrUIAfBXQiux0ieHkKpmU96A4OwTamsUq0mGE2+lWAhTbyfrGXkdnZUcLiRQXYbPOnY4oAUnGY8CFRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN2PR08MB6431.namprd08.prod.outlook.com (2603:10b6:208:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 19:54:38 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 19:54:38 +0000
Date: Sun, 7 Jul 2024 14:54:35 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] Input: make events() method return number of
 events processed
Message-ID: <ZoryexoiivzhHeYI@nixie71>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
 <20240703213756.3375978-4-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703213756.3375978-4-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SN7PR18CA0006.namprd18.prod.outlook.com
 (2603:10b6:806:f3::8) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN2PR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 33988e9e-bfca-486a-4a2c-08dc9ebea239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6yAeSrAjFJ+ksww26N7FfpSA1dOZifX/xmUQEuv0G2lVyj+tOSS19H49HIG?=
 =?us-ascii?Q?mXcL3UuHQYlcGe3xZfxGkj2TLvzqrE0I4v+aruP0V/2IGXXdyk4q4KZ+hEM+?=
 =?us-ascii?Q?AKwS9tMkeMFrUniS1D9xQGcYlraKedxMcQkAxQ1D8yvZM/DeLoHbWrKIeulg?=
 =?us-ascii?Q?pGNwSlEfE0rB3hCWIG3dOhFMm++xjHTE78Ypr663F2neQIOmm/29GE5tiFgG?=
 =?us-ascii?Q?XH3OWWDCLB8lKDx/nmYype6qSzEl/tZFYUznds5SvGaa9ggWN9oEYkMVdNGe?=
 =?us-ascii?Q?MG565ExG97nyIE8qBY4JLE4J3D689pbPgUw6hyg6DFFvFNFRrMs5N/RaR/S8?=
 =?us-ascii?Q?ZXKOTeIVvnc1QvzTajCwoQ5fJIi+th382zOHLyekQnoAv9xh/dJVRFzqaLVB?=
 =?us-ascii?Q?wcy1WCejAVM3xqPfz+9V3u3TeXbL15AhcZVbZzB/47/xYClqkALfwGpkZQ73?=
 =?us-ascii?Q?Npzd/mpP+ymJPeEhjV01VsGUYtV128FnYxhh0NKEAH9dg2eMRjI4xrn3g5Xv?=
 =?us-ascii?Q?s5Y6IU9YyOl+u6mtc7y2G6z9l1JCMaCS/OYq4bivw/zdtuU4R43P7hHYaRfW?=
 =?us-ascii?Q?OTausB8n1hD1kxb2Vpv/AIJlncczV6Bxmzz7hDcj3r0e2E+3GILlaR3vxeh2?=
 =?us-ascii?Q?2lAu9fKhdRkT89loLdHzheEIvZ3BYmwoA+AV/NPD2VJqPs0/IAbkKKPL13Ec?=
 =?us-ascii?Q?ugbLuILfKOfj1/GKsqE5v/+kHYQCnAFYT+TsIfpMxStRw1gbqHn6EQwZiSor?=
 =?us-ascii?Q?xbfChDeVQ29TIlb8TmqMG8QnWkLChafjWPVTkKRUzgK52/4pKROXEvv0D1r1?=
 =?us-ascii?Q?sNRG0wtyYJlaA77wm0Pgj45zRlOTCbnbxROx3jgOVONEtro6BGX9iwRTwokO?=
 =?us-ascii?Q?LZc34uqBEEHrkE2N8agQQmfxSzHXgs82zntQMg7cGytMGkE6abaDwsFt1RWE?=
 =?us-ascii?Q?S+blSl9uZrhS6C/AYwYOKtY8Evkc3QgTXKHwIn+hJnnW91BOC8+qdzUHZdrw?=
 =?us-ascii?Q?cm6pWAUb053dbyTgg0I4YbfDbER2WAkZ5WEcf1pEd7x5pEiVxtyhBciI60Le?=
 =?us-ascii?Q?qXe3cJmv2e/dHpLws/gs3vgjhuRUk561uIeOZby4GTTLBtmc7vcG4JPHVXEw?=
 =?us-ascii?Q?Yzqd4w7RNICgfb29FDI1n/a/CQKK+fPOarafABN4NkGLF9KHBBrtsR/1Ehs/?=
 =?us-ascii?Q?gOAJ6ZSDvzTqdSSbtXcPzsFGuvFkgwb3bIYs2kJeWil616QtpwgrZv8URLJk?=
 =?us-ascii?Q?uc1Mdz0pPMxkNvS3PvruJ99sY8oAHzZb+392eaP1NZibSeWCJqzZMVswWlrK?=
 =?us-ascii?Q?Q7Zb6PNPM9n2Ys22uY5dcSYLXE6qPncB9skPdYqNBq9O9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?52iW+9pOuFtv0cKq5pa7L28evk5kBvwyJ5Mp4st5uf+/EjLAr9CelzYklGia?=
 =?us-ascii?Q?/je4WjhvydejaiplUe3nfo20USKDec0bAQX+C9cy939VDGBNls8npG1/uRoe?=
 =?us-ascii?Q?H2i5pl3G3XBmSvT2jZ/dnKpAOXVmrtW/5srSyzN3lR3ks02FQ3NLYLTgnzS1?=
 =?us-ascii?Q?ay1NHWS6MZ2UKLZ/4gU8U59WGelK41c04sg0VomjolJyOPaq4yoDCUWgF67Q?=
 =?us-ascii?Q?B+tiL1M642yAzE4TFTnmp5o8jjjSUdBup4wuSxT0//jjIWUlp5MN6doaTlFb?=
 =?us-ascii?Q?4OchrdfgtSszUR3mK0tEBq4pEAZCr6lnaSidl00POwYtKhwdrC51P0ZprK0U?=
 =?us-ascii?Q?aQh208SZOFbqN72B4adu2cQ9IIISOpI/ALaZgN5nw/W8NwGAaXC1h91jDlA+?=
 =?us-ascii?Q?4Erz+5tsHyxpHXEQ3B8ycU3Lr0bAOAtI0vuknHTM7T/V5PlVaSBUXx8lL+Eh?=
 =?us-ascii?Q?PGCJRZUFb5rv1gGdWpx5XCA6awwi9+MsflLzWjDVp9+vkGhebGzkXfLFgIa9?=
 =?us-ascii?Q?xr2JwdO8Zt4apDuAoybMIXvHQKjk1VJfBc+32S3KiBufDJ2d2HrK2owM9Pmp?=
 =?us-ascii?Q?UTi/fUdBvZYbpwm2N3d/U1LrwhRzehIhOJlBW6Slw/4dDn+muBgdA//1/bt+?=
 =?us-ascii?Q?kaFr2PMIt01vEhD6VY0r9biuYGvGdOlnaXKYddj3va6Z4HvpavyibHCrjKc3?=
 =?us-ascii?Q?PLg0WZY/Avp3XIKRSk7tLwKtuRgBzduBKsjd2/VshreHv8FvLpeW074UdOj/?=
 =?us-ascii?Q?Ik+JTC79tZuEIuE5SJTN3+lcQ4kadX5cvusbDDXO/C1lsTXzmDQ4dGoNPg0s?=
 =?us-ascii?Q?sF0Yo3XNhN8gtA2ucH3BZ1hj3Gp0VEgd4qi9nUuP1p8DBu89u1zXcPlA6364?=
 =?us-ascii?Q?CyTjBlMRUapb+5oQzmXYlWebvsOEdKi6nJVGfRKpfSaWiCcUsGfg8tcYvK5g?=
 =?us-ascii?Q?rkJl1rT3GWhATUSIpDXYzi2sJchKtG640ItY+iHtZ9GBL2DRV+EWBczBXUO+?=
 =?us-ascii?Q?CLwMJdGh8CQqAMXj49Ph60GNpzEuQulzJUFYl43S80RDrc+w9kn+Z6NkKy2+?=
 =?us-ascii?Q?FO00S78/EuVvfeGNEE+qkXVaexB1TD9zN6WaX83TLdZ4bPT3qfXDj0j2j+kw?=
 =?us-ascii?Q?6VcDQWBBdNNCFdViTJznWFT8nLhiF3qmVWJc5borRPMqkVkBq/KROWj9VH3e?=
 =?us-ascii?Q?xLyPT8fRiFePUMB6KnUiAJ5HvSAlKdJPpp2bNkrbhKYFOlvgC7kZ5yEBsAJl?=
 =?us-ascii?Q?XWrrjEMZ7567ZsoxoGsh3N7CQ36bKzwxTN+Bx7cJUt/Vu/b1xlwyjrG1vsar?=
 =?us-ascii?Q?hmjPfK4sSlIKk/f5g8HegyuwEAmC2CK2Yq/lquv8tcE0dgsOwz4Hu9Q8sAsF?=
 =?us-ascii?Q?6dFb1ym400kQriYMBx7/r0ImMVtNEAPR2V3iigxenuw/pgxIQPQZPKL98GPz?=
 =?us-ascii?Q?DmPh5DY7I2hYox37hXAiTha2zy+uB0Xdcws0kGYXb7gQbPRqhCJB83XfcN19?=
 =?us-ascii?Q?ETwegZQ/IMFwuxE3IhoYbhAIWmUDBlGz2zHaQy6HGbxaE2YDm07y2bdGKGLN?=
 =?us-ascii?Q?K6mxxQ3cz6zkuEMthVuRu8Wr/A5GvReykgSnHgVW?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33988e9e-bfca-486a-4a2c-08dc9ebea239
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2024 19:54:38.2960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFAAk6yfgfcBZNfZp+1L8dz3BS/efd+u2HBwpt28Cb6S5JYbks64mJY3Ry0yP02RA2KuqjX0LPskrtUhi3qd3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6431

Hi Dmitry,

On Wed, Jul 03, 2024 at 02:37:50PM -0700, Dmitry Torokhov wrote:
> In preparation to consolidating filtering and event processing in the
> input core change events() method to return number of events processed
> by it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/evdev.c | 6 ++++--
>  include/linux/input.h | 7 ++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index 05abcd45b5d4..a8ce3d140722 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -288,8 +288,8 @@ static void evdev_pass_values(struct evdev_client *client,
>  /*
>   * Pass incoming events to all connected clients.
>   */
> -static void evdev_events(struct input_handle *handle,
> -			 const struct input_value *vals, unsigned int count)
> +static unsigned int evdev_events(struct input_handle *handle,
> +				 struct input_value *vals, unsigned int count)
>  {
>  	struct evdev *evdev = handle->private;
>  	struct evdev_client *client;
> @@ -306,6 +306,8 @@ static void evdev_events(struct input_handle *handle,
>  			evdev_pass_values(client, vals, count, ev_time);
>  
>  	rcu_read_unlock();
> +
> +	return count;
>  }
>  
>  static int evdev_fasync(int fd, struct file *file, int on)
> diff --git a/include/linux/input.h b/include/linux/input.h
> index c22ac465254b..89a0be6ee0e2 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -275,7 +275,8 @@ struct input_handle;
>   *	it may not sleep
>   * @events: event sequence handler. This method is being called by
>   *	input core with interrupts disabled and dev->event_lock
> - *	spinlock held and so it may not sleep
> + *	spinlock held and so it may not sleep. The method must return
> + *	number of events passed to it.
>   * @filter: similar to @event; separates normal event handlers from
>   *	"filters".
>   * @match: called after comparing device's id with handler's id_table
> @@ -312,8 +313,8 @@ struct input_handler {
>  	void *private;
>  
>  	void (*event)(struct input_handle *handle, unsigned int type, unsigned int code, int value);
> -	void (*events)(struct input_handle *handle,
> -		       const struct input_value *vals, unsigned int count);
> +	unsigned int (*events)(struct input_handle *handle,
> +			       struct input_value *vals, unsigned int count);
>  	bool (*filter)(struct input_handle *handle, unsigned int type, unsigned int code, int value);
>  	bool (*match)(struct input_handler *handler, struct input_dev *dev);
>  	int (*connect)(struct input_handler *handler, struct input_dev *dev, const struct input_device_id *id);
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Kind regards,
Jeff LaBundy

