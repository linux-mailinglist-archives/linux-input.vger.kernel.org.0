Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACFD3D04BE
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 00:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhGTWBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 18:01:50 -0400
Received: from mail-eopbgr670105.outbound.protection.outlook.com ([40.107.67.105]:54832
        "EHLO CAN01-TO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230013AbhGTWBj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 18:01:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeO3ChAjBvGYsk1z8KrN6Tb/sd7N7kZtGZGhE/tEEYFPv8hupaUMQEYAiT+42mADL5DWO5tPvW1+mKPrScMBkyq8IeuGH2ykS5p18T4DB/2Bo0i2BdBePy8JLU128qgCVuwSzFnApddESbP0/6LG4RiYg9aSGN0R11kOBDQt4roOUv9GXFIj5t0BuIU5jpu6vTiVhHxXPW9X49qWf6YJVAhK1iCq/aq6RyeCdxObxV1HgtwX7asmSVKQsZnN3eg0aDRfmpAsOI9x6gp4dZdKIKYeMPV/JnfzuP+gWI4iOSz12EJZ1jdS89td+DOeOhfZJI277rBcYKoHbPyFSiVtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN2cZ0i+SItF9M0hCBRQfIDzFc0U+vLW2CL5NiQh3qg=;
 b=kwc7WZE2E3zak3Hv8noCAGRBP0vTuZ+ziAqpeJcv7qD+H1pDo7WQh9wkvtlW8vcKs1gdxkxo6I0X0vj8KTKWs+OekDIIWgvxvZY4xS/0ZNc6ftj9kKVHs3C/T1ri5xzqzobVAjJWJhBFCKynH7v9oKYso3QWc4RThgZSTDVhvPwW33jiV2ozpsuR8+qFjSJDzuJlZ2aKilJNB9rESqE4acJeMUyfXDQAc3wIFUztUEsaay/Gar2i3W/PTIxMyDG2+1ngKzk0swNzXZUyKLLTmoHsgdWyBR1FwumsOku0LVifbUhP36WHIxKBlKRn3penpwKOI22qJqUWPHWH8AdBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ens.etsmtl.ca; dmarc=pass action=none
 header.from=ens.etsmtl.ca; dkim=pass header.d=ens.etsmtl.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ens.etsmtl.ca;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN2cZ0i+SItF9M0hCBRQfIDzFc0U+vLW2CL5NiQh3qg=;
 b=mP/bR6VJ9aRZKdJR8W2a9g7oYMtZ4I4q+NN5ZjPhF9FB193l0SMWLbRye+AGqZkgBpk7U1Kpm/gF9vvo+Fh08pLGzk8B258s9QGnCXMOdzokHbg9eht7FIA/Pf/cpLG8qB9hlFdZ4ZkmAD0Yz6KHW4acY0G6ZZqlFIjh6L0rE6Q/atFBCjmS4jLiFEYkaxoed//kFE2Zvxr2lM0SmtW7NGytMBD4Y3if+RYrm0JSyJYvtrjX7Sasv51oSzzg5P7/e+x3euf5+g0p6cFfh+Nas1EmhtbsX8BvN9sbYs7mTDVgE9JdaEzTRbmWN3YxizyQFH7TWyJQwZ/+KsHfrY9mZA==
Received: from YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:a::30)
 by YQBPR0101MB0963.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:4::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 22:42:15 +0000
Received: from YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::f106:755:f2bd:df99]) by YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::f106:755:f2bd:df99%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 22:42:15 +0000
From:   "Nguyen, Daniel" <daniel.nguyen.1@ens.etsmtl.ca>
To:     "Giard, Pascal" <Pascal.Giard@etsmtl.ca>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] HID: sony: support for the ghlive ps4 dongles
Thread-Topic: [PATCH] HID: sony: support for the ghlive ps4 dongles
Thread-Index: AQHXebPAJ3ZNeB7ay0uyeFC6ovuIvqtLw64AgAAxNACAAIcKOQ==
Date:   Tue, 20 Jul 2021 22:42:14 +0000
Message-ID: <YQBPR0101MB13314FF5DD9E07878344E67EA3E29@YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM>
References: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca>
 <951c38d5-934e-eca7-a025-9cf074771764@redhat.com>,<CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
