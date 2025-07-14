Return-Path: <linux-input+bounces-13513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE788B034E6
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 05:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 182E6168D29
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 03:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C3F16FF37;
	Mon, 14 Jul 2025 03:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="hc4Eb7w7"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2098.outbound.protection.outlook.com [40.107.92.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266871C28E;
	Mon, 14 Jul 2025 03:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752463060; cv=fail; b=inuiKEvtBuBqnP4e6rRZ+ac0247RevukytrjYSvmtfAuo3yWtmUo2TUvCpnTHKmQlaVZ9wIhv8OPtgQ14tRKyi8w9V/5d+gQxplVPdiRgvddHMiqijObINdphrRPGU50AfL7HpPix9xQB/DDVfypXtH+dwHF6zYzlyHSktuNPhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752463060; c=relaxed/simple;
	bh=Ll0SdQYARuQ9ZKs56a6Nb/k7uZ1jaarCNiZcXSDFuCw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jxYFoTLD5JKfzH8xqXYgBL11Gsz0QMhZvx8+FD0x6qDA7D3V05LAGGArc0OHGkfYLlBeYOuZb2wTOFZNnIWz6yaNM3rsvBc2OEEDkJWupWb07kbup+UPug6QT3J/Ch3ClpvfYtK/mYa3OOq/QZafuUZLGhIXHlz2IFSxLh6hfns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tw.synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b=hc4Eb7w7; arc=fail smtp.client-ip=40.107.92.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tw.synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfBrn+JKj9dEGzvSHvILAn55hwmKi20ddaMYWWeEuhyjVTuF1ZDCuzAKiTzvqf099b4KOx4HJDNZhqUG7d33TFGgYMQjCO1fS3/Mf2Vmy/G8mCFtqtROumRVDZ6VyVmgQdHhsYi3KaFr+SNIr5nulSeFof0EV7tEqou6PTsIf0zsBTcq0Mfput1TmSNmPOOpdGvhdPpnvuZqBm+RdZs2MLaYkgunW14bDyW+sWgDMeTuzIhpuEUrZgtkEF7aAnV1bduZ+T4uPRPNsNYWO1nlNw3Sk7Q68uC/ttRYpS03PxerseOGDbD7tF8pcw0IxOdYWaT9JfY2mFgMIgD7rBMF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JemD6nf0km2eQo0mbWx8HFu3Vxznr5wnKf752IHMj5s=;
 b=hlMj+wG6nEFS0bHnEBqOSSgwMV4MbIykaK7bCtKLk/EdxFjMR8I0ADnylvVvMyT7TqFeqNux7yX/lohrdkssUhSat4C1FqHcOS08irOVTmB4syeYge96xgX56ma5MfRSxTBQHlp3nlw2FhOdMMuvcFQOAGfXQKg5hIYzKUkjXcVPG4BXsxSUwsUE+Z779mQLPyRsSEY0UKZiFP9m40R/Tm0BH7hauKRtODXJ0Ou3bD1pH2rvk2p+tAKVVK6TyMA1NyK+v0OjPVeRRiHhh0RZgwI7FNjVeK0lkRSujZH2W8UmcDUagJO41qIRkMOeQfeQXxu+ry5on5ZWCwrzFwJmMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JemD6nf0km2eQo0mbWx8HFu3Vxznr5wnKf752IHMj5s=;
 b=hc4Eb7w7To/7L9nRSZ5W7CM+GIznmiH+qgFaM+jGUh4JIcbZ1oS9fDmXN1176lD/cinXT8oiSYfHx+jYyHYqy9eyj2JMYMXAkL5PnFSg4pRX5o8HHEqK7JKIqF/wOkNrQofvTN+FBcNeacGwjF9VGX+j49+bfu2r6xDlh/CcjR4=
Received: from MW4PR03MB6651.namprd03.prod.outlook.com (2603:10b6:303:12e::17)
 by LV3PR03MB7732.namprd03.prod.outlook.com (2603:10b6:408:281::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 03:17:35 +0000
Received: from MW4PR03MB6651.namprd03.prod.outlook.com
 ([fe80::593f:d937:950:4a0d]) by MW4PR03MB6651.namprd03.prod.outlook.com
 ([fe80::593f:d937:950:4a0d%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 03:17:35 +0000
From: Marge Yang <Marge.Yang@tw.synaptics.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marge Yang
	<Marge.Yang@tw.synaptics.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vincent Huang
	<Vincent.huang@tw.synaptics.com>, David Chiu <David.Chiu@tw.synaptics.com>,
	Derek Cheng <derek.cheng@tw.synaptics.com>, Sam Tsai <Sam.Tsai@synaptics.com>
Subject: RE: [PATCH V1] Input: synaptics-rmi4- Add a new feature for Forcepad.
Thread-Topic: [PATCH V1] Input: synaptics-rmi4- Add a new feature for
 Forcepad.
Thread-Index: AQHb4QzQekWdQsh0M0mV081MZW27JbQZo2mAgBdjtuA=
Date: Mon, 14 Jul 2025 03:17:34 +0000
Message-ID:
 <MW4PR03MB66514AEC3646E36DDA5DA732A354A@MW4PR03MB6651.namprd03.prod.outlook.com>
References: <20250619112500.3213276-1-marge.yang@tw.synaptics.com>
 <4zjilpm5vbonpg44ykhksbpv22fpvirourelpv2qwactdswrws@hltzjpze5qkj>
In-Reply-To: <4zjilpm5vbonpg44ykhksbpv22fpvirourelpv2qwactdswrws@hltzjpze5qkj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tw.synaptics.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR03MB6651:EE_|LV3PR03MB7732:EE_
x-ms-office365-filtering-correlation-id: 5e67aaed-c31c-426c-7090-08ddc284fa6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+Hvt0A1WDk0wo2EMEaPyXlXS55CF3VTVT+7HjmXF2mZUPHx/Mbhf/WWpc9?=
 =?iso-8859-1?Q?pITOsGw+wB7Dhb2R8ELUlc20EPrnuW2k0hE1Ct+rVB9DxwGs/DyZEWEOD2?=
 =?iso-8859-1?Q?KCwiKq4qZmj/VdX5wh4htZozbm6sCy4tbLuIzRNO5pmEYq6Sztk1ltQDHK?=
 =?iso-8859-1?Q?7XBrpZQSQ/3ErUDcKqS3HEFrdjF3ZBLKADVsGuMCQlPEV9PTQNDeZRT8p7?=
 =?iso-8859-1?Q?UjzqP0CaBGGdFFOVFcL1Ai4FxW7bG8Xfga3PVdUy3lGuFI8uNCRUfSBQzG?=
 =?iso-8859-1?Q?3JiM281lUgEe3Ti6lip8rX8kTzBtG7EHhaBCLXLUWO6af4pXzCq/UdiNcE?=
 =?iso-8859-1?Q?lEs+8R93KHFIQnrJswunrCIluaQ0rWxZZTJNAKiscqSOUn5/mOwDNeWYed?=
 =?iso-8859-1?Q?S32zpafxNoByxp/JZOVDOkmsV8uPKNdri6RsmcPjREkkzJAArEnjRMgdKG?=
 =?iso-8859-1?Q?a1emKJJM3RhM80zR2YmItVZEFuK8f2UaOVvl+MMqiR6+bJJnm7gd15rt2L?=
 =?iso-8859-1?Q?XlMadSu4zrjqZiSt7t16GMErc6yAwSqjloxaw0FIUSX9N/gTjmplSEDOcb?=
 =?iso-8859-1?Q?dz2dgAYX8dAVSHL7crsqqTJeEwSWHFPpIs7j8XThTT9xiL/SaZDLUTzSXT?=
 =?iso-8859-1?Q?A5ZzBcG3EM8U+yPnrR9CsWh6bTQiQHdTfqeRJPy7Dq/GBApCNdNAsOSxQf?=
 =?iso-8859-1?Q?kgNjcC/2okUHkqlqBtb2jZbKcZE6oQuswwUCgsbfegM79biSbEKYapAFPE?=
 =?iso-8859-1?Q?7rCKNusUB4ge92uTBx9Q7fReH+F0r3MFCcJ7kM8PQrPQLzst5xxTxZMOTp?=
 =?iso-8859-1?Q?FGy9Sbq9eQJJBJspz/PcRP0nGKgQsufgdM5jbzHubeMkwZWy2lxfICZR1I?=
 =?iso-8859-1?Q?t314WjZACItKQTjcAq5u5ruYcUlw3FBjvoXRXpzkmnZ+5V1WfJlR0asuSQ?=
 =?iso-8859-1?Q?eszH4pONxhPpG0lWDWzHi9ve6hCoAoTBO8JbgdIaBIJomGfdoh0FAuZJ5d?=
 =?iso-8859-1?Q?rQkBDib0VLHyc9x2+DgN3xPtSV6nzPv/WOxXfdUB6YgzprwqjJQvJn8WaC?=
 =?iso-8859-1?Q?0m/sKMgy+NWyXegsj4FjlWUQklMT6y/24ytFvsL6UJ9AtkCiVqjZAz7txA?=
 =?iso-8859-1?Q?r5GCErIwe5/zxT+m94gUqxlE/+IfUEbhK6OG/Ch9FJxWYV1o9Xo0Xf8W0P?=
 =?iso-8859-1?Q?0i4f9sCIyOAd7UY8U7GWBYZjasU1jjpixEhFXu1+NPbEi3wXyY/i8N7AdO?=
 =?iso-8859-1?Q?R5OoFeSr1pO7TxLvb4xtfnXnXPYHTnpn9iEIG5JNHJkbi0GiGOLScn76rl?=
 =?iso-8859-1?Q?ifGczjJegVVhVt1Egb8ClEux2bCQliD0YY+fbNQpVTsVrjjnV7TYXmMosB?=
 =?iso-8859-1?Q?BnRSLe6QSI9dxELD2MPkP63s6rqnhbwLo6Zq9swMOywdTiVXokzxE24+Hv?=
 =?iso-8859-1?Q?IdHMOmHExPZJ7KN7pfEQlJcvcD0pzeprOe44q0KG3sEn0p35g3Zs25lJ0i?=
 =?iso-8859-1?Q?ce2Gd/nuusk8KTs6ZJ/VTdrifz3tlYdJB8UDubWL4/ng=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6651.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?en9A4gu+yEg3Kqd1ofgJIJ5MfTfIPYkw9KJlgoGIXgBH9Swd8TsHEHnNjp?=
 =?iso-8859-1?Q?bl15ihCa415SpzKpBV+5V41bGlJZRo3l7wDrlyOoYsM0G9vwGfeu0TBPDk?=
 =?iso-8859-1?Q?WfE5D3iHUfBlAWGJaf4ybsfjRjzuLSCvYKjPTXn2dABShizXy8d4F4CNsP?=
 =?iso-8859-1?Q?/sbDH3y+lyV3o8uh3hBKlk8sSjW2IRRWHJ8U+ZAE2RZvaWMNFCjfi7y8ed?=
 =?iso-8859-1?Q?JIviHDGabv52L4WklYqF14YNKBh7wM+y1T+9e0k2B4rqWdB3hltugjINQo?=
 =?iso-8859-1?Q?3+o3fYhRDYBzsXta38Fj2oi2qOx+zyCYzb963nCHKkwmYE7gqVF5HaAmdl?=
 =?iso-8859-1?Q?7sfhxebgi496nPcAxdfQsH+TLrM7cwfzQOqlw1lNHyuO1cnXGAncL3E5H3?=
 =?iso-8859-1?Q?OnGj4ypF6/BuydsFBRSVSIjM4xk58y0TcLtqae2pqDFGkmR6rIRSufy1Sw?=
 =?iso-8859-1?Q?KHQK/Q69XLp0UKZC3OzvuAagSievC08BWDT371547GgogrTJRQeo9+9WxA?=
 =?iso-8859-1?Q?InJFTZgQuCv5CzyHfzk48em/a57xPcGypN9Tg5t5DNWruux6az3DWYxZg0?=
 =?iso-8859-1?Q?BrXhb3X6RC0CW3+2LK2SsbVN1UxBoPSiXuDldzpWlE97woVSIL7/Jy5f/P?=
 =?iso-8859-1?Q?i9GI5o/VYwfD/QJV8t5BUt7uwlsE8Kdup0GdVyNDbw3cE+y5/VfOhVyHE9?=
 =?iso-8859-1?Q?bv3a0bpdUK0eMccLiIsH78m5DpiIITvjog/g9oLhYRiWix8TDA3lRIej9+?=
 =?iso-8859-1?Q?2egcyMANnqKjNKo7MVBTFwbRAKGpYh3ZNmZu+RU1UKwO2oHufCCoei61d/?=
 =?iso-8859-1?Q?37HgZqi8KfayhVbm+IFU+OWszas3RnsgzIDFYrxICmTQifwppuz59xiROi?=
 =?iso-8859-1?Q?c+IS6xf5n+eDyRwhWr5yeBjpTBXCkUynf8J8KviUErK3zuNsoi7u6aTnQ/?=
 =?iso-8859-1?Q?v9yD9Y9tcpaFJkZArdjnQezjBz4iYf78lEkUyWXV6tuWdgsG5wVjpMGA7N?=
 =?iso-8859-1?Q?fVLfUMvH3jNpKBHuiO84mLblgHWwGnNxW3ZvFxk9jp4QaQQ4hv2BnyVhOs?=
 =?iso-8859-1?Q?JEiTQz55dAjgntG1oZwrmiqtYml83r6rVhiOD6eahDyTC1Wy20maSEHBKL?=
 =?iso-8859-1?Q?OtXFKavQygzoLvZuVyclp77akEnShKHBbKUe9OaxsXT6wx/HNLcqqtA4gm?=
 =?iso-8859-1?Q?YFx/obtmD475/kxQWgfuNabK7TZB1Z9QiUxU/Zdrd5TpEEuNgmykEId6Jx?=
 =?iso-8859-1?Q?WznYOrx+hJfdKkGzXoipYB2N0urMiRB0cjneuV/Rj803Cm1PMuDtcW82G+?=
 =?iso-8859-1?Q?L/VIHjR8gqezf/NQeRtcaMYscJjZB2Nvep8WejQmar+8jJ2I1BpHkyEB+q?=
 =?iso-8859-1?Q?Lm3MYAaBrdANsaHo5rLivOtI0fqroHUBdnMemx+HFQsh1TtaYh7vdGycKY?=
 =?iso-8859-1?Q?jbHhI7H6RMI8kwoaj4OKV94zTtV2O8NiW4k6D5swyj0TnoeofqeoRbSxDE?=
 =?iso-8859-1?Q?NRTojP+m6LYnm/rctkp9GTzn5/Rfeg+fs5wB95GT4iIQphCcicPEBJIVKC?=
 =?iso-8859-1?Q?HG8Kfqsf9BxbsSHiXygrqcIzERXfxJngSdf9oHQi/Vk/bPE5sF4a76a65f?=
 =?iso-8859-1?Q?29IEuqBWmTZvnYy8iJKjt9/Szd1m/Mra9v?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e67aaed-c31c-426c-7090-08ddc284fa6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 03:17:34.8773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zH9KRgQ9TUXugtQy1/MWe645e7j/E2lUfJMBbcAHf/Nk5sIWK/vuFYld++ajUUKkERJjCELoN3LVxXX+J6VhWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7732

Hi Dmitry,
	Update the status.

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
Sent: Sunday, June 29, 2025 1:01 PM
To: Marge Yang <Marge.Yang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Vincent Huan=
g <Vincent.huang@tw.synaptics.com>; David Chiu <David.Chiu@tw.synaptics.com=
>; Derek Cheng <derek.cheng@tw.synaptics.com>; Sam Tsai <Sam.Tsai@synaptics=
.com>
Subject: Re: [PATCH V1] Input: synaptics-rmi4- Add a new feature for Forcep=
ad.

CAUTION: Email originated externally, do not click links or open attachment=
s unless you recognize the sender and know the content is safe.


Hi Marge,

On Thu, Jun 19, 2025 at 11:25:00AM +0000, Marge Yang wrote:
> From: Marge Yang <Marge.Yang@tw.synaptics.com>
>
> Forcepad devices will use F21, for click simulation due to lack of a=20
> metal button, so we add F21 support to make forcepad support click=20
> function.

I guess with this we can remove the blacklist we have for forcepads in driv=
ers/input/mouse/synaptics.c?


[Marge 07/14]
The current version's detection method does not support the F21 design from=
 12 years ago.=20
I will discuss with the Synaptics firmware team member how to add support, =
and it will be implemented in a future release.

>
> Signed-off-by: Marge Yang <Marge.Yang@tw.synaptics.com>
> ---
>  drivers/input/rmi4/Kconfig      |   8 ++
>  drivers/input/rmi4/Makefile     |   1 +
>  drivers/input/rmi4/rmi_bus.c    |   3 +
>  drivers/input/rmi4/rmi_driver.h |   5 ++
>  drivers/input/rmi4/rmi_f21.c    | 126 ++++++++++++++++++++++++++++++++
>  5 files changed, 143 insertions(+)
>  create mode 100644 drivers/input/rmi4/rmi_f21.c
>
> diff --git a/drivers/input/rmi4/Kconfig b/drivers/input/rmi4/Kconfig=20
> index c0163b983ce6..086013be6a64 100644
> --- a/drivers/input/rmi4/Kconfig
> +++ b/drivers/input/rmi4/Kconfig
> @@ -82,6 +82,14 @@ config RMI4_F12
>         touchpads. For sensors that support relative pointing, F12 also
>         provides mouse input.
>
> +config RMI4_F21
> +     bool "RMI4 Function 21 (PRESSURE)"
> +     help
> +       Say Y here if you want to add support for RMI4 function 21.
> +
> +       Function 21 provides buttons/pressure for RMI4 devices. This incl=
udes
> +       support for buttons/pressure on PressurePad.
> +
>  config RMI4_F30
>       bool "RMI4 Function 30 (GPIO LED)"
>       help
> diff --git a/drivers/input/rmi4/Makefile b/drivers/input/rmi4/Makefile=20
> index 02f14c846861..484b97eca025 100644
> --- a/drivers/input/rmi4/Makefile
> +++ b/drivers/input/rmi4/Makefile
> @@ -8,6 +8,7 @@ rmi_core-$(CONFIG_RMI4_2D_SENSOR) +=3D rmi_2d_sensor.o
>  rmi_core-$(CONFIG_RMI4_F03) +=3D rmi_f03.o
>  rmi_core-$(CONFIG_RMI4_F11) +=3D rmi_f11.o
>  rmi_core-$(CONFIG_RMI4_F12) +=3D rmi_f12.o
> +rmi_core-$(CONFIG_RMI4_F21) +=3D rmi_f21.o
>  rmi_core-$(CONFIG_RMI4_F30) +=3D rmi_f30.o
>  rmi_core-$(CONFIG_RMI4_F34) +=3D rmi_f34.o rmi_f34v7.o
>  rmi_core-$(CONFIG_RMI4_F3A) +=3D rmi_f3a.o diff --git=20
> a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c index=20
> 3aee04837205..47fe7a88c92b 100644
> --- a/drivers/input/rmi4/rmi_bus.c
> +++ b/drivers/input/rmi4/rmi_bus.c
> @@ -360,6 +360,9 @@ static struct rmi_function_handler *fn_handlers[]=20
> =3D {  #ifdef CONFIG_RMI4_F12
>       &rmi_f12_handler,
>  #endif
> +#ifdef CONFIG_RMI4_F21
> +     &rmi_f21_handler,
> +#endif
>  #ifdef CONFIG_RMI4_F30
>       &rmi_f30_handler,
>  #endif
> diff --git a/drivers/input/rmi4/rmi_driver.h=20
> b/drivers/input/rmi4/rmi_driver.h index 3bfe9013043e..18fdf2a166d5=20
> 100644
> --- a/drivers/input/rmi4/rmi_driver.h
> +++ b/drivers/input/rmi4/rmi_driver.h
> @@ -115,6 +115,10 @@ static inline int rmi_f03_overwrite_button(struct=20
> rmi_function *fn,  static inline void rmi_f03_commit_buttons(struct=20
> rmi_function *fn) {}  #endif
>
> +#ifdef CONFIG_RMI4_F21
> +int rmi_f21_report_pressure(struct rmi_function *fn, int i); #endif
> +

I do not see definition for this anywhere in the patch.

[Marge 07/14]
I will remove it in next patch.

>  #ifdef CONFIG_RMI4_F34
>  int rmi_f34_create_sysfs(struct rmi_device *rmi_dev);  void=20
> rmi_f34_remove_sysfs(struct rmi_device *rmi_dev); @@ -133,6 +137,7 @@=20
> extern struct rmi_function_handler rmi_f01_handler;  extern struct=20
> rmi_function_handler rmi_f03_handler;  extern struct=20
> rmi_function_handler rmi_f11_handler;  extern struct=20
> rmi_function_handler rmi_f12_handler;
> +extern struct rmi_function_handler rmi_f21_handler;
>  extern struct rmi_function_handler rmi_f30_handler;  extern struct=20
> rmi_function_handler rmi_f34_handler;  extern struct=20
> rmi_function_handler rmi_f3a_handler; diff --git=20
> a/drivers/input/rmi4/rmi_f21.c b/drivers/input/rmi4/rmi_f21.c new file=20
> mode 100644 index 000000000000..93ef2331ed16
> --- /dev/null
> +++ b/drivers/input/rmi4/rmi_f21.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2012-2025 Synaptics Incorporated  */
> +
> +#include <linux/kernel.h>
> +#include <linux/rmi.h>
> +#include <linux/input.h>
> +#include <linux/slab.h>
> +#include "rmi_driver.h"
> +
> +#define RMI_f21_INPUT_REPORT_DATA_SIZE       6
> +#define RMI_F21_INPUT_REPORT_FORCE_CLICK_OFFSET      5
> +#define RMI_F21_TABLE_FORCE_CLICK_OFFSET     8
> +#define RMI_f21_FORCE_CLICK                  0x01

Use BIT(0) here please.

[Marge 07/14]
I will use BIT(0) in next patch.

> +#define RMI_f21_DATA_REGS_MAX_SIZE   19

Why such a big difference in F21 data size between HID and other transports=
?

[Marge 07/14]
F21 Data Structure:
Data size =3D (number of Forcepad sensors) =D7 2 bytes (Currently there are=
 4 Forcepad sensors)=20
+ 1 byte for the Forcepad button state
+ (5 fingers =D7 2 bytes) for finger pressure values (Supports five fingers=
, each finger's pressure value occupies two bytes)=20

HID Attention: 6 bytes
The pressure values for the five fingers are each represented by one byte, =
so that's five bytes total, plus one byte for the Forcepad button state.

I will discuss with the Synaptics firmware team member how to add support b=
y representing it through a lookup table.
Update it in next patch

> +#define RMI_f21_FORCEPAD_BUTTON_COUNT        1
> +
> +struct f21_data {
> +     /* Query Data */
> +     u8 data_regs[RMI_f21_DATA_REGS_MAX_SIZE];
> +     u8 input_report_data[RMI_f21_INPUT_REPORT_DATA_SIZE];
> +     struct input_dev *input;
> +     u16 key_code;
> +};
> +
> +static irqreturn_t rmi_f21_attention(int irq, void *ctx) {
> +     struct rmi_function *fn =3D ctx;
> +     struct f21_data *f21 =3D dev_get_drvdata(&fn->dev);
> +     struct rmi_driver_data *drvdata =3D dev_get_drvdata(&fn->rmi_dev->d=
ev);
> +     int error;
> +     bool pressed;
> +
> +     if (drvdata->attn_data.data) {
> +             if (drvdata->attn_data.size < RMI_f21_INPUT_REPORT_DATA_SIZ=
E) {
> +                     dev_warn(&fn->dev, "f21 interrupted, but data is mi=
ssing\n");
> +                     return IRQ_HANDLED;
> +             }
> +             memcpy(f21->input_report_data, drvdata->attn_data.data,=20
> + RMI_f21_INPUT_REPORT_DATA_SIZE);

I do not think you need to do the copy, you can test the bit directly in
drvdata->attn_data.data buffer.

[Marge 07/14]
I will use drvdata->attn_data.data buffer directly in next patch.

> +             drvdata->attn_data.data +=3D RMI_f21_INPUT_REPORT_DATA_SIZE=
;
> +             drvdata->attn_data.size -=3D=20
> + RMI_f21_INPUT_REPORT_DATA_SIZE;
> +
> +             pressed =3D !!(f21->input_report_data[RMI_F21_INPUT_REPORT_=
FORCE_CLICK_OFFSET] &
> +                                     RMI_f21_FORCE_CLICK);

No need to double negation here, converting to bool will do the right thing=
.

[Marge 07/14]
I will correct it in next patch.

> +     } else {
> +             error =3D rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr=
,
> +                                     f21->data_regs, RMI_f21_DATA_REGS_M=
AX_SIZE);
> +             if (error) {
> +                     dev_err(&fn->dev, "%s: Failed to read f21 data regi=
sters: %d\n",
> +                             __func__, error);
> +                     return IRQ_RETVAL(error);
> +             }
> +             pressed =3D !!(f21->data_regs[RMI_F21_TABLE_FORCE_CLICK_OFF=
SET] &
> +                                     RMI_f21_FORCE_CLICK);

Same here.

[Marge 07/14]
I will correct it in next patch.

> +     }
> +
> +     input_report_key(f21->input, f21->key_code, pressed);
> +
> +     return IRQ_HANDLED;
> +}
> +
> +static int rmi_f21_config(struct rmi_function *fn) {
> +     struct f21_data *f21 =3D dev_get_drvdata(&fn->dev);
> +     struct rmi_driver *drv =3D fn->rmi_dev->driver;
> +
> +     if (!f21)
> +             return 0;

Is this actually possible for f21 to be NULL here?

[Marge 07/14]
I will remove it in next patch.

> +
> +     drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
> +
> +     return 0;
> +}
> +
> +static int rmi_f21_initialize(struct rmi_function *fn, struct=20
> +f21_data *f21) {
> +     struct input_dev *input =3D f21->input;
> +     unsigned int button =3D BTN_LEFT;

This variable is not needed.

[Marge 07/14]
I will correct it in next patch.

> +
> +     f21->key_code =3D button;

        f21->key_code =3D BTN_LEFT;

> +     input_set_capability(input, EV_KEY, f21->key_code);
> +     input->keycode =3D &(f21->key_code);

Drop extra parenthesis.

[Marge 07/14]
I will correct it in next patch.

> +     input->keycodesize =3D sizeof(f21->key_code);
> +     input->keycodemax =3D RMI_f21_FORCEPAD_BUTTON_COUNT;
> +
> +     __set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
> +
> +     return 0;
> +}
> +
> +static int rmi_f21_probe(struct rmi_function *fn) {
> +     struct rmi_device *rmi_dev =3D fn->rmi_dev;
> +     struct rmi_driver_data *drv_data =3D dev_get_drvdata(&rmi_dev->dev)=
;
> +     struct f21_data *f21;
> +     int error;
> +
> +     if (!drv_data->input) {
> +             dev_info(&fn->dev, "f21: no input device found, ignoring\n"=
);
> +             return -ENXIO;
> +     }
> +
> +     f21 =3D devm_kzalloc(&fn->dev, sizeof(*f21), GFP_KERNEL);
> +     if (!f21)
> +             return -ENOMEM;
> +
> +     f21->input =3D drv_data->input;
> +
> +     error =3D rmi_f21_initialize(fn, f21);
> +     if (error)
> +             return error;
> +
> +     dev_set_drvdata(&fn->dev, f21);
> +     return 0;
> +}
> +
> +struct rmi_function_handler rmi_f21_handler =3D {
> +     .driver =3D {
> +             .name =3D "rmi4_f21",
> +     },
> +     .func =3D 0x21,
> +     .probe =3D rmi_f21_probe,
> +     .config =3D rmi_f21_config,
> +     .attention =3D rmi_f21_attention,
> +};

Thanks.

--
Dmitry

