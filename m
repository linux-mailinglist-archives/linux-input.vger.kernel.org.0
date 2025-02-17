Return-Path: <linux-input+bounces-10095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7CA37F52
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 11:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE923B254E
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0132260C;
	Mon, 17 Feb 2025 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="dq/zKkCd"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294122163B9
	for <linux-input@vger.kernel.org>; Mon, 17 Feb 2025 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786539; cv=fail; b=YrmA4EtFvDn+Xfh6E8RZvWGUp+DZTPNIrYSG8MLXWYLso4In9NLWcKgXGGvGL/TxP2w1WSnpLgzUClSANPMPBL29D7C2uu0dmMO7q3njETVzvRXX+tpKrkJfV/QqS3YfO2FWzC0c352kakuMxVbsFIjHtK19V7sBsuOK/BG7f7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786539; c=relaxed/simple;
	bh=e4fMsQGD8XIzBrB1nFNXJH1jCRQWbfeAgMfmJP0x+kw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JKCJgjuzuhbFMqzgKBE7hhgldoIFwF3FWK+iwItzMhcWxNEO8KSCd9PjEMjJBUiFFh+/8DURj5oBE8vT6S3fUiT/Xa+IRgOnIBCRy017hQgkyy1DKGAT2MVWQHAjv734u9OmfFK8fLhKhtNbY2FKfAEjem5TEuMR4gD5rTOoJyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=dq/zKkCd; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSuximGvSK3yqsEoyLZToXGxSdbExgTdpaUdHXK459IaHfd2xiadqIDSe56mf2n1MJvFn+Fx4mjJRaeD092/1XJvgLgzdQUZP4fGQnVg+38M0Npbg5E7f1mluwPXOTPvBZRlxrwqGhOaCYGJ2dvZ9c3ZPf/sKEYhV8tfJPiboKfrDhb0Yz/bCiRwpGwqi4hDC5lvC40LDVTOlJvx/mtS6IqZBr56hCji/9wd9ILxkK3Wk7Z2lIk0NHmjGvu9ZMKuVke5PTxNn0h+yANkWpv/MzXzwgnxnPU406dTK0QeYzZwDAzUi6PEy0D0TM/xyQAYDFNHBGshlda2uGaVgAT7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4fMsQGD8XIzBrB1nFNXJH1jCRQWbfeAgMfmJP0x+kw=;
 b=Mhtr82jWAIdkBCqGdNiew5QAi/EKkLv/pXxynMdhUpHmBNa3YiIYlCrp/FopZeOez9nNMyAIdPOAHooI+kT6Xmc7wiJd3vLgF6iIJUu8GiL3xVWlbhHJ/ufHY2y3gbwN29+P7QZQTUkxq9hEXP2XzSL1w3dOK3k+xmLtdtL9wRDGy5gKpB7XOHi7o5CB3d0cPiA+dBs/TXbYN5KM4MT3hu3PqFtrXL0Z3lL5NFWPL+GbRpfpn9Sk8VB76BkUHHLrs9c4T0MdXpZ3KkqB4LgSwekEcJk2s4iGoiHaM3VkP6OqwLDKwx0nviLyqshQ3iIFaiWVfj9OuTntxqixQgWf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4fMsQGD8XIzBrB1nFNXJH1jCRQWbfeAgMfmJP0x+kw=;
 b=dq/zKkCdxBfj0owBImpZi/t0a2bnRGvd4iUge+2QX43ziEyTXYdPw6C3MgSd33OKPtgL5RTiUMEF5kII/ieZHSl1zvPqMrglwpzhC73leAxuGXPlSJA05Oci5DcmPs7UkvNH3DUYuUsCy5pmqbUxbm2JodrmG29KqIuS8UowtdBbBlKrShedBvR+dvj6NIIOvOf20fTBp6Jz7PQzzjyVPelVWHTspUQ/uxKxy9BIBtSyKv1GkBMRJoCr5PvR4HCC/QE6gM3szIpy2/69ufy6PHo17KAz/+Ptug5ouPFOUhYoj9q3TcyfutaJbx2vCONdHynRcSYYuTc1XZHlPLZpKA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PNZPR01MB4398.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 10:02:13 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 10:02:12 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Topic: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Index:
 AQHbfXSaek/9eKHa2UOEiOnSSu3oB7ND8GeAgAUzRwCAAFNAAIAACtOAgAFn6wCAABI2gIAAF0+AgAA32oA=
