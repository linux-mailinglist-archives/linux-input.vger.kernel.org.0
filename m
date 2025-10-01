Return-Path: <linux-input+bounces-15194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8746BB1DB9
	for <lists+linux-input@lfdr.de>; Wed, 01 Oct 2025 23:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A44F57A3B6C
	for <lists+linux-input@lfdr.de>; Wed,  1 Oct 2025 21:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5F828643C;
	Wed,  1 Oct 2025 21:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PPgiFeVa"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6991C28E;
	Wed,  1 Oct 2025 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354474; cv=fail; b=rU982swmbHXX514FnOLXybRqfCodMT2W7TQzJbxCh3lPaofitWpSZaheDI2UwcvUmO3fnOBB3mlA4DgWLf7ai/dgbu0c23iMHrO+8lvnIYI2FEItUZn4WybfoUJqYjAKWmqw/r5YVZSz1mWJJ1E62MyNBiKx/NnB4y+fATm6qaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354474; c=relaxed/simple;
	bh=JmXE1VlivU1nI9rhuxZ7PTA0xYWHxLctLnIRrbpH1EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nHQL1oWK4EEf2N2SaT9bbu35DFKbGsy3PmHhGWuGL5NpW6IzaiHWj+jIf3XNLmDqLh2VvpXHXxl9kbnbJSFejONOtnUCApNiMnt0cWlWQYkQ6rO3/9d7oLsfcJYw29wacaUdOpuIJg45eo3ATaKBxxrIJV8qKlVWjVvKRAz5abc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PPgiFeVa; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgm5WecqA2XZSZoCwvE8NKYXsPiw6x9js8MKJmNLrY3rmLqqN3l/CIsH99dNaQH2pCMOJTOVN2rn2xrAxCRVQ/BEfGHV3IxBEvXmSWyySSEpO8CaWbSq+NSVS3ZRyCsErydT5wpqJ5pnLDT9lkSgsheB8GiGF7aNkPtgaTVJvKNnlrhqYw714BFVnPl1wOWs9Yf3eeIZi07tlyl+7CLR1PImIQsTNK2wmBMAER+aimlsPztIPSOoMtkib/JwF4uqrQ9DY1yY/d9o1tZg/sSlY6RRvXGc7QNd39c0ofdJqXi51Kqs+05nkyoyFUf4bu5fJ+STM3tQcgPZKgduSgclig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9KKfxs2c5+6GLiOup9HlarQumi2jiuh5Z3qahKQeFs=;
 b=K1zF+cMuUfCgHlaz+P4p+lM+B57Xn0KJpbzoxWLIcN+wwnpvSNKIq/G8S8XSJme67ZY2RDtm6TrNy7/PgxVhovooT0WhT+xrDufz/FxtcJKxQRvr+SNjS9SZ+crs9WAvNlP9o1y/mieHccsh9ZjxlVHy1IoGVdpPHM0LG5IereGJ2x4xETmxYaJ8iReqXt5Yke6kOUKxjxbZX5KgupVAivskt2F3bOGb8gOHp9KjvShpwYMWiRTODCRpxaNIcD7pK/Xg+pJlgfYU+L4u3ke2Nm9eUVNMnnfTDNlOvySf82lFjybPQxJSywE0kurD3J5KRhyMDNv2qPR7GDDqTzysYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9KKfxs2c5+6GLiOup9HlarQumi2jiuh5Z3qahKQeFs=;
 b=PPgiFeVao/BTLJ/TmxS8VWc5djUjzmuLOzJwXNbt3RcCzxgLE55zoAF5eNaf2o/sZDH+cUHzR5VOL+7R0YiuLaq7fM/aVA5pT60056lqZF2YzToHNIkpnYV9ZXRDt7uK3SmPnCECWqrBp5B9mdNpERjT/6jiXg9utms4IiOjsjBSJbnEvhP6VOCZKQ9SN/JSXoi2d4F2DRYcY8oW72156f+OnLly9vQ0ZaVMZ4Q1rWuzXugl1NApbCNu0wG/1OZhQQxyjQI1+bsSgAwG5e/ThwL4lZ+aGDI4/41w2bmEnz6bLpaXE2cYn9eCCmhlSQV6HqvHFJFBjz3LXpVksxaaXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI1PR04MB6829.eurprd04.prod.outlook.com (2603:10a6:803:13b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 21:34:26 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 21:34:26 +0000
Date: Wed, 1 Oct 2025 17:34:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dt-bindings: touchscreen: move ar1021.txt to
 trivial-touch.yaml
Message-ID: <aN2eWrTWsonkchJT@lizhi-Precision-Tower-5810>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
 <20250926184720.391335-2-Frank.Li@nxp.com>
 <20250930-venomous-tracing-669be2e1163b@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-venomous-tracing-669be2e1163b@spud>
X-ClientProxiedBy: BYAPR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:a03:114::17) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI1PR04MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd9d85f-dc5e-4e0f-8f7b-08de01324bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F5uQt/mIKL91ZhlQ9YkWSHZWRv/ebguEHDxSwCK6qixogEMaU41+2VOXp5Y6?=
 =?us-ascii?Q?nW7iYXnLnnIzftw+5NHXVblZL+NLny3SZNnPswZgmFMnys0Xgc+wl4td7SIk?=
 =?us-ascii?Q?J1SguRosMvg4ieMD4b0nnf0UGhL/Hl9hfQGoRj0/WD79hUGRkD8jilgfF51j?=
 =?us-ascii?Q?CkoCZDQjwOuOI8OMFzaRZW9Zq7EER1mRM5wngNXqcWmdMbEayAYkoHxjBDU3?=
 =?us-ascii?Q?NOA0aGW7DQRr48/QrxH+N6CFnj2nEVyThB/PwcoEQZkGNhPm33LetYqIZtxG?=
 =?us-ascii?Q?EXUSmRoY4wOHuvxZDtTZxwSAnc9frt2zhuXuU1OeL17jKTbSr2lJ91g/U352?=
 =?us-ascii?Q?l+wgfaY/6leeU48GE1dfcdpozrMaC7Z54pvBhPhkWLMDbdA2YiVfJAi1uB8v?=
 =?us-ascii?Q?n83P+1ekZ6lLtwLC/SRXyRXj4vfnlTzK94A5WTc7d6hRazArzmXq8BmpujDa?=
 =?us-ascii?Q?sXXtubNAe2uOTu5ssFbDxB8+W4PobSywQzLsLxjyH7gyX+vL1dNrzlDqib9z?=
 =?us-ascii?Q?Zvp7dw4Dv2i8dBCj4XP9MrexPfTqu/9BCXyn0+w3E2oSt2BfIHmaG3QH0b4X?=
 =?us-ascii?Q?Cep9JGAyS4dAjDvaGL2njYDjEoqeqhhu4fH9BEaesUQAENTZqoaJiYZjkHK9?=
 =?us-ascii?Q?tRkz20QUF4oLwGiZyDt1CGsBsomOsV+RRnOv+8hAwxEwXZ8o1ev5F95WWUDl?=
 =?us-ascii?Q?AvCxnaG1rLcIivNbzSDGZcrEQZb2vxqDfPENKTq2/FHWD7WVDwp+URVbH21z?=
 =?us-ascii?Q?Y1wkQHJaTcvnYvQkoI48VvhLNWJ+R6Pv1CvDjZ0K22sscC3IRGy9hBRWUMwk?=
 =?us-ascii?Q?QmEB3mgCfk1dr/YoBFhpjYsH7jJykYtp2U57b/NkCvsPYzFNfbUPiUAU+i9S?=
 =?us-ascii?Q?K20RaTGSflstYEaFIF14bp6baHYW5Kq7MiZfkalstYvlf4Tf8CXOOhr+n0s4?=
 =?us-ascii?Q?9hRu0zWjKACP83l8gM6hvwI1IJW+U2CZxmgzcFAyWOts1qgGY/K9TWg8zt1U?=
 =?us-ascii?Q?OrfJ6LKNnJ2GBFsTQhubNP3tXJLjtFQO3GZBTJ+8n8ACrsgkH1DrJyOm9EIP?=
 =?us-ascii?Q?jd9Of7WgZsMsepFgco1owfnyupwNykeNADFrtUpC5uzq1H8f0icjCz2IaQg2?=
 =?us-ascii?Q?guqsza0zSiYHhwQ7kxQvMU6185jNlU57FobINCj65YaPUfxrstC9FQerihPH?=
 =?us-ascii?Q?BlVoGPCeXFs4F1wGBepGsK+ovRBSa7hscQLZ3wl235ECE+NZMP7hOkzDwVfl?=
 =?us-ascii?Q?2+UqS0J7yG25KpxqsMsCDVbl82Wt3/UvQnlkvoFeBQ+gyDpco1Z90/tV+wvU?=
 =?us-ascii?Q?yRiNJj+2Qj5PNDn6tkjt2kgsJWzMqYtUj4BCMO7FQ2nxsKkNAsnR7q5nXKRi?=
 =?us-ascii?Q?X6pVOKdGWs1Jo50+O4BrqqCFV3h8frhE0Sj+ndxASHbg9yRO6aGKNfMEOAzU?=
 =?us-ascii?Q?yCXKK6yIHvrs3N6FeT866J6fZzSEqjMtCBRqkWPzEIyw42xglylNwfM30v3J?=
 =?us-ascii?Q?eIBlIsq2n0M8cbLLfLWptFgWTtT4eYvMvlbE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gVd0LgGWzk5zPOpmo+ZerB09XwPYJQbZFZa6qxdYTS7MW3rrzDdXN7Hlqa9X?=
 =?us-ascii?Q?FFKGqbvuVuyl+2XpVbYI2GWVI06qaaAaMtZCYKGeiw7S8fCxRd7P2ercxK35?=
 =?us-ascii?Q?LNvY3tHPiKd4U+7P36QzGFFaEQMIwnNZbGGUQQ1gxh8BtfP6qLALb+IbOqWM?=
 =?us-ascii?Q?Xe8p/IbmgfKkZlK5RSZq2bxex/etiScoj8THLe2x+NAWY/6ArnYrp2GffIXr?=
 =?us-ascii?Q?tmi8Ll8nk0e07tWTspXGq78PQULUx3eZE2OMJR6AG/P2fl2XhWtQbWpWgaj1?=
 =?us-ascii?Q?T/Kn7M5BrkkBhwG+1uEpC5QAyS0+qW1xTbY0cehgIDAbrPxFwGdKSLyONXkc?=
 =?us-ascii?Q?WJoA06kJXhcaS+f0gMiSSfNFUhOc74nkf26AJGCxmZGdWlsnsFPr2zLCY+Uk?=
 =?us-ascii?Q?ETW+cO3qwAPqgFoGiFZHJUdpfDnBITZ+6fbitOg/hBaMTg8jdt2jwCZzHQFC?=
 =?us-ascii?Q?9kIofzrpeMbBZQyLI4I2F+qGvcXiso7F/QOMls/fvZwFKQeKJ94myss79jd7?=
 =?us-ascii?Q?SWPG9/etsZmLrXflWuEn+MkfoflIJIldM/Mrb/QwVKGW2cvAo+W+ung3homT?=
 =?us-ascii?Q?CbFtn8dJnd6Zo02ebVU26yqYH5ORnI9MpPgaOUg04JbMAeHJt0ELK8RXJovd?=
 =?us-ascii?Q?C2bZkTcw5d7VhFUNuMtjZW5eVgjx3rF3Ajx4u2NIFZuBDlvtAjwIoMtk4OcJ?=
 =?us-ascii?Q?OU6hfu0jMd/oSP/K+M6AfFC5gOgcYGkGbYgJHOhFWu/0WkxWPJmlw6Abl1Oo?=
 =?us-ascii?Q?m/bTnXTwIEJCG0pkWDRRFDuYSciznjOLEoEWRBniy1b8EmthFAJYIA1/3wFF?=
 =?us-ascii?Q?kNBFSHkF92xcjZNDPVG44MJtSyb2rvlXuy/8JZy+GtOIyYQxxBnrQm2QJfJC?=
 =?us-ascii?Q?nGbfhwwBJeQ06QyJw1Csm8oT7Wwf1oQs3pxOLU4YUgMskR2DdBSshesEtf2R?=
 =?us-ascii?Q?pv0TArlcHnGiOYnW5k+PxAX6dUEkXfXsG1UyZtmEDS0rbd7psscfUeTXqpY8?=
 =?us-ascii?Q?q1MSM38Xd9ZzxURWDCzBVVvqnnBwYrXu3sFYVjRiy7/nxtf1gfcAXkuao+VC?=
 =?us-ascii?Q?H1LO8uYUws99nPGIMETCdJX/hDrHOITxXowM8+/q6SKi+tGTrkNfrpiPsZLq?=
 =?us-ascii?Q?s7+ppM5znIjBw/Ru5JEnnUzvLIur26mGGo9tgnJIYqGzLKs3ckIN8wcMPwgb?=
 =?us-ascii?Q?Oim/4srgj6MoYJiJ1Hb1WB6MOIVGy3OP1ZmNMt7siA5zTzkGhcbDl6CY0fOD?=
 =?us-ascii?Q?Lr2mqduCF9spSRdMkScCr/BCltpwxlEeUKYYjGw5WsgMi3iHKJ+ubbflLkEa?=
 =?us-ascii?Q?WTesJ0UYP6RX8VKO2M6tt2ahRNsIaBEk2aaa/jhbXSB4b+YCaN4goYw3h0Op?=
 =?us-ascii?Q?LOxq0GOxmTOYP9pdwFS5VFwFTec+l7JQeRVVHV4EKtC8NCJ+R5UgBLJmghYn?=
 =?us-ascii?Q?HZUVAQQxKSFYoSpU7THgK1mLf4J91FMr603rnC/3ucjlQ/tlpAjqZrRdsMPb?=
 =?us-ascii?Q?DZ96BXei7C7ry2AaCdyWwvUOSt33vnUMQnqrHrHMoIpMPAr/XwGcLr/96wqu?=
 =?us-ascii?Q?lcVIOT/V6KWVX/p0C3LviA1vxoS/a/vDbqMw4FYG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd9d85f-dc5e-4e0f-8f7b-08de01324bbd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:34:26.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJlDWZiZQAY92UQTYk1Lz/NwuSbQRZ7dRBo73SeZo2N/Fgke3fhYuRlsetZUkwahEgw2VC/NUDW/jMgNYCVesg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6829

