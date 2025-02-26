Return-Path: <linux-input+bounces-10391-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D1A45E73
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 13:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABCC83B29FE
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 12:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677CA2192E4;
	Wed, 26 Feb 2025 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="uL4UIaPZ"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76A18CC10;
	Wed, 26 Feb 2025 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740571595; cv=fail; b=PaMNSaqQ3qO3pm4r4mVwr2Yr+wLVFareaOBt6K362fOwf5ZdtB9lLkhOQwTN5SeaL4VFVfcEyplb+mtGA546d+mS+wHu5Vm0sLGrg76NrdwCdySBvdkA2zCgQ/EBIDdksY103wtPVuBeRb03zMX1nm+6qHsStE0lMOU6D2CwZ+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740571595; c=relaxed/simple;
	bh=puVM2NSr5cL9c6lhuYOdevcw7d2veGt2if5rB+m1aDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TgcWHdhDv5Y/FevWmcJv8mpv5N9eFS7CSaVMAKT2Q0YX7DCogpekUXC9uScaV/smEIJeyf09EHwOolrvgS4SSL/tle9XGJgUhFLWYBsxyKJ/GqRbJ0Jzoujg55qA+BUjTVkl1mAmTIQ5t6tL25uiUl6t5EjP0AihbQR21f0XXBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=uL4UIaPZ; arc=fail smtp.client-ip=40.107.21.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIMGy0/lkAEoF9fTUWsowpeyd2y/lZGGlodt+bllAE6P7rRzdEGmBjoqiDc0kdQ+fVLDkTqs4uU2D1NscsE8CqKXlxF9PicPYIAzE85geV5Bph2Q6tlFawT7eP3//uzYGFxPgnfj/4j9e2FfhgD8xf1D3pQ5AHYxB1zba33M6jZcx6TQdS8wZfSIAW1NTMjx6lTpQBOL/AFbWeYDNHSPKabdsMIaJ8qz75ml/9M5DDRDew4E8tIGsbQszKqRX5asTPc/GZUzmdipKQ4fvhIu2XoCQ+1p7RStGalFIyVCg5U0BNg8sQpt904e+cAyxTLfd+V4uu4s7k3C4yTfoNbRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpn2CLg4O9CkAggQCAzrWlYNsVQjjua/wZcQ/hxTptI=;
 b=jGtCZWXU2DI38+MYKNxQ2OKi5+aHmtrAUj67AEyPyojs8mUmZ9WA+xA3VK7urv8Lj/ug/7Wj4xkpykKmCWGpA/iLqDcoxQyZeEgjQMQ0eqxsrc60tACp1BbRX2ZwnJMznfoBy2H8Mt+R9hElLOSuppV/OW3KTDUUJIOSbNifMqzD1t0pSDlUYP6tgoQm7NUBUyaKqamPV40XbmpgtFXVVrdJfULE9taD+blxWxBLhjYEAQgK5hJvnO/dBC8wPpWAJt8g4s1y5+GbyWpMk+Yu5RsqJjaN7EKBW6A482720OzbPLoU7Xsq0aOgxVcQcIOAZYxhQyLvWPo8pR8flPln9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpn2CLg4O9CkAggQCAzrWlYNsVQjjua/wZcQ/hxTptI=;
 b=uL4UIaPZhePRkzqvXHgMeiUqT1sbt7GKwt7QInUZZJryNB/YOvloW/qeFTNODSF3Wm2V+dxc2gnOQqIuugnTxe7zVGm/+UxTT91qZufcCYvsjnPSUHq4RwI+0Va8MdY42vseqBKJCEMX433Wi0tpt19vNZ9MWZEe47YUDDGsPB7H70MwcxnAIplix7fqx+qRSKYF2KBfZ+r6B6iYB7cKgqHBkIJETuxd11Yt8/kmBRstITK33fKcV3hPcpWVNsjW+eXQlqtU+3fU/6CZuEc4Os1X65TkVsvFKBIGs6qWoFjyMdl9hC/mtgIzVY6w2rx+1YRV8BdJd0hNsMP7SBbxPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM9PR03MB7028.eurprd03.prod.outlook.com (2603:10a6:20b:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 12:06:28 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Wed, 26 Feb 2025
 12:06:28 +0000
Date: Wed, 26 Feb 2025 13:06:18 +0100
From: Markus Burri <markus.burri@mt.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 7/7] Input: matrix_keypad - detect change during scan
Message-ID: <Z78Duj5yaoHIjESE@Debian-VM-Markus.debian>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-8-markus.burri@mt.com>
 <Z7YNKl4ljWFQEa-u@mt.com>
 <Z71qEyDVz22j_CvL@google.com>
 <Z72EiqCv_pUZDRdV@Debian-VM-Markus.debian>
 <Z74B8Gppk9YxdIxr@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z74B8Gppk9YxdIxr@google.com>
