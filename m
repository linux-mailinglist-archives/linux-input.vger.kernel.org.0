Return-Path: <linux-input+bounces-9219-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BF1A100E8
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 07:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442DD167831
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 06:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD6823D3E9;
	Tue, 14 Jan 2025 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="aDmp2n9B"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F298243329
	for <linux-input@vger.kernel.org>; Tue, 14 Jan 2025 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736837078; cv=none; b=O6LmiPD9bj0Leqsj19TlLMx+qbnvM/uVjKITjAYWf/r7G/ZjGICW8ZH1YDNvRWe+3TYk234ykdc6Ol92zS8Z/iJjLiLja971+Pz1qgZcs1eAXowNQ+F/w778AnGIampX7IOppe4xwU2GWsoWQ3WuGHv1nb922H2uxzvEhP1F/2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736837078; c=relaxed/simple;
	bh=4+eFZE0SfaSAvEFEz26Zpd1eCR9Yd+De70yHTI9ZFlE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=euPvOFTAaEDFx+RT30C8Rg6vh5BcLxvVUgah39WvZg/a4CwnezpdkNZI1KncOM3yuY+gqZ4jrwxdDo1CymS9fhZmNDAtQbjo8osXLWuqQu02L3pEqCV7IIwc3omjZ8+tVkvUqnPgdoQQGHkXeBluxNI7w21LZtT/KVw057K0lw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=aDmp2n9B; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1736837075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+eFZE0SfaSAvEFEz26Zpd1eCR9Yd+De70yHTI9ZFlE=;
	b=aDmp2n9BFqGl3IudS0TctsUt3iCxgbexw+baw/UNdVjaPaVbqp2qufMRzC2jPlkmwvh+Ky
	bEjCCN6SIM0kUiTpUq3lgy6TwPMnfFbhjgLrJWWI+svetHQADb8qeGxjd7VHLBJlXFAIk5
	RF09307FjH/2TddCa/QLMl0e2SU200Y=
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-pkHoOHzKMQGYbCOfn0yDCA-1; Tue,
 14 Jan 2025 01:44:34 -0500
X-MC-Unique: pkHoOHzKMQGYbCOfn0yDCA-1
X-Mimecast-MFC-AGG-ID: pkHoOHzKMQGYbCOfn0yDCA
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by SA1PR84MB3142.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 06:44:30 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 06:44:29 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Jiri Kosina
	<jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>, Benjamin Tissoires
	<bentiss@kernel.org>, Jaroslav Kysela <perex@perex.cz>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] HID: hid-plantronics: Add mic mute mapping and
 generalize quirks
Thread-Topic: [PATCH v3 1/2] HID: hid-plantronics: Add mic mute mapping and
 generalize quirks
Thread-Index: AQHbZhY4SZincBkFqUysNtJ7qxYj17MV0vwQ
Date: Tue, 14 Jan 2025 06:44:29 +0000
Message-ID: <EA2PR84MB37804256BA2751283D0E01A58B182@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
 <20250113235212.78127-2-linuxhid@cosmicgizmosystems.com>
