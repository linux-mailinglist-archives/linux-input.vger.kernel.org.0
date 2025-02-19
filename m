Return-Path: <linux-input+bounces-10196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54474A3C556
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 17:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F7C5189847B
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 16:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C1B1FE45E;
	Wed, 19 Feb 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Y4zGGU0v"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2056.outbound.protection.outlook.com [40.107.241.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593F1FDA9D;
	Wed, 19 Feb 2025 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983225; cv=fail; b=E/HUJNAeLCBzurS15skFzh6EJsEDyWSxH2gbXpK+a6VZFOqEMEiBT8IhmiICxuvIAGXbTYGYVNHn8SGvZwWn/evd74gX9gbv7aX4N9EM1aD2iCsLLe80INoYYYDjwkJl9VAD4jq2iIMnjwkOhUPXRZUT29ydWWwXCLoi9uvF2iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983225; c=relaxed/simple;
	bh=UU5OIQ4npz0cbfyUhD1NOOnlGKxNplxZgmlzZJ0gxI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=osaI14/5DidzK+DcmXBlZ9hykS3buG/vckBMIYM9THjcjE8RpQSqJK44pbBQ2zh6cd+qogKzg8C3MHPcIc46JzV4gttO99KDG9pDjp+FBNAegogtvIHAZxOXjJJGm2O30FEqReqa3E1qqufxTSPqXa7Eo6ZPRx22ZvnDxXjKC8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Y4zGGU0v; arc=fail smtp.client-ip=40.107.241.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ1OWG/z6mwCUpV8qUe7e9eQBDoeEKnekQ2XGh9nmU4YLuiMmLkllT+dUplN13vGcTB8PKcCoLTAcsUB4xhadovpVDNL/izSbaz8KvNtq5e6am2Ld3HmLddwY1N5kqaJfZVXdrKO2IGj5glhWQaGSNLQ/2kgYfbS1jKYgFCTkjN0YOJFx3FO/yJM0QjoqTJCEyxv2e80i0WUdYWNOUl1M3HI2fngFEXyR0Gfxo+snmY136cLldsl0/su7XEdR0WHenOXct6eOVTtYo7O7MKp/PuaXu44VrI5eoJQ2nucVL/BIibuumOA8cT8qgJa2Rfgoim6v6gd7lKrMUuR1acg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up21YC4XJ+b1qlD9uzOxY+qYOVn/6nRlFoWxNP6OK0Y=;
 b=mOHJqi6+FNdEZTgaSdDPOpy63op0LTqw6ilyrpYOQc27pgAWDeIC1VpaK593Ti6oVmjqr77k6hBtWMlrjZJV8z2KNJ9a2XG3sPpsv9Mu8Lgkld9mOhTwGdMkQhtwqgvGGlMgcPf8SO8YB8caj/jQP4Bp8NkyXnJNAxas2X1+nY9+bvexcJT2ghLJcmryWgcGqOdlpIXo1ufYd95zgNVvWAwZztesharn7fkCISxEVguH60+JT+6dqBEQOCYtSDLUFSGG8xJCaz182Ik/ARNaC/cmiIRNQpkS3WtUhXTZCa5WqTjoa9AuW6XQz9MoWr1jk76CVkbG5UEnm8gDjHeihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up21YC4XJ+b1qlD9uzOxY+qYOVn/6nRlFoWxNP6OK0Y=;
 b=Y4zGGU0v8Yw9r4nQa2dvKsPGsHvcXGqSsXyu+VlSQqjppmlHNRVFfojYvWzyKirZbwBCWcUI2OyVXXPdt5IFgSXx1k6zGQnfJHA64ecpVlX8TzuKgl8hEzDN008CeLYsmQoFjtP6brjqrytveitR97wbcMvYeFTfnjouc9sPVWasG4FTqBsLZ1AjUvx+mJDlD8YeQnNJNMdmPT6Uc5KnwwPmSHltYK6tiS1DHkLJ/J87p4oBDdDZnSzJ5K8nKiLkPaioXp5XY3VahlJDjmYMciFepS2p/gZreLrC/Mu2zNRqVOxnHoTdJxn3C9znrFI5MKRfQ8/rfyvxvSF+8Leimw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by DU0PR03MB8574.eurprd03.prod.outlook.com (2603:10a6:10:3e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 16:40:19 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:40:19 +0000
Date: Wed, 19 Feb 2025 17:40:17 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/7] Input: matrix_keypad - add function for reading
 row state