Date: Mon, 17 Feb 2025 10:02:12 +0000
Message-ID: <A58096D0-D8FC-42F6-BCAE-8D099E81E3AA@live.com>
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com>
 <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com>
 <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
 <F209BEE2-29F0-4A0B-8B94-2D5BFA00AC90@live.com>
 <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
 <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com>
 <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
In-Reply-To:
 <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PNZPR01MB4398:EE_
x-ms-office365-filtering-correlation-id: c2ea1a1d-0651-41f1-4fa2-08dd4f3a2671
x-microsoft-antispam:
 BCL:0;ARA:14566002|8022599003|7092599003|15080799006|461199028|8060799006|19110799003|8062599003|3412199025|41001999003|4302099013|10035399004|440099028|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?NU9lRjRHUTFiWjBBTW0rNStpcHNzZTEvWDVtREVLNzVEd0s2TjV6bk96YVF1?=
 =?utf-8?B?R0JHYUdMd2NNVmFhMmw1c2VLYWxMVUl6ZXE4enVobTNBcktWbXBHQUxwTDdU?=
 =?utf-8?B?cmdEUzI5ZXlLOVZ4YkdXd1RrNHh4ckRlWWxzM216Qys2MHNwcDJxczZ6Tk1L?=
 =?utf-8?B?VzJiWC80NHpwRzdIRUNsVTdOWnBmLzcrcEFrZmhtcWFETENOZCt2dy9IZmh5?=
 =?utf-8?B?cUhwY2xqMTVOQzVhS0RYQzVyeDRiK0hZOFpLWkxRTUwrM1V6ZTB4V1plZlNF?=
 =?utf-8?B?dFdiVWJxVFRqQ0IzcWxXL0pDK0tZdExpOWV0NGdEbExQWnhBOEg1cWlrS0t2?=
 =?utf-8?B?OXZBanovVzh0WXp4L2wrcXFBa0MwTzVmNEhmR2s2cXVobXBjYTM0TUVPOVNY?=
 =?utf-8?B?WTgyRGxqMm5RNWhHQW4zd3pYU28xQ0hiUUk5eHFyc2k0NklYN2J6Z1BKVTU3?=
 =?utf-8?B?YVM1TVJWajVFcTg1N3dJWGZSb3NXdGszN09NWjdSY1Bya2RuQnpHeTkvRStk?=
 =?utf-8?B?UmR5S093YXJCejh0eFBoL3duVlNjNHFkSmNHY2oyWkRSNlNMZkdNUy9sQmRX?=
 =?utf-8?B?V2kwNGcrVCtwUGxIckQ3M0JsZjZCTGZhNzlWUnY2ckFyOHdIc0EvNVlZajJ5?=
 =?utf-8?B?Tnl3L2Jmbm1KYUluSjlBRFZsdzZzdmRsQ1QxRU13UnJtUlFiWStNQ214cUYy?=
 =?utf-8?B?blJ2Zi92VDRrejdDbXN3OU1Nb3NYU1dBaytSMk16Z0ZlZWVXa24rNlhPWmE1?=
 =?utf-8?B?aXhuRDZXV3o4dGJrU215ZlFocDVkUmNZenVVc2d6TjJUMVV1VHd0WE1UNk91?=
 =?utf-8?B?NEx0UkU3dTJmbTdaMzh3dWQyVmxkR25FM1k3MS9wQ0kwV0F4MzR5TjArd0VU?=
 =?utf-8?B?d1VGMzRrWlYvL3U5Vm5hNmY1TkpsSlRWdGNrRFVzSFZreU5yY3p2TUNDYlVn?=
 =?utf-8?B?Tzk5ZlE4UkhTa016U0hVM2p1RkF3TE5qVFZNUVZoMEczUHMrU0drRjFCcEdW?=
 =?utf-8?B?WHB3TTRTdUt1U1dGc3cyUXo0aGp5WEtLM2dKRFlJZWk5d0J5RTR6L2Uxbjg2?=
 =?utf-8?B?djE5QVh5NTBpaWNWZXk1N25EZjBkQ1FveTZmZWdFWFUzd29Wem5NeHE0R2RD?=
 =?utf-8?B?Ym53NDlwZmRzMFZBNWpmY0xuVVA0dy9UWXVFMFBhRHdvSnRJS25EUmVNbHdM?=
 =?utf-8?B?KzVQSGRWcFRvMVlxNE9yR0ZaWGlhVG5FNm5rS2NCaEl1SmtpYkxoTXZYeUls?=
 =?utf-8?B?MDBBS0NwVGZpRVZqcmRLYm96WENQT3dFT21YSTJoRi9YUzZRek1QN05UdjVi?=
 =?utf-8?B?OU45a2g4U0hRa2hyVGM2VHNlSjYwSVRXRmhZMmYyMjNIWVE4OTNtaEFxS3ZE?=
 =?utf-8?B?bWJ0VVdqRStnRWpOYmFKRFpib2trZ1lPbkVhdGt6NUs1bys3bTh4S1pmdFBz?=
 =?utf-8?B?ZGtjRDhIdHI1cG0rOVMzT2VIZTRKc2pZSnRJN2ZzK1N4ZFBHVHlVaC9TMjR4?=
 =?utf-8?B?Q0tWR29QOUJrR0xUWnRINXJOQ3EyWjdJL25OV0EyZTRFejRzK3VtdGtzVS9S?=
 =?utf-8?B?QTA4RlFrTGlUdzRlWkJobUZFT0pSWEJWekpqeGIzOE56OFh0dTNUVFByWTJm?=
 =?utf-8?B?MTJxVGNGTlRBWXNXUldqZkdkV2xhMlkwOGJjZFF6OE9wMlZGRzhmTjdnTUdt?=
 =?utf-8?B?d2JYakV3S0xPWVk3RVBNaWp1NUlCWGxBVWMzSlpMY1FjRVZPN2xlWWpnPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXhaMGlXUlZXTzJIWThIRG1KVk0yaE83ZzlhY2NNZlEvalJTQUpuTjhnYnJX?=
 =?utf-8?B?VXg3M3h1UzlBK0JnaCtHNis5WHZHdjBRcDM0RUsvZU9yeHZVbE9UZU1UUDhT?=
 =?utf-8?B?Q2FUWWE0YW5xT1J0M1hKUGxJWkZIeUZ3ZkREWi9SUUpjTTRaUTZYajZqYUpU?=
 =?utf-8?B?MWp5aVFSclMxdmgweFNtTjBGVjFMV2k0Mmt4WWphbUlqWmVyRHRGYUM0WEhG?=
 =?utf-8?B?ZTVKUTJqRFBNc1hwOTI1Rnd4bkdNWEtyZEpSek5HbXg1NmIrU3plUUtHTHJa?=
 =?utf-8?B?VmNBdmJIL01nYk1zYTU1ZW45UVAxRkp1aXpJWlZINlcvWk1CSjN1bnc2T29S?=
 =?utf-8?B?Q25UUmdHNkRQZ1h0ekdpVXRiMFluMG81ZGpZWFVISDN1VUE2bVZ1OUJWZTJB?=
 =?utf-8?B?NjZ0UU5vOHFFNDJqbm1adlR6TjRUcmpsbzJDblorVHFGUVBGM2FvY0tScGZ1?=
 =?utf-8?B?N200Q1gyMU8rTDB0MG5NVmRHcC8wdkp1d0dYVFpBTlFmK2ZFb0xUdkwwQkNs?=
 =?utf-8?B?R0FIWDYwMDgwTzFUN2pVeithMy9BOEpqclFIQ1h3YjNubHlRdDRReXlUSlBB?=
 =?utf-8?B?cGRpQW1iakZ2VnhZMDJRYjBZb2pRSE43R244MmhqZnlwQURra2ZZcWpaNVpC?=
 =?utf-8?B?bjRRVDV6KzMwVmgxdHZsaTNkZldSWVBPRVdiTUJja1FxN3JiREZsMEg2RnQ4?=
 =?utf-8?B?NDlmbEpJbUxIRkJEOTd2bFlaaFkyYUVqc0dMQVpnT04xMFBNZDJmK25Rekpx?=
 =?utf-8?B?bHNrTlpVUjBCbnpqcXpLMVJ1WDNENG5MVzY2SXB5WTlONnBTcWJTT1FWTkFX?=
 =?utf-8?B?Q3l0by9lQXp5UDNKbGZScHpYSmtIZ3QrOVlJTlltUjNpNlVtdk9HSitFWHFO?=
 =?utf-8?B?OW5YeGdDVm1ncjlia3VUU0liRUtPdmhlaERtbXdxMGRLWUFnQS9tMGVZZElR?=
 =?utf-8?B?ajhmODhIekdJZW1ublFIWGVqK1VKaGFGeXE0dXdvQlF6MzVmKzlIRnV1L0tw?=
 =?utf-8?B?UHBNQ0xhQkxzbmV3UktGZnZ1SjlvNWNSUnBKRmovQkh4OHdEQVFlbnJYb01Y?=
 =?utf-8?B?a1RxaHZYdjRsL2ZSenZQNjlucnlkWGhxVjBaOVN2WGVCT3F3dEV3TmczTlRL?=
 =?utf-8?B?bVdtQTlDSk16STBxS01VcUl4bXQwZnoyM3gvWFpxMVRFQUZIWU1XNUU5Q1ll?=
 =?utf-8?B?dENSY1FQTDlMWVJYeHpwR3QyVmd4Sk5BeExSUGozVlIxSTloRzdOdE5WeSta?=
 =?utf-8?B?RUNHQzlVa0I2d2lSbTlLRUIrSW9DWkcyQVlacFdOVmVkcmtxbnNXOEZ6QllD?=
 =?utf-8?B?cWc0bFh4YnIwUkdJTHp0UFdyNlVUVFQyVW5uSUhHM2ZnRU9UVmQvTDU2bWNn?=
 =?utf-8?B?dHJ6RDZyWUVSa0NNOG1iRlViNmt5UTlYdmJZVEphcjkvMHdHelN6TlVsN01J?=
 =?utf-8?B?TnpBOEtCdDdFL0dvUzNHdTFjeXZYVDlZd2dYWE9TMy9qYXFSQTVPaDFOcXdx?=
 =?utf-8?B?MEpNaCt3YWVBRVlZSDluRmlXK0d0VG1xaUd5alNnTXZjZ3V0aktBd1owRks4?=
 =?utf-8?B?N3VMd0VuVlNFL01IMUR0SUFVOUkyeStNUnlxbHYyNFBWY043akNtOTE0Z3l0?=
 =?utf-8?B?OU8wNzhWdWw2dVBsa3lxTCtRWkFnOVlvaGlvams1UzhGQ0UxMmllM0MxcXNl?=
 =?utf-8?B?N3U0dDF2aGhOakFRRDBFYzQwb3BKUVdJV05XYWNqWmNOVE5IY2liSWFNUW1B?=
 =?utf-8?Q?1ZwzfQTGjx0pzffvkaEr/R7GO51qX4YK4ktuDXn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EF1637AC314204A8F0D8C4217962E46@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ea1a1d-0651-41f1-4fa2-08dd4f3a2671
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 10:02:12.8026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4398

