Return-Path: <linux-input+bounces-10197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA0A3C547
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 17:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 765E63AF9F0
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 16:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359621FECA1;
	Wed, 19 Feb 2025 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="pRDuzr7U"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7E11FBEB0;
	Wed, 19 Feb 2025 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983273; cv=fail; b=VBXO5ZwHPNIIoiENwrjC7dy+vDCedBNkJJZ2obbkZ64ct+dU31vEAM6bQh3ks60M7CDY+45t0DSVWV5IuExlku/1L6Cscwq0CzpojJkeI+lB1Jb4UAOWhYTxi6qe6VTWEa7uFCjAOKPFnQuOJFXabPID61eU5hMJ4GIodKg/Sys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983273; c=relaxed/simple;
	bh=qzcjpz8roldwNkREJPpBhW3VCWLqj9PXJDaWTzgPWi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oc0Esvenukq7jLBVPo5Y6kfrDLA56LdEW1921iu1YCckcGNMeLWXa3URzLt45Z9iNeecTB01Nz0R36whqSfNjkLsQde0eoXvKoeC0FV6Pqjn71lVtSKqK9LqT9QxsCYGtSc2DumwftYtDeMbekC+CABgqaYNAbb7ND2GviybSD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=pRDuzr7U; arc=fail smtp.client-ip=40.107.241.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMyoI6ZpQU8/Zw9jT3axYmMuyGNPPVT5QsXx1cGVYpo/T63Q7mieB/JJHz19uh7vURTPsn6trDP+oYSCDvUchaOmTldWi/cyEzuOuVKhJe+Qjt7w2EHb/2R5iMslGwdD+A8qrHISZ8GqKxuWRa+U/T38BrK6CgEqfYHcZgVwd/e/skVggdojlg3gEkwIqfbewbbXuQ6yuNv6T1LqSQvuFcUPa0dUc1aNCVzQbwZkED6EB+AQVsMNnEfosrrmVddAk0zYWLFoD2SxXsYEOsrjQeMNKeLO7tdwamkESw++Zm94eU9n2hnS6H2NobJ7q1YX1WGnWAnwVNNRwhzvo/h6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOhvWVu9UALmG2f598CcbW5uSfJoehRQwsYwymzWEmo=;
 b=kJFY93knKmDO0mzzuVs1q3vIgOC0izNYsNXxEovffBQcHcfe2zWE4sw6IwF+uHzOTAepBr2/6PX4cPBJN2PzdccjRpXmpgP/1a4RKFY15XsdF7w5nKWOxZ2tJw1j2oX2+F27LCKFsG+qQ2GiB6psUWSMVF/kaueFHI1XABNUZF247RmRUmx+RHJHcUSGP801I0de2G/Nbji1AutsjWyhEUN3VHT5HhszOYxAbqjb2yKnjFsvgztetFBotBW8QjK0vlyCVPCfEdF7Obq0yKTOKXsXAjxefjJff8y9Gx7uG53XbauaMmzFwFAiH3KlE3kDls0IuYxBSby38eTIXdSheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOhvWVu9UALmG2f598CcbW5uSfJoehRQwsYwymzWEmo=;
 b=pRDuzr7UNiNeYvUoLvLdgirSkbgvz4RyZt1mZFsJio8c2A3PKXdacpaerFhWyyaoKLCG2r/V8HUzKXFlEP+FkAWVh0XA7BkfrmWL7lSMzhSerxIMGAFk+Rv5VaYdJ/A+ETURXVN4oT/Ttwzif91Q8ArRyMalLCZF6SHmNQbE8RVoHyxCRAQk6hoL1dBL6Bdb4Nmy+YbEbH/GOv1AM0FnVB8hxYgdOw8CA500thUBITSOyynTwqaqlkOPoZ/Rwu8S6oAJuAvjx5urHWusMEhpbyjiiNWhln2BXd6pwjMhkgqJR9V66XZCMoTAuoPKKdcgXnsulIhPPPhyVvKr7hd9Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by DU0PR03MB8574.eurprd03.prod.outlook.com (2603:10a6:10:3e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 16:41:07 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:41:07 +0000
Date: Wed, 19 Feb 2025 17:41:05 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/7] dt-bindings: input: matrix_keypad - convert to
 YAML
