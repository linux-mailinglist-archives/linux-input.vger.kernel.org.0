Return-Path: <linux-input+bounces-4599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B071914E51
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 15:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22C2A1C20A42
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 13:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDF813D889;
	Mon, 24 Jun 2024 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pRRLyeh2"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6213A889;
	Mon, 24 Jun 2024 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235198; cv=fail; b=Z1Wb5oSjyqHrcghWXAVd3LMhk2UmSGETeGHIQzdncQn2JQ6KFGFtjaeEEpIzqQ39UsErUqTebI07xtTLDu4vU/4A8XzB0j8QQOSSwTbw+n4aoKS0BfRTcAulb7Z0WBhzFeWm83hageK+YUC/Z7zmmNtGI7T0Ao6aIZO2WFniN28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235198; c=relaxed/simple;
	bh=qwtbHDTpLrd5ahSHNHcItvwVV4MxLUGBQGXC6co4up4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OEvv69SfXxWs5zkkbGu0VLKyE+5X2WRDw3ryrafQEgH4fE7EslfbjhR2OeGggHm4LGd/D/9B57EiMMxdjNCzhq1oPX3btWkmfYmLQSEo6w2mNJq3t00MF1fshuyo9rgVWZnWiYug6lCQY6CZmYYGua8iRHm+Zg1YVQL45c5wXNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pRRLyeh2; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OD1IiC007786;
	Mon, 24 Jun 2024 09:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=qwtbH
	DTpLrd5ahSHNHcItvwVV4MxLUGBQGXC6co4up4=; b=pRRLyeh2dTNBtF3TRkeFP
	S9IYpb3k6uks2uW3wNm/3Rgb7JaCRvfGHz6On2IzehiUv9aJ+jjo6nWOZ/xbpm+3
	HbPU/OaAepShUkyzY6X4KfP+G8q+iaYKKt8CFsYkTMmg7YOs8Fd8imur0mUYGefG
	Eo1PddB6xaa+lpPioP2SBDlWyunmypT6llRyMSYxuPAyQVQ5HYuVfBpaJUK8dFjy
	LX4/tLwLGgW7O5RzGGQXsoMIbssKGDACgzVX6rtzZYOUx8bw6PGWacb2stJLq9Mf
	P4YHyyHwz2KgbbYzsenuyQDrUjT8GtCWPjgsdp9f+cd6gXeJziJR/qvNHWoRw04h
	g==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3ywrc8nxw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 09:19:52 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajLFy0+9ZyhxRmI7KEN+nYwDJo5fj/TCFDmddqipaNMPG98LftWgmY3P5uZZUxPZbsWl39HOVPkSzRDeCfeE1JsTs9LkV6AKpjIHGHE4MOQCKp4DZKmZWZFgmvl3L9mkppIzJKdf37XmXkwi1ZbAfE/307ZkP3woWkWLwwmJvAJH1kLsq9OYt9k61nxdbq/RmOy+KzaMv3jHj5sS02eZ6WWDjALejsd4gktcKhVNazOP08LzzJ86OmMvb8oaqok99l5An+26Gp52md72vcd7A7Pcn6uboYXCrnjp0SOcY0JqUOeM3UcT6EjbR0XOzI9QbiWc2a7gJan/fzg7TvZ4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwtbHDTpLrd5ahSHNHcItvwVV4MxLUGBQGXC6co4up4=;
 b=TdrJ8dvOKAMc98hmXrjVaBBLxSUYDav0P7EHdwVZH+EfAq2Ih4sG37TsC0RuTxlL3sbsfgTMZeqvJ0HVL7OZ0Q1DrDdchInzKc2DIUeKM+9k/9DM555u0Fca5AKGpcGWXUdnlStEXlQHGGUhRPnaJJZMSm2A29m6/CNZ5Cj34KsCvuTMA8mxge2oMczb6FSEiCtHQmwDnvLB9DIpHThG80AoxH82ewMfy1bVkdm1G9F1j73EIisL3yC6v0w0zxIpBcXelrKTFq/+S3Yec005rsx/cc4NUf5Z6n8ZpxufuHcqYCp+0yKialL8c7weuKUayEk+R3DjPQrwmIGFL57tqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SA1PR03MB6339.namprd03.prod.outlook.com (2603:10b6:806:1b6::14)
 by LV3PR03MB7359.namprd03.prod.outlook.com (2603:10b6:408:1a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 13:19:49 +0000
Received: from SA1PR03MB6339.namprd03.prod.outlook.com
 ([fe80::3ba4:77e9:f61:5859]) by SA1PR03MB6339.namprd03.prod.outlook.com
 ([fe80::3ba4:77e9:f61:5859%3]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 13:19:49 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: =?utf-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Artamonovs,
 Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>
Subject: RE: [PATCH] adp5588-keys: Support for dedicated gpio operation
Thread-Topic: [PATCH] adp5588-keys: Support for dedicated gpio operation
Thread-Index: AdrDxwnnhsqWA3twQEu3gpPx2Qa+mAAthRwAAGXa1pAABLUrgAAELUnQ
Date: Mon, 24 Jun 2024 13:19:49 +0000
Message-ID: 
 <SA1PR03MB633912E16877CAA67A951F739BD42@SA1PR03MB6339.namprd03.prod.outlook.com>
References: 
 <SJ0PR03MB6343CB033C1005A36B102BF89BC92@SJ0PR03MB6343.namprd03.prod.outlook.com>
	 <ZnaJbqXcABKGIj83@google.com>
	 <SJ0PR03MB63430F59E256C45E0C658F509BD42@SJ0PR03MB6343.namprd03.prod.outlook.com>
 <2dbc797b5f541fa639beea95b2437a292d3c0007.camel@gmail.com>
In-Reply-To: <2dbc797b5f541fa639beea95b2437a292d3c0007.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jZFdGbllYSjNZVEpjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAyWkRSbE5XWm1OUzB6TWpKakxURXhaV1l0T0RSbFppMDJORFE1?=
 =?utf-8?B?TjJSalpUVm1PRFZjWVcxbExYUmxjM1JjTm1RMFpUVm1aamN0TXpJeVl5MHhN?=
 =?utf-8?B?V1ZtTFRnMFpXWXROalEwT1Rka1kyVTFaamcxWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXhNekU1TWlJZ2REMGlNVE16TmpNM01EZzNPRGMxTnpNek9EVXhJaUJvUFNK?=
 =?utf-8?B?Mk1VaEtjR3M0ZVhFdlpWSXJiMHA0V25KVmNFNUZiWHB3VVhNOUlpQnBaRDBp?=
 =?utf-8?B?SWlCaWJEMGlNQ0lnWW04OUlqRWlJR05wUFNKalFVRkJRVVZTU0ZVeFVsTlNW?=
 =?utf-8?B?VVpPUTJkVlFVRkZiME5CUVVKaWJXRlpkazlqWW1GQlpXOUNOMjVYYlZkbmJH?=
 =?utf-8?B?STJaMGgxWkdGYVlVTldjMFJCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJTRUZCUVVGRVlVRlJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlJVRkJVVUZDUVVGQlFUTk1hRk5tWjBGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VW8wUVVGQlFtaEJSMUZCWVZGQ1prRklUVUZhVVVKcVFVaFZRV05uUW14QlJq?=
 =?utf-8?B?aEJZMEZDZVVGSE9FRmhaMEpzUVVkTlFXUkJRbnBCUmpoQldtZENhRUZIZDBG?=
 =?utf-8?B?amQwSnNRVVk0UVZwblFuWkJTRTFCWVZGQ01FRkhhMEZrWjBKc1FVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGRlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFXZEJRVUZCUVVGdVowRkJRVWRGUVZwQlFuQkJSamhCWTNkQ2JFRkhUVUZr?=
 =?utf-8?B?VVVKNVFVZFZRVmgzUW5kQlNFbEJZbmRDY1VGSFZVRlpkMEl3UVVoTlFWaDNR?=
 =?utf-8?B?akJCUjJ0QldsRkNlVUZFUlVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJV?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVU5CUVVGQlFVRkRaVUZCUVVGWlVVSnJRVWRyUVZoM1Fu?=
 =?utf-8?B?cEJSMVZCV1hkQ01VRklTVUZhVVVKbVFVaEJRV05uUW5aQlIyOUJXbEZDYWtG?=
 =?utf-8?B?SVVVRmpkMEptUVVoUlFXRlJRbXhCU0VsQlRXZEJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUWtGQlFVRkJRVUZCUVVGSlFVRkJRVUZCUVQwOUlpOCtQQzl0?=
 =?utf-8?B?WlhSaFBnPT0=?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR03MB6339:EE_|LV3PR03MB7359:EE_
x-ms-office365-filtering-correlation-id: a5fe8176-6e4c-4ba7-d668-08dc94505313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|1800799021|376011|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dzZlNTNjTDFYM3pkTmtjNTlTckVGWk1qZ1ptNEhTWTI1c2NEVVBvQlJ0QVYy?=
 =?utf-8?B?WXVjMmFyRzhRc05rYmlGSGRYMittL3JiQVRscHlkQXhnTDIxSzAxVmRteGVN?=
 =?utf-8?B?VmtpS0JkeTVuL2NWK3hVNTdEK1FtbU8xd1kreGkzRzRlSzZNejVZUjFveWdh?=
 =?utf-8?B?QnpJRDZXNVBNb0xoSTRYK3l5OHZhUEFQdmZMOVJqdTVnUTgvNzRhSnY2NmNj?=
 =?utf-8?B?ekF3SVZOU0l1TkVsN1pqOGRBS01EaGJVVGF5YTRKMStjbjY0Nmd4ZlZueXE2?=
 =?utf-8?B?ZzJoTllvNGF6SmdsaGc3aTNEcENSbVlQQ0VoU3QrZlhCR2JkUTNGZGtnSlZL?=
 =?utf-8?B?SUtyZk1oK0YyRWZDejBVL1c5NXZkZjJqUnFERDdPWEhXSnVZUTJZSmpETCtE?=
 =?utf-8?B?RTRuUEFoQnRReTVQcUhrY1JWY1RhK2k1TjJvV2M3VDd3UkE2ajlWNWNOV1c5?=
 =?utf-8?B?MFpBaFRBV0cvREhML1dyZkdDYk8vcFcvUUx5UGlpMXlaa0thMS9QcHloSEpw?=
 =?utf-8?B?aUVaNEVtdEZDV1lza0huVXZrT3FOSWVMejA0aXhFTHV2ZERCTGlZRlY3UGpD?=
 =?utf-8?B?emJ5ODlSSkZMZWxEOVYvUUZJaGphamg0ZHNEc3IrZ05QZm9keWNjbDM3UGRR?=
 =?utf-8?B?WWo4bGVkVk5NWFF1NEtSdVk4bEVESFFPOFBsYi9LNThWQ2QzWE5ZVHVERnFm?=
 =?utf-8?B?OHZua3BRYXIvVFcwVnkvNmdiSElyY2JJeW1IcmRjeGM2a0VXNkQ5TWJIc1BM?=
 =?utf-8?B?a3pDakpFb2wrbDJvT1pVY0FlaDhOemNIbXZkQ1RPdlV3RXdPNlFwMjZWRTd5?=
 =?utf-8?B?WWhzZlRacFlxRDlhcDJVWXc3SGovSUF5WlZBdGcrbjBZR3BpcWhRNGQxVHdY?=
 =?utf-8?B?aUt2eFI1REJBOWRGaTYyYmxNd2VpLzYraUZ6bmdjYzlUWkJzVXN0VTM2VVV0?=
 =?utf-8?B?UHlGMDVGclZ0Yk03UjBwNS9PUjlETmIvSi80RmhVWlg3YnQ3cTcxYXQzTDly?=
 =?utf-8?B?MWhyeSt6Ujk3cGxMb1NRU21vaFdhdzZHczEzSDR3anhQcHVnVVJIcGRDVkNH?=
 =?utf-8?B?YjhOd2lTTHJOUlMxRGttZ0NKajJlZ2dQZlNVK2k0VFpLT2tvWVVnUi9oQk04?=
 =?utf-8?B?QTdML0dWUzIyeitRYjBLSGlvWFA2Z1F0TkxSMk5tV2F6ZUdrQXE5N05LNlc0?=
 =?utf-8?B?eUpoKzI5NGJrS01nZlVkaFJ5WXRpeXZBTXhwTDk4bHBMU25KWEp5R0czQlRr?=
 =?utf-8?B?ajBUckZJd2pzWkRKWDhIc2dxVXA1QWs1ZXlCQ3lqWlNxYW4yUFNrRGlRMER2?=
 =?utf-8?B?R09YY2Y2SWtVZmpBN0E3enUvRmdObFkrRXllRkZwY1EvVDBTa1Z6a1I1aEZt?=
 =?utf-8?B?RXlvRnB0azJsSkN5YUU5ZittY29rbnFMby9WamtmVDd2dVl0bDl3Sm5NVm8y?=
 =?utf-8?B?ZlJXQkNKRzluU1cya0hXR05xT1Yya0kydzFmTlg2WEExcjhnVU56TXlaOUEv?=
 =?utf-8?B?eS9ZeEtSQXlCRnVIYk5RanBhUVMxWTFqMU1lSk5rUGNMVWNsUnd4aG1YRjBz?=
 =?utf-8?B?aHg4ZFVDbkdJRzhIZk9qTFlpVm82eThiYnhZZlpBUDNGdndEY2RtdTVxUGZL?=
 =?utf-8?B?UldGMWc1b1FpQjArMnRJZ0wrNitZQzF2WHh3Q05pVXovckNSV1dOZWtMT2pN?=
 =?utf-8?B?RE9DT2JEcGR5MXN2RkFoZTNaNWw3U0VOMGl0cVlPZVNTQnZrOS9pRlVXTEZU?=
 =?utf-8?B?Z0RtQjdTRFc5K013SmVmS0NKWk53emZmeHNxSWhIcjFYRkQ2RG9xQXl5a3Yx?=
 =?utf-8?Q?VStU1XCGZeokKR3R/cQ/cb9eI0akvdJeR8IBo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR03MB6339.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RmdISUNwY2VWWks1OHRWdjRreTBVWDdOakN2YWVlbHJOWFp5aitMU3FUVEp4?=
 =?utf-8?B?V2duU3dVR01nVHd0VENLb3BqcUFsYUdxeTF2dDlmSGZ5ZnlPalZLR3RiVEVE?=
 =?utf-8?B?cDJWTnN4akdUWU5odmlFREhIRHgwQWtmYm9wKzRsbGp6dXVNSVpHZEg4V3U2?=
 =?utf-8?B?cDl0YlNXODR3c0c4dXZOVVcyRmtrME0rRHl4UEJaQWpPbDRFaGFPZG55MzB5?=
 =?utf-8?B?R091Yk5FR3VDTGNIelNsaFp1cUFOZ0tpUElNWVdiMDIrbmdRdURGZmR4ZGE4?=
 =?utf-8?B?N01GcDZyc2hJRXQ3NExmRldQMUlob0NDQnB3RDJFcmhBbWE3MjlxUW1TY0N0?=
 =?utf-8?B?Q0tBZTlYSWZBdHBTcWI5SGpnOW1PNzI2WldWeVVDNmZ4dFJqWkNqOHR2amFI?=
 =?utf-8?B?d3M3Q0I5TjNrM1hVWFhuUGNpcnZ3RkVnM3hoZFVMOHUrYWcybHdJMHNrTVVG?=
 =?utf-8?B?MVljRklhNGtrYWN4Q29xTUxJdGxTbXdXNXFkZE1yUDIvb3B2bkxrdmk0b0NR?=
 =?utf-8?B?cEhIeFdUZTFYTFdWd2FMUHNxRXkxOXJPV2I5QytaWTdKeWhVQmtPK0VQRXRt?=
 =?utf-8?B?b01UM3FORmcrZWZ2UUw3R0M1UVAwb1VMQlh6L1NZTW84Q211OVAvcFZGakdN?=
 =?utf-8?B?RnAzNGtyZU5aMU9QSngwUkhBeWw2RTh5WC9BTDNXVU1JVGdlWFJaME1XTGFw?=
 =?utf-8?B?NUpWWVVoYThDYWZmQytIUkxKUGQvNE5zK2x0Zy8vbmxrWFdERWVyQVdlQ0tv?=
 =?utf-8?B?K3FPTG5BSU8xdjVjZmVaRTQvVERYdXMvVGJScEFlWGM4YTJhVW1MRjhvUXRN?=
 =?utf-8?B?aUU5bWdwL1V0Y0hscFI5bWdjVGxHc3dML0RiTXk5Uks3UFJjOXoxK2QxQVIr?=
 =?utf-8?B?R0hpcmVPbTM4Y3prMzJrck1vT2JoWW5GMTN2cDVDYWxkY0ZjSDVMVHgzeVd2?=
 =?utf-8?B?cDQvMUQvaE1ITjIrUWlCTXJCcUQ4N3ZiVWVPak5UVnlqVTdpbyt0Q3FaTU1u?=
 =?utf-8?B?aDlDYWI1eHN3cHVjTUFwUFNuS0pCa3FBQXNtNVNuUi83Q3NmRVh6NERTYVpU?=
 =?utf-8?B?QlNNUEFRY1cxUyt2ZEhpMmxqNDlpaUpEc2p3UE9JMUZxRG1aYUlkNzNET2tW?=
 =?utf-8?B?NVZSNGkzMGcwbmRmSVBNYXFBd2dWb2hVOUMyVDZoNjJPTW43N2U5ZWV3Ry8w?=
 =?utf-8?B?c3FEK1VvVkpSQUhNK1JaU1drTHNBajJZY24vRGVmcyt2M0p2YkQ1Vm9PY2c0?=
 =?utf-8?B?TGFlT2xDVmU0VjdyZG5Hci9GcEtWYkl6dkhYRGNBSHlCWHFKTXFjaEtocCtI?=
 =?utf-8?B?V2RXMHgxWWlmWm43U0FiN3Z4UDRMY2pMK0gzS3RIOE5qK3N1U1k2Qld5cXps?=
 =?utf-8?B?cUJPMkdJUUtvMXhyc0V1SzBCcGcwZVdtWVdZUzFEUXhZa3IrRUl0M1R6Y0t1?=
 =?utf-8?B?cHFINTF6VjgvcTdBSW94clgyNFg3ZzJxSXBvRjVKcS9nWXpRLzgwT3MzczFv?=
 =?utf-8?B?Q2dxdnhiMFFSSFovZ2hUUmpRd093eE93Tjk1SkRTVGk3R285SjZXbzdUdTI2?=
 =?utf-8?B?UTNrbDl3V1ZSb2ZNcDlNVDZWQzBrVjZGN2lMYUllVGlqajBUYmNZM0VYbENn?=
 =?utf-8?B?VmJ6QklkOTFtZ3ZWNDdYRXdISHBma0JiRWhCS080cU16M2M5RXFCZHJ6OXB2?=
 =?utf-8?B?S2JTYTYzL3Z2U2pPcndOQ2ZJOGxCOHVKMnlraGIxb2xHY1VDazJ2WEZzTC9w?=
 =?utf-8?B?bG90K0NmYkk2QmV2bUVCMkNQL1BhbGluSzJRcUVRQVlBb2RVQmp3anNjcUZx?=
 =?utf-8?B?UllpTWRlWTdoOXd6ZmZjOG53KzNtdnk3eHVGZ0FEaHhZYW9iQVBLT1NpVmwr?=
 =?utf-8?B?V2pZZ2hSYk94bklWc0drd3JNTGxsa1phbk1Hem1WTXpkckV4eEpiM1VBV0Zm?=
 =?utf-8?B?aU4vQkNrekNGY3RJdUc4WW1yRkY1eVoyYlRsalYrZi9mendPWU9sZGgvS2xP?=
 =?utf-8?B?b2N0Y0ZObklHcmtnUUZOZW1seXRNcnF3VENOeUwrcUZTZlcyMUJQUCt3Wm1C?=
 =?utf-8?B?SUNjNU1kRkRQdEpnSXFZYnQ1aTBlUzRJWU9QV3BlU0pFaXhVUHRNYVlSckp1?=
 =?utf-8?Q?/FN6EVc7tOjdWv7N+LeWo/FuZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR03MB6339.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fe8176-6e4c-4ba7-d668-08dc94505313
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 13:19:49.1394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTKXC7TV3o3RJxe/98c0dhKGb6zmSK3DqWFqoBuLe6XbifDCSxjy7GpdyGVKVr3asy9vmlnoM/MscYhrB/kh2iKU92FxlFKWAsdsfOItGqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7359
X-Proofpoint-GUID: J8Yl3LhSb8uPxJl9qs-d28JKZQCMDFkw
X-Proofpoint-ORIG-GUID: J8Yl3LhSb8uPxJl9qs-d28JKZQCMDFkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_10,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240107

SGkgTnVubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOdW5vIFPD
oSA8bm9uYW1lLm51bm9AZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMjQsIDIwMjQg
MTI6MTIgUE0NCj4gVG86IEFnYXJ3YWwsIFV0c2F2IDxVdHNhdi5BZ2Fyd2FsQGFuYWxvZy5jb20+
Ow0KPiBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tDQo+IENjOiBIZW5uZXJpY2gsIE1pY2hhZWwg
PE1pY2hhZWwuSGVubmVyaWNoQGFuYWxvZy5jb20+OyBsaW51eC0NCj4gaW5wdXRAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBBcnRhbW9ub3ZzLCBBcnR1cnMN
Cj4gPEFydHVycy5BcnRhbW9ub3ZzQGFuYWxvZy5jb20+OyBCaW1waWthcywgVmFzaWxlaW9zDQo+
IDxWYXNpbGVpb3MuQmltcGlrYXNAYW5hbG9nLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
YWRwNTU4OC1rZXlzOiBTdXBwb3J0IGZvciBkZWRpY2F0ZWQgZ3BpbyBvcGVyYXRpb24NCj4gDQo+
IFtFeHRlcm5hbF0NCj4gDQo+IEhpIFV0c2F2LA0KPiANCj4gT24gTW9uLCAyMDI0LTA2LTI0IGF0
IDEwOjQzICswMDAwLCBBZ2Fyd2FsLCBVdHNhdiB3cm90ZToNCj4gPiBIaSBEbWl0cnksDQo+ID4N
Cj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29twqA8ZG1p
dHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDIyLCAy
MDI0IDk6MjEgQU0NCj4gPiA+IFRvOiBBZ2Fyd2FsLCBVdHNhdiA8VXRzYXYuQWdhcndhbEBhbmFs
b2cuY29tPg0KPiA+ID4gQ2M6IEhlbm5lcmljaCwgTWljaGFlbCA8TWljaGFlbC5IZW5uZXJpY2hA
YW5hbG9nLmNvbT47IGxpbnV4LQ0KPiA+ID4gaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBBcnRhbW9ub3ZzLCBBcnR1cnMNCj4gPiA+IDxBcnR1cnMu
QXJ0YW1vbm92c0BhbmFsb2cuY29tPjsgQmltcGlrYXMsIFZhc2lsZWlvcw0KPiA+ID4gPFZhc2ls
ZWlvcy5CaW1waWthc0BhbmFsb2cuY29tPg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gYWRw
NTU4OC1rZXlzOiBTdXBwb3J0IGZvciBkZWRpY2F0ZWQgZ3BpbyBvcGVyYXRpb24NCj4gPiA+DQo+
ID4gPiBbRXh0ZXJuYWxdDQo+ID4gPg0KPiA+ID4gSGkgVXRzYXYsDQo+ID4gPg0KPiA+ID4gT24g
RnJpLCBKdW4gMjEsIDIwMjQgYXQgMTA6NDQ6MTJBTSArMDAwMCwgQWdhcndhbCwgVXRzYXYgd3Jv
dGU6DQo+ID4gPiA+IEZyb206IFV0c2F2QWdhcndhbEFESSA8dXRzYXYuYWdhcndhbEBhbmFsb2cu
Y29tPg0KPiA+ID4gPg0KPiA+ID4gPiBXZSBoYXZlIGEgU29DIHdoaWNoIHVzZXMgQURQNTU4NyBl
eGNsdXNpdmVseSBhcyBhbiBJMkMgR1BJTw0KPiBleHBhbmRlci4NCj4gPiA+ID4gVGhlIGN1cnJl
bnQgc3RhdGUgb2YgdGhlIGRyaXZlciBmb3IgdGhlIEFEUDU1ODgvODcgb25seSBhbGxvd3MgcGFy
dGlhbA0KPiA+ID4gPiBJL08gdG8gYmUgdXNlZCBhcyBHUElPLiBUaGlzIHN1cHBvcnQgd2FzIHBy
ZXNlbnQgYmVmb3JlIGFzIGEgc2VwYXJhdGUNCj4gPiA+ID4gZ3BpbyBkcml2ZXIsIHdoaWNoIHdh
cyBkcm9wcGVkIHdpdGggdGhlIGNvbW1pdA0KPiA+ID4gPiA1ZGRjODk2MDg4YjAgKCJncGlvOiBn
cGlvLWFkcDU1ODg6IGRyb3AgdGhlIGRyaXZlciIpIHNpbmNlIHRoZQ0KPiA+ID4gPiBmdW5jdGlv
bmFsaXR5IHdhcyBkZWVtZWQgdG8gaGF2ZSBiZWVuIG1lcmdlZCB3aXRoIGFkcDU1ODgta2V5cy4N
Cj4gPiA+ID4NCj4gPiA+ID4gVG8gcmVzdG9yZSB0aGlzIGZ1bmN0aW9uYWxpdHksIHRoZSAiZ3Bp
by1vbmx5IiBwcm9wZXJ0eSBhbGxvd3MNCj4gPiA+ID4gaW5kaWNhdGluZyBpZiB0aGUgZGV2aWNl
IGlzIHRvIGJlIHVzZWQgZm9yIEdQSU8gb25seS4NCj4gPiA+ID4gV2hlbiBzcGVjaWZpZWQsIHRo
ZSBkcml2ZXIgc2tpcHMgcmVsZXZhbnQgaW5wdXQgZGV2aWNlIGNoZWNrcy9wYXJzaW5nDQo+ID4g
PiA+IGFuZCBhbGxvd3MgYWxsIEdQSU5TIHRvIGJlIHJlZ2lzdGVyZWQgYXMgR1BJTy4NCj4gPiA+
ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVXRzYXYgQWdhcndhbCA8dXRzYXYuYWdhcndhbEBh
bmFsb2cuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gwqBkcml2ZXJzL2lucHV0L2tleWJvYXJk
L2FkcDU1ODgta2V5cy5jIHwgMzANCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKystLS0tLS0t
DQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJk
L2FkcDU1ODgta2V5cy5jDQo+ID4gPiA+IGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg4
LWtleXMuYw0KPiA+ID4gPiBpbmRleCAxYjAyNzkzOTNkZjQuLjc4NzcwYjJkZmUxYiAxMDA2NDQN
Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg4LWtleXMuYw0KPiA+
ID4gPiArKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODgta2V5cy5jDQo+ID4gPiA+
IEBAIC03MTksNyArNzE5LDcgQEAgc3RhdGljIGludCBhZHA1NTg4X3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50DQo+ICpjbGllbnQpDQo+ID4gPiA+IMKgCXN0cnVjdCBpbnB1dF9kZXYgKmlucHV0Ow0K
PiA+ID4gPiDCoAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvOw0KPiA+ID4gPiDCoAl1bnNpZ25lZCBp
bnQgcmV2aWQ7DQo+ID4gPiA+IC0JaW50IHJldDsNCj4gPiA+ID4gKwlpbnQgcmV0LCBncGlvX21v
ZGVfb25seTsNCj4gPiA+ID4gwqAJaW50IGVycm9yOw0KPiA+ID4gPg0KPiA+ID4gPiDCoAlpZiAo
IWkyY19jaGVja19mdW5jdGlvbmFsaXR5KGNsaWVudC0+YWRhcHRlciwNCj4gPiA+ID4gQEAgLTcz
OSwxMyArNzM5LDE3IEBAIHN0YXRpYyBpbnQgYWRwNTU4OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dA0KPiA+ID4gKmNsaWVudCkNCj4gPiA+ID4gwqAJa3BhZC0+Y2xpZW50ID0gY2xpZW50Ow0KPiA+
ID4gPiDCoAlrcGFkLT5pbnB1dCA9IGlucHV0Ow0KPiA+ID4gPg0KPiA+ID4gPiAtCWVycm9yID0g
YWRwNTU4OF9md19wYXJzZShrcGFkKTsNCj4gPiA+ID4gLQlpZiAoZXJyb3IpDQo+ID4gPiA+IC0J
CXJldHVybiBlcnJvcjsNCj4gPiA+ID4gKwlncGlvX21vZGVfb25seSA9IGRldmljZV9wcm9wZXJ0
eV9wcmVzZW50KCZjbGllbnQtPmRldiwgImdwaW8tDQo+ID4gPiBvbmx5Iik7DQo+ID4gPg0KPiA+
ID4gRG8gd2UgcmVhbGx5IG5lZWQgYSBuZXcgcHJvcGVydHk/IENhbiB3ZSBzaW1wbHkgYWxsb3cg
b21pdHRpbmcNCj4gPiA+IGtleXBhZCxudW0tcm93cy9jb2xzIHByb3BlcnRpZXMgaW4gY2FzZSB3
aGVyZSB3ZSBvbmx5IHdhbnQgdG8gaGF2ZQ0KPiBHUElPDQo+ID4gPiBmdW5jdGlvbmFsaXR5Pw0K
PiA+ID4NCj4gPiA+IEluIGFueSBjYXNlIHRoaXMgcmVxdWlyZXMgRFQgYmluZGluZyB1cGRhdGUu
DQo+ID4NCj4gPiBJIGFncmVlIHRoYXQgd2UgbWF5IG5vdCByZXF1aXJlIGFub3RoZXIgcHJvcGVy
dHkgaG93ZXZlciB0aGVyZSBhcmUgdGhlDQo+IGZvbGxvd2luZw0KPiA+IHR3byBvcHRpb25zIHRv
IGFjY29tcGxpc2ggdGhlIHNhbWU6DQo+ID4NCj4gPiAtIFRoZSBwcm9iZSBmdW5jdGlvbiB1dGls
aXplcyBhIGZ1bmN0aW9uIGNhbGxlZA0KPiBtYXRyaXhfa2V5cGFkX3BhcnNlX3Byb3BlcnRpZXMo
KSwNCj4gPiB3aGljaCBwYXJzZXMgdGhlIHJvd3MgYW5kIGNvbHVtbnMgc3BlY2lmaWVkIC0gd2hp
Y2ggSSB3b3VsZCBoYXZlIHRvIHJlYWQNCj4gYXMgd2VsbCBpbg0KPiA+IG9yZGVyIHRvIGlkZW50
aWZ5IGlmIGFsbCBHUElOUyBzaG91bGQgYmUgY29uZmlndXJlZCBhcyBHUElPLiBUaGlzIHdvdWxk
DQo+IGhvd2V2ZXINCj4gPiBtZWFuIHRoYXQgaW4gY2FzZSB0aGlzIGlzIG5vdCBhIEdQSU8gb25s
eSBtb2RlLCB3ZSB3b3VsZCBoYXZlIHJlZHVuZGFudA0KPiBjb2RlDQo+ID4gZXhlY3V0aW9uLg0K
PiA+DQo+ID4gLSBJZiB3ZSBhdm9pZCB0aGF0IGFuZCBqdXN0IHVzZSB0aGUgcmV0dXJuIHZhbHVl
IGZyb20gdGhlIGZ1bmN0aW9uLCBpdCB3aWxsDQo+IHByaW50DQo+ID4gb3V0IGEgZGV2X2VyciBt
ZXNzYWdlIDoibnVtYmVyIG9mIGtleXBhZCByb3dzL2NvbHVtbnMgbm90IHNwZWNpZmllZCAiDQo+
IG1lc3NhZ2UuDQo+ID4NCj4gPiBIb3cgd291bGQgeW91IHN1Z2dlc3QgSSBzaG91bGQgcHJvY2Vl
ZD8gSSB3aWxsIGFkZCB0aGUgRFQgYmluZGluZ3MgaW4gdGhlDQo+IHYyIHBhdGNoLg0KPiA+DQo+
ID4gPg0KPiA+ID4gPiArCWlmICghZ3Bpb19tb2RlX29ubHkpIHsNCj4gPiA+ID4gKwkJZXJyb3Ig
PSBhZHA1NTg4X2Z3X3BhcnNlKGtwYWQpOw0KPiA+ID4gPiArCQlpZiAoZXJyb3IpDQo+ID4gPiA+
ICsJCQlyZXR1cm4gZXJyb3I7DQo+ID4gPiA+DQo+ID4gPiA+IC0JZXJyb3IgPSBkZXZtX3JlZ3Vs
YXRvcl9nZXRfZW5hYmxlKCZjbGllbnQtPmRldiwgInZjYyIpOw0KPiA+ID4gPiAtCWlmIChlcnJv
cikNCj4gPiA+ID4gLQkJcmV0dXJuIGVycm9yOw0KPiA+ID4gPiArCQllcnJvciA9IGRldm1fcmVn
dWxhdG9yX2dldF9lbmFibGUoJmNsaWVudC0+ZGV2LCAidmNjIik7DQo+ID4gPiA+ICsJCWlmIChl
cnJvcikNCj4gPiA+ID4gKwkJCXJldHVybiBlcnJvcjsNCj4gPiA+DQo+ID4gPiBXaHkgcmVndWxh
dG9yIGlzIG5vdCBuZWVkZWQgZm9yIHRoZSBwdXJlIEdQSU8gbW9kZT8gUGxlYXNlIGFkZCBhDQo+
ID4gPiBjb21tZW50Lg0KPiA+DQo+ID4gV2UgZG9uJ3Qgc3BlY2lmeSBhIHJlZ3VsYXRvciBmb3Ig
b3VyIGtlcm5lbCBhbmQgdGhlIGRyaXZlciBzZWVtcyB0byB3b3JrDQo+IHdpdGhvdXQNCj4gPiBp
dC4gSSBhZ3JlZSBob3dldmVyIHRoYXQgaXQgbWF5IG5vdCBiZSBtdXR1YWxseSBleGNsdXNpdmUg
dG8gdGhlIHNhbWUsIEkgd2lsbA0KPiBiZQ0KPiA+IGZpeGluZyB0aGUgc2FtZSBpbiB0aGUgdjIg
cGF0Y2guDQo+ID4NCj4gDQo+IFdoYXQgeW91IG5lZWQgdG8gYXNrIHlvdXJzZWxmIGlzLi4uIGNh
biB0aGUgcGFydCB3b3JrIHdpdGhvdXQgYSBwb3dlciBzdXBwbHkNCj4gOik/IE5vdGUNCj4gdGhh
dCBpZiB5b3UgZG9uJ3Qgc3BlY2lmeSBhIHJlZ3VsYXRvciBpbiBEVCBhbmQgY2FsbA0KPiBkZXZt
X3JlZ3VsYXRvcl9nZXRfZW5hYmxlKCksIHlvdQ0KPiBkb24ndCBnZXQgYW4gZXJyb3IuIEp1c3Qg
YSBkdW1teSByZWd1bGF0b3IuDQo+IA0KDQpUaGFuayB5b3UgSSB1bmRlcnN0YW5kIG5vdyDwn5iK
LCBJIHdpbGwgbWFrZSB0aGUgY2hhbmdlIGFjY29yZGluZ2x5LiANCg0KPiA+ID4NCj4gPiA+ID4g
Kw0KPiA+ID4gPiArCX0NCj4gPiA+ID4NCj4gPiA+ID4gwqAJZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKCZjbGllbnQtPmRldiwgInJlc2V0IiwNCj4gPiA+IEdQSU9EX09VVF9ISUdIKTsN
Cj4gPiA+ID4gwqAJaWYgKElTX0VSUihncGlvKSkNCj4gPiA+ID4gQEAgLTc5MCw2ICs3OTQsMTEg
QEAgc3RhdGljIGludCBhZHA1NTg4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50DQo+ICpjbGllbnQp
DQo+ID4gPiA+IMKgCWlmIChlcnJvcikNCj4gPiA+ID4gwqAJCXJldHVybiBlcnJvcjsNCj4gPiA+
ID4NCj4gPiA+ID4gKwlpZiAoIWNsaWVudC0+aXJxICYmIGdwaW9fbW9kZV9vbmx5KSB7DQo+ID4g
PiA+ICsJCWRldl9pbmZvKCZjbGllbnQtPmRldiwgIlJldi4lZCwgc3RhcnRlZCBhcyBHUElPIG9u
bHlcbiIsDQo+ID4gPiByZXZpZCk7DQo+ID4gPiA+ICsJCXJldHVybiAwOw0KPiA+ID4gPiArCX0N
Cj4gPiA+ID4gKw0KPiA+ID4NCj4gPiA+IFdoYXQgaXMgdGhlIHJlYXNvbiBmb3IgcmVxdWVzdGlu
ZyBpbnRlcnJ1cHQgaW4gcHVyZSBHUElPIG1vZGU/IENhbiB3ZQ0KPiA+ID4gcHJvZ3JhbSB0aGUg
Y29udHJvbGxlciB0byBub3QgcmFpc2UgYXR0ZW50aW9uIGluIHRoaXMgY2FzZT8NCj4gPg0KPiAN
Cj4gV291bGRuJ3QgbWFrZSBzZW5zZSB0byBzdGlsbCBhbGxvdyBpdCBpbiBhIG1vcmUgcmVsYXhl
ZCB3YXk/IEkgbWVhbiwgZXZlbiBpbg0KPiAicHVyZSINCj4gZ3BpbyBtb2RlLCB3ZSBjb3VsZCBz
dGlsbCB3YW50IHRvIHVzZSBncGlvLWtleXMgZm9yIGV4YW1wbGUsIHJpZ2h0PyBJTU8sIEkNCj4g
dGhpbmsgd2UNCj4gc2hvdWxkIG1ha2UgdGhlIElSUSBvcHRpb25hbCBnb3QgZ3BpbyBtb2RlIGFu
ZCBjb25maWd1cmUgdGhlIGdwaW9jaGlwDQo+IGFjY29yZGluZ2x5Lg0KPiBNYXliZSB0aGlzIHdh
cyBleGFjdGx5IHdoYXQgeW91IG1lYW50IGJ1dCBJIHdhc24ndCBzdXJlIGFib3V0IGl0IDopDQo+
IA0KDQpZZXMsIHNvbWV0aGluZyBzaW1pbGFyLCBlc3NlbnRpYWxseSwgSSBkaWQgbm90IHdhbnQg
dG8gbGltaXQgZnVuY3Rpb25hbGl0eSBhbnl3aGVyZSBJIGNvdWxkLiBJIHdpbGwgbWFrZSB0aGUg
YWRqdXN0bWVudHMgYWNjb3JkaW5nbHkg8J+Yii4NCg0KPiAtIE51bm8gU8OhDQo+IA0KDQpSZWdh
cmRzLA0KVXRzYXYgQWdhcndhbA0KDQo=