SGkgQWxleA0KDQo+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgTWFjIE9TIHNldHMgZWFjaCBB
cHBsZSBrZXlib2FyZCdzIGludGVybmFsDQo+IG5hbWUgdG8gIjx1c2VybmFtZT4ncyBrZXlib2Fy
ZCIgYnkgZGVmYXVsdCwgYW5kIHRoYXQncyB3aGF0IG1pbmUgaXMsDQo+IGJ1dCBhIHVzZXIgY291
bGQgY29uY2VpdmFibHkgb3ZlcnJpZGUgdGhhdCB3aXRoICJCbHVldG9vdGggS2V5Ym9hcmQiLg0K
PiBJdCdzIGFsc28gcG9zc2libGUgIkJsdWV0b290aCBLZXlib2FyZCIgaXMgdGhlIG5hbWUgdGhh
dCBhbGwgQTEyNTUncw0KPiBoYWQgd2hlbiB0aGV5IHdhbGtlZCBvdXQgb2YgdGhlIGZhY3Rvcnks
IGJlZm9yZSB0aGV5IHdlcmUgY29ubmVjdGVkIHRvDQo+IGFuIEFwcGxlIGRldmljZS4NCj4gDQo+
IC1BbGV4DQoNCkNhbiB5b3UgdG8gdGVzdCB0aGUgcGF0Y2ggYXQgdGhlIGJvdHRvbSBvZiB0aGlz
IG1lc3NhZ2U/DQoNCkJlZm9yZSB5b3UgYXBwbHkgdGhlIHBhdGNoLCB5b3UgZmlyc3QgbmVlZCB0
byBhcHBseSB0aGVzZSAzIHBhdGNoZXMgSSBoYXZlIHNlbnQgdXBzdHJlYW06DQoNCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9GRTdEMkM5OC0yQkY1LTQ4QzItODE4My02OEVDMTA4NUMxRUNA
bGl2ZS5jb20vdC8jdQ0KDQpUaGVuIHlvdSBoYXZlIHRvIGFwcGx5IF9vbmx5XyBQQVRDSCA0LzQg
aGVyZToNCg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWlucHV0
L3BhdGNoLzc3NDdEMEVFLURBMzItNEI2QS1BQjYzLURCMzBDNUU4NTZCRUBsaXZlLmNvbS8NCg0K
VGhlbiBhcHBseSB0aGUgcGF0Y2guDQoNClRoZW4gc2VlIGlmIEZuK0Y2IHN3aXRjaGVzIHRoZSBt
ZWRpYSB0byBmdW5jdGlvbiBrZXlzIG9yIG5vdCwgYW5kIG1lZGlhIGtleXMgd29yayBieSBkZWZh
dWx0IG9yIG5vdC4NCg0K4oCUPjjigJQNCg0KRnJvbSA2ZmQ4NDA1OTBiNTg2ODliMWQ5OWE1MjMx
NTYyNjZmNzkwYzhlOThkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogQWRpdHlhIEdh
cmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCkRhdGU6IE1vbiwgMTcgRmViIDIwMjUgMTU6MjA6
NTggKzA1MzANClN1YmplY3Q6IFtQQVRDSF0gb21vdG9uDQoNCi0tLQ0KIGRyaXZlcnMvaGlkL2hp
ZC1hcHBsZS5jIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0N
CiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1hcHBsZS5jIGIvZHJpdmVycy9oaWQvaGlkLWFwcGxl
LmMNCmluZGV4IDRlOGIwMTc5My4uZWFhZmEyODVhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9oaWQv
aGlkLWFwcGxlLmMNCisrKyBiL2RyaXZlcnMvaGlkL2hpZC1hcHBsZS5jDQpAQCAtNDIsNiArNDIs
NyBAQA0KICNkZWZpbmUgQVBQTEVfQkFDS0xJR0hUX0NUTAlCSVQoMTApDQogI2RlZmluZSBBUFBM
RV9JU19OT05fQVBQTEUJQklUKDExKQ0KICNkZWZpbmUgQVBQTEVfTUFHSUNfQkFDS0xJR0hUCUJJ
VCgxMikNCisjZGVmaW5lIEFQUExFX0lTX09NT1RPTgkJQklUKDEzKQ0KIA0KICNkZWZpbmUgQVBQ
TEVfRkxBR19GS0VZCQkJMHgwMQ0KICNkZWZpbmUgQVBQTEVfRkxBR19ET05UX1RSQU5TTEFURQkw
eDAyDQpAQCAtNTMsNiArNTQsOCBAQA0KICNkZWZpbmUgQVBQTEVfTUFHSUNfUkVQT1JUX0lEX1BP
V0VSCQkzDQogI2RlZmluZSBBUFBMRV9NQUdJQ19SRVBPUlRfSURfQlJJR0hUTkVTUwkxDQogDQor
I2RlZmluZSBLRVlfRjZfT01PVE9OCTB4YzAzMDENCisNCiBzdGF0aWMgdW5zaWduZWQgaW50IGZu
bW9kZSA9IDM7DQogbW9kdWxlX3BhcmFtKGZubW9kZSwgdWludCwgMDY0NCk7DQogTU9EVUxFX1BB
Uk1fREVTQyhmbm1vZGUsICJNb2RlIG9mIGZuIGtleSBvbiBBcHBsZSBrZXlib2FyZHMgKDAgPSBk
aXNhYmxlZCwgIg0KQEAgLTgxLDYgKzg0LDggQEAgTU9EVUxFX1BBUk1fREVTQyhzd2FwX2ZuX2xl
ZnRjdHJsLCAiU3dhcCB0aGUgRm4gYW5kIGxlZnQgQ29udHJvbCBrZXlzLiAiDQogCQkiKEZvciBw
ZW9wbGUgd2hvIHdhbnQgdG8ga2VlcCBQQyBrZXlib2FyZCBtdXNjbGUgbWVtb3J5LiAiDQogCQki
WzBdID0gYXMtaXMsIE1hYyBsYXlvdXQsIDEgPSBzd2FwcGVkLCBQQyBsYXlvdXQpIik7DQogDQor
Ym9vbCBvbW90b25fbWVkaWFfa2V5Ow0KKw0KIHN0cnVjdCBhcHBsZV9ub25fYXBwbGVfa2V5Ym9h
cmQgew0KIAljaGFyICpuYW1lOw0KIH07DQpAQCAtMjc2LDYgKzI4MSwyNSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGFwcGxlX2tleV90cmFuc2xhdGlvbiBwb3dlcmJvb2tfbnVtbG9ja19rZXlzW10g
PSB7DQogCXsgfQ0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBhcHBsZV9rZXlfdHJhbnNs
YXRpb24gb21vdG9uX21lZGlhX2tleXNbXSA9IHsNCisJeyBLRVlfRjEsCUtFWV9CUklHSFRORVNT
RE9XTiB9LA0KKwl7IEtFWV9GMiwJS0VZX0JSSUdIVE5FU1NVUCB9LA0KKwl7IH0NCit9Ow0KKw0K
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXBwbGVfa2V5X3RyYW5zbGF0aW9uIG9tb3Rvbl9mdW5jdGlv
bl9rZXlzW10gPSB7DQorCXsgS0VZX1NFQVJDSCwJCUtFWV9GMyB9LA0KKwl7IEtFWV9FSkVDVENE
LAkJS0VZX0Y0IH0sDQorCXsgS0VZX05VTUxPQ0ssCQlLRVlfRjUgfSwNCisJeyBLRVlfUFJFVklP
VVNTT05HLAlLRVlfRjcgfSwNCisJeyBLRVlfUExBWVBBVVNFLAlLRVlfRjggfSwNCisJeyBLRVlf
TkVYVFNPTkcsCQlLRVlfRjkgfSwNCisJeyBLRVlfTVVURSwJCUtFWV9GMTAgfSwNCisJeyBLRVlf
Vk9MVU1FRE9XTiwJS0VZX0YxMSB9LA0KKwl7IEtFWV9WT0xVTUVVUCwJCUtFWV9GMTIgfSwNCisJ
eyB9DQorfTsNCisNCiBzdGF0aWMgY29uc3Qgc3RydWN0IGFwcGxlX2tleV90cmFuc2xhdGlvbiBh
cHBsZV9pc29fa2V5Ym9hcmRbXSA9IHsNCiAJeyBLRVlfR1JBVkUsCUtFWV8xMDJORCB9LA0KIAl7
IEtFWV8xMDJORCwJS0VZX0dSQVZFIH0sDQpAQCAtMzc3LDYgKzQwMSwyNSBAQCBzdGF0aWMgaW50
IGhpZGlucHV0X2FwcGxlX2V2ZW50KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsIHN0cnVjdCBpbnB1
dF9kZXYgKmlucHV0LA0KIAkJcmVhbF9mbm1vZGUgPSBmbm1vZGU7DQogCX0NCiANCisJLyogT21v
dG9uIEtCMDY2IHF1aXJrICovDQorCWlmIChhc2MtPnF1aXJrcyAmIEFQUExFX0lTX09NT1RPTikg
ew0KKwkJcmVhbF9mbm1vZGUgPSAwOw0KKwkJaWYgKHVzYWdlLT5oaWQgPT0gS0VZX0Y2X09NT1RP
TikgDQorCQkJY29kZSA9IEtFWV9GNjsNCisNCisJCWlmICh1c2FnZS0+Y29kZSA9PSBLRVlfRjYp
IHsNCisJCQlpZiAodmFsdWUgPT0gMSkNCisJCQkJb21vdG9uX21lZGlhX2tleSA9ICFvbW90b25f
bWVkaWFfa2V5Ow0KKwkJCWNvZGUgPSBLRVlfVU5LTk9XTjsNCisJCX0NCisNCisJCXRhYmxlID0g
b21vdG9uX21lZGlhX2tleSA/IG9tb3Rvbl9tZWRpYV9rZXlzIDogb21vdG9uX2Z1bmN0aW9uX2tl
eXM7DQorCQl0cmFucyA9IGFwcGxlX2ZpbmRfdHJhbnNsYXRpb24odGFibGUsIGNvZGUpOw0KKw0K
KwkJaWYgKHRyYW5zKQ0KKwkJCWNvZGUgPSB0cmFucy0+dG87DQorCX0NCisNCiAJaWYgKHN3YXBf
Zm5fbGVmdGN0cmwpIHsNCiAJCXRyYW5zID0gYXBwbGVfZmluZF90cmFuc2xhdGlvbihzd2FwcGVk
X2ZuX2xlZnRjdHJsX2tleXMsIGNvZGUpOw0KIA0KQEAgLTUxMSw5ICs1NTQsNiBAQCBzdGF0aWMg
aW50IGhpZGlucHV0X2FwcGxlX2V2ZW50KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsIHN0cnVjdCBp
bnB1dF9kZXYgKmlucHV0LA0KIAkJfQ0KIAl9DQogDQotCWlmICh1c2FnZS0+aGlkID09IDB4YzAz
MDEpIC8qIE9tb3RvbiBLQjA2NiBxdWlyayAqLw0KLQkJY29kZSA9IEtFWV9GNjsNCi0NCiAJaWYg
KHVzYWdlLT5jb2RlICE9IGNvZGUpIHsNCiAJCWlucHV0X2V2ZW50X3dpdGhfc2NhbmNvZGUoaW5w
dXQsIHVzYWdlLT50eXBlLCBjb2RlLCB1c2FnZS0+aGlkLCB2YWx1ZSk7DQogDQpAQCAtNzAxLDYg
Kzc0MSwxMiBAQCBzdGF0aWMgaW50IGFwcGxlX2lucHV0X2NvbmZpZ3VyZWQoc3RydWN0IGhpZF9k
ZXZpY2UgKmhkZXYsDQogCQlhc2MtPnF1aXJrcyB8PSBBUFBMRV9JU19OT05fQVBQTEU7DQogCX0N
CiANCisJaWYgKHN0cm5jbXAoaGRldi0+bmFtZSwgIkJsdWV0b290aCBLZXlib2FyZCIsIDE4KSA9
PSAwICYmDQorCQkJaGRldi0+cHJvZHVjdCA9PSBVU0JfREVWSUNFX0lEX0FQUExFX0FMVV9XSVJF
TEVTU19BTlNJKSB7DQorCQloaWRfaW5mbyhoZGV2LCAiT21vdG9uIGtleWJvYXJkIGRldGVjdGVk
OyB1c2UgRm4rRjYgdG8gdG9nZ2xlIGJldHdlZW4gbWVkaWEgYW5kIGZ1bmN0aW9uIGtleXNcbiIp
Ow0KKwkJYXNjLT5xdWlya3MgfD0gQVBQTEVfSVNfT01PVE9OOw0KKwl9DQorDQogCXJldHVybiAw
Ow0KIH0NCiANCkBAIC04OTcsNiArOTQzLDcgQEAgc3RhdGljIGludCBhcHBsZV9wcm9iZShzdHJ1
Y3QgaGlkX2RldmljZSAqaGRldiwNCiAJbW9kX3RpbWVyKCZhc2MtPmJhdHRlcnlfdGltZXIsDQog
CQkgIGppZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKEFQUExFX0JBVFRFUllfVElNRU9VVF9NUykp
Ow0KIAlhcHBsZV9mZXRjaF9iYXR0ZXJ5KGhkZXYpOw0KKwlvbW90b25fbWVkaWFfa2V5ID0gdHJ1
ZTsNCiANCiAJaWYgKHF1aXJrcyAmIEFQUExFX0JBQ0tMSUdIVF9DVEwpDQogCQlhcHBsZV9iYWNr
bGlnaHRfaW5pdChoZGV2KTsNCi0tIA0KMi40My4wDQoNCg0K

