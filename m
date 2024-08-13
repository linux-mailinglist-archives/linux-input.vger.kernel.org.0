Return-Path: <linux-input+bounces-5561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC2950E10
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 22:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00F1728562A
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 20:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9091A7041;
	Tue, 13 Aug 2024 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="gIG1o6p/"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2271D38FB9;
	Tue, 13 Aug 2024 20:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723581812; cv=fail; b=JKdRKVFJsMR1S08gapxN3Uv4leR/822Y9DIsQJT9PmSX1uIyEyfLFQUuV9IlWyXZk+zvx4d2NcpReXKejX3rOgIehinaz+zfN6VkOKj02h05tT6kY5qH+9CTdgW7YmJV5P+qLVT1TScu/qftX74WiS0iOQQyP/4cnFFfL/xXlic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723581812; c=relaxed/simple;
	bh=rd8zKrVInNOzlOSK7G0CdocbgMtOJCeY+egLgzzQ17M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BcwYPQX64GKOZPDVawLZ5QxcbQhZ7X1JYjhiQnqi2TwttMgeY0xUGUYMHB5Lr0N4Rtz4GaY2WiRtCCm0X4PvMFNqLdfKsKGN3pBZq11oyF/T5iha4JYM58oFBCml1dU4DMFwda1/6CUZ4Dv2QQH6jzNeNTGOerthIu6SZ2FqmYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=gIG1o6p/; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DGdQjV014341;
	Tue, 13 Aug 2024 15:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SFlp2
	SUeMSvh3mzjhCMFYlBxdnaEpN0E65SgLpGN5dk=; b=gIG1o6p/qWzG//CTWIfwq
	wm4LjbcflNLbdCzsMJ1Nv7FaiIxfpW59Y1GthV8eMrEN7mTP+QdSDICJM7O5nDFi
	J4q1epmTNwPtybg5F777tRyRlTnGWtY2zD1c7hFYGzfZNQIbRl4TBhI1sDtM44uG
	orrBdPD3POhoJlcw/RrBBW3M9PXv/EiwTz9FOkDGtpCQE1yUeTX6gIFUQdG8vxme
	3lcqP7jM/DgMqUVw0UfjVAul7KeHbqcmtfpXEAD1123VQqiU1RRX4JJkiOren7lK
	TLuZKmUc7YvbEoB8lFA9M6rBvEtXRADi/KaXP1XI4jRzEO5g8RssJ19F8AtaUU6b
	Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011029.outbound.protection.outlook.com [40.93.12.29])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 40xnda1av8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 15:59:07 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AG98oY1vE1vl21qFqqLFDEUODW0fqMHya8Lj7XszuavEdnuTZLSwLXGQqeObKQ1tgzsH+Rp95iIDEeBlfD1ml/ZncING++pRJ/XJBVMUlRpNazUWfWvBT4SJqiuPxiFXYfDDEJDHtVVjpoUe1hsITmstCZ/pm2YpXEG9OSUvvNebkCFWlxZtEM1jFFisxmBB1gd9aWaRQ/OUss0vpyJB8xanNWp+CFL6kK6SgJIdNy7a3QaEYEfG35Lm1mWqXROrSb6qhbuihRmGuC01dgVTEw1Gaxa3QYswiF0AhjZpgkM+h0RVOE9Wj3HQ5LmxJ36HkEhCewt1g9oaLb6vney4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFlp2SUeMSvh3mzjhCMFYlBxdnaEpN0E65SgLpGN5dk=;
 b=NzrUEXnrDbqsiLZgkTfDLf4KB3MpwXzR8R9cZ7kIGQgfcwetLDmCdPcwlFGM7PyuIXudVGT+fe50yn9sp9U8+tpIaJ3297OHfQzGSZl6DXvMP2v01bZV+ZUDebdhfeYjnOe2QLBShHZ5d87wEKWOCbhNXCKIqzPrTkgLfmQgmL2Dkq8CKXUnAaaqFVhnfZ4JW+05NGqqxfB79o/ZWocp/oHHcM61oSqPabE0CENlC4XM/IzrqDJoYH2dw7k/bGQ1a/+BDdzgHYSgsq9EA9ZXTJs/qRgOL9hYmz+mX8242PDY+fHICOhp9UFnxf2ikgU0rmIcRZOxOTUsnzWTFV+s2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by SA2PR03MB5849.namprd03.prod.outlook.com (2603:10b6:806:117::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Tue, 13 Aug
 2024 19:59:05 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 19:59:05 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: Conor Dooley <conor@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Hennerich, Michael"
	<Michael.Hennerich@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>,
        Conor Dooley <conor+dt@kernel.org>, "Sa, Nuno"
	<Nuno.Sa@analog.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH v10 3/3] dt-bindings: input: pure gpio support for adp5588
