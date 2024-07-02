Return-Path: <linux-input+bounces-4801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8760923B49
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 12:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22AD0B21ACA
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 10:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7537B157E84;
	Tue,  2 Jul 2024 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="uUOZQ2U/"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940BC15535A;
	Tue,  2 Jul 2024 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719915664; cv=fail; b=XmEbhhrBKptjI5xMz12kqc9dP8apL+GfBGKxWzLGkVd9J9FxETTry4xxUuRkk1vYUpOCu2CQRwRlqBoiSP8iRlssiYiSATheNdtqxMbxRRkzuhdxu3/2nWAECOimCP+iBr09Vh4d9wo1u7ZWIzPLbvAWfeK47TvqFODby7Dw4Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719915664; c=relaxed/simple;
	bh=04LZaSJYsrlmZVYAq0sYRG/aNZge7oAejCSUoW/1Du4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G5B5IRNH4/O4SDKh4IC9YJs3zv700KN9BuO4t9Wp2kyOqFxGoZoUkpE7Ms+/IiEXhwPkdVdQfIU8y6KD5ONIlZRTRvUq7CvmnYfvApKt76TbTyQjxARjKaPfR0899MQaeOn25+OlOwMc3IlL+WC2Q9b2RFI5ayjkl5gDN9qi7TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=uUOZQ2U/; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4629Pjr8023290;
	Tue, 2 Jul 2024 06:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uOJhs
	VhX3gh0+JJ5vfmMDHdH4upwzs9fzZrtYtkF2Jk=; b=uUOZQ2U/daQ67aSm960CH
	wey4wlQ2/QIetxPjr3LeuM4ZB5wKTfCJ5xD+Vw6jGDL48SUKJmhnbk0QteDvpkxq
	QPx4vHMX+cDbVJHzaJkP0deKSkatSQ4vobcEqDjZvq4Uyc5ePexFXSVkVPbm7EOJ
	5lOrRR84dentspy9A/+Bn60wx1wK3bjGr37c6j8jsWS4eSVn2hqaK+LnjbN80FdP
	bw+IEHQH/StK5n1oI0TGHQ9OaeDkoOqw2exWydywyNnYGb+V1s6wVrqTbkh0Q8Uh
	38xEyAj6A2xbnCuO9ICmLDkY6k1hcKRAsDGEYAbR99u545c3A3wavSzmCiKVguHi
	A==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 404ewm0apy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 06:20:47 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJekiFiUEO5cyOM0tJ7ghxRLrxBLZHNLitf00Ivg6wy876ul+cDiaVwBmj7fElmN/y0w7KkSDgwFIasULnB04NxN0dP9CWi+z9WwvCJKgucRR1DTXlMERjsLk+8GJ3CmW16EvXxbC/avIfLqNQ3S6P2GD1bWG9BxxohJ1ztHrAyE7beLamPRcXsL06K1K+OCB5z9IkpIxGtHmwoP4OcJL1rDN2DSvsJb/vZMFGFcy2e4EWfW8MEhxGETZx10x9w0Fr24EGcoltohJQnUOe8hnaEw8am2MATuCgDIzt6VlbF0FDwIJBZ3tDgtq13eJOYgADDBqfA24MZ6ccxWdpIJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOJhsVhX3gh0+JJ5vfmMDHdH4upwzs9fzZrtYtkF2Jk=;
 b=oPWRuqtUULTRb5CSJj6BXjqrS52LUEHOqrhPP9lOC5KS9G7inNdkjvHPCLjVG5mJc+F7c2SsA6Farnc9wgTQSeJzbIUpfVni+HYKbtu4VwUiLhfqxWyp8djDBZiAYjGNIsdakwLqdD5r2wdc5XiEMfBgkOJ9YsZyrGReeVztu+u8tLVp81+zCA8/w42HHkB09CCG9yX8akJf4J6SlNhHeCWU/GFbMh7pcIWi26l2DrQ7fj+JelXOkATvu7jmxM/E27KIl95fX8/oMpNqr2sO1DxzBiEtRuOxDWUBXwrW8XRpVGV0ZAGapnLAVNt2qfkRzBW+17h8KJBNNZClq95+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by DM6PR03MB5050.namprd03.prod.outlook.com (2603:10b6:5:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.36; Tue, 2 Jul
 2024 10:20:43 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 10:20:43 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Conor Dooley
	<conor@kernel.org>
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
Subject: RE: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5588
Thread-Topic: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5588
Thread-Index: AQHay8gTYwwWs3CKE0S2GySCAYj43bHiBAgAgAAhhICAAQ+sQA==
Date: Tue, 2 Jul 2024 10:20:43 +0000
Message-ID: 
 <SJ0PR03MB63431578A395E4DA9552EC2C9BDC2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
 <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
 <20240701-battalion-tacky-c52566b37a97@spud> <ZoLrYTp2IUKFBvzq@google.com>
In-Reply-To: <ZoLrYTp2IUKFBvzq@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcdWFnYXJ3YTJc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1iYjU1MjdhYy0zODVjLTExZWYtODRmMi02NDQ5?=
 =?us-ascii?Q?N2RjZTVmODVcYW1lLXRlc3RcYmI1NTI3YWUtMzg1Yy0xMWVmLTg0ZjItNjQ0?=
 =?us-ascii?Q?OTdkY2U1Zjg1Ym9keS50eHQiIHN6PSI3MjEyIiB0PSIxMzM2NDM4OTI0MTMw?=
 =?us-ascii?Q?MzQyNzkiIGg9Ijl2RzU2RDRERlVxWkJSTEZVenZESUFZWnpmRT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QW43NjE5YWN6YUFlNEFCVGlrRzVGVDdnQUZPS1Fia1ZNREFBQUFBQUFBQUFB?=
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
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|DM6PR03MB5050:EE_
x-ms-office365-filtering-correlation-id: abaf1f18-3ef2-476f-f6ad-08dc9a80a13b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Cyg94FVYLj5R9nSN3Uc3xGeAPqx3z23FHBraGy0yZuLfYQ+xOX+vdhFJ4DWM?=
 =?us-ascii?Q?R0GQXd9lqlJhObtUqyRFI5Aou6MURV8m+PC7Z//pTbSCSI/mIR4h9cFjVX2Z?=
 =?us-ascii?Q?KtK8A5ti1AFr/yEgqUraq6T/IqHC8mFUDPzdz7TAZO0LFSnOXuEIMqgPBnhM?=
 =?us-ascii?Q?dcQoGbh8XgJPn1MtXpK9i6KzGRsOKCkYNjrYfcETJ/xnqyG+TkJrykWwfAdk?=
 =?us-ascii?Q?hX9gIC5TUpVyVyJ5bXVHO7rmpkFTOPgaQRsG6bZUMyoT0mGo7Z7l75rvJ+vg?=
 =?us-ascii?Q?Qz1Z6vLgLFgiTfCeO/tpQeROF/uzGvSFEAJREGJsqpfwxCiYwxKtfuX8iZXI?=
 =?us-ascii?Q?uHlvcOV9dvR/8nKPiRAwEpx2vbQFzuvK1yAZXUZGIslSWvqYEN3tdav3gYPs?=
 =?us-ascii?Q?+RfLZlt3TV683acOuPpcJ700ifMV1B/NtMB7jXTyIeQQ5pR4FqupOtAVuIIp?=
 =?us-ascii?Q?Aek/zcBNLPjdc7RV+391An4bTnxu2XeCnRdZEoMW1KVyTbPQuKT9garw6Qrb?=
 =?us-ascii?Q?toHYb1TZ1YKXaWdAGUJ6HM2pxad13YII1O21w4ts0JDPhLafyS+XhmTvgrvA?=
 =?us-ascii?Q?6h5zkSBDiy90eq82ariYOIHrwCQr7dW+b45uYmQCz7CdKnug/lgcRxm82TC+?=
 =?us-ascii?Q?GnVj7WrHC4FtNRkofJiNk2invHYS4SR6V8RwJbX/krbnE++tXqg2tcdZiSBJ?=
 =?us-ascii?Q?kkigJJ4EwBD2YoImbEXFRG62onEy8ZNQFvOLZDUvsOCD7tNXJ4Rb+6s5kqyD?=
 =?us-ascii?Q?+4yGLC6DwSDffUkDjvv/pYPaiUD6sYLTutgr/AdBkYK0ZQWnaCDDM2N3Sa2D?=
 =?us-ascii?Q?nxqaFKO5gi03ygl3ePlqTx4B3IaVqKqTqyQQbtINqGgJLeIQ1cnSQYmaFCUy?=
 =?us-ascii?Q?zg8SX26KBCLwKezILAkKbI7oV9uv+FfdGNnpi92k7IqQ6HmljRb0rKDT1Huy?=
 =?us-ascii?Q?0S+1qe7CCwpYfhgnypSgX5kuKBzP1bxUecfVqzGvBdS1wSB+Kpr1Yqx/kCuU?=
 =?us-ascii?Q?UP7b+0LaZCz+Vyr9U2DGqDj7NUG3pUjD2BSTXZc8mOXuscqMiyUxT5ojg2So?=
 =?us-ascii?Q?Rrq7kM74VWP3smFr+2JmijY8TEK4DsUlA3Of5rK8o+Mq4TuWnR2w6L4pKS12?=
 =?us-ascii?Q?ODB5APvDEwVgdmfx35uVAOlF6YDNsW7hsTVKtWPWRU2Nn318gfxUJT0Vfsq3?=
 =?us-ascii?Q?tf5I1VUK5NEYyvQvQPt4TyMEIU/rrHej3vXHAoASK6e7inWj8Vxue9I3vtTG?=
 =?us-ascii?Q?st7OHGs56gZSPV4Z5hFC4ImQ+XVlqNMhegD2XfxujjYkGcjpyJKwsEvl4KSP?=
 =?us-ascii?Q?5aI422PNG6KICe7S+JMPgWfGmkNpaPhvrxAODjDQJm5iipiUUnUOF9LjlVB9?=
 =?us-ascii?Q?NAhRi2uKRQPQG0LnT8fIU6P96ubmaANyHffJ3LE54kzbpD6rDA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tTwHbFWm+Qhz4C6j0XFAKKBc7YgtY3Gjl6jfzMaBzrtttjx/n93U0cok77P3?=
 =?us-ascii?Q?uesRWbSVCf9vqE0paJFPrXgVG359F5CBKx8VbVC+wue/T1kYMALDWI6a1PEC?=
 =?us-ascii?Q?9q7x0p96yeGhuEFs1haxmcssu2ieePpZ/cb/wpknvitEGM69xtmJWrjafu2y?=
 =?us-ascii?Q?khRoA74s5Nb1oGj75wDGNBWgtMJT9OfG9mweW5rZGh4ywXNRSgiJsYLi+d1H?=
 =?us-ascii?Q?ThG+mpSAH5+eHiIuPfg9LtGNBuPNnP63GxwgxtyR2ZVYoA0dbiL5PlqGk85o?=
 =?us-ascii?Q?o9yh6pTEHBZKjbHpkjbWNj3AnJSAm3c0VjieKj4q3SBJ+o84owScX1IUsx0B?=
 =?us-ascii?Q?C9QKeZ3KPqa1fZ6+5551RyrQxGke0gNd7MqZKczZ8fqRFPXf4QPfX0a2XJER?=
 =?us-ascii?Q?lDmoQ/FdUzNwYTFhEvrsyJ8XhR3AKSmxL0R8ZRPQzBFsnvzoRYTeXq9tLXsL?=
 =?us-ascii?Q?a7SAjB9XivXZB31KVflQGTZK4SRacQn03JhX9DiWVzvBuSfQAuR/Tp3LwKGT?=
 =?us-ascii?Q?jYqCiUjCxAY3TbBONHT5kx4xf7XvlZa7jXLcOMFEhEvDMmih81GhXZ4WToXg?=
 =?us-ascii?Q?I7DZfzgnfIx1ThnQKGxLNF408TpIuvKseXdTDfXtKMwwWFUtFJtIJcNmZQcC?=
 =?us-ascii?Q?kLf2mH0+1+Q/vVi6ooEF6HEKkOmqhPXpVUKaIu0b5QHBfKgw8920swxb/qjj?=
 =?us-ascii?Q?6v+YX+By3+85Ooz8gtc9Ch+UQ94KhPyP/DomKSnZ11O3OVj4eg+Qsh4czxS/?=
 =?us-ascii?Q?AHTg9ykRwj/JUD03NkvZImbTFglg3r/UZLquAyLXOfIH3G2+1p7elkx3IPpN?=
 =?us-ascii?Q?efZRdY9SAsL5nLDW45GQzcLkwCGpOYndBktrxtwQRdReRlYMHF58muInINYC?=
 =?us-ascii?Q?Y5qTjmL+8Ep2KggYMkaEZF1WD7UqjZj8O1as2hJzLnrb5XiUPFpGkzwNtWJ1?=
 =?us-ascii?Q?HvigNMOHorihPOgm57aqFzhuu0hkLJC4047DWdFXjfZ2Ya6s03ajJAUUnUC+?=
 =?us-ascii?Q?GIvKo7bK/8wzmJRHF17a0VfAgDGsoFHnlXP2H6DnnRpGhbSzYfo1JgjZVNw0?=
 =?us-ascii?Q?dLAsR4IM3Oi6Iah2+6xYQhaQaxXacsh1a4KVoP0lezrYs/lABHJI0JGCy9FX?=
 =?us-ascii?Q?fkF0JYRwBJbBfojG7lOetcnNiAHX/uZ2gjbMxzB0lmi4zyNrBaWlonfib4l5?=
 =?us-ascii?Q?jFHyrV0NglyBY5oLus6+wtvh628Q3PRnBl4yOMJnDe5YySA9TFrW6ZCWP6au?=
 =?us-ascii?Q?X20qZL6q5u8ANCwoV49WITrPUOuQUWOdxwuzMrFwK+v7aVnsGorlkRZoJENw?=
 =?us-ascii?Q?rCDII1n17c+MkCYxPiKt24LJJvoPhMSC9vlACoFknpt3wq0qEgkNKjam3mCL?=
 =?us-ascii?Q?lJ9q5pDOQtje5NSCh9+fg8sHKhue0xpYh8H4OAhs9GBd4ysw5Jv7BE8ss+AR?=
 =?us-ascii?Q?geT85aC85nSoHQAEnor/Gp9lDSNqmj/ZtRHL+DX44caATgqJvWqIlmImevH8?=
 =?us-ascii?Q?p1fp9vPIfMze40Mvl7KC9tc7R/qdjMsNssuTn/vmj+lKnE4OSZ3cHCleO6AF?=
 =?us-ascii?Q?BAzvCtUCskBrX4zsQpMA0YQLbu3L0T+oNOEzKK8z?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: abaf1f18-3ef2-476f-f6ad-08dc9a80a13b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 10:20:43.0942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFxjo9ykgcZC7C/wvHDqV2VcQSkKI0H3Uqw7LIstjC8rzH6CbfHmEGZYBTtzBUfl64d+BMfUvQLC79N17pQHYlVCtNsCup53fhWfHQEiOao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5050
X-Proofpoint-ORIG-GUID: QPuOZWQhQKSxmTFx6HVyIHHlpNk115du
X-Proofpoint-GUID: QPuOZWQhQKSxmTFx6HVyIHHlpNk115du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_06,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020077

Hi Connor,

> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Monday, July 1, 2024 6:46 PM
> To: Conor Dooley <conor@kernel.org>
> Cc: Agarwal, Utsav <Utsav.Agarwal@analog.com>; Hennerich, Michael
> <Michael.Hennerich@analog.com>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Sa, Nuno <Nuno.Sa@analog.com>; linux-
> input@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Artamonovs, Arturs
> <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
> <Vasileios.Bimpikas@analog.com>; Gaskell, Oliver
> <Oliver.Gaskell@analog.com>
> Subject: Re: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5=
588
>=20
> [External]
>=20
> On Mon, Jul 01, 2024 at 04:46:12PM +0100, Conor Dooley wrote:
> > On Mon, Jul 01, 2024 at 04:04:51PM +0100, Utsav Agarwal via B4 Relay
> wrote:
> > > From: Utsav Agarwal <utsav.agarwal@analog.com>
> > >
> > > Updating dt bindings for adp5588. Following properties are now made
> > > optional:
> > > 	- interrupts
> > > 	- keypad,num-rows
> > > 	- keypad,num-columns
> > > 	- linux,keymap
> > > The proposed new property "gpio-only" has been added as an optional
> > > property with an additional example.
> >
> > I can see that as it is clear in the diff, but this doesn't explain why=
,
> > which is what you need to do in your commit message.
> >

I will add more description to this commit message for context.

> > >
> > > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > > ---
> > >  .../devicetree/bindings/input/adi,adp5588.yaml     | 28
> ++++++++++++++++++----
> > >  1 file changed, 24 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > index 26ea66834ae2..158fbf02cc16 100644
> > > --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > > @@ -46,6 +46,11 @@ properties:
> > >    '#gpio-cells':
> > >      const: 2
> > >
> > > +  gpio-only:
> > > +    description:
> > > +      This property applies if keypad,num-rows, keypad,num-columns a=
nd
> > > +      linux,keypad are not specified. All keys will be marked as gpi=
o.
> >
> > Why is a property required for this? Is the absence of the 3 keypad
> > properties not sufficient to determine that you're in this mode?
>=20
> Yes, I think it should be enough.

The idea behind introducing a new property was to simplify the usage in add=
ition to making it easier to document a pure gpio mode being supported. Wou=
ld it still be better to remove this?

>=20
> >
> >
> > >    interrupt-controller:
> > >      description:
> > >        This property applies if either keypad,num-rows lower than 8 o=
r
> > > @@ -68,10 +73,6 @@ properties:
> > >  required:
> > >    - compatible
> > >    - reg
> > > -  - interrupts
> >
> > I don't understand why interrupts is no longer required.
>=20
> I think it should be possible to use this chip as a GPIO controller but
> not an interrupt controller, in which case one does not have to wire up
> the interrupt line from it. However this requires much more elaborate
> binding description (i.e. no keys and no "interrupt-controller"
> property).

I will add a more detailed description in the binding.

>=20
> Thanks.
>=20
> --
> Dmitry

Thanks,
Utsav

