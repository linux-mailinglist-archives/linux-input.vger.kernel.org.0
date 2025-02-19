Return-Path: <linux-input+bounces-10201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257FA3C575
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 17:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562CD189044C
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 16:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1828E1E1C09;
	Wed, 19 Feb 2025 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="UtYRgeP1"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2041.outbound.protection.outlook.com [40.107.105.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5152D2862B2;
	Wed, 19 Feb 2025 16:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983691; cv=fail; b=BUn8e8K3HQ5AAXJyG3Woaud4WZ5K+Bqwu4oaZMchEWSWb7dY0vUPRx3LlZOmXGtv9lA+0O3VTsedbQQusO6yGrTP/IVLkO2YDikNtJT35VzTKWEqI7/ZHwHlmJEIwkV49+IB0NQUG45vlRF6CWSnOM39kZMfkO6xw3w4JxVfMA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983691; c=relaxed/simple;
	bh=s/Mueh0L8xG849zTElRSmF+5Pq+5z4jKKqsTJlngmmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=klU25/rsE/oO/m0oHf+LKzlGTMP7W4HB6Xtpfb9ux6JA3mCl9WutgVt1g8QQkoQplhdMNw2R0OqXbdexbHGmYw2CJJNHjrnmwoDDoIZkXLgGiE1h5gy/cK7+gvWve7nCcPKTmpNi/fYs15l+RkGBHoZd0Advxt13Uyno71BK5Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=UtYRgeP1; arc=fail smtp.client-ip=40.107.105.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ejgd5sFtZlbSyZ7aoix96PRqghsoKjDjAkcMZeXIilmddoiNIYGXniYTcKYUQ0yMCERc+H5kSPOmINDkJxoLmx+rvV4vx93NlxQc+spy4OdY+RLxmXwbfz+mgaQYdJ8QniNnMn7U7amki+3KzonotQT8ix03/7DVBdme64ZR8g2vOoh0FKvw4MSsOAZEPX+9VsCmscdvaFBR49AwVMBQne+ZYFaUbKFEfnkDbtnzMZMMGtBZXy5akTN7NyszD+wNY3gFGPUQuHeDoR9GYVICqA27kmiM3ERL313NJFrDhHt6b7Wj+jSwlIv9UAWTPjnDurErqhy3gOX/fVNWFJkLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaidO9dqBXjFwJQkkUVzUvTG5qD+xv7fn51FewxOA/8=;
 b=v3BXHm9gkLy47FYc7Z1m5o7bFH450k0GJdKOPdl8SFGQnFVSwzMd2KNgCDAQ82LwPDXELKivHrHMsywCjISrkX1P7wWUK8sLaeLmtDDe12YkdKS+o+CZq3JnM0k0MbpQkclIPAUWeKeeR4daYzRZvy5nl1/M07Q+qtwF/m2xa72jqzCvBJ4l4s8QfIwA4Gu+1RVPphlliEa3P4Xkeo2g4/dHmSw6geom7g7Tw8+vbhs0wwoTVsWyg7iW88dZCE1pSPEQKkhFr0Fr/k/kHBUPeYoSyceb6NC4npWF4d65Nstv4Z3/7ANRioIs7fiIhBh0EGBcfPOWk9cnSdvj4K3uzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaidO9dqBXjFwJQkkUVzUvTG5qD+xv7fn51FewxOA/8=;
 b=UtYRgeP1hR0SG9iRuhEv7bRifhYEW39krRUeHRly1u0M+sEhu2/5ywqABg8vJWIz97SMGU+Tje2VfjVi0zLakiPk4y90cfnaXX2YgesuM9ms/SZjDmS0ujhkXJZStqaXxmT7vnNilN+ucxfUEcT8JUb0TAF4PN4hToLmdT+55VI5wR6PAGE+0FFv4blaXT6x8myrqcma26dKPm9ve+ocuYxIsZ8FLkVOLsqN3fCVoBBlttdWP2hkPE6YJhhT8J6M4wwloIp0LJ0cQrjkl/kUqfsc6tIxWYVWbzISgNiGt6MgThY0DdjcWBrFXLizp61EXIjE0xlXq0sOaVW/ILluCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by AS8PR03MB8087.eurprd03.prod.outlook.com (2603:10a6:20b:442::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 16:48:05 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:48:04 +0000
Date: Wed, 19 Feb 2025 17:47:57 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] Input: matrix_keypad - add settle time after
 enable all columns
Message-ID: <Z7YLPRfOMzeTj9UU@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-7-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-7-markus.burri@mt.com>
X-ClientProxiedBy: CH2PR19CA0007.namprd19.prod.outlook.com
 (2603:10b6:610:4d::17) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|AS8PR03MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: f0454b06-691a-46b1-5d01-08dd51052e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JeHcDH8t6ha71A0e17m3Ho0yYHuzGwHp6aNtSzWnBQC1P2dSe+HTC5wNGrKs?=
 =?us-ascii?Q?hLwD9b35fw5KenpywgrbUL5eCf0sBh6B+OP7Ut9akVPjprk0NnS/Rcw6ZD6J?=
 =?us-ascii?Q?/zy7srmuWGY+dLcMxNtTAuYK7zE0wmd3td9JfRMWORJjgIAUO0ygPIrp4jyM?=
 =?us-ascii?Q?MUY0xpj9hFnbB0QuuRi9fXYEokyJxTt98ALTofH+MZhGLO1UIoLfCL9Q56I5?=
 =?us-ascii?Q?BAhpzupQrY0RMyooHNG9G67K3n0VHqq0uvCTD+OgB516h+ghaPRGopnZ438T?=
 =?us-ascii?Q?hWTKf3vHEnTHdLHoVpFcNCqzHkfU5S8pe2GiUGqw+hCqSlBk0vhsou+4Fc7A?=
 =?us-ascii?Q?XsCJ6ZP3AJp3zJMa1Lvnz9YKxsm9kMav3Z5Gq6sQ0pg5qTRTmsM7wTPYoAUd?=
 =?us-ascii?Q?lLP1zesmioNCEvslPi1WFMOwYTuvOGRmN5L2XFWPPbXAPE0n7waFUea0O1qi?=
 =?us-ascii?Q?SB8saIX/aMfacSVEhUAwE4nZUi+oibojImdDmO/uzFBoH0wIVpo7SwGmgxzt?=
 =?us-ascii?Q?G702s+R1Pl1MXDK+yOhzgK0OjVqbHl8viahH77vVCyhcEowkw3WMsKMi0byI?=
 =?us-ascii?Q?E6wkDKkFrKpgeh1oV6WEsPOysykEswtTZav2NrfvD3o9vnNfsWlHZiLHkvvJ?=
 =?us-ascii?Q?++aQjss2/swPpLoHEDQFGn9rFRUcpuurUC9PvsrfoyQxDSjF0epKBTy87Nil?=
 =?us-ascii?Q?sMXqS9z+RNNZxtCwZjgi6iXIgbwVDVToCqk+Aa0Dxx5Cwkw/Ri2D1DRBR9Ae?=
 =?us-ascii?Q?llTR8fxOmDxap/op8lrOUrqBmc+W7dtHvOItKqTSl/pKTIEnIzNeoXLSPe+U?=
 =?us-ascii?Q?rOV1DfyJqGms9UTxH9nvsbNNCPfmJF9jpaF5QLQ5NxZYxjIv73DGBySQTFEW?=
 =?us-ascii?Q?reIZZVdKPTsl68ZJBbNc6mt9Tlya4okUhjXiFALcqzl0i7wnhEy4sLVXgd02?=
 =?us-ascii?Q?GNAz7gVKa5y+wOCyf2svmwIJNSb+D84XV5yBmJoeVpXiYS2z6xKvInXGNM8A?=
 =?us-ascii?Q?prh2WIFQIkAG72mr78h2bObuaZrVQbNujuNermjGf5FFJRpXdr2CsiRK1YnP?=
 =?us-ascii?Q?jzOXJ5kizq9c3zV7VwbVe8H+Ake1o67cJdH2dtmfu5QZVPfBK6gT1vvzv2l1?=
 =?us-ascii?Q?EXC1K5LuKPxmeQvqZB5LeVMd+/pPr2lEl1y32QSzx/Y8t4oucVQvpcZuQe7X?=
 =?us-ascii?Q?m2uKZa00gBemwQ68VKacz5CW1RCEyorl3QawMv9Kt/tgz5a/Ntf79gGoG7iq?=
 =?us-ascii?Q?3JPtdW9mDlBnaCTY6Qs6VtQKerYSEm/1dpRFqK8RzCYxadb1vKEEk4ETkjc9?=
 =?us-ascii?Q?SCFJuILf/J6KyUFaWAN2+gevWnrPqUt4UQ2XFaXaQHh2VYBuNLFk7oLKQcSz?=
 =?us-ascii?Q?SclDAte7Q8MttnPH4VHnNdstOWxCp219Kd7z/XFNVY7E218ZfOVs7fRTDRzF?=
 =?us-ascii?Q?DBKwJqQ6/wMgP7DrpxeBdR1XQmvy7jOe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jt6p9NXUYJQot84uwZhorUkXq+dUQ5NqxY9EZwKBMa0P54oTK7i0WO1Ot6rp?=
 =?us-ascii?Q?TZWo5FLF8+NwCAAiI1wbTFHBAWgbuF+4xUukNzJmv527ITjTpezpUjel2KqH?=
 =?us-ascii?Q?3AEBXezxpT1OCb/L73OTAvqvB/ja0pcSkReXwLpq0QZbtBRL6ljF96mAbviS?=
 =?us-ascii?Q?gXHdrWyp3bzc72t6FN+ekDiDRfnqnzJ5DeWka6OiA8Z6wni/B6URtRNII1A3?=
 =?us-ascii?Q?jV8B7dn4kMRw9v1R/S1XF81inmzKaMrTHAKHCoCND4Jwemvimb9MY3wnjDZ1?=
 =?us-ascii?Q?bwhxrg43tbifWJ+2TeALo8nA7arWwzNeshyHALcCKDoDpj1UIphfrc3OGy9r?=
 =?us-ascii?Q?I0RzJ8Mn8zuliP90w19jT2VuaitswwGVki5xJA2KE3IOdl+qrInnV+/r8nAk?=
 =?us-ascii?Q?pIYVoQkkTcFOB0QyZ1RY4s3YWuXlwV94zvPLlEj1MJi4Rv3MvszD+haMivtl?=
 =?us-ascii?Q?3H5M9PdIPJmAkQpMXN387itYniV78rUBakRPcgwhlj9OELKfF8S8MtrbD+yl?=
 =?us-ascii?Q?dCLatqkOpTO1jF9HkGhvhwHxTF4akqJt95KZePiwjPyzGPM23ZnbgZmfEp+H?=
 =?us-ascii?Q?u1YuU16WCStqeUwWBWbUl5RsvVUtwdbv1sUDTpIBbGbCJyPTEO16KIS9jh8w?=
 =?us-ascii?Q?nkoAXCSXeP8LiT1G0jwOT/s5J3VQutu2zTv5IE4dDZCO+5+pH5nvZZOpo9Dl?=
 =?us-ascii?Q?0cuK0YEIitqFMlCF5PO7Le1S8DzrBnMPn4uUvIjp9K6s7BRxo22cfpbeSp3i?=
 =?us-ascii?Q?060A6rTgAmEjwjFaR7ut2bpCJhg6pTfcsvYKGwE9sG1MY0am6wWhxD9EY6e4?=
 =?us-ascii?Q?M610f9dJFtgVc37+imJ+rqLKKdts2OW453Zg37cbtg1r+d/D2cSl+YjXNSyX?=
 =?us-ascii?Q?Tx3DgtlgWE8lyFxQVC+Nox0HNslvekX4NzklgSSAzUq4d99D6AeK5WCzI/tG?=
 =?us-ascii?Q?QNRuzxleBsXqvRO7mMIQw27WC9GhMyjSqg7KyY/GYx/TXeoqXK8RaO9mlXGC?=
 =?us-ascii?Q?qrh0+pjQDNOUhiFB1QtRWoiKV1k8zsDRuICmOK6kPkvakZiquW82Wp63oagJ?=
 =?us-ascii?Q?suvHQS+JWlEph5a7uKeeMQm/tyKritIJmlQZZDF/cPbvqUetAYa/8z6SVSwb?=
 =?us-ascii?Q?qlHzNoGS3oGpPgyVSFfj7hrVNqO8n7L7oLZvvbK/oVdI0QozGMhXnWhGv5Dq?=
 =?us-ascii?Q?N3APu26vU07509p9MJq7htjojHwRX1ST2uzKRTO7SmRqDQPNTo5HNu2oxkvX?=
 =?us-ascii?Q?YTRdRH+VFrN5MXmhj6hWzeDiHDZbhHGV3Ww0KVYpqKl/S+DnSeiq1gi4a0wI?=
 =?us-ascii?Q?b+hS3udoWF9kvMGH5rERrxWuWwAE8pjwvfzFDa7I18ZzNDMF26OePAJ4x3eC?=
 =?us-ascii?Q?CT/9SPRqNL5OzqhBwFDGE9OKGHxn9MERSsS8r5a6nttp9io90jxtaj1/aCrn?=
 =?us-ascii?Q?ratNeGOCRX/h1bAn5bnM56hQCNzaC8tLVetbZ8/AYxSlAlyX413rVWfYZ2I4?=
 =?us-ascii?Q?4xMeIeBdOl+DmLpzQ9Nm7V8PwCqYTJjvv15zwLxCa0aQYLhn9B8lUqu9eDy4?=
 =?us-ascii?Q?f6EsBX7ndZN0W5ufvwJdXE1TsV76b7VJDX9U869f?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0454b06-691a-46b1-5d01-08dd51052e14
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:48:04.8339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCcMcIqZQLZlCHB79S6APokfK88bxG7+eTpN/gTf+23SHZgl3QGQbOoyeG+k47MQ60pZ9x9Ji6Dw/ZbP5I5sWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8087

On Fri, Jan 10, 2025 at 06:49:05AM +0100, Markus Burri wrote:
> Matrix_keypad with high capacity need a longer settle time after enable

matrix keypads with a high capacity need a longer settle time after enable

> all columns and re-enabling interrupts.

> This to give time stable the system and not generate interrupts.
It avoids spurios interrupts by giving the system time to stable.
 
> Add a new optional device-tree property to configure the time before
> enabling interrupts after disable all columns.
> The default is no delay.

The delay for re-enabling the interrupts can be configured by a
device-tree property. The default is no delay.

> Signed-off-by: Markus Burri <markus.burri@mt.com>

Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  drivers/input/keyboard/matrix_keypad.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> index 90148d3..fdb3499 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -26,6 +26,7 @@ struct matrix_keypad {
>  	unsigned int row_shift;
>  
>  	unsigned int col_scan_delay_us;
> +	unsigned int all_cols_on_delay_us;
>  	/* key debounce interval in milli-second */
>  	unsigned int debounce_ms;
>  	bool drive_inactive_cols;
> @@ -77,6 +78,9 @@ static void activate_all_cols(struct matrix_keypad *keypad, bool on)
>  
>  	for (col = 0; col < keypad->num_col_gpios; col++)
>  		__activate_col(keypad, col, on);
> +
> +	if (on && keypad->all_cols_on_delay_us)
> +		fsleep(keypad->all_cols_on_delay_us);
>  }
>  
>  static bool row_asserted(struct matrix_keypad *keypad, int row)
> @@ -400,6 +404,8 @@ static int matrix_keypad_probe(struct platform_device *pdev)
>  				 &keypad->debounce_ms);
>  	device_property_read_u32(&pdev->dev, "col-scan-delay-us",
>  				 &keypad->col_scan_delay_us);
> +	device_property_read_u32(&pdev->dev, "all-cols-on-delay-us",
> +				 &keypad->all_cols_on_delay_us);
>  
>  	err = matrix_keypad_init_gpio(pdev, keypad);
>  	if (err)
> -- 
> 2.39.5
> 