X-ClientProxiedBy: ZR0P278CA0031.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::18) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM9PR03MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: b83b1949-4dd7-416b-1fcf-08dd565dffc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WPlD5R1Az7UDkyIW/6afE1uMsOwZbxF5XW935WjHcbkNp1OxhdQXzaSx2GZY?=
 =?us-ascii?Q?sXNGN5jZl6pvIT4GnI2hJ1hULl8JuktwPY2P5ZFOu0ze5iqEM6g9HYveMbFz?=
 =?us-ascii?Q?N7BiA9uOUs6H6AdO/Io8yG0er1lCHQZgTLUlImnu7DozKjN7pZf1qUSBArHF?=
 =?us-ascii?Q?837GFePNGxVshS+igyEdwmqGIfU8ICQhXSLMaBReLPJdIhIwN/anZLVhAVuA?=
 =?us-ascii?Q?zSyKnyy+3u9j84jE9I3L0fsoltyWYyLMZ0IndmHOgNceLmOCpwtweNbsDwbl?=
 =?us-ascii?Q?8JlojVo9t7ZQOQ4AsU0cGWpYYIM9+wpxdb5pnbqYeRq0kbYEoYYY/Sjm/+QH?=
 =?us-ascii?Q?hexzfQ+ek2MxfRpdqmZ3PNkr3q7xXJ6D8Vh1aFXNn2CnOCETb5jYpKcVVcWn?=
 =?us-ascii?Q?0cSNcJihC0A3TkM+pEXLr2HA4dcOYn1DWxbyJb4u53TESYf1ngKhyXe5cgIw?=
 =?us-ascii?Q?xH9cFIv1hbr/2cAcGHaC1oLchZ6pvih9LHSgGT/rk5UstxpWVgxmY6+bWYiM?=
 =?us-ascii?Q?Y+FBXqMIkorpLJQU+y8TprxWU/OWR3ectnfMzx6+/9FbRuYbGR5mZXktx4b+?=
 =?us-ascii?Q?ZNCnLsyWuTObDVyCSAEh8Vk8gSEAt2xgJRipF4QdyFr8AuK1HEdZNlaSs2Cp?=
 =?us-ascii?Q?JX4nVL6+I/6nep6K4cfTluzc0xRJX8ISeOAuT+fcVZEdaDfn0G7q7rEfRsMx?=
 =?us-ascii?Q?7PHkUH/bSqsAnxr7Z7PpwndnTL+M46ZNYAulsx+ONE8JQQKoztX64hBdGeXG?=
 =?us-ascii?Q?98MlqHBfkVsZt40q/MuxAfiGhddVa+mPVLYpFzPpVIzcL+65p9zJ1sqQA47V?=
 =?us-ascii?Q?MN7IPVIu+Am+WIOZR8DYnaPF0Jb8gfPrNCp/sykoh3LqcZQZoCoQBBx1C/Yf?=
 =?us-ascii?Q?DpkPeI5tQDmP5F3FtfCZwP4mEgHmGgLpbThxmZZjs2iLOOALdJFzKzn7xRTL?=
 =?us-ascii?Q?8mbE6vDOdxRjFB6WejiXyGc1ytuk2VMVDdcQRuvO9DLYvpL4Kx6YSBRl3TcK?=
 =?us-ascii?Q?flM/B+W4hP9mfnuYG7Vj8EWaWa4FPejoA+fmRSyVJ+gFVipWxDJfZSE/6G29?=
 =?us-ascii?Q?lPS3jdocZznQayAc6DyVu819J07TJEuQFkIm67EHvjaOz2l+tvvQi2fJk0ZK?=
 =?us-ascii?Q?1M4f1k+zc0NoO2aYwyYzFvlPj/y2aKE6vecs9szryloBixPjON+/7ktjeHRV?=
 =?us-ascii?Q?R0o7L7nkveCp6r7vOySzdLn75yO9Lh7DfBybQ1xRbVByhHYGAbcM4fBRr6Y0?=
 =?us-ascii?Q?u1rvmATPYvrOcvGinbFyQUJkh2UOhQZuK2FPi1uJfEjkU025iET1Bio5VTpo?=
 =?us-ascii?Q?91wxtsU3+JmZFaR1QzwMStSkIakmqtUXgMB8B98mKl+ikO74yiEB9a28XmfE?=
 =?us-ascii?Q?pwn52H18UKowSqpeitpDa4B12V0DvTcsMYTvH/A1G6skvPbNovHRjnQgEc5m?=
 =?us-ascii?Q?MiDtQDrNvwwE3e5w91K9PA97fa1+RDv/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XRufU57R3VYFLn5JxT3BZzXAJDWtPsv1NkL55AqxM9a9t4vHnWHH1Yafamke?=
 =?us-ascii?Q?uxF/RuJKbjd5BTH0GoXlalbgE5D+G4Rh+0v0JVcJmeeaXuzlwPIrcIMRMxvr?=
 =?us-ascii?Q?mquh2SzxHP3F13aBzQCsZjg79i82JCI+iO3sVgmaSeYFQ3/KB5rDIkdOazz3?=
 =?us-ascii?Q?WAkut60ubaBgu8W9jnWUsbCNqJkypcikIOfd4e9JbnN/s1tbM4e5O3WrtIvv?=
 =?us-ascii?Q?wUZtKLQusqNzTcpA8rJPTehgOIbCv68Tv0jlTLDAvOR+dYnzl5AAq3NETb09?=
 =?us-ascii?Q?tDod7O6q6uQgb9CMT6aOW3G9J1PVjMNUHVb4IFx2LjQavIRBIxyQblR3Wolv?=
 =?us-ascii?Q?yfXJT53rGlz5ZrPX9yzKVSr6BXxQe8AJ6PMQzk5b0MPyOJslQjl1DeeX6h6M?=
 =?us-ascii?Q?C/ADgZX/aaNRxU1WcgogRQ5qlNGt3zIdI8tZ5BHAvzpu4JSy76QRncm0WxXr?=
 =?us-ascii?Q?BhqirwJ3/twr9WmmjBCAF5XFSfe5FgagiFthQ3eCCBC2nbAyn69oGJHoh8xI?=
 =?us-ascii?Q?gC/66ufkQjXB9E3OhM0pJT/zVZVNfkjdYasU6d7m6E2yZ7bRIqQDT4ZZl1nI?=
 =?us-ascii?Q?Zf+aQ28C8bV4+9DKB8ZLszvOVYrEKjUlhtWOWyidm4jmzkXuGFNTusCkv3KU?=
 =?us-ascii?Q?4s+kAgTdfCMk4hw2UPMF/AeA7rnO0VKiZEHXZ9Y6hLUs7D8xINQdnyZl4tnA?=
 =?us-ascii?Q?9xW+FU+WjWNi626r35VcKKETKuAog8vwsjGOTITybi+puk7HS6r12s7plum+?=
 =?us-ascii?Q?K5OB7d1UnHmnkHytCo4sveQ5UiKhnP7zxKZR9s99lusk2UaPiFC+Ce/Z3ONu?=
 =?us-ascii?Q?AYV2wBLOTqEPoz6r5jfet/LpO6jc2YC+BdWLG34rO4V3fCRzHUfETcmMaT2O?=
 =?us-ascii?Q?HWcYVAwFQ00+rFF/zLZ4hDwqrqnNmrK+3IQVPWIyR7V5ajAvbF/tazDXPNEW?=
 =?us-ascii?Q?k69PQUpVfySSrf+3Y1rMJru+YraN0ZxhFn037cOkElKzkuWtFAsrvfM+NnRj?=
 =?us-ascii?Q?HHm36n+MfFb/x2MaC4kLvrCNLCug+uaUKjvv+Y1nqNTUdGGeiU2zfSew8K8S?=
 =?us-ascii?Q?7hDHdpHgYPDsiROzbxlmHR6Os2AEjtym6uqVtQlZeEVEsREv3qCtMBSbuWOt?=
 =?us-ascii?Q?POkfJ+aHv9bgNBQpICPOpJVAshp7swPe+Gd3SG26IrrL4xinsalJuAbVYHRC?=
 =?us-ascii?Q?G3GjO74vO6sGsAfYocPCcznGa0sfBgD617YW2Q+95HUCQfD4LIP9KFHQILHf?=
 =?us-ascii?Q?0xB8E92edRhwHekUS7RdeqZYVBkheeo9lY/N0GWfBk6LDf50XuX10gPhYKdl?=
 =?us-ascii?Q?jelq3izLP/CNM1WuDENUb1u8A58adGllXLhdV33wQNBf4n+XEGIPK32LuORv?=
 =?us-ascii?Q?qj5VAqZAeUzO2+7PtlXMFQ1h7Pb2l8Iin+v+QCinp4y/UrEmNni5N2eeRTk8?=
 =?us-ascii?Q?L4tnhoGgdAH6CHOR47/3iYg3I+vfkhbwWALOWZic+BCb3a75y9JewbVDZzSe?=
 =?us-ascii?Q?SnJRQjtAyeZOGr2C3GUb1uG9I31KNIvlNurhH8/i1trC0Q9QqRpKbcQJ7YQ+?=
 =?us-ascii?Q?vltLa9sfk5Ujt/NginXqsBseJ3WiSmqR+kyI4N30?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83b1949-4dd7-416b-1fcf-08dd565dffc5
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 12:06:28.1677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s03ZWCX7OWcHmb3Py1G7G7PS+qK07mDG7Gv/CJTmkZjF4kfr8aSuD341Z+OBtPmDAvZKHGHRKlVOSAK3o14Qdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7028

