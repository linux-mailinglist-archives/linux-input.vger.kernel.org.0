Return-Path: <linux-input+bounces-9220-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A8BA100FB
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 07:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8ACD16222B
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 06:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A663232;
	Tue, 14 Jan 2025 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="FoXmggiM"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94D233556
	for <linux-input@vger.kernel.org>; Tue, 14 Jan 2025 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736837502; cv=none; b=Efo1+e669V6G45MZqKdKCPoEC8DY0lRcAkYDABrmTxIv6dkdUg/CanXTkjoC5zd5EwbDgv35JUkRjHipKWsLRal4lA6QnC6WhFgsQS0+qj8xJ75kq0lp1q0758fGfwmVocZHhdM9PEiyN2L7UKsVHUMlA2f3Y403FoxvhNMp5S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736837502; c=relaxed/simple;
	bh=4+eFZE0SfaSAvEFEz26Zpd1eCR9Yd+De70yHTI9ZFlE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=q3eoduSZZo0H955zjOriE5NgWkGH2ky8LYAc9K6QseX1KPNcDVp0yFS6FX5pPQPmf+1jf3QuieeLZjmSuXLtUOWE/+sM4w4bFPjg8CWuyLlzASz/VHUb4fx5WeGHyeKKiCatP/+dMfjl4K9tEFqDMoZuNcq1xAjaFQYdbYs6hOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=FoXmggiM; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1736837499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+eFZE0SfaSAvEFEz26Zpd1eCR9Yd+De70yHTI9ZFlE=;
	b=FoXmggiMCOmLww5wkMVwdG9hCEJP0NY24UhoenOmJFJZWLQh0sfmrG7MDnjlC+tDbpLaoO
	wDzwimsPw7K9cHrOT6DsOWHphLywcKe53jCYvQK2REVK9/XSOr5Rpfvj/ronddIZY2izx2
	TIt2S7aH85JSg6rZhJ67WcvbxWAi2tM=
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-d0nk5mn-OKO1lJfA5o6I3g-2; Tue,
 14 Jan 2025 01:51:38 -0500
X-MC-Unique: d0nk5mn-OKO1lJfA5o6I3g-2
X-Mimecast-MFC-AGG-ID: d0nk5mn-OKO1lJfA5o6I3g
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by SA1PR84MB3142.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 06:51:36 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 06:51:36 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Jiri Kosina
	<jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>, Benjamin Tissoires
	<bentiss@kernel.org>, Jaroslav Kysela <perex@perex.cz>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] ALSA: usb-audio: Add quirk for Plantronics
 headsets to fix control names
Thread-Topic: [PATCH v3 2/2] ALSA: usb-audio: Add quirk for Plantronics
 headsets to fix control names
Thread-Index: AQHbZhY4/wzuYU1zMkGKMKog1jYtQrMV1Spg
Date: Tue, 14 Jan 2025 06:51:36 +0000
Message-ID: <EA2PR84MB3780AE30C0E4975748DF71838B182@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
 <20250113235212.78127-3-linuxhid@cosmicgizmosystems.com>