Message-ID: <Z7YJoTWrves_KtVa@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-4-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-4-markus.burri@mt.com>
X-ClientProxiedBy: MI2P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::12) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|DU0PR03MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 803c61fa-d125-4813-1d2e-08dd51043589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SDN1dXKzXIgn/MA+BzesjAlgg40RKjrHszDhbWHtqxnH+tSXcASUFoqJmJRt?=
 =?us-ascii?Q?1Z5/KSeobuhQYT8NyitEfuDMw+0g5mB+bARwedt25LISpfwprIVrooqRLNw1?=
 =?us-ascii?Q?aY4hVP7HwnLPipmZ38tXHA52Trw0g7NCMvlXY1BlcoZoMKGEdOcOpfwEAXEb?=
 =?us-ascii?Q?7SUTJyhEUIs0sshWwLalfMyPQmgJEbGo6QN5ibHRJbbRY9U8viSRg1lOE9Qb?=
 =?us-ascii?Q?X4bsgkjOXQll2U1EPWaIcWKYEINQHtauhsi8PwGv/o21w4TDf1XUNDnae6hw?=
 =?us-ascii?Q?pyoXG1ClDYdm7qH8MPwWCmgAHUcsB3uVQmm4jVDLReyrYRudKy6lu+lQ22o9?=
 =?us-ascii?Q?b9DI9t3d8t3TB4ZMb2wnE0hrEosE2lTghC/S4saV/GpqbpcQg/P1AR9TUpDg?=
 =?us-ascii?Q?ddJYV9zQxCCMfB9GnEWPT/9FkEFIe8dUh9iiHNvXa6kSnSv8bdI1s76lrgul?=
 =?us-ascii?Q?cQL05WYOalb1ET8B1x7D+dfaSkcUqwqde7q7lJ62u9zTakoy+ZPSxBIJ8aPc?=
 =?us-ascii?Q?/e/jgp82WA5XTrv0KYqDK1Wahtt5yYVlBOdCwOcwShWBI5C113Jbrc63ayQT?=
 =?us-ascii?Q?AP3AO9VruTrXFsnR1NCQbZqWAEmqhe7XCC37slps8jkdPiy0KPh+4kcgOpih?=
 =?us-ascii?Q?/yWmglnN4EpPQbWfKgRq5XU9wuouEVT+AEzjQgQKeZOVJXVX3LppsYeqfE80?=
 =?us-ascii?Q?9gzRv+8wBmPtxy1nCyt+k5rZLQ89BYdyO0hvm0pZO+v048WN5Vpl/Xhpq9s+?=
 =?us-ascii?Q?FsdosFcV4WYzbj2moLV/XxfNhitlrCtXJC5SMwvq8ipbrFRxIQr+CcgHWdt/?=
 =?us-ascii?Q?gPaJLF/CLJYlY+aw03xF2dNkvCWL3aQAd8vCpyJxkqT/HDH7zRc0i6tCu7zw?=
 =?us-ascii?Q?Vi4asP5K1dgqm0LSjV9lBF5Y8rRoC3ua00z55LJ1JRjJWwLMtemvNAnE3Szt?=
 =?us-ascii?Q?LJdI08jOnMV0vFPBX4HNARCfcj5tIa3ee0mXMbeDV6XRljUb2bBIn/ekq2DL?=
 =?us-ascii?Q?RLFXq64ocjmbaBgfARGUJkd/zKhxEGO8R3hEQEB8mpBg8B6NNWKvjjhrGQpv?=
 =?us-ascii?Q?snCqsoKA3IoD01WfQUPI+7cFb4KmuAw+Uiiap3eNhtMQFJ5YkG4so3wuUiC+?=
 =?us-ascii?Q?Z19TFRvg4OJbtdgciiFF5YgV45WKUap8xQjwg8Kbk1q3X9/iFw0OsLqfZwZ/?=
 =?us-ascii?Q?+75XddzVWyjXvw2Ep8Oobor+cITkpSERI2+Z9EBX8RQgOQwJxDZZ35H9BsJC?=
 =?us-ascii?Q?flkOdn8EjOTRpJavYIdazDAGuIk3GTkF1fg7cpM1x5HbDK2V59aj3/XEzPSs?=
 =?us-ascii?Q?iTZA0sJ42OTZifTTlhXV6LY1t0EGOdtUjMne9KGDnRK03NkPFJqckL0vT033?=
 =?us-ascii?Q?+F1meHBjlbl/Ut3X0LSMx6Ed16Z6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oj/rcIVvgfoeejKBJ7ZpsZf2xTC2wPu2qwO/uNL3x8r0i/dXlhFHY+fDjkR8?=
 =?us-ascii?Q?sh41jSoHtVjI9Y7VrkqyV7lh5IJT3V3UZCLzjsw+BSaeuAOjKaQArmbmcNga?=
 =?us-ascii?Q?4wzzybva342c3O+O9q7BUGuSOhSJycaZ1Sm4x9WRuNlTCGHr8IjJVCvg3K3O?=
 =?us-ascii?Q?3jRx+FOzWXbxV0d9+5tOmB+tAgSVjEob7LVU1rYXuBhUzKBkWG4Ikss+3SXf?=
 =?us-ascii?Q?+vkyVb9Fq5qunWqg57x5a1MjUcTZxPAc/edQQMPb0nnUPJyo2N00vELcMmVA?=
 =?us-ascii?Q?+4jcnk8OTS4aS//mihwVyz2GL3LVmyNDRF26WuMKWVuHkAyOYJ9yr38EB91n?=
 =?us-ascii?Q?gWR/3m++frdNz0ng8dtt9pbwEPi0iv6HEJYnttKudPeR/aTwp/hoJD7KusNX?=
 =?us-ascii?Q?c2THplZtMMZXR9qj6X369w5b5P2wfApG1xSJcna0JOFgxMwwN8dIU3v6/hGP?=
 =?us-ascii?Q?WyX2j+TQPb+uP3IsQ/STYO87Lwdj5cDDFWm/jCif3/UpI7lRXV3CcAXmHOOV?=
 =?us-ascii?Q?NfN4kBd8z8MT2HC1ZE06XnzWKj60akYErlK/DrgcAUuiDbs+rg4xHjTWh5Pp?=
 =?us-ascii?Q?Yc6GedenADL2l4860Z3Ui/GjTx1AepPuSxEmEP6WgMmfCa/JCPQi9yDHlXq4?=
 =?us-ascii?Q?/VsgJ40Svco0BECpd569LiA8tHL9u/QU6zdL+d1Z2eT5XIgccCMAXGIOn3uA?=
 =?us-ascii?Q?83GqCUZRAEA/22zflUPb6fJuZ7kve5jnEDdIRPc7xNJODxTOf87bHMJnwmFo?=
 =?us-ascii?Q?4CQEhaB3gHhk8iLYszo/AjqLDOQsnd6RE1MWXLsTGXOroZn1AK4Ht0sbGr+C?=
 =?us-ascii?Q?QeJ+6EQWn+1vJgHYiCrb+PZ2UmIqXyMfgWZwp9yZoFtXeJdcVEkQU9JIGCJa?=
 =?us-ascii?Q?IN6/qJyQb8hT3xA0kS1NaIXcSEDBSW5cs47LfE+l6kw31m91okEPkINfGKtx?=
 =?us-ascii?Q?LOQZRcczadtZFDPohNWosq0m417QKPP3eeyewCYevLF8fsKW+pxQh61fy9zT?=
 =?us-ascii?Q?Y1fMKI25lhxqe00r5A925Cimt8mcUv29NI/wR8gT68EJ7BdvmEevYt3+Cysg?=
 =?us-ascii?Q?AiCMOmLRrMGimJXoFWpOoTir08Ybaue+uwM3OH6JfZn/Q/yaeowI48e92nxf?=
 =?us-ascii?Q?W6yYQNAVLJo6M+1qptzYPqGuYHR8H5cG6aPjpSeFuwHkMwa73Ux9o2Mx1zlg?=
 =?us-ascii?Q?Y2imU9CyDYBOIX49lQrlIwxW+6lTpL9iufjSmQ75mHQYd6ttrRrXyj/7f1pm?=
 =?us-ascii?Q?3z71FrU7oPxZtaXoBYuPfi6KAxPuF7hstQOogRzTIW9aCLr1jVjc1eRQnXfw?=
 =?us-ascii?Q?nzn+XiAIk6xRkmRNKijwr4vxZcG2bbvROg7qyhkTHTXd9LHuCM6nQIEliy74?=
 =?us-ascii?Q?jShCmXkP/h4+Mzpknx1r2oUYZWjCgSoJICD1ncQKqGhhAIIptqVmHzCNuhsO?=
 =?us-ascii?Q?c65vHtH1DnzucToQ086lDyKZKqR+3nGWYI4A3so7wJwvQDKpYBx+2gElKmIR?=
 =?us-ascii?Q?oywccYzcKeuG7kxDdVuHtu1FjUgl1s9kWsCW9sIwB5Mb/+XBYSW3WH13rnIt?=
 =?us-ascii?Q?eRNPfh7Ppc34mPMJUrgO6JKvSQMuyAXMIPHCxk2K?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803c61fa-d125-4813-1d2e-08dd51043589
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:41:07.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrHKORu1zH0hrQsXbrjwsxjhuDqGFgKanhNoiOQdFDsXkiAlcuTX6LikY54cirLKvJOONmUdvV5TRgdEPi3+uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8574

