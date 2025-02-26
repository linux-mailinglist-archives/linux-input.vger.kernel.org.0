Return-Path: <linux-input+bounces-10392-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF9DA45E87
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 13:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB3091782B3
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 12:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF965221F1F;
	Wed, 26 Feb 2025 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="dm9qOjIa"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24D21ADA0;
	Wed, 26 Feb 2025 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740572079; cv=fail; b=g5OW/KDF9KakToNrC1hZZZ6jzBvH2hrG/l8OqSXp0Tzn981WEoZ6qmtv0CjYq0PX1aVDRjtPl5d0I33HPkcffeOmXxJlFS4daNnZRSWh5IIBr82W8mribblBJJUt6P9iEo3bwud8ONDutSL5AdqW5nSNmlDsEsRGvioatbtnu5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740572079; c=relaxed/simple;
	bh=uxTp6lIY1ftRZ1JqEU2VUQAmdFlTbd5s2seMMII3DFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CeXIJ14y/+iTx3NHl6VaJ3e81qnh2u/s+OXEqWZePWkZ6kwlGe9Z5Tiig7K3k7c8AjLcWa1xld8js8GxeRPSPtWbA97Fto0dD4tnFByza0YtasS/U9GSkxs91bkqz3nxmN+n/SGD+R4sB4xh6RIg0hqEh6kapqroPcG6K0zirqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=dm9qOjIa; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+uTwvII7B6z+fVNbGxhD3pmdaP1qNzS38mShtiv0m+dXIp0bwB0jM9/SrsTV33i5Zn7zG5YAgD30DOx2hh8AsT20H13DWCpR+OL5LRZB5EAHaH0dHVo1xgNby09x6ibVDPdLlnFbQgbqKj4ru8aTaAJ2ctT1aMM9xwOS1PBLNXbYoPii69UAAgyVlP3yVzHgw8zJDJ/zf5GDYA7pTfKWoN1ic7P0JbYJ9EZAFYH0B9hAszWQNKjOgF0bwKcGTdGjL2xSVEB5rxmS5FdBL5jBTuUYMuMYdRbx+dpOpWnTDRd9AWD7GtAVO/Sf2gLjfV6+P/SaRjiU/LLsKPcRzecvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B61wdlS/R6t06ADViyv8/5866fAaggilcKFP2A8TkM8=;
 b=dzV0QCw+iY8mZiEIlW2WKvdAVE9CDkvUs0QshhkRqu+7r08AVzflSs5A4ob2rLLOkjuTm6pC9Yzpmhw+eKtKaZRYNwrSEysXkqkfnoBPZyNfPMGQGEzceBDlaGrYDBu7gGwXiB5mJ6qFJpk7Bci6squv6H/DQmBHZcc/lRrTo9nirsQeuzrnHsV4sqPobxqTL4VTHKf5RQSUSEAipSXQOVqpG0NccRsSQ3KJFDeyENtnFz1x2D8PA1ZC6ciTiXWdgs8976e9F3/bIQ2rnpsGGQx+bS2lKsan3w1/nse0cm+/jtQWCYdFGq3yomSpR2jnCFgqgjw9N0FqMD5tQ9ocqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B61wdlS/R6t06ADViyv8/5866fAaggilcKFP2A8TkM8=;
 b=dm9qOjIaG1U3fxUm+rMhAZ/oR+ZWT0KNG1cGDcE0yALRwWi9kA3ca9Fbn9gZRJJoZC1EbFKMeFv/WLaT5f2tGJvAbmx5/DM14/qU53KK8gl2PpeJhtkbl0r87Yy2ddKAyrFq0GC/XVgkxM49xTPi8T92IQIjvAVoVnkUW3Wh6LuRf3ayRKfXP9UYG3b7ucwcyMVpigw5jma5WiR2T+KMGbbLQahCnT4E+dlso+Og3mC/Y5ABRzVIcYJic/UZOXiDXiEscgb92jPrdtbm60f9qtLZqfbcav1iunQ32ZKZjKkcm0Ode0NSAqE+hNLmo/ZsVGXktq48I+66n7/UquARlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DU6PR03MB10989.eurprd03.prod.outlook.com (2603:10a6:10:5c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 26 Feb
 2025 12:14:34 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Wed, 26 Feb 2025
 12:14:34 +0000
Date: Wed, 26 Feb 2025 13:14:32 +0100
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
Message-ID: <Z78FqFn-Ptvh-2ub@Debian-VM-Markus.debian>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-5-markus.burri@mt.com>
 <Z7YJ2ENZ04Nktnwf@mt.com>
 <Z71nMdTvyIg5a85Y@google.com>
 <Z72YZwBuzW2D9q0b@Debian-VM-Markus.debian>
 <Z74BOePro-J4hSTD@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z74BOePro-J4hSTD@google.com>
X-ClientProxiedBy: ZR0P278CA0136.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::15) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DU6PR03MB10989:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a435f33-fd19-4ca7-563c-08dd565f21cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7mM/jbhnN8M2CQ2V6j5A0+rGlIrmP+g5IqWYImABiQEJUpmTuWHC1VfiLoqQ?=
 =?us-ascii?Q?7NS8ttH8YMABvqxgD6nb+o8Bt1PBPf5QoQZsM916fNvGBLBIe/3nqEYL5TUU?=
 =?us-ascii?Q?ZnQ+WUqSPCAQpLtXbuCcC9w5AYgS848G4EMa1xg+O7WQxT0gfyVVf2jIvXjL?=
 =?us-ascii?Q?qaRtmsf0ht+n0/VE+AL2AHFgcIVscY+X8AQSkqum9baC4/hl8krp4Qc20/u2?=
 =?us-ascii?Q?oMvOJ4TeJBFOGaaX4WWG4LdC22hAO+f0M5lOXuMC6ASU05Rs/LEFNsUjnidg?=
 =?us-ascii?Q?zDWzUb6lagC+LCwHi8+YM/bKfPWXcnEbF7aG1RCSJfjnaR0O3xp2oEn4LrU/?=
 =?us-ascii?Q?ogmLoeX4sDEvGoQZwP0U77qBVx/7R6oAC3YrlJ8rLpN/gyWej4eS2RIp/JjF?=
 =?us-ascii?Q?2ECHiyrXZGqcQWEnhn/2usi3PtKWDp/LyWp77QBYE6Zdid6HlZenL+4TY1nw?=
 =?us-ascii?Q?D0rblURicNnkPpzcpPKmBep+mCDq1Fhb+97WBex6nBuYdzaIN9JWOrfWautv?=
 =?us-ascii?Q?xz9HEiiJdW43xv0xtdZJWOb3YiXITGx74wVcwpgkp/3bQE0RgjECtK6cuD+u?=
 =?us-ascii?Q?pBiLtwWm5hmwlq05tOcH3plcNCYW8K8TqMNIzetU2I9gHT/qQ4u3y4yrfBzJ?=
 =?us-ascii?Q?UHWpyys50zHJXnENrivJXIYAl0m2bISJ1Q3LBcQFv2xqybd61PyaHvFeKi2M?=
 =?us-ascii?Q?s+k2HSXICcOXvMRqjxkqM8q8q7YiKBP5TCfhCsuUSyOXeXGD2cnINpTBVhN5?=
 =?us-ascii?Q?nw6fCMyBQaVuiFcNIc86zs2NMrFjzWnVErz+kkFHpbBaA2rfGQH5Es3NcN+N?=
 =?us-ascii?Q?oMcPsMQ7ZGfFkhlofn1m5Zu0VPhxiZfYg3XpqnLfAoItBXd8kuXl/xXrmziv?=
 =?us-ascii?Q?oVA8HDZfijLMxwQBG0/Nch9qXVg91jISdHNh0Ig6Q/1jtc3gpPnMS9u3XRdI?=
 =?us-ascii?Q?HRH0pH2PrbIbngi/rk8ZWHl2NpvtAj+WZ1r0AulURMHBp9MvjzVUgSK9VtNV?=
 =?us-ascii?Q?MZeGBYNeiXDqQd/gOoIoZaoI7z7GzMMrcHtX90PgosvCPFIMTYCkQQGFpqhF?=
 =?us-ascii?Q?bQReI2fZDR6/rF4yLsbCYGn5uyAN41kP0Ad2C4O2pss4Jx/etHums6V4wIAU?=
 =?us-ascii?Q?cfP3F27xD1SVMf3ySgDg7K9G1xPaZcjDlQgQtjuZMTMPEoD8MYbtpe6R4Icq?=
 =?us-ascii?Q?L99CoWjkNm+mQix9XnY6/Mk667HlSv/NVNjE77l+fouEV8Wa0f8d847/gCp6?=
 =?us-ascii?Q?T8HlHg19sz7zY5Ei2OQqa+FqmLoZaXMNaLNeyYrAa3prLRJseK5fsjFNFnkq?=
 =?us-ascii?Q?woJFJ5RQclLfRl4wGW7lcg5uA/EdU+s4mKD4TTDz4AlIjeHKipvdSyylkLgJ?=
 =?us-ascii?Q?iIVE+PQSLJ8weY7JI6orzQQiAwLnDTXA9jSujTHhL1f+xeGxhE+PSmbGwMLC?=
 =?us-ascii?Q?bQcOkGdGoPz44+g+6urAcXjtUN0naTJD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJFwabfd7vIZuXJXOKufYIDQEeLQkwP0gZyfKAIeDJTtCSPIyUfCtfkQO/Cz?=
 =?us-ascii?Q?Plxg4fIxSaSU7k0hpC66mv0mBvyHvmGJ2mHbiTr/oEl0nV5E95bGTWgxkE0U?=
 =?us-ascii?Q?Aq57Nnn/6F5V3e5jPwk+eOFoTZar247H/1qQ01w0+hYBAA+mrF+7wirADuWK?=
 =?us-ascii?Q?4J67Szce4yGgxKP8Z6SJbK1Uqsu/wekjKEhk249Zm54BVxlCAB72Z26+REy6?=
 =?us-ascii?Q?5H9zwGH9hBVyol1E4ho0VVSbJaQczWkdPOiDznOSvCRrMaVHD6EjLL6eHfTO?=
 =?us-ascii?Q?2sLSdURqoabHSPyWfKC+1ISqpG/lEmSGYW79fyxZy0cntEK3feCGguPuPknf?=
 =?us-ascii?Q?5cr6CBGVzDB2imerhqodfWCFKDCBv3nXUxAkB1Ubp22785LT7OvwzknHVJwy?=
 =?us-ascii?Q?uLrcxiUdZix26+pT765w9aNjgNmI/9cfnHPyzQ26rwqvFZR42Es69Nl3aEN1?=
 =?us-ascii?Q?GGSm89BoNgSdStJDI8f2lrdQPe/LiMvpF/znYqQjFPqOnixCtSBymlaTNo/1?=
 =?us-ascii?Q?68adhbPAWRYh3jeqrEpXwQ+GQ4r1squzBJ4K46KVUYpitfjAOFqXgqx7t+7w?=
 =?us-ascii?Q?O3NLWMqYYmpIy1MePvUHQr3zq8pem0/yGWvLpaQYR9XOyAkNys6oMlDL7O+m?=
 =?us-ascii?Q?joGgKU0PuZ3p/IMfqEqv8A9vPh0tYRL7pLXmCapghv/lJsOkoT01l0FnA8q6?=
 =?us-ascii?Q?uFaSNKyt6VI9EDgYylkvezBLKwky+VqzwyYPnBiiON0THSn3oTljbI0lzkcG?=
 =?us-ascii?Q?fBPIbkBDT9035FHrIRQni2a8FxHQ+lP3Hi8Z5WeOrfelpfz041JlPGO1d7W7?=
 =?us-ascii?Q?rEoOuG47aciAzOoItM18uerPGQRZKxCA219g4X6RSeGmOnpillYjZ/1xQI3V?=
 =?us-ascii?Q?mKKMywCHF5BT8xG+NNRDmvcjYiIOrIVFe96tChP7M6ypHTeCvu2z1Pz5XLN9?=
 =?us-ascii?Q?LCw2GjYHiGaviuhk/kX+w+PI/wvGsPlVDEzi9jJkuIJjHxPTP9BApW5ZbRvx?=
 =?us-ascii?Q?YIVoVT/pBciGoGvSEp2kwQoGp86ehZFrcrKFExGkYY0pWpZse0LIAgiPvK4w?=
 =?us-ascii?Q?c6UyzenYozvALLMeHy+dfOzQghegFtrEiA7Mv9WgbTCTgiY60mBtS/8baHTS?=
 =?us-ascii?Q?UspLYpXOSy65+iSNdBlIUiYy+OIE91I6RCjTZPHWPcinKj1o+9YmtJp0DMcJ?=
 =?us-ascii?Q?cEDNR54QJNw7VMJiYp4cNbi15KWIfxm9w01Bl9bLBvdCQ1RY5mjH/fkBzJM6?=
 =?us-ascii?Q?zs60nRVZP9tjeHdleBPG1WaaiPGUoOjaUqJRWaTVXaz7WI8+R4akOkqpaE15?=
 =?us-ascii?Q?2Uv1gbEhEj2WZCyvo9fS3hY/RVJ5W5FysxnFnOcesTRIoI+Ck+9VEzqYiKKR?=
 =?us-ascii?Q?O2bLmiccKpUud26ouSybDGtL2xvT3PGlwg/LONJY1wqLdZFeNwdW6BCKZcXa?=
 =?us-ascii?Q?nmjmUdE450a+cwpGSMdd8aToAmptt6G4viplziUayyJKodlSEYYpXcLA4phZ?=
 =?us-ascii?Q?dkQcqqmAkVB00rpbdKFb/MsxZFEBJ4HN8yPqyyx4Z6pV/f5HNcct/Oz2qQaI?=
 =?us-ascii?Q?WNuRj8qDV2x1CU89KVQ9yMleBqZ99xDseRQ3PF/G?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a435f33-fd19-4ca7-563c-08dd565f21cf
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 12:14:34.6843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y11QgI1I/r0XfILwG8ONFMzUzAgBZQSovQ6AAsOFXyIMwxOjRPZYdILvusxCe2lZa3LhwmpAIuwi0vA53E6aVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR03MB10989

