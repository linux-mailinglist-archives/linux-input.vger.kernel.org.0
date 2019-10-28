Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E11E6D39
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2019 08:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730960AbfJ1H24 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 03:28:56 -0400
Received: from mail-eopbgr70083.outbound.protection.outlook.com ([40.107.7.83]:37700
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730235AbfJ1H24 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 03:28:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwfrQwQGPSuXY7AHG2HnSR0LfoaawSo/3G94HKkXn32GLks2I4Ebh4kNz9R/S4h0EdOOD7IagpQgVFztnspIpPNkAsdvibpsDkB+k3/ad7qojRtfM2fe6Kft90t6wnbt16aZMyK+nipBnPNZrkOoCxEW8LyOlhbqCU5GtaZpxkB4a53dEH+yp03bzEa1XFZkNyq43FS+kDGoqN0P4uswDaN2GcEJYV4ke8Dx7AvJHb0aYaG3ncLoSkFhaZ0MgQlNQBNfHIj0xpXzrcoN6gsZ5iGDuspMIZoc9ustqHElxjifgkUSQkJhifwGNk6n1KxnkEKqmtv+4jKjxSxCx1fkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOs45WhULAeWLTJ0RE9oJy8v7/jLt2nsqc/UExl8qg0=;
 b=DCQbDxrQu5bthovTUQpwJcE3l4QbRbJzO3jiv1zqvhl6ADY2zGFyTtUR2Zil99QFfUYBsOW6JXMRxVGqZPWFfFWyhkI/g7APPBsVax2yX6W0nSejjmi7kgmd7IET02BSAsFcG+BsnbYzY5JTdOEF00cPbx2uZPhEesRKJOx4ThKylpuG6nFwVsQbqE/cfvtS6q+/NwWD6JUhRc09FFDcDE1T3KTFpYTQe/SbqXVL1k7mVF9FvPmuaeX6UPoDa21sKpUfxg45Kdf3IyLYpoASnBMaF6vcdqJLCttZf1+ghrcDvVMf5fkVnNE7+K3gxQPpeyf8oKvIx6eA9egpUfuEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOs45WhULAeWLTJ0RE9oJy8v7/jLt2nsqc/UExl8qg0=;
 b=PS+5/eA18hAoSIGL9m/z7Z6zrLSGh0cgXALsIidJEgWq4i179cE9i72totVPRgDWoTki6Fcno+1WxdQTrBp/+CpVvZDsk4n1Hgkd6jIRThuXgR4Lc9H6Cmfy9S22ktCv9rbgEYyLIF+TRS4VldC85YDzIJURqU+osz77yVv+jA8=
Received: from VI1PR08MB3758.eurprd08.prod.outlook.com (20.178.14.18) by
 VI1PR08MB3309.eurprd08.prod.outlook.com (52.133.12.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Mon, 28 Oct 2019 07:28:51 +0000
Received: from VI1PR08MB3758.eurprd08.prod.outlook.com
 ([fe80::6d33:11a7:b1d0:d69e]) by VI1PR08MB3758.eurprd08.prod.outlook.com
 ([fe80::6d33:11a7:b1d0:d69e%7]) with mapi id 15.20.2387.025; Mon, 28 Oct 2019
 07:28:51 +0000
From:   Matthias Fend <Matthias.Fend@wolfvision.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
CC:     Dixit Parmar <dixitparmar19@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH 0/8] Face lift for st1232 touchscreen driver
Thread-Topic: [PATCH 0/8] Face lift for st1232 touchscreen driver
Thread-Index: AQHViRLL7LEI+NslIkOYR8LQL7dsq6dvrR4g
Date:   Mon, 28 Oct 2019 07:28:51 +0000
Message-ID: <VI1PR08MB37588375F08EA4F692AE475D85660@VI1PR08MB3758.eurprd08.prod.outlook.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Matthias.Fend@wolfvision.net; 
x-originating-ip: [91.118.163.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bcb8e75-bcaa-40f8-3357-08d75b787b2a
x-ms-traffictypediagnostic: VI1PR08MB3309:
x-microsoft-antispam-prvs: <VI1PR08MB3309578AAF20236F648701D185660@VI1PR08MB3309.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39830400003)(136003)(366004)(346002)(376002)(199004)(189003)(66946007)(76116006)(14454004)(64756008)(71200400001)(71190400001)(66446008)(508600001)(66066001)(66556008)(55016002)(66476007)(9686003)(54906003)(74316002)(7736002)(6436002)(33656002)(316002)(110136005)(446003)(5660300002)(476003)(7696005)(76176011)(99286004)(52536014)(86362001)(256004)(8936002)(4326008)(8676002)(11346002)(26005)(81156014)(81166006)(6506007)(102836004)(2906002)(6116002)(486006)(25786009)(3846002)(305945005)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB3309;H:VI1PR08MB3758.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wolfvision.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YcZON8I2p8ZWTXHNPU4yaGy/HdW96pBm32uK/7u0J7pXw5QMydLI2DYGcInLejwQvpdC8HULgOXdouS/wgk8EeiykDKQGNetJiFiF5kFMJU2OERTWR+bOL7rsp6eFZGWSgAsE9S7jBZwmxmO5SE6Nl95GGTmHaXyolgkYUGGZjskS/kAt3hspM9YfT/mbnUK/S5brZf/JdJ/1Cu5ZbHNRP/7BjwxUfaP2VlZXobiC+vky1jAVG40Uqbvg4Tgql+xJHL3nuTEiJGNhZqFx7C+k1tAuQqLsRkj5nx0M1fNnfQ35sv/ucrBSMUES5mzBQ/qi0USiE+FZ5qcmXUsOQv8Vp5WqFGc1utW+if+K+31376+/E36OcH2WXKmsCo53t8YWaCroUyJz14wjxN0pMWvQoSTqHpJVjBtKuPxAUptTeMPN9mpNMKEZuobZlYFhPS3
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcb8e75-bcaa-40f8-3357-08d75b787b2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 07:28:51.4891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8N5RP3lD0AiN98a7wtE0I+8FAyaZ9x3h7gptrqliqYcf8Rc2yNfsfFBIXRABnVa3awKrsPvaJ5boLltwvV8+AOe+XI1wiNrLTmxUoOIqfrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3309
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

> -----Urspr=FCngliche Nachricht-----
> Von: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Gesendet: Dienstag, 22. Oktober 2019 21:56
> An: Martin Kepplinger <martink@posteo.de>
> Cc: Dixit Parmar <dixitparmar19@gmail.com>; Henrik Rydberg
> <rydberg@bitmath.org>; Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com>; Matthias Fend
> <Matthias.Fend@wolfvision.net>; linux-input@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Betreff: [PATCH 0/8] Face lift for st1232 touchscreen driver
>=20
> This series cleans up the driver and switches it over to the slotted
> multi-touch protocol (MT-B) that should reduce the traffic between kernel
> and userspace.
>=20
> Note that I do not have hardware, so I would appreciate if you could try
> running it and tell me if it is broken or not.

Looks good. I tested the series from your st1232 branch [1] and could not s=
ee any regressions.
Note that I my 'real' application only supports ONE finger. So, the other f=
ingers are just tested with debug output.

Thanks,
 ~Matthias

[1] git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git st1232

>=20
> Thanks!
>=20
>=20
> Dmitry Torokhov (8):
>   Input: st1232 - simplify parsing of read buffer
>   Input: st1232 - do not unconditionally configure as wakeup source
>   Input: st1232 - rely on I2C core to configure wakeup interrupt
>   Input: st1232 - do not reset the chip too early
>   Input: st1232 - do not allocate fingers data separately
>   Input: st1232 - do not set parent device explicitly
>   Input: st1232 - note that the receive buffer is DMA-safe
>   Input: st1232 - switch to using MT-B protocol
>=20
>  drivers/input/touchscreen/st1232.c | 184 ++++++++++++++---------------
>  1 file changed, 89 insertions(+), 95 deletions(-)
>=20
> --
> 2.23.0.866.gb869b98d4c-goog

