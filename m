Return-Path: <linux-input+bounces-10339-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D58A43B32
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 11:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C19166B30
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 10:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B7E263F35;
	Tue, 25 Feb 2025 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Q7mGLkOx"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013030.outbound.protection.outlook.com [52.101.67.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C0F254858;
	Tue, 25 Feb 2025 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478579; cv=fail; b=QfEhqJmhGn8KkpZBgIgFCd15piuEWMbUUe43xvaY0t3XfVFPGLvUx3RcXA8Pih4UcnldksaBuz/pEHpFALS48V7s+E80h8XNJALViCft3yIQSQDoNSw0y7SOMGX7uPr4uBAvxZuoyBEAAzjhyvcVvAFDW04MRXnkfLR4nzRGSz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478579; c=relaxed/simple;
	bh=N5j/pVl5wm7CfWMe1u1lb6D0axUYLO0/uVWv2UpH4+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S1/30eIsU7I/kzt7dOvTw/+B1VyE+ZIwUmPAtH0r8ldW4blf8vIUV9p3D+T5fVBi9Q+5wwkQu5tmLIlJIYi10aO2kqyT6kVJgJOjRl7V571whJBEfEu9QGvjoAobJ+JKguWNDSRJovGRLDnSsc+iA4/5wHfd8MC9o+gvI3sGw9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Q7mGLkOx; arc=fail smtp.client-ip=52.101.67.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzuydntMM5/W5Wq7zLf20HtZHzCxJcOXMnF0gOzy3g6g9avAph7b9dNpnFIsZ8jlCYQ1nZ/Jn9kJO2Qm48NuQPtDoOYFJxeBHK5Nn4Z8g7r5Itxjupi8p8W+WJbeIRE4zfbVF6KBcv4jwfX8m4BaEQNYSke7nY4pPzu/CQLKGxL15SqHzNlTnYUlp0QABnPd7OGTwoZ5gOE2fl9J6tYhjejiMtSu8We+GtBB0rC9GIne65p+iTFrRw3wnijchg1bkZKD727OaTb5rwADaUk+aY/9V6d5JziDaoPdpo4WdYVDJeIxjHHif8inzSq8bezdxlSuPm7yS5Vb9zDuSyWNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd6kuu1SJ/t3uyQ0xl5bfhExD8kUQVAAwgbe/gRoPz0=;
 b=nVJo/zw6+ToczPD9q/BoGdC+Zxl+OlsIdNavzZ0J4tcS1NhY3GHfqsuMD+/VC0wLSeyVOs5Cmn+CZpBYAMSHct9LPXRxMAqykW3DgIy0t+3yLBGXi3pVXyuO76Q1dn+j4REKm5h4ey+adHbx8VIwLiqLhChiWcQxNuLJYZgaC2ETRfWySMKUKBYrxtlTqpGXxuejhzrebbQ8PH3sj2X+ZJwS2NYDXcXR71s8KriZlmtirFSMpdU7PJRJC7PgCT+aeWmPRj5Twt1/ag1GYs9B8cMGVKi+HeX0wo3gOPeoagczriK75SRND9o62GuzK8y42QoeSI3rk+SLqsedpzgc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd6kuu1SJ/t3uyQ0xl5bfhExD8kUQVAAwgbe/gRoPz0=;
 b=Q7mGLkOx91pue0PJi07bztrun8XVqVnB7ql+xl/s1PIR9YrRNNY5K9miQ6Kb0ux8kP5CVRrTeGZtEpWt5nR1wTpdrEWbDZoe+m8frkjhwVLxJqIn7Mzy3LEBobvxscqgjyn0r3H/ppRiZAmA8acMi40ae41b0qShI30ykGim3yBjO7u/TCrdkQ9RcoyqP5+gr0NGZDjHw0frMqQM/kh6fscMadgkHubCYUj8Yupm5ypumCFk82FNvv6dNXPNStmBUrp555/Hze9JquMMnoTuJIsTVR1+XZmaktBdMU07jsXz42c+oF+9xcfZ+AysONbwqrezfwyqLJF8vJhC1RXxtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS2PR03MB9880.eurprd03.prod.outlook.com (2603:10a6:20b:547::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 10:16:11 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Tue, 25 Feb 2025
 10:16:10 +0000
Date: Tue, 25 Feb 2025 11:16:07 +0100
From: Markus Burri <markus.burri@mt.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <Z72YZwBuzW2D9q0b@Debian-VM-Markus.debian>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-5-markus.burri@mt.com>
 <Z7YJ2ENZ04Nktnwf@mt.com>
 <Z71nMdTvyIg5a85Y@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z71nMdTvyIg5a85Y@google.com>
X-ClientProxiedBy: MI2P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::15) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS2PR03MB9880:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd90458-6d0e-41ae-bc1e-08dd55856cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DEKBnNiGU2lc2LoQHdcPSGo3WKZpBSlh406oy76v2kmLhrZnZWAjcftdxAKK?=
 =?us-ascii?Q?ejQ1cFtvknmPUtKiVUb2Chqvzju5YxaVG5jMycoWyUJI3wyG1yGcU37UoH5J?=
 =?us-ascii?Q?jE0BNRiian3KEmRFAuBuzqY9ku1EKE1cj+bbntrS7ClST9nulMz1+esHgc5Y?=
 =?us-ascii?Q?I8NLFnAVXJ3OJ/2Wq2wZK2TV1j51Pd5QUQGCr1J/pyXyAjR1S4JrOzSxt9oM?=
 =?us-ascii?Q?zwxc3AUuHtLIBRZBL0fFmyuQZRYKH4323QqQcRMlH1olcyA+FAAWiqBQCvzf?=
 =?us-ascii?Q?egeL2F6lvgHPFu92/Z4/muAV1qJ9ixs8PPkTNFxwv9Ps6rMC+jwqHfPSMCmK?=
 =?us-ascii?Q?5vMIe8sammltLedkyi4uRjD1aGWYn9jcBbEaUKcHfMXkbTI8ghrfDrjZWvwS?=
 =?us-ascii?Q?4VLlovU5fdNhWLmJd68UatyTEgBSlRuaDZ3VVmnN4/vd02XaP6vbAsHKuits?=
 =?us-ascii?Q?j1VOtyxKI9eWZSuXoRxQQgZwaT2/IVqMiSzdIU4u/1y3oz8Kv3xXkLCzozKv?=
 =?us-ascii?Q?aHl7gb2Cu3VhPyjITFFQG6LsZyxm+4xgkuJL3ko42gDGLzfl71jwLdEF9fEg?=
 =?us-ascii?Q?nZybY6sEDjT/bRGpEQpqwcegfY2ThNldD2sXD3D6mty61E1XSWK6r0bdtBel?=
 =?us-ascii?Q?3jcTxq9xBD2d/FXck3kwvy8Mm07yVb5AHrJO//Suf+s2ZqULzaXhPu5stDnm?=
 =?us-ascii?Q?MeHGDhjWyl33WwPgqIvN7AjX2Zpd4i/mrJ2qUmNT1e3F4vap3DUS5QOFgcvT?=
 =?us-ascii?Q?sVyyMRqrVtmbFHImleQCbOvIv6WCkp+Oy6QL8kuLouCA9yyQo20axX1foHj1?=
 =?us-ascii?Q?yLDpfLHG0WP3ctdtxJK8Mfz+cKUD/u3A+HKnWFlvJW4N1HVTcdLQHgHnp51e?=
 =?us-ascii?Q?wtdtTDx7qdHnZkMNsGqyRf4VdzhRIU9XIo88oHlXEb2K54Qy5PmMwXmVvnly?=
 =?us-ascii?Q?AjkUnArbSisFFmV6jUxJKbcIMtTz4Gec5M8x8dVmUA+qke5FUEtQQKDsGSVj?=
 =?us-ascii?Q?G9k8B39vBuUlEromzNP0wQ58RO+odpv+tunG7zDrv9ZB2uOKBLTC7qht/k54?=
 =?us-ascii?Q?14HpHLQxsQP2UjOcUe8kpkEB/tq2WvVSA8vZmFMPZnchKDWPQ8UGptqA/tXh?=
 =?us-ascii?Q?oQzQQv4DBo1yFrzooYH7vOGXaGAE8+R//Fmwr+C4jndDmiprOORmV1JKpFsx?=
 =?us-ascii?Q?k95vJi33LdMJR6zPzlmWvfFVN7rx9qkPu6kCCp4KSoJssPDuuyOsa5Hd8Yyb?=
 =?us-ascii?Q?MeYXyP8NFIBGrGjoD321UpwebVFKA5jcLv62TqPVss2uwo15Dnx111w6UTtg?=
 =?us-ascii?Q?A1aTM1auE0Vdp6m2FQ9XaVPcv+vvhw2WOCjy9ULGNGxzQibTXkc/rdkUQNJw?=
 =?us-ascii?Q?tN6diCQmfD7icQF9ug8TIbW+BUC/FhL6/8oW5LsrjwMOWU/KIQIQ+dh9s7fU?=
 =?us-ascii?Q?QJ+UYwIG2577fcF1j+1DKxUvkO/2nyxz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OnrPzMVcterYS9O1QhP4y6sH9X5zaJJqEx7Ge9XVI4+0WFfs56ZsKj9USnNv?=
 =?us-ascii?Q?Q5OZZUJa6NLiiI3U9XcH8JMVKV6lT5ht2t3W7keZ1hVw9sZfjVk/Iz5ItYuT?=
 =?us-ascii?Q?RyS9T4dOpM970dlJ0S4j1CV/LcPR7a6wBBE+o7TEOELK9IOqCenfyt8Rhguv?=
 =?us-ascii?Q?Xe7T8MSgpqmhyzO8ZtPwD7ekSoiBSz2oNKdj7QV4FBO/SlSFwkZC1b9joLrk?=
 =?us-ascii?Q?LoAUrqcl4WmMModqycS3/Qbr3Q/uMJGJGPWqhXZq3DMERcEdAPEwlnuF0J6u?=
 =?us-ascii?Q?VTg313WLwwwT+DSF5Yf79qTAhJxVQXiBwD44+Zk361wLDUM3eDoixG5feOkW?=
 =?us-ascii?Q?TnFJfJm8Gm+qcTusO3RS0XDNgBB7E17vlYDi+YkUimTT88m38mzx/+91J1tO?=
 =?us-ascii?Q?aZrqByFagvZbTP1PU6UJp8PXU9Y4/aFCfI2KCT7OE4+kDtwAFFxGzFlmG0C5?=
 =?us-ascii?Q?lQta4uZhGi6DhrkN8SBneAQHKMcs2ipjFq1pYheT2y7oypuar5jCPX9MWMGa?=
 =?us-ascii?Q?H0iq3vb25xIZwHyKyCNZUTrBnj5xrfrPpevR/D7cCpDphD7DFbzWvNwHuQbs?=
 =?us-ascii?Q?hCndso2/RyImWtn49zsPWsXlTRQodMsb1QYzHnolBPVlu8TJEe/Vs+nhN7sI?=
 =?us-ascii?Q?2XcuMsfDTMXOWpENAZucgCxlP2ZDjKEsnjTpG5b0nH68EeXrPSHnLHce/PWI?=
 =?us-ascii?Q?z/rqKdT0b1qDBj06SW7Km39gc/KJr8uKOjMf84OLmraaNQvJED9TcMTxy3dq?=
 =?us-ascii?Q?DuOAx5Ijg0tZnT84meirapvYi/9MnsvoT2LYWPxTb0wPAFaw7gy4Ba+zyogT?=
 =?us-ascii?Q?LJaVcIMPTUgWzLzIp9uz6UXWpl8yzXdP/T3SRhUJ4IAEicAaC08Nrm2lPvyH?=
 =?us-ascii?Q?K0xkJG5kUhHc4MPs8NqkwZbS0SL6UIlnaGp8kNZjuWpFyizQjAu/spHxwb3t?=
 =?us-ascii?Q?+uSWFqQrsk8zgDiAV4ATvtYkzL99hAVwKISMlRN4s819KZ4/PBxQ5gLDshbL?=
 =?us-ascii?Q?kpE+qPolfmCTpincir/SSImE1YdM/vHWebTkWFl9hQ554GKjpzmfuxHUNhvb?=
 =?us-ascii?Q?k6R49qybW6RATkbftdV7/EOb3L13cvUnmUTSvJFAZTlWouW/M4gnYODw4yTY?=
 =?us-ascii?Q?sHoIuuHVsoa3KF7JJqI9dSb1KWtsRyvTWx7AOpWpJdFOoEUsN12KyBb6Ykug?=
 =?us-ascii?Q?gwkvaursx2005VOkpyfQvW8OYdDfobvo2nzL9zeYIFVpQqSJwAeYLMvd+blf?=
 =?us-ascii?Q?Xv2umos82kQN1pauwtBSnHH3ZxM92N7mijzE10KdwSUhgyAxSZZsRxVnpj2o?=
 =?us-ascii?Q?u/XWxfLSwwLXZzJdfaioRbaC3KzXRtNdRp2qFIdrLX+u4hKOg/EDlDRr2rJ1?=
 =?us-ascii?Q?9uzXdYxc9U/HYBQ17YG4U23bYMqxfEVMtKF1VfAGGAtcmo0ax5UjVsXPTTjC?=
 =?us-ascii?Q?XunOOF/BdD/2HqMwla0vRI/frn2Wm/2dZT0go6JILMVRBt+79foqV/CD8yvc?=
 =?us-ascii?Q?jJn0QFHdUySgHY0hs46wSt3hpo+VU+BoMc7NIVEORVKOimwJuPFjukrkhrMG?=
 =?us-ascii?Q?QM039Ntyzw/MEtB8tpRRIciyA4+mUgyOUW/Ek4Sa?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd90458-6d0e-41ae-bc1e-08dd55856cbb
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:16:10.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEaTAUiirFb65r6QkqxqqpD+BvjXk450jjX/mHgBdypbz35eOUMlo65z2BLjPsiOXPFKWxDK9vuJy1BGZKbSVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9880

