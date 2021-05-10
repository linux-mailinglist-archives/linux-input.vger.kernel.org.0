Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A063797D7
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 21:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhEJToW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 15:44:22 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:37988 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhEJToW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 15:44:22 -0400
Received: from antares.kleine-koenig.org (localhost [127.0.0.1])
        by antares.kleine-koenig.org (Postfix) with ESMTP id 698F4B92B2A;
        Mon, 10 May 2021 21:43:16 +0200 (CEST)
Received: from antares.kleine-koenig.org ([94.130.110.236])
        by antares.kleine-koenig.org (antares.kleine-koenig.org [94.130.110.236]) (amavisd-new, port 10024)
        with ESMTP id FQOmxRin8T3E; Mon, 10 May 2021 21:43:15 +0200 (CEST)
Received: from taurus.defre.kleine-koenig.org (unknown [IPv6:2a02:8071:b5c8:7bfc:751d:682d:7359:e261])
        by antares.kleine-koenig.org (Postfix) with ESMTPSA;
        Mon, 10 May 2021 21:43:15 +0200 (CEST)
To:     Jiri Kosina <jikos@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210206151348.14530-1-uwe@kleine-koenig.org>
 <nycvar.YFH.7.76.2103081107250.12405@cbobk.fhfr.pm>
 <31028f589e27e246bb3b4b693caeb0b8eae3a285.camel@linux.intel.com>
 <nycvar.YFH.7.76.2103081716200.12405@cbobk.fhfr.pm>
From:   =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v1 1/3] HID: intel-ish-hid: Drop if block with an always
 false condition
Message-ID: <e200b949-b909-d5da-8c81-06a57fc50b98@kleine-koenig.org>
Date:   Mon, 10 May 2021 21:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2103081716200.12405@cbobk.fhfr.pm>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qGHuWGV0fsZU0BWAdzrJRAn3J4AVipvAq"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qGHuWGV0fsZU0BWAdzrJRAn3J4AVipvAq
Content-Type: multipart/mixed; boundary="ZS2vNPexYSXxqk5nVV4GkR8xH11UrMQ9T";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Jiri Kosina <jikos@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <e200b949-b909-d5da-8c81-06a57fc50b98@kleine-koenig.org>
Subject: Re: [PATCH v1 1/3] HID: intel-ish-hid: Drop if block with an always
 false condition
References: <20210206151348.14530-1-uwe@kleine-koenig.org>
 <nycvar.YFH.7.76.2103081107250.12405@cbobk.fhfr.pm>
 <31028f589e27e246bb3b4b693caeb0b8eae3a285.camel@linux.intel.com>
 <nycvar.YFH.7.76.2103081716200.12405@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2103081716200.12405@cbobk.fhfr.pm>

--ZS2vNPexYSXxqk5nVV4GkR8xH11UrMQ9T
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello Jiri,

On 3/8/21 5:16 PM, Jiri Kosina wrote:
> On Mon, 8 Mar 2021, Srinivas Pandruvada wrote:
>=20
>>>> A remove callback is only ever called for a bound device. So there
>>>> is no
>>>> need to check for device or driver being NULL.
>>>
>>> Srinivas, any objections to this patchset? The cleanups look good to
>>> me.
>> Sorry, I missed this series.
>> No objection for taking these patches.
>=20
> Thanks. Applied with your Acked-by:
> If you disagree with that interpretation of your statement above, pleas=
e
> holler :)

I expected these patches to go in during the 5.13 merge window, but they =

didn't. I found your pull request for 5.13=20
(https://lore.kernel.org/lkml/nycvar.YFH.7.76.2104292151220.18270@cbobk.f=
hfr.pm/)=20
and they were not included there even though the patches were in next=20
since at least next-20210310. Looking at

	git log --oneline --cherry=20
v5.13-rc1...dce6a0d56a7719efcad438f5c46a9d192fd36a89

(where dce.. was the tip of your for-next for next-20210506 (i.e. before =

5.13-rc1 was cut)) and it seems there are quite a few more commits that=20
didn't make it into your pull request.

What am I missing?

Best regards
Uwe


--ZS2vNPexYSXxqk5nVV4GkR8xH11UrMQ9T--

--qGHuWGV0fsZU0BWAdzrJRAn3J4AVipvAq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCZjM8ACgkQwfwUeK3K
7Anuwgf+JSHxB7za9i0xL9t5R1j1A2RAAiGuuTFd+yTRWWFy1j3Loq4jCfxnd5HQ
MhaLy8+0ZxBMzCJJnbTRJohgkBq6odjBePtSmyG+KTk42vA+uvVWv67jVpmbbXd1
5dQqQ5zduKcN/1TEwyFaMwSd6WxDjX4Yrwg0APsJ3z34QvHgLFzKVWjaFJ33u81I
vkma5rq504gKF0ronu4nbwFHxKyt+PXGydvG6vq10Hmhyuj6hpnSCPDtiiXwxONH
U6ATH90TXJ4LFnc0UXwl9OPkrnbw9YucadhVq+xv9v7naLuNzBp/91Vxr5f868aW
8MTQuhedMa6TqvjR13s9Ahaevmsi9A==
=gNoi
-----END PGP SIGNATURE-----

--qGHuWGV0fsZU0BWAdzrJRAn3J4AVipvAq--