On Tue, Feb 25, 2025 at 09:46:24AM -0800, Dmitry Torokhov wrote:
> On Tue, Feb 25, 2025 at 09:51:22AM +0100, Markus Burri wrote:
> > On Mon, Feb 24, 2025 at 10:58:27PM -0800, Dmitry Torokhov wrote:
> > > On Wed, Feb 19, 2025 at 05:56:10PM +0100, Manuel Traut wrote:
> > > > On Fri, Jan 10, 2025 at 06:49:06AM +0100, Markus Burri wrote:
> > > > > For a setup where the matrix keypad is connected over a slow interface
> > > > > (e.g. a gpio-expansion over i2c), the scan can take a longer time to read.
> > > > > 
> > > > > Interrupts need to be disabled during scan. And therefore changes in this
> > > > > period are not detected.
> > > > > To improve this situation, scan the matrix again if the row state changed
> > > > > during interrupts disabled.
> > > > > The rescan is repeated until no change is detected anymore.
> > > > 
> > > > This is a quirk for a bad hardware design. For 'good' hardware it adds
> > > > an additional read_row_state for no need. For even slower connected
> > > > GPIOs this will also not help much. However it is obvious that it will
> > > > be an improvement for some designs. 
> > > > 
> > > > Dmitry, would it make sense to make this configurable?
> > > 
> > > What if we do not disable interrupts after the first one, but record
> > > the last interrupt time and rescan if it arrived after work handler
> > > started executing?
> > > 
> > > Thanks.
> > 
> > I was also thinking about that.
> > If we do not disable interrupts we will get a lot of interrupts during scan.
> > The scanning process itself generate interrupts because of selecting the columns
> > and read row state. Therefore after scan we will not know if the interrupts are
> > caused by scanning or a change.
> 
> OK, then maybe we should keep re-submitting the work until we get to
> stable state? My objection is repeating the scan once does not really
> solve the issue....

Thanks for feedback.
Yes, this is what the patch does. All changes before read the initial state are
handled in the current scan. Changes during scan are detected by the compare at
the end and trigger a re-scan. Since this is done every time at the end of the
scan function, it is done until we have a stable state and not only once. 

> 
> Thanks.
> 
> -- 
> Dmitry