Thread-Topic: [PATCH v10 3/3] dt-bindings: input: pure gpio support for
 adp5588
Thread-Index: AQHa7WabgX80uLigs0yl9EoDlHFIjLIlCHEAgAAJkYCAAD3tgIAAPHkg
Date: Tue, 13 Aug 2024 19:59:04 +0000
Message-ID:
 <SJ0PR03MB63432F16DE0FC0789061346C9B862@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240813-adp5588_gpio_support-v10-0-aab3c52cc8bf@analog.com>
 <20240813-adp5588_gpio_support-v10-3-aab3c52cc8bf@analog.com>
 <172354752239.384988.5705833300903132689.robh@kernel.org>
 <SJ0PR03MB634347015AE14A06A3837E199B862@SJ0PR03MB6343.namprd03.prod.outlook.com>
 <20240813-talon-uproar-f27c6f194d59@spud>
In-Reply-To: <20240813-talon-uproar-f27c6f194d59@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?us-ascii?Q?PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXHVh?=
 =?us-ascii?Q?Z2Fyd2EyXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVl?=
 =?us-ascii?Q?ZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctN2MwYmI1YWItNTlhZS0xMWVmLTg0?=
 =?us-ascii?Q?ZmMtNjQ0OTdkY2U1Zjg1XGFtZS10ZXN0XDdjMGJiNWFjLTU5YWUtMTFlZi04?=
 =?us-ascii?Q?NGZjLTY0NDk3ZGNlNWY4NWJvZHkudHh0IiBzej0iOTU5OCIgdD0iMTMzNjgw?=
 =?us-ascii?Q?NTI3NDIzODM4ODMyIiBoPSJLUWZsVGFpV2tVMXF2RjFGUnNIMjU1VHphVUE9?=
 =?us-ascii?Q?IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dV?=
 =?us-ascii?Q?QUFFb0NBQUJ3R253K3UrM2FBUmt3WjA5R2lWSDdHVEJuVDBhSlVmc0RBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBUUFCQUFBQTNMaFNmZ0FBQUFBQUFBQUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QmhBR1FBYVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0JsQUdN?=
 =?us-ascii?Q?QWRBQnpBRjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFHa0FkZ0Js?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQVpBQnBBRjhBY3dC?=
 =?us-ascii?Q?bEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tB?=
 =?us-ascii?Q?WlFCeUFERUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFDZUFBQUFZUUJrQUdrQVh3QnpBR1VBWXdCMUFISUFaUUJm?=
 =?us-ascii?Q?QUhBQWNnQnZBR29BWlFCakFIUUFjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09?=
 =?us-ascii?Q?Ii8+PC9tZXRhPg=3D=3D?=
x-dg-refone:
 Y3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3Qm1BR0VBYkFCekFHVUFYd0JtQUc4QWN3QnBBSFFBYVFCMkFHVUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQThBQUFBQUFBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBRElBQUFBPSIvPjwvbWV0YT4=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|SA2PR03MB5849:EE_