On Tue, Feb 25, 2025 at 09:43:21AM -0800, Dmitry Torokhov wrote:
> On Tue, Feb 25, 2025 at 11:16:07AM +0100, Markus Burri wrote:
> > On Mon, Feb 24, 2025 at 10:46:09PM -0800, Dmitry Torokhov wrote:
> > > On Wed, Feb 19, 2025 at 05:42:00PM +0100, Manuel Traut wrote:
> > > > On Fri, Jan 10, 2025 at 06:49:03AM +0100, Markus Burri wrote:
> > > > > The property is implemented in the driver but not described in dt-bindings.
> > > > > Add missing property 'gpio-activelow' to DT schema.
> > > > > 
> > > > > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > > > 
> > > > Reviewed-by: Manuel Traut <manuel.traut@mt.com>
> > > > 
> > > > > ---
> > > > >  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
> > > > >  1 file changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > > > index 0f348b9..9c91224 100644
> > > > > --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > > > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > > > @@ -40,6 +40,12 @@ properties:
> > > > >      type: boolean
> > > > >      description: Do not enable autorepeat feature.
> > > > >  
> > > > > +  gpio-activelow:
> > > > > +    type: boolean
> > > > > +    deprecated: true
> > > > > +    description:
> > > > > +      The GPIOs are low active (deprecated).
> > > > > +      Use the GPIO-flags in gpio controller instead of this property.
> > > 
> > > No, we unfortunately can not rely on GPIO-flags. This is not how driver
> > > works: current driver behavior is to force GPIOs as active high if the
> > > property is missing and ignore polarity specified in GPIO property.
> > 
> > So you mean this property is still valid?
> > Current implementation toggle the GPIO flags to low active if the property and the GPIO flags are different.
> > So in case of missing property (false) the settings from GPIO flags will be used.
> > In case of gpio-activelow (true) GPIO flags are set to low active.
> 
> The driver does:
> 
> 	active_low = device_property_read_bool(&pdev->dev, "gpio-activelow");
> 
> 	...
> 
> 		if (active_low ^ gpiod_is_active_low(keypad->col_gpios[i]))
> 			gpiod_toggle_active_low(keypad->col_gpios[i]);
> 
> f the property is present active_low is true. If it is absent active_low
> is false. And the code below, if GPIO polarity setting from DT disagree
> with active_low value it will flip GPIO polarity.
> 
> You probably think that gpiod_toggle_active_low() sets line as active
> low, when in fact it flips to opposite setting:

Yes exactly my fault. Thanks for the hint!
> 
> void gpiod_toggle_active_low(struct gpio_desc *desc)
> {
> 	VALIDATE_DESC_VOID(desc);
> 	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
> 
> 	^^^ flip, not set or clear.
> 
> 	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> }
> 
> > 
> > So I will remove the deprecated flag and change the description to:
> > "Force GPIO flags to active low. Use GPIO flags if property is missing."
> > OK?
> 
> No. It should say:
> 
> "Force GPIO polarity to active low. In the absence of this property
> GPIOs are treated as active high."
I will send a new version of the patch

> 
> Thanks.
> 
> -- 
> Dmitry

