Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A8540CBBF
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 19:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhIORdf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Sep 2021 13:33:35 -0400
Received: from mail-mw2nam10on2074.outbound.protection.outlook.com ([40.107.94.74]:61537
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229652AbhIORdd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Sep 2021 13:33:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nzs3j1OE67Nppzoa9k1gwZVnTTLKAEfn12SMysbBh78DF7Y+cKtuliOMx65jMH/prPec58T+NjPjb1OC8e35lLl/7grFcOvtkNDi9Trg8hhQbCdgroNA9gUNQbKMxAwvcdBnVfQWv5nO7uMc4Rdj2oLh3XHEHqRyt5N96EDssSjsleZ6iglEqcYIYSemnJz0pSuGAms7sdE6UFo24EQpFdbLqOucCXfKmD8ntsjZDvNHWmxsIAWpk7Rsxu0Zo8wfPfs6GkZDsoKhqgQNToc2ZNGgzB5pJFA5spcQpac7iMhfsZIiloYmIaEi+/A39FDANfLP2HkIpJFv4AGYMVPEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jqxijhmC6ADc/QgYQCVFnN2EsKaYiE7liwSLB/gKLAg=;
 b=dPhs6kbdrpjju9X7GbyLYLE3RCLN8z2tmtDT56/vaF8LZfmw7mxT73PKUONEVHvELli4MKfQXEeR41LBSuJiPqHCHbuvqsjxpur33NgL20RKXynvpBB6ubvh+qYKAw4c0afuJso0kgk9Ag4wFlrUpqTogS/z+Bk5zpy/Zv8wz9cLj9is9MWJGZZaNRhWGNdJZySw4NgecUDPsqXcagSEYLx7yMfJN5B6hF8/GRPce2VA7pGpdaAwj6Z8jdJw1Hnvo2YW5JPfKjDjDAuwRr1MddLXWX8gjfiNke9YijTbFqSnCY5krnEGwLA4K3UGeq2IiY1/EkJ4343DfCsJYWvXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqxijhmC6ADc/QgYQCVFnN2EsKaYiE7liwSLB/gKLAg=;
 b=bgP7MnJ0MTrf4FoRLr6ep5lz88Ku0xTjG6kKW0NsN6D6eQ2QM6t/zID8KKSyqQZjp2I/StC6JQ1HQN3/UPOlig51WzVnsoaNkn7tZIXmBgSiqq0af3nhoT5g2eQfMSmbqanCkdziW3kxREQ7Eg0pVkZMyS7k7rOpAWiJJMweBN8=
Received: from BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 by BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 17:32:12 +0000
Received: from BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::4489:9f54:62bd:8dff]) by BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::4489:9f54:62bd:8dff%3]) with mapi id 15.20.4523.015; Wed, 15 Sep 2021
 17:32:12 +0000
From:   "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
To:     Jiri Kosina <jikos@kernel.org>, Evgeny Novikov <novikov@ispras.ru>
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>
Subject: RE: [PATCH] AMD_SFH: Fix potential NULL pointer dereference
Thread-Topic: [PATCH] AMD_SFH: Fix potential NULL pointer dereference
Thread-Index: AQHXVwSCA/acJZA7HUOp3PLgbRD+r6ul1jSAgAAqz5A=
Date:   Wed, 15 Sep 2021 17:32:12 +0000
Message-ID: <BN9PR12MB505242B95EA964CF0990C006A0DB9@BN9PR12MB5052.namprd12.prod.outlook.com>
References: <20210601163801.17848-1-novikov@ispras.ru>
 <nycvar.YFH.7.76.2109151657580.15944@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2109151657580.15944@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_Enabled=true;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_SetDate=2021-09-15T17:31:52Z;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_Method=Privileged;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_Name=Non-Business-AIP 2.0;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_ActionId=9e55ebf5-6858-48f7-ad33-70ee3fede638;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_ContentBits=0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41ecd0a9-ae0c-4f5d-5fb1-08d9786ec0ea
