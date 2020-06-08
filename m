Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506801F2C3F
	for <lists+linux-input@lfdr.de>; Tue,  9 Jun 2020 02:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730393AbgFIAWk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Jun 2020 20:22:40 -0400
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:58244 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728931AbgFIAWg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Jun 2020 20:22:36 -0400
X-Greylist: delayed 1717 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Jun 2020 20:22:33 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:To:
        References:Cc:From:Subject:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IZ3osmNhhKtpbNRgI2zvxWOPsn+IyyGJSmVIHCJoefU=; b=NJwIs32j86FPK/Rsj+lXldk80p
        OWXyv5nyi/ED4grzwyfn5KWWRCGfowhb+a+z6Z71uQ5iyuD63zTb4Q++oUO3EGD2oPyRx0xQHZTU5
        zvySFsJeLjMQisiTZyn9lQmZ6HvHB5t3Wj8tYT3pSeU3ooZDjW9+Z16yjjcwYU/0+VoGCBo9ZxjQY
        2/ASlDU4TnBpvYS4EeGOhYk61/WPhUsYwu7hyq9x+bvTEU6k1KFsE3RONBCv0vfxmK7UOnG0ck41h
        jHCyb8D64EK/GMGuTsENG/AU22uzAVXXrcPucXvAJ5P22OGiOc9rmgpIyMYhhtfp8kUOyi3FMSSNQ
        bA7i4zdQ==;
Received: from deepwater.fritz.box ([192.168.178.25] helo=[0.0.0.0])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1jiRaO-00016v-0e; Mon, 08 Jun 2020 23:53:48 +0000
Subject: Re: [PATCH 0/2] Add SW_MACHINE_COVER key
From:   Merlijn Wajer <merlijn@wizzup.org>
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Mattias Jacobsson <2pi@mok.nu>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20200215170216.14397-1-merlijn@wizzup.org>
 <b13b6bf3-f9e3-1151-81f9-53f3ec9dc26a@wizzup.org>
To:     linux-omap@vger.kernel.org
Autocrypt: addr=merlijn@wizzup.org; prefer-encrypt=mutual; keydata=
 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
 /XslHw==
Message-ID: <60f55d93-e7d3-15e7-3b34-00e3e3eda99c@wizzup.org>
Date:   Tue, 9 Jun 2020 01:56:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <b13b6bf3-f9e3-1151-81f9-53f3ec9dc26a@wizzup.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BD4MznUIpJfv0CgL9cBuWjIlEyUAqpvVA"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BD4MznUIpJfv0CgL9cBuWjIlEyUAqpvVA
Content-Type: multipart/mixed; boundary="vCLPoD2BqEA7gsKtxa8UihGTpriM4rs5n"

--vCLPoD2BqEA7gsKtxa8UihGTpriM4rs5n
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

A while later (again) - any thoughts/comments?

Should I resend the series?

Thanks,
Merlijn

On 15/04/2020 15:29, Merlijn Wajer wrote:
> Hi,
>=20
> Any objections or further comments on these two patches? It's been a wh=
ile.
>=20
> Cheers,
> Merlijn
>=20
> On 15/02/2020 18:02, Merlijn Wajer wrote:
>> this series adds the sw_machine_cover key, and changes the nokia n900 =
dts to
>> expose the key via gpio-keys.
>>
>> before, this gpio was used as card detect gpio, causing the card not t=
o show up
>> if the phone was booted without cover, see this thread on linux-omap:
>>
>>     n900: remove mmc1 "safety feature"? (was: re: mmc0 on nokia n900 o=
n linux 5.4.18)
>>
>> since there is no realistic use for using this gpio as card detect, in=
stead
>> expose it to userspace via gpio-keys. there are no event type for mach=
ine covers
>> yet, so add that first.
>>
>> the key should be 1 when the cover is closed, and 0 when the cover is =
open.
>>
>> starting the nokia n900 with the cover removed, putting the cover in p=
lace:
>>
>>     event: time 1581684523.415296, type 5 (ev_sw), code 16 (?), value =
1
>>
>> removing the cover again, exposing mmc1 and the battery:
>>
>>     event: time 1581684529.413706, type 5 (ev_sw), code 16 (?), value =
0
>>
>> Merlijn Wajer (2):
>>   Input: add `SW_MACHINE_COVER`
>>   ARM: dts: n900: remove mmc1 card detect gpio
>>
>>  arch/arm/boot/dts/omap3-n900.dts       | 12 ++++++++----
>>  include/linux/mod_devicetable.h        |  2 +-
>>  include/uapi/linux/input-event-codes.h |  3 ++-
>>  3 files changed, 11 insertions(+), 6 deletions(-)
>>
>=20
>=20



--vCLPoD2BqEA7gsKtxa8UihGTpriM4rs5n--

--BD4MznUIpJfv0CgL9cBuWjIlEyUAqpvVA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCXt7QEgAKCRAGN09rynK8
WhYzAQDqg+1E0f5I4W2c/lL/47WE/gQodpDpJ8LIQjHN608yaAD+J0GzAxfIpWZp
+pcatZnAvolmd4RIdYdqxEqJ/ahCjgo=
=H1hQ
-----END PGP SIGNATURE-----

--BD4MznUIpJfv0CgL9cBuWjIlEyUAqpvVA--
