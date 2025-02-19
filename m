Return-Path: <linux-input+bounces-10202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F6A3C586
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 17:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FE92168161
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 16:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80752213E8E;
	Wed, 19 Feb 2025 16:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="SOsR5hrM"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF416F858;
	Wed, 19 Feb 2025 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739984183; cv=fail; b=VYSgxNTt5l+Eue+whaLGaKjL3LcelJPIOV7JOaQvdgqeqbE7P0rigq9IqmA8NK1+gWCrKkMr/F3UkiuldQ/7m54kEw2xxyQYDxJTyW0zgt3DPg65LDj6guT0wNdYBBplFolvL41HBxR7sgzyaApiQN1XMJnVeC1TFdQgRxV25Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739984183; c=relaxed/simple;
	bh=VjY/6MeFYwxm0qcg95at60EhCuP9AxLT+dn3nMhdMKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DNtj67135AaPHp9FtYAiHPXQ9Hckwy1pu3Up3yuH/9OjD9YF84KdpCJJnk19Cs1JgN5NfdPkNoBaVnT8ZR94tkwoZ6bfs+/uHqmF688dzVvytVPSvK6m4ma3m1ApwE4ALzwc4CyCnsSE4nWa4mpv+0XQvCChM4D08zXAfKYU594=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=SOsR5hrM; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8bQZpZQx5a4EYE+KRSk3aj8auLRMGUrtywTYa+vfcGl78B3KKab0N3X2+/94hrKgTEZSlJ+xJpCch4MKL+/Z9rrScplLWmrqxPeEv96drZDKJF/NAinjAl+Mef+Psn7LAcgyAOlaOkXfl31LXRuVzMhUMNERt2GD8sud6ET0DLan+nHO8lKkk4/4YqSvX/4CW48vn2tIkplgvPxMi6CXMps6Pd54RYJoQhO8QBUnxKRBYjuJW9oltgihJRyMVjh+OI4qGjLy4fpnpZW5PHqneJf3NzbHz7nH2d8GqHVPt702D9/jGiUtBoK+hi/V18fciauHQNuyZGHu/Y14A+Jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIPDxgnBZRq2+AoJyOemRL8iB0FyhuCJDVPWskeTUbM=;
 b=eWg+NiMP69vlQhjXDG/SlVIKCcJhxs5uUQ5QNh1+qB2ZLUO2IjRZTOWqXmhAP8jz2D8IHS22sOOiOHDDJamyOPQuUQf/YeWk4+1lR1sLgYDbPBEX3pv72XoqP5aZMqewsVuqocz++2mg1SxYIQ+lKNCuNlxJ7LmecbIhTwJLKP7M0PR0N6BuN0XlQEZxjBwKUnUGkND6bu9Yy6u9xKVufFbNfpghI6LBqXUxKSCnaH4hrxcENcPaUrRFZDSuuY3OpS2GdTN1pamD6Yu1Bl5E2Op1nyUhAb5+5IU8h5Fd8dSNnyFIqbOBlOR01waMJQZdKtkjDQGLEnJ8PtDoLdBnuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIPDxgnBZRq2+AoJyOemRL8iB0FyhuCJDVPWskeTUbM=;
 b=SOsR5hrMfWfCH1BF/biZha0NtvaO9bfol/6UGImmuIW2Q9htTxtFghUWYAPZnt/OpLEzkRU1GRBPNrvBrCnEtIWcvxmgp+Y6K8c2fKkKEpFaKJAnwKTyWJPvcCDel+ojV6vMtYfR+aZD/XcbBM9zyBG1I1m2QM4JfmoV4zt6M19VBXgUWeigZ5k0gEf+uS9An72iquBHUtBmfJ4G0YJyCo551R4yTffM4EIhrKMeQsxn4EGMaYCwmkGA6iEPbkWImQNWZDYeDnqJg6UkDzKRFAWw7mCgtVVCqJmnEMip8d3jmnnugI3JORuBgH1ogyvu16JrHJPBuAKy2UPxC5F8AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by PA4PR03MB8200.eurprd03.prod.outlook.com (2603:10a6:102:26d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 16:56:17 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:56:17 +0000
Date: Wed, 19 Feb 2025 17:56:10 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 7/7] Input: matrix_keypad - detect change during scan
Message-ID: <Z7YNKl4ljWFQEa-u@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-8-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-8-markus.burri@mt.com>
X-ClientProxiedBy: CH0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:610:b2::20) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|PA4PR03MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c39ad3-67f5-48a3-6034-08dd51065397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X/KBxpKr+IXbMbseDyA+51X9lqVWeK6RFqZBidQQ9Kj3bebW/CcOR2SKvVn5?=
 =?us-ascii?Q?CLG9TBPGCwsRm2wbuVdgcCdcZ9ICZKVFZ3f0S/Jmr1jZ2jVp2fsJPTGHF2ch?=
 =?us-ascii?Q?89UD2E1c6wgtqhwnIceCQlQBEYVR8FWn5/jlU13TV8jjqyS0xydpkmfriRRB?=
 =?us-ascii?Q?zfCtLKTM37QanP31jQTC8yMI3dYnFhGwgJvZi9YQ6LqZBQ1nN87/7TPaud58?=
 =?us-ascii?Q?sIj34t/IVw4CuRrt+e354m8hi+XqPSNim8STTrqKO0GuOOA+hMpnS5Po7r+j?=
 =?us-ascii?Q?YVvwFmQDu+jSaKjOKlw0ttpaNS/er6yhOCTO6XiemmRlpBsJeKm3FiNKsYrG?=
 =?us-ascii?Q?frh4d4CYBDMRmczL/UBwYT/ADVfZS59F8UKmRla37HwcK1kCmyRm2Ouogn9v?=
 =?us-ascii?Q?q+tjWemKL/RQB4hn5wbsyHeEmRCkdv/+HYcTSNfqrlea7/flLT6Z0w3XU2fA?=
 =?us-ascii?Q?A22b/JnT6myGem8JabCBrOAaNUJwqOs1ab2BL540WedBlhpqkWUXSIr3X6gj?=
 =?us-ascii?Q?K1tml+m5pbbrJsy9KwGlpBY48NHrJc66sgJC57UBXEqKHfFlQ/XRPCIhJIm2?=
 =?us-ascii?Q?m4KfdWIhnfwRm3GpMay5fGhlTL1gFRDSTzT22Bc1gGyKSvqdG6agNvJkCpnY?=
 =?us-ascii?Q?Z+27a6HblfnZjRqBmCH0Hf6NG+h78bMZs5JQqAHBB4xqFbxUUnj3V2AkJTqR?=
 =?us-ascii?Q?8ZxhHwL1XZZW2CSV/emyb19yGD9je6k50rsBsEk5m86+nXKXXKXwZBxdKWSL?=
 =?us-ascii?Q?76CrO3gR3JsQXwPHJsk2ZWnpgaLKblQZYFlj34soGKwpKQFPDflRSufaI4QV?=
 =?us-ascii?Q?pXetbNJRNMjSYpENS3tk/m1Ad0v09zr69H7CfH4xdZF/FhbbuKkfNXKwUwHN?=
 =?us-ascii?Q?F6z80MtiWAk+JGo8AEQK+MUggBjKASEzXmVC+Ez0rHaEFGSEh0wLvfWIUgLL?=
 =?us-ascii?Q?5CpgpPg/03ifdspsPPWW0dpzcbqO8sp0a58dqr6a4uGhkso59LGB8bFvX4Qi?=
 =?us-ascii?Q?U6AeYRCzWLFAZIzAyfw0KpRo3d8sVFcRXhlj+Vh0fYzVwvcpFa2LCAKMbyaI?=
 =?us-ascii?Q?EeilEEGh7hdPubnKC9uA5jTDJI+yDuAr7xU2m24+pzyMMDSXeciuFRE1xvPN?=
 =?us-ascii?Q?IedQe9F8MC5B8PuKEAKpCA4g6edMPdrTZNLFc0/t17z3hn+toxr8MW+rcOYv?=
 =?us-ascii?Q?jPo/W42duZkwKLiWSTyP29JP3+CupqLvuuerRC4ic1/+qrRFfUnrm8aR8mON?=
 =?us-ascii?Q?3Sx8l5A7XPDqZOnnacG3V4pnW9q//yUWE0LtBkmhUyaZ3PeKDThM+tCcS6Q/?=
 =?us-ascii?Q?Rq9XPk4CSF18JwGy5rt02o+K9BWCvJ55NWiaLeCVq++hX7Cgi5G0GYcCI6Mx?=
 =?us-ascii?Q?oGFYluVzyzcg9mIjb5jN/U3iLhDGmTqeoNSrpwa1rzHrUNagJt868WrvZVsw?=
 =?us-ascii?Q?6PXEL9EadHlOdjLyogrrqjvJ3VEWc3pX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zo36b5Aq4Ncurg99Dr6lLetQ1TWsmDStccA5jyL0pQuQk4YrVtZv+NrrIrvN?=
 =?us-ascii?Q?CzOeWmUPEigNSzBebt9cIC0gkakdFSriOEvSQWewapW/F/73aKL4xO7oGtW9?=
 =?us-ascii?Q?z3zAY4mkYXvCvMTehS308k/S8n0kthjLTn+VeDfCYARLRUJaoEgAPZY/E/JR?=
 =?us-ascii?Q?4NM5Mwtv1rjX4+PZ0mFvYYqNl18ElnMikjiCrz7NqvkvoGFSYE9PAMjKd9DL?=
 =?us-ascii?Q?tR9HK75V4tVxhenwVwXfxx4yuBi4t7Bn+nzobXTe6cItBH89jvdONGQl9Rbx?=
 =?us-ascii?Q?XIXbCaXCEpc0AOytZe2I4gx6QDvMDLWtzyalY8VuPgNjaev2oCq9ipVzPjhr?=
 =?us-ascii?Q?oNDXrrCVAo/tnrvII3DGs6WsvozS8y3+04bxOVKXmGUsXvulquJHKkgUe5K1?=
 =?us-ascii?Q?KeCGTehERq1cv77vNrl8h1w0OCuqslS3x1gL/yylZbOEGfNdz0RehKacFxCB?=
 =?us-ascii?Q?xgGhJSUJCr2mt4NwK+yGjit8ZwkC3647EGThPpB3HM0oPOpopSO1GYTrVXd4?=
 =?us-ascii?Q?N6sPT3KeB9Y+Nx3Byp5ITFzqvkwl9FzHQMWQ0Aq6kQ9KHjTWkeN8ScwP55/h?=
 =?us-ascii?Q?bqi2MAkPqCxHOUeOBHjK1DlgpZM0bCA1hs3Mx7/Lb8nc3z4YcDWipIkwuIal?=
 =?us-ascii?Q?tZOlwkejWY5EB08UITezLxBtPO4P3IR48PNJvzQ1ZBKGWZG8zrzqIqfoLi4C?=
 =?us-ascii?Q?Ks3XJIhsTtKv4MR+hMaiEZZmJmV1sPu+cYSH/pq3KcQR57UBHiL2fjfWhqOr?=
 =?us-ascii?Q?4tZ9L7Qn4xz4D16awDxgaJoJ7LS0uoD7AAy4wXwTFTZMikUnWrsywDZ5MjKF?=
 =?us-ascii?Q?Ig4ICddUiJx1pO7vzthCGrXbJSOyhqRIV4MKM1AsUB91xhYTO4mzEK0DzYoj?=
 =?us-ascii?Q?DQE0eCYfqZqTa8pwhB1g3nSH7h3sjzSYejftipaZF+rNpCZgc6pshVT+12mb?=
 =?us-ascii?Q?MJo44yKk9cB4JOMd1m3KibXPhaxilpwWdNhaB+yby7DDrSBFqjQcRcF5sL4a?=
 =?us-ascii?Q?s/Ywird+8jAV6SKW9VSrbsI5y7qr7uMZWn4p6DZ7/z6eSx3s6t5wCHQlGsW2?=
 =?us-ascii?Q?TsBXO2LkqWzR5W8PK7ga8P44pDNdhUAcsBD66GJDrDosgcW09FVZckZTfoCs?=
 =?us-ascii?Q?g/lcW/CWOcn8n+WtK2b3QLfGh5z+3Q17Tkgru+CMuiwLifZ95aUmFDOaZg/9?=
 =?us-ascii?Q?uYclSDWeM3qdAH6UfjAzuzCD/Eg5+pPE0/MC/715CIj2W+Z9Ocvzldsh+ujo?=
 =?us-ascii?Q?W6tPn4T1Qa4D5cF9gerOGUm61krGOcR0tTc/RQ2l116Q6b8YTJDTEZFTPHjs?=
 =?us-ascii?Q?KWYoawXJN5E8SHZG7GmatjxcGV6Uzk4EUqacU3c7F5jOE80VGTialHhn4Siy?=
 =?us-ascii?Q?5y23zkJI8SCL5HXL/59jkj5qt+JdDX3uu/gc1tFfUBcPFnViA95YHUoEEFqa?=
 =?us-ascii?Q?kbK2pIdZ/kThHt8fY5aMRrD5YC/FNi+MAs2ohYR0VBJFsHX0kvqmB2RA2umJ?=
 =?us-ascii?Q?fA65fYdPrum1Cv927KMbZNpyEPinBpnvSRPeNiUQ2tGvksAusWqAYOPgokfV?=
 =?us-ascii?Q?SY5mkqHh7BimnXPS6joKdWv/wAXfNHQrSHNRXJIS?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c39ad3-67f5-48a3-6034-08dd51065397
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:56:17.1689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LySDZB1AAOW0i4NnVviNzh2LIcanr+AemkBcxSZi2OgoYS6PrUtYbXtFaIN1aTHDBZUChcKZF0kQT964ub/HkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8200

