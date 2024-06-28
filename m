Return-Path: <linux-input+bounces-4701-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED191C04F
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 16:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 887601F220AF
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 14:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975141BF307;
	Fri, 28 Jun 2024 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="si3NnoQW"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7971BE851;
	Fri, 28 Jun 2024 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583506; cv=fail; b=EwRfxBSDd5XnC9q0tyRuPmAfGXgfGTrYZC7laPkKUB/LZ6Oc5rCFf518SmCvFMhS2BUjxpB/c3Kq9FOCxR3HuSfglEEyPYrluyLMz/5RBSUR/Evb5h7nH/qT22SAGNVUnuDFEatAegUf2QVidlagrMta4WYBQa6O9yX2oljGG9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583506; c=relaxed/simple;
	bh=8ou/LjUh9H44PXJ2uYd86oH9V0fh3/VDK6sqI6dcJAw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UwAVFPMVCi4EnAjC9jplOPKvsiM/o+3OTiQ3b7gafhs43kh4adOmZX9EAM/KhsSHEBdRBkumBjqataZW7/X0cD/B3t+RgKfggDRmF/18XNh0/G3KiTHwew6+63ELVFwcFBoJrVKjBpLsx3kgEJ0PMZaxAh+Ay/rgPlTLHwACOt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=si3NnoQW; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8khdo014088;
	Fri, 28 Jun 2024 10:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=fkXWO
	dc1lpm1XmjBwl9qbzHRycvEZZt1+dtCkQGGL3k=; b=si3NnoQWbHqcTxbrKff26
	eayMnsd0l949s48ZZtB6Sm23UHsert3YNN/HR+Y8XexTy5JEUeuDmT0r9ZacAgbY
	0cgmmZCIHQNcmnFA9fAkstAE0NP884MWFGmVGUFZco864+eNpDbMLiVh3UY2Ktru
	nDetUZc/BBFpulaTHv2LMT7qhMK2ObmR8fMZ8Vv4Nq08UmkepYYrLpxNEFR9pCZH
	2Tp0ZZGsF/37JijWK9I7FmfJfos8TRVCyumcpDu6fShsgkZLlVz4bylddk1bBgvq
	JU/0s6JFdarRac3zvvvcB0lMvJrycKwQbTGut7K7SG+1ZGYmLgy+HyVZxiXjrf9/
	g==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 401a6wcb5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 10:04:56 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaVU1ks8XgAz9wjNDo1GFjSHW8UXxKkcgkDYKSsSgdnf6n0YT1NueW00YfLQa0WyZ7a/13luQPBtk/ZDMjblzRh8PuMyXnA+LlMASc9oYIw3m84jq6Gaba4rxj5z2i4nVXEoOqdiLqjoiXEdWKDH4F9gjmOeVGavdvMQgNmoNUiVJxfGderaG7/hF/ZeTJZxBI8rG5ZvrFu8FrUjSie1V+qsfhl669hcuy+xmso/3mvkkf3r+mSZhwunJQf46NcVJfInNxAGOfxJzkSBAv8yNr69wCz80eG8SluD1k/mq4l5LELjkWoAmu2wxjxxaRKqyU/2kX1WrzlvCbpEmsS33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkXWOdc1lpm1XmjBwl9qbzHRycvEZZt1+dtCkQGGL3k=;
 b=WjQqZSCQE2gIv1wpCGSBbejg9FQ6FT/Kvb/tuXdvzV67dPUinKN1G57z6/HvwGXU7OiVX8eIVlqex4vbfPFBtUgfPdiorxgw6vPXaC1iKuvF1MHwvJe6JbwpFOZIvoF0rH4crBhL8Vhsk562M+H5zA05yOEwlU3UpsigvC6ZfPMu6Dj3vA83djoy5PK6DdLqhfz4EJwoE8DALW0WiaRXwVe9vvue0j/oZDe67ykNSnTt0RbDEYQJY0bf1UfJvZwMDCQeVkrC8/kFeK9qLcBZYuAKVZ17SMHZVClb4QVKE/ufosHxQDv4bOXzgo/S5SKbX8QP+VDW5r3WgXs8nLVvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by CH3PR03MB7459.namprd03.prod.outlook.com (2603:10b6:610:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.36; Fri, 28 Jun
 2024 14:04:41 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 14:04:40 +0000
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
Subject: RE: [PATCH v3] adp5588-keys: Support for dedicated gpio operation
Thread-Topic: [PATCH v3] adp5588-keys: Support for dedicated gpio operation
Thread-Index: AQHayWQenbd8QNwcmkaTlSgpfPBSyA==
Date: Fri, 28 Jun 2024 14:04:40 +0000
Message-ID: 
 <SJ0PR03MB634322A27945D27D047DCFFE9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: 
 <SJ0PR03MB6343CAFA976656052DD10F5D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
In-Reply-To: 
 <SJ0PR03MB6343CAFA976656052DD10F5D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcdWFnYXJ3YT?=
 =?iso-8859-1?Q?JcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy01YjE3MjNkYy0zNTU3LTExZWYtODRmMi?=
 =?iso-8859-1?Q?02NDQ5N2RjZTVmODVcYW1lLXRlc3RcNWIxNzIzZGUtMzU1Ny0xMWVmLTg0?=
 =?iso-8859-1?Q?ZjItNjQ0OTdkY2U1Zjg1Ym9keS50eHQiIHN6PSI2Mzc0IiB0PSIxMzM2ND?=
 =?iso-8859-1?Q?A1NzA3ODg2OTY3NTgiIGg9InZWSUE5M0JnUmgzUzlzdWVTbVVzNlRQUkg1?=
 =?iso-8859-1?Q?ND0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBQzIwbkFkWk1uYUFScnlic1dtNTkybkd2SnV4YWJuM2Fj?=
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
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|CH3PR03MB7459:EE_
x-ms-office365-filtering-correlation-id: 71488968-9c3f-4f5d-9abb-08dc977b410b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?Iw2bYqoFrS/2Cce/QmqrlkhvkurA7FUHW0pv0/fV4nTsro1jNWslfCDQGh?=
 =?iso-8859-1?Q?fq0eul/1OQO9E0ljjGf3GxTL6J70Ml1q1dqLe9JkW5bhcMAdITX31X9glz?=
 =?iso-8859-1?Q?E4F8mBd9rT49RimYRlOjT/clIEKbEBaubq6CPM9qlbINBiawEA3MjEbkCN?=
 =?iso-8859-1?Q?Byru+p0zhzz3mmVhVH7+hgpvzFZlwnyH7QnVlU3JDvbALUh1lojf11AhmO?=
 =?iso-8859-1?Q?D2BfGvcHiBpZC8SMUDttJoRivw+ojF8fdR6WsxoDhRhaaX9jG9FJRsz+hG?=
 =?iso-8859-1?Q?clgiJ/6CchhaFR8nw0fBYsbymwWj6NXTDXjulkMgDyC8lH+bJWATeY951L?=
 =?iso-8859-1?Q?/rHwodKARdyJWKxC8ADXnFg6D4eQxoiazBN2H5Hx3bwC/75P5HpHa76kXp?=
 =?iso-8859-1?Q?s2j7LWYYTv62g6ZdXi8DXAPDKT6KpGZBmWQuMsSwL7EOdjif+79qoGqe8i?=
 =?iso-8859-1?Q?DBmhcAJf8KEI9hlhUwQH62WVPYIci3qSQ3rA2rCuF8POa6IW8qfI3PnCJ4?=
 =?iso-8859-1?Q?dAEvtudaQQG5+DECnIW6qJR7cZKGvWCV+too5W3VKicTF8BfP/HpT0aHlO?=
 =?iso-8859-1?Q?imKFOSkAS9zuiqs75UvRzQN1s8N5bGZt0ZvNn35H/3Kolt2iT/V8miAk9H?=
 =?iso-8859-1?Q?6jFxB3H1dREvMfkHLXd6YMOZTEWutcSQV7ZBkXS2qyjk1ttyf4Oa9hY5CB?=
 =?iso-8859-1?Q?ts8GdZdMbWRuMachWG8ComjZCdUOlFd5uv+3/S+SiFOA3FdeWIMSvUscAp?=
 =?iso-8859-1?Q?1EUESPS4Ai8K/we18+oNAHYDxTeCcUpZ0VlEVcLYkFMMRcUxqV225BQ7du?=
 =?iso-8859-1?Q?EavH8/AG5LH7tVYWTqBXBgd7S0K9n4VK4ViprvhRL71kU/dxsnPFAHw9Tg?=
 =?iso-8859-1?Q?c9Gn2FlUrG7QI2dy2BmCOhqNkK0jMcj9MlJ7PTjfgsy33Zys4LYv5I400Q?=
 =?iso-8859-1?Q?uGKPa/ROVQtwJsDe4BeZq4cRuB0KmkEFJks1GE335T6gTq0LyvJyMUmjkj?=
 =?iso-8859-1?Q?woLoxAOiXoYHvt6PPXAVWhfLarQ9fnrPMviyQRI7Qr7ifUMXCk5F/aebUg?=
 =?iso-8859-1?Q?52uLOCelf0hnzNeeTFUxyAyd8uWyjVH/jC1ssc29KV9Ft0B60pHNkBoBib?=
 =?iso-8859-1?Q?q9MxWknv9RMes5fq1iRaQLLipCNMdTNLg3DsyYmd+TV25bJuUt8MXRfjLd?=
 =?iso-8859-1?Q?oSZu0i1Sgt0E4SpD2IRRlFm8PJPtL2F0gkrI7pA50U2f/qmJ8UixmSl/z9?=
 =?iso-8859-1?Q?Avqu0wUzOwica1/f0zQqHbOTLNdMhsmVQmE1Y/VcJuc8ljZGq0msunxR7C?=
 =?iso-8859-1?Q?5L/OtgDul8vsWWu1cMmQavsUVdFAn/u0YswYFjdUxUeyw5qiFwazX4xA71?=
 =?iso-8859-1?Q?sVVHTn1Q8UnKUc+N8rou9NkQJkPUmygVAFnYOv1D5VCXKd20IJwAofd+YH?=
 =?iso-8859-1?Q?1cSws+jGEq4QJWUWu1+ZpnbO/sMdz5uGN5oj7w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?WvWUGL+Y04cgGfd9KDKq6A/OqLA/DcyTkT6//+UGyzQKXullJH3NAgZhkD?=
 =?iso-8859-1?Q?CcxG88nowKRkewUibtSgVN1Uw4Y0RWWyZXkJyzP7r2/MRbjPfL9Q29BM1n?=
 =?iso-8859-1?Q?bdvk4wAgvogekRGFF4m82Pe1gHF+4bTdyTo2/lbo0kDCG15YS6bMuzxkMM?=
 =?iso-8859-1?Q?h4DukAaXQnG4UDr5XSK5Jh2kggGpF8rQTzdjryPGzrFqijT7aASHN3B6Ah?=
 =?iso-8859-1?Q?krlyd4Wgt1oWjvB9hvYirK2NgEDXzyPgrIxLKCdTxjfwyR/yI4FsvA3TYB?=
 =?iso-8859-1?Q?YqMuP018FSnTpWEspz2+oDurAmJkxijTdDFkPGHmU4UPIz9FQy63B/buXw?=
 =?iso-8859-1?Q?Q+aJV1wzNgGx7I9RY3pLhzYj8TP8LGpG6EgmdPhqhbjt2WBbMPAlivDGpN?=
 =?iso-8859-1?Q?GISUYn0ldBcTIJOckb57v81OcOhCnd1CIEhBpGD8jTs3GWuDwyadGBM0xQ?=
 =?iso-8859-1?Q?alulqSHOR4gqt0JEpriN4S0koX2W1TbmFEA3XityApfXB+z9V8hEQhyK4U?=
 =?iso-8859-1?Q?TvTQofm3HTvIb2JEAxRYCFmjfmt6GqEykm3d5NTQ3JKABy0247u5uLxIwn?=
 =?iso-8859-1?Q?e79UcXt9v8yWL61P+J8jU6AOVhofqKok30fuQwb4/Uq/k6wHdTExrt44En?=
 =?iso-8859-1?Q?L7BzMLIyJ7HX+KDgINrXG1sS8ooxYDS23k3ymI6A2ETR19ElNkJyNl4adW?=
 =?iso-8859-1?Q?w7zlXPATKpcGZjlcxwCyEN5lD28tHmg96ykWHR8EKpOzJi7YbZg3gw7a0a?=
 =?iso-8859-1?Q?rSRRqG6Y1Q1xqEG7uKhcz2EwryzFPMcP1mM112iVeQkCMwEsQW60klVdu0?=
 =?iso-8859-1?Q?JrpUR3PvnxiGFCinZd7G6a8rBvA6OWEAXfEEc0FFeq7jlCzTbiTgOgO+DT?=
 =?iso-8859-1?Q?nSRVmHPYBwj1Mx4CZoA0QOoKvnAZ4+qm/1dos7D5EunjWvw/4TZuMxQ/5g?=
 =?iso-8859-1?Q?jNMNuUDx/0YCdrfD745wEUnuCndbHt3ZSZGj4K29VUR5uhm9HOdvIF27qC?=
 =?iso-8859-1?Q?depRptM3ugr4SVBOEKAJAtflVyD3uQvwEv35LfrJfsuecaCwB0OCRsAXpy?=
 =?iso-8859-1?Q?2fHHvmq+60xSltsOPqkVE8JBGRwaOfRvenX80oHxQ9YT54YNjWlWx0NHKJ?=
 =?iso-8859-1?Q?zSciJu49RqD49x1GI+m4r0ahoSJ7F6F7eEcwO4U7drepVoyrdnTJZB7jmf?=
 =?iso-8859-1?Q?2qtIziCf0XTTS7k+Bx7aWWxYL1DMdqdPfXrTHZRpjsdvB+vtqTP6TQbfz6?=
 =?iso-8859-1?Q?HW6WWo6c0e8ESEcoDGSZ/nbE9IraBG288aihnZ4mtT/Lzafv+AKnQK/L1B?=
 =?iso-8859-1?Q?tI4840yEu6gv/cjQ82CvNpGZJ96VxcdMszCTm7Xizu/bArWHKQrhmHGvuX?=
 =?iso-8859-1?Q?kNVs2B9SLUKPdbpl9Hk0yJNy+wka/4M/ilOcLRgGKWG5jW7n8OAhbuo1Vo?=
 =?iso-8859-1?Q?8z5Z0A51D9e2+KunjoyMP8KMMufxNEutMpTfa5ihQc9ItLJrsMUXwNafxp?=
 =?iso-8859-1?Q?8KPVM153nXTR8jrlnsXyTlN688G9XBVLzfHGjm8z4or4/u7q8OOSlLY3PB?=
 =?iso-8859-1?Q?a82X+x7QCuAlfl2hFlSbBFxAFUUo5BvJc405sdv//H31JuMaG+X8vBorGB?=
 =?iso-8859-1?Q?AJgUOc4D/RtkJSI66reQiQqKLbBnYZqhyl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 71488968-9c3f-4f5d-9abb-08dc977b410b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 14:04:40.7094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RwNBJB+gLz0hn3eRYPR3Q2kPHOvQGySRzYHTFsHqvP+V+BxF/YOSPXy+6dWoCz7KaS0IJL6xidKnDn5ez0q025n24RE0YMfPb4kzdzG7h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7459
X-Proofpoint-GUID: THuC4aVEbi9q3okFsKgmsHwrcMo0uGeb
X-Proofpoint-ORIG-GUID: THuC4aVEbi9q3okFsKgmsHwrcMo0uGeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_10,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406280105

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
inferred from the number of rows and columns specified. This
adds simplicity for the accompanying dt binding update as well
as interpretation of the same.

In such a scenario, additional checks are also introduced to make sure
that keypad and pure GPIO operation are mutually exclusive resulting
in an error if unintentional/incompatible changes are present.

Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard=
/adp5588-keys.c
index 1b0279393df4..c8c637046098 100644
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
@@ -647,6 +648,32 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 	struct i2c_client *client =3D kpad->client;
 	int ret, i;
=20
+	kpad->gpio_only =3D device_property_present(&client->dev, "gpio-only");
+	/*
+	 * Check if the device is to be operated purely in GPIO mode. If so,
+	 * confirm that no keypad rows or columns have been specified, since
+	 * all GPINS should be configured as GPIO.
+	 */
+	if (kpad->gpio_only) {
+		ret =3D device_property_present(&client->dev,
+				"keypad,num-rows");
+		if (ret) {
+			dev_err(client->dev,
+				"Specified num-rows with mode gpio-only\n");
+			return -EINVAL;
+		}
+
+		ret =3D device_property_present(&client->dev,
+				"keypad,num-columns");
+		if (ret) {
+			dev_err(client->dev,
+				"Specified num-columns with mode gpio-only\n");
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
 	ret =3D matrix_keypad_parse_properties(&client->dev, &kpad->rows,
 					     &kpad->cols);
 	if (ret)
@@ -790,6 +817,11 @@ static int adp5588_probe(struct i2c_client *client)
 	if (error)
 		return error;
=20
+	if (kpad->gpio_only) {
+		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
+		return 0;
+	}
+
 	error =3D devm_request_threaded_irq(&client->dev, client->irq,
 					  adp5588_hard_irq, adp5588_thread_irq,
 					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
--=20
2.34.1


