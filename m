Return-Path: <linux-input+bounces-8604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14A9F3616
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 17:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C67516355B
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 16:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6122014E2CD;
	Mon, 16 Dec 2024 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C2SkfmDI"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4E146A71;
	Mon, 16 Dec 2024 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366627; cv=fail; b=ahKpCP4cGUrLHqqwdfYn4TZXfSu8qKOpgI2kMHD4l0mnMO7x46XhkoISAmA+PzgSfqYUcA0aXdL37j2lgEybsmUlUnJxVihwe8pR+2uZG7YWvWmvuPCXRRmT0MCnEvrXInC5Ry/mfwjBqzuzLQFLzCrM/bQa3KDle2sbJhEiR+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366627; c=relaxed/simple;
	bh=phBtBYx6FCg6fBCurb3IpSz3y850q84SP2llom8fHzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nj78YH11rc/QPLAYWo1jyajCRclknGDlGTrZGXMpi6e0bpvNEcXl3cQtIt1nsAEM7SzDQ5op+EsAOAhepH7cO8qyVXN//0m254YfxLaT88wpE1Z3NYLOypUBskkWCUnfe/EC2c0Y1KxZulPnzAufUbS5LekeZvdWfFbz+srmwDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C2SkfmDI reason="signature verification failed"; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7+uohKTVojbN5q229Aa55+dQB7oy2axeHiQWc5z+0Dd/+vRGQEjwSjjYpH3Dd7tqYSiSNofH3Gy2XgZ3pWmUg+ZjzTtsk/5ULh1guR+K0AxwWkVjwKfcAggRzeaCNPm6dE7XfHWnLQtZM3yPGF/GpAcIwBfiyS6yuQA8U8tkBm3CccM9M/qohcklkrMzGh9pbaB1eLlAlBDhXPqdiFqZ9T7EIELW6Qu91SQB5rw7AjQ9bFknrzmhHJKstnemgK+CgeQNQBr4bUhNyF5o5YLijVQeBWABpR5gqelWCUv/ZfHeauhBciMzVI+TLqbMEj06R4qUkUmpNnPDJPg5O9A7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=himkjyOm6tteYL5m8nFvrTLGkZ0eptMlhesDcwxsr4U=;
 b=BaR+LdjckseugophneuonfEijU3vQ+mONM87QIYY0Z2YvBnlvM29JBq2SclNdvSkNRYrd13IoSfqSkue5xaY2sx1fIbaQeFOgUL0TcOiPPbcoGFGTNsJg0kGFj11VQ/dj4Sj0YyKM5R0MBi9/zgfhDXMM3enVVdKUQPycx72hEbKPyVaPWIL/1ZdW09f9DDhYOsNssBAisbXF9O4uNkFp0jLjp7swPjFzlAbJTuk5JphwKAtITfKPK7eQFkabfWNXzQlAQUas+4s+1xPVvOjzdR6ckHHQBjFu19Q/X9qXKaQtlEZmhhjWireWdv/jdISR1+MSOCdbqV/ax+5n815NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=himkjyOm6tteYL5m8nFvrTLGkZ0eptMlhesDcwxsr4U=;
 b=C2SkfmDIJM0ON9K7nfl/CfNnwdAbk4V0jFDxgSaCxUxRlWtrh2F9peTJc92aiDji4G6UkPYGlYVJ4SmTnU3eZoxH6YAurJG4bJ1Fmclg/8iCBW3AvPar0BoNFNwJGPtVjMz9gIpFQzdLIq1aNej1UG2DTN2EcR8xhPu+2D3we30jvMXMWi1jbSVKq7nXTAgPlMiRRqxR6WSLiIirM3V9JlRgQGoFbiiHAYt8KdNwy9D92MpQdBdcmiw005z2qt3QujU2n3c4w8WBSzUFd+VXGK60SrP8O/rjCAuWN+chi6eejtAOyhJA5vFTpTELmhbwVbRwyuGvHr8TaMiPhbLqQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9491.eurprd04.prod.outlook.com (2603:10a6:102:2c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 16:30:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Mon, 16 Dec 2024
 16:30:22 +0000
Date: Mon, 16 Dec 2024 11:30:15 -0500
From: Frank Li <Frank.li@nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Luwei Zhou <b45643@freescale.com>,
	Vipul Kumar <vipul_kumar@mentor.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: mma8450: Add chip ID check in probe
Message-ID: <Z2BVlyV8o1dkBUq2@lizhi-Precision-Tower-5810>
References: <20241213222310.189443-1-Frank.Li@nxp.com>
 <bzzzezoon5u5pufpbkn3fnm2dtbrzatx4w4tbdstcdmowvfzzn@cplbmxtgmu6z>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bzzzezoon5u5pufpbkn3fnm2dtbrzatx4w4tbdstcdmowvfzzn@cplbmxtgmu6z>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ffc65e-b3e6-4aef-dd63-08dd1deeefc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?xt8cKzphF98eDXBpT3lFPUqetD/XLUWRf9EujG1HYiNSXB0lE+iYJZWL7h?=
 =?iso-8859-1?Q?qBTJ03HPhxdUSFSkCSmg5VsqYKQJwH1ueSAmGWGPLtVQSVrfTznjvSe5n6?=
 =?iso-8859-1?Q?MzD8oLZ0ygs7ztSlyOXIkN9+krTlYFBJR1fuK0Ugyf6TQVcwtAVFjf6nu0?=
 =?iso-8859-1?Q?QwlejDMWUWxBzhFq0oaJ4EoHDm1Bw9ab6k1aQPEdSbhToacTR5MF/qrDq9?=
 =?iso-8859-1?Q?vpp1meXzBtghNSunMk7Y7xY2LtrcmONN25falvezhpRoMNLWXNwNiv/jhm?=
 =?iso-8859-1?Q?S3dddjGyydTbRgEqks6x+qkTuc5wOrneg4N62WBrrIqbzWmdVuCH8anyPt?=
 =?iso-8859-1?Q?NdrI2aHqB1doRETtrH6vrxe3jDDKE339HOIA6/JUo8WHHcfntD0Q6scizu?=
 =?iso-8859-1?Q?vcJ4NfNtDpjXjeWM55uWFtc5myhgeZGsyEZWwW+CevHkK1C/0rqzJS/+ti?=
 =?iso-8859-1?Q?m09q9ZbPl08/GvoblH/SIMRlpMzA1FAI8NiZ7MY9t0TpuuJ7NA7J5KRx27?=
 =?iso-8859-1?Q?rEVm/w7JsTOON6zJc1XDJ389EmJwQQ7qPYtwtVnmQ+RL+HdslYQJZK07c5?=
 =?iso-8859-1?Q?ZLUHFdVcA31w1JHNjN/DKRVTG64IPROknwvwtMqRCpF3yuYnResPHDBMz2?=
 =?iso-8859-1?Q?m3Tr5tw2mPkC5u/f3cNKOpn07bmpzZn5mZyq7JYV4fJfGYcuV+htZxPjt0?=
 =?iso-8859-1?Q?OT1qc7BOraRoawdvxv2ySIZ00l9LpyL8+iBJ6P0EkIqucKbtjys+olilUU?=
 =?iso-8859-1?Q?rnVOliuQPZkxBD9pIsoj3BWTyQYz10l6/yaO1+bGxghIVI04KwyU1kBAew?=
 =?iso-8859-1?Q?eLKKmRoTdCzzTPe6n0AL9k2JyOIbhbja07MBuugNT1Yz1RRXC/dbH5gJrV?=
 =?iso-8859-1?Q?qAQV3UaK6q4GPAkcP7jOAQrENXvxdhm+wtpXhL51HxWMqOonhgGweDuhNQ?=
 =?iso-8859-1?Q?J8RFn1X0qJGvB5LCig2wMMRuQe1xEmHNGuoirwS+nviU84I4CZWT59DM32?=
 =?iso-8859-1?Q?zrmsofvYpj53sgLYRC2mU4eQKLlob+iY7yAM9deNVQ8RQMdvR6t+ebLwkq?=
 =?iso-8859-1?Q?Gnmrnwd/tyeQNpu0Ba7ZvgNaqM5oJn+Kt6q9N4uLZddLyf/I8VqSCBfTei?=
 =?iso-8859-1?Q?8C6WxWaGi+RJ2YIYdKYFrSWr5RCx6JjY2ljtrgaM+j3j3gauE80j3xG5MJ?=
 =?iso-8859-1?Q?Hih1mgI3Js096ZjhJzt2zfY74PaHFG7XG/sBxXUs2kxZAjux9tmNAxytu7?=
 =?iso-8859-1?Q?SgkpuUvDerFBubHjp//B16j/5gFnhtnYB2kZEjzqzmuyo02fkfNyhLyfu4?=
 =?iso-8859-1?Q?NsoMEADFBkMMUyvtilN8RQ/QdJdwpQ9uZkluTwlACMicW4wsXLJOFnmujU?=
 =?iso-8859-1?Q?Q1kdWE+FKK+Y8QhPekIHaXqoddwx/B1lI0R1LJ92rd9Q1Mo4smkuI5Aogo?=
 =?iso-8859-1?Q?oCanBHikWSJ2l9KOw08oQqMb5hDXstjBLTLA2XlHFlcWWTkG7zvGkRFQpL?=
 =?iso-8859-1?Q?072mG/gbx2baFI44A9egoj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/paZSLGUiCprZAWHchEndtwmPi0YHlrE8hODa0Bsd3QUDUdnSG9Gc+XyaU?=
 =?iso-8859-1?Q?KSd1NW6e/AZy0vfkGH15sq0dd9U87xV4LGRXVG9P1FQLTOhqJ7dT8K2Nrk?=
 =?iso-8859-1?Q?9c5RIfU7w0TaqbuhI81hcPPmgyikST7A3SrWYxigU7ByQ4Te3T3KdQiuLm?=
 =?iso-8859-1?Q?laK/DTeAQtPMeFMxFMJXhnHT2mZ1a/JAt21/KIKKrpR9nb/G7FD9xpMKSg?=
 =?iso-8859-1?Q?cmbf7AFUFIzZ1OsDTxehqDHV/zuxhNitaQudHj4R6NSsRmZKgLwLEtj6a7?=
 =?iso-8859-1?Q?ad8dE9C/jkcIrc9tpcJ6C7BB+LzD0VwWOAVc3aiVMhGGMtQNvGvwYrIwGy?=
 =?iso-8859-1?Q?Tjwdu826DpMtz1M0ScV/g0sTO9q/iI1pXwUDKm8tiI7gm93WLf00jo+rne?=
 =?iso-8859-1?Q?pxsShfXutqUHMjhB9cICDhamkd7PjUsWKSIqnUw+lI4v3X2F2EyPZFI1Ik?=
 =?iso-8859-1?Q?/Up9Kk74WwdzUFS3/Rw53DFV2VpnTWwVJ/HxvRUlUpnXSfE4rFmJelH8au?=
 =?iso-8859-1?Q?82nuNFY4Ap/bWUXZeu6/ymKb/yo0+iQmN668mhLbyvZ+SM0UQgVFjxsecu?=
 =?iso-8859-1?Q?LRX7T3BOBYNlcyyUZDUK9fnNISstKTiUfyf2V1FlftAu8Fdgm12QV1rJZH?=
 =?iso-8859-1?Q?77jWu2kZjHIJijI4zYDsb4YMKcYoHuEIYj9R92Ee9OG5a16oEXDKopZkIb?=
 =?iso-8859-1?Q?CQ5VEYw2iALT03R/T20YYK2Ff7M2mFIqjDVuK//OGteZAi7VJnJnNPtYm5?=
 =?iso-8859-1?Q?JQ8hEIZVxoRoe34n0fIWghUyiOggvqwTPn5VcwKBpaTxPAMQrYqNpIPlhR?=
 =?iso-8859-1?Q?BhQ0RU8QGM+HNeVyHq3h2S5SYu56PE+T3m6LV3XipciQHN/BGVysXykNVY?=
 =?iso-8859-1?Q?r0xJtBqakrff8OPoynbhI0Q2F3QvoYdpC/FSvIds4vPcCu7gI+V7r8Xj8O?=
 =?iso-8859-1?Q?oym5iFu/hXezXlFJ5k0qYSumvL+Ep56YzW08gaZOQjIY31PJgQCAuvzrMB?=
 =?iso-8859-1?Q?d3mULH9kquSSGasV/2J6PP3MUA0jsbLN/h6xqe+BcJF3gdhPuUAyMrAu2Z?=
 =?iso-8859-1?Q?TceWwdZITEDT5/2DOwESkJRs0JmBynLoBNktuyVZ6Ydh+q0bw19A/0JTvN?=
 =?iso-8859-1?Q?Jvrbo1VOlpSPqV1EfZSROxSYh1fo4KTHVLbtbe/U4ZgrXaqc1tyKIDRge1?=
 =?iso-8859-1?Q?cb9A2jMGteZ265F8tsw8da1fTT1vqT0KtXsZZK4jaxzIQxdJYOlqlzvLKW?=
 =?iso-8859-1?Q?4BATKWjavc5I8HkNcfj24UGNS14ec/5hyn2EqNPJr/VBSavhyT25zekBoj?=
 =?iso-8859-1?Q?Xb5WMo4Yt+4u3fHg5jMC1XWm/Rr4RfEpkRM/vwHth7mT9FYsEJylfX0hSP?=
 =?iso-8859-1?Q?rWYhjwVebO/ZmxZxkVgn8a12u82JnVtDA0WMRSIgKiJvew/jlLdh+PumBO?=
 =?iso-8859-1?Q?pkJCUyrwN65pbV678JkS1fZJKqFYSOgeJ1wpzk/X+k6DlOo2BRqyBzypfQ?=
 =?iso-8859-1?Q?9DwdP2dhuR4p289HEJ+sv4PTjdIub4iESsLiHBEOHXTjA/kNS7xMetc+4W?=
 =?iso-8859-1?Q?4sw10SiqqvYtPWeN5nnwTPgk3KxfThO983E9RTcpPCvJ5/4w8llDzW3Ebc?=
 =?iso-8859-1?Q?TTYivZ8d/Fm6+KVFAHLL6GIRruC9VDURO7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ffc65e-b3e6-4aef-dd63-08dd1deeefc7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 16:30:22.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJO/DyhZ2gFO3lu8MJowcyYlvBu6RzqNskVYokl0XMCRHU0mc3i62npYIfn0phg6wOt/D6f8Frl/mi3tkIx9gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9491

On Sat, Dec 14, 2024 at 12:02:56AM +0100, Uwe Kleine-König wrote:
> Hello Frank,
>
> On Fri, Dec 13, 2024 at 05:23:09PM -0500, Frank Li wrote:
> > From: Luwei Zhou <b45643@freescale.com>
> >
> > Prevent continuous polling error logs by adding a chip ID check in the
> > probe  function. This ensures the driver only proceeds when the mma8450 is
> > present, avoiding issues in scenarios like missing add-on cards.
> >
> > Signed-off-by: Luwei Zhou <b45643@freescale.com>
> > Signed-off-by: Fugang Duan <B38611@freescale.com>
> > Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/input/misc/mma8450.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
> > index 08412239b8e69..da941748ed29b 100644
> > --- a/drivers/input/misc/mma8450.c
> > +++ b/drivers/input/misc/mma8450.c
> > @@ -38,6 +38,8 @@
> >
> >  #define MMA8450_CTRL_REG1	0x38
> >  #define MMA8450_CTRL_REG2	0x39
> > +#define MMA8450_ID		0xc6
> > +#define MMA8450_WHO_AM_I	0x0f
> >
> >  static int mma8450_read(struct i2c_client *c, unsigned int off)
> >  {
> > @@ -148,8 +150,20 @@ static void mma8450_close(struct input_dev *input)
> >   */
> >  static int mma8450_probe(struct i2c_client *c)
> >  {
> > +	struct i2c_adapter *adapter = to_i2c_adapter(c->dev.parent);
>
> +	struct i2c_adapter *adapter = c->adapter;
>
> >  	struct input_dev *input;
> > -	int err;
> > +	int err, client_id;
> > +
> > +	err = i2c_check_functionality(adapter,
> > +				      I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
> > +	if (!err)
> > +		return err;
>
> How unusual. I would have expected no ! here.

yes, it should be better

	if (!i2c_check_functionality())
		....

i2c_check_functionality() return 1 if adapter supports everything we need.

Frank

>
> > +	client_id = i2c_smbus_read_byte_data(c, MMA8450_WHO_AM_I);
> > +	if (client_id != MMA8450_ID)
> > +		return dev_err_probe(&c->dev, -EINVAL,
> > +				     "read chip ID 0x%x is not equal to 0x%x!\n",
> > +				     client_id, MMA8450_ID);
>
> Given that here you emit an error message, maybe add an error message
> above, too?
>
> >  	input = devm_input_allocate_device(&c->dev);
> >  	if (!input)
>
> Best regards
> Uwe