x-ms-traffictypediagnostic: BN9PR12MB5381:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR12MB5381F092CC5803EC1EA0C5C2A0DB9@BN9PR12MB5381.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NmZBrFWupTgD3ClSZU0rn6GGzfpZfCve+XmLMzm3wlelIWvBXChlJwCs9GdbH986yFcfkEatRsYwQKi1uA9soji113NfdDfiePXNKcFz5uyLkP+19DvEaMU8hF22x0WKSiEhpPUfT5ATiVbJG/bzUtHld7ZLLxU5RsxwJFwx1jTZWYfU45OtcN//58Pep5+9OZrDV1LSa8bK+vZgoD7ZYvgX7GBdQhTFLt1cQFrG4iPT7Op/uvNBLLYqiDNd/ecGm64F2iOLV/7zh+fev1D2wTdV9TQAT/3gLqm1ZUrG1m8damKzmLIiZolFU35Dc3K2NfrEBwAY1ON3ava+frbNUlURtC2jw5dJwA5GlnMMGvkh/tV1gaHjRwE5xfjwweHy5RJVJ9EUEYEXsPVzu4H4PmysHvbSVH1DrS2ftzKaK+2EKZsgxiHGT2/Ht7KHo/zoN/hFh4bXK5qCFkWR0ceBTcd7vauzWrAWSFn42ckX0Jcja2TdPwvWTuRBnzq2htYahLoq0E0Dkg4za3ps83bS0HgEh47q0VnmPwNtT4LX30J+irCmSLowr7Jsp5mHMlWdzqVJEw6sj9QtD03JrTrRK+ZBRynHZ+gwzhM7RDrpZdZG49s6tfCTI/sLUwPcACzH3ktJROwhio+7KnKg85CWslwvmqLZKvWKUa/EwGkvLA50x9tFT26nQMWeS/58ctwssoNdv7pP0wkDq0QvseMMRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5052.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(38070700005)(5660300002)(122000001)(53546011)(6506007)(38100700002)(66556008)(186003)(4326008)(83380400001)(86362001)(7696005)(110136005)(52536014)(66946007)(33656002)(4744005)(2906002)(71200400001)(66446008)(64756008)(8676002)(66476007)(478600001)(54906003)(316002)(55016002)(76116006)(8936002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B9WiJlUND0nSzD14fJQQQOUVI8TjPfRMTKpGAciphIdKBZqqaUpkozFh5rtK?=
 =?us-ascii?Q?3QfOWuOw6JmuWdAwK173vWan/zyX11IC/v21nCuJnf9i7B7sKBLx3A/4k/0n?=
 =?us-ascii?Q?DsFM5KUMwbhrJmn5vuCPZDEPNZ2Oi1A09i3W5WMYHPcjrqUjYHj8/LY4x2Po?=
 =?us-ascii?Q?2kg+0ukbY5E7tcNVNzB3WbtiCwf2dzpfX/F81LpFpvy3ARYA0tepiYobqS9P?=
 =?us-ascii?Q?yuMiwCBqrhN1bE9V8Ze1XKeUYOFj9t5bycfC/2svtQsV2V87/WcXP2LvuM0K?=
 =?us-ascii?Q?eWc7SVANC7n9UdBNK6YWKTJnGTShM2UGMvPd0UHgjxp/BMZA5CqJdN1qHuH5?=
 =?us-ascii?Q?79BDhLOqrv55vynRyuhDsSVF8FcZXHOFwrP4+8ECxbTtIyqMiUmhEeuZfwwL?=
 =?us-ascii?Q?SBZlyCx+WgLLzgNhP2n1AiBWZYPrXPpeKceNoQ+roz4MLBL8JdsHiwwsLBwk?=
 =?us-ascii?Q?nv+TREDZ2ipAGP8KWmb75nSBcovVbGGk/GaFTeveWPTeRyAEJivB0sVTvTHC?=
 =?us-ascii?Q?Fpz2OctAfzfoVvwrxEln6M8j9mrkk46LcvVNlQyrwGwoucactXHNBxDPG7l/?=
 =?us-ascii?Q?YR55t9QFo9W6WU3ks9OM4isugAdU3WUji6d93NTimc6c/c8u9MJvwBGm5fsr?=
 =?us-ascii?Q?D/EPQTsIdDBYWAIkaBgZylqLzy69GDKUcfAY3ZB+sIa/4tZPmpFqRqCu8V7P?=
 =?us-ascii?Q?Rt37F8aqS/CLS0R2v3+Bgeuw1SqBeXL8lWiXjC4T7k1L3S0oMboAJAvyF7Fu?=
 =?us-ascii?Q?/lUpcyHsneHoEOcPDerfU0TCwApgatNDfxZ24dsiHQ5WuuwN87Jkr+Qao6u5?=
 =?us-ascii?Q?yp7wJ7AdqZnyn8YwKf1jDrCfTwNu7o+sHLrRPt9eLiJuGNKlAQG2J24v7A4p?=
 =?us-ascii?Q?PPhk6wJsTGOI00AC75K59Lz2Q0hkqPBs+zNGwb58oKnrCb+TXCTdDQCyA3vW?=
 =?us-ascii?Q?xSY6Qaoo+81bPnb+cBntH/APfqvkwg4AskQFlR7t1oPsTmVk3nyWJfVQcVVA?=
 =?us-ascii?Q?5GL5yqKZLk3q7ntphhZ4yyHeKYtrk5ZEj+tZp04FC9um88tfs21Jp6lA6Fyq?=
 =?us-ascii?Q?+47te3NmGGTG1lluHBfJX7j1edLxExSHOB3qwWdE9RGyw8Tpx+RMXVOKTiPy?=
 =?us-ascii?Q?ScAP35TAxIF9pzbCeFNxSaedBF5nVuLrJHfxcr0RQ7D8XDBotS+22fQ0fT6a?=
 =?us-ascii?Q?SKpC/1ZKQ+EVrL2pzTHJWZjkNv4pJlY4Bz4KfpAlpMlVw6FlTptFlwC/lhPO?=
 =?us-ascii?Q?dZRyryhR4yaWOljeF/bcudgSd4V1ADLR8BaghYkPDp739DLE9uG8HZRKDTr3?=
 =?us-ascii?Q?LgTy0YBRaUBcgJAczlgU6DzCnNhquF48FuJ1oLc8nBJcx5/WjjNatLEdvUry?=
 =?us-ascii?Q?pBfsVnm0I4CWABG28p5zY1JUAPEm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ecd0a9-ae0c-4f5d-5fb1-08d9786ec0ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 17:32:12.5667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qGas8Uudu7Y1e0SWfBoqAW3W5IHLApsrIUmrbouBKY/sl+qts7d7JgKFC58NxsYZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5381
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding Basavaraj

-----Original Message-----
From: Jiri Kosina <jikos@kernel.org>=20
Sent: Wednesday, September 15, 2021 8:28 PM
To: Evgeny Novikov <novikov@ispras.ru>
Cc: Shah, Nehal-bakulchandra <Nehal-bakulchandra.Shah@amd.com>; Sandeep Sin=
gh <sandeep.singh@amd.com>; Benjamin Tissoires <benjamin.tissoires@redhat.c=
om>; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; ldv-project=
@linuxtesting.org
Subject: Re: [PATCH] AMD_SFH: Fix potential NULL pointer dereference

On Tue, 1 Jun 2021, Evgeny Novikov wrote:

> devm_add_action_or_reset() can suddenly invoke amd_mp2_pci_remove() at=20
> registration that will cause NULL pointer dereference since=20
> corresponding data is not initialized yet. The patch moves=20
> initialization of data before devm_add_action_or_reset().
>=20
> Found by Linux Driver Verification project (linuxtesting.org).
>=20
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Nehal, Basavaraj, could you please Review/Ack this one?

Thanks,

--
Jiri Kosina
SUSE Labs