On Mon, Feb 24, 2025 at 10:46:09PM -0800, Dmitry Torokhov wrote:
> On Wed, Feb 19, 2025 at 05:42:00PM +0100, Manuel Traut wrote:
> > On Fri, Jan 10, 2025 at 06:49:03AM +0100, Markus Burri wrote:
> > > The property is implemented in the driver but not described in dt-bindings.
> > > Add missing property 'gpio-activelow' to DT schema.
> > > 
> > > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > 
> > Reviewed-by: Manuel Traut <manuel.traut@mt.com>
> > 
> > > ---
> > >  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > index 0f348b9..9c91224 100644
> > > --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > @@ -40,6 +40,12 @@ properties:
> > >      type: boolean
> > >      description: Do not enable autorepeat feature.
> > >  
> > > +  gpio-activelow:
> > > +    type: boolean
> > > +    deprecated: true
> > > +    description:
> > > +      The GPIOs are low active (deprecated).
> > > +      Use the GPIO-flags in gpio controller instead of this property.
> 
> No, we unfortunately can not rely on GPIO-flags. This is not how driver
> works: current driver behavior is to force GPIOs as active high if the
> property is missing and ignore polarity specified in GPIO property.

So you mean this property is still valid?
Current implementation toggle the GPIO flags to low active if the property and the GPIO flags are different.
So in case of missing property (false) the settings from GPIO flags will be used.
In case of gpio-activelow (true) GPIO flags are set to low active.

So I will remove the deprecated flag and change the description to:
"Force GPIO flags to active low. Use GPIO flags if property is missing."
OK?

> 
> Thanks.
> 
> -- 
> Dmitry

