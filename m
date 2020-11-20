Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610942BA2E2
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 08:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgKTHRZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 02:17:25 -0500
Received: from mail-eopbgr150083.outbound.protection.outlook.com ([40.107.15.83]:19824
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725768AbgKTHRZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 02:17:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBwfYk7gM7bcvusBS9wU+q96TIxtxPI9k7SfFnTm8x6C0XHh54ExWCLcNXNF8wYZ2dHZBzpdpJFZOu5hgjcGIGEf7932XBtiKTUoENmmh0MX0DE2cQxtfkPDQjxFhNFOx78E548UUW56lnUyRYaQtt8DAheJDrtb6y77P1SNR+Jy7xz1VBwYv2dJ1KH2tuNy12OfqmGZYh/X1CU8vBZ6glX/0PP09O1o17ZduoID9T/caqm4vKDdW7H5krF2HcpuCzAtcMaJrEnwlaYXJFgsq6MXV+DEbSmEbAoOWh7suBw6cKuXHr3KmcK/y7UILX6dbE625tqv24QmAUeVu7rMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swfXi/ncLH6KAZX3yUbIUlXlZSOVZ2hVNIk7iNXXC5s=;
 b=erVSpU3yVTqIAoF+DezeKVqL2OEES1KUgLSxPruVXzpXJWPhEeEN1QsO6lLAlE+WAWjJ8VdKWt8SNJBB/le/LI9irA+mpmXs3V8k01Opg5C+6i6efy9Jx1aq6Tl8DJ+tIQkvjrwbyfAAznMvfd4+KtLGhcHbArileY8rCEU+qxK6aWG2QCwAtuiDnSZfx98GUcNWHMCsThNXuTz3YJs5zkjrHklHIkcqwSUoYjz4RJJ7i/Rs6ssFQEKfGdCeDknyTLsxISPLwPYlvy8K5R8xN9LSdVAIsYsE4MxmVaTtxvQ6c8+7tEgXED6Mb6UFjPU97zagFE0Rzm/ljFI9Y4n5OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swfXi/ncLH6KAZX3yUbIUlXlZSOVZ2hVNIk7iNXXC5s=;
 b=RrCoOM9cCraE/6pD5m7MPpj3jgwSf6qNW1evqgzHYscK73c0tHiFdavyMQfOFWyeAUzgNZFmnwp2fsjI3LpEaFUZJAXLtlf08cQ5kxony4dqzw2aSd48/jrRHXsYVpGHor3tH+xmbBKSPDBXqUPJDrCsSIZdDQO5nJyTofZSPcc=
Received: from AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:144::20)
 by AM9PR10MB4182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 07:17:20 +0000
Received: from AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c806:d3c3:3a93:ac47]) by AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c806:d3c3:3a93:ac47%4]) with mapi id 15.20.3564.028; Fri, 20 Nov 2020
 07:17:20 +0000
From:   "Valek, Andrej" <andrej.valek@siemens.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>
Subject: RE: [PATCH v2] Input: st1232 - add support resolution reading
Thread-Topic: [PATCH v2] Input: st1232 - add support resolution reading
Thread-Index: AQHWuJausQ675DfOyEKCxRf7capNnKnEJVGAgAyDAQA=
Date:   Fri, 20 Nov 2020 07:17:20 +0000
Message-ID: <AM0PR10MB3971222411966A87E29A9F5C92FF0@AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM>
References: <202011030200.dKK6cKCM-lkp@intel.com>
 <20201103073949.12198-1-andrej.valek@siemens.com>
 <20201112015348.GD1003057@dtor-ws>
 <DB8PR10MB3977BDD73A260EE7999DD76892E70@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB8PR10MB3977BDD73A260EE7999DD76892E70@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-20T07:17:17Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=8687f37a-1984-451f-bf2b-f32752f66bf7;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c9c5438f-5f57-4cad-5edb-08d88d2451bb
