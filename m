Return-Path: <linux-input+bounces-4306-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1B4903727
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 10:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 547B3B28678
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 08:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A14F1DFE8;
	Tue, 11 Jun 2024 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZVem9Jal"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22377E772;
	Tue, 11 Jun 2024 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095508; cv=fail; b=pNQ5fWYh79z+EImQ5cHs3jmSDMJXLY5KKYS3k9sL0LFzypR3+At1pWUZt/4LYcnS+LpmqfaGLseEZZMrQsYT96Fco4KOeDj2FE1kSut2aJyH4SmlO3u9eJWzys7y6GYF3T+1wg01L4HDBQl7opp2B38N3zhB0gnpCx/Djagtp3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095508; c=relaxed/simple;
	bh=HYk21XGnHJiB7HouCNixOE9F1lt0U/KJX+3nKakK4Eg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QIvYMiQwt73bnjQ4+djRKeFcbA0ICOqlBAjrRWyc7p0A8HiRiBaJ1tvcoQw43z457oNJ14QmDfn+mH3hvT3zaWNy8GW+43NyRz62YC/OmGSs6leng8wIT8wUehSs3UM8aZCDmlt02Jz7oPSbT7Ni/g2vB2CRL+oC2R/9kDYZn2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZVem9Jal; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B7Ju9b028017;
	Tue, 11 Jun 2024 04:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=x8/rQ
	SuAMTEA+UgbrSghGJGK0DzKe+UkwcLKAy6+vvU=; b=ZVem9JalOX2cbqgcPoyEr
	VNhREPk2XyzlXNiBICyCs5YEyqrV+wGRo6u+rPKMaZDm/7b6/5kKyCAyHga4Ojnl
	v0KJty5SR1MlfVTO9Ef4+KcurnA9JJiUZM3GAO5ixFybxzBzpFLCVHvIyJgfL6f5
	PDf9pa+2C3qAGiBPITgAiKXyH+1niO3+pXa0Lk3f0cz0c5Ip61m5hHF0dSoJGqqJ
	BnbqNZ6+4a2762G5rsl8FEGe2KVNgIuMat5wi5OvIsopVSviiClmQ9JnezdBJ1gU
	mJlfmBzvLFynrzR/tNEOXXf0vII1vcU8fEdVzsGsxr9mUVXP6RXxCQ20PYVIBtdN
	g==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3ypdu894wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:45:04 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsUcwajXpmN/ZRoLPKGwWqxEUrYA0q7OpOwZg3sDTWKiK/q51FMD5rhMebGMOXsiL3zeER2WuI0spsFmYLXm8kUeiZKICZunB75kNi4AuKSpj6wrLXAaTBREpCImhixLl+o3nJ195gwp+LXkmidQBDbaImvSsWGAeyOwRIaLvnO4t7MBnEl36ziU7q284mtOzHstSQJ3Mbn8O0nr8MmJgpBSuRKplDTIyh5KR7aW4EyHRR8j9/HyHQCXqd8cgvz8ZvWx5N9iu1NSFjIPqt9DoW7u343ousiZETcFKWvhSUWA3fHUo22SMVrAfcb3jG8fY6OyYG6MtlFUZUc0JNaM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8/rQSuAMTEA+UgbrSghGJGK0DzKe+UkwcLKAy6+vvU=;
 b=bL2uGH5md8uSKczSl6C1lwtcXhtDfg+X7+tP62gQfN5suLDryQ/ETwngqwub8fYTuUFt9SRb6Cv5vGtSmwt0qzkUMiFiFUuP+r+Dpso9hx9lNSHfQPbI4WrsE7b9XzkMeuY6F3ROHnp8NS4AYv2oS5/eOFGnZDW/LI3UmAs26kduQ2vDuAmsICY6W7Uu/HZy90Vbrlkn1G35+CdQoM0Veqf6Q1ix9dZZRPX7+4exdPME4LLbswjKh73piyyNr7psxfxaXFGVB59/vgIRnN+UjuOp0AifpwIqsU4b/x470YQmoC8cm7Es2PoG/nvHFccccIgwYiQL83/uOi2u03h4jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5)
 by PH7PR03MB7196.namprd03.prod.outlook.com (2603:10b6:510:247::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 08:45:02 +0000
Received: from PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28]) by PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28%5]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 08:45:02 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "Sa, Nuno" <Nuno.Sa@analog.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/4] Input: adxl34x - use device core to create
 driver-specific device attributes