Message-ID: <Z7YJcZe90rDWfFoi@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-3-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-3-markus.burri@mt.com>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|DU0PR03MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad71a5b-21a7-4ae0-fb48-08dd5104189a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lDeCFfHCljj0+YkduQWsg3UiaICetP3dxcWOKMys9qZLJ/zrnj8Xpix7kbXZ?=
 =?us-ascii?Q?oD1nrQQhzoSmfUbRYoAf8X6K4gNmJU23JMAA/n/NaE1JjzTmlVyBVvAbFzBn?=
 =?us-ascii?Q?pZlmTQrmMhj+6BTWBlqr1rJ+iLQ8uh7KlO2TPGuhbJ8GdY8+qW51tD2Zonbd?=
 =?us-ascii?Q?1asqQymRXbUZlsJu3/LxKScZ/zLUew8ssZrFtw63S4PITtVYYoKBBDE+xmNU?=
 =?us-ascii?Q?+EQ7FLysA4KRiKiuPIairtHs94Ei3NPtjah1C2G6/3q+rhxiSraKAt0Eg7cg?=
 =?us-ascii?Q?4XqjKadmUdNvQUqbOJ71zu8zLd5XO8Hp2+Zr3CX2UeWWR3AGUErFaSdav1Kf?=
 =?us-ascii?Q?vHZfOZPgn//gX/6qNqWtxj4tDnLX3ZkJ+gzSqRSorAZt5puYlA85NELlZ6Nb?=
 =?us-ascii?Q?KrEz4UHWG1X3+RXjGLtTAmPCKIHt5OhdYfXrrC7iD4lG+0lk8Ntdjpbb9RVM?=
 =?us-ascii?Q?lRQWt/tseC8ZM/ozQv6OZjnci+2QXKqLXdKjxcBLAA0ciSP2SGtX/cR0t8v7?=
 =?us-ascii?Q?F84wlBgs/Ag1MAYXHNuaAE7/n3goCKYJWtEuJm72fhrfF9OvcboLAzbU7OAp?=
 =?us-ascii?Q?Qn/v1hvRQ8R0PTAygs/H8ZOQxex/1Ii3RPQO3bY7e4oP6ZAVEDmpHEwWUTkV?=
 =?us-ascii?Q?CvscVGFOolvrw8UMGjcK6g4+JqRbWhFvSuvGDn77YCx4J9sQTix4lfqj0GI/?=
 =?us-ascii?Q?zoYXrVtiRSBZ7eWtPyOGKXbB06eIu5TeDGc8UW3tpEClnIMY9jibbqrppcB4?=
 =?us-ascii?Q?5znUCm+6BSmoIEoD+3iJiNkDWn+5CAfhRF0W3568RYKQcT+mQqhPy3oyCZqc?=
 =?us-ascii?Q?NcHOVNbQkN7xk3K7pCF+Req7Q0+cvaxEgwFg/NBk2gpT5kdEjFS4G8lPIn5n?=
 =?us-ascii?Q?fbbL6iA1hKAQnRokqTZFqL6ZB8PWOgA/IEnNVOWLioD8WVobCCw/TcWZZpUc?=
 =?us-ascii?Q?14Sny+83AgBxEBZwyVPfhBED4OK3tH+bGrqp6h9wE+Lp6Scsy3/kbVp/xDo6?=
 =?us-ascii?Q?g5jc4pQ5bcpIfbaGmJJGOE3fNmjR4R50d09vFrltNZcrBYQ0qlhIp5m+I0pc?=
 =?us-ascii?Q?fqoQQyM5XWhyjigHi+2rcaRipbePssuPGp1v5TMMsud+phXtOyuhgA4ttIPd?=
 =?us-ascii?Q?rh92ibFqzHZJpO0qHIC/vFdQaa9vbbksPRuoNv3FxwmaX1qUkbzQJrzUgRV4?=
 =?us-ascii?Q?NkM1oCvzC4aiFHaGXihd4XJe7zEMVrl1Xstd24/m349MB5RzTgZGBNjhsn3P?=
 =?us-ascii?Q?Yke0sC6dmENakJoO+mgVWGnBB1UifUCvxzCnvpN8xx10HPV6a3885iNVY0nX?=
 =?us-ascii?Q?ELTV04076SAJUfa5QpOcaVc39U7mQrW7S8IUlHfff+NbYaa0/ZmZVccHSYKL?=
 =?us-ascii?Q?q8MxwCGxmL1qUiQfFYn5IEYO1t7z9g9wgqiB21knBd4CID6WYIn5+0i8pT0W?=
 =?us-ascii?Q?k7VcAfbTY+x/fee/Z39gTzSOMPFfYaxg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tD8TbC6CWCMVYU3/fEaCS8n0zQg5LX6muN5KNc7OyjTt+UxqpCKjAIQNtbhK?=
 =?us-ascii?Q?IwC9TRJCfYNJ+WuwYpmkyvtgSLNXr/IWL5Ooyo+pXJEzg9U+OdoQAsXVXO+3?=
 =?us-ascii?Q?d/T15V7NntBcIGDwW9iNKl6kl8HDV/K1uynvVug7f1+WpcLrr7aX5uy3d6gL?=
 =?us-ascii?Q?3xLF/5gbHlhgeZHmE2ilbHJNUZd7VoSUnIEm3Eu2unTML+gQRTJt6ebHf/9k?=
 =?us-ascii?Q?XaR4YppKGZiy4D4TQN4ooCGE7Jir/G4wikNRCPdkYiy8M49/2Gz1CsiC/77j?=
 =?us-ascii?Q?pkL5lHxfX8idckVAZSYKxcnlp8WzftM0AUkNLi3b3TiD+R892NgYfl+DAotH?=
 =?us-ascii?Q?XJDxxk5qvXQSGVntCUVONpyj+F23nhxpH6UeBYznjgBpNcmMnPOp8afHPK6+?=
 =?us-ascii?Q?+nFj8Q1SkOjBVAqFTDOp+EAlPxorpY/pwyhFyx4RERLu1BYrAb4I1jLm7PrP?=
 =?us-ascii?Q?nqnblS5iwOlJgN9rnWu2gRMTc0otv85E220KQtDxUPS8BhWSAvehiSJ6jCv0?=
 =?us-ascii?Q?Tr1cGQH2K7Sj5yKcF4pNGt+475GROdeQqlhnYVsIrDbZOOiBnNsfeZ8X7/a8?=
 =?us-ascii?Q?Hzk1Hdh5FD4ncu+3ml4h6b5CLF6p4bYocWqiDvPemTYitT+C5+O+wKNT30kO?=
 =?us-ascii?Q?ypCVIFp0V54OCCSrRT4Yeqz4quv2Cu75VMGu1LUwPcLgiwE6YR386WpmOP7/?=
 =?us-ascii?Q?wStrz433gC5VCfY0WoobDzs+YP6Z2ytPesEKwshSoFXsQiwRFu8WKFBLYSPW?=
 =?us-ascii?Q?PMapCsnDTLuteaKrUPBGEuP2hPiw+AgIH2K5BQKREsePyteXJhE/LMeSFP79?=
 =?us-ascii?Q?ibRHwBUDj4wdu3zAGlLyR3panW57fFTwzAMpob4r3AIQ4WT51Obf0de3JTG5?=
 =?us-ascii?Q?Xj4GWXr1/WhN6enF+nJk6th6jU4pQw+A9F0QPFqdyqaQZLkV4BhicdlWk54J?=
 =?us-ascii?Q?ha+hmx6Y+0TL+hTh4YRIPchJMYRO1RjZVQYF3J3lMbmQiR7vvuPmRjBs0cRM?=
 =?us-ascii?Q?qiUkiOb1AnxKB0BZdoelNOh+BR1j/WvjeWeIhEb9vj+5lWMTsp20eeZTq96X?=
 =?us-ascii?Q?WD1eGA9NyVG1Lv0BHHJFF2mN8C0Ch5tSDbMPj6sPc6R9eamaQC21s7ZJBUjp?=
 =?us-ascii?Q?C6tFBcSG7TK5WgBqRAlTODoI3hw28fNlpvTM630xOlhRFE2swLIktkRvZ5lN?=
 =?us-ascii?Q?P5Ssl1NwZPIqyEyM0/5TGqxWd9HjIXCtuNgcqoHMnRwEOanFEZseL8q1SkJ9?=
 =?us-ascii?Q?pjneXNls397Vh82p+X2YHUtij/2yhJm1wJuXqr6syNpzP4GVvuHp5NpK2l37?=
 =?us-ascii?Q?AqcBGWcFnth8xMvPQbb3Kd/ZVQrohKCejC0sbryz2WU1RDdKpvFiJRcmFic1?=
 =?us-ascii?Q?qucGg/l73i5+JygkpA7BpcKYn/lsr+avh4/NTwkMPhnAqaCoc+MxkEwIznDZ?=
 =?us-ascii?Q?WspSPBLIqFXPwfFiQ/PFPm24bktzfnQR4r7Sd8rvrKwOGGsB/PGCW0O9w8/2?=
 =?us-ascii?Q?+076K0ZpYioyLabBOlFaQH2z8miiVZD8W3P1iMtXz9IqNpDU60yzXSHX5ex7?=
 =?us-ascii?Q?Deidh0q4gPj+McBeTQUHtzGBthE7VXM3S4LMEXkG?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad71a5b-21a7-4ae0-fb48-08dd5104189a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:40:19.1957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJn+6Ls7xo8wf381akfB78brlWPhSiIejjZHQkm80JLJyKqvUXIMlYhOhn3qVDC2Od/PKbqXOzgVbQUtL8Zi+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8574