x-ms-office365-filtering-correlation-id: 15d55072-92ac-4bca-b22d-08dcbbd2628a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?y9Dlz9zJmSe1VcZG3rVXG7RKFHkWCjJvzGBI0H4QWEdvYmFttL2FUQWpLlhX?=
 =?us-ascii?Q?/SpzepnaM0G63WpFDIEdutt2lK4nXH2Pt5SFBtNJ9aGp2489jmtJkolSO86J?=
 =?us-ascii?Q?50Hb7LGAXLhdRqqmJuTsogrQq4ZBnSbXW9I7E+EJuWjy6gTUcy49t7XmP+2Z?=
 =?us-ascii?Q?SCzXCAEq690wrSEypPCv7cRIb2TLa52UUEv8xVswjeyocDqx/4iqBG+ajt7w?=
 =?us-ascii?Q?0eFR9gZqC0wqIHIwjHRmJSUwNFDGirNKVVYb4xoBhII9xY0lWtfpx8fSDsk6?=
 =?us-ascii?Q?yJ8g6il0E6jy/IDzfRKAv9fqLwNsczkZps2Ydpd0gFH3Da/dFbkJJFTX/ZoM?=
 =?us-ascii?Q?OFXehUk/p4l0JTkp82DY4CvN3pfndpBDtaxGQpu3No6Xx5xARZLOSjSTdlX1?=
 =?us-ascii?Q?Cj1PxqPfrdqLVcUJqq7TbUtOClCwiZU5VlHWatOBTaZ4o5Htav2DRuBN1Psp?=
 =?us-ascii?Q?homoq2GwEZYgnMlvEoi4QbY8nLeklJSVZot93oe49nlI1HVpcD/7LDVWskRZ?=
 =?us-ascii?Q?taPN/AW84/QKxmOjTLhfzpohkSIY9cFGIpyAQHhEFPapIIqyJZQx2y8dw0I6?=
 =?us-ascii?Q?47OQPXhyKFd+eUJtQB0mNtnNFyV3OFN4/oXrI3enoaoaCUj3MUaRI4HVxVlU?=
 =?us-ascii?Q?YEScJL2Na5TyzxFBmmoPSSPdvOlH6eAwQZmtD9hO8wLLB6B59SdJgGFUXlJs?=
 =?us-ascii?Q?z1igr3WCi7XY1LG99YhkgEhOBBQuy3VGH/u3R9eMZIg1AnAHHx7I1Os/a7Gt?=
 =?us-ascii?Q?TgPkHaUbaVisCX1S6gW58gIQgj9zXAMX17SwU4tEADTDz+982/1ZZTXNsqf1?=
 =?us-ascii?Q?36JhB2Kle+f/3rxiL/Mgv4x+dYk7lmIMUgLBAb7vxzztPrwfoqhBruKHfJKL?=
 =?us-ascii?Q?UttHEZqxfBfcw8LruM6YSFTrZB0QETe0O65CCwz1QaCxFqEVuQAGP9sbvcQq?=
 =?us-ascii?Q?unegk4sn+WxpXEOLwtMLe6oNH7qi/7XXzjuuZSBeINNps8rdaLreMMadQCWL?=
 =?us-ascii?Q?PuY49Xh5bWqxTsrvgyKFRkk7hHV4AOvVQ42B8G2T+D9zgXp16AS6gQZRbFel?=
 =?us-ascii?Q?9YRRq1gg+r5qArfHgSzTezkHAjks3K4rNSkVHDXaT+RW+1AorznMZ6mC0Vob?=
 =?us-ascii?Q?YQCGDnPQb2B4IXWgiDRe3bT7mQwmZMulDd13BaTPSAremZvqoNKzgZ9A9V5d?=
 =?us-ascii?Q?AKYUXN9JfKl1hkAttHEH0Lronik7pWF8twClG2T5YowTI682Zi6QmZQ/dI/C?=
 =?us-ascii?Q?xm4vMnFiFnlVCWgw7nuXiL5fdyxpaIFhF3S+D0UqciPCYF23nHG9S/bFyId3?=
 =?us-ascii?Q?a/GoEugC8K5ElUd5S3oxpP3oNvYBSBh6F0KIfOcCc1WYnWUoFYu+BpmL7hs4?=
 =?us-ascii?Q?a+lFEALrSVqUCm3wCmXcddy2J7DckDD2BYhIpfG4J4IH4k+CXw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HyadGE0HVXprIKDThEN+0bjEqEDmMqkIQ5950+3U66NOl8o5/T14aQxfJnHF?=
 =?us-ascii?Q?4rLLqBvSLSWShswgiFD3NNtylA4RKdfpifjVzE99oUsHUDERV+QTrud9v78I?=
 =?us-ascii?Q?dfWYQpj+Nbx6fpqo+I3OepAkZejRhOGP/iWcAzHTXL0Q4cuPNt6GzqpcibT2?=
 =?us-ascii?Q?1q+IfIbueupHAfRFmKOzpdqXOEDdX2LjUmGC5qfzN9F3UtVr2hdr4ZM+MXmY?=
 =?us-ascii?Q?LE1syVdvews6+DDNnSaWSC+1ECcAP2cr6g+FW5Vd3dSXhOWxBxXCVH3Epsx+?=
 =?us-ascii?Q?UrDy9aLcckM0ViDRgkk13T01PlplOCC/YvWUoVxHPKHie7v7fEfvdbqNcxgN?=
 =?us-ascii?Q?a+rJN0y6mJMOMFlZ1EyAE58NMPNTgmbtAqkemCYx+b3NWK8tuth4Ta5R6qRs?=
 =?us-ascii?Q?pbpQCzi7WJko9E6T8FkRKcZC7iQHJfkWBT7MHxLnmXBZtrI7mPdqoJCcF3HS?=
 =?us-ascii?Q?b5Ht+JfBhw7Vu33CEXKWGPiCcQ1MDYNUkykGjxKGA4xKgbPRTBN8jOB4UxX2?=
 =?us-ascii?Q?ZJtLbhhecfxgkvsZxBqFiYeZtSTaLK4hhf/Gnqk0OUcPo+6AHAOTUpBRvEEM?=
 =?us-ascii?Q?us5oNfeaiO5OZ1gfjIGeqYsps3FpLx1+Qge844idq1kItIzS7hsDgHKOToDR?=
 =?us-ascii?Q?SSb7LDx3aZnG1TUwbDW4gBhuVkCSm4Vv/8iP64LR/0Dz9KehF55Fxh/uGAAQ?=
 =?us-ascii?Q?yde6bljb3YUw/tDdFGdnzrWMs8QscYUoYJeJ1UTaS88D53Fai5tcmSibvTOB?=
 =?us-ascii?Q?6xhOAkj5tL+9VmdJMZUx1G0abUxXG671hlX6xY4uqpkasgidWlUyCuXm+2Qj?=
 =?us-ascii?Q?ZT7Q4NPQ6o/+BjKrsjl92e3CrodCsVpIvA2NSbUzc2I1kWv+ZMu41CLTN9Ea?=
 =?us-ascii?Q?Hy/wX6NIRm7vZ6XqrjRe/pca0BSK9AD+5DPSDJ5zL4w5/r0aJOFSIoId3OiY?=
 =?us-ascii?Q?+zRPJvPPRxB+8FtnqUDhrMoW18hJv021LPEMJTErWv0j/mrr75PXYq7OJwka?=
 =?us-ascii?Q?tLDJifyb7O/Kmu28F96bq3+FtFzhJJcF+t+VKgYcDiX2hu5Pe1y2Uuw47W/W?=
 =?us-ascii?Q?/c5lphySrjvgEMuf5m0j/QSWy5amBw/ke1owGH+XqTJqxRg5Mj2GeWHXR8NN?=
 =?us-ascii?Q?IYQ7FI+r0i+waneqlKgAjh6zr6McbaEQX/8s8H1QO3mC3bt03kTgj6SmUonp?=
 =?us-ascii?Q?xWtcbQx3EBv0Sca8PlE9WoPNoa9ulPyrSJj+L/Z45VpdiifoiY/c6PsoVW0y?=
 =?us-ascii?Q?1aaaFX3brvUKdcMfP4Sdzs/7IIHcuQHnxMNbbO+P+9ks+uq0zA8doom8/S1P?=
 =?us-ascii?Q?qGTI5x69QMw10t8tp0XkjVpgEkZBnWGKe0NIRM8IUZeUCPYRbnz1w7PCKuWe?=
 =?us-ascii?Q?zL50o3Ke7/+kjModhgq0JGFMdH3XgaDe2ttXqptxlBaahuUBySZTp7dVyxar?=
 =?us-ascii?Q?/Jn14+nmv5NpQ9Jv2hlA/8pW/zrf3u/qYD9dPchFsKg3BYxM+D5Evavavz8c?=
 =?us-ascii?Q?CQPeat4UyQZNuwVa3bNk/ulLQ1jbuxwTfZbTsW0yDEANAQ2RQbI4CKbH9nTA?=
 =?us-ascii?Q?Qq/aGrNVJlHl52qO7iCITOi+ML+ujtz4RCRf+eC/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d55072-92ac-4bca-b22d-08dcbbd2628a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 19:59:05.0101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGgBPPpXqovOXYuUkHoiLCF8w02WeTRlBaFWLnqfeU/QHLNSEXJlV1M/U/xteAnRh8tt56JGseeUseDI1IflVDVgbiw1GQySXCh1j0K3+gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5849
