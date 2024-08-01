Return-Path: <linux-input+bounces-5269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C44CC9448D6
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 11:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFB01C20C0D
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 09:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A63416FF48;
	Thu,  1 Aug 2024 09:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="OkrFizlw"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2120.outbound.protection.outlook.com [40.107.244.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391B1EB4BD;
	Thu,  1 Aug 2024 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505974; cv=fail; b=ZeLeGERpomkm4kUCEo4JQiYsCXOJfHGbnA6Bph8HmxerZYJCq06iTjE+lu0LtkbZufiD5FfCZMDLjqxcrG8cneQCtRTyhLmtPYM84E0jzXohsZ8J5fLqmA1f98qEmkw8OcI/mfRMTVpAINo9q+yU16ylVD6CGvhaPWHr2iu9G+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505974; c=relaxed/simple;
	bh=+5rjNoMCMOUjvz0P5fMzMDayFRUWn4TDWZaOtvgZFDk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gVpQMW8ciIyTEBf3cC1T4IG/ZWVWUndla/oSlg1Q7wblAkLMNsTkQriqJQKdtgSBxIr2Q62cSY7q1jjrFtznC3dml5qty2puXypNmGrvRk/2DWaLpxcB9WzaTtUJmflOHB3W1CxDq3xN2G6Gew0xcMpsbrXWgl4g8+wOPH0mGu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tw.synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b=OkrFizlw; arc=fail smtp.client-ip=40.107.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tw.synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxnbVMlrpIUXoe+1YfjLmsaAdOC8LtJwpOeF8wuG5rrR8SSFVzb96ZxxF1UMZj0LQwyDvujHD8bKckjJUxXl67+vZQviZXJgFewcyu1r4/+eewYpovlxn+56pCLRsnIWQTrrcebT2E8TZhjE1jQ/G0WRDFMcwjworQ/a0qIv0sitYS7HoHxuZExxh0nnKkRuV7jntSQxJZ3xsUz/kijdLL5nnNEZtUHSeezbgPzE/++hGes+r3wxx0UDfV+sjNl17t5ip/V3JxbaQwkLFlG6XNDBDSYi2RaTZ6OoTNo+mHFE0+tVxRunH6QZb8xMUncqvU6fk44NGlBC/X6w0SeqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZqFt4Jal4nDflsgGD746ZZN4jNke5Bexf4GeLhJetg=;
 b=y/65M4lhSpTNJQ8tZwCii9tiP32od78c2uMCB99xMAVuINwd2OUZZlWtfylimXeoSPzDWCH5IvU7e3/slxnjaPHF4vyV4vai9VkJt1qIXT+IiGbdVaKZW59EZlbqf742beMjifXypNeH0JRPmkIvfxPIvbSF4XmUYVhfkuKEcRGFTso0e5UXHlaUNCcDteZ45dC5PK2TgcPwcz27E0K56m2E9wXYkbLyB0M9hshavCFhgf1JZuJJMBR4xRdCH9KPrf0cpMquV5NE6lhYSTWiLbeLud4sP+ha4j+fkwAbCHBXoOLU7AXUM5CGv5TYu093kO0Et29ChAulZhlIe6dKGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZqFt4Jal4nDflsgGD746ZZN4jNke5Bexf4GeLhJetg=;
 b=OkrFizlwJlgUrCncHA0ZdL9wgd80l9NLni5tSWlhrNPEcRj5lf0kW/qDaywZDXoSwqJFw87058EgQUVrJrjIH+gidzPLuHTvZKdMNJQgmq8kS7SQ5lhEFkAdO19jjA57hF+JogclVZ7SotYEDE2v85DOTFu06cO6btjdnOqomrI=
Received: from MW4PR03MB6651.namprd03.prod.outlook.com (2603:10b6:303:12e::17)
 by PH0PR03MB6544.namprd03.prod.outlook.com (2603:10b6:510:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:52:48 +0000
Received: from MW4PR03MB6651.namprd03.prod.outlook.com
 ([fe80::593f:d937:950:4a0d]) by MW4PR03MB6651.namprd03.prod.outlook.com
 ([fe80::593f:d937:950:4a0d%5]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 09:52:48 +0000
From: Marge Yang <Marge.Yang@tw.synaptics.com>
To: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, Kevin Chu
	<kevin.chu@tw.synaptics.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Cheng
	<derek.cheng@tw.synaptics.com>, David Chiu <David.Chiu@tw.synaptics.com>,
	Vincent Huang <Vincent.huang@tw.synaptics.com>, Sam Tsai
	<Sam.Tsai@synaptics.com>, Vincent Tang <Vincent.Tang@synaptics.com>
Subject: RE: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value.
Thread-Topic: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value.
Thread-Index: AQHaerdNsbe6Kfbtv0m/G8A2qzbufLIRQAgQgAAY5aCAAKeIgIAA+mIA
Date: Thu, 1 Aug 2024 09:52:48 +0000
Message-ID:
 <MW4PR03MB6651CCE6D296062CFAE20845A3B22@MW4PR03MB6651.namprd03.prod.outlook.com>
References: <20240320111058.601156-1-marge.yang@tw.synaptics.com>
 <MW4PR03MB6651C14EBEE7D8B56C82F1EFA3B12@MW4PR03MB6651.namprd03.prod.outlook.com>
 <DM4PR03MB599884A63173E935FAF7EE7FCFB12@DM4PR03MB5998.namprd03.prod.outlook.com>
 <ZqqIL6cmqT4ZrqBO@google.com>
In-Reply-To: <ZqqIL6cmqT4ZrqBO@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXG15YW5nXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctY2Q4NTQyZDAtNGZlYi0xMWVmLTlmZmYtMjhjNWQyZjQ5MmI4XGFtZS10ZXN0XGNkODU0MmQyLTRmZWItMTFlZi05ZmZmLTI4YzVkMmY0OTJiOGJvZHkudHh0IiBzej0iMTM5NDYiIHQ9IjEzMzY2OTc5NTY2NTg1MTc3OCIgaD0iM3FQZk9oYmlsOW1EV1ZnV3pPTndPZFlmZGlRPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tw.synaptics.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR03MB6651:EE_|PH0PR03MB6544:EE_
x-ms-office365-filtering-correlation-id: b8ffc16f-adef-4d8e-da83-08dcb20fb379
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hUNEOI2+1X0+T+o4emaX8kYupDes2btQFND/Y8jcP/JplAzX0sThXn2X+dUi?=
 =?us-ascii?Q?a+euj/X9plHYlFrKfhEXJAHk+r6qW72xKd1Hk6/PgyShh6eKQxCp8ubU+GB+?=
 =?us-ascii?Q?O1l7VpVht3sUM+hGW85AxhStZ/CdjPk4lUI8ht7KOJegsILIxpqTWZPZo/45?=
 =?us-ascii?Q?irXpD/iMq5oi+Y1RLDAlcDmsNRyA8apTqePy7ebCeo6Ekk3wvq3XRPdWA/+d?=
 =?us-ascii?Q?b6hE5Jr3u3I0sPFZyyPU6E5RVu80ZFte8MnBkKt1LEWvtOUPUb8S3YEMElEg?=
 =?us-ascii?Q?KiCcNwg9xeHVjNBY8Cg0z2pam4k+f3at73GJEXTrduhGketxgKMN8iEJE50i?=
 =?us-ascii?Q?pyab5zyGB2tuBib7CiUXzleuwLEbpTCX7NEU43xzzVBmWwpPB/5ebQV80iDO?=
 =?us-ascii?Q?2EFYyckGuIlSYZ/KYMmY+WD3m0mfcfFSFH5NfT9+k4auXyCZz4Dv/m8FcHFo?=
 =?us-ascii?Q?jCAdd+lo4IB0I+lQNwCieA3nTywIi8lsO4mox6LXUUvJAg+/kIMDfwj7+4d9?=
 =?us-ascii?Q?irIrHHtKt4Si+Jq3dif6ynrMlqxzLuRGn8/1tXd66FLLTfkhJ0yEx4qjlX1m?=
 =?us-ascii?Q?m+v6ek/z793TYCvIY7/r73Hj9f82ZcmAF5VBlAFmc/sqbcoLpissz1QCERQm?=
 =?us-ascii?Q?bm5CLzZ0DE4OJnphfMVkQLcQ4ZO0624l8JsiAVtGn1y9NzSa3uQI69wSAsaa?=
 =?us-ascii?Q?Ecpp6b4G8b3F4WGwSLvJDWVYtL1Xvco3mGPy0TAMldW2sAarD3ymLOWcihD0?=
 =?us-ascii?Q?TSAQQ2IO5+HxKd9gAoiyy0hlpt2GRFmYxgU1xb7HlTTq20NH0Iao/io+le5X?=
 =?us-ascii?Q?vIv3NepkydCRRfyqqWJ6yUrw7mCSofF298U+09WXeArOmhCV2WhYEB4OYi8n?=
 =?us-ascii?Q?DlKsSU71/9xRn9qYLTlbwXEzQrol3zlIkvfQXJ4MLDMcYyz1chR5s3v8Wdmw?=
 =?us-ascii?Q?DFWgGlA1hBios0GE6xwbVClTlJAJBHypYmQhvonrWGojxLkcGIkkMb1ROQ7j?=
 =?us-ascii?Q?SaJ3Ku98nRNs6mdIs6bmD1a/Uamveik5RnBRv99UYZ7Bk5N5v/UnUZEKUd6v?=
 =?us-ascii?Q?sQuIgpeV8gyMockao8avvF6SYweMesTcwsNvdIbgiTdUqh5M9lhtNpYdrLvg?=
 =?us-ascii?Q?LOfu6TaAXVVgxlk7Qvf+wHB5IblU6Aoua7XgTynBgnukLzDbsEcztlF8D1Tn?=
 =?us-ascii?Q?Rw8U/FNmPn8uAI/omcRRun1tfFelNYL8zb8CCMpTiVJ1gar1TQ2qet2hzCBc?=
 =?us-ascii?Q?5+utU3gIm17Non4R5VMLz2e+B8LmCV9ZeukZjxnLxiJtbt/U1/+vPLaXmq/z?=
 =?us-ascii?Q?bJCA9zY/sSGALVBd5P0sfVxPRNlvlWLke5adh1zM+tLV5PnKklv7wey0FVfE?=
 =?us-ascii?Q?1MpfL1SmJDFvIDPlp5tfXoxejqMtxAO3TEe+1xmH/47jkAxotw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6651.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DnQHp4+luhPIm/wpJbQmRGzRqIp63LtCLFn97kp0WVvGr9UAN7VmsBrOp0yD?=
 =?us-ascii?Q?QL1eq3B8mUksNGN1kpv7FKIIibHIQmy7vmW6VfdvP91iS8cmOiO1tgX25ivC?=
 =?us-ascii?Q?CFvF7+4sqQNOKSpdDvvW/QUdEO/hhDmkr5VmOkU04TsULpomEwM8awlvg7+5?=
 =?us-ascii?Q?4+jvd3ppzZl/Yt6TDYtBxUAVVy3jrHaBJ/oYKcigOuANesASrT97DX23ysd9?=
 =?us-ascii?Q?NBqRnn/zUYsl0vOwdwOmIVCKSs2syiR9qFF54GroUqZ1ET36t5bb+46Z7g8P?=
 =?us-ascii?Q?wUoMT3pRypX8s8fbK3QK3h38vYkpCJjqdRagsHHedyvyo4DqktbeNl1vWrbq?=
 =?us-ascii?Q?KEi8v61KLaRDMRbkVNkIRQW/oyx/7SyW8YF624UOXh9Ckzxrxl7QO7hx3yvH?=
 =?us-ascii?Q?EvYQ804op4CBSceF6FPhNcX7yNt0UARokJeOkQ7U9Fm9ehDA422SnwvDTPd7?=
 =?us-ascii?Q?xm/cHtEMxNz2150kBVWxE9H/jvLTeyqQY7CvB1Ar6TJua3Su7i13KPwkqZgw?=
 =?us-ascii?Q?Dc7OHeowZzCytWnB2dw1+n/ABRd81+A/8Bpo6qlU+ZTyFJ4r5W4dx+QUxKg4?=
 =?us-ascii?Q?+yALYkJ7VZEvdGkmQ50A+hs4dGIhbBGTNJxF1K+F1MQFPBOG9Jn6zsMPYXN0?=
 =?us-ascii?Q?2V40Vj72mmlb4UGnYEo55AmVfhwEo+chQwjlU9+llUAvLFJSzvEYFXXWnPa6?=
 =?us-ascii?Q?WZntk4kYEFbVK1YoZj7h+5qEUrUF7McTVCHNzQ16S1S79cgsoB2nY7gDruqc?=
 =?us-ascii?Q?ysUjOrJIlX0D8MvaNRgwZ+cOm+3XSX48i1czZrdCY+4Rl5BPKN5dVJsfLLEG?=
 =?us-ascii?Q?mqsxSckglqzuVG9ONdH9TgYod9L78QmAhNoCs56x1jgvR8SiYmGk3HPphvig?=
 =?us-ascii?Q?fPGazxiX+1kJVaBsVOkcbeaZsmkYSMSiJd1fOlikcHromuQGbl52k1xnvruI?=
 =?us-ascii?Q?lvSqdF3hLzAup3tudgpBl8xlpf9hUC8Yb4kTCwpb5wbZc045kQtsDlRh4SQ/?=
 =?us-ascii?Q?3AXaQEK6ZiijAVoQaaHierB+FfvcQ7f0nEG88crruqEqHu1t1hHCHYuz34EE?=
 =?us-ascii?Q?yqgCXEMkHDWhjR/+M/v/ZoheSsj4JoVGrDPnWg0xIWYK4JQmJ/2J0ZiQFuiy?=
 =?us-ascii?Q?88DnJlmVfbia6G4I3g4t99LeawzLPsJGSlmQgwtRZphQIHb08BD9qMPt19Yw?=
 =?us-ascii?Q?JDg8sopHido4FUoQ1e3QW05ou+ROUdUiTV9V0Y5PLwroE0ZvBIMAzkbXBBdA?=
 =?us-ascii?Q?I8Mz5BFEIB3fBdo974qRQ1HxZw0vQwJCBaW44VXxteivIEAM/SHRlSkNZoFa?=
 =?us-ascii?Q?bP5CZKcLSNcRpDf0RROwf4cRYfVav36K9Lz6UG0ip4XhYy8MNdZOn+XvSsSx?=
 =?us-ascii?Q?KK/XAWS+G7mmIAvyuQ0+c2sWBEA7ky2jMi5g0rfZoaLCw62w9k+VYDooEGH6?=
 =?us-ascii?Q?m4WU2tEC82Gdz4XpMG98+xRMCCpvBjU63CxKBoprObMlsxgVxA9FRLzNiwts?=
 =?us-ascii?Q?WtvKd45OqMvAV1JHhdKdi1pt9BirgXf/8BXcyMdHXCiJKmZCnwNN09dcTBSH?=
 =?us-ascii?Q?q//YlEnYzjKVX/+RXfA=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6651.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ffc16f-adef-4d8e-da83-08dcb20fb379
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 09:52:48.4857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U1D+R6yH4Y0i00XHBUQ9oy33PJgpndvjLi3c2tdEZMQ/m4J3yAZeE7NR/aSaqp8ETZ+5moiFCSf8r5P/hqcAFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6544

Hi Dmitry,
	Please help to check the comment.

Thanks
Marge Yang

-----Original Message-----
From: dmitry.torokhov@gmail.com <dmitry.torokhov@gmail.com>=20
Sent: Thursday, August 1, 2024 2:54 AM
To: Kevin Chu <kevin.chu@tw.synaptics.com>
Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Marge Yang <=
Marge.Yang@tw.synaptics.com>; Derek Cheng <derek.cheng@tw.synaptics.com>; D=
avid Chiu <David.Chiu@tw.synaptics.com>; Vincent Huang <Vincent.huang@tw.sy=
naptics.com>; Sam Tsai <Sam.Tsai@synaptics.com>; Vincent Tang <Vincent.Tang=
@synaptics.com>
Subject: Re: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value=
.

CAUTION: Email originated externally, do not click links or open attachment=
s unless you recognize the sender and know the content is safe.


Hi Kevin,

On Wed, Jul 31, 2024 at 09:17:56AM +0000, Kevin Chu wrote:
> Hi Dmitry and the Linux Input/Kernel Team,
>
>   I hope this email finds you well. I'm reaching out regarding our
>   kernel code that has been awaiting review for over a quarter now.
>
>   Given the extended period without review, it's likely that some gaps
>   or inconsistencies have developed in our code base. To ensure a
>   smooth and productive review process, we'd like to address any
>   potential issues proactively.
>
>   Could you please provide some guidance or hints on areas we should
>   focus on before submitting for formal review? Your expertise would
>   be invaluable in helping us prepare effectively.
>

There was nothing wrong with patch submission. If you see something stuck p=
lease do not hesitate poking me.

A couple of questions about the patch below though:

> Thanks
> Kevin
>
> -----Original Message-----
> From: Marge Yang <marge.yang@tw.synaptics.com>
> Sent: Wednesday, March 20, 2024 7:11 PM
> To: dmitry.torokhov@gmail.com; linux-input@vger.kernel.org;=20
> linux-kernel@vger.kernel.org; Marge Yang <Marge.Yang@tw.synaptics.com>
> Cc: David Chiu <David.Chiu@tw.synaptics.com>; Derek Cheng=20
> <derek.cheng@tw.synaptics.com>; Sam Tsai <Sam.Tsai@synaptics.com>;=20
> Vincent Huang <Vincent.huang@tw.synaptics.com>; Vincent Huang=20
> <Vincent.huang@tw.synaptics.com>
> Subject: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value.
>
> RMI4 F12 will support to query DPM value on Touchpad.
> When TP firmware doesn't support to report logical and physical value wit=
hin the Touchpad's HID report, We can directly query the DPM value through =
RMI.

It seems to me the logic is inverted, if there is resolution register the n=
ew code will query it directly, otherwise it will try to get it from the su=
bpacket data. Is it intentional? Or did I parse it incorrectly?
[Marge 08/01]
Previously, we obtained this information by querying subpacket data. Howeve=
r, when the "Query DPM" feature is present, querying subpacket data may bec=
ome unreliable, leading to inconsistencies in the pointing speed.

This also does not appear to be tied to the HID transport but rather generi=
c RMI4 code. Did I miss the connection?
[Marge 08/01]
This change applies to generic RMI4 code and is not related to HID transpor=
t.
>
> Signed-off-by: Marge Yang <marge.yang@tw.synaptics.com>
> Signed-off-by: Vincent Huang <Vincent.Huang@tw.synaptics.com>
> ---
>  drivers/input/rmi4/rmi_f12.c | 41=20
> +++++++++++++++++++++++++++++++----------
>  1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/input/rmi4/rmi_f12.c=20
> b/drivers/input/rmi4/rmi_f12.c index 7e97944..6a7a17d 100644
> --- a/drivers/input/rmi4/rmi_f12.c
> +++ b/drivers/input/rmi4/rmi_f12.c
> @@ -24,6 +24,7 @@ enum rmi_f12_object_type {  };
>
>  #define F12_DATA1_BYTES_PER_OBJ                      8
> +#define RMI_QUERY_DPM_IN_PRESENSE_BIT          29

Why "BIT"? Should it be called RMI_F12_RESOLUTION_REG or similar?
[Marge 08/01]
The "QUERY DPM" feature is the 29th bit in the F12 2D QUERY Presence regist=
er.=20
By checking this bit, we can determine whether certain features are support=
ed.=20
I will rename it from "RMI_QUERY_DPM_IN_PRESENCE_BIT" to "RMI_F12_QUERY_RES=
OLUTION_REG".

>
>  struct f12_data {
>       struct rmi_2d_sensor sensor;
> @@ -73,6 +74,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *=
f12)
>       int pitch_y =3D 0;
>       int rx_receivers =3D 0;
>       int tx_receivers =3D 0;
> +     u16 query_dpm_addr =3D 0;
> +     int dpm_resolution =3D 0;
>
>       item =3D rmi_get_register_desc_item(&f12->control_reg_desc, 8);
>       if (!item) {
> @@ -122,18 +125,36 @@ static int rmi_f12_read_sensor_tuning(struct f12_da=
ta *f12)
>               offset +=3D 4;
>       }
>
> -     if (rmi_register_desc_has_subpacket(item, 3)) {
> -             rx_receivers =3D buf[offset];
> -             tx_receivers =3D buf[offset + 1];
> -             offset +=3D 2;
> -     }
> +     // Only supports to query DPM value on RMI F12.

I am unsure what this comment means... We are in F12 code, so what does "on=
ly" mean here?
[Marge 08/01]
The main point is to emphasize the new approach that applies when the "quer=
y DPM" feature is present.
New comment:
Use the Query DPM feature when the "query resolution register" exists.

> +     item =3D rmi_get_register_desc_item(&f12->query_reg_desc, RMI_QUERY=
_DPM_IN_PRESENSE_BIT);
> +     if (item) {
> +             offset =3D rmi_register_desc_calc_reg_offset(&f12->query_re=
g_desc,
> +                     RMI_QUERY_DPM_IN_PRESENSE_BIT);
> +             query_dpm_addr =3D fn->fd.query_base_addr + offset;
> +             ret =3D rmi_read(fn->rmi_dev, query_dpm_addr, buf);
> +             if (ret < 0) {
> +                     dev_err(&fn->dev, "Failed to read DPM value: %d\n",=
 ret);
> +                     return -ENODEV;
> +             }
> +             dpm_resolution =3D buf[0];
> +
> +             sensor->x_mm =3D sensor->max_x / dpm_resolution;
> +             sensor->y_mm =3D sensor->max_y / dpm_resolution;
> +     } else {
> +             if (rmi_register_desc_has_subpacket(item, 3)) {
> +                     rx_receivers =3D buf[offset];
> +                     tx_receivers =3D buf[offset + 1];
> +                     offset +=3D 2;
> +             }
>
> -     /* Skip over sensor flags */
> -     if (rmi_register_desc_has_subpacket(item, 4))
> -             offset +=3D 1;
> +             /* Skip over sensor flags */
> +             if (rmi_register_desc_has_subpacket(item, 4))
> +                     offset +=3D 1;
> +
> +             sensor->x_mm =3D (pitch_x * rx_receivers) >> 12;
> +             sensor->y_mm =3D (pitch_y * tx_receivers) >> 12;
> +     }
>
> -     sensor->x_mm =3D (pitch_x * rx_receivers) >> 12;
> -     sensor->y_mm =3D (pitch_y * tx_receivers) >> 12;
>
>       rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s: x_mm: %d y_mm: %d\n", __func__=
,
>               sensor->x_mm, sensor->y_mm);
> --
> 2.7.4
>

Thanks.

--
Dmitry

