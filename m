Return-Path: <linux-input+bounces-4794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F3191EEC4
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 08:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6F581C21814
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 06:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC7936120;
	Tue,  2 Jul 2024 06:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="RwX1lSqw"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC19747F;
	Tue,  2 Jul 2024 06:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719900681; cv=fail; b=gGYAWvHq+M3vjH4CT8u1NCN+OADfzko0SfU9a2Y0suNx9EMTnP29X+YeXRH9r5aYNaUr7LA4MrMdG7C1cqEZBKRPXwAfvnCbMF5Aj7Tjv1RiOCvbT0QU3moQ+dHIpmHT9P1x8kBF8yMV2S/wP2320z/6lZAefYwdu0Wa5QzTg3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719900681; c=relaxed/simple;
	bh=tm+xeVTutzd6rON+WzV8w7AT+3lS0ADW8rEGCA4HF2k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f+IpnS54DYfZYbAXhbr0hRMcoYzb2LzA8g010PqPi5oDuTxwsGqcABzRyjTO0UdP8KfXtZqUXzK7bi+Huh1cFWtstj9cBFOJD9JDhiXjRZnuwnfV0uGxAfv+mZzdFIZrRGqdulZS8daVzFXr76f3O0hRp5x2KFchPbSE72qsncQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=RwX1lSqw; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4624H0M8011323;
	Tue, 2 Jul 2024 02:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=M5O5M
	LiibvFxj5C+Hri8jDCba+EZGe/xPCMKHhglNro=; b=RwX1lSqwHmnrimbcJdZDB
	UI4QGFSxrIUKZ6lv2StduloPSTgRwBTFYqI7MBrlCt6mpFEvDK/HBZqbfMHr4CNW
	R2pisybHy0e51z+TzkUfL8nzS+A7yguNngjrcGtRh5O06pIjhloJIg7wattUjsgL
	WeD+J5SZcejgIrXYNMXFlYBlv5QRM6m2s3XnvE1gXpjUUiRS4bnCeqNkt/8/Wkgn
	zONO7oJtxcGAF+Gmdy7GWL3r9mMGchPk+/8zbzet4xHenf1LcqTU3rsTBpFnR2Vi
	jJTjxO9Ad/4gIoIW7CmBooTIQHEiznRe1FHrzmA3PGiQXeFxiLLki2JY18B4NG46
	Q==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 402ew50e6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 02:11:14 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlsQWE3y7tJ0vhnDD6V9ZrPjsfcTobm1aOuOl0TaFtvyTjighGxnc7HkPXXu/8HBqe8KKn4sa9wGcNMEDqYN07Bt0zTltGkaqV6x/ycsV1A2bPrgDpmcIQyUu7Xfq8pWLuLMDaSbEx/TgeJL2xetunvq02RoMY1mtvifyEmsu3GQpa4cPGj3P84Ugtkzb7S5fQnnQx5j9Pk9UXL5Kmk09VLdx8RMQd30r2WUvcq57sy1X6nLcDWk7eo0iBed0J7B5S5t3lW4Mf6kqVc7uHWPHOl+bF7Y7KAgHJFJtxzMKqWR17sAYQUjZc3Up2EWGzgN3wBYyG56yxO+NlJDJPGoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5O5MLiibvFxj5C+Hri8jDCba+EZGe/xPCMKHhglNro=;
 b=gc9yVPVbKUUoWX77AOgBJA7ks+Gjkl+3OqGTIIx0m1efeOddOmmGMTLuRK+EAujkOZLUwrbZRQesxcyhJ/UC3ab6ZE5hKZTlHeOjEXpL+E3yrpvHsq/gGwFbp0IzaZMNt+OD5zN3Q/I/VQ33CatxKemSwznGreBPJirZjB2tyYziS1sdVgo2/Q2ZFUJeUu+ahpGdoH2/eUSL4DxXyBv6H6ntKhzXSFh3Lp6l3NVaHCcBO2Whjscz7onUyOwS8wdRiKtuWPyyawc2hB9rVINHDqxeXM46dH+NiItXUsyYaI4lQFYltcpgjbf6qSvkO0z9INM9wbBSLeH178ERQxqK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5)
 by MN2PR03MB5358.namprd03.prod.outlook.com (2603:10b6:208:1ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 06:11:12 +0000
Received: from PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28]) by PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28%5]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 06:11:12 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Agarwal, Utsav"
	<Utsav.Agarwal@analog.com>,
        =?iso-8859-1?Q?Nuno_S=E1?=
	<noname.nuno@gmail.com>