X-Proofpoint-ORIG-GUID: 1dzzZon5qxu8_t-GrW2gERuQsrC9g6Zd
X-Proofpoint-GUID: 1dzzZon5qxu8_t-GrW2gERuQsrC9g6Zd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_10,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408130145



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, August 13, 2024 4:28 PM
> To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> Cc: Rob Herring (Arm) <robh@kernel.org>; devicetree@vger.kernel.org;
> Hennerich, Michael <Michael.Hennerich@analog.com>; Gaskell, Oliver
> <Oliver.Gaskell@analog.com>; Conor Dooley <conor+dt@kernel.org>; Sa, Nuno
> <Nuno.Sa@analog.com>; linux-kernel@vger.kernel.org; Bimpikas, Vasileios
> <Vasileios.Bimpikas@analog.com>; Conor Dooley
> <conor.dooley@microchip.com>; Artamonovs, Arturs
> <Arturs.Artamonovs@analog.com>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> linux-input@vger.kernel.org; Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Subject: Re: [PATCH v10 3/3] dt-bindings: input: pure gpio support for ad=
p5588
>=20
> [External]
>=20
> On Tue, Aug 13, 2024 at 11:50:41AM +0000, Agarwal, Utsav wrote:
> >
> >
> > > -----Original Message-----
> > > From: Rob Herring (Arm) <robh@kernel.org>
> > > Sent: Tuesday, August 13, 2024 12:12 PM
> > > To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> > > Cc: devicetree@vger.kernel.org; Hennerich, Michael
> > > <Michael.Hennerich@analog.com>; Gaskell, Oliver
> > > <Oliver.Gaskell@analog.com>; Conor Dooley <conor+dt@kernel.org>; Sa,
> Nuno
> > > <Nuno.Sa@analog.com>; linux-kernel@vger.kernel.org; Bimpikas, Vasilei=
os
> > > <Vasileios.Bimpikas@analog.com>; Conor Dooley
> > > <conor.dooley@microchip.com>; Artamonovs, Arturs
> > > <Arturs.Artamonovs@analog.com>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>;
> > > linux-input@vger.kernel.org; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>
> > > Subject: Re: [PATCH v10 3/3] dt-bindings: input: pure gpio support fo=
r
> adp5588
> > >
> > > [External]
> > >
> > >
> > > On Tue, 13 Aug 2024 10:51:33 +0100, Utsav Agarwal wrote:
> > > > Adding software support for enabling the pure gpio capability of th=
e
> > > > device - which allows all I/O to be used as GPIO. Previously, I/O
> > > > configuration was limited by software to partial GPIO support only.
> > > >
> > > > When working in a pure gpio mode, the device does not require the
> > > > certain properties and hence, the following are now made optional:
> > > > 	- interrupts
> > > > 	- keypad,num-rows
> > > > 	- keypad,num-columns
> > > > 	- linux,keymap
> > > >
> > > > However, note that the above are required to be specified when
> > > > configuring the device as a keypad, for which dependencies have bee=
n
> added
> > > > such that specifying either one requires the remaining as well.
> > > >
> > > > Also, note that interrupts are made optional, but required when the=
 device