On Tue, Sep 30, 2025 at 08:05:56PM +0100, Conor Dooley wrote:
> On Fri, Sep 26, 2025 at 02:47:12PM -0400, Frank Li wrote:
> > ar1021 have only reg and interrupts property beside touch common
> > properties. So move context of ar1021.txt into trivial-touch.yaml.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change in v2
> >  move to trivial-touch.yaml
> >
> > previous discussion
> >     https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
>
> You mentioned there were a load of other devices using just these 3
> properties. Do you intend moving those too?

I go through other yaml, I have not found more. But there are somes, which
have one additonal properties reset-gpios.

If add 'reset-gpios' as optional property here, I can move more these into
this files. But I am not sure if it is good idea to lose restriction or
use if branch in trivial-touch.yaml.

In other trivial-*.yaml, there are one reset-gpios and one power-supply.

Frank
>
> > ---
> >  .../bindings/input/touchscreen/ar1021.txt         | 15 ---------------
> >  .../bindings/input/touchscreen/trivial-touch.yaml |  2 ++
> >  2 files changed, 2 insertions(+), 15 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt b/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
> > deleted file mode 100644
> > index 82019bd6094ee..0000000000000
> > --- a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -* Microchip AR1020 and AR1021 touchscreen interface (I2C)
> > -
> > -Required properties:
> > -- compatible		: "microchip,ar1021-i2c"
> > -- reg			: I2C slave address
> > -- interrupts		: touch controller interrupt
> > -
> > -Example:
> > -
> > -	touchscreen@4d {
> > -		compatible = "microchip,ar1021-i2c";
> > -		reg = <0x4d>;
> > -		interrupt-parent = <&gpio3>;
> > -		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> > index c393cce273c5b..d6aed3afd4acb 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> > @@ -14,6 +14,8 @@ properties:
> >      enum:
> >        # MAXI MAX11801 Resistive touch screen controller with i2c interface
> >        - maxim,max11801
> > +      # Microchip AR1020 and AR1021 touchscreen interface (I2C)
> > +      - microchip,ar1021-i2c
> >
> >    reg:
> >      maxItems: 1
> > --
> > 2.34.1
> >