CC: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] iInput: adp5588-keys - use guard notation when acquiring
 mutexes
Thread-Topic: [PATCH] iInput: adp5588-keys - use guard notation when acquiring
 mutexes
Thread-Index: AQHay+AhpNN2wQMLDUagfE+OEJzgVrHi9XpA
Date: Tue, 2 Jul 2024 06:11:12 +0000
Message-ID: 
 <PH0PR03MB6512A166C402B683EC2B851B8EDC2@PH0PR03MB6512.namprd03.prod.outlook.com>
References: <ZoLt_qBCQS-tG8Ar@google.com>
In-Reply-To: <ZoLt_qBCQS-tG8Ar@google.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?iso-8859-1?Q?PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXG?=
 =?iso-8859-1?Q?1oZW5uZXJpXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAt?=
 =?iso-8859-1?Q?ODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctZTNiMjM1YzMtMzgzOS0xMW?=
 =?iso-8859-1?Q?VmLWI4ZjktYmNmMTcxYzQ3NjE5XGFtZS10ZXN0XGUzYjIzNWM1LTM4Mzkt?=
 =?iso-8859-1?Q?MTFlZi1iOGY5LWJjZjE3MWM0NzYxOWJvZHkudHh0IiBzej0iMTA4NTIiIH?=
 =?iso-8859-1?Q?Q9IjEzMzY0Mzc0Mjc2NjI2ODI5MyIgaD0iNkVzbUVXWXo1dnh4MFRqZFB4?=
 =?iso-8859-1?Q?S3RjRXdNcTdrPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUk?=
 =?iso-8859-1?Q?hVMVJTUlVGTkNnVUFBRGdEQUFDRmZ3bW1Sc3phQWQ1RDJ5SmxQdXZsM2tQ?=
 =?iso-8859-1?Q?YkltVSs2K1VEQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUhBQUFBRGFBUU?=
 =?iso-8859-1?Q?FBU2dJQUFPNEFBQUFBQUFBQUFBQUFBQUVBQVFBQkFBQUEzTGhTZmdBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFKNEFBQUJoQUdRQWFRQmZBSE1BWlFCakFIVUFjZ0JsQU?=
 =?iso-8859-1?Q?Y4QWNBQnlBRzhBYWdCbEFHTUFkQUJ6QUY4QVpnQmhBR3dBY3dCbEFGOEFa?=
 =?iso-8859-1?Q?Z0J2QUhNQWFRQjBBR2tBZGdCbEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQU?=
 =?iso-8859-1?Q?FBQUFBbmdBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJ?=
 =?iso-8859-1?Q?QWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBREVBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFBQUFBQ2VB?=
 =?iso-8859-1?Q?QUFBWVFCa0FHa0FYd0J6QUdVQVl3QjFBSElBWlFCZkFIQUFjZ0J2QUdvQV?=
 =?iso-8859-1?Q?pRQmpBSFFBY3dCZkFIUUFhUUJsQUhJQU1nQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQU80QUFBQUFBQU?=
 =?iso-8859-1?Q?FBQ0FBQUFBQUFBQUFJQUFBQUFBQUFBQWdBQUFBQUFBQUF6Z0FBQUFNQUFB?=
 =?iso-8859-1?Q?Qk9BQUFBQUFBQUFHRUFaQUJwQUY4?=
