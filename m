Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0554A5F8C
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 05:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbfICDMW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 23:12:22 -0400
Received: from mail-eopbgr80085.outbound.protection.outlook.com ([40.107.8.85]:65001
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725821AbfICDMW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Sep 2019 23:12:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=al+Sn53UeKQZk9VLzdRnMdye9ZQpiSaTs1lq99uDCyeHMtM4Wot/CTp1DFufmpQEj06vRO82w2/QJU+VJhen9ZY+AA4LoN+5O6Zv33+0C+5BPJpMFe+YigZ19zOwKEtgAmPB+PmEYgcBCvtUiZZmv4sPe07f+6N62TkknwAI72lHg2LonwSB0gyWbFGexgz1jfmTWY6b0NXmwW2kBsoyYjaMjXJbk4l7DNdbZz/hsLTK3mD67fgnVfKXR2W6wA4jq+Dy0LzULfiF6d1VnNHekzGszrvVnjE6RKa6lL2NmpszffJJABh0zFcT3U03tLDnIvHmTFZtc1CrnS58hYbCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Aljlc9VXvbdFHeIbT8N+MLdwfvYLNnBorBRhOCw5sw=;
 b=aiLC7mnGXnCFfF1eRMdfX9VHZgau8wqQ+3zW9moSqDIOxjlkR9PXmDq5tEq6un34kLIRdvFXsEgxHj0vp8w97+Ab3DbiYWqjwTgo8yo93PkDW4MdS4JrhMokaEiGGvWlSQMEvNm0qXRJGLpn4MWlI5AOlXqCX2EZTiBjufNjP/I9JisAXnWHLF2C2eUBU0ADnUqUQZSnrKq1KuyQ3D9+KJF3r7NvxdWOoyHzCsyXjBTU4tyeDmcKG9CQoRGd6zZk5kGlQYu6q5SZuJGJw/otnZFk6D1fvYY6qs4H/Tw9TWhcYJmBxWHfT01tCzT1pCE48r0ueEv2/aemmT8QQEFPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Aljlc9VXvbdFHeIbT8N+MLdwfvYLNnBorBRhOCw5sw=;
 b=J5gQ0mfgn6eRQtFgY7OrH/5o/corjocPrueGhtO68d9SlvKxAqBXCuJjQE0JrJMH+bHH6P3p+uMG/YZvcW8ASfZWcdobWMhxFSywkQTFjcNjEWvRtueh8GTf1oFEuRhNWlwKFVH9v3x8mMzZB+rS2wDkVwEY1RMh0rpYVtWgxbU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3865.eurprd04.prod.outlook.com (52.134.73.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Tue, 3 Sep 2019 03:11:36 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2199.021; Tue, 3 Sep 2019
 03:11:36 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andy Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
Thread-Topic: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
Thread-Index: AQHVYfwAkBJd0uw8O0iWCkl8q7ZXAqcZPXwAgAAI/NA=
Date:   Tue, 3 Sep 2019 03:11:35 +0000
Message-ID: <DB3PR0402MB391636D31F486639FB8B3BA6F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <1567519424-32271-2-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5CHmvrbVG_h8hOb7hMjXasV_QwtNoXpEw9kqY=4Jj5HAg@mail.gmail.com>
In-Reply-To: <CAOMZO5CHmvrbVG_h8hOb7hMjXasV_QwtNoXpEw9kqY=4Jj5HAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c589e467-bde8-4e07-1d6c-08d7301c6e29
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3865;
x-ms-traffictypediagnostic: DB3PR0402MB3865:|DB3PR0402MB3865:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3865AF11E8B7C6BEA3A58049F5B90@DB3PR0402MB3865.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(199004)(189003)(7736002)(2906002)(7696005)(1411001)(25786009)(33656002)(3846002)(14454004)(6436002)(6116002)(478600001)(8676002)(81166006)(81156014)(5660300002)(99286004)(86362001)(229853002)(8936002)(305945005)(4744005)(316002)(66066001)(6916009)(74316002)(52536014)(54906003)(71190400001)(71200400001)(9686003)(53546011)(6506007)(102836004)(53936002)(66476007)(66556008)(64756008)(66446008)(76176011)(4326008)(55016002)(7416002)(66946007)(476003)(486006)(11346002)(446003)(6246003)(256004)(26005)(76116006)(186003)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3865;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /9Tx6X1ZMceFWHG3soSVtE64xxo3QgRGA7RxOTsR4NXOLB/ZFyuvmf2D4gHynn0Tn2m0v+yiV/iQgUO/yCOl/kyfXPysJRaxBChRVDoS379IWz1n5eTJGpZQCR3AfAv2qaLl/2um2O+tZN1FSarLo/Fj07lDJXRx7J3oZIv+ZpF91WjUMoVGOJbWosN1O5BtL9+tA6WXKzMPQuidSN1MepNShSLoNdl4JmqSg8Upj92NhVxeYMj/LpCEbwSieBBWrhbU4jAfe+RuISBjsDtmLYVI+6RAsbpSqRjCfoXe2wzdUbnDjiIGaC9kZJT9ZT4TQI1uxwvpvxFARMBqWVXGtF4Wpw5hmS2KQ45sxVGd/+7RRVp4cw4giHhjYwubMMlfacCbC1YocIihvY2nBDrVqgmvQ8fdTbGj9gcSqcJh4G0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c589e467-bde8-4e07-1d6c-08d7301c6e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 03:11:35.9531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0igZZ8yYn/zyNgTozA60HccOUDKn28F0gnqb8JTeMkzffh+orPvPGJQ8UugIFgt7pfdJlXlfXQ7cWVSuAbI2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3865
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIEZhYmlvDQoNCj4gT24gTW9uLCBTZXAgMiwgMjAxOSBhdCAxMTowNSBQTSBBbnNvbiBIdWFu
ZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+ICsgICAgICAgcmV0ID0g
aW5wdXRfcmVnaXN0ZXJfZGV2aWNlKGlucHV0KTsNCj4gPiArICAgICAgIGlmIChyZXQgPCAwKSB7
DQo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byByZWdp
c3RlciBpbnB1dCBkZXZpY2VcbiIpOw0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0K
PiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHBkYXRhLT5pbnB1dCA9IGlucHV0Ow0K
PiA+ICsgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcGRhdGEpOw0KPiA+ICsNCj4g
PiArICAgICAgIHJldCA9IGlteF9zY3VfaXJxX2dyb3VwX2VuYWJsZShTQ19JUlFfR1JPVVBfV0FL
RSwNCj4gU0NfSVJRX0JVVFRPTiwgdHJ1ZSk7DQo+ID4gKyAgICAgICBpZiAocmV0KSB7DQo+ID4g
KyAgICAgICAgICAgICAgIGRldl93YXJuKCZwZGV2LT5kZXYsICJlbmFibGUgc2N1IGdyb3VwIGly
cSBmYWlsZWRcbiIpOw0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4gQmV0
dGVyIGRvIGEgJ2dvdG8gaW5wdXRfdW5yZWdpc3RlcicgaGVyZSBpbnN0ZWFkIGFuZCBjYWxsDQo+
IGlucHV0X3VucmVnaXN0ZXJfZGV2aWNlKCkuDQoNCkFncmVlZCwgd2lsbCBmaXggaW4gVjMgbGF0
ZXIuDQoNClRoYW5rcywNCkFuc29uLg0K