On Fri, Jan 10, 2025 at 06:49:06AM +0100, Markus Burri wrote:
> For a setup where the matrix keypad is connected over a slow interface
> (e.g. a gpio-expansion over i2c), the scan can take a longer time to read.
> 
> Interrupts need to be disabled during scan. And therefore changes in this
> period are not detected.
> To improve this situation, scan the matrix again if the row state changed
> during interrupts disabled.
> The rescan is repeated until no change is detected anymore.

This is a quirk for a bad hardware design. For 'good' hardware it adds
an additional read_row_state for no need. For even slower connected
GPIOs this will also not help much. However it is obvious that it will
be an improvement for some designs. 

Dmitry, would it make sense to make this configurable?

> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> ---
>  drivers/input/keyboard/matrix_keypad.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> index fdb3499..e50a6fe 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -125,6 +125,10 @@ static void matrix_keypad_scan(struct work_struct *work)
>  	const unsigned short *keycodes = input_dev->keycode;
>  	uint32_t new_state[MATRIX_MAX_COLS];
>  	int row, col, code;
> +	u32 init_row_state, new_row_state;
> +
> +	/* read initial row state to detect changes between scan */
> +	init_row_state = read_row_state(keypad);
>  
>  	/* de-activate all columns for scanning */
>  	activate_all_cols(keypad, false);
> @@ -173,6 +177,18 @@ static void matrix_keypad_scan(struct work_struct *work)
>  		keypad->scan_pending = false;
>  		enable_row_irqs(keypad);
>  	}
> +
> +	/* read new row state and detect if value has changed */
> +	new_row_state = read_row_state(keypad);
> +	if (init_row_state != new_row_state) {
> +		guard(spinlock_irq)(&keypad->lock);
> +		if (unlikely(keypad->scan_pending || keypad->stopped))
> +			return;
> +		disable_row_irqs(keypad);
> +		keypad->scan_pending = true;
> +		schedule_delayed_work(&keypad->work,
> +				      msecs_to_jiffies(keypad->debounce_ms));
> +	}
>  }
>  
>  static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
> -- 
> 2.39.5
> 