On Fri, Jan 10, 2025 at 06:49:01AM +0100, Markus Burri wrote:
> Move the evaluation of a row state into separate function.
> It will be also used by a change later in this series.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>

Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> 
> ---
>  drivers/input/keyboard/matrix_keypad.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> index 5571d2e..90148d3 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -100,6 +100,16 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
>  		disable_irq_nosync(keypad->row_irqs[i]);
>  }
>  
> +static uint32_t read_row_state(struct matrix_keypad *keypad)
> +{
> +	int row;
> +	u32 row_state = 0;

uint32_t row_state = 0;

would look more consistent.

> +
> +	for (row = 0; row < keypad->num_row_gpios; row++)
> +		row_state |= row_asserted(keypad, row) ? BIT(row) : 0;
> +	return row_state;
> +}
> +
>  /*
>   * This gets the keys from keyboard and reports it to input subsystem
>   */
> @@ -125,9 +135,7 @@ static void matrix_keypad_scan(struct work_struct *work)
>  
>  		activate_col(keypad, col, true);
>  
> -		for (row = 0; row < keypad->num_row_gpios; row++)
> -			new_state[col] |=
> -				row_asserted(keypad, row) ? BIT(row) : 0;
> +		new_state[col] = read_row_state(keypad);
>  
>  		activate_col(keypad, col, false);
>  	}
> -- 
> 2.39.5
> 