In-Reply-To: <20250113235212.78127-3-linuxhid@cosmicgizmosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|SA1PR84MB3142:EE_
x-ms-office365-filtering-correlation-id: 2f457386-449d-433c-2e2d-08dd3467e39c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?jj/ydX5NcUuHfYoohXJs19Lc9zuYdlrWxi0hChvpfDQ1jf+X6Rq8RrSyxoSV?=
 =?us-ascii?Q?YZUkum2C1GEKW7cQW09RkKeh52xnE3oDNMn56zouRLjdbsK1LoMr6irn4vkY?=
 =?us-ascii?Q?SICp1GD1CSUhq16uqpn8g46H6a6EVXSbgc/HhKR62C2mJjs2B92XV6gF4hYZ?=
 =?us-ascii?Q?KnZkukp8umDh92w6fvMW0Knm9V/sv1niStgG05/QidKEPHmKdCPQQOwHG6vK?=
 =?us-ascii?Q?pvJkH4zKRfCrUxzjFcGgVYvjbfG0Xe8S2WVfd+NS5HNFYO4ggxm211CsJlO7?=
 =?us-ascii?Q?lwEMakj8fYBnAbLqMjUKahJSaxA9U2IgCIBogvHBKYjMOf9hI0wxu0wmYTVt?=
 =?us-ascii?Q?xwHoDfLiFb2hElxeiJ0oRhTcHk1/v9rFzmV/aGKnjPav5pI7AMJefe4ulUvR?=
 =?us-ascii?Q?VJd5402dB//De8rcFfl9d4g/dmvOA2YPeFI5sROy7bcf+NEb3LqPhT+vZcJ4?=
 =?us-ascii?Q?tJkKknwud0Y3d09bVL3rLSWXCmzYDn6sQwVEGqam6PiY2IqVz2zTSGkwjcW9?=
 =?us-ascii?Q?vP3evsnVmPcsmqYfvv5p85iAHyIVX8XRv4EUF8D91meCsgMkFl53Q6x5cncv?=
 =?us-ascii?Q?w1qmpWwttoynGDnQeaXGo3bxpfCkgpwW+JWODG8n6hx369JuVCkbddWdrfK4?=
 =?us-ascii?Q?vMSxa/zlNmkq5q6MoVK8WX+/MjVVhXNJeST07WGugQDOSOCnXcp1yre+nl1V?=
 =?us-ascii?Q?LTuzLUq75TNJO1zCkobIv1uKWvMmG3Xu73qood6p3ZgHI62NkS5V7FXmpJu/?=
 =?us-ascii?Q?H3Af25P+j7YTetIYGNZxRCfqqPt9fHpwzXWD2AOQ2bRFNWDjOqugv7ZkjrSH?=
 =?us-ascii?Q?A1zTaKLkdXa4opGzsuEYW1eufDsYiq9IU2ozOgNdSmxsYmeJkEO7mzTaK7ZC?=
 =?us-ascii?Q?Vm5e+ZzIlCKdmTnHWEBsidemyNqbZXFdywoJusVgBLCkSNl+fo09BIRPjZFQ?=
 =?us-ascii?Q?D7UcmHr58Qbp2SuJ89FkG+dGMnAojdkqXQbL8hMyMrfNf1uIn4L9PFVawx3A?=
 =?us-ascii?Q?vevgjA6poN2DjemmYFBL+GSv48G+px2QnKM+7AfjP2cyCN2/A5KdAzQx9OaJ?=
 =?us-ascii?Q?6bApZ3YEH7mbzfWt8lGCwvr/pd/xUFXJcAPzHEaajq2abQqL8N+6OHhfMO/e?=
 =?us-ascii?Q?vRXX6lpW/RzC4WtTLypD5fx8rV6bgU4/Cezl0U1ER6bepgfGPCnUxTm2EboB?=
 =?us-ascii?Q?cGl/Unnn+w7QREEBWZCGWBGDMM6ZVsDjaQP70TMwGtGY7O3EVwNjaUXwq4gp?=
 =?us-ascii?Q?pkmTFjtzEwsOJ7X7tslBCgSrSVxpH7eV6FQdDorkv9aOBb8RMMhOdyTB7hXN?=
 =?us-ascii?Q?dtlpTW9JawlMkqctW3ijy8kJSW2aR6oF8RJFLZVA1pKGeky2oWtNkMUJAWJI?=
 =?us-ascii?Q?wT3qxutn+nDO3sbakIuc02HVaNL0ogJyL2Yo6Zm5rz4kVZWgEWhqZx6GjDX8?=
 =?us-ascii?Q?XsrU6DVAw+sqJBz4NJTc56rCdttxwhTH?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?02f8b2mQPcC+ZD4U3cQPf3QzzKQDKnet1FwiboUhqi76ZhsosqPl7+UeridQ?=
 =?us-ascii?Q?WU7bVAOhaapeCaT1qx8VHGmlJ14RQNhUvN+yuI899gBZNMrhPLqf9FM788yO?=
 =?us-ascii?Q?qfM3UM09LzZK0g3ZCoTg9et5hAeFB7Vii5zY3nFczlDggsJOnaM4Lzra6xhB?=
 =?us-ascii?Q?Q5Z1RwHKy5cC0ILzfNwk6FJxyljD1qgdHmAmXnLjbpuR+KW1mJkU8UxQw4fF?=
 =?us-ascii?Q?TP8sMQt5VMrfXo20I3juUnzIJ4CDN6svK+zizHb0XMbMa6RfcE5nGFV0G0i8?=
 =?us-ascii?Q?X894S01zK/IOR8TJFnuDTda9vWlkyTtTX62RXCdZkYP4hdjQfxL2LfCW5wth?=
 =?us-ascii?Q?kJRR4YxTzwKqtnFJIgwZD+0FfQhlOlehxS4IQJIhoXcC+iilzaKOnCgZIz/7?=
 =?us-ascii?Q?qNPqIkneEKHGHPaboZfT0QQ/wF+i11Mi4n/eKzEuz2WS47ZhW3lcn6XM9raO?=
 =?us-ascii?Q?Plib6QzKkjpzXeKuRAP4Q0k4VgZoeUfWyD+2SK7SITtmtwXGOOP3/r/TgLN4?=
 =?us-ascii?Q?YCI3Su3L0n9gakSiWb8MpUo2b8WE9JdxCfNtxacCbCXo0ZxImyF6zJ3YN/CS?=
 =?us-ascii?Q?1s7x9YmD/og490TserECXwr731m6odTXuc01PiC0iREtZeW2hb2VbuVzXSMH?=
 =?us-ascii?Q?0Z+Plf3qi4BlmIRLZf0lPUQFt8EdleXdp5GpKWamtMC6IabejFlogL3CfJ9t?=
 =?us-ascii?Q?27RKRuQlLIKvXnRnp19nzXC4j89/6rFqSrhFfwvxmbgUmoSCFMFCSikIvVrV?=
 =?us-ascii?Q?oeTxMtsCB0OJTTMpf/di5aNSQMOPSSfO8Fx0zuYwqAJ8yn9brIBgydSwKDyi?=
 =?us-ascii?Q?F0te6y2PuF9588DxEcaMR/0GtD4fynYfLi8Njy0nDNWlFOkGqnCF/axiwVvb?=
 =?us-ascii?Q?JIyAZi/c5bsdm8YjHdyqxY6PLtOc/CkoNUipL8kKU5VaWG5E6yKHCgXmgMpV?=
 =?us-ascii?Q?0AWFfJUrGMbfVhxV2GW/DSkHR1jUl8A8LNxw/6qo+INinGIPNonQyYkU6fL9?=
 =?us-ascii?Q?oVUu5Z5vwSINse96QEkVEwFHFzPBpVy3kQhKAomHWYzUcawuzt6KTBTcC8K+?=
 =?us-ascii?Q?IX3sPkrhgmh+k6NmyRckodhkNZjhNeMzEDQpCE2Y98WBIOCQeukdHDwTIGqc?=
 =?us-ascii?Q?+J0+/b4hexyet5K/VlHCCiSQJ5KFWa4rChM+xLQ4QV1PfHmVJeUC8odWFxdW?=
 =?us-ascii?Q?5FPGVRrYeQbASnoAunA19Mc+Gyyj8+UhtRcDLF4M32Wkt3ik/Q4YMvXyt1gL?=
 =?us-ascii?Q?OOIDDo+OtX3W7XRZh3eBCBMTpTgUTYsJ3y84HBcMJdtKwKX2/iK2DvLI6UCu?=
 =?us-ascii?Q?5hFL3/gYt7/buEh9xkm0BPVQE51vPKOsGZmhBiyZCHXMhV+FMlSHbZ7WsylB?=
 =?us-ascii?Q?OAA90mDUv59OO5l5QtXJDcVv5MhVlahkVmtYhyYW3fkw0X4z8cckIODYfjrX?=
 =?us-ascii?Q?Y4/SoocbN439XLp070km8QHqILKkrUvFDn9q8TK4WLFM+lwPr/9OKfVyI9iM?=
 =?us-ascii?Q?Id+aspw7GP88Q2ooX1hMBugoQPouNUUaYW5oluZu/rYyXtQL8GHjIvMqTdDQ?=
 =?us-ascii?Q?D+1P7+cfx5XxzL+zzls=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f457386-449d-433c-2e2d-08dd3467e39c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 06:51:36.1079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltOl6tRVe9MnAE6MMr1vEZX/5TzEUQ90TbYOkwWEcUQsTSljqzY03BFYeNFNvtNldQXqyklIkCQK16GN9/VQpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR84MB3142
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WTkIK-lcZQwVxQayZXRcSqM3foKpyy5rTJjOapAwPEE_1736837497
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Wade Wang <wade.wang@hp.com>