Thread-Topic: [PATCH v2 1/4] Input: adxl34x - use device core to create
 driver-specific device attributes
Thread-Index: AQHau1VHoUP6sdn6nk20zqnTQKtPUrHCQI2A
Date: Tue, 11 Jun 2024 08:45:02 +0000
Message-ID: 
 <PH0PR03MB65124C79F46C7300DA8074088EC72@PH0PR03MB6512.namprd03.prod.outlook.com>
References: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1lYzRiZjhlYi0yN2NlLTExZWYtYjhlNi1iY2Yx?=
 =?us-ascii?Q?NzFjNDc2MTlcYW1lLXRlc3RcZWM0YmY4ZWQtMjdjZS0xMWVmLWI4ZTYtYmNm?=
 =?us-ascii?Q?MTcxYzQ3NjE5Ym9keS50eHQiIHN6PSI4MzkwIiB0PSIxMzM2MjU2OTExNjMw?=
 =?us-ascii?Q?ODAyNzEiIGg9IjRRSmQxWDhKUjlBV1ZHV1RMOVpSbzhkZEJ2cz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QlBOcVN1Mjd2YUFhcEZ6VzhybnJUT3FrWE5ieXVldE00REFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBM0xoU2ZnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6512:EE_|PH7PR03MB7196:EE_
x-ms-office365-filtering-correlation-id: 68fd24ca-5097-4822-2426-08dc89f2c900
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?pwgRzl3kGxIbOOt28XnuojZ8jsSlj0HxTWwtCUi9kYVwZ8eh5pzRNLURHsIu?=
 =?us-ascii?Q?v9bT8mN2wjg5WN0q5vqjJBKOzNYxC8tGOR6pJ9ztewPXcCoiX+QiSeyu5u1t?=
 =?us-ascii?Q?C2NGOuEezjLAKPnHcGjNXV/av8JiOzbbncn1NvT2e8DdZ/p1ReGydvc13UZy?=
 =?us-ascii?Q?lip9D4dF6zKDZhCioBWeOyPmLswASKcekIcJNbC5SQozOBVMWoxahwMe0wU4?=
 =?us-ascii?Q?9OPyVFb/lFf8rK6IwD0eugtm2G2OC/Quc/PjxHhEmb/nQSyp+1ay5Ty2pf6I?=
 =?us-ascii?Q?OaVzSYokR8kck7dK5NVyPEsmMEn2jZU/p4gkgzbCzx8XGzNhDDOyTZQc6e7M?=
 =?us-ascii?Q?zrYCxquMUTIhE3BIVQm0dGq00SDetSH+XI5YjjAGNXK4NKGSZTQ3WPJhHe8b?=
 =?us-ascii?Q?0hYVcDg6tWctCs70HL1F1HEikgU6zr4dbwoJuttgbENo7bETynbkDYv+im8Q?=
 =?us-ascii?Q?hLPeXoODq/H70NbGqgsUjgdVZ/IRfcZtcTBI1nE8Hoq8tHBh3JW87L2QuxpP?=
 =?us-ascii?Q?hS0ib1EgRPJV4OQMZ4/EseoIBcjwcBxK+shVMURH5bmEe69dN6OI0tKtYr4L?=
 =?us-ascii?Q?Qca0+oabTMgaQH60Q56N2xz6rjSiwc60DwvMqPk8BM4fLuhtDKmZ8soKqxGm?=
 =?us-ascii?Q?K8Kvve6nZQAavAKMlp67DvEx6VTxKLkuDLsGbC+vTq1NoyzUNb9plZ9+CCWy?=
 =?us-ascii?Q?3CkpbUbjiALRsWrSg0k1GB4yKpfWC0DXVkKTlM2yZylhGRwCfP0lwSjMgSMA?=
 =?us-ascii?Q?J3sTN7OU6bRsITzT0ZbaJdADnY0fYTjsIPwcqDbKt2SbvXrMZ0+Gvy/E1A+t?=
 =?us-ascii?Q?HzaAuRhRFboX+qVSG53NaQQcmc7GGAxCE1b+3BMU0wyiCD6GSRQocQa06vmI?=
 =?us-ascii?Q?AVJlzB5LVjIDsCpWc+Iq8xt/FltxTBgcunK385nVgUhKKIiogs73w45W5lbe?=
 =?us-ascii?Q?5ug9nG7j9/EEHFeHDdncO15FobdmF1lUS/VhRK/x5oVy7L1CJiiYDoTxMDci?=
 =?us-ascii?Q?LWfLjw02vSWQ9ZfU6mG4FowNpd73SUjUCRHgLiE10TQf3M6EYEa7fRLGhBw8?=
 =?us-ascii?Q?KgjDrK7xyTR1Zu5cDOb7NDJfyefkVhrDQ5iDdIuQCm9pxZ6GazjDoXF4QMSc?=
 =?us-ascii?Q?q65TVyHwe4VBINSz0e/lB6vz4iQZd7rP2kSjaGXZD6uiERfxyYfR57Lhvnw8?=
 =?us-ascii?Q?YgZ8dm6A0diLVAqa3klLSpign4BpM2n624E8MlBCLZqIxSf0pTnjrk5KJ5OO?=
 =?us-ascii?Q?fY+t0wA1fhYYGLKs2UwGohA7jvxpyGCtOrki6vC/LM8r46BIgJhxw4ib0wu+?=
 =?us-ascii?Q?wCAcE1x0ledDDtJIYHUx1sTDX7XEueKcHLuo/clw3jljpZ50XDusMUAozsuQ?=
 =?us-ascii?Q?k6w/N4Y=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6512.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?31IAuuKeJZ0Qv7MOhWVXY/eEGs6R3KpY5INngvsHh/VhPgMnNDj0m2V6o5MO?=
 =?us-ascii?Q?U40x7QK1+aBnOpQrYGuaDlICjn9vvZy4jyh6OavEJDlD/k3WSPfo95tpALIf?=
 =?us-ascii?Q?6p49WRRQaBmEfkSTE2VSUDeRgmmIEFqKCeUfXzeEL3JMq8jGwAXwhg1adb6M?=
 =?us-ascii?Q?0fa4rDFjesFSprw5/TqmslXBxcrIaMBnHqrq8kg2d2oMpWBHL8y8kGBbgDJm?=
 =?us-ascii?Q?JP4OeCSLgCGvlHsTMyFFCNXK+tnlrSQ/nmsVStVQoBWgaYLxQFJvNbuXcbFk?=
 =?us-ascii?Q?pj/OeA7pEsOjWbC2Jmj7pxvbRGHz75KFnq4qwPkTFdf017Y3NYrUGxx+dbee?=
 =?us-ascii?Q?EucxKrV9Y0+wGKIvbW4jbFn3NZU+woUEFDtFRbjXuDwoTUQzjqNagYsDbHSm?=
 =?us-ascii?Q?d7/aEfvYtDzGIOZVfzXCXeRzEwl68s60JyALFU4jSO1JPdMevggkv6I+mWj/?=
 =?us-ascii?Q?V0uMi4iUhmNHEq1goQV4VvnxzB6764DKKJUILApC3e22UG6U0XWkfTC50rY+?=
 =?us-ascii?Q?6YYvOxkG18qCSEIxXx4W31gpBA4mmrJeZmBwl9mJj24nz/cdsPVAtdZ0sZK1?=
 =?us-ascii?Q?6OBpJtDB1+7PbwcuYJ2osnhO0j4PVFqroGe52SX10w5ZlYOmTZXjNjfcEyf7?=
 =?us-ascii?Q?fmqKwIsp7GrYL88UrBbIeSolzCWID3MuibDmWavk5seRPoDK2AsE1H19qg1U?=
 =?us-ascii?Q?hIuvfYH3+WbVUmfwEgnooqzFLGMQ/oB+3Q/7MLPrL5daV5TXKZUfxBvaXPVa?=
 =?us-ascii?Q?1BXjNy/1n6Kds3NhENwMxE5GJqXO88h1DLUOD2PBnEAV28elf2R7R5H1kYDo?=
 =?us-ascii?Q?QKrdg2ygpJVyM7sZJEBE+FQuATeNd+qWjc2HuUGpXQZ9csN4MRcP/Heto7jm?=
 =?us-ascii?Q?4r3OA23YEJaKpHghzspMqpK1km3W6prb2OK28TMDvXo1a0Po6PK9PraL7TnR?=
 =?us-ascii?Q?GYLCbzRgj+hUVVMNlMJ7jxTp01TUDH4klENDKB6eibWsSYbqsDJt6kWVoEO0?=
 =?us-ascii?Q?cOfZ0DxqsPiPd5khjGU15lHQmX0g4I+VRmAkaWgnyFw89LK5mzoCDi4JfHyL?=
 =?us-ascii?Q?IB90eJjAzL3ohi11TKrUOexjnptnxPkMaQ/KGE0aG0aMq9wdL0XKYL3YCKIG?=
 =?us-ascii?Q?TEnyQgMkIbMbIDlXO7270erY3a9xmJ9vsilm4P78WCjvBTPIQLV4AwvwnXFk?=
 =?us-ascii?Q?MYQ2TYxgaVXjUJlvwDttCaPTDTYDuyipKclrx5v1NmpUc/YbQXykO8sv32kG?=
 =?us-ascii?Q?rOPWmHemq5GEgQEY76x/4tQctkbgImD1yJgKUYUI0AGhsb88v4TYlM9vUUmd?=
 =?us-ascii?Q?cZko+Pg3TY5Jj7LJm6CKk/5fRMqsdMS7eXDJPEW7mPoCG5yqFABBlthV3FCR?=
 =?us-ascii?Q?OCGKkG9qXDbR3CVMo5TTcIFWGSRJTy+74JDSxjSyeAICB6skjydexM2YBcX1?=
 =?us-ascii?Q?VkG5ucg2+IfX/ru7mM/8fOxVIHly2Wj5tjnWl4uH3MR42x3V0WEF6w1vJdjs?=
 =?us-ascii?Q?vqLFEjJI8QPsUd5+F1sNsObigr1qGyAB2akq8lXXkl/hNYBDhYRbcEQHF2E2?=
 =?us-ascii?Q?ePk4ju1LOQ3fUOhZ7KlRzVQeN73egio4PtJCa/fAnNmxJGrDxsYbJxYVCABi?=
 =?us-ascii?Q?hQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fd24ca-5097-4822-2426-08dc89f2c900
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 08:45:02.6627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lP3lF0IlgunxPFwsimR+ROAxjXqeeH3Cp37dY01aI9FHp9zMjpXpKK0TVl/hb18SzEg3Tsi6OJ/uC2mraNGbqnFEGtr/zrofoMi5GoLeRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7196
X-Proofpoint-GUID: zhvLmmeZuzXE8bl00Dgd6hVoD4w3Ll4k
X-Proofpoint-ORIG-GUID: zhvLmmeZuzXE8bl00Dgd6hVoD4w3Ll4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_04,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110065



> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Monday, June 10, 2024 6:43 PM
> To: linux-input@vger.kernel.org; Sa, Nuno <Nuno.Sa@analog.com>
> Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v2 1/4] Input: adxl34x - use device core to create driver=
-
> specific device attributes
>=20
>=20
> Instead of creating driver-specific device attributes with
> sysfs_create_group() have device core do this by setting up dev_groups
> pointer in the driver structure.
>=20
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>=20
> v2: added Nono's ACK
>=20
>  drivers/input/misc/adxl34x-i2c.c |  1 +  drivers/input/misc/adxl34x-spi.=
c |  1
> +
>  drivers/input/misc/adxl34x.c     | 15 +++++++--------
>  drivers/input/misc/adxl34x.h     |  1 +
>  4 files changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34=
x-
> i2c.c
> index d4014e367c77..7531c7b2d657 100644
> --- a/drivers/input/misc/adxl34x-i2c.c
> +++ b/drivers/input/misc/adxl34x-i2c.c
> @@ -132,6 +132,7 @@ MODULE_DEVICE_TABLE(of, adxl34x_of_id);  static
> struct i2c_driver adxl34x_driver =3D {
>  	.driver =3D {
>  		.name =3D "adxl34x",
> +		.dev_groups =3D adxl34x_groups,
>  		.pm =3D pm_sleep_ptr(&adxl34x_pm),
>  		.of_match_table =3D adxl34x_of_id,
>  	},
> diff --git a/drivers/input/misc/adxl34x-spi.c b/drivers/input/misc/adxl34=
x-
> spi.c
> index f1094a8ccdd5..2befcc4df0be 100644
> --- a/drivers/input/misc/adxl34x-spi.c
> +++ b/drivers/input/misc/adxl34x-spi.c
> @@ -97,6 +97,7 @@ static void adxl34x_spi_remove(struct spi_device *spi)
> static struct spi_driver adxl34x_driver =3D {
>  	.driver =3D {
>  		.name =3D "adxl34x",
> +		.dev_groups =3D adxl34x_groups,
>  		.pm =3D pm_sleep_ptr(&adxl34x_pm),
>  	},
>  	.probe   =3D adxl34x_spi_probe,
> diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c =
index
> a3f45e0ee0c7..fbe5a56c19d1 100644
> --- a/drivers/input/misc/adxl34x.c
> +++ b/drivers/input/misc/adxl34x.c
> @@ -664,6 +664,12 @@ static const struct attribute_group
> adxl34x_attr_group =3D {
>  	.attrs =3D adxl34x_attributes,
>  };
>=20
> +const struct attribute_group *adxl34x_groups[] =3D {
> +	&adxl34x_attr_group,
> +	NULL
> +};
> +EXPORT_SYMBOL_GPL(adxl34x_groups);
> +
>  static int adxl34x_input_open(struct input_dev *input)  {
>  	struct adxl34x *ac =3D input_get_drvdata(input); @@ -823,13 +829,9
> @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
>  		goto err_free_mem;
>  	}
>=20
> -	err =3D sysfs_create_group(&dev->kobj, &adxl34x_attr_group);
> -	if (err)
> -		goto err_free_irq;
> -
>  	err =3D input_register_device(input_dev);
>  	if (err)
> -		goto err_remove_attr;
> +		goto err_free_irq;
>=20
>  	AC_WRITE(ac, OFSX, pdata->x_axis_offset);
>  	ac->hwcal.x =3D pdata->x_axis_offset;
> @@ -889,8 +891,6 @@ struct adxl34x *adxl34x_probe(struct device *dev, int
> irq,
>=20
>  	return ac;
>=20
> - err_remove_attr:
> -	sysfs_remove_group(&dev->kobj, &adxl34x_attr_group);
>   err_free_irq:
>  	free_irq(ac->irq, ac);
>   err_free_mem:
> @@ -903,7 +903,6 @@ EXPORT_SYMBOL_GPL(adxl34x_probe);
>=20
>  void adxl34x_remove(struct adxl34x *ac)  {
> -	sysfs_remove_group(&ac->dev->kobj, &adxl34x_attr_group);
>  	free_irq(ac->irq, ac);
>  	input_unregister_device(ac->input);
>  	dev_dbg(ac->dev, "unregistered accelerometer\n"); diff --git
> a/drivers/input/misc/adxl34x.h b/drivers/input/misc/adxl34x.h index
> f9272a2e7a96..67e0ddc5c3eb 100644
> --- a/drivers/input/misc/adxl34x.h
> +++ b/drivers/input/misc/adxl34x.h
> @@ -26,5 +26,6 @@ struct adxl34x *adxl34x_probe(struct device *dev, int
> irq,  void adxl34x_remove(struct adxl34x *ac);
>=20
>  extern const struct dev_pm_ops adxl34x_pm;
> +extern const struct attribute_group *adxl34x_groups[];
>=20
>  #endif
> --
> 2.45.2.505.gda0bf45e8d-goog


