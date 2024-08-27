Return-Path: <linux-input+bounces-5898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B196073C
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 12:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89280B21233
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 10:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EDE1A0B0C;
	Tue, 27 Aug 2024 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="qnUX9yP7"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A8A4C92;
	Tue, 27 Aug 2024 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753734; cv=fail; b=NyQ0Vl+mN3vruDs+dh3BCU8o0brBdmyoApj5s85gaR0XsyP5lkEF4QKYmO/Red+347tNqCVT9vxtc0sdCgW2Dn0jBorUgjbr9wY38ol/RZF1O8pAOEz1lkVJhwacoehP2qCtpFHXhV4fMvOKqRs3IUiauHn7GYCINyERrNabU4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753734; c=relaxed/simple;
	bh=50xwp+Hgcu7D7nKktYmZgItYU5tSIme91xwgE9VNhVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=stc8lTGM9cwycnM/l1J0tULuHLZ5r4wTooBWGkyPNjA4Prw8T5578hGS2F6oEL0uO1Apco+7ISK49Ym9+ylkkE5i6VQgtM4q+NM7ubFAjhjVbfXKe2qlmAb9M21e8P+7Otl+67MvFcf9ax20YGS48BDQ7py+QlAZObv/Cb/WSTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qnUX9yP7; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7irCO021421;
	Tue, 27 Aug 2024 06:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Jft/Z
	UWs2peIja1KgesopRrnqHhUXAWIyrJ0m4FJl4M=; b=qnUX9yP7uDoZ3rhjLWNMF
	D56JbHErEJV12Zv3qKNIbnNdYLWw0Pt2bT617BKftQnyVSKSvVIiTpM+B7cdvYDi
	XJ3m+JLJT82k9eOtnE32nxZ/EHtWt/lWCv6/h4vOFOcTvkq07CegllR67kY9xDE8
	6OkHDS4/IrYBuT+22sbsAi+1SLL3D/Ir6ctUil+NufN+7NsepJhJgu2w9LdjDVZV
	zXS6Le9KwRSeCvYg4ofdC9QbEKoG4TG6wKfjKhFemFSJUlHEWFkQNNYMQFWb4Cdz
	TyUpgvsG2X2qWj9h7aXP0xgZjSFPSBFr1kOjW1C1nXOmXSYUmk6XenO5N2YwA7/X
	w==
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010006.outbound.protection.outlook.com [40.93.6.6])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 419apb0ep7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 06:03:28 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilt8PjQusIuKv8gToP4gl3bo8G+nWxGFl4z2bZCe0KcEQqpMAs4ij2AF7Q3NQuGZERZX9pmxZ0QUt0gF4WWNaCRq0CzVop38Ih3qw3MU3EKx++pgKkeLt5do2JgtrpuksTYwTBjuuyaKblUBOdpVWYguqItwMDrfk96mLHI8Hs01DfTnkMqPaYZtBvaEEldyWomnFTK7wU6204DtNsDDrlPlHGDPgQrpvzQnDZx5u3apRVpGJGBcXY2p2jsjs6ND6qxbrvzvA1gLom9RvlAImmLYf2lUEmfoobnd137dDCEtYSRnXlnCQywG3KhlceJFpllNKClspv/dpTHsw5K8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jft/ZUWs2peIja1KgesopRrnqHhUXAWIyrJ0m4FJl4M=;
 b=kdrHN5bzbqzpRUY1Qmsg2qhCndNUcKF1hWsTg5byrx67+MJ2381IgW4+dEFisNwUA63LRFTCPvE1K98tDll3airZ6qlBhehEzm1fd1ZBtYm9vODjny5DhrSfeyWcQRJ+tZcV7WUtoTT6V7g3E4Ad3/U+UE2LWl/7o4HswzqzR7xeDMhq1zIgjzFaFetd/AUO56ciPo6nCjALNBmtpa8gNIG4Nusab6oj2B9H6xFDhMMfZ7eKeEXJKE7Vq/uZRtSd6enU++i91qACSTGRIVC3J0lPmwlqiSs6rgTIERj8vAw463rD0uK094izFKJTAsH81YAaTh0hgeAASUabIvxxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by DS7PR03MB5607.namprd03.prod.outlook.com (2603:10b6:5:2ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 10:03:24 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7828.031; Tue, 27 Aug 2024
 10:03:24 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Artamonovs,
 Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>
Subject: RE: [PATCH RESEND v11 2/3] Input: adp5588-keys - add support for pure
 gpio
Thread-Topic: [PATCH RESEND v11 2/3] Input: adp5588-keys - add support for
 pure gpio
Thread-Index: AQHa99yGlLOk1X9mPU6GXSnAVAkfwbI56ZqAgAD0oDA=
Date: Tue, 27 Aug 2024 10:03:24 +0000
Message-ID:
 <SJ0PR03MB6343189410510459562996919B942@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240826-adp5588_gpio_support-v11-0-3e5ac2bd31b7@analog.com>
 <20240826-adp5588_gpio_support-v11-2-3e5ac2bd31b7@analog.com>
 <ZszU5xzd6S8JKd5E@google.com>
In-Reply-To: <ZszU5xzd6S8JKd5E@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?us-ascii?Q?PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXHVh?=
 =?us-ascii?Q?Z2Fyd2EyXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVl?=
 =?us-ascii?Q?ZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOTc0NWY4NDQtNjQ1Yi0xMWVmLTg0?=
 =?us-ascii?Q?ZmUtNjQ0OTdkY2U1Zjg1XGFtZS10ZXN0XDk3NDVmODQ2LTY0NWItMTFlZi04?=
 =?us-ascii?Q?NGZlLTY0NDk3ZGNlNWY4NWJvZHkudHh0IiBzej0iMTM2MzQiIHQ9IjEzMzY5?=
 =?us-ascii?Q?MjI2NjAyNDgzNjQwOSIgaD0iVVJIb2p3ZVZIOThlbmMyOHNoS2JGQjdJNzM4?=
 =?us-ascii?Q?PSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNn?=
 =?us-ascii?Q?VUFBRGdEQUFBNW5hQlphUGphQVRJK3RQSDhnTE5xTWo2MDhmeUFzMm9EQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUhBQUFBRGFBUUFBU2dJQUFPNEFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUVBQVFBQkFBQUEzTGhTZmdBQUFBQUFBQUFBQUFBQUFKNEFB?=
 =?us-ascii?Q?QUJoQUdRQWFRQmZBSE1BWlFCakFIVUFjZ0JsQUY4QWNBQnlBRzhBYWdCbEFH?=
 =?us-ascii?Q?TUFkQUJ6QUY4QVpnQmhBR3dBY3dCbEFGOEFaZ0J2QUhNQWFRQjBBR2tBZGdC?=
 =?us-ascii?Q?bEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHRUFaQUJwQUY4QWN3?=
 =?us-ascii?Q?QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdr?=
 =?us-ascii?Q?QVpRQnlBREVBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFB?=
 =?us-ascii?Q?QUFBQUFDQUFBQUFBQ2VBQUFBWVFCa0FHa0FYd0J6QUdVQVl3QjFBSElBWlFC?=
 =?us-ascii?Q?ZkFIQUFjZ0J2QUdvQVpRQmpBSFFBY3dCZkFIUUFhUUJsQUhJQU1nQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQU80?=
 =?us-ascii?Q?QUFBQUFBQUFBQ0FBQUFBQUFBQUFJQUFBQUFBQUFBQWdBQUFBQUFBQUF6Z0FB?=
 =?us-ascii?Q?QUFNQUFBQk9BQUFBQUFBQUFHRUFaQUJwQUY4?=
x-dg-refone:
 QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0JtQUdFQWJBQnpBR1VBWHdCbUFHOEFjd0JwQUhRQWFRQjJBR1VBQUFBOEFBQUFBQUFBQUdFQVpBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFERUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURJQUFBQT0iLz48L21ldGE+
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|DS7PR03MB5607:EE_
x-ms-office365-filtering-correlation-id: f13713e2-2011-4783-0747-08dcc67f7d4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Mva7EuUvQMFhK6Y672QdBNtxB3Yav1/1os+nGGQvBsUNoM6Z1f+513FpVdC0?=
 =?us-ascii?Q?mexonNPCTBnmdVv7KMcxBHEEHW6+YCl0iT7nvr3aVwalV2lyXr8lsXOWQN5k?=
 =?us-ascii?Q?aYYapiRgSTNnDtU75r6r1xkaExzz90Yfx0B8zwZjh3Goh4gRDIhVZq/p1Gkb?=
 =?us-ascii?Q?G3emX5y/w5ztm3NZIL7ytm+A2lDKLcpZuqUw24hKUlytJ+zWsUn2eG2X1AkG?=
 =?us-ascii?Q?3LDIgoIv+HTV7WafevBWEeGp/ue8fYwTnuL6Jgp1QtJdTITP8ngmv8qAZL5M?=
 =?us-ascii?Q?2HRk6HijcdDVvLW+915CbLuVkXXlZVpIUQbZLWkQG8hIqNN+waiff9VwL5wp?=
 =?us-ascii?Q?FRSuF3XFa39O+cdrv9pWcoJweKTIae0Le3a76T0VFMx67ly5Bv5VzSKTrRWB?=
 =?us-ascii?Q?P0b7BuEtpOS9Z8BxSeRzsw2v1jRMzFzZ/WJsBH2o/ncmEKMa5+4V5urbXWuZ?=
 =?us-ascii?Q?+3lDoDJp/DBmTg3VLRxphUzZz8AFewD5HksU63X3fESOF8qiwnGXoBSps57t?=
 =?us-ascii?Q?RaigsOoaOUvQIajomb/72v2Z9vG9Ph/cxJVvf1Wkskxdu5H0NmMxz5fMt0JK?=
 =?us-ascii?Q?H4TINYXLzkbpp+JKRz4jgxiNIt1cA3vDSdydV3a2ORF1DdQDUmcFN5L5jl+l?=
 =?us-ascii?Q?LsKVbY3IV9pCSBBsV2pnZOtsyhkpIYX0MDHXLbGqbFe5SUqAu+OsNbvCe0Do?=
 =?us-ascii?Q?HTPNOYaymria6zPL2VVbk8O1Qg6mKfRYUCYCG7JM+EtIkXckCSt3vS9w/qPU?=
 =?us-ascii?Q?AYfNCCpvtFCEeTAD2SUVuaA6HCOl1Vq5L8OJLzTIAsRDUMhbDaIIz2937oLp?=
 =?us-ascii?Q?avshLqAIuS65NjL4ZUVwy7+IC+WIZxhzPQg8S5gj/4QLAX4UJssY3lKoS7vm?=
 =?us-ascii?Q?uweoR4tTpIpmW4DTxpiYLDdHUphnxbKTsokUTqhZgEs3If5Y95uLk+s/X0pc?=
 =?us-ascii?Q?yUYW9HLSryaVkG/j+W9mXIt4nVFs2ldHV5DIsrDH1sUrexToNqwYOLnMhXJs?=
 =?us-ascii?Q?kDk4SNjap9q4bvAX0sRZTgwCKMpIzrYKdYDTjBZH4B2mKBfBvRj+JkRi5/+z?=
 =?us-ascii?Q?AUZdA6C9r4yMhMuoJjcGkEpAAt0StP3gOCMHwk3n3+KCnht4hpMW99lSk6HY?=
 =?us-ascii?Q?ZSv/dkQWyI339rVlA1vPesfD0bNiThtaNCZijXY8eLCgoLhMS9ArE9EzKP3c?=
 =?us-ascii?Q?KFwkrJSVK7qZdpvp+2qXU8fb/qb0KZtHnbj3W7W06JeW8Ul9pqNvs+Krkxzf?=
 =?us-ascii?Q?pGW7VM5A0v9waDB8oA6vQt5nStmNESoxbAWjduBNm3bE+0uyiEiMGYGLs7Lp?=
 =?us-ascii?Q?LFlFkox5HFIIjX4BAbnF8JGGRTGCznBWXPOHAaZ7wuFviSOW7APkr0tCeswE?=
 =?us-ascii?Q?jtRdyfVtBJaL/pVCCYtVR1YrSM2lrIWsXZlmBxJRbYUvAN3pwA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w4PIKrGPWSz9zsSLQ8KCJUvWNFfZr2tkxZvYSMq0hbWJXw7UnBvC8AjXsBgK?=
 =?us-ascii?Q?/b2lKHRABtMCmMFwzowT1QdJ2TkH/SkXEfuqrQidw5Ss3rxUxrcZBxP+QtmR?=
 =?us-ascii?Q?z505llPE53yysd4sYi+lLoFSWsr8j8rrHDVE8umBEoFM/JMrHhqUkT50e2sD?=
 =?us-ascii?Q?2z9efj5f3xLRHtlfHpu+IkEIZecLXhmjkwWPJAdHIJl0mmO9EkLMXZTRWq6v?=
 =?us-ascii?Q?GYCBcLOnhOPoSyukiFj+wU2y+CLcMyKKecyJ/gqKROmFdLBFxcwGDkdEtyS2?=
 =?us-ascii?Q?ObRcQNW3cV3mF0wRCmKLBfPjkq8irSy47v7h78c8Fv51FF1A+JywPZt0tFNz?=
 =?us-ascii?Q?bDfPLwfh6Q/DuxZSzlcz0Yra501KBLj/7ydENDxePBj+eJBgjzzDswJzmYhJ?=
 =?us-ascii?Q?EnkXft7nb35n10dqe1xLgnGTXP+aXzu7D7qmXgDxJmXxvHF38AYlhANrTpLN?=
 =?us-ascii?Q?ipYFkFQl5gTPtJmBprFo4DlBahAIhl1NJTk2wFuHyvQf2T/KZpxrxXl8Vd+4?=
 =?us-ascii?Q?lRYDxvW457TZKmoMg5V35PzlfRKn8A+zWXFMwWgUNA4gl0gEsu6QG4RKBOR9?=
 =?us-ascii?Q?0rkdeLzEyB/7aY0p/FAlhjhQuSfIwvMbUFl6A0C2ZAuoPDncUOJAJTkZHVY7?=
 =?us-ascii?Q?U9EUgTNAc3vQCgZAK5ZK0O7RpcXyyBmmMudffJ9wcLoG+LwukeCZ8h77WZiD?=
 =?us-ascii?Q?AWjOXo5U13OM+GiFpEVPYAS1vbF8l+EhcOQY7FGJMwaURgPJDddhlsiYhbA4?=
 =?us-ascii?Q?SdPzETIqycaHlvyxE+dLcDQ/uRCOsN1qGsszJJId12V3Ubgh/a4aoRb8GKBT?=
 =?us-ascii?Q?k7fjA3TUoAiBx4fMRS2QJXFA3NT7fzBYqOOCy58fHY1MTrHxFUICG/WxpWjN?=
 =?us-ascii?Q?lgQMTDJPaUDJZ6lIwW6AOMq7PK26uulu8+06NKuNkMrpIEbwaKxxBvxKmiAR?=
 =?us-ascii?Q?rr/PT47IVVmntXdEUBBKouse1g8cbAAS6DGl6PzBEtsCjTw1DiX0Ob6M5Ftv?=
 =?us-ascii?Q?f5F1cKp5ip3Q4a/8xb0LFmnPHjX1HlM36B2lkPRvusEuPg3vCXuDozYitAzB?=
 =?us-ascii?Q?2IvxMz9IzzpJ5hWxVt0CKsS3uSgf6JSYIN/9qcv/cZfxYQ+Org0TqkCz+4mX?=
 =?us-ascii?Q?ToRAn4JfD1zAfJBD7uca+R/NqRjLRQjvS9XVKRAHIi2if42dwWeFsTV3Y5tp?=
 =?us-ascii?Q?OzmN7I8m7e96ugx/UH83FWyQIuggSi7YIQaJHh6CU6r8JNhxxefwUqE+LRzB?=
 =?us-ascii?Q?SpdgIQwLldgIubAdHUVdEY2IZCpNRDMkbiyY2XlHxfF7azKAKfYib9S5UX/I?=
 =?us-ascii?Q?3TphGEgAjLELjpLVMA3ZuJj6lXrceNHyPHC8DAaeX7l64aWyU7SouWeQo641?=
 =?us-ascii?Q?PactMWanFgmLlsSCai8hS8iJSna7OXDyejqKGQNZFBBeMVBHhWBeciyOeeGc?=
 =?us-ascii?Q?69jNCwN9ZWn1Y1b47K3CB8rFc86KYVjF+RmiOZkH1xHj1iWxxJui0/zTLGY7?=
 =?us-ascii?Q?oJtLVeLZTtD35mHUEjxVG6zH4xrwGs1OIKJ20uafy4grV2gJn2SbhGBcYHca?=
 =?us-ascii?Q?yUa7V0AjT7zP7IvRuU8Ek+GDBreEB/wSgreZyvdF?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6343.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13713e2-2011-4783-0747-08dcc67f7d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 10:03:24.4816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mfnif4VFnseqblTwFy56sPXRNwQI48CqeZkaXVPJ240ErpAsQbr3WfbN6CoS5o8O0kPAtoYQfPaB6WGnF8PYBnyNYg1yPobwS5lluTVU2fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-Proofpoint-GUID: OeEBz0SjGQSbLwA7sQoI4rLohR0iOTZp
X-Proofpoint-ORIG-GUID: OeEBz0SjGQSbLwA7sQoI4rLohR0iOTZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270075

Hi Dmitry,

> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Monday, August 26, 2024 8:18 PM
> To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> Dooley <conor+dt@kernel.org>; Sa, Nuno <Nuno.Sa@analog.com>; linux-
> input@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Artamonovs, Arturs
> <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
> <Vasileios.Bimpikas@analog.com>; Gaskell, Oliver
> <Oliver.Gaskell@analog.com>
> Subject: Re: [PATCH RESEND v11 2/3] Input: adp5588-keys - add support for
> pure gpio
>=20
> [External]
>=20
> Hi Utsav,
>=20
> On Mon, Aug 26, 2024 at 06:22:02PM +0100, Utsav Agarwal via B4 Relay
> wrote:
> > From: Utsav Agarwal <utsav.agarwal@analog.com>
> >
> > Keypad specific setup is relaxed if no keypad rows/columns are specifie=
d,
> > enabling a purely gpio operation.
> >
> > Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > ---
> >  drivers/input/keyboard/adp5588-keys.c | 37
> +++++++++++++++++++++++++++++++----
> >  1 file changed, 33 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/input/keyboard/adp5588-keys.c
> b/drivers/input/keyboard/adp5588-keys.c
> > index 09bcfc6b9408..7c32f8b69a3e 100644
> > --- a/drivers/input/keyboard/adp5588-keys.c
> > +++ b/drivers/input/keyboard/adp5588-keys.c
> > @@ -188,6 +188,7 @@ struct adp5588_kpad {
> >  	u32 cols;
> >  	u32 unlock_keys[2];
> >  	int nkeys_unlock;
> > +	bool gpio_only;
> >  	unsigned short keycode[ADP5588_KEYMAPSIZE];
> >  	unsigned char gpiomap[ADP5588_MAXGPIO];
> >  	struct gpio_chip gc;
> > @@ -431,10 +432,12 @@ static int adp5588_gpio_add(struct adp5588_kpad
> *kpad)
> >  	kpad->gc.label =3D kpad->client->name;
> >  	kpad->gc.owner =3D THIS_MODULE;
> >
> > -	girq =3D &kpad->gc.irq;
> > -	gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
> > -	girq->handler =3D handle_bad_irq;
> > -	girq->threaded =3D true;
> > +	if (kpad->client->irq) {
> > +		girq =3D &kpad->gc.irq;
> > +		gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
> > +		girq->handler =3D handle_bad_irq;
> > +		girq->threaded =3D true;
> > +	}
>=20
> I think we should only set up irqchip if we have "interrupt-controller"
> property in the device tree.
>=20
> >
> >  	mutex_init(&kpad->gpio_lock);
> >
> > @@ -632,6 +635,21 @@ static int adp5588_fw_parse(struct adp5588_kpad
> *kpad)
> >  	struct i2c_client *client =3D kpad->client;
> >  	int ret, i;
> >
> > +	/*
> > +	 * Check if the device is to be operated purely in GPIO mode. To do
> > +	 * so, check that no keypad rows or columns have been specified,
> > +	 * since all GPINS should be configured as GPIO.
> > +	 */
> > +	ret =3D device_property_present(&client->dev,
> > +			"keypad,num-rows");
> > +	ret |=3D device_property_present(&client->dev,
> > +			"keypad,num-columns");
> > +	/* If purely GPIO, skip keypad setup */
> > +	if (!ret) {
> > +		kpad->gpio_only =3D true;
> > +		return 0;
> > +	}
> > +
> >  	ret =3D matrix_keypad_parse_properties(&client->dev, &kpad->rows,
> >  					     &kpad->cols);
> >  	if (ret)
> > @@ -775,6 +793,11 @@ static int adp5588_probe(struct i2c_client *client=
)
> >  	if (error)
> >  		return error;
> >
> > +	if (kpad->gpio_only && !client->irq) {
> > +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n",
> revid);
> > +		return 0;
> > +	}
>=20
> This is way too noisy. I think one message logging the revision ID
> should be enough. The rest of the data can be found from elsewhere if
> needed.
>=20
> Can you try the below on top of yours? If this works I'' squash it
> together with your change.

I have applied and tested the same on relevant hardware, it works as
intended.

> Thanks.
>
> --
> Dmitry
>=20
- Utsav
>=20
> diff --git a/drivers/input/keyboard/adp5588-keys.c
> b/drivers/input/keyboard/adp5588-keys.c
> index 7c32f8b69a3e..b5f4becf5cb6 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -432,7 +432,12 @@ static int adp5588_gpio_add(struct adp5588_kpad
> *kpad)
>  	kpad->gc.label =3D kpad->client->name;
>  	kpad->gc.owner =3D THIS_MODULE;
>=20
> -	if (kpad->client->irq) {
> +	if (device_property_present(dev, "interrupt-controller")) {
> +		if (!kpad->client->irq) {
> +			dev_err(dev, "Unable to serve as interrupt controller
> without interrupt");
> +			return -EINVAL;
> +		}
> +
>  		girq =3D &kpad->gc.irq;
>  		gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
>  		girq->handler =3D handle_bad_irq;
> @@ -640,12 +645,9 @@ static int adp5588_fw_parse(struct adp5588_kpad
> *kpad)
>  	 * so, check that no keypad rows or columns have been specified,
>  	 * since all GPINS should be configured as GPIO.
>  	 */
> -	ret =3D device_property_present(&client->dev,
> -			"keypad,num-rows");
> -	ret |=3D device_property_present(&client->dev,
> -			"keypad,num-columns");
> -	/* If purely GPIO, skip keypad setup */
> -	if (!ret) {
> +	if (!device_property_present(&client->dev, "keypad,num-rows") &&
> +	    !device_property_present(&client->dev, "keypad,num-columns"))
> {
> +		/* If purely GPIO, skip keypad setup */
>  		kpad->gpio_only =3D true;
>  		return 0;
>  	}
> @@ -793,28 +795,19 @@ static int adp5588_probe(struct i2c_client *client)
>  	if (error)
>  		return error;
>=20
> -	if (kpad->gpio_only && !client->irq) {
> -		dev_info(&client->dev, "Rev.%d, started as GPIO only\n",
> revid);
> -		return 0;
> -	}
> -
> -	error =3D devm_request_threaded_irq(&client->dev, client->irq,
> -					  adp5588_hard_irq,
> adp5588_thread_irq,
> -					  IRQF_TRIGGER_FALLING |
> IRQF_ONESHOT,
> -					  client->dev.driver->name, kpad);
> -	if (error) {
> -		dev_err(&client->dev, "failed to request irq %d: %d\n",
> -			client->irq, error);
> -		return error;
> -	}
> -
> -	if (kpad->gpio_only) {
> -		dev_info(&client->dev, "Rev.%d GPIO only, irq %d\n",
> -				revid, client->irq);
> -		return 0;
> +	if (client->irq) {
> +		error =3D devm_request_threaded_irq(&client->dev, client-
> >irq,
> +						  adp5588_hard_irq,
> adp5588_thread_irq,
> +						  IRQF_TRIGGER_FALLING |
> IRQF_ONESHOT,
> +						  client->dev.driver->name,
> kpad);
> +		if (error) {
> +			dev_err(&client->dev, "failed to request irq %d:
> %d\n",
> +				client->irq, error);
> +			return error;
> +		}
>  	}
>=20
> -	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client-
> >irq);
> +	dev_info(&client->dev, "Rev.%d controller\n", revid);
>  	return 0;
>  }
>=20

