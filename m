Return-Path: <linux-input+bounces-5900-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1196095A
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 13:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71A351C22AA2
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 11:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470241A0721;
	Tue, 27 Aug 2024 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="N6CdNxsh"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD5719EED8;
	Tue, 27 Aug 2024 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724759663; cv=fail; b=qOND88vZKImAem2858th35psvFlQY6QeeMwFa8O1u+zXcA4CygkIJtft213KVqZYdwYPrsdSqg9HyDVKnO8yIwA9xQDAIt+fVEUBS2lvZXhlZgDMtRrfwmmqePGDc7GC1qU9w/aUbKgdVl7lW9KHm7XVwbt7WudRlE2sSgfLyY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724759663; c=relaxed/simple;
	bh=ffed5afBtITP+XO85iajlG8ftbhL2eMxoXbnnDA/sJY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hTC+9uKOcj13tkMHkVw6R053DZiLweNZz0tRwfQxHZ56fxwG7m87HF9CIRV4agx0WdsNxdBXYoVn3dvPiuu+ciT51zY3xqBp93h31t9xt9JeEJP/sKuHN9tFHX74rHn8zi8JEU91I6/NeNEs7REPtzu21pS7lvhw715CmN1W+mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=N6CdNxsh; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R82a0h019870;
	Tue, 27 Aug 2024 05:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=82qLJ
	kzzGrEwk+PG2ODkrtf3DiL7aS6WmpHJO3Pu5D0=; b=N6CdNxshwoIGEc4BLBed+
	BDbgq9+J0LLxTN7MIyRcFS3x2FmUreTV9d36qkC4DpH+yC231UCkgxwgNkbCPLU5
	kYYYV6FJcbxr4QVk49UNYT3Y45P5T+VgJf5e5QhOLkYipie+AQNS0SciDEuyEKBz
	4Zky/RnIsfZPYziZw7kbZOaq0S9sQ43FdhYUtvwERwAVXLiEx47sZe/Kb6pqn7qw
	PDGHbNrYTgPL+pPD7WtxtTiQ/Yxl4WtPTBpQIRzmOA5XgJY3kYkoyequZhHxuFUX
	CwmBGp+KOUkkcoCoc5xEi3k8dQUl/2Mc4iSNjY3dhGEnWfz3uJCG93j5rnE9h8Hm
	w==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 419axpgdbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:52:18 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsVwF3jH3iji8kR51GmA3m2jwH4yTHJWINr774WioVaP/BuqK4nUyTfaOp9P4k+CEutUtPvHMT/j0sDCVCP7Zy7NygR2xtXGg98+ayKWZlHQeyTdUfIwQhH99wk6PpVfm2mPUXVsvTRfFuQWXlfiypRx9lyZuGcE8Sr+Bqu+zlZumrSe8Y+sM2HSxfJRb+bURdPgJ1dAVGDB0XYwqXLqF21q5JUeyKqV43ve71gei/mlSMptib/3ONe5QQeJO51J1h2tittpHVCbI4bQ38lWrRFXp44GARNgR1Ojg3cDSjAubm/K25ptYGOeCLGFqC3vk9CESom1ULcwoHfRaZ8JGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82qLJkzzGrEwk+PG2ODkrtf3DiL7aS6WmpHJO3Pu5D0=;
 b=O/gQnTP38ySyYEzegFopCxXp76Zmx4Sr0JUVEe54fZJ+ok2EzJ0YXwt9HxiBtPSK43vUKlEFqfXZ+A3BnaM7BIPOTmFa03451zy16jhjceztZBCJyjWl64E96RFUvBjxrLFkMtjKf80hdJTCBl4tDm59kKqZYSCGe+07V6KlsrDp41ed5RHG4NK5qg+teJJMgMe99XcHU7bhne3fsl23apExLg8hN5Pj0xuED4O4cJnz58oVkW0N3vuUEnRl0AOhGi0Wa5L4T07bXwXuRjaVGyMlHf/Z4np2VqrSfEFQdaKSbSMOfXf4HYlYYnTIk9qfzquyWCTWu3d2Xkh9m+em2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5)
 by PH0PR03MB6937.namprd03.prod.outlook.com (2603:10b6:510:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Tue, 27 Aug
 2024 09:52:16 +0000
Received: from PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28]) by PH0PR03MB6512.namprd03.prod.outlook.com
 ([fe80::c8b5:7953:eec1:cb28%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:52:16 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann
	<arnd@arndb.de>,
        =?iso-8859-1?Q?Nuno_S=E1?= <noname.nuno@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Lee Jones <lee@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "Agarwal, Utsav"
	<Utsav.Agarwal@analog.com>
Subject: RE: [PATCH] Input: keypad-nomadik-ske - remove the driver
Thread-Topic: [PATCH] Input: keypad-nomadik-ske - remove the driver
Thread-Index: AQHa8ke4SC1cvcFA5UGkey+OTBnAwrI64dag
Date: Tue, 27 Aug 2024 09:52:16 +0000
Message-ID:
 <PH0PR03MB651239F36ABA828A79579D1C8E942@PH0PR03MB6512.namprd03.prod.outlook.com>
References: <Zr-gX0dfN4te_8VG@google.com>
 <1bc01e00-7b70-4e90-8060-f3de3ec7afa3@app.fastmail.com>
 <ZsNcpom_Fm5uCyEj@google.com>
In-Reply-To: <ZsNcpom_Fm5uCyEj@google.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 =?iso-8859-1?Q?PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXG?=
 =?iso-8859-1?Q?1oZW5uZXJpXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAt?=
 =?iso-8859-1?Q?ODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMTA0ZWIzM2QtNjQ1YS0xMW?=
 =?iso-8859-1?Q?VmLWI5MjgtYmNmMTcxYzQ3NjE5XGFtZS10ZXN0XDEwNGViMzNmLTY0NWEt?=
 =?iso-8859-1?Q?MTFlZi1iOTI4LWJjZjE3MWM0NzYxOWJvZHkudHh0IiBzej0iNDQxOCIgdD?=
 =?iso-8859-1?Q?0iMTMzNjkyMjU5NDY1NDU3NzMxIiBoPSJ0L3dFRm1mWWlnOEpPUXZCaUhm?=
 =?iso-8859-1?Q?QzB5azBYcjg9IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSF?=
 =?iso-8859-1?Q?UxUlNSVUZOQ2dVQUFEZ0RBQUJEY0tqU1p2amFBZEtMcDZVaXNwZlMwb3Vu?=
 =?iso-8859-1?Q?cFNLeWw5SURBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQU?=
 =?iso-8859-1?Q?FTZ0lBQU80QUFBQUFBQUFBQUFBQUFBRUFBUUFCQUFBQTNMaFNmZ0FBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUo0QUFBQmhBR1FBYVFCZkFITUFaUUJqQUhVQWNnQmxBRj?=
 =?iso-8859-1?Q?hBY0FCeUFHOEFhZ0JsQUdNQWRBQnpBRjhBWmdCaEFHd0Fjd0JsQUY4QVpn?=
 =?iso-8859-1?Q?QnZBSE1BYVFCMEFHa0FkZ0JsQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQU?=
 =?iso-8859-1?Q?FBQUFuZ0FBQUdFQVpBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElB?=
 =?iso-8859-1?Q?YndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFERUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFB?=
 =?iso-8859-1?Q?QUFZUUJrQUdrQVh3QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNnQnZBR29BWl?=
 =?iso-8859-1?Q?FCakFIUUFjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBTzRBQUFBQUFBQU?=
 =?iso-8859-1?Q?FDQUFBQUFBQUFBQUlBQUFBQUFBQUFBZ0FBQUFBQUFBQXpnQUFBQU1BQUFC?=
 =?iso-8859-1?Q?T0FBQUFBQUFBQUdFQVpBQnBBRjhB?=
x-dg-rorf: true
x-dg-refone:
 Y3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3Qm1BR0VBYkFCekFHVUFYd0JtQUc4QWN3QnBBSFFBYVFCMkFHVUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQThBQUFBQUFBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBRElBQUFBPSIvPjwvbWV0YT4=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6512:EE_|PH0PR03MB6937:EE_
x-ms-office365-filtering-correlation-id: 366fa671-1fd3-4ba4-1572-08dcc67def16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dYOA/rsRr8oxwSC21w5L2OH+joLSUvx9o/kYoMzuGeiIVxWpWhNdTxqYQc?=
 =?iso-8859-1?Q?Y6CIwpYpRXvqDzS58lrRj6g1EZS119g8vCRdTPrO3Tozi/4wtlpB3cKj0Z?=
 =?iso-8859-1?Q?ScYpJd9EeSoGpIgrlD4o/tIAS5AT0cHfLXZrDdfVmR0shp0Pijewd3cG4m?=
 =?iso-8859-1?Q?r9jszxtVoFHCn/mLKtCk9khDikrLKnkfLgiqZELICy1WGdg1YCnxB3Qfwy?=
 =?iso-8859-1?Q?LLOT/Jg61duFkXVw4I4YaZuMUXqCcMQDzvfxuSFEKyhRtu4Igw8CyXX/7i?=
 =?iso-8859-1?Q?Fly4C1F4o4Ope7sdZO7pPNsUmIQZBNrs5zljrtIdLJMjB5u3b8+IgWzRZG?=
 =?iso-8859-1?Q?Tcq3DiGI4NREUyI9d544TuCtt1PXOezfbc5HJ/Rn0sosCl3onbYyP948RR?=
 =?iso-8859-1?Q?kY4+N4sNve4SIimG5LEW0/EzAoDCycusXz96ZwYZfu62vX/5mDbzyAgST8?=
 =?iso-8859-1?Q?oRxVAN4590ZrwSh5rWFh6GAlp6E9MAZlvvmv+DdIOpChKLd665PuZgwuzr?=
 =?iso-8859-1?Q?L0CasInFvE2vSdfDd8VjeiHGOdRXypaPOpechIzA2/ieV6iDikfwu11IQA?=
 =?iso-8859-1?Q?eVsTWLjuSyrS4lTdlfXDowgmEIABp+lWGdc8DWro5h8cv3xGIDcCC1Cc4f?=
 =?iso-8859-1?Q?3Hqa1NWCcbTeQpPLnizTUmcZlTz7ePaUpxMgrMRQl7mFS2CbeEf5zydUG6?=
 =?iso-8859-1?Q?nCxzReVHKC6WWXlSst7tdT5vmI+4xPVlUFf0GbtDmrsYmNNNlx2lP/gi6A?=
 =?iso-8859-1?Q?1IkysfMp1rXujTV1N3GBV/ztwL0xpLFfblAbpab36yW6HbW9q+QGojeDs0?=
 =?iso-8859-1?Q?J+YT1aWx5G5Ahkis5mv5j52rCwyJTVOPbWdC3ds8cKOp2FFv9ZmjDAb3Dg?=
 =?iso-8859-1?Q?puQFOJrr9OTvmIVcXzeLbKEPxz8grfNL4zBds7xuvVfuVusdIOdim2CzH6?=
 =?iso-8859-1?Q?zZpNUuLTJ6TftRUng7NyONkNbBAbhn4+AFzUn+XIY+qo4GlYfSAI8Rrej5?=
 =?iso-8859-1?Q?AAFZRqhc6N85G0yLixdmLaErfpL0paWyHz3tJH4VFGsiyJFINDUwOuIuCv?=
 =?iso-8859-1?Q?NQup6+5a2VeigFhLpYWWvlt4yYRUPLS7TUlHoCa7kGnUQPAYpj1mtQ9H6o?=
 =?iso-8859-1?Q?sdFzVeobTB3x8PS0lRil08zV1MQ0Yb4bqvbJgPtvATXm5g5xtnOVr5lFGO?=
 =?iso-8859-1?Q?PwPx1Fe26f2RFx8ACE6Wuy0WAsmQik4p+ekPo2iK+UBb0tR7cNIUIZMkNy?=
 =?iso-8859-1?Q?UIHjppnN/w8BeogYb1RdpwR9YX57xDG1SKRwY7ITSsJiaG+KjsNM0F2z5Y?=
 =?iso-8859-1?Q?JERt09A26L3Hq33rS6kH7HtKyXmoWR5XHpUmvYDuYT4UwYl4y6hU5I2Yu1?=
 =?iso-8859-1?Q?k95X9nRRRTVeLtZD8zPjaUDL031ea5CWh+dWF9WEOD+/CBLSf9ZqMWe+b8?=
 =?iso-8859-1?Q?gWkpdL28gz+YQ+1CveGxW+TF/Elcvjm3Mt3wbw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6512.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Qh4yI0J1ASQSsTo6t3hh5IJ0NalzyNuu8K/R3PmOf9gHWeLMvvUD7rltBf?=
 =?iso-8859-1?Q?pPYRFIAOZG6YVrFpVZmK7BS+lhdYHxNhE1x7vlhnVioKLQDFYtIwQERIQo?=
 =?iso-8859-1?Q?qSG3v8YsXPSAZhirfmXounRKZE6lzM9iyh/z5dDeYEEwSSMAlEC9DutXsM?=
 =?iso-8859-1?Q?PF9lsT+ipvCjYT7NKv+xVKjsgNxu0A4FSHV8cFDhexro3bEyxRmacB4NxO?=
 =?iso-8859-1?Q?IlfoVqghZsBTOaAUxNIesPf8nsNJIh4HwYDMRtwxqXaZSDx3I7Mk0Ajgvr?=
 =?iso-8859-1?Q?DErjGBh48EmRp3lgozeg4oj+prpyzaZQ7pKSyXFvZ1KPNa8Ty6keyVWaIw?=
 =?iso-8859-1?Q?UVJs5k+u6Mykhr2B/2zwX53/HFippKSyrCZScDuXVSc6yzsXZuIb2xMc4i?=
 =?iso-8859-1?Q?YKaCphFl1kyFOBwmTqQmaOwrvmA+DXpM6+Dye2B3OroefNwK7WZLkxYcGr?=
 =?iso-8859-1?Q?aSaM67u9piIB4Wkip388DJ+v54u5qt/1hfKGGacmSucqskQGgDZoZQCO2C?=
 =?iso-8859-1?Q?FVv/fM2gvUuNt2mn/9oNucmVxbqGRA3t1WoaNFgPWICVXQcnzsqYZrdwsA?=
 =?iso-8859-1?Q?tbcgiR+IChSbgcnFMXB2xsciHpiZpyS/ql+qwMJfGT86Iuoi60Mb75GBdv?=
 =?iso-8859-1?Q?T+mAvAhqgxFfWVm/fHatTJmGjfK7MQ8ROP1FrXPb9lt5x490eJgNXgn2Z1?=
 =?iso-8859-1?Q?zdXfTTehBx1rv42EJKrPBine6zNVpaXltYsyFpXZZw8eQSX8mZ0XceMccA?=
 =?iso-8859-1?Q?a3C1KQAaRgpUO3VspH9VLpLkHWi5poUSGQDK7gFID6ql/s1wHERbDMb7lS?=
 =?iso-8859-1?Q?guFVom5XVRi+qGpZpvnNH3gqxnx7GQnbUyyvvUba4kJI3NroFt/il+Rzwf?=
 =?iso-8859-1?Q?5LUgbACpc8VQiZWa6dFBSbhRa7iOfXQsc0zJldzWHjpg0vRxYFadbnqD5H?=
 =?iso-8859-1?Q?/IRG48G8W5+Emzn2QEvOzsjq1t42aaAVnCSXMJsSi6GcLBd5BeIH5YkJCY?=
 =?iso-8859-1?Q?6PieglNPN/Na9oME3OH592xyDNRfBXcVtGjaJp0+sROz78ixfg2ec5dmvk?=
 =?iso-8859-1?Q?f/wJuzv1aEtSzaURH8xeKcWjCyn4znGfoR6oo0sxB1wqDlX7ysOnWEo3mL?=
 =?iso-8859-1?Q?j7VOn2oUF8tfQhenGzKq55ACfc1N24+qIcy9GBj35J+FXFJ+Swn7/VuvFt?=
 =?iso-8859-1?Q?QKqa33S0qxd7yjHmB5yI15l2w0pd+AqVxP34W1ri37sJznegpXdWsM2l6f?=
 =?iso-8859-1?Q?uhvUcqck5REOtVjAj2wF3p7TQWdbRi010W5R+eU3gsHu/0WJomxErouAuY?=
 =?iso-8859-1?Q?jDQORjxX5O7NK7z9esq3OJn9CfDwD6qwYhLn0Eq3yODDhtnInt1YydK706?=
 =?iso-8859-1?Q?XxQF6wrrlmngRwVc54GlCZx0rOvshcDaTeHXnVzoOLu/TobZryrthvRe8z?=
 =?iso-8859-1?Q?xhtfodav02QZHh5taUuNWnyz511eiqbs1ih2kDw868v7ZNYYkLWLzO4aWW?=
 =?iso-8859-1?Q?/fr1R/hJB22QD3A9kJhcKaAV9eYd4Dq9p05UkEbkSQsu9gBD1skRz3hrtz?=
 =?iso-8859-1?Q?LtqwO7HyWwEMo1DKg/E8t234bgkWvaz8jMb/D3r5Ns2TQEUGnxnt8nlN+t?=
 =?iso-8859-1?Q?oYbM59/qww8E7z1bHKIQPUZGIWqUdnl5ogyHFHKiEyJPX3lA3SnC5A7w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6512.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366fa671-1fd3-4ba4-1572-08dcc67def16
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 09:52:16.3845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6WdERwTEWxUGAMaylcy2facj2QOKhgXPqxdRvERpJ0UrxeprwXpBzyxgYWtxJ6atrEbNwHaFFT3cs7XCCTLe6MWWu8mdI4xxNS35IH+oMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6937
X-Proofpoint-ORIG-GUID: c7Fmw2lAzbwVUHcGNYuKpfxFB3rkAJDl
X-Proofpoint-GUID: c7Fmw2lAzbwVUHcGNYuKpfxFB3rkAJDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408270072



> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Monday, August 19, 2024 4:55 PM
> To: Arnd Bergmann <arnd@arndb.de>; Nuno S=E1 <noname.nuno@gmail.com>;
> Hennerich, Michael <Michael.Hennerich@analog.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; linux-input@vger.kernel.org=
; linux-
> kernel@vger.kernel.org; Lee Jones <lee@kernel.org>; linux-arm-
> kernel@lists.infradead.org; Agarwal, Utsav <Utsav.Agarwal@analog.com>
> Subject: Re: [PATCH] Input: keypad-nomadik-ske - remove the driver
>=20
> On Mon, Aug 19, 2024 at 11:29:32AM +0200, Arnd Bergmann wrote:
> > On Fri, Aug 16, 2024, at 20:54, Dmitry Torokhov wrote:
> > > The users of this driver were removed in 2013 in commit 28633c54bda6
> > > ("ARM: ux500: Rip out keypad initialisation which is no longer used")=
.
> > >
> > > Remove the driver as well.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/input/keyboard/Kconfig                |  11 -
> > >  drivers/input/keyboard/Makefile               |   1 -
> > >  drivers/input/keyboard/nomadik-ske-keypad.c   | 378 ----------------=
--
> > >  .../linux/platform_data/keypad-nomadik-ske.h  |  50 ---
> > >  4 files changed, 440 deletions(-)
> > >
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I have a list of drivers that I determined to be likely unused as well
> > and found a few more input drivers that were unused in 2022:
> >
> > CONFIG_KEYBOARD_ADP5520/CONFIG_PMIC_ADP5520
> > CONFIG_KEYBOARD_ADP5589
> > CONFIG_INPUT_AD714X
> > CONFIG_TOUCHSCREEN_AD7877
> >
> > As far as I can tell, these all lost their last device definition, or
> > they never had one and are impossible to be used with device tree
> > data.
>=20
> I asked Analog Devices folks (CCed) about 5589 and Nuno said that it is s=
till
> relevant and promised to do conversion to DT similar to adp5588.
>=20
> Nuno, Michale, what about the other drivers that Arnd listed?

We'll provide dt conversion patches for AD7877 and AD714x as well.

Regards,
Michael

>=20
> Thanks.
>=20
> --
> Dmitry

