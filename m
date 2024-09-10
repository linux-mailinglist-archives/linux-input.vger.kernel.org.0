Return-Path: <linux-input+bounces-6398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B63973B36
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 17:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4F3A1C2379B
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 15:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4406A199920;
	Tue, 10 Sep 2024 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="tigbAKro"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2127.outbound.protection.outlook.com [40.107.244.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0B4194132;
	Tue, 10 Sep 2024 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981278; cv=fail; b=gFFdTg/EYTfHBPhoalqbLQZWSsh09cGVgjJpjvED7O6mwR21QjvVS5t5nTWRhSq6FqWNnLseHnYf3ERm4ta7yz37QQPFjGd14N1RgeW4wB4yEanubcWmDQch6nD9rX5KZUoJ0FOn+c3A4MN1n98mQziw5njgOb6M2/5soMpK8ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981278; c=relaxed/simple;
	bh=TZvCODCr/Gr8kNv3ElrxvM7+QOmuNBjkbqShx8HxEEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lcilTkk2VFCAlgXjQWcyCh8+HE1QoUiw//bSi2sp01gR34X9YB46zT/C6LMfejsZTSPNZRWmWv+KYSOJI/1CCXPYvVjNKmEbn7oElx3QCohukM9I+OfulyVf4lybqHSP0JqifU25FXZ4cRpLWvWta528qrvTssSwffi7ob/mcMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=tigbAKro; arc=fail smtp.client-ip=40.107.244.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EINAw1iIoLnW5xGm5z1xuNQvDtO0MCzPxHzcU/qDvZOVA/qtvt4G7avFghZnxKbEhcFxgYEXQTemeaIuBXdYayEBcf8glYEOudT1f+33G+nzJ36UJiDpUfAcq9OIP06QoPt0XjTyyp3MPcS1C5wuUSPGEOliDFeQh9sRiDc3JwPXsOw6rHeLPxyewcyfqGB5KYiQqVhmiN3foLEsI99DIMkqaz9LMmoB6rxsRmzCIunTD6nCUzDy38phM0JOVvteqB9SSnLkbRhU1GK3huxqEdwOV5k4uUHHzLB/ZKtlkzt/rTf1OsDpYdnNAJICT3O6r2SHUFGru7cvJuDar7/Cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1VukD5n/Yg0GKakVbknoKHiq47RR6vWVqcu8W/Jvko=;
 b=hN3jQTop15vT997Xg2CFzuiXDfXzMGFu0G/mGdEqm0ElSiXZKPlfFAypp5Zbc3UZvYFdl7FrzpNX0svf5GKBKh6ZtbdJgISP3Z1tenE0sQb9zHO11qlDBXUozckWXRbTei4WLoyOytBlXB+yfkFBx7uyh4isjvuogCcUpNIJmhiV3OTe9EvQN4qsW7LNdV0UNvE0ajUNQHN6cktGtRbD+XC2nWh4s+Uh7JUZuyWhXRLJRQZcTZ+o/3DkcniY5VWQuYAbEqzRk9fz3S72zo8KkQhfDnNM4et725bfKvhCfmGus8m3aCP3PjqO3H9P8vj2vig7u19nhwhYAfUtMoGzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1VukD5n/Yg0GKakVbknoKHiq47RR6vWVqcu8W/Jvko=;
 b=tigbAKro/FF3gHC19PC+bpa3iB/sJ4n52EzZKP1aiCcBYjutbn5FdfdwkNaCBf91dPHydWCtZD+06FMlvtV9XTNa+zWnnA0ImRFYbTA8KOkiPnagxehEhKdiSg74uDxq0ubEUEUX8UWB3tXIfRRNU6zdrYNtbQO2XhZFQZSCWQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by SJ0PR08MB6445.namprd08.prod.outlook.com (2603:10b6:a03:2d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 15:14:35 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 15:14:35 +0000
Date: Tue, 10 Sep 2024 10:14:32 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/22] Input: iqs7222 - use cleanup facility for fwnodes
Message-ID: <ZuBiWE5lQfwg5PJs@nixie71>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
 <Zt49WnZBar2D822M@nixie71>
 <Zt5QnS_eM9xt8XNa@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt5QnS_eM9xt8XNa@google.com>
X-ClientProxiedBy: CH0P221CA0046.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::19) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|SJ0PR08MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: d84f2426-bc0d-4762-d9ef-08dcd1ab479c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yenEcAmm3hrjmoSEk9Csw1X3eRY4pCQWYy5T46Ww84O3A2SYRApz+nVY1g0C?=
 =?us-ascii?Q?KEr+UsdwnQWi/bHDwWb8MoenHEYrtpBwt56f1GPGhoBue6Lmr2H//zSqLSF2?=
 =?us-ascii?Q?H61BZQFAPE3pqWA7WGMz5X1FQNieJ9E68Kv+cGO9QBS9MV6RKRvui+lO4+cZ?=
 =?us-ascii?Q?5WNxTgpXY1JLxZOfy8CYLPTlFTVYHfvo/ss4swr00MCHVaMVaVzMB3ORPvdj?=
 =?us-ascii?Q?LcuWyT6ZeSy/Oqg0iqqkoGaseCXoiynNVuWt1/srDp3fszipz2AcxiTWZpOD?=
 =?us-ascii?Q?etx5kGdetf6uWiJZFw7tf3/1ZkKP2ncLXQgcMcHfqFFg8uTtyJwqAWMmk7uI?=
 =?us-ascii?Q?rkgbdG07qFds4xkIeOh5r5vkUT18SbtTUv3xviEmREWVt6X1GTPz31ErOD6W?=
 =?us-ascii?Q?qo5T6PDgXMWidOM2oFvSDrTGexoRnwCWbQK+0mDTEeLWf11g9QeSok6UxSi1?=
 =?us-ascii?Q?qpp+CZ90i11OX2EVYLkGgydU1iN0uSzlvtmOwowt5B0bNBL4bFC6efixOKXv?=
 =?us-ascii?Q?yAPqBca2gbFkk7t+unQPFfeW8BKTj5REq9ZnoJd4+8kpV+2ZnSZBDVWzJzm9?=
 =?us-ascii?Q?14408IXsg5iA2aLz8G9uBulYguLbwVC069zqAb0SfCxXUC3hAhsi2HFN5ULk?=
 =?us-ascii?Q?ihLeZcooq7zWum/uDbShewFe50FYOH0MPhBL0BLp8jSiY3BTrWv2m0GqJKTG?=
 =?us-ascii?Q?Q6lqS1tfyTnc3bVRwXU6vsG1wylK5jg1APyxL982b0w0uEInOTmBJ12LuF5h?=
 =?us-ascii?Q?YSuF1uJ/qEYfzz3vu/1QfHikR90lIZYjdrrG4UX4aa+GFv+Zwohh+vyjdQpj?=
 =?us-ascii?Q?xXi8ANQsHwTFwiq1uqMa74NkEBXZrzOzVg7z/uoZoZoWLYYUxqJ1UiD9FAwg?=
 =?us-ascii?Q?cgepDZXCy/Cwi7PexkzQZvaqKt0RGS5mVknY1x/mWlXHX7ckUPoI1lj010Mx?=
 =?us-ascii?Q?aSv/sXVyBdaUvvRNlgV2K+vZ4YlopVBaiGhgu9exGhb+uo6LLtXQSGTbmjxE?=
 =?us-ascii?Q?chv2WJNFw+/xyl8uXPS7Z0TTL5rNbRDZdPAcYYnJz5PzgLVVAgfJ4c2bY//5?=
 =?us-ascii?Q?JjQpZ4z4eNM9QPper3Za5lR3kZcyfr+xNVCVFoBfpNK7/PDIOO1l8lenNNWl?=
 =?us-ascii?Q?GdKfP01r0XuvxCgwIZArGY2tF+r5k2Q1+TbJ4i/YofS0Vh/h3q1TDA+50C0Z?=
 =?us-ascii?Q?CgGrNLCs+tghYDwYSke5ieTBYYbntoqX6l3agNFM9uz05WDz5q+lKu7pzkMK?=
 =?us-ascii?Q?m5XUHtuBtTOLE24MpbJ5drrm288HyTSNPCVgXIT38ytybwUbfM8MLVNWRurf?=
 =?us-ascii?Q?8cu9vAUdm3d8RQMcIPKTIQ4IRuACYJiTaiR/F6EMof9J6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6eEnFkTKpwDdpFF+E/XKIY2amp9A1MIt1GN2kUIWrrQWl4q+Fxc6Skcke6EF?=
 =?us-ascii?Q?xLK+XzAEcAJOMIMnBlmdLqHwKuVY90RslAGfJm7P2mqslfW8RLdV2NC4QMuv?=
 =?us-ascii?Q?k2MEaGX3vftoFIChALf+IhR4nP8O6uXin0DV0bQ/Qgl6JTklgC6mRER4s4se?=
 =?us-ascii?Q?vcGj9rBhFOKiIaUEpRYJfltzVZckrAmpm1JByLwsFlSZuSaRzfU3giT2ejZC?=
 =?us-ascii?Q?Fa+MWeCTrzMab8uGJp+tLKZwjdCkGLbDMet/E4YKrlRcIahP1zvg3yD97s+F?=
 =?us-ascii?Q?7uLBGZX93w7QVMQT/itSxUSLKz4FqnEJIHsO1pnAXw7iyyS1hfzFXDYg+3R7?=
 =?us-ascii?Q?nVPIzvkjw+toh3az0aZofUwGtIJn5CvY++t7E1E6k8HH38cZ4Xg4xPmmY4sY?=
 =?us-ascii?Q?ibAN3IFa/Tl+Yey9xY4FoV3ZGuOALC3axwgx8P5uG8z5U3i0C8SJx2CAPx9s?=
 =?us-ascii?Q?cQmEQQjAghu/Tq3EobNKi+F/2DVJji2ToXUpXSWXWQqy6UNpuL0hItCQgQlG?=
 =?us-ascii?Q?+kZvPy8odlh01495SIUa6ZAgBh/zRoaZSkG/OtNaPjWW0ncPwwqHYnglSWwY?=
 =?us-ascii?Q?EVeWCJYNN16B2pdlQyM9S3drPsPmHkNyheHV7qekC4uBPBPQ7LIymK1EGeCL?=
 =?us-ascii?Q?1wEFv6sd4PZzjKjRlv+pE5GkJpTmblUP2ltdgLV0w/9nfLlgwt7NuV477abq?=
 =?us-ascii?Q?vftcShmkeS9o9zUIjpBrjNlkVcKV0R/PCVbFNlPEkBF2piHOlh3ctRth4wit?=
 =?us-ascii?Q?UUrjA6D4W/uYMFHngRbju0Xdk2ZOcEP286PXtCg7rYw2bkRBvcD4ms9s5xuK?=
 =?us-ascii?Q?4i7OPtAk10fNaJQR0JHXyD4dfbOm9ApU9yRoGtaTk7VcENAhQndduHaQz3qg?=
 =?us-ascii?Q?4Pd7E9GlxWkih801WRPbFTSpCBCPEY29hjxhTglUjYhDz+SZ23OF+ssJF60T?=
 =?us-ascii?Q?vM52hWDQv3sIdXdFex0Be8s3sEey323LMewhY+6+tC9uMsDahaaL8ZEZa+pM?=
 =?us-ascii?Q?+8+MLfDZD+hycvgbWbT36eQCH9EQhlQg3OZ271kjOvOYzNCGsR/1TC5PXJer?=
 =?us-ascii?Q?lwyq6+mDy06iw259biLurisRhctWemnQkPjsuLb5U07YAZJbsEid+ZrkiBJN?=
 =?us-ascii?Q?iOC3DyDDeP0OwOTZmo/dGKR+QnOQMkRzeCubGDo96rR3+BS+dA/AiZQNDYXZ?=
 =?us-ascii?Q?U2xyDW7GjXAXlQwth0f0AXt7SYKmPbiZD8NYbUy1Ww9LTqyB+4rqx0E6qjzh?=
 =?us-ascii?Q?2mfNU/+HPdhcNaj0QsSCQEythioaL3QepYgD66mW/VBEZnhPaCK9TrKyy0H5?=
 =?us-ascii?Q?4xtGeRQECtTNWACGXaYjbqzzxB5Lt2Wtsm6UTaKhejEJZPmW2w9SReAnQb4Q?=
 =?us-ascii?Q?sir1JRX2eL4nraaPIaPTPr5Cu1HbxHwgBSIqxQNRG8po4gdsSLhmqDNb6Lwk?=
 =?us-ascii?Q?QmSb8UjV4XMc4R1evqcdsb0OC0WdPzcnwL9XrL09Rt5yJ5AHFG4fe7yGUqe4?=
 =?us-ascii?Q?uw6qWM/YFoPBIsWo18HHXcxBrsZY1pjVnC4n1jeWszymYzb1Ls/1K5fnpXk4?=
 =?us-ascii?Q?3P8MljLlDz85/WT+yZt4aaeI/vcmseaS0+21Axi+?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84f2426-bc0d-4762-d9ef-08dcd1ab479c
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:14:35.2048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2geqLySi4PURszjGeC7KrTP9VpzXy8RrfbbyiQinh/MR37LnaXrvja72fgIoGAZbB1JJKlOku8D18gNDHAf8gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6445

