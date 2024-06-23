Return-Path: <linux-input+bounces-4569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38622913712
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 02:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9984AB229C6
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 00:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAA881F;
	Sun, 23 Jun 2024 00:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="dLBPK62g"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2137.outbound.protection.outlook.com [40.107.100.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE1257B;
	Sun, 23 Jun 2024 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719102195; cv=fail; b=VvbxHDOpQHoZSJ+z4MGm8l8ydwBbAxWgR5QVaCxLi4dZXEWrMt3JvpfvMqy53tmBtnNQsk822rz8cyb+luoYB69NtlxPHkEv47YxR1X0WNXeV/LQhn8uy4j2FPlIg/KPHxoU1g09YkHuu0qUQ1F4wxLJVAoosGYJifU7y9SNg7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719102195; c=relaxed/simple;
	bh=II6gDvFjVA0Bu1TORTWWQCYY9+QlW/tLjh+7iaNv6EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t7QiHa26B5XEhGpcr2/jjX/etGuLrQJt5Xd/lfIiCX4/kDHxaAuYo7mSP9Nmx6lwhgpt8zMaCYk3Eujk49ZuS7Vpzt8t0Hmfpn0vNSD6xqWbO2S2yHb/4B//F3gTK/UtG1Zy+ucpKDrHyWL07a79EGTS1SBtb6Iu0odCegwrxko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=dLBPK62g; arc=fail smtp.client-ip=40.107.100.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfIPXO4Odfur/E1jXOqFFEHtlQPhAJvSMHd6SyczoaCUIKTnh1VgQXCBH+t6oA1wU0Uj7DiRFLUoPAbTOA5mZdBuYKFdQjzCkjBLPZXk02BBMfrpsXyIUSVR5wmdU823SXJwwMlct3by+y7Dh9NKN3Ic7EzJ8kfhUf0wXJP5WKvkn4hkM4Ccwf0YTnP3uYj/3pvxq8up+yS6C/7n7bR9TMV3pJsFIu8Xbab9W75ysA6kqu4r184BahQS2MdPo5n84tnLcTP9riStbwERl/KAtGoYTUCyYBKlTVDDVXDbNOc8evNil99Y/foKhsumEIHTbBH0TaEnh00EdPZvGL5Tdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QtmT1Ttf4BIT9iULg4va58hFV5TDeo+BNv0lAVVK7k=;
 b=NRwj1nsvNoZLahducU3URnMSI3n/nCQg4YCYPEND4HF4v2FJg7hvyIvyzQ7pGovNL23sjJIg3o3z2Cx+J3dJecYbhfeUi7TzuH0bbsMaaD3Dwn2phM1EOFfwOYzqjuEbdeJoPgMIZxQMS8LqgFDqs9+4MSZx+92ehIftTQtye4XYoTmZ9WhHsI96z5pIy4kDpVsAArtyhOwZks4NkZXsI/StNRdsIN2hv94Zphm+rlpIVS7dmXOvn+1Jup4xW20PGBdBI88R+BS9FuV06WbKAlenUIi5xrDuxcmt45WYjUkXR1yKI+rM89bYRBFc5MAW2jUG5aR8i9hJoYP96l7v8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QtmT1Ttf4BIT9iULg4va58hFV5TDeo+BNv0lAVVK7k=;
 b=dLBPK62giz7sG2OivOtUC9OZAI2bIX3a/al9Ty/GjcXprdYPZbUGe36wPftFzQ5ksOpW7CEy8gjNqvAfknK8YB70FVomt3+RzdDcrTjn1HbvFLWACUsXFofpFWXOvQWnTUn9KONVRQu3L1wiw3noM4cqZMGckDOXG2nOQg7ZzWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH0PR08MB6956.namprd08.prod.outlook.com (2603:10b6:610:c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Sun, 23 Jun
 2024 00:23:11 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 00:23:11 +0000
Date: Sat, 22 Jun 2024 19:23:07 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH RESEND v11 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Message-ID: <Zndq6/z4zC9YiHJb@nixie71>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620161745.2312359-6-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620161745.2312359-6-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SA1PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::14) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH0PR08MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 41856441-3280-48a5-0e40-08dc931aaa27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Od9piurrOqQvGH+uCvIJFAxmY34bN1q61EZxvoF0U/zjN2qfYJ48R48n59P?=
 =?us-ascii?Q?2XEdjH09IeBUlMbpwHwE59swJF0ffg11HVAARs69pf6KCxQQAjyyb3nrfSSo?=
 =?us-ascii?Q?PuMUMiNhtf2dAxlwPZRsDbSNTVU2ohBcU2lSbDo198VUw5jUMv1Ig8jsj/7J?=
 =?us-ascii?Q?PzHZRqUI2KvXQdR486yvIZypvxE0O2bqFJPPMr4E2kf8flsL/UDKk9SX8jwU?=
 =?us-ascii?Q?WupKj8383Pn77teO0OASaSBgFleZdNdoI6ZlMZRyfDG/qntQW8YaKxVZ/3HA?=
 =?us-ascii?Q?be59CyPPo3pB1GzneeKl0hy/HUXMR/af3e0ApgtWkCnMcIvX+7F9pMymNtCT?=
 =?us-ascii?Q?oeLQnwpffMXtpjVk/gkq0qeZm/Mv2IkEmH54ooXBpVUcs/hrdV32Kjx1sxXt?=
 =?us-ascii?Q?mqKPRf2PiCXzLGKPxnSO39FRJX2KkK8ZRfrJyDJZJoAeytpybcxNJp//p3X7?=
 =?us-ascii?Q?h11nOS4fhRUEtVGkJlVqc8W2Vb/TdvQAGxXGr9x4kNldn62Uoc54/rCqKILG?=
 =?us-ascii?Q?wJyfou+DgHUcDVqQAAgSpz18J+ZEYJCexp59yae+yjhYPX4trO1DPmYZYZ3v?=
 =?us-ascii?Q?hQoJ00MBA0T30Rv/65vTk+UHd+py7H8/5pNQ0qI9Cr6GKd0VU0irVcHY0io4?=
 =?us-ascii?Q?KfskQUT5/GeZovoCxdyk+1jSS/x9t4F9M/iOP47LLkukxGXkjcmhjzQf4POp?=
 =?us-ascii?Q?3YZ90oULh34hDq+FlMShjQabhDDbsONRHg5b/FC0jiJDDDJ1o1R3CPj3/rnx?=
 =?us-ascii?Q?ujqQSyn29TZyPu62wY4Q1+JutENv1mIAF4YiRNDiLBiNTdgduobW+hcaaGZc?=
 =?us-ascii?Q?tzxmVCr5I1L4TpRjbMKF6SzkA3hk2qBrtZB96OU2pR4eOKyzw/A37w+j1iwJ?=
 =?us-ascii?Q?iDpqrA2OlnyAi9ghlHM948nlyrdoVCZiMg8xAcLua4rW1R0rNLOMq6qK7o8C?=
 =?us-ascii?Q?qKxvmKgv/Ri9Ht5KH3NON4xLAj0jPc1EnQxdirlWRiaXSX0cbag3b5Zj7Fbo?=
 =?us-ascii?Q?U3ZnsJz+PEXOTGRIdqsrqdbqconxTqJgqQuFW7iv+pm+B6sw8X08GPpqJAK0?=
 =?us-ascii?Q?LfBoBOSz98mnMuguAGaS0l/qU+j+FGW32NsJSvEJzyCAWnU9WNGMGfyzg9BB?=
 =?us-ascii?Q?q8sZlr67jqH9+2aXbk+nbBk1bLop/4HcC3zZ0boVuhtrArB8wzYZ8qXenABC?=
 =?us-ascii?Q?xQil6f97xMw64ekvvwdNs0BAKbDyF4+4dPg3SkuqVHC/JDBRwyPE5K/XBf/c?=
 =?us-ascii?Q?nX+cSeuh/lCecCprdUyAoEsxhj4TgpVuFC3XButRTAE3rH4Z2zyhvQpb8Vcw?=
 =?us-ascii?Q?x0flQk6EIiGxOAsTHqgdBmDk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D1sbgp6kp4RtKOICwODEmRlimNDuMyGrFrgfkhjeKuFoHcNfC/r2Vt++tz4X?=
 =?us-ascii?Q?rwtCdMbvkljEGrkQbblTZ9sVaxoSNFeTDyLS0HAbqlfR4JiIyrCEKlGzBknx?=
 =?us-ascii?Q?qVNlwPKgW0mTXzpKaaX05cYYwyFh3QUEyOlw6wEmjHwTW1acGBjDZpUvf2hj?=
 =?us-ascii?Q?0+pVOZr+OKQpoCvpG+WQcnyy4x9l60LPi5oD5VmxvvHB33/j1MAQAJmG/Lvq?=
 =?us-ascii?Q?F4MKbtnqUnZTt5cKmTXa0UHxJQxDX9mdMN0CfJNkEqp7YWs35LAL1s+i68t9?=
 =?us-ascii?Q?Nzoe3qFOR1r2D2ONhcFKZ1pL+qePWKCeC/HK/j/+gIOK97Xm3sU3RNcDtUqI?=
 =?us-ascii?Q?V/lQMrrBIsytsSvdQ/Qdn9jpmzMfN/L1Bh8znSWJdJs6jKC6ASI4QU1s33ao?=
 =?us-ascii?Q?s2scT+0Xcr4jwd/rmOvCSO/MLxnRRN4kbfuLwHfG4l6rVoT6ZJwsFtFyC11Z?=
 =?us-ascii?Q?c+XQ7n9c8H2uj1MpMPS05eOJcQd/3z1KfISs/NcgcJLT5//yLLU9dVb7O9Ik?=
 =?us-ascii?Q?Ueir/lldnNvUJouvBgMD8ZG3VYZGonZm920QMkMoEbPQSlTXffMPJmf/WEiw?=
 =?us-ascii?Q?1ZMPfApVvnHTNQumbUmWCVfitEleLME/43VDFFJiTWBbwxEmuk2L8pj2SuzW?=
 =?us-ascii?Q?PYvQYJ3cXi4VLwcJKeky+F/wZI8FZVixaZ9XhA92ZuitqnnljJu4JBCmoBHC?=
 =?us-ascii?Q?Th45pZAuVPdSwJ1ewxY+CUhEGSQO9jFOZuNkUDnfjqli30A/KmgeH+DngA0P?=
 =?us-ascii?Q?E34xIROMR9eGOHiPrnNE4RTPyPBB2dQO+NUOl8lAARAC1GaRsNNPmEuLNUqz?=
 =?us-ascii?Q?HArXLmMQEVFBiq+2gipfSpt21Pg7GB0AWvcDJgsv1u4IrPiBmBLQmydQ00Di?=
 =?us-ascii?Q?fRbXUo3YkcazdHnhPd1BtdWg/qxxQu8q57dwY/iBIxjvjIYrQFz3JrRRQXx6?=
 =?us-ascii?Q?ccLmMeanDP/jreV+LH3GYV3tMBJdAJeexCAvRdFc5LWSQtWMrXpD3SNsK4s1?=
 =?us-ascii?Q?XWxfpoFfNiveDFWoTpTu2dYxl71KkbYcN+g7iFMabdYgy1fglw9grd2mLmSQ?=
 =?us-ascii?Q?cdWl5A3Jp0RKneDdBdqgy5M8OltA0AFOCxcKv+zzk4bOaCImMZWIQkNkevAp?=
 =?us-ascii?Q?b00O3GB/CI+/hyH8oINjdekuxn9+wAHB5MLh6VlbHef81W65OEoxg9/YbYPH?=
 =?us-ascii?Q?oCAnhwG+UaR5YUUyIZqfVJZ+wZDULcvVdno2KrBH0qvpZq7E5HU/oGnr2UUr?=
 =?us-ascii?Q?Sd+7DWU/rffXwWOYJfFB0D6Qe22D/IasG+5IurQDbbKfc5NShF53V/jRnqwr?=
 =?us-ascii?Q?sNj6YX7yZmN3UL07hh2fyhTRAeH3Yw0UDqrvxKweB+APpcu4R9MRcE5VYy5D?=
 =?us-ascii?Q?6j/7meXR+EHG27zCoZKKzemYJHM8rqH3r3TsAka6kng6lubrTZf1+TNS9CUR?=
 =?us-ascii?Q?IuzO1tcqm7DIy2XIpkQLq2P75WV5/FtfXOTzFXnm9t+PS/LHXk5+Qis9hd7l?=
 =?us-ascii?Q?Q6Wa4qq4YC6E1qQqhdyUWcfo60ZTozP/o/mI+QYdI5E75e2NwGuxLtiCdNZ9?=
 =?us-ascii?Q?NsKSXrXZ9J+f6N0IIJAr1jtWKf8vUAjJrucVqyCh?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41856441-3280-48a5-0e40-08dc931aaa27
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2024 00:23:11.3491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBSszHIlS7jT/qZKuAIrd1+1V1Uz44gKK0jSPa5BGDAlQgoegkrMG5KOskHTMTO+UNnjnIPdoLukuBhv7LF4vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB6956

Hi James,

On Thu, Jun 20, 2024 at 04:17:45PM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The ASoC driver enables I2S streaming to the device.
> 
> Reviewed-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

Kind regards,
Jeff LaBundy

