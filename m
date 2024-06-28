Return-Path: <linux-input+bounces-4698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153EB91BF16
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 14:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27FDA1C2216A
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 12:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE7F1957EA;
	Fri, 28 Jun 2024 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="t3E5d6Mo"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A194C3BE;
	Fri, 28 Jun 2024 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719579498; cv=fail; b=KrBquZnbzbwe2AdlQ8TkUytaO4Mgmi9qFVCE1j4/1kbP29hw74WGz7rD5cYtA9+NDifYd31WMN4sgtNCX4WD0JuyJi0TTc+yGFOQruXYWnfMWfaV+vSi1AGEqXfSMkWow/cg8vHwBP5s5V0EVpn7IVIdSWiT0jV55hkH2jllSNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719579498; c=relaxed/simple;
	bh=jgwx/Xcvz5c1mpqbk+Fc0ar1RtNNqoCmPGyUjN5adko=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hEwTMAvUCRjO547fp6NSjH5DBoSeV5PiKP2QPFbbHYdxfhiG2O1RbKwlRC6GwSwXVGAKBHVXfgQIyaM45S/Geh7z4XyOQPjUHMfBODEyPfyduAM5C8hWCbciSJSe6Xndx5mLeZISgH6fiDpYicbuM2YO34ib2v06kJfcg53AqAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=t3E5d6Mo; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SBgfM7016233;
	Fri, 28 Jun 2024 08:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=njBtrne8CIAQ3aUEz7KCX1Ce7zU
	2Vx7uhlBj5krztls=; b=t3E5d6Mo3BCy7HYHHub623hBthyGuDHrgrzPH2O8Ovd
	Aai8JqGNYQRniKCh+tWW+U2gDp9PM7JwwCk5Vyfvr6j0cMZggZbqg3Mr7fB3fgBH
	Q2ZwtsPVgmnpRZlRdFFGMJ4jIy8DWB8xguUKEQPy8bdHzmk65Cu1bGjdE98Z6952
	05/4fvtXvveiB4uNPCzJFofen5JGpwXxoHQG3LF4jIZCEA7rw2UPAQH8a+7UlxwJ
	Wa9L5gMZFx7sTqG+InfiJ0Oqq+kBWMWj4MdtM8sVgsY4cclEi1zbUeHdGOWM9N80
	vkZD+Qv57a8XXNaFkSLNM/0aO+qXznDgVp1P7NYdjwg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 401vhsr6hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 08:58:09 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xibbw/Bc7CnLWM+gQqFVymhxEcpjbz/e/LRwW0xCUf51e71A6Q6PvotQinQzg8L7027vyo1oqdCVoIN7n7Oo2N3JCdGKk/maNB21fFCuYk5gHpOjvZzAPp5uV9bRdCxHdTOpiXEfuULVeT16gEs85svJAAyqNYsA8NmCQ20KxZaOh/N//YFMbxQG/ZBUXPdCTc+wzju6wAK8fwxVK0vzws4vhkCUCHWQO1suXa+htTZqvLSjFIq8nRjfdscKxXB+x+jXQBSQ2WxQtAM1tSK0G4cLq+f8rZ8NkksH6Jsi47OmlrzSwINZUM7Naw0y9cCG4SKZ6g74t/MKjwGv+ewpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njBtrne8CIAQ3aUEz7KCX1Ce7zU2Vx7uhlBj5krztls=;
 b=JrrU7yCTr4c5l7Ut95fPPqvZVAZKv9CQ9uebODHJz3CIePqC1rWdcE953zIFuXpkCRh+S8jPZrTeAwbEPIpd7CaHjM9n5EWrNXEYD4pyalXLZsN9oTVtmYLsqQqDE14/sq/FR33gjCn1JpKaR+vgRQ56LcIYKVw32ljqDTsT9O30VgwJnnVlK8O0Q+osdcQoCEY9zpcxmrfDZ2XyCm8nmP7GJDab9nh5fcbesaPYCM5ZuggnbOA9lfgMc1B8DAQOgIkS/s5pi9Qkd6eIfHR9RWX/TgVMb7Y8YnX6iWB2b83hZCMFyiHN1kr6jBqI5xFEqVY2O7p+N1+gI7oAZ4gTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by PH7PR03MB7195.namprd03.prod.outlook.com (2603:10b6:510:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 12:57:56 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 12:57:55 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>,
        =?iso-8859-1?Q?Nuno_S=E1?=
	<noname.nuno@gmail.com>
Subject: [PATCH v2] adp5588-keys: Support for dedicated gpio operation
Thread-Topic: [PATCH v2] adp5588-keys: Support for dedicated gpio operation
Thread-Index: AdrJVdnSzNlyofTJQlia1zDLY76hug==
Date: Fri, 28 Jun 2024 12:57:55 +0000
Message-ID: 
 <SJ0PR03MB6343CAFA976656052DD10F5D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcdWFnYXJ3YT?=
 =?iso-8859-1?Q?JcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy0wN2RjZTkzYS0zNTRlLTExZWYtODRmMS?=
 =?iso-8859-1?Q?02NDQ5N2RjZTVmODVcYW1lLXRlc3RcMDdkY2U5M2MtMzU0ZS0xMWVmLTg0?=
 =?iso-8859-1?Q?ZjEtNjQ0OTdkY2U1Zjg1Ym9keS50eHQiIHN6PSI3MTUwIiB0PSIxMzM2ND?=
 =?iso-8859-1?Q?A1MzA3Mzc1NjQxMTQiIGg9InFEbUVxcTdlZHRtRUh5aWtIZlBSZVhNbFlM?=
 =?iso-8859-1?Q?Yz0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBRFNDVFhLV3NuYUFlWWhkOHpQTEp1czVpRjN6TThzbTZ3?=
 =?iso-8859-1?Q?REFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFFQUFRQUJBQUFBM0xoU2ZnQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBSjRBQUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QU?=
 =?iso-8859-1?Q?c4QWFnQmxBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFh?=
 =?iso-8859-1?Q?UUIwQUdrQWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQU?=
 =?iso-8859-1?Q?FBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdV?=
 =?iso-8859-1?Q?QVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtB?=
 =?iso-8859-1?Q?R2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQW?=
 =?iso-8859-1?Q?N3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|PH7PR03MB7195:EE_
x-ms-office365-filtering-correlation-id: 94846d5e-cd96-4dd4-10e4-08dc9771edee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?viwIl8JMORslBpcd41KQur/X1udFum2elum8CtRbjVe+OlC/xTXENbIsAM?=
 =?iso-8859-1?Q?bjM5t9gKls/Y9or7o4qYb2VV825qwQlb+ijHY2EPivVBe+IACKUtrtyOG7?=
 =?iso-8859-1?Q?GvJHsJ7F9AwVptpkhnlU650dE5CweQAzj2hQmHuVOU3U0tmXanO0nS8o1F?=
 =?iso-8859-1?Q?mghsFYM8pEWn8OxafLzZ5LEgIEeh937+kWUi5/SOYqRkkXyuCPv/M6ph+4?=
 =?iso-8859-1?Q?ezanI1KfKIBMU6uwJIlA7oCIndLVcCz9HAPPbDWMs7k1M9D+h7Y3tP6or6?=
 =?iso-8859-1?Q?cys87dVZcR1wDi+bfErB/wYVZm5IsBKsU0ayYxkPe1lo6Iv66FoI3lkhD5?=
 =?iso-8859-1?Q?dXz6pOwuqjZLkwG8OM+/DcCr4UJi/E4C8Wu3vCUAZRXTaU2X/fTXxNGIfv?=
 =?iso-8859-1?Q?052WwluJrWjSMDi7PPGBD1c0OMyLT7KA3LqPnbL0u5d/B5tFeoztrXgIya?=
 =?iso-8859-1?Q?5EfNVziBwwsfRSP2rZIXmg1TIv9Q/vWOrM/sO0V/lFwXbmXVlg47GddiP/?=
 =?iso-8859-1?Q?E/do7SfOHUOPO4sfGkdHftaTk8VcGNHI5+xT/w/zQgF07o08MlyKQ61m9d?=
 =?iso-8859-1?Q?emLsU0/5rbPHX9JHrENMe2rC89Bsnl0oxtJjJMCxPPPkyNPwkZG6XGOnXN?=
 =?iso-8859-1?Q?fOlcOiMMC2RYgCaGCfOc7koe/iud7yVU8I/D+qY4U02Wh0vAvf8o0+8amH?=
 =?iso-8859-1?Q?enUXHDKf0Qg3jy4tY71hDWJVl/VUykWEEpOZOu+OLI0qkECAjrbE5Wf5Ne?=
 =?iso-8859-1?Q?iQDJBv+CvuVuemWyex8WfONmu5NV8MELWCqY4a+hV5GoX4YXzo5LDkMJww?=
 =?iso-8859-1?Q?SYe+ecXauo1JX/2pv005uZ6BuqvCqN7ohFAIL+nDgEpjYv+5JP5y2jxRnA?=
 =?iso-8859-1?Q?JtKEb6nhSchc9I8VZ0OOIfhCQ+h0PxMbmbkgbpE7VI5o98ek0g727R+1hw?=
 =?iso-8859-1?Q?k6cmd57ay7rUOUWnMAcIrqn6aqRVSnHtCnJpyq33W1S4JrbwX3fSegxWth?=
 =?iso-8859-1?Q?KGKrhXssS4LKg+5VjGKEMe0VCFId2njjP3Q5YTo57bMpRVZobkA2b93gJk?=
 =?iso-8859-1?Q?iEaAwHlfOAUWvLkXXVqw57YmvZHIZ/E5XnbXVaWbYYKR1ETIRgVQk0DmOO?=
 =?iso-8859-1?Q?isYNZmeTqxIU+RrYATRMccFh9Rxa9sRXRrzH2lFfOG/dvy3Rg2Vum9K64l?=
 =?iso-8859-1?Q?mUcv/pIAacePsJk+hwNoDf7TgFzwjIffbGnlpDDzUExdA8YMYrF7l+rums?=
 =?iso-8859-1?Q?bbAo+pAYfx7muc7vp6WRVFcrzTCkR5M6q4ArkW7EK3jdHyNy7Rv4KDtppQ?=
 =?iso-8859-1?Q?MaoA7VwycYsNqkoAI0CVHdbdy5YR2TdK38+aiun5A3b6chXMbLSFXqHOoW?=
 =?iso-8859-1?Q?pBL6DCubrgLW/ckLSKjBEJBLe5xc74EPoO4dzDkuWdxuaHxZpjW9bFNP2o?=
 =?iso-8859-1?Q?bZj3zk55UZOFY81eNRdSazF6/6+Is1oX4acsaQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5S1wlSZDJzdFYQvYKEMYnNCqc/2SICdgyaEqSMlmD0bbUaRPzqHDJunBnR?=
 =?iso-8859-1?Q?icG1p3rRUwpXQxxQI+OhC37O8Frvu9IHNRg9kxTmPrSkAg3PMXTF7nXqZH?=
 =?iso-8859-1?Q?215T9U61856kGdAShcJ9j5YpYgwZuadjc2w7h/2rttHQziAwS1mweYpop7?=
 =?iso-8859-1?Q?oYaeXDC0IuTo81E9Gsa62CESNpGxAeeoNAASJBNOhglfSJhi0/RV4cPyrq?=
 =?iso-8859-1?Q?bSOTp0z6de4O9MxWAdQN2dBruShBmjOvEc5ihzGDhTwaM2WCyi0E2gMpQo?=
 =?iso-8859-1?Q?IvOsZ+V9z8R2QHFC+BBVUFSsxLHoAflwXl9Ms3Jk3SMs85bykPMQ88HFo2?=
 =?iso-8859-1?Q?i3CmWvHqtwaVkqZSZA37rI3A5XR8ZH4NbxhAMVUy0BbwynjSRHr7SgqvJs?=
 =?iso-8859-1?Q?iP/yQKiM/89liZxa1TRvjXIg9GJhet59CH6lLjEQILVWzd2MKsXKWRi1E/?=
 =?iso-8859-1?Q?vEksAhafTeATZ5pLHZ8iI8ekYl1lFnfanOH4SqLQlKZxpoPyIKuwp4Aysy?=
 =?iso-8859-1?Q?4n/VsHojoYzSOySQjTxMbe25ik+TwJxfhWohfFjNrZVWt4m+BBS2BxnqRq?=
 =?iso-8859-1?Q?BD0YVK88Vqe+RrgXgiyUASPKzDLMpll/AGsk0iuOwJg65I0PPifFoCigI+?=
 =?iso-8859-1?Q?JYgF9swMNN5usiuY/xiiXJypwmbyeaZueWLpR5JiLn98BCNOHhtL9cF2W0?=
 =?iso-8859-1?Q?Wx+/YGeNAVO7gmBCPL8+4hEkgzsintBgoCHqm2osnZ5g9cbiAJGjZOgm9O?=
 =?iso-8859-1?Q?MTHkDRP3/D+T2XchxY1rApQaAz4bUMxJ2S7WqSnD2ZBtG0YVSVPqu2R8S8?=
 =?iso-8859-1?Q?BdKQyHGsx/hOiYK8r8N7EA/5XDQhiBUFSLniTpHfhPqqOY4cbr498ESy6v?=
 =?iso-8859-1?Q?Di9aPN5M+9WSFKWEJ/dK3pULKz4oL52zL/zAU3T7zrZsU4/sPMNRV9py0H?=
 =?iso-8859-1?Q?McLGWaXnVohgUHY1KE8yMwGjLq/iLwDq/KiI9QnE3j5+mPpSPbCZmSCDVq?=
 =?iso-8859-1?Q?LqBikD8eACRCcxpaa+aB3SkYUughTH/y3efZmX+fHoogcwvRwu2UQY0iPI?=
 =?iso-8859-1?Q?9iZsRPEm0n+3GGnbxyrdZi6uFbRxfk0QCoKqp2KCdLViBDqKpbfPFlggTd?=
 =?iso-8859-1?Q?C+s51DWKvcxUyfL3tW8oFprN0U/DXe64nuAaY5zfeGXsRBuPdoiuqYYPGX?=
 =?iso-8859-1?Q?utowNNGF57ilFeWCmrzctdGbiyve+GFd4nOB/TCsU/TQpzza5GcHfb1Ldj?=
 =?iso-8859-1?Q?Mfh4WZ5Npx4k286itMEBi9bn7/CC7u38XOSeUoum9aKgmR02cHKCpdMwO1?=
 =?iso-8859-1?Q?5X1mU+qSzECVggVLslARsCZdqGudREDiRKSgH2rCEs2LBixn1Eu9zPKFmx?=
 =?iso-8859-1?Q?Ad3aCqSrYR2gjZD+A+AXBCN/JK5mh50KNld2IbT8NFVmuRyuvdtmZ2nIMM?=
 =?iso-8859-1?Q?sbZ93vaM/NV1/l6G0WKxuwE0oYLh+kWhJD0R/B8c3+HMCC+E/cDLhLvEJu?=
 =?iso-8859-1?Q?njLfaROfACLzBpBYl0QbHzwMdG+ffXZp+xZUFLX6XSrAABXUlhJhlfpGzL?=
 =?iso-8859-1?Q?8GvPxwi6gor7C+xytpbh4DwCWokhschgMmrdTg+huD4VFQVUJqozRPjGqh?=
 =?iso-8859-1?Q?s3P/M41gn+2ZRViL0CVyeMzx+XBejQQlif?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6343.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94846d5e-cd96-4dd4-10e4-08dc9771edee
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 12:57:55.8234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z8hEK6pMtX3uqGjuZi7uxkqg5DwZ0NnrKqxb9i9BWfK/hxonGzgmTuN6pKYFJGqiZLXp6y4Zt8pvxTF3XB2twiI+IsunM+ps7P04PLpMyN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7195
X-Proofpoint-GUID: DfFq8pbLglwPiLSv_acj6e0dLh378cUW
X-Proofpoint-ORIG-GUID: DfFq8pbLglwPiLSv_acj6e0dLh378cUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280097

From: Utsav Agarwal <utsav.agarwal@analog.com>

Current state of the driver for the ADP5588/87 only allows partial
I/O to be used as GPIO. This support was previously present as a
separate gpio driver, which was dropped with the commit
5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
functionality was deemed to have been merged with adp5588-keys.

To restore this, keypad specific checks in the probe
function are relaxed if the following conditions are met:
	1) "gpio-only" property has been specified for the node
	2) No keypad rows/columns are specified