On Fri, Jan 10, 2025 at 06:49:02AM +0100, Markus Burri wrote:
> Convert the gpio-matrix-keypad bindings from text to DT schema.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>

Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  .../bindings/input/gpio-matrix-keypad.txt     | 49 -----------
>  .../bindings/input/gpio-matrix-keypad.yaml    | 88 +++++++++++++++++++
>  .../bindings/power/wakeup-source.txt          |  2 +-
>  3 files changed, 89 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
>  create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> deleted file mode 100644
> index 570dc10..0000000
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -* GPIO driven matrix keypad device tree bindings
> -
> -GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
> -The matrix keypad supports multiple row and column lines, a key can be
> -placed at each intersection of a unique row and a unique column. The matrix
> -keypad can sense a key-press and key-release by means of GPIO lines and
> -report the event using GPIO interrupts to the cpu.
> -
> -Required Properties:
> -- compatible:		Should be "gpio-matrix-keypad"
> -- row-gpios:		List of gpios used as row lines. The gpio specifier
> -			for this property depends on the gpio controller to
> -			which these row lines are connected.
> -- col-gpios:		List of gpios used as column lines. The gpio specifier
> -			for this property depends on the gpio controller to
> -			which these column lines are connected.
> -- linux,keymap:		The definition can be found at
> -			bindings/input/matrix-keymap.txt
> -
> -Optional Properties:
> -- linux,no-autorepeat:	do no enable autorepeat feature.
> -- wakeup-source:	use any event on keypad as wakeup event.
> -			(Legacy property supported: "linux,wakeup")
> -- debounce-delay-ms:	debounce interval in milliseconds
> -- col-scan-delay-us:	delay, measured in microseconds, that is needed
> -			before we can scan keypad after activating column gpio
> -- drive-inactive-cols:	drive inactive columns during scan,
> -			default is to turn inactive columns into inputs.
> -
> -Example:
> -	matrix-keypad {
> -		compatible = "gpio-matrix-keypad";
> -		debounce-delay-ms = <5>;
> -		col-scan-delay-us = <2>;
> -
> -		row-gpios = <&gpio2 25 0
> -			     &gpio2 26 0
> -			     &gpio2 27 0>;
> -
> -		col-gpios = <&gpio2 21 0
> -			     &gpio2 22 0>;
> -
> -		linux,keymap = <0x0000008B
> -				0x0100009E
> -				0x02000069
> -				0x0001006A
> -				0x0101001C
> -				0x0201006C>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> new file mode 100644
> index 0000000..0f348b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO matrix keypad
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@gmail.com>
> +
> +description:
> +  GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
> +  The matrix keypad supports multiple row and column lines, a key can be
> +  placed at each intersection of a unique row and a unique column. The matrix
> +  keypad can sense a key-press and key-release by means of GPIO lines and
> +  report the event using GPIO interrupts to the cpu.
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: gpio-matrix-keypad
> +
> +  row-gpios:
> +    description:
> +      List of GPIOs used as row lines. The gpio specifier for this property
> +      depends on the gpio controller to which these row lines are connected.
> +
> +  col-gpios:
> +    description:
> +      List of GPIOs used as column lines. The gpio specifier for this property
> +      depends on the gpio controller to which these column lines are connected.
> +
> +  linux,keymap: true
> +
> +  linux,no-autorepeat:
> +    type: boolean
> +    description: Do not enable autorepeat feature.
> +
> +
> +  debounce-delay-ms:
> +    description: Debounce interval in milliseconds.
> +    default: 0
> +
> +  col-scan-delay-us:
> +    description:
> +      Delay, measured in microseconds, that is needed
> +      before we can scan keypad after activating column gpio.
> +    default: 0
> +
> +  drive-inactive-cols:
> +    type: boolean
> +    description:
> +      Drive inactive columns during scan,
> +      default is to turn inactive columns into inputs.
> +
> +required:
> +  - compatible
> +  - row-gpios
> +  - col-gpios
> +  - linux,keymap
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    matrix-keypad {
> +        compatible = "gpio-matrix-keypad";
> +        debounce-delay-ms = <5>;
> +        col-scan-delay-us = <2>;
> +
> +        row-gpios = <&gpio2 25 0
> +                     &gpio2 26 0
> +                     &gpio2 27 0>;
> +
> +        col-gpios = <&gpio2 21 0
> +                     &gpio2 22 0>;
> +
> +        linux,keymap = <0x0000008B
> +                        0x0100009E
> +                        0x02000069
> +                        0x0001006A
> +                        0x0101001C
> +                        0x0201006C>;
> +    };
> diff --git a/Documentation/devicetree/bindings/power/wakeup-source.txt b/Documentation/devicetree/bindings/power/wakeup-source.txt
> index 27f1797..66bb016 100644
> --- a/Documentation/devicetree/bindings/power/wakeup-source.txt
> +++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
> @@ -23,7 +23,7 @@ List of legacy properties and respective binding document
>  
>  1. "gpio-key,wakeup"		Documentation/devicetree/bindings/input/gpio-keys{,-polled}.txt
>  2. "has-tpo"			Documentation/devicetree/bindings/rtc/rtc-opal.txt
> -3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> +3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
>  				Documentation/devicetree/bindings/mfd/tc3589x.txt
>  				Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
>  4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
> -- 
> 2.39.5
> 

