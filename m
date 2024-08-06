Return-Path: <linux-input+bounces-5368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 447899486C5
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 02:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99C2DB21C65
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 00:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC13C5680;
	Tue,  6 Aug 2024 00:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="DNhXLLEL"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2117.outbound.protection.outlook.com [40.107.223.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB86FBF;
	Tue,  6 Aug 2024 00:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722905813; cv=fail; b=VC7EItfBt09K7vHQ7T9rNYtMoR3pxHVfJ1kSutz8E7fExc9RYLDQR7bc8ZB7EYsj8tU2lDEN1LVwgMkSn5YzjnfBDkcM7Hsbf2dg5gJ6aCUT0yGOi2zJdo9r7dSqg+7zLIKgww7zlu7HWf7Ee/mwyLzh+P11qVdWWIY/xFx30E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722905813; c=relaxed/simple;
	bh=llTFTs4snrpo2RDroSFgnmKC7Fvre8MEiKEYO0vHnIc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nsHjtGgcTzXF2id9TLvmhpMQQ9Okyhz8QHMf/p3Dt6obUHgQ+ynIgPZt8ubDTeLQ+3PEj2XE0nqRZS4Y3osmGtHTQDF1gw8DWE0vVXJClrQRpnDVvD9moloCPBTS1tj3Zt7oHzN2n45GEs90Zrzhec79RuJsoyYZLfxct5HyrTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tw.synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b=DNhXLLEL; arc=fail smtp.client-ip=40.107.223.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tw.synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9NfUvHr5BDXkF7QMn9rx3JY7gsyNQZr/HmeIwURicwr6ikD2+qywdxsrP9OB7tfC99s+TWWaXpvU8lmhba1gWZEWQCRspiLFAIZIj4R+1FdfrEKIq5pWVBQJlC2yMkmnRsfM08ruXGYVGFhRUfpelA06wapRaxwx9pn6NlVTjDc+DticHIwjDWDJ43ItlwkZLsxfILMW4RkvnnSIYCm0Y+iRDmn+e4EvBPLLsUGgitj6DGwhrTd4xRVhe8ERY25QX+AaQU1IVe1gdw8S8y39jVVBjLQtEHoF8y3HfWzAYENlz8jxFPjCUTAiSQ72jK25ZImKr1vdHCUp+3JicoNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llTFTs4snrpo2RDroSFgnmKC7Fvre8MEiKEYO0vHnIc=;
 b=FX9WBAgCffBSO0Tl925yLmW3xZ9YYej7VOfFsEdx/rl+54rxEjOI4t425KXl7SmGarzld/gVlWcw/CM2WlqIZo9tvJWJqq8343gcwbqI67QMDDPRXsr8ZDQIrX3aE0gDI6U3Gu78wQfCGRmZ5r7GuwaoCLDK9ZMIinBAKfEegNKJBGGr+OZlmzQEipS6JVBjcYoN45pp8a1NAwKg8oPha9QFwNfiAkKcYXAnqOyYiaATTiTvFvnn4YYzN+1niCePlr6yE0YU8TvvqB8WwAcX4N241vi7xa1gg0K3rqNN5ZhuI62lGlTwJB4O23CukE9nzzEtggQLqOVngsHDmUD8Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llTFTs4snrpo2RDroSFgnmKC7Fvre8MEiKEYO0vHnIc=;
 b=DNhXLLELy3GvE82DHoQCZjwNZHnXctUhMvExykw5fIl3dnVlZ4/FZrjnh4mPu7F+/Kyy0jqO25qEXAU6fPODiuWio2zd2hqExFQe012jEuPDRZMkZ5nUvf9kS2yXXJz18YxvbFGEl+XtF48cFAAco5+8u7lOCyZGsgKjCTbalmY=
Received: from DM4PR03MB6189.namprd03.prod.outlook.com (2603:10b6:5:398::16)
 by CH3PR03MB7409.namprd03.prod.outlook.com (2603:10b6:610:195::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Tue, 6 Aug
 2024 00:56:49 +0000
Received: from DM4PR03MB6189.namprd03.prod.outlook.com
 ([fe80::8325:b2d4:bd74:219d]) by DM4PR03MB6189.namprd03.prod.outlook.com
 ([fe80::8325:b2d4:bd74:219d%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 00:56:48 +0000
From: Derek Cheng <derek.cheng@tw.synaptics.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marge Yang
	<Marge.Yang@tw.synaptics.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vincent Huang
	<Vincent.huang@tw.synaptics.com>, David Chiu <David.Chiu@tw.synaptics.com>,
	Sam Tsai <Sam.Tsai@synaptics.com>
Subject: RE: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value.
Thread-Topic: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value.
Thread-Index: AQHa5xKZMVGVJm73oEuFqopV36YGtLIY7I0AgAB73CA=
Date: Tue, 6 Aug 2024 00:56:48 +0000
Message-ID:
 <DM4PR03MB61893266BE3A5816EA41A8BCD4BF2@DM4PR03MB6189.namprd03.prod.outlook.com>
References: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>
 <ZrEMhJ0neCDx5hij@google.com>
In-Reply-To: <ZrEMhJ0neCDx5hij@google.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXGRsY2hlbmdcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jMDExNWU3ZS01MzhlLTExZWYtODNlMy01NGUxYWQ0OWE5NmNcYW1lLXRlc3RcYzAxMTVlODAtNTM4ZS0xMWVmLTgzZTMtNTRlMWFkNDlhOTZjYm9keS50eHQiIHN6PSIzMTMyIiB0PSIxMzM2NzM3OTQwNTQ4NDkyNjkiIGg9IkJVOUdNbk5naG91TFhuTGtiS0lXSUdBRkpUQT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tw.synaptics.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR03MB6189:EE_|CH3PR03MB7409:EE_
x-ms-office365-filtering-correlation-id: bdf60185-4f66-4b87-9819-08dcb5b2a6c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?k6od0YD+IA/e0FiiM9Dl5la9te/+/gg7Vwsrde9LFFnjlowT2W8n3QjQTw2p?=
 =?us-ascii?Q?yskbEO5zZsqiP0ZBo7XqXAbN9LgQhnS6aIIBm7Fk69mzitr+jRiYwckEhMV2?=
 =?us-ascii?Q?A4hYEyLeNqNcntOa2Ju1D3W8ryZO0aBEH09hwA4CCN3bNi7sBBkin6Fgr9G5?=
 =?us-ascii?Q?MtjRmU42RdImdM9cDlG8K2W/XTdHsNj5hONLWSDjuR+PXOC7s7G4vaf/8TVQ?=
 =?us-ascii?Q?dOiJQqr5FrFgjOTYngHW+jF5EFvrXysQzWuqiXYah1IKXRQIJtLWrg9ZpXv3?=
 =?us-ascii?Q?UwmTd7oZFzvY14nWLVN56MeqOunYU+haN9cMnvO0dnThqs2lLrCUBO2QcCGN?=
 =?us-ascii?Q?NdoZly8+lO0GYXt0Ri/9viF73p8+ZZGzLqzVYoaA90fWOEgktRiH+K+OvvGt?=
 =?us-ascii?Q?X3JiAQxoouZKUEW/PKEKshCQnH9Y8Zm5HIFKdPvUo5NiUFXs8FxRoGsep1zj?=
 =?us-ascii?Q?rNB31FeEBonL26C/1KRd2VJnD1YSqP+NH+mcUyekOHRyd4naCWuVLLpGMO1l?=
 =?us-ascii?Q?7FRxv0Aaji6yV1hzuy3HIfkUDWRTnj+s3d35WSDvI7fXEUQqfYi1CvYJ6DFA?=
 =?us-ascii?Q?RD4GZi6CfvEcLT6+J9asZyJ7mTleGhOvXr84x0HhalCzhOktjKZMH4cytHFy?=
 =?us-ascii?Q?kuOCRsWlx1L0UKbBetBRft45/hgc3dsU1nIOco1SDvoSaqY1HUbz3oDbJckN?=
 =?us-ascii?Q?ArgdiObfSYekzOrOXqKGfIEVa6SCQa4Mq6PbEvw3vvcEIjpED6wEt5thkSzq?=
 =?us-ascii?Q?r/Aq4F4IY08ytkHvxXvfFqCOceYhVfo/6MzgDM+O7zwo1NW/w3N2Ewbq21gW?=
 =?us-ascii?Q?NhafxlhGe0NpSxMyTq9bxNLC+1G34wVHnpCDO0NpILoIlYoPy2gbmLjy7zXb?=
 =?us-ascii?Q?sDj8rtyM4t70yq1PxZvJEeq8pVbDbtneBx+PScsC52xskkBuRLmYADVANtkC?=
 =?us-ascii?Q?Km1SyuFEKNIJc74yLfvYVXb6GDtP+pTcCzXwEyzp0vzkSyUhKPTg89QnkycL?=
 =?us-ascii?Q?G/89JplJsE5wkl2JRzH6xVuYxtBFnDcM32MXfGB9+zOBsN4PULXsY3YBpckj?=
 =?us-ascii?Q?24gqQ2HUC4N4/XF8p1CXT9l2iUzdYH/SkcLt27Bww7VOv7lpa4+fXsLLYJp+?=
 =?us-ascii?Q?5VQPuEaRR/0dRkeKYTmNqdNjkxb0VxupX9+kSkrwUe1kTtlC4vrzs7NgNFof?=
 =?us-ascii?Q?Ru87pDHe++QaZQbAvjy2wvfWWMWOf0r3o4Gw8ULSAzGCkZm0SqDsCX4gd4e7?=
 =?us-ascii?Q?Ji7HujbSDw9UpPj0KdjP5fQdQ9iPLhxe1XlNfFCqJqG/U1Q4VdCkkCJDuAn3?=
 =?us-ascii?Q?BoQRcZYaM5Y2zY/5l61T+FD81k9Em9MuRVBz1N6/C9/yKQqBUetZzewVSQWw?=
 =?us-ascii?Q?zRLAQQrgQ7qTF4A3tOhdfxqdzYxSpQYIJDR6L0/IWMvcmPijdQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6189.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ulPvwfmCzVjufZqI0u0/qUAX/76kh+bNQIDyayQ3jvO52P1MCKknhkagIGTe?=
 =?us-ascii?Q?j6Fw9+U3uluxZ46Lb6mZ87KseJj4zYduhqJShtkc5yQnmkvf4fZisFQAx90Z?=
 =?us-ascii?Q?QEZMf1eiuDPL/vt0xKPJy2Wnmc1UVcG8Jt7yuqMZtAQQkTqBTedCB12RcejY?=
 =?us-ascii?Q?8bSt8awkxamwLeP7PgruFW+vbyOvI6AOoPWBxW8uT7+JbfVSfx/QonCoW+8W?=
 =?us-ascii?Q?oaTeOGXE7TLxzQ5HCwdyVi4OS4qWNg1VFnfWiSqWPopcv+XIHSbHzeJosvuL?=
 =?us-ascii?Q?ZOX6gUplShkJ60yNAgdbO7Lh9SwTdkRjqD/oK4LuPeWVRQg9hco/B9xT0xSA?=
 =?us-ascii?Q?qfQET1JhPVxuEqsFTyK740vKzY39Ujl82911/xJPM3/rMOUa6rO7JktHNCIU?=
 =?us-ascii?Q?ulNGe8U3BcPNknozdTUPBT2BzKnxpf+IptLbJllh/uiUnNYoJ6zx/uQgDu+L?=
 =?us-ascii?Q?ZNOm/qHT349H7CWd1Ms6CBMvct+iu7//03Lhbul+3byv827EvMf0uvlag0vt?=
 =?us-ascii?Q?d4K7cXBXA7kCZM1KLPZ2NDVLF7uCZvJ1L2/KJZX75/VIu0SzszMtz3XEaGnD?=
 =?us-ascii?Q?V3mKrkhUgf5abTa58XIv5P4PTNSmuzP4Pg5fS2HpkzJ1UWlfW6Xt7y8KCl5y?=
 =?us-ascii?Q?+edbYlrOzPn1CoVrO/aNgrFPyQ1L5YxUGtfAhnQRR5FdHhxp9Slx088t8cpl?=
 =?us-ascii?Q?M6ryUsMAq5C8gR4QgRz185tNGMzOmhtwjM93oNPKm9kxButlYcWdeOIwUlU1?=
 =?us-ascii?Q?2vCMu5SvZzjXiwnPo292iuJQPVN71EnjAQVraWL/CgO+CLJgdestrA0wylda?=
 =?us-ascii?Q?QdFEs/PZQQGxvFdNNuz49l7O2T5tbGE2PNAhRviI/AsQuqyGIc/mHc8AsbGq?=
 =?us-ascii?Q?IyQGQVuCuOLOKwxF3r4gOhdWCuxLoWUYIkwKleKvlHMrSHiVFn1GDdVIRkMW?=
 =?us-ascii?Q?v1IxfGiXVMEFnVBf3i80el6pXE6jfRLlq/x6voL6JltrwjnVB36YKEMoHLBD?=
 =?us-ascii?Q?LnZ86KpsvQJD74JnpwibvyD3sVLBTUmSYYe4SmMRxtWLjHTcsbl7Xbr4IOx1?=
 =?us-ascii?Q?Lj8ITLwijZo3GIivvdRhx22lVAiznwEpa5z4pR5ti4ffEqp4TQYLtAOK/YLE?=
 =?us-ascii?Q?Uv1iSsosJ3oQJmnTYl8J7vxgYoDRF1eJ/cUhitgaHg6LS2C1seFm1Yx88SLQ?=
 =?us-ascii?Q?Qv93Z8DgXxcnwXwhjuQ57aB2q2IbRgi07juvmkpbZfLMkHs9+Jfzrelo1FLt?=
 =?us-ascii?Q?9hWhezVRr9noO2C7cHampctcoyQuUF4Q6Zll8Jj6KSqEK7FAZMM6hpkRCiV6?=
 =?us-ascii?Q?aGrb5lRuRZpODrwmA9f74TImNV/DJst7JkS0d4nm1hTIyrr3KDEPkJY5vlhx?=
 =?us-ascii?Q?3qFTArNmmUf/PxU7wKmFJqVCxDKrtc63tPuTWpoTrTQBIMm3aVy56G7mTOT0?=
 =?us-ascii?Q?+b6TnWkg2MTq79EeqQjXFPZj7MEs5DyF1j3xZ6NXRtclf8HrvJCU37YiYq/u?=
 =?us-ascii?Q?opLFD1iDuPL6OStznJA5ryNPPk8WOYIY/xeyH70n8548tdTBEyBRimQ/o0ka?=
 =?us-ascii?Q?5ufEwPp8XomTzu9hxGoL+4TKjnp754QvEdWzP3Yq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6189.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf60185-4f66-4b87-9819-08dcb5b2a6c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 00:56:48.6200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hoqlZ13Qrgr77CA1bqL6clZ2G1+eQtlH3XQpgtj8eEHvbXTMe/Xu0Y623w4mjbbIOIh6pqU/Q6ReWXwzWRRU8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7409

Thanks Dmitry.

Regards,
Derek
Synaptics

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
Sent: Tuesday, August 6, 2024 1:32 AM
To: Marge Yang <Marge.Yang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Vincent Huan=
g <Vincent.huang@tw.synaptics.com>; David Chiu <David.Chiu@tw.synaptics.com=
>; Derek Cheng <derek.cheng@tw.synaptics.com>; Sam Tsai <Sam.Tsai@synaptics=
.com>
Subject: Re: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value=
.

CAUTION: Email originated externally, do not click links or open attachment=
s unless you recognize the sender and know the content is safe.


On Mon, Aug 05, 2024 at 08:36:36AM +0000, Marge Yang wrote:
> Newer firmware allows to query touchpad resolution information by=20
> reading from resolution register.
> Presence of resolution register is signalled via bit
> 29 of the "register presence" register.
> On devices that lack this resolution register we fall back to using=20
> pitch and number of receivers data to calculate size of the sensor.
>
> RMI4 F12 will support to query DPM value on Touchpad.
> When TP firmware doesn't support to report logical and physical value=20
> within the Touchpad's HID report.
> We can directly query the DPM value through RMI.
>
> Signed-off-by: Marge Yang <marge.yang@tw.synaptics.com>
> Signed-off-by: Vincent Huang <Vincent.Huang@tw.synaptics.com>

Applied, thank you.

--
Dmitry