In-Reply-To: <CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: etsmtl.ca; dkim=none (message not signed)
 header.d=none;etsmtl.ca; dmarc=none action=none header.from=ens.etsmtl.ca;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bbae338-41c7-4abf-167b-08d94bcf9f2e
x-ms-traffictypediagnostic: YQBPR0101MB0963:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <YQBPR0101MB0963D0513A65CDED6B9C1FE2A3E29@YQBPR0101MB0963.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mYlFfRIX28g52RfRi4XA0QJeypKsSgDZ/bMP4b7G49AgMiuJXLxwcbdEw1qVMShLdeor+FbKnvjxOBgHKrk0tZibOHwwa9+s9ELyVpYGLrxcsiI3Hxj65d5o4mKp98RkYPHxamHM0UqDAbTwpPVperpdC1Pogc7tdrHRWHbq49///A3vaCIRQ5cwH1VmeM4fmxM0oFswOuPYMMeMT6JcpMv7vBzTRYLaInN4Hk4X9MN9NsmnS5IMCa/asWhZj3gJWDN4VRAGJ1HyN/LcD8BWpoUvCErhZxvPxlmyhk2HaokOfG6aCanVtqgUqQvJLhRUAauvHZMhlge6gN2t8UMDSX7cGST8KKMLLgF7eQxluVH0jnnc/abOABxEVzauuiKKVX0i2xGkZYAUIS8clBqhGIstxxd2sXDltBuDbaAslnoCcE8mBKb9SsmzUOfOHISleS0JcI8Hmreeje2TJ+Frvnnos6EZE8uPwBShB0qsT2eBE2ItXO/jW+sK85HSVHYOJvaRBElq7Gw5vNHDxkOpUJv5A3uMVUPpUXlNKlaqU0ZN7GYGykzDn5i7I2WlEw0VbRxiH+1JtWO76/Vcn/w+DJyMk7s26cVh6UEiLSgbl6dVVIG1iNWodVi12cnKLyfz+3DWFc4akT3SfAW2Ml9u3fPv9o0fUg313IyzUhWnHoFED+uxBigZfqthkQLL+9ZWir5cIOSOY9ZUvQK48TwX3HjoEzrf5fSaemdeyFMrmjHKDtHuKqTkXg63MQg1kKBmS2D3wza+NbliPMW2vXzL0AWJwHYKH0P3kNiRdGKQfBg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39850400004)(376002)(54906003)(45080400002)(786003)(316002)(8676002)(9686003)(33656002)(86362001)(26005)(66946007)(53546011)(2906002)(122000001)(186003)(8936002)(4326008)(5660300002)(83380400001)(6506007)(66446008)(64756008)(76116006)(966005)(38100700002)(66556008)(478600001)(7696005)(66476007)(110136005)(52536014)(71200400001)(55016002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?y7XeSdFrKu47oTg4pGRGJ55IEnuFfCH+gfg6AxQFysAJK/IbQwTnAvAGnv?=
 =?iso-8859-1?Q?EK8wGzGg2xrx13k5nv+E0VHmR02vJ7qJT88oxIS54nMA2290kfzaIx9TL8?=
 =?iso-8859-1?Q?IRrfnUaYZ6eqncGvuPTp5jLiccazGomBv3waqfPsEdLsuJ3nOE3y28RPnR?=
 =?iso-8859-1?Q?298x6/ZLsTsvfpdgdpYvM4G0uBEJbC/XDzOW4Rfg7N4aLHYiUzWxhyWkXB?=
 =?iso-8859-1?Q?qJS9NCirWemy56g9hxeIAiom/c2/hMcnjq9SV+SxFQDk3VIs9xdpQJ5Tg5?=
 =?iso-8859-1?Q?U/iVgHNydrdv262/m8m9f68dzUQlJtvwLrYBpFxgWX+jlyNknngB3B7AB9?=
 =?iso-8859-1?Q?ZO9L5KJ/+R0/092lE/hzY4ph8OYOGvl2CTEQ9rZgyixVrjiHfP35UNUnRD?=
 =?iso-8859-1?Q?sQ/FDlLJcAHV3vC4JnYs2lgnXg5RiTEMx36DvOn6ubIIYC25Dwprn4gUYG?=
 =?iso-8859-1?Q?RVyB7nvIrSuBIcow4icQoouTYyJMBOi9LnQNFMoTNxUk4oRWbHSPh+3Vj3?=
 =?iso-8859-1?Q?SmjwqCZVAn/89xSxb/Nh/Et5xBVkrvkzXv+3Tc6OVrAxxFvD8AjWbnGM+p?=
 =?iso-8859-1?Q?u+qR7dwVyY3gh86Lp0kQ3ekkE0DF7pufVGfFMaoH+m7lfYKcLOy30P/56w?=
 =?iso-8859-1?Q?CCg5ppvFPAmQGeIRi4eUn1Yx1gubuYwIL613gX6cyU/Kskmi2j9vfVfwAw?=
 =?iso-8859-1?Q?zIGU1vJUkYJ42CbdVbvMDglyVaat+JPAwGHQ1McpW2yMKCQwObG1fEt9xy?=
 =?iso-8859-1?Q?Y4/bW6Or9AlJwmZb8KBzFVQAV2pRRI+79Muqu1lJoxAMy+oDkH0OR9UELe?=
 =?iso-8859-1?Q?7WX6zANMQkNrORDU+RrbGeuJB15xPRykHVz1Dqtnq4IEYB7xldts21/Ix7?=
 =?iso-8859-1?Q?xHLsTrGTNfvu2lRrrJG5K4kDoPVLNkbrLuNo0UmgdnkjPPHxetumrxxP0n?=
 =?iso-8859-1?Q?oGomuv4aRbnnsIrgsTZ4Q/fgOnn2WYEkCT6JSQZ/6zKuHAXIYaMv4weD4E?=
 =?iso-8859-1?Q?1TrNXFHaGOfYd+vlAtDJE/+voIi5gvRB5Tdv7DD2ivXpEDhmMUS/Cpyea4?=
 =?iso-8859-1?Q?AyTXoRS+25wKfspRtzrEjTfpuzmZ6lycpOmKqKqpIdAibVia6WsdEFSyu8?=
 =?iso-8859-1?Q?xl6leJbPsXEAgNWNN8Pb4YvPGMl52Z7bjcy2I0dhVRhq2m2bzCFIMjawmC?=
 =?iso-8859-1?Q?tJJN2KGP5Oo9jTWAzcuX+slqn7R2dqgfoC8s/Gsiahm3CZBkXcLdHg+Whd?=
 =?iso-8859-1?Q?YzgodhIbfUIlW/vqF2uYV20+ligfmo68wyPBTh4DE5pv2PsINt6u/TcNbv?=
 =?iso-8859-1?Q?4Ub3oC4v9euv/LzbgI/j+2X3JhXEZ6UZhP6NF59A5ETcG5w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ens.etsmtl.ca
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbae338-41c7-4abf-167b-08d94bcf9f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 22:42:14.9893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70aae3b7-9f3b-484d-8f95-49e8fbb783c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4yWF4tGhRaeyRHhTPwjneIpLhPiJF7g8X2cg+DC2FmTKB7oFeJZ2yYPvyLHSEAippzLJAGLjdi9/Am5K12KAuXdsQt7iE8E3eCJK0IJFSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB0963
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,=0A=
=0A=
________________________________________=0A=
From: Pascal Giard <pascal.giard@etsmtl.ca>=0A=
Sent: Tuesday, July 20, 2021 10:33 AM=0A=
To: Benjamin Tissoires=0A=
Cc: Nguyen, Daniel; Colenbrander, Roelof; Jiri Kosina; open list:HID CORE L=
AYER=0A=
Subject: Re: [PATCH] HID: sony: support for the ghlive ps4 dongles=0A=
=0A=
Hi Benjamin,=0A=
=0A=
On Tue, Jul 20, 2021 at 7:39 AM Benjamin Tissoires=0A=
<benjamin.tissoires@redhat.com> wrote:=0A=
>=0A=
> Hi Daniel (and Pascal),=0A=
>=0A=
> [adding Roderick in Cc who is dealing with the Sony driver from Sony=0A=
> itself :) ]=0A=
>=0A=
>=0A=
> On Thu, Jul 15, 2021 at 9:58 PM Daniel Nguyen <daniel.nguyen.1@ens.etsmtl=
.ca> wrote:=0A=
> >=0A=
> > This commit adds support for the Guitar Hero Live PS4 dongles.=0A=
>=0A=
> I was about to ask you to add some regression tests to=0A=
> https://can01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.freedesktop.org%2Flibevdev%2Fhid-tools%2F-%2Fblob%2Fmaster%2Ftests%2Ftest=
_sony.py&amp;data=3D04%7C01%7Cdaniel.nguyen.1%40ens.etsmtl.ca%7C88d07df3b0e=
748fe593208d94b8b4f1a%7C70aae3b79f3b484d8f9549e8fbb783c0%7C0%7C0%7C63762388=
3961755185%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2BAvFyi%2FYcaVUXnk0a5Wz80N%2=
F1ZdLWhkExWQyVeBZmxo%3D&amp;reserved=3D0=0A=
>=0A=
> This would likely have avoided the previous patch that was required and=
=0A=
> cc-ed to stable.=0A=
>=0A=
> But after looking slightly at the patch, I realized that the Guitar Hero=
=0A=
> code uses direct USB calls, which is not something we can emulate at the=
=0A=
> hid-tools level.=0A=
>=0A=
> However, after a second look at the code, I think that this part of the=
=0A=
> code just reimplements its own HID SET_OUTPUT code, and that is=0A=
> something we can easily emulate.=0A=
>=0A=
> Could you check if the following patch is still working properly on a=0A=
> PS3 dongle? and if so, add your PS4 support on top?=0A=
>=0A=
[...]=0A=
=0A=
I wasn't aware that this was possible. Of course we will check whether=0A=
that works or not.=0A=
=0A=
Forgive me if I perform this reply incorrectly. It is my first time replyin=
g =0A=
using plain text and responding in-line. I applied the patch manually and t=
ested =0A=
it on a VM with a dongle while monitoring with Wireshark. I get a hard free=
ze =0A=
if I leave the dongle plugged in. I ran a test where i pulled the dongle ou=
t=0A=
before it freezes and i was able to observe the SET_REPORT that was created=
.=0A=
The data seems to have corrupted because I see : 01 08 20 00 00 00 00 00, =
=0A=
but the first byte should be 02. Regarding the hard freeze, dmesg gives me=
=0A=
these bugs/bads/rips:=0A=
BUG: scheduling while atomic: swapper /0/0/0x00000100=0A=
bad: scheduling from the idle thread!=0A=
RIP: 0010:native_safe_halt+0xb/0x10=0A=
Moreover, Pascal applied the patch to his DKMS module and recovered=0A=
different bugs/bads/rips through dmesg:=0A=
BUG: scheduling while atomic: swapper/5/0/0x00000100=0A=
RIP: 0010:cpuidle_enter_state+0xc7/0x350=0A=
=0A=
> ---=0A=
> commit 10e14f105553d2bd88bc7748e87154c5a8131e9e=0A=
> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>=0A=
> Date:   Tue Jul 20 11:44:10 2021 +0200=0A=
>=0A=
>      HID: sony: GHL: do not use raw USB calls=0A=
>=0A=
>      We can rely on HID to do the job for us.=0A=
>      This simplifies the code and also allows to implement regression tes=
ts.=0A=
>=0A=
>      Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>=0A=
>=0A=
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c=0A=
> index b3722c51ec78..901f61d286e8 100644=0A=
> --- a/drivers/hid/hid-sony.c=0A=
> +++ b/drivers/hid/hid-sony.c=0A=
> @@ -37,7 +37,6 @@=0A=
>   #include <linux/idr.h>=0A=
>   #include <linux/input/mt.h>=0A=
>   #include <linux/crc32.h>=0A=
> -#include <linux/usb.h>=0A=
>   #include <linux/timer.h>=0A=
>   #include <asm/unaligned.h>=0A=
>=0A=
> @@ -92,7 +91,7 @@=0A=
>    * https://can01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Fghlre%2FGHLtarUtility%2Fblob%2Fmaster%2FPS3Guitar.cs&amp;data=
=3D04%7C01%7Cdaniel.nguyen.1%40ens.etsmtl.ca%7C88d07df3b0e748fe593208d94b8b=
4f1a%7C70aae3b79f3b484d8f9549e8fbb783c0%7C0%7C0%7C637623883961760177%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;sdata=3DwDZUqmkAgtS2%2BTfcEkyWYbeXjK2xQRei%2Fb1N3MAMlQ=
4%3D&amp;reserved=3D0=0A=
>    * Note: The Wii U and PS3 dongles happen to share the same!=0A=
>    */=0A=
> -static const u16 ghl_ps3wiiu_magic_value =3D 0x201;=0A=
> +static const u16 ghl_ps3wiiu_magic_report =3D 1;=0A=
>   static const char ghl_ps3wiiu_magic_data[] =3D {=0A=
>         0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00=0A=
>   };=0A=
> @@ -597,7 +596,6 @@ struct sony_sc {=0A=
>         /* DS4 calibration data */=0A=
>         struct ds4_calibration_data ds4_calib_data[6];=0A=
>         /* GH Live */=0A=
> -       struct urb *ghl_urb;=0A=
>         struct timer_list ghl_poke_timer;=0A=
>   };=0A=
>=0A=
> @@ -622,56 +620,29 @@ static inline void sony_schedule_work(struct sony_s=
c *sc,=0A=
>         }=0A=
>   }=0A=
>=0A=
> -static void ghl_magic_poke_cb(struct urb *urb)=0A=
> -{=0A=
> -       struct sony_sc *sc =3D urb->context;=0A=
> -=0A=
> -       if (urb->status < 0)=0A=
> -               hid_err(sc->hdev, "URB transfer failed : %d", urb->status=
);=0A=
> -=0A=
> -       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL=
*HZ);=0A=
> -}=0A=
> -=0A=
>   static void ghl_magic_poke(struct timer_list *t)=0A=
>   {=0A=
>         int ret;=0A=
>         struct sony_sc *sc =3D from_timer(sc, t, ghl_poke_timer);=0A=
> +       const int buf_size =3D ARRAY_SIZE(ghl_ps3wiiu_magic_data);=0A=
> +       u8 *buf;=0A=
>=0A=
> -       ret =3D usb_submit_urb(sc->ghl_urb, GFP_ATOMIC);=0A=
> -       if (ret < 0)=0A=
> -               hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);=0A=
> -}=0A=
> -=0A=
> -static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)=
=0A=
> -{=0A=
> -       struct usb_ctrlrequest *cr;=0A=
> -       u16 poke_size;=0A=
> -       u8 *databuf;=0A=
> -       unsigned int pipe;=0A=
> -=0A=
> -       poke_size =3D ARRAY_SIZE(ghl_ps3wiiu_magic_data);=0A=
> -       pipe =3D usb_sndctrlpipe(usbdev, 0);=0A=
> +       buf =3D kmemdup(ghl_ps3wiiu_magic_data, buf_size, GFP_KERNEL);=0A=
> +       if (!buf)=0A=
> +               return;=0A=
>=0A=
> -       cr =3D devm_kzalloc(&sc->hdev->dev, sizeof(*cr), GFP_ATOMIC);=0A=
> -       if (cr =3D=3D NULL)=0A=
> -               return -ENOMEM;=0A=
> +       ret =3D hid_hw_raw_request(sc->hdev, ghl_ps3wiiu_magic_report, bu=
f,=0A=
> +                                buf_size,=0A=
> +                                HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);=
=0A=
> +       if (ret < 0) {=0A=
> +               hid_err(sc->hdev, "can't poke ghl magic\n");=0A=
> +               goto out;=0A=
> +       }=0A=
>=0A=
> -       databuf =3D devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);=
=0A=
> -       if (databuf =3D=3D NULL)=0A=
> -               return -ENOMEM;=0A=
> +       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL=
*HZ);=0A=
>=0A=
> -       cr->bRequestType =3D=0A=
> -               USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;=0A=
> -       cr->bRequest =3D USB_REQ_SET_CONFIGURATION;=0A=
> -       cr->wValue =3D cpu_to_le16(ghl_ps3wiiu_magic_value);=0A=
> -       cr->wIndex =3D 0;=0A=
> -       cr->wLength =3D cpu_to_le16(poke_size);=0A=
> -       memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);=0A=
> -       usb_fill_control_urb(=0A=
> -               sc->ghl_urb, usbdev, pipe,=0A=
> -               (unsigned char *) cr, databuf, poke_size,=0A=
> -               ghl_magic_poke_cb, sc);=0A=
> -       return 0;=0A=
> +out:=0A=
> +       kfree(buf);=0A=
>   }=0A=
>=0A=
>   static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi=
,=0A=
> @@ -2968,7 +2939,6 @@ static int sony_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)=0A=
>         int ret;=0A=
>         unsigned long quirks =3D id->driver_data;=0A=
>         struct sony_sc *sc;=0A=
> -       struct usb_device *usbdev;=0A=
>         unsigned int connect_mask =3D HID_CONNECT_DEFAULT;=0A=
>=0A=
>         if (!strcmp(hdev->name, "FutureMax Dance Mat"))=0A=
> @@ -2988,7 +2958,6 @@ static int sony_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)=0A=
>         sc->quirks =3D quirks;=0A=
>         hid_set_drvdata(hdev, sc);=0A=
>         sc->hdev =3D hdev;=0A=
> -       usbdev =3D to_usb_device(sc->hdev->dev.parent->parent);=0A=
>=0A=
>         ret =3D hid_parse(hdev);=0A=
>         if (ret) {=0A=
> @@ -3031,15 +3000,6 @@ static int sony_probe(struct hid_device *hdev, con=
st struct hid_device_id *id)=0A=
>         }=0A=
>=0A=
>         if (sc->quirks & GHL_GUITAR_PS3WIIU) {=0A=
> -               sc->ghl_urb =3D usb_alloc_urb(0, GFP_ATOMIC);=0A=
> -               if (!sc->ghl_urb)=0A=
> -                       return -ENOMEM;=0A=
> -               ret =3D ghl_init_urb(sc, usbdev);=0A=
> -               if (ret) {=0A=
> -                       hid_err(hdev, "error preparing URB\n");=0A=
> -                       return ret;=0A=
> -               }=0A=
> -=0A=
>                 timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);=0A=
>                 mod_timer(&sc->ghl_poke_timer,=0A=
>                           jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);=0A=
> @@ -3054,7 +3014,6 @@ static void sony_remove(struct hid_device *hdev)=0A=
>=0A=
>         if (sc->quirks & GHL_GUITAR_PS3WIIU) {=0A=
>                 del_timer_sync(&sc->ghl_poke_timer);=0A=
> -               usb_free_urb(sc->ghl_urb);=0A=
>         }=0A=
>=0A=
>         hid_hw_close(hdev);=0A=
> ---=0A=
=0A=
Was your patch against the master branch of hid/hid.git ?=0A=
I'm asking because it doesn't apply at all on my end, unless I use=0A=
--ignore-whitespace in which case, 3 out of 8 hunks fail.=0A=
=0A=
I assume I may be doing something wrong. I tried both downloading the=0A=
raw message from marc.info and from patchwork in case gmail would=0A=
mangle spaces/tabs, same result.=0A=
=0A=
Any idea?=0A=
=0A=
Thank you for your patience,=0A=
=0A=
-Pascal=0A=
=0A=
It appears as though the timer is causing the issues for hard freeze, but I=
=0A=
can't figure out why the data is different.=0A=
=0A=
Any idea?=0A=
=0A=
-Daniel=0A=
