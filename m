Return-Path: <linux-input+bounces-9090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF5BA06F71
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 08:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ED543A412D
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 07:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F285215060;
	Thu,  9 Jan 2025 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="nNIL11u1"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2052.outbound.protection.outlook.com [40.107.105.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915C204688;
	Thu,  9 Jan 2025 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409227; cv=fail; b=SAt+XKi39bk62TBJPVcSP6u9zQc86UI2gCFaGWkU2+w3c1NvCnVCZhTpL9ibFe9KhjYGkS8ZH4BNUVCX/FiUJ+Hj9cqhArIB2WlJCOzW4MDahucCXb/cvAB8HTRNq0d9FoxC7WttnYO9kebUJ5AvZ2h+ckn9XaKvgDa63/x9Xr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409227; c=relaxed/simple;
	bh=+aZjWVrupKNukoF4xQtFNi45VdLrJisxbaRD0WGrEb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FFBWtGdS2lzPXAEc9wS4Uacm/iy+gf5fRDlcEt7iHIu4mQch0BtqC0xE2yS6ZO44cv7A1aHShFR8UkiAiD7UhwFrywQ60OdSXksNla7dUNT4CaCBDFXrLErt/PXSyiNHDs8TMbfC/GbszH34sX9Ea90wu0pwQ0e8GGm+INPyGbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=nNIL11u1; arc=fail smtp.client-ip=40.107.105.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYmJvgLgUyKqRPq05K/ob6AqSDwGqn/oqks7Kb28H2jGcA3V4xY/uSSTfdp7UydgnWKQMPIpKQRw7M/ohfK4OnZZDQ8v7oBcfTMtG8WjCD8DQWxopK3empMULWhnuwb/TqTo2EbqVVTyRJOO5qhJ6SsS5/xY7La8TrR2ie5GixFM1B4jvuWu9AgHLdA3EFYKmILCMBaTnP3X4YgHGwkCNJC5U9PPbxW9qlQNO4yX+6z0r4I2cvdN0a0zLbYCk3nG7V99XMjXZKZPMG6xditn2J/pjSQBuK2JFEAYKg9I6TZB+TA53X1hPmXmjz+yiLdE4gbmRSWNasrYRzt0hE+PPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LNHEgGkCvB+bM9k8AMhROCIjrJTy1oppoZ8emVZQMI=;
 b=szvMTdxTzmRskmUaIEuKHSHi3Mzw+Q/m84LOzXR7u2OkolPdguxT2MN1eCSls2MfY9s3UyocQA+FbhrKbjdxeUoMfyQJUChqU63SJ/FFsaPxa2lYSw29HVag+dNOz/2sLapv0+sMv5989YBDgzk+0Y1fCdYuv+VFayNlC3Mp4432wSNywGzniUGAkpoJQMEJB/IFhiK5Tpwhu3oZuL89p1AJSqis2McaUtbIHNn5rV9kktauUYELMyVguJ7XnDW9xM4z7NMaiuHl04pXxj2xpE/D+gVe7wFXrbho5ptS1tvJGjnPF8wF87YzxsJMLSye0O+c11znkSpDHvDT/ADBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LNHEgGkCvB+bM9k8AMhROCIjrJTy1oppoZ8emVZQMI=;
 b=nNIL11u1XZPKaBEGfOcR8AEb14gMcAeCRdt4lmFzFYu45dmy0no+HZj+BuEilsv9G8wDGzcvAHMRNVSO/n9WWLvk3iQbLVVnTlQxJduvTU6uOrUsx3Q2OD0zhRwJrWiLF2jx32fg4PDd0wIQ27mybpqM3IIpRNA9+2hktwmoQtpVY/q0Wr7nAdcngKkJUCPyQKGEMsFP/YJ+w/J6+O2tJyXWp2tLGwrUyT33T2jV8DaTRdNKyuNmJxdWyEhwlkZojjcpEAD/nog1qfT+oRkX8qkBZd3DGN4zKJ7sS+RR06JVdETnBdi7hMLjjTKR21dZ5N8Tj9z70u8MjV7JkdkknA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GV2PR03MB8582.eurprd03.prod.outlook.com (2603:10a6:150:ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 07:53:40 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 07:53:37 +0000
Date: Thu, 9 Jan 2025 08:53:22 +0100
From: Markus Burri <markus.burri@mt.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: EXTERNAL - [PATCH v3 4/7] dt-bindings: input: matrix_keypad -
 add missing property
Message-ID: <Z3-AckOUj0EX5gsh@Debian-VM-Markus.debian>
References: <20250107135659.185293-1-markus.burri@mt.com>
 <20250107135659.185293-5-markus.burri@mt.com>
 <20250107192701.GA1329697-robh@kernel.org>
 <Z39m6JKPOuL7eikT@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z39m6JKPOuL7eikT@google.com>
X-ClientProxiedBy: CH2PR07CA0059.namprd07.prod.outlook.com
 (2603:10b6:610:5b::33) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GV2PR03MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a32d0e-3388-4515-3799-08dd3082b9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dYmZk0qjaNia0mniXr0Vw598spA6g2ykD3dkemUOtRX3DgV+IiugmMZRZ3rS?=
 =?us-ascii?Q?MgPSjM0+Vr6rQcu5VuGuf7QtBVOQEQ8XhRUnn5byzzm9YXrHG7EZDieEl5Ng?=
 =?us-ascii?Q?G3WK5y40flpyynR0z1EqDwbNtxojDaof8t6zkb/eg2/rZalMK5fW/kLZ/tct?=
 =?us-ascii?Q?q5cWdKZeg8P1tiUIONHF1unGLAX9ALk5dWqMX1FI/ZpDn1aTKcdsLtwMuzZa?=
 =?us-ascii?Q?a9DOf0OCbyim+Dp1qpodSfGaxZApYoLEqE8jCbKBsZchij9X35Gic6VUhU1d?=
 =?us-ascii?Q?MbtSz+PPNUOR4dRXGuqSTdHnvr7jkGhxMRk3ssS14SidveFq/vCnKdRnn4sE?=
 =?us-ascii?Q?GuzRG1u4LJyGnunxUV43t828KVFq5xTLT9j6twcfEWTft/ZQcoHQpiohWKGE?=
 =?us-ascii?Q?lWB9GDI/f089dK7czTm0XbLZUQV4o0NRrLu9qE1Wqy/c9/Z89euzT3sMx6sb?=
 =?us-ascii?Q?ufQyYberPgdHHiH9vczbYG2CbG1tnKO0dsSgFGOLcWUL7R4YtojRdZVF74ET?=
 =?us-ascii?Q?NNSMFb5EjF57TrssCku1NlbLx7zwoHf3Rpd99M70VnPHQzdibGYxXbrg9j+a?=
 =?us-ascii?Q?P+avGR1kXrKwNCtFfnla2MG1TRzWz/yvFe2v/Nna4+UDBDmmYw8I6dJtxZ/h?=
 =?us-ascii?Q?/IvuDt/S8Q32AdQ068kyR5No1qMf6oDzE1tXgU+mSL0yy8UeX2hruLuZwO2z?=
 =?us-ascii?Q?PDbnRXgK731pOD+LADkr/CPngu4Ex8RjvkKfD2rvGYEilkjB9nkl026cU9cw?=
 =?us-ascii?Q?f86TSQsqedVgvKI0hbqUJLOVPPw9cYxqHoQAOqxrZJ1vnu/JklUU78Nu4Z1S?=
 =?us-ascii?Q?RjRos8ll0RrjhPAOSlAeuGt61ouJA6Ry/iALp3D47FE/QqIxlxGpLGi0asKu?=
 =?us-ascii?Q?xAGbETIApots9Q8B1jU/7Lry+NzvDiYpPAGVlLmFPM2GHW9EZ/FfTOU5Azce?=
 =?us-ascii?Q?FYErr2QVZK27erGvispnVuPOnfOYBrK+F6E2dtsjpIGOx6ecbn3uuYK/Zyw9?=
 =?us-ascii?Q?rE99HvJIWoAAQuUzj3uVq8PxxKJFG1R8onD5jdPXnhaiytzMCrKRKQi0X02K?=
 =?us-ascii?Q?Pxl3xStPThDBgSQHD6lBsca7KHxF/eqYolc4mXt0JG4dqUeG5OfH+5ncL9ef?=
 =?us-ascii?Q?EWwq1mBYwSmpCXvKwX9jHizCxkDkwcCRoyBSwRWqE+Yysdyr4ZYb1sLC3CAt?=
 =?us-ascii?Q?FpVd/ZbXI0Bzg0zZqf6oevEZpHAd5h9MS4QFBEwirbE/gES1KUG7FpGACvFv?=
 =?us-ascii?Q?ZTZYpKDVwGjNPma6DFGaG04sQ9D5CK0zeqdOUqTq56NDl7OTL60bt54BKlkE?=
 =?us-ascii?Q?mRBQrKoNFcllC/YDedYyrbZ6Zi05FBuJC7RjjO56HpS52JpE+azf4bbhVUqk?=
 =?us-ascii?Q?ub7mrbS8NH90+/g+vttHRzYARoKlofhlgoHSBieAHH3qk1eiEBUsO4vjSRTl?=
 =?us-ascii?Q?m5HjqTebaT/l0BTvywIsKCytSiPL9IaQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ehLuZCfgoUuTChENPfbRXVfzhxJcPvdh4YPJUahmyCwcZ4xsc7d5zgxAtFpP?=
 =?us-ascii?Q?GQiblkwzZvxpGJspGGDadr86+d+0ndgVahbw5sYObWKhV7okwrh9PcCtOhK+?=
 =?us-ascii?Q?lx8YMw3BszAoGdfy+RgRJMFsBObpcjJ79bTt0MKE0bmYfJ3v3frCezQVnXQn?=
 =?us-ascii?Q?6+WcYDRM5kJKEOHu7Wnx/EWotM103L3WLUYFHUQogSR3ysv1BS6PPblMPi9K?=
 =?us-ascii?Q?9kKq2wX9lEl/BNOKppUhwkLz9SYtZRMPc5PNWU2lExmoA3x8zCtt/yS/E6Am?=
 =?us-ascii?Q?mIBRmddsWyHt82isKpokMeAeB0lwbxRSCq0PxK0NChnXFVfkSlx0byog8V3O?=
 =?us-ascii?Q?j97ysL8+h3O9jL4NT0+YpyJBRTCaU873vBfo17p6M0Kx1fH7/6SaspkDdkaM?=
 =?us-ascii?Q?pYKHu1C31AVcpLhRpcMVU2akuXpzYDijw6a9p6S7XZ+Tp2fvyKvw9K+frzEv?=
 =?us-ascii?Q?50iMkwdpfgwR4W/OL1Z9i74bgHKpbLOWqYD5h0ljVeziNpptvQmvq/YJAlEJ?=
 =?us-ascii?Q?3RuzciCo8PViOs5d+Sco+n4kV7iOjVXnhS/paECMM6H8ss35Uo88kd9IYslW?=
 =?us-ascii?Q?uSXLFi2vhWsj2x/tqNuze+njw905Bx6E0B+MKicVKkDF1MgDmYmpRGoKn3nk?=
 =?us-ascii?Q?qvmhc5OocfeuwwrWuyDxGjMwHrTegZLjKId0eHJXdXiDxy61fjlVq/GccqO4?=
 =?us-ascii?Q?qrKnIwB4QutCHiAh7x3gRh1Wc1G+MtVrSpyPNizirWozlMtM9SFl+18DKtD3?=
 =?us-ascii?Q?R24/NT1T1RlOzClvmxOf2HNp5WW8KtgF7ZPXatZOo3GXhrg+mCkM1MUC5qxP?=
 =?us-ascii?Q?lWv9qiURGlgExohqfFnMCkb6NHXU3zy4Jcwi5NQNVJc4gJ+rf8+yeZ3Su6W1?=
 =?us-ascii?Q?7gLZ9mkG0+YqcHd2IgUxfUx0OEKy2U3Lgcg7wqGYW8a90SQZCbTb28ggE3Bv?=
 =?us-ascii?Q?bsoWihogXVssMX2wOEMQjVlxB7NpieA8Ur+sh03V3hWVpt91KsMgs8yjJqjA?=
 =?us-ascii?Q?GKEv4nlDYaiDDcAgXaWW+veZrpWUYuwRmetYzuLEfvnOhw0Ny7txNmwN4WT/?=
 =?us-ascii?Q?TdxS2rdL0zzv2OgyiYDaWRxf5YYMGS6d3ab0nZ0sV8Nt/GSrSYGV4Va1EytJ?=
 =?us-ascii?Q?phLffdFhHTuGceztJ8fXyKDO5coi2sAPGzPqRVrhJruPGLUQUnmA0Jt0o6zb?=
 =?us-ascii?Q?mRMRkZeyYq7UmSIi9r0PFQwQGHlIujXh1lKRttSh/NefPmYgFK3ldiyDTn1T?=
 =?us-ascii?Q?rSocUpob30Yzfk2nqQ5chCH1wzFka82/+uQk0w9DAMEotDKAsMry71dK4dRB?=
 =?us-ascii?Q?HWriBGHAi9FU9BH8CLqLNFJxbavxKkVuHY3GIB0uvfs+p3zDc2dbsnf9zyDZ?=
 =?us-ascii?Q?xUnC+iCKI67w3a5XP9lf7ZaBqXbDsl4TDULrc4dgq9hNgYSWJnjiYt8nojuU?=
 =?us-ascii?Q?brtp+5TP5bn3APUyZOZIUDD50IJf5KXmdLDxI6dkka0tLlpnxiFAWA/a3Ey7?=
 =?us-ascii?Q?B1HyU11Z+HJLcmsmWj7wy+SWW27Cqtn4+l+ZSitzCNABD39zibxW745YaNit?=
 =?us-ascii?Q?gjSXfGnVM6e2NaQlUsCRFUa8JSYUYi/mNj9hwA3g?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a32d0e-3388-4515-3799-08dd3082b9b2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 07:53:37.9027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1v1WPB3GoBKVhPaBheeLekLyILalY44nKSM/kRrYT83cPBNrEBfGObs1PbvYb5FpkO9lz4cUcM9+VmwwvFf9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8582

On Wed, Jan 08, 2025 at 10:04:24PM -0800, Dmitry Torokhov wrote:
> On Tue, Jan 07, 2025 at 01:27:01PM -0600, Rob Herring wrote:
> > On Tue, Jan 07, 2025 at 02:56:56PM +0100, Markus Burri wrote:
> > > The property is implemented in the driver but not described in dt-bindings.
> > > Add missing property 'gpio-activelow' to DT schema.
> > > 
> > > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > > 
> > > ---
> > >  .../devicetree/bindings/input/gpio-matrix-keypad.yaml          | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > index 75975a1..b10da65 100644
> > > --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > @@ -38,6 +38,9 @@ properties:
> > >      type: boolean
> > >      description: Do not enable autorepeat feature.
> > >  
> > > +  gpio-activelow:
> > > +    type: boolean
> > > +    description: The GPIOs are low active.
> > 
> > Ideally this should be defined correctly in the gpio properties. The 
> > problem is that does a 0 flag value mean active high or I forgot to 
> > define it. There's a similar issue in spi-controller.yaml. I *think* the 
> > problem is better here since this is an active low boolean rather than 
> > an active high boolean.
> > 
> > Of the users in the kernel tree, only 
> > arch/arm/boot/dts/ti/omap/am335x-guardian.dts got this right.
> > 
> > So I think we should mark this deprecated and put a note to use GPIO 
> > flags instead.
> 
> So is the proposal to force GPIO as active low if the property is
> present and leave as is if it is missing? Because current driver
> behavior is to force GPIOs as active high if the property is missing.
> 

I do not touch the current implementation.
Currently if the property is set the GPIO's are toggled to active low or if
the property is missing to active high.

> Also, what is the benefit from having property marked as deprecated vs
> not documenting it in hopes that DTSes will fail validation and be
> fixed?

Good question?
The dt schema checker will complain since it is used in some dtb's
I do not like to see warnings

> 
> Thanks.
> 
> -- 
> Dmitry