x-dg-rorf: true
x-dg-refone: 
 QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0JtQUdFQWJBQnpBR1VBWHdCbUFHOEFjd0JwQUhRQWFRQjJBR1VBQUFBOEFBQUFBQUFBQUdFQVpBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFERUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURJQUFBQT0iLz48L21ldGE+
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6512:EE_|MN2PR03MB5358:EE_
x-ms-office365-filtering-correlation-id: fd59bfe9-388f-41fc-2082-08dc9a5dc637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?OI2CKCktpn2nkPNhmIU9G18XhjOILTuRar28PKhZGJhX04vBID67VP2Rhh?=
 =?iso-8859-1?Q?02x9iHBiHkrO4KD7jOaIWfHVCAVqwoTCCATxj2lj49XqThj6zeWf2CdNju?=
 =?iso-8859-1?Q?TRPr+7Xo5agOzIN/P5eEH0onzmNyCGlcgLi1Led4NeObZt8AUKaPVlJjnk?=
 =?iso-8859-1?Q?O1WPO6d8woXFvIvqE4eNOeV+8dVO5XN8nSJCGriMvkkG7iPIVNpmi5jHq4?=
 =?iso-8859-1?Q?8rRbAmIF/iSDjO1xP7/RQwdrhXLqHbq3/cTShfUYLILTvzG1avtbMbhQUM?=
 =?iso-8859-1?Q?u3d8MCvN7LgAFDVPp//A43L4SUioko3+JxbXieyoYS5woXas2b32fNTSAp?=
 =?iso-8859-1?Q?QDB+mg1/CfwaaxWT354cVJxMEHdqisQPmcsyJap7NrGn7mJ/g0utdnlTLw?=
 =?iso-8859-1?Q?Gn27GW0pSoTtqFwJckZMNmfb6twGG4pJd29KmkEiTwCPyfom/YmagZUdOp?=
 =?iso-8859-1?Q?llxY0XdjAmEqfUkdySA1Y2Y9kpv0niW4901jFUphCrrJ2Q7ZAqEsAMp8tx?=
 =?iso-8859-1?Q?IvwvLvj5VXlIB2jP+Tu2Gw/Ixz1XdVDnmGUJojNE0+Ium4drcDFQumHc0j?=
 =?iso-8859-1?Q?6OAczAww3ezlBE0E/8E6jlLRk08a6CA/PgrGkOY2/pVLS33K6mZZUC6CLa?=
 =?iso-8859-1?Q?tIA0Ky1tLFfU+8ROSK3RUFjo/weE3Nz89a6Ic/x5+10XJPwZ8pr1amLsI6?=
 =?iso-8859-1?Q?BvYqN0Ks67R3BALuS+0DY6pLCIqrd0X8bd/bOhDJcDqf0Q2apZ9l0I6W3N?=
 =?iso-8859-1?Q?Mct3gIgHYNAVwpniQIT8Evqs5Bx56D6BzAURYILaKX+JcNFjWGxNTklXmU?=
 =?iso-8859-1?Q?5SoYMyW/QPApNBjP+ctjJm20i86cFVrPKBRRt5+mo5WD+AlWA//9xc6stg?=
 =?iso-8859-1?Q?n9vJ4GoZGYN68OQgpxJFDSfKWhHTBWgNEvk4KbNlIgbwN9wbfymolotevA?=
 =?iso-8859-1?Q?nsvDl1h1+Epu07JvM1gpghniX/3sct1ayrLtlaPBGtvdbuVVFYSy6XSp2p?=
 =?iso-8859-1?Q?v420y1ldwnaCnAF5J0QsYkp2P9O8VVJtdB+mD90Ymg06H+artXDZ2WTCNi?=
 =?iso-8859-1?Q?MeiH/epFXWMvAaEQPGv4sUPIHKs2wztux241dUGtnfIRYLABpyXnvWbQus?=
 =?iso-8859-1?Q?ZOOKJZ9wmAyCWn/cWjTzMnAfjWLDP7juyQ2sHPRbcSSprEwHoX7903vaFX?=
 =?iso-8859-1?Q?R0V19DPfFoU6HAIxB4I0D8SSykZH/M/z0UiBQ3k/2hLq4EJmgRm2Gt8bXZ?=
 =?iso-8859-1?Q?SidF4Lv8d2SHLFRQb4GJlmWo8nVqx3gKDmEPQHFom3HD2L4rD/dYth47Uv?=
 =?iso-8859-1?Q?ZfJLBretSw0wxQw7oa0KfBEGq4onEkN7R8z1UIyQm/N0rxEXsy30fa97N8?=
 =?iso-8859-1?Q?60Dh3wsIWHNDJRl5kCVDLrUki9klITnxPilNOLmd0DNGPVrfAXaqdHP5WS?=
 =?iso-8859-1?Q?u9pcjlUGM/HP6c9XKR9HmgYIK9qNdghJWqedvQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6512.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xyTCQnNTZ5Up/hzKkZ2JpoJLSevaqVG2P09r+rpdpqXFeSDcw9oor80VTK?=
 =?iso-8859-1?Q?ZjpP9I53UK2hEvVDFngw0fvCO443nn5j+6hpDXDqdRy4XaJISdV6HO6c8b?=
 =?iso-8859-1?Q?diefN0zQCmDja3ipr3UrE7drKsX55x9UIOpLxFbMVQzgN1/iA9t3cPWAuA?=
 =?iso-8859-1?Q?dOfhyCiJhNnc6z8R3KGeFV+mQuGgUB9QKRTVX3NV24qSDDpV0xV582ckuX?=
 =?iso-8859-1?Q?Gvj45tV/oW4rkVdHW8HPRT5WII7SBt8l9Kdot1V0lvASifHswCG7L22xtA?=
 =?iso-8859-1?Q?4Ue7Jhb2uHLSmMNQcpmWbu1IgsJkGMSyy5vmj/vHYG99yk1wRpQ0zUgx/e?=
 =?iso-8859-1?Q?LoXaBKLCbW5+EHJ1d984p+GNgSBdPdF6wiks9mjpEZDx61waNpFL8tbeuO?=
 =?iso-8859-1?Q?trFE1JKMNnNfvZWq8GLIJuIW3+ig3ozrI49U0j/zL6NC4kYXb2pKJWpO+g?=
 =?iso-8859-1?Q?yiCJ0tQqBksSo4PlB51YTzI7mjTRQV8EGT1eyp79beIuIIOsXrjbnZUIEf?=
 =?iso-8859-1?Q?0ukeP3SNC2djmopbhaPOoLsxCKA5PQthkItXY5M1yy8dlLkYTEQUrN9F5U?=
 =?iso-8859-1?Q?JfAL9U7iGg+xag851ElYsbE3mIa/MjLK/2IqatoPntgIlBoZ6IcGXFUQPj?=
 =?iso-8859-1?Q?MbiTYCvIp2V++P3ZaZoIVw1Wg6ktBL0M1uiWLNCI5k0P/c0fRhCM9+aT0D?=
 =?iso-8859-1?Q?dQ9U4Q5z2Q4cQMOOpB6xcPet7UVtIr0DhCceTaJRcJOYwJRiPqNKsVk3X+?=
 =?iso-8859-1?Q?cKLiK2EBGHCFFaM78g+V/8fYzCQwfKQCa9RdAMMqP/qtQgFChkZ8nCHZkY?=
 =?iso-8859-1?Q?czos28GbCprUxOXoWdtWoIvESWU9K/VVA5fMAJUbbiugXgqXTkc4wddUUj?=
 =?iso-8859-1?Q?6hJiKLtX4S2jYoyzyL/cnMKzGyDXTa23AWmVwdYv8ksYKzf6udPgb8X0Q1?=
 =?iso-8859-1?Q?nyDRFihZITcbV4UJqlCPFbuplomCQTmlYqrgeQNOhwBdwPeyoYe4t7E3VX?=
 =?iso-8859-1?Q?iDZMpEfJJxV7fr8K3s+e+XMpGHqJz+dMjZXEOgiMJKOF7Ng1kFyzRLfXZx?=
 =?iso-8859-1?Q?lujMUOe8ntXUMAc1F6iZ7rFV5TLsjsfAXs2Ht16FzsLIAY1mw+d6nYsJ3X?=
 =?iso-8859-1?Q?MoD9Vfhy+e3hoIz5wDDydnNPbI6aU/9Rn/pjOkgC2OFZrhv87wv9GFXaWE?=
 =?iso-8859-1?Q?vuutRCZrdWCnFOFD+XigA+KBQPt/qZ6swn8e+spRqdxKezGf2103JRjeW2?=
 =?iso-8859-1?Q?Sf/bpOQE5kdUURkN3wkwVyP2vCCc08QXRqI3Phn+/pUwrbo26MLarQPOya?=
 =?iso-8859-1?Q?HkHsDXivXw5C7jaP2dAvyLqxAdQ72Pb3skhjrytmkn4epDNGTNaNT6qvjD?=
 =?iso-8859-1?Q?Qt4pL5aIErah/LDRSG+QkV8skDUQKypvclRcs5ekPAt+8G/5X+vig8rKzL?=
 =?iso-8859-1?Q?Lv3gIcLm/6qLFik3IS2ZyO0Ms1EYYZxg8EoSxCBX5L2xpiLsM4aTyUnfx2?=
 =?iso-8859-1?Q?o9qji9j+pvgk/SLaZjU4KJfAeVY5PBHy/YQkY5iE0OxbuqOIUxOJmYRItx?=
 =?iso-8859-1?Q?2+FVkIMGyOm6wZcMjUQuCPj3ri4Cwm9mQC9i0Hs1Lw0ESu0duSn98/BE3B?=
 =?iso-8859-1?Q?GM2wK2uXFN2v3Htyz1yq/mLYucoptpUw1N3ZPpeMWFx3+ZD8J/kQN3zQ?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6512.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd59bfe9-388f-41fc-2082-08dc9a5dc637
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 06:11:12.7314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9dZSJUL1q7wGn+ALUY5wBsXEyDGzSi8NHhZjJV+51mXdAaQ8mqoIUb3KhifC0hHHuxzikKsCx8U54Rpxc5zCNuLg/JT3/3L2QMwPED/Kd+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5358
X-Proofpoint-ORIG-GUID: a8j-73V-brwEok7JdzyTRu5BKc5Ozcp_
X-Proofpoint-GUID: a8j-73V-brwEok7JdzyTRu5BKc5Ozcp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_02,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020044



> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Monday, July 1, 2024 7:57 PM
> To: Hennerich, Michael <Michael.Hennerich@analog.com>; Agarwal, Utsav
> <Utsav.Agarwal@analog.com>; Nuno S=E1 <noname.nuno@gmail.com>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>; Uwe Kleine-K=F6ni=
g
> <u.kleine-koenig@pengutronix.de>; linux-input@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] iInput: adp5588-keys - use guard notation when acquiring
> mutexes
>=20
>=20
> This makes the code more compact and error handling more robust.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>=20
> Sending this out because Utsav is working on the driver so he can rebase =
the
> work on top of this.
>=20
>  drivers/input/keyboard/adp5588-keys.c | 49 ++++++++++-----------------
>  1 file changed, 17 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adp5588-keys.c
> b/drivers/input/keyboard/adp5588-keys.c
> index 1b0279393df4..09bcfc6b9408 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -221,15 +221,13 @@ static int adp5588_gpio_get_value(struct gpio_chip
> *chip, unsigned int off)
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
>  	int val;
>=20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
>=20
>  	if (kpad->dir[bank] & bit)
>  		val =3D kpad->dat_out[bank];
>  	else
>  		val =3D adp5588_read(kpad->client, GPIO_DAT_STAT1 + bank);
>=20
> -	mutex_unlock(&kpad->gpio_lock);
> -
>  	return !!(val & bit);
>  }
>=20
> @@ -240,7 +238,7 @@ static void adp5588_gpio_set_value(struct gpio_chip
> *chip,
>  	unsigned int bank =3D ADP5588_BANK(kpad->gpiomap[off]);
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
>=20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
>=20
>  	if (val)
>  		kpad->dat_out[bank] |=3D bit;
> @@ -248,8 +246,6 @@ static void adp5588_gpio_set_value(struct gpio_chip
> *chip,
>  		kpad->dat_out[bank] &=3D ~bit;
>=20
>  	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad-
> >dat_out[bank]);
> -
> -	mutex_unlock(&kpad->gpio_lock);
>  }
>=20
>  static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int=
 off,
