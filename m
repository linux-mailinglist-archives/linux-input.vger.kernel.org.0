Return-Path: <linux-input+bounces-10546-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E7FA4F56A
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 04:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0706F1890161
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 03:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9E73A8F7;
	Wed,  5 Mar 2025 03:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="s7r4Pduj"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010004.outbound.protection.outlook.com [52.103.68.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89B32E336F;
	Wed,  5 Mar 2025 03:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741145602; cv=fail; b=AKeqNj86iqG+dbzAYJW7175vuLdmO7QRmEfvBqhzRye7d/tqEhBjU//Qe/T7+9QjA8MEAoQD88Bu/+eLrZcJTbGPlE2DiJ3b/bwqUg5D23fjbPzJU9cc8dlPARj1C8+nCuqUwiOPwJU+2R6j16iaoDaqY6YSVw11SHTYPk2hHVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741145602; c=relaxed/simple;
	bh=L/32wwKMFoSfwKf1/6ZN07L5ZSIA3iEY+BOVUhzT/dw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D7p14U/hvVcPh9fB2/orm/NwEIzHBPSsOPLb+4bIhWn3cZLxCSXoEMvOQoVuXkOH7t9uATwfDVoiJHSqZauQI9PhkqzTafby5lKZ19+CI7Axl3XcgQXRjEbIuK6ewGtI24I9ml36wRaJUOSz88ZWnzr5vn/uuWzYEzoMiAEdPn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=s7r4Pduj; arc=fail smtp.client-ip=52.103.68.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au17L6qd9gxtvqumKWOWru569cv7QkFw6SAv3BdM9frRHiiNrj/CggG8JQ0gb0oQ0P/AI5xABgqkqiS+6H4OXg5o8oJrEjeSVAuJBQJDJ2wChwsra+XS/wFPM3ToU6dkquJAoy/Uo/HLUoJrSupe4vZsuoVoDM7KUVuUrbsprKjIrU3yfx14GjevTRScRU1Cf7PpuX0j3ZEwHq4eX05RI+W2AG6+w/X5nH259vAFg3yc5EZNkAl9GtppU3twJ9+diocd+sbdf4/bB6RWR2zAyhDa55GSINzTDZ8D1ll/PiNTt165YB2JDjKqWkwS6OPBkSWz7eIxYmYubFGwh4xZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/32wwKMFoSfwKf1/6ZN07L5ZSIA3iEY+BOVUhzT/dw=;
 b=tx3qkgMb20pWeSEb+MdCIJFYKkeY9Qkql8IkWj33JIL0HZGt6TLCQ20+NBu+DQfdGzl3bAoYzMityH+4TCNAbKSFvVKYgZ+PqIakB2hDZQM8xFnR4GVZDDoRXV+lB5l7BeCqSXH3Jwco69BUASnsobtnkaApICLoDpsITR0pvqRUJlFhv9fye82i9zbig6sotVWjYEmmTtT+yw70p9OFhziZY0ITRDAFmhRjYn0ofcWizO6k8yjEYyXV87XemmrlR8mUdkwO0SNZXi/hYLe6DwnktRvDpflFSmYhku7+HWIk+rCGjz3BwsiHbc31a3/5/IvzT80m+50hQjPOJuCikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/32wwKMFoSfwKf1/6ZN07L5ZSIA3iEY+BOVUhzT/dw=;
 b=s7r4PdujTfefEtpOtLq/sOdMhecDZxoCbnmHzzuu45uQNivJg3gIVBZLUWQjmGfVVvx9FM3e+8UD6TLb4L4rm90Q1fa6Uq81RXzTchaWGhaDv+0St4khD9jq8XN2/jBGjGhgpOjQ44cG9CPck/D5TrOqlAldIbPITw1ZkB8I5QkwgFAW3ObFVl4qnoJaHFLrDB4yTeNHOjW6n1ileJqbo3pv+U23o46ZESPGp51+y+R2gNlsfZZCopue3PgFIt54wrA33/JK3Cwdspu2hhgAEa/NrNf0b3xOGivY6q5nOsiOVKiveyQAxF/Sgy8WAHhl5Lg+VmWHMMfCC1M8+WO7EQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB5549.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:60::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 03:33:12 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 03:33:12 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>, Alex Henrie <alexhenrie24@gmail.com>,
	"jose.exposito89@gmail.com" <jose.exposito89@gmail.com>, "bruners@gmail.com"
	<bruners@gmail.com>, "seobrien@chromium.org" <seobrien@chromium.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Topic: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
Thread-Index: AQHbfsf5ZtYaSMawFkyOk+zY5ixT4rNjiQ8AgAB39wA=
Date: Wed, 5 Mar 2025 03:33:11 +0000
Message-ID: <93E79E35-15B1-46BC-BA76-C54784351E6A@live.com>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
 <sp111ppn-q3pn-20rp-92n0-rqn0p2s7s7n5@xreary.bet>
In-Reply-To: <sp111ppn-q3pn-20rp-92n0-rqn0p2s7s7n5@xreary.bet>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB5549:EE_
x-ms-office365-filtering-correlation-id: 962bc7d9-4bea-4761-34c3-08dd5b9674c9
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|7092599003|461199028|19110799003|8062599003|8060799006|1602099012|102099032|10035399004|3412199025|4302099013|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?er49EkXFRqwfKt67rE/eR4Psd+UIwAHFWD+28c69uKmndQYyXCbFZ80sILyh?=
 =?us-ascii?Q?NbiwOX7d26ciA/Dwe3OokQ0VE//lEvnA5I/Ffor/Dg15KIjl9hUoFmUlXFo6?=
 =?us-ascii?Q?YWZnYZ3oCsSoBb7gGGLwfMzlcfQrwllBq7hI49q4IdNhTKkn5DrwxR0Ni3Xz?=
 =?us-ascii?Q?AS2M7mS7Au9ziQeY+i3YiVnVt6Pq8qaRfEgG3pz8lQ2SKmtK2lPrG+7BlHbY?=
 =?us-ascii?Q?bNkBhN+uNGo+mug79PcDUDRLSk0bnzGANwcWbXxv6owfQroGbcth+BGP2yS8?=
 =?us-ascii?Q?yYfJ3ryreoBcIgf74KwcQkaaLNyVYlzdGpaMYonk/JQyTLpnnv987TgJOKUf?=
 =?us-ascii?Q?a3RFXqXzxHhMhufnDzaUB1CcXhr5M725q03kCkZed2SpFU4dI8H/sn3csbQ4?=
 =?us-ascii?Q?VY8LYO8U5f/zyCewuUlXtdSuNrgG3DfHGnmpC2aCU6MBIR8TqeJ21RL3/DWN?=
 =?us-ascii?Q?8HYOw0t70MXrz8S/5taVTfJ0U7l5RhWDcEmqX72D4kSUaJP0ynCq5IeH1Y6n?=
 =?us-ascii?Q?XTKdzhYna74fhidypkZpgjfK08hJ3kA7bOHTSyeSGJ0b2aZCKnVk9YItu4Uz?=
 =?us-ascii?Q?4qFAOLMSD/y6skBhORcmPSO0JauI/3xLW/mm+DxH8UeV2wS1HNN95Zh/IM8V?=
 =?us-ascii?Q?ZorIMI+ltOZmCRhXeolcj4JNpI87rVPYaEpEP0Dht2x1bQj3XI+UH3K3lf5B?=
 =?us-ascii?Q?McKz9vKNHm/yocJ7s35Airsj6DHzdk/6On3Lj5k6TEwL4pbLr1FhW48JkEjx?=
 =?us-ascii?Q?wv0w1FvcDozzw4du1XBUPV3Vyi8xyv9H7iEJIJG9njSgySC3VZCqsrXtsEnB?=
 =?us-ascii?Q?Z7P04cYzW1v/mbJT+fxAEX3sHBMfPBex+GKeINCeFHCxc1qqAQEzn+yJ0/Og?=
 =?us-ascii?Q?Udvwy104GrIT/G8eZIHv0/SoLste05VZoKfS2cgvll79zRg74kFJUV53HVBS?=
 =?us-ascii?Q?XoQu3BwJH4w3coWXn6egbqq/STs0vHgrnjN593HbbG8d7TcL8Ned4v5HFisd?=
 =?us-ascii?Q?FCYBCRhoU5RIoLlbJS8cyzlMfMoJGw6ERHKVJTpn3sQBRYDiTVUYSr53lvk/?=
 =?us-ascii?Q?/EEH94Tn2sEtyJ/HlfPdGfLofc/HcYsKir7uDn5Cb446vkkjN8v+xVVu0YqN?=
 =?us-ascii?Q?G4MvS2gvmaMJEIsy2hF+xArHwerIuz5oopkPlLdKeTbsX81THAuxqw/ahUjA?=
 =?us-ascii?Q?5F1wTbSG5Qk9OPzckHAXM+4Djf2SpqebQRIEVJhyG60U+9eQTqSAIMpNrzkU?=
 =?us-ascii?Q?mJZb5vnr1BdlvdDqdfQ4?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?04mZBK65ESHEPfXkwamxW8h3nleQmAzEh34T/b70B0jLui64RmH725rFPkos?=
 =?us-ascii?Q?ETnKNQ3MHU+RsigWt4rK5dIBMtq4glZo1hTw1NTds76Szku6YOavJryUXOZj?=
 =?us-ascii?Q?feNOq2w6rFHqstMuqnuzQh3ITSxVWmhLu6RiHIdVXUBe0exy2cvDvadEgKJM?=
 =?us-ascii?Q?FviJDUvjqEOOulbUtMq6oyNdhTAVznploMcYyc9ydRECy/5xAlXwBFhn4IcZ?=
 =?us-ascii?Q?MleMVwRtSfs71BveUVUWNfoLfejqRp2W5jOAeeWvbrHNTth4C0JQql5u+i7r?=
 =?us-ascii?Q?Jp0Vf+Dzyq8QzkkzQTnAjQ2rwvIBUhM7G4Yks4csBIo8GVS9zVBrVYgely3t?=
 =?us-ascii?Q?f+hSWo9gRgzAEeUNKBeTDyIGjcUAivHU8AMjMYR3n/slR0Mjg+xTuGHkOMWh?=
 =?us-ascii?Q?26oQnFhcXojRy/GN7KmolEKI57vwagtLY9lT9noTqDJyoG/59Sl7ON0//nu7?=
 =?us-ascii?Q?1+zvKXRQoFoe+6frrQeqo1kS0Dd2WOYwhdLn1wWlUrlhbo5fLnuuXRMxbYZd?=
 =?us-ascii?Q?NcfH5xSkr/LdtlDkf4164Mj22JaR/wrMN/VLBjEMCs2Cf+S/rjXKc3ShJ2Xu?=
 =?us-ascii?Q?vVJ9jqBjZPWjxqWywDwfg0wMC0TOK2vvg6ksUtmLNTSI1dN55GsQyTIeT5CY?=
 =?us-ascii?Q?9KMKzMHhAN1hle8Gkf/72RXRF3GGQPBmUgYdlXSDLMTIVNTWyWnTHhGGGJVV?=
 =?us-ascii?Q?r/N7fVS6mUJ1IxyU5LS/3HUVAhGOmG1lKCzGaZYOHkt8SFQOVMkHF9dCkVws?=
 =?us-ascii?Q?LfqoP7Uk+mBoQv3gpp1nX/u7ddfLThPJhIwgHdJE5ubCexUrjAk16W5pfz7g?=
 =?us-ascii?Q?N0WW+ALlwWnUEt/hYEYCtxP8wuELAH6pK0c3jVMIGMH1rCm1GbG6e/5zUiJG?=
 =?us-ascii?Q?DyfUBkEp+3Y7FzmAVmmgk/gMRig52orz1+8IDFMPV5TM0hbgiX2JPbwYtUNG?=
 =?us-ascii?Q?D44HMtRx9pev0TYYCY6pUC2K9IjmdGysX/pEswxkV5wHpHIC/iM0w3tQRs6I?=
 =?us-ascii?Q?I8zVGA87X1bqafVPWscsySBK/8wmJxSA3BXb6CnSoFpDMCHfSJdug+Egyf0Q?=
 =?us-ascii?Q?AUni3Ah06SBQ8pUNn2leLMxQ0TZEfe82S7baYkCwINX+auLOiYrO9s7LC67g?=
 =?us-ascii?Q?zZ9hTdNX14/Sw9PddUbtKX9IMjB9lq/HJgywmQLimqmhb0TeIbjE/XxazMf7?=
 =?us-ascii?Q?b0wZ/nogAUCq5T0uhODDoT3aN4dc60c0ANbL0Js/woGi1e61VIPLG+ah6ZWL?=
 =?us-ascii?Q?3lpnpfRctJ1CpzsiShYLEvTP1p+nW/saixdj9kXUPxmwtTZzapYPER4pRPns?=
 =?us-ascii?Q?C3VfZUi2MZxRkwq7+EdHegTO?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1CB3703C409DBF4E98DCED080D11BE3D@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 962bc7d9-4bea-4761-34c3-08dd5b9674c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 03:33:11.8634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5549

Hi Jiri
>=20
> This patch is corrupt -- the context lines are missing the leading space.=
=20
> For some reason, it's only the 1/4 which is corrupted, the rest is fine.
>=20
> Can you please look into this and resubmit?


I sent another patchset yesterday since common tables were becoming confusi=
ng for people, so dropped those patches.

Please review this patchset:

https://lore.kernel.org/linux-input/F4DF8D56-7095-43AE-A788-F10B8CE477B0@li=
ve.com/=