Hi Dmitry,

On Sun, Sep 08, 2024 at 06:34:21PM -0700, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Sun, Sep 08, 2024 at 07:12:10PM -0500, Jeff LaBundy wrote:
> > Hi Dmitry,
> > 
> > On Tue, Sep 03, 2024 at 09:48:25PM -0700, Dmitry Torokhov wrote:
> > > Use __free(fwnode_handle) cleanup facility to ensure that references to
> > > acquired fwnodes are dropped at appropriate times automatically.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/input/misc/iqs7222.c | 30 ++++++++++++++----------------
> > >  1 file changed, 14 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> > > index 9ca5a743f19f..d9b87606ff7a 100644
> > > --- a/drivers/input/misc/iqs7222.c
> > > +++ b/drivers/input/misc/iqs7222.c
> > > @@ -2385,9 +2385,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
> > >  	for (i = 0; i < ARRAY_SIZE(iqs7222_kp_events); i++) {
> > >  		const char *event_name = iqs7222_kp_events[i].name;
> > >  		u16 event_enable = iqs7222_kp_events[i].enable;
> > > -		struct fwnode_handle *event_node;
> > >  
> > > -		event_node = fwnode_get_named_child_node(chan_node, event_name);
> > > +		struct fwnode_handle *event_node __free(fwnode_handle) =
> > > +			fwnode_get_named_child_node(chan_node, event_name);
> > 
> > This leaves a newline amongst the declarations, but not in between the
> > declarations and code. I don't feel strongly against this, but it's
> > opposite of what I understand to be more common; please let me know in
> > case I have misunderstood. This comment applies to the other chunks as
> > well.
> 
> Right, so this is actually combining declaration and initialization case
> that I mentioned in the other email, and it is closer in spirit to the
> code and the allocation check below. That is why it is separated from
> the declaration block.

Thanks again for the background information; please feel free to add:

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy

