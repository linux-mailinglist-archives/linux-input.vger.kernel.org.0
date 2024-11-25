Return-Path: <linux-input+bounces-8226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB549D79CE
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 02:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82A0216365D
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 01:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B79010F9;
	Mon, 25 Nov 2024 01:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="noRfS9ck"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AA917D2
	for <linux-input@vger.kernel.org>; Mon, 25 Nov 2024 01:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732498725; cv=none; b=rT4QLOZdiQRWH1q7VhcOhzgQ412bSs/9742yZp46252gqKUWsHlw4qgM5+aDdoQ5ozVE3hPB1ZT0bciW44q+AMl9ILFtFchrtsfm6ZadWnb2I8hOfQ7Aug4087FksruM2IiyNYv80k1vmv8OGrMSlP84UqwBgPe+wElKByjBiag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732498725; c=relaxed/simple;
	bh=tw4UowcLewNsZn1tLkuoj4uJRwQWtHHX9Vgts704/sE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=pUH4pkCj+j7eFLxPeLfYqEiED6hYlNzef40lZDdhGR5LNN55NMXIbm1UscUQxx1UX0FMiHLqWmHQDzpD+et1Lfp5WQr5MNQOJ80ZWxeaMG03Kb+n9lz9WgiHbWmqZOpRZz9DRCMEpipZcQzSuCy+Fz6SnEfLu79EQJXmt970RiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=noRfS9ck; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1732498720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7B/53V7x6R9BUkd9+b/bnfe1YsaSRR0aZ9P7A/eeMdE=;
	b=noRfS9ck95/Pmzuj7NF7bbFoYWHvj1xf1JVlhezbqlefvNrY5XhteFtqn0TJ+WkLzk0QIi
	kHvVzLPZ4tzBQOYr2foRmvtxYtAhN8FSP6p2Ak2iIHCE5FoFovze+fnqTCEa83AgcnKtWY
	RVVFTEOlrOFCRq9UvqL1yUhLGqp6PWw=
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-DQZixIpaO7i-RkN6TlGF5w-1; Sun,
 24 Nov 2024 20:38:36 -0500
X-MC-Unique: DQZixIpaO7i-RkN6TlGF5w-1
X-Mimecast-MFC-AGG-ID: DQZixIpaO7i-RkN6TlGF5w
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by DS0PR84MB3626.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Mon, 25 Nov
 2024 01:38:30 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 01:38:30 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Jiri Kosina
	<jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>, Benjamin Tissoires
	<bentiss@kernel.org>, Jaroslav Kysela <perex@perex.cz>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH 0/2] Introduce Poly/Plantronics mute event support
Thread-Topic: [PATCH 0/2] Introduce Poly/Plantronics mute event support
Thread-Index: AQHbPrAsRdAvdaMC90qsdqhaQQhyL7LHN6AA
Date: Mon, 25 Nov 2024 01:38:30 +0000
Message-ID: <EA2PR84MB3780164F206397BA8D5E22268B2E2@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
In-Reply-To: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|DS0PR84MB3626:EE_
x-ms-office365-filtering-correlation-id: da011209-8a4e-47e9-133e-08dd0cf1ddc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?NWm8cX2exDCmfC0s3kRtAh4t1ozTDwsTUT3fsDCq+FQiQ5BvyZEpbvOayhtu?=
 =?us-ascii?Q?pcQOgYeHr4KLTW0JVJFT1JLBlLN0ocW86UeQ0KPqNNsxjx6ojNfErfL1hSe6?=
 =?us-ascii?Q?cuoS5i93nFg+E041hc8ysOqEeKlv9v0dE/WwstKivIU4qGD8VeB+3zX6nXUW?=
 =?us-ascii?Q?QZ1BDjF0dEfEsb/Lurm00j7sI4HLCaI5kK5hAwtUaGpOi+Stolq3CRrLONZI?=
 =?us-ascii?Q?2Z6180C3WKqOEVLWa5foTcDpETdhTvfDjK9svC05rm8/NGvfpY6IrGz7HgYY?=
 =?us-ascii?Q?lZkF3043VcHfi8NIxiHFqKtmyQgWn8aaPJlGiGn7rIz5jMpr95EnP5cQPVNk?=
 =?us-ascii?Q?VPfwCb+B0fslLBYtfyVl43RF8THiV7Id/e0wvRfXSlgWESRZshslLo/JinDV?=
 =?us-ascii?Q?GW1AZrMk1D57ghoZYUrDMjmDupzLt/vFdInxPtoj2sHAsY+UQdMMG8DYAI4Z?=
 =?us-ascii?Q?594ZAFjYB/vh4/aaaGwNw7XOEtyI874jiVRxE8pEzvjYn8mDOnC/DCnW6rxc?=
 =?us-ascii?Q?zbKWHE0Ws//8gvrw8+ypzLEIDThhweXdijlInLr/W0XMziBkKbmmIsKUfuyB?=
 =?us-ascii?Q?0nDWrJlM3X+jU/CsrQ5sVtQzUpJXBwoQ7W0ovRWtZILQ0VRwTtk7NUM1aBUl?=
 =?us-ascii?Q?SBPQvze6O13S3VCvWbyVcg0+LAXZ4U/LRx/KOinKXihRpfT9rczdQxm7Wq/S?=
 =?us-ascii?Q?rLGZ+D1IdhzwNDG5TRY4zE6EhLKDD7TKj3ZPcJNTbLrFO7PMlmgrR0WhuBFQ?=
 =?us-ascii?Q?32QdtrTLh66G1NulEAYbIpmctZG60E3oCslkeNvAnTxsDtym9/sEkYefjxr0?=
 =?us-ascii?Q?jqiHVkq+lMedG2wIzGLsXIiQRoNijeBYxWJ3UETPF8C2r1TTcgSfcNUjDZ/K?=
 =?us-ascii?Q?VtUTM0WLoxy51xhTaLqL0RCv5fEvrC3sgDu3mbzS1mjmmHaYthoU0ISFzntv?=
 =?us-ascii?Q?aaFapxVQYKZN5JI9z9VoaNKdmeVgiRIKCOBW4z+I8SZ03SAM4gP2fFRgqgpO?=
 =?us-ascii?Q?TXHo2TfMgtydeGetTq4i4WycDF4bw7Si8Vx2luSmNdBf6AfFgiRiix5pSJ48?=
 =?us-ascii?Q?6U3BzU/BVqoZccvuFc2AcbjPJnWmymE04H02hbGG8MHaPVB3L+C5oJBogsYS?=
 =?us-ascii?Q?F5lHjO8YCOw08MpIkmJJokmRaVWk80YjgY7uvnpkMDvUsmGTA+2j+9M/s7Hj?=
 =?us-ascii?Q?xLKL0Mipv26yKdYGtVFSixmVbDW3KRUzTN/mC84SxPQOf0uv9tC9X9dRZaOG?=
 =?us-ascii?Q?WVL25PWblJXva4OJAfdR1XJm2UT9XAoeWcYDHIjvtw4hRcRY6W5jV8fGsnNe?=
 =?us-ascii?Q?aLfrsQMs0E6mI1YEg+GXWX7p5WUboEgeV1X35V8utDrkov+mGkM37Lf1PXFt?=
 =?us-ascii?Q?JwEBxCtcrrxHAyi2ttQfQZ9nt/p3Y6h4F0pkEa1OLfJvqKi2wQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7S2tNIxmOoa76O9MB9CDRMAuLolqeGi3EdpK5XboBteiX+U+BUQGj5rEsss6?=
 =?us-ascii?Q?abtu7r0Fba50s91ifQzLQnkl/wk5GeaqXF20BRmcSAbUR+rZ738tVJ0EFDGE?=
 =?us-ascii?Q?jeIXLuBMUc1pzZFSzbCTkFt/FKYERiX7iCvB/9g3PdNmUgz+HnQqy/St9cXS?=
 =?us-ascii?Q?pNJFiHqv5WRrOjLsmuFK4ReAtYmcYJGcdw2BVI0U1kj2oyE+6etca6V1V4x0?=
 =?us-ascii?Q?qNueOG8vKSkPZyj+XdEb4sK3m37WKBWMF5jHlqlTVXRz4Ni8JlBT9Ja9ugGO?=
 =?us-ascii?Q?zdKtnPv5Qnendbn+huARIiHDTN8puK3fyCT+7eAWk34pLWxHwxJT5dhYg8yF?=
 =?us-ascii?Q?3C98BbOa+lFDvJar6UJFgveBJw3XLqtFvV1sGh4EiZ767BOwYPeRGIZZ8qt1?=
 =?us-ascii?Q?McyUytoV55Oi9bW20EsnqIcdCWKGaWJwc/J0YLzh7NhVEj9yspoAkPEXgnwe?=
 =?us-ascii?Q?fJRwzGrXbslz66c0aWpI+EWgoOUJnwZKy2kpdmIhY5cz9a6tW+v36dlJPf01?=
 =?us-ascii?Q?+Jl0UgGoRjEIqzprtoNyOFxGXb7T7XE5toDf4Ag4Gtnkye13gE0jfWSgd+nx?=
 =?us-ascii?Q?scomp6t4f/uD5OVS1g4BFTsPWBmYOcRhWV9g86iLpZ/FQ0RnZ1RfkUIUB6q5?=
 =?us-ascii?Q?fTQiR9C81tB7W2VOJm5bkSIa4JQunozoyAEMBR8TdDz7TcHDMJRZKc6cfiYI?=
 =?us-ascii?Q?Ov0/oX4UAIEihNiliKJ4a622AY/2rXDA1sGfppD/SPGB+YQVaH5UV1DicHr+?=
 =?us-ascii?Q?5tB5MIoF/Rza2SqecQDoGjBNsOgG3t5Fead6b0fbL5cBSJECfIVwA+ta7/mO?=
 =?us-ascii?Q?R0a6yeLIVf7vmhcJg5is7a8o3k6ZgGE+2vgqnuoqIettiwMuFPqHgQ8mTd7m?=
 =?us-ascii?Q?7KQmivfK/yokOrgBD3XM3uGLRoxQD83BzJTiKmRE70JZAibdHZ3J9HkeLqfX?=
 =?us-ascii?Q?vCftn5tABIna87VzVkY9H7gcjIndHpsJ9iTQqJx90oVjP1i4FEzN9jlV9Hf2?=
 =?us-ascii?Q?qjadqWKp0OKeDOxTShBlIeX652WBkpSMJiiIs4Q94VYy7psCZ3z8NQ4rZUaP?=
 =?us-ascii?Q?P79OqvWcBrVMMTGGO6vGzsyrmW9gHzzb0DzfH0S53ILgFFJz73kFkfOGC8oW?=
 =?us-ascii?Q?unFj5idgUAgvQYUoDjV6yh/mw2qw4V/bXI9RWc7stybkBfSDCVE5rFkvGJsA?=
 =?us-ascii?Q?t8ctc7fLMRzum7cceAjvpjvYtJ37+KHY+k10AVU+hsPp7T8hru7ZovpFTEjp?=
 =?us-ascii?Q?Tzw2uW5XNsqy+fKnUESAtRpmi5fzy4VQI8hvFfRiLyyWXK7aonapvmi38C0E?=
 =?us-ascii?Q?BUIiAEnwc+8fS8MPvh+3gwm9b02HliMEElPH9soWQVyjXpBfDSn5OhLpTme/?=
 =?us-ascii?Q?oKY/uzufPK0qnCwT6CVl5G2h7Z6IRrVMctFCYXOX6axyGZgT7aQUapmuqKwU?=
 =?us-ascii?Q?cODcqQK+S7eP9MO7NQklbuzB1qlMgR9JTEYBKt/ZUsqjb3eIVlFHjfh5KdMY?=
 =?us-ascii?Q?Axbw7PmvoKa4k8NlH+vNZS5N2RVm+e1IFeNoey/hnWnWuNHNQf8eDM84PBES?=
 =?us-ascii?Q?kb+SZeB2ZtY2NhvHCJ0=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da011209-8a4e-47e9-133e-08dd0cf1ddc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 01:38:30.3209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8fUfGg9FwoD+uMk+z2vw+a2cArPRC/MJICNC4SAvnn98wtMasYdGBpiNXhGWtcHlT7TR4hEFKa6JmGJcd/YOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR84MB3626
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lN7uUqQkMLHhSqoceCZ0-tnB_r1Bi6CrN2U4N8p3iao_1732498713
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Terry,

Thet are OK for me, because my outlook will change patch format, would you =
mind to add these info for me directly. Thanks

Regards
Wade

-----Original Message-----
From: Terry Junge <linuxhid@cosmicgizmosystems.com>=20
Sent: Monday, November 25, 2024 4:33 AM
To: Jiri Kosina <jikos@kernel.org>; Takashi Iwai <tiwai@suse.com>; Wang, Wa=
de <wade.wang@hp.com>; Benjamin Tissoires <bentiss@kernel.org>; Jaroslav Ky=
sela <perex@perex.cz>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>; linux-input@vger.kernel.=
org; linux-sound@vger.kernel.org
Subject: [PATCH 0/2] Introduce Poly/Plantronics mute event support

CAUTION: External Email

Hi Jiri and Takashi,

I'm not sure how it works with two different maintained trees but this patc=
h set needs to be applied and flow upstream together.

If the HID patch is applied without the ALSA patch then mute sync issues wi=
ll occur with multiple Poly/Plantronics product families.

This patch set was tested by Wade and myself with multiple Poly/Plantronics=
 product family headsets.

Hi Wade,

Please feel free to add your Signed-off-by: and/or Tested-by: tags, as you =
see fit.

Thanks,
Terry

Terry Junge (2):
  HID: hid-plantronics: Add mic mute mapping and generalize quirks
  ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
    names

 drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
 sound/usb/mixer_quirks.c      |  35 +++++++++
 2 files changed, 100 insertions(+), 70 deletions(-)


base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
--
2.43.0


