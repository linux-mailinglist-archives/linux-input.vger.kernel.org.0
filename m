Return-Path: <linux-input+bounces-4566-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C091370C
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 02:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B92B2B228CA
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 00:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25405653;
	Sun, 23 Jun 2024 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="qezHeh9A"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2132.outbound.protection.outlook.com [40.107.243.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A1EDE;
	Sun, 23 Jun 2024 00:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719102022; cv=fail; b=awlp00ZJvAKG8i84wyI3so3cd+Nnoyi661FHk+xnRKTA7+0LyHVHnlS1sIM3pFmPlVSTd/NrOO1vs/hMEqvuvf1eASkwjonBwU/82ydbhvdG8YRLiFoTfwStsFFngHHiV+PtDkuH8Skp4muIk7733yLzHfzbA8zEpERunJbbPYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719102022; c=relaxed/simple;
	bh=I2ecYRDfpXeh6xhpk/QGsR2Ju/ZooLe7PoZnEXwxNOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XdpHOOlelqRz9+QJPfpAo0YU8NAC1mfLijb12uD04wX7xJlP6NEg+4R7KcEOyPaCtOq1VH/AZq+RguHrYA7i/0G0xYmjnWwU7tgZGCV3bM2/Frx9puDUGAxlS38y48THQs16U8iAX1usr+GtdDH/Y4NQbqYSmIiz/XtcjRP/Jds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=qezHeh9A; arc=fail smtp.client-ip=40.107.243.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXz2eYt4KjAgPZps0y/MLhe9HPGrjaHroVEyq+50gmRQUzUyRa9m/LoVMjsrd869RqiwTsJCGh9xUr3zjbgv382HPhuM5HhbfbvCZ27cmr9UVVVSU7lPl97pCocQtgQ46SrcTrHqDUnlWwXeHvMl6qEU4gMxIkg9oepF3LS6Tk2dGrp0tXGLCxtpxbFw1jbFMm0CEj44CWAegD+Uz2hIv/kQ7t8aljNj/mUl34mhmfBtteY0gaRG9bX1F/ZbMxl7bja46FgoNPHaQuk2/PXyLzFdjOqIa8EGC0beBVj7U2NpAwoyux9AnQt6tBPZkYrtsTehBre1xLDhW503DhmMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/Y+3Ux3RMYvzDEQoK8hrf/43c0CXIGGa8Wbz59vpKc=;
 b=lYDQ/oV8g0jUu2njCWbnMo7zb8vxUQ47uuJbWr8b40uLfs+R/nyjs1ZKlujBCmG/d6fXiprfPNOJSxyloph8286HuQ4fsTMxSSOS/jaYdMowR0A9ux+Y6ZlAj2woFvQlAr342EgAdmN/yE6gpl3DQp0sKrLZP9EBzXk0D3r4EB+mXS5ssy2J86gnXXpsPtHciqSgHh1+lTscahm+ZgWIg8xBsfOkrAyhXIt/2rnO3Q5BiVLm5aYR96rOv4xZjxMrkFbrqaUUHN1+1S8tg1nrnVceGOO9zM4y6jV+DJEJtCfP2B80ABsro4pwt/tE3eQp09rT71oi7bB+Fh3mtbL1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/Y+3Ux3RMYvzDEQoK8hrf/43c0CXIGGa8Wbz59vpKc=;
 b=qezHeh9AsYjoIRCwAsGAaoBfEyxn4x48AfrpnPKPPyMsWIe3ssmLvZYdZo6buNWqXBPlPR3+IbNTWE023H1QJSWlOB27OHslN3YYzLWM/HsgS466KRv/vlpDFezd2zZA+moHjjJbXfWU6NCbheXjYRKrIe1kvVbfkHuBwhRJ32E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH0PR08MB6956.namprd08.prod.outlook.com (2603:10b6:610:c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Sun, 23 Jun
 2024 00:20:18 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 00:20:18 +0000
Date: Sat, 22 Jun 2024 19:20:14 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v11 2/5] dt-bindings: input: cirrus,cs40l50: Add
 initial DT binding
Message-ID: <ZndqPl3fhIZWystD@nixie71>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620161745.2312359-3-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620161745.2312359-3-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SN7PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:806:122::21) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH0PR08MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: e456c26f-8d6e-4f5c-2f29-08dc931a4321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tT9LMBlFlVmZaxKIPOJrzeZxaISqt2lNhJHtO/063dUAoS39evAJOTQW3rvB?=
 =?us-ascii?Q?830xsJxCHzFYyhu3Dd6Q8al39DBJqytW/S/A9jd23T3xRLQthLBGXrvbesc8?=
 =?us-ascii?Q?HGUac4ynilIlM4Il41+dQOaN/lPLBWpE2aDHZ99joRBmsHE9QLSEf/CNtPzJ?=
 =?us-ascii?Q?YZtMDvNNlZJElJXgodOIWG2//ZoiDGj9Hn6dPzEbtuz5dhbZ+Eq61TUWsZ6Y?=
 =?us-ascii?Q?blOQ8TclXYzTwjrdet88puAGOvSRsziG5jvw5gdfi4WOhQ4iC+emV/tf0A0Z?=
 =?us-ascii?Q?xNr8X4S3iM3ev2YUJfdix64f9WPuXlGKlyJZNOno7BLXFFkTWwDaqaKzFyjO?=
 =?us-ascii?Q?fc5+YdvnB1Ii7G4cXsR8DFzbGYLzDCS3jGhsBXUEEvvl4H36w6Ck++BwUoz2?=
 =?us-ascii?Q?wF7DXpov0r9k1h0nbWz+x4bav4tk4ZNd8ZsIiUUuI/UYeSzCQHxALfk+YW8z?=
 =?us-ascii?Q?qt1DiDvw4i8Gz2g/n4DRAgIN4Fc4ayYVPiV64lTDMn4Ivpj3pGaMEi+o0jwC?=
 =?us-ascii?Q?ZpVMPw8dnu0y78+jHn5/Tm8MWAsSPcxTobZU1f/SLe2/IYlzkhyatEU1R9Ck?=
 =?us-ascii?Q?D0tL0/cMz8kcW/gPm/n5Kv2DhFf8x7ARtA5UfPwomTvJE6U1ERqeNcljlf2V?=
 =?us-ascii?Q?FtxwJL1jQnGeCmuyAgfHAld+VneTSXX2wrql08JqsR//R0rtdkFG2iq+Z/3n?=
 =?us-ascii?Q?lFUyywS+xvmdVDpHw3oEdH9f2C5ZmhZqVZM3wPdWNrATsri//bXAsbK4fpdA?=
 =?us-ascii?Q?S3VQ0REqhJWHdufHdfxaZ+peVl++VNk57idM8hMNbWzYEZdytj9/oWfDfyPe?=
 =?us-ascii?Q?m5ztklQTBCK4tKSx6Cx8UqnVfqRtAswV66jRmqVzSFi8A/7MEIN8eNdP12cT?=
 =?us-ascii?Q?+xLYxJNd1BUEgIHf34NAJWm2miAcbf52Lw+xdFPNMVc7fwCNuiFkqkx1D7RP?=
 =?us-ascii?Q?23yxtLk9VI6BVUaYkxwy31EBsEmKvEUm5NkwHT6Xbws4mk9ft3/Gq4hbCm+k?=
 =?us-ascii?Q?PEwl7FiwEaR3xdj7ta8/X8yyMjkKn/sXlSKYlwzGeJzWJhtl1W7T5Q1jTZRM?=
 =?us-ascii?Q?BvBKnkiiYA5Ve53AhGml+8LoE5bUAr8pvJ0qgjqDrUF5C8rascoUeo6vGyHH?=
 =?us-ascii?Q?Yi+oVPhn8VAy7Idy+O5GLLpqmVG9EuNZwh/gzjEeq03ZyNyGZe0nJjb5b3Jh?=
 =?us-ascii?Q?8+cqfUfoX5ogUDqjp5LOmme91JbZw8n2PzVfq2TQHWpswZRw6ZvAfjuLZ24N?=
 =?us-ascii?Q?EuQtNQc+t9pr1q/Syj+Z7UWDtH/VDv9h57snPIA0BTZ0GJjz5TUOTeKTYht0?=
 =?us-ascii?Q?3A1E3dhWE+I8r3YVs5NUNlcn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6P3zPpQR0n3uXCrTY5TiYLi4n+8xE+71257kQ6qEGv6F57T49v1LuNtxbnik?=
 =?us-ascii?Q?ZEmAZQxhtUAstS6+VDpz184oCcHgveRMP7UqEZWL7xnXa4QvbJI1BP8/PJP9?=
 =?us-ascii?Q?J9kh27PwOJ9Q2EArbwHhauXp/HnwLVtCt8Rnx8aEMmzaOTE2T5LAV2ougEDK?=
 =?us-ascii?Q?yQjHC7IJGEioNXwTDAEKpKFruzpQySzfy87HJ6HW/xcEYFIgdLheJ0Tf9SsB?=
 =?us-ascii?Q?QsR093p4cKk/jlga+DHRZOydRsmPYUT5B5i9DsHFl9j4mJ+iqMv8rA4MRXoR?=
 =?us-ascii?Q?+6tPFUQ4zPtO265tf1OVELw/mAP6WrsCJfb/GQVK6YSLHnroiTcuo85dH+uj?=
 =?us-ascii?Q?yXbyAeHlvmsV3g1GN2ZElRkzlWeWx7JWspoMgbajGy69mB+ZdUkcT66UKNKd?=
 =?us-ascii?Q?WOPiHDbc8cN8bVeHWhf9ZRbEgSCL1GZr+Q/fnUdLEKUgneBk8LhihV6oaEOr?=
 =?us-ascii?Q?M5bh+nnOfXjxn5zkD++Gs2nmx9hUitl2l6Z60AbH1ju4/MzJ3jp6uniU1mFa?=
 =?us-ascii?Q?Q21CMNv6ZFUd4lFZGZ6Fiq7b+FT9ZbnhuRSAlojh4ls2ZfgTbtjFNJjANN5R?=
 =?us-ascii?Q?HkCKuby+oeduS1dgwS5t4pK9/7xAuG+LmN1XnQZ0Enkxo/W4/Fa6bXfgMOz9?=
 =?us-ascii?Q?/SOmein6B1KfdxxOKJgy2Xx/K+IrZQ/GJ59z3qguLHV2Av/kJ9UE64o1z5bH?=
 =?us-ascii?Q?14Z796J1jr8l6E83L/oIgFNJPWSTBgB6V7MvVopmPEAPVGYQN1ngqWNYDqoX?=
 =?us-ascii?Q?BHifzC25dYST7kEOsWy45hFnxnNMUiv8KxyDtmbdHYrRQmYg2XoF/YSfQ0wm?=
 =?us-ascii?Q?QLGFvfc9livJt5jPSAp8bOm/qeA5sZx3tJRfSmoDSrQFiVFbMaQujrF/+zNH?=
 =?us-ascii?Q?dYvneETB+pxkQ1VpYT8md/FHBmldikEQP30kt/CwKL3OTIkZ61a2Eogtc9CA?=
 =?us-ascii?Q?EWKN3gZxsmXKikG7w8df/2vC8N4L5F+Wm0p0CTGXSKZx627J711ikFWSSYC7?=
 =?us-ascii?Q?cHPjftdbhJvbWlQzfw/oAN1eOZIXXC6TXs8kwkhnq3KehmpGXp/lZiNjNfxX?=
 =?us-ascii?Q?wnpSUmursSyy2B6O2viRoEHY/Ho5shxVYsNDBZAJRKfrTATW4hcCuABOyfd1?=
 =?us-ascii?Q?yHynGVmCVOGfHVhXUwZb6YqvcX4WjGNbVo3XNfm4EUCaElrTILZCb2mmsSvA?=
 =?us-ascii?Q?K5RTxE4i2yk182GxcclGjzmonGAz2e8RtrwUOily0xbM5jQs4hsxBZeCt84l?=
 =?us-ascii?Q?OQluHI5mzVcI77jfVkqDcrJOpO1tMkzY7hEF2xi6M9TEmGjm88IdCVa3v50n?=
 =?us-ascii?Q?ieY4ze/4pz0uY1aPf5Iec/uHg9fSyTteKLxGWnL00hCO8b3UKxApiia2yYek?=
 =?us-ascii?Q?kq8Fs+B92wQWHCM3mzLVT0rgpzlFjUWdB0q6xpN8kTHFv4lPPii4ml3ooHvc?=
 =?us-ascii?Q?1MaGen4exLT7404Ue8CmN+dfsT69JIFxtuvxGn//weq6DQ7K6QLDeel+/bNP?=
 =?us-ascii?Q?VIqqbpf/d2clKObuh/RY+j7hKbBRZpaKnxzkHZZjBTYpqkcjwoEjDknkMziW?=
 =?us-ascii?Q?TVW9QMa6nz5PoVrAUPDqW1/4Mox/jsULDJ4XKMDU?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e456c26f-8d6e-4f5c-2f29-08dc931a4321
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2024 00:20:18.5776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZAxuEgbcEwljWmEx6iil75duNLrOTU+n/wJ+n2vYCVvNQkP5wOafQjR5bMRFIUKIKi833ZL2urvsD6PTusztQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB6956

Hi James,

On Thu, Jun 20, 2024 at 04:17:42PM +0000, James Ogletree wrote:
> CS40L50 is a haptic driver with waveform memory,
> integrated DSP, and closed-loop algorithms.
> 
> Add a YAML DT binding document for this device.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

Kind regards,
Jeff LaBundy