In-Reply-To: <20250113235212.78127-2-linuxhid@cosmicgizmosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|SA1PR84MB3142:EE_
x-ms-office365-filtering-correlation-id: ac634314-9a43-4372-94b5-08dd3466e590
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?AWmINRCoqbyeIQuv7cfet24dl+wwbjBf+v3yPNWj+TFbpMWL4eEZc+EvLje0?=
 =?us-ascii?Q?/vNqEwTFOu2HICXJBKIv54AtW+YXsq3kqjDQY4QQawgQilCKsO1Q3T7wLUk+?=
 =?us-ascii?Q?KubWwVqJWDcRwR88Sz8PwegKU0sDPie9BYE5pmcwCy/tcuKudBRN/4RzgIpZ?=
 =?us-ascii?Q?7tfHuR3Wx9Ce+u6yj5WRfmYOh/FuHs5z2eS/5MTi3GOKXjALBUcjNJV7udYW?=
 =?us-ascii?Q?yjrkJqccrTJDY+MMPxVTwFGLnHPTXCTLKNWwTeVSQDSkBnHRPpnFL/Y6txfU?=
 =?us-ascii?Q?Om3AseeR7JFkMUZKFphExt5NCi+77+XTKcreEL9T4oRGHvDszr2SJ2/FCsoE?=
 =?us-ascii?Q?OCOTuZL7nl07y6+57R9Va33pmm6317d9xM8CMasskuIQLSyt3v48q/Tud7OI?=
 =?us-ascii?Q?edL7YIsjDmRQIQwovOtOY5qNwIyjmaepEBVNrAFSrGxPd5+Gzi6E8wgmpxI0?=
 =?us-ascii?Q?N/uMLvzGtol2JNcv06fge6M6NBfoKmflX05iapCffZyrPA3L9FkOjfXMR1hk?=
 =?us-ascii?Q?pYDgEWbP/kakZCDC4qI67fYUnst3hccCeKa02dKwsnF42ZFrpFEN4YCy98RT?=
 =?us-ascii?Q?PTiRFWUO1xmRlVmFk0CELlyGpv9x9XR9zv5ivsm/EM6csmxLlPcErdkrsjIO?=
 =?us-ascii?Q?q2E511/kFXE8UXeOCf6N1jNa2FN1pIilbPdsCPxjxdV16r2uQU/XnopUm/Ml?=
 =?us-ascii?Q?hI4Rm/L6AWZQ/Hs5XQpM5imx31QtLUT2sEoED2NMb4KRMtFAUmg1rFGUon4h?=
 =?us-ascii?Q?saz9W+N7RB8ti5aVb0aIsdNrHEoAW6EYJfcHgY9EEZvxXdii4y75+wJUeiie?=
 =?us-ascii?Q?ve55aULKjI6v05kD9mJ5AfNUB2acS8hS/mNdPvqcr3MPCk2vUIZqUMsE7cOB?=
 =?us-ascii?Q?I8np6+V0t26dXxyygtElkYJ8QPAK4okwVQl7jUPlSvqGRr5rij9Rf+VTN9aZ?=
 =?us-ascii?Q?plg8nwbNKgNZo7W1QTVouEpfUTRDqAEMDt2Lnvi0KaJUzNAoEtx3KIYj+2ka?=
 =?us-ascii?Q?y3U1GbLMVSu2EFPG3K4vDbJsiDKTqc4W9U/H/c1ZyIf95jZAzIS+lXai1HG1?=
 =?us-ascii?Q?1yz/KEZOJM/exaiJ+WAJ9gdzGRht9Xr/iUS6ducVXVNDiBalzNOHVKmA1/ol?=
 =?us-ascii?Q?kWBOZtHEFxg8Lt9eG806dtXGdfBpwWA5h4k6cR9dm0uq/6BOBqviN0ECxShR?=
 =?us-ascii?Q?JkkqPI2ytdwnU+EX6ruMaPQrnCDV94U+em0KBfKVrHupTfGfUfO6OMtOn5N2?=
 =?us-ascii?Q?enCz8DfH3PnpCmuGA71+V3vMNiuR9HNssCKdUd/cBmL/QjtgRB5sEq1jf0Xa?=
 =?us-ascii?Q?ZGQqY3CHs+HI8y04kPTrWQjZsVW1jqgtipdqi6pqD80bSzk+w6Y6MiKy9g5R?=
 =?us-ascii?Q?jC7NI+oKil1NtWy5Lb27U3t+oX6qAEgiR44yBu6+62F3eHK3gHPX2RfzjFxC?=
 =?us-ascii?Q?WOAald7ebstabGSbqe2KICMWQ322Lqlk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A3d8sgCeuFvsvejwvFpdFng5nl08/4SAFY2y76ym1Mb+8eRULBY8eoQuNmu4?=
 =?us-ascii?Q?9U1+IC6qonRf3L7Oh33GuvOkE0n2+X+TyD4f9H18RTxqiOefg86CvDUmF2zq?=
 =?us-ascii?Q?38HAhr3mU4VQj45Dkjt/O5MRSfNgtTmI002NfNqoR4/42gHnUg2jjN9Z3EZC?=
 =?us-ascii?Q?4HVdBy/58MF11H8r4ZE2cow5uDHYkgW2wBmC3USV9J6MIr/Ufu+P8FZxMJFT?=
 =?us-ascii?Q?Gl2kZ4JC6nMZ39GUrrnldjWoRMquC9EAe4mks8GOL6fhacKLln5hEiLL+Oy9?=
 =?us-ascii?Q?IibYYUilnz+P2AmsduHJsnMRjnVPeXM3XvXyj8FNDtIvP3BOQhcZYnF01ON9?=
 =?us-ascii?Q?p5Gp7NNHu4GGvoTFIrl6DKmhXdNQtJq8UYZayNHhdXvLoj/bJgNlPS3qrtww?=
 =?us-ascii?Q?TO0lNgqrsuhRT2R3jJ/2aZmZWSOLQiYpBo3Pb53bEqnOnRyv6hPk9Vz21djg?=
 =?us-ascii?Q?emBG6r2qZGhD5cDUDRGV7DF5GEdsHl8D4sHsJcCjGOONto2hm3d31rqotMLq?=
 =?us-ascii?Q?m0b7ViY4uCHTOJ9xQ68XHku5+UfJohmwb3F5gsKy9AP84ixx7biwtmI2QDLf?=
 =?us-ascii?Q?DjaVTLLRC2YDpvzABKBXW4UTSDEEg+J0rd1n0sf340+lVgfw9K+EBqexA4bB?=
 =?us-ascii?Q?MWp4/vBfBo/3FQ6NGCjSaZpl7Fnsiv9CS6dVSyeU0ocgLKtFl15e5zG+rhgd?=
 =?us-ascii?Q?3UxONvhzz4hbXxD49wXFIzuBc8Wux5lp8LgLrkEj/Zs10u1YwU4X9lsOD7sg?=
 =?us-ascii?Q?a5Y+h+qH77nefsDm1111marbn9dA3NelJszYle33Ytqumj1KP07cSaZ34pZ3?=
 =?us-ascii?Q?cG7QDOzf6wZcY4/CzSgaIJ37zM4kJWg5N4n4AFaSrdXRHOFYDslv46Hgfp86?=
 =?us-ascii?Q?yAix0c+Jh6G0ODG2D5NeiU4wtcuGhCX7k9TgqIMuuL2e2MSk6uOIdGeURyyu?=
 =?us-ascii?Q?bnsM8+vtQmoek17d8E+tZqFEFG+HNhk2tUL/YzdUkJh+IknXFhFo1Jldjm8+?=
 =?us-ascii?Q?cpZllnLGOMzuOUiilWn8p47hs/nEHuP/UK8lfs1lkERBHeC3yEhOdEjvRloJ?=
 =?us-ascii?Q?X6y5uUkqeAexiOnYDJ/Fctw5X/YBV3UkWSgLweTSw7x3xF5fJZAJuJjHpIpg?=
 =?us-ascii?Q?XCHlRkiOPF+HSkTBa5zjntgxbXyWlEhqx6lWux9sPSAD85Ld2aATFJe67Ev7?=
 =?us-ascii?Q?L0xg3jcMsdxsXZW1QIZZCPk00kHXjVPhQcQJEggMku+EL0WVKGrHX7dv6Haq?=
 =?us-ascii?Q?kFoSvA62J9JJXqTHftYW0LZneSIhuzw51cNapVBGb61fnwvJtsRmgnd3evnV?=
 =?us-ascii?Q?mfjiiP+5vGdus4PYMSU78PyNsuH33h3gYsj3zsMOtRMlkGtfrUbq2k6vHlvh?=
 =?us-ascii?Q?jNBzoqvyTIWZ15IHqKBUBmg7cHWMt99B2wfx0FwvuHaDXZpsNZhG9JMDIZ9n?=
 =?us-ascii?Q?AhxPEkznfc0YRaiOvpiF5rqRntvVKpD+vuK0cc4mQm6L/bOLIQgutCLPvqQb?=
 =?us-ascii?Q?d51Jffgg8aAKqd1adgShyLdg1jRE/Qg7dT0Tdo/CjfxHpAavdqaRwnOhB95o?=
 =?us-ascii?Q?wxvwqRBF6lE9k3Iuytg=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac634314-9a43-4372-94b5-08dd3466e590
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 06:44:29.8775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: la+a4E4Ob/oDELR6O4gpAJoTz+XU+jpCIeLyQI4DBXiVLx5S4qpVk1AD7GtTMednmgwuvtfF6mmkCt3Al72frA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR84MB3142
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iTXd1buVbuaWtGEPoeREE--QSXIn1grZyhJiP8ZAmmk_1736837072
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Wade Wang <wade.wang@hp.com>