> > > > has either been configured in keypad mode or as an interrupt contro=
ller.
> > > > This has been done since they may not necessarily be used when leve=
raging
> > > > the device purely for GPIO.
> > > >
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > > > ---
> > > >  .../devicetree/bindings/input/adi,adp5588.yaml     | 40
> ++++++++++++++++++-
> > > ---
> > > >  1 file changed, 34 insertions(+), 6 deletions(-)
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > > ./Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: [er=
ror]
> > > syntax error: could not find expected ':' (syntax)
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-
> > > ci/linux/Documentation/devicetree/bindings/input/adi,adp5588.yaml:
> ignoring,
> > > error parsing file
> > > ./Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: cou=
ld
> not
> > > find expected ':'
> > > make[2]: *** Deleting file
> > > 'Documentation/devicetree/bindings/input/adi,adp5588.example.dts'
> > > Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: could
> not
> > > find expected ':'
> > > make[2]: *** [Documentation/devicetree/bindings/Makefile:26:
> > > Documentation/devicetree/bindings/input/adi,adp5588.example.dts] Erro=
r 1
> > > make[2]: *** Waiting for unfinished jobs....
> > > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432:
> > > dt_binding_check] Error 2
> > > make: *** [Makefile:224: __sub-make] Error 2
> > >
> >
> > Apologies, it seems like I accidently deleted the characters towards th=
e end
> > of the yaml file when making changes...
>=20
> If you make any changes, particularly to an already reviewed binding,
> please be sure to run the tests again before sending.
>=20
> Thanks,
> Conor.

My sincere apologies for this, I will send out a revision now correct it.

- Utsav