The "gpio-only" property is introduced to simplify usage since it
serves as a clear indication of the user's intention as opposed to being
inferred from the number of rows and columns specified. This=20
also adds simplicity for the accompanying dt binding update as well
as interpretation of the same.=20

In such a case, additional checks are also introduced to make sure=20
that keypad and pure GPIO operation are mutually exclusive by=20
checking for keypad specific properties (keypad,num-rows and=20
keypad,num-columns).

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard=
/adp5588-keys.c
index 1b0279393df4..6bfe748797df 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -188,6 +188,7 @@ struct adp5588_kpad {
 	u32 cols;
 	u32 unlock_keys[2];
 	int nkeys_unlock;
+	bool gpio_only;
 	unsigned short keycode[ADP5588_KEYMAPSIZE];
 	unsigned char gpiomap[ADP5588_MAXGPIO];
 	struct gpio_chip gc;
@@ -647,6 +648,25 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 	struct i2c_client *client =3D kpad->client;
 	int ret, i;
=20
+	/*
+	 * Check if the device is to be operated purely in GPIO mode. If
+	 * so, confirm that no keypad rows or columns have been specified, since
+	 * all GPINS should be configured as GPIO.
+	 */
+	if (kpad->gpio_only) {
+		ret =3D device_property_present(&client->dev,
+				"keypad,num-rows");
+		if (ret)
+			return -EINVAL;
+
+		ret =3D device_property_present(&client->dev,
+				"keypad,num-columns");
+		if (ret)
+			return -EINVAL;
+
+		return 0;
+	}
+
 	ret =3D matrix_keypad_parse_properties(&client->dev, &kpad->rows,
 					     &kpad->cols);
 	if (ret)
@@ -739,6 +759,7 @@ static int adp5588_probe(struct i2c_client *client)
 	kpad->client =3D client;
 	kpad->input =3D input;
=20
+	kpad->gpio_only =3D device_property_present(&client->dev, "gpio-only");
 	error =3D adp5588_fw_parse(kpad);
 	if (error)
 		return error;
@@ -790,6 +811,11 @@ static int adp5588_probe(struct i2c_client *client)
 	if (error)
 		return error;
=20
+	if (!client->irq && kpad->gpio_only) {
+		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
+		return 0;
+	}
+
 	error =3D devm_request_threaded_irq(&client->dev, client->irq,
 					  adp5588_hard_irq, adp5588_thread_irq,
 					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
@@ -800,6 +826,13 @@ static int adp5588_probe(struct i2c_client *client)
 		return error;
 	}
=20
+
+	if (kpad->gpio_only) {
+		dev_info(&client->dev, "Rev.%d irq %d, started as GPIO only\n",
+				revid, client->irq);
+		return 0;
+	}
+
 	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
 	return 0;
 }
--=20
2.34.1