x-ms-traffictypediagnostic: AM9PR10MB4182:
x-microsoft-antispam-prvs: <AM9PR10MB4182315E788D7E29384DFCD892FF0@AM9PR10MB4182.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aj7BcEoco1zzX1D2R3TITY/RCDpJj20CWd626/U8syv84PQOxCLOpqEhhH/p3Hd1bgRglt0Y3CkaT87rayO7lt+gNAWX3HBmt3k3UHHKjDrHrRzW0GkZWS6Ujx23H5Cb5r80HIN7rbEG3Jo98e5UQt0DB+0Kc+2eE3YvX5/tcdhTecuosDSJJtJCOsFx4k31oVG3bJFf6hwtkOVJ38Cx+uAWSHTBqsl8SJw8xmoWHT+W1/iV0p/LnBM9luGQTykqYWATi9iPtB26TBqD78PCtK6DhYuFFkVioDSkFwBdX47YitlkF6ljFMgR+OHK5ECgfjYhBK1CZEfNqpdErHHm/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(76116006)(6916009)(55236004)(53546011)(83380400001)(7696005)(6506007)(64756008)(54906003)(8936002)(8676002)(478600001)(2906002)(66446008)(71200400001)(66556008)(26005)(52536014)(86362001)(33656002)(186003)(5660300002)(66476007)(66946007)(9686003)(316002)(4326008)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: o4ydcNpyHOu7so55W87F8dVk3NLKA1Th73jRL1/JOlSNY70jeGzk3JV1x9nyPjCdb9+lgZ1de1wS98esY2na496QppcEeEitfnJOn4Gud/4oQzHHCaXTiM3xpSa5HUhaTMFXy1ztnvAugwhrI5ljJuhNu3F3sP0bf5nEU5N7tNaktvFDfPt4Nv0Fheis4HwtyLNhdCjVoa0Rj0/xElu7BQoNj0dH+6QRzuyRe9PsnG+dEvOducQXaCv/62i4B/pikJjc1PiYXZuxGUGKjb97TynxxN5mzx56cg0SMgPHuygbICr7iLLitzuBntf/rSmj27xOUG0diGJfCgz8fw3C45Y6hdxgpZMGCQs+4cJHDjd1WJcPnp3x8B6nuCbN8ZDgkmL7n6Quz0WFI8k4lUWrIu8vRqRUZsTxRLzZGtk3SMgdBSWOEqcCXeFtROG+5bCor4EhcVl8RcPGPF88DsGGhCQyMvnho4vb8SZhp0SIPMoXOxVLwbzn+lQUePxk7zdUJGmQO524zygl2VW89SeQr57mBvmZ2YVmGKaCIRxEoLPy9O+YtZVg+JQ5Ivslajg5Vk7PpxnwnOK0Gg1X2etmRh9MPRqrfUg8vhRdsZVjmzGrlSL4EExJPGqj17jl3++WzvthQptGEqVF/c9D9/aETg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c5438f-5f57-4cad-5edb-08d88d2451bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 07:17:20.2050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X28OLDxmo/XsJP38xmW5xDUFq0gr6i0QJONORgwUw+bLj448wG2RJ8F74b0cDsfQM3w3o6hsFi9D4ohC2WFxboA/p4AgcuHTO+kPUu+rolo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4182
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello again Dimitry,

I haven't received any response yet, so I will ask again.

I would like to know, the current status about my other patches for goodix =
and atmel input.
Are there any problems, or what I have to do, to be applied?

Thanks,
Andrej

> Hello Dimitry,
>=20
> Thank you for that.
> What about the other patches?
>
> Regards,
> Andrej
>
>> -----Original Message-----
>> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Sent: Thursday, November 12, 2020 2:54 AM>
>> To: Valek, Andrej (ADV D EU SK SI-BP1) <andrej.valek@siemens.com>
>> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org;=20
>> kbuild-all@lists.01.org
>> Subject: Re: [PATCH v2] Input: st1232 - add support resolution reading
>>=20
>> On Tue, Nov 03, 2020 at 08:39:49AM +0100, Andrej Valek wrote:
>>> Hard-coding resolution for st1633 device was wrong. Some of LCDs like=20
>>> YTS700TLBC-02-100C has assembled Sitronix st1633 touchcontroller too.
>>> But the resolution is not 320x480 as was hard-coded.
>>> Add new function which reads correct resolution directly from register.
>>>=20
>>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>>
>> Applied, thank you.
>>
> --
>> Dmitry