> @@ -259,7 +255,6 @@ static int adp5588_gpio_set_config(struct gpio_chip
> *chip,  unsigned int off,
>  	unsigned int bank =3D ADP5588_BANK(kpad->gpiomap[off]);
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
>  	bool pull_disable;
> -	int ret;
>=20
>  	switch (pinconf_to_config_param(config)) {
>  	case PIN_CONFIG_BIAS_PULL_UP:
> @@ -272,19 +267,15 @@ static int adp5588_gpio_set_config(struct gpio_chip
> *chip,  unsigned int off,
>  		return -ENOTSUPP;
>  	}
>=20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
>=20
>  	if (pull_disable)
>  		kpad->pull_dis[bank] |=3D bit;
>  	else
>  		kpad->pull_dis[bank] &=3D bit;
>=20
> -	ret =3D adp5588_write(kpad->client, GPIO_PULL1 + bank,
> -			    kpad->pull_dis[bank]);
> -
> -	mutex_unlock(&kpad->gpio_lock);
> -
> -	return ret;
> +	return adp5588_write(kpad->client, GPIO_PULL1 + bank,
> +			     kpad->pull_dis[bank]);
>  }
>=20
>  static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned=
 int
> off) @@ -292,16 +283,11 @@ static int adp5588_gpio_direction_input(struct
> gpio_chip *chip, unsigned int off
>  	struct adp5588_kpad *kpad =3D gpiochip_get_data(chip);
>  	unsigned int bank =3D ADP5588_BANK(kpad->gpiomap[off]);
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
> -	int ret;
>=20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
>=20
>  	kpad->dir[bank] &=3D ~bit;
> -	ret =3D adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
> -
> -	mutex_unlock(&kpad->gpio_lock);
> -
> -	return ret;
> +	return adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad-
> >dir[bank]);
>  }
>=20
>  static int adp5588_gpio_direction_output(struct gpio_chip *chip, @@ -310=
,9
> +296,9 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip=
,
>  	struct adp5588_kpad *kpad =3D gpiochip_get_data(chip);
>  	unsigned int bank =3D ADP5588_BANK(kpad->gpiomap[off]);
>  	unsigned int bit =3D ADP5588_BIT(kpad->gpiomap[off]);
> -	int ret;
> +	int error;
>=20
> -	mutex_lock(&kpad->gpio_lock);
> +	guard(mutex)(&kpad->gpio_lock);
>=20
>  	kpad->dir[bank] |=3D bit;
>=20
> @@ -321,17 +307,16 @@ static int adp5588_gpio_direction_output(struct
> gpio_chip *chip,
>  	else
>  		kpad->dat_out[bank] &=3D ~bit;
>=20
> -	ret =3D adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
> -			    kpad->dat_out[bank]);
> -	if (ret)
> -		goto out_unlock;
> -
> -	ret =3D adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
> +	error =3D adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
> +			      kpad->dat_out[bank]);
> +	if (error)
> +		return error;
>=20
> -out_unlock:
> -	mutex_unlock(&kpad->gpio_lock);
> +	error =3D adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad-
> >dir[bank]);
> +	if (error)
> +		return error;
>=20
> -	return ret;
> +	return 0;
>  }
>=20
>  static int adp5588_build_gpiomap(struct adp5588_kpad *kpad)
> --
> 2.45.2.803.g4e1b14247a-goog
>=20
>=20
> --
> Dmitry

