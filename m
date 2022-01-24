Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1796498149
	for <lists+linux-input@lfdr.de>; Mon, 24 Jan 2022 14:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243193AbiAXNkU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jan 2022 08:40:20 -0500
Received: from mail.zeus.flokli.de ([88.198.15.28]:54784 "EHLO zeus.flokli.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243196AbiAXNkU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jan 2022 08:40:20 -0500
Received: from localhost (ip-178-200-100-55.hsi07.unitymediagroup.de [178.200.100.55])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: flokli@flokli.de)
        by zeus.flokli.de (Postfix) with ESMTPSA id B1BAD127A043;
        Mon, 24 Jan 2022 13:40:18 +0000 (UTC)
Date:   Mon, 24 Jan 2022 14:40:17 +0100
From:   Florian Klink <flokli@flokli.de>
To:     ValdikSS <iam@valdikss.org.ru>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Message-ID: <20220124134017.z2qiyf3uilnwt6ss@tp>
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <20220124122417.pl4qhpb644xp4ax3@tp>
 <2f7053b2-4e47-e4f6-6a66-08067f30ed3b@valdikss.org.ru>
 <3e11f0cb-aeb1-6101-5b7e-c68cddfae0a7@valdikss.org.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fsxyfawoug3yt7ij"
Content-Disposition: inline
In-Reply-To: <3e11f0cb-aeb1-6101-5b7e-c68cddfae0a7@valdikss.org.ru>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--fsxyfawoug3yt7ij
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22-01-24 16:08:03, ValdikSS wrote:
>On 24.01.2022 16:07, ValdikSS wrote:
>>On 24.01.2022 15:24, Florian Klink wrote:
>>>Hey ValdikSS,
>>>
>>>>This patchset adds support for Lenovo ThinkPad TrackPoint Keyboard II,
>>>>in both USB and Bluetooth modes.
>>>>
>>>>It brings additional functional keys mapping, native vertical=20
>>>>and horizontal
>>>>scrolling, trackpoint sensitivity configuration and Fn-Lock sync.
>>>
>>>Quick follow-up question on this - did you do any tinkering with battery
>>>status?
>>>
>>>I realized there's a
>>>/sys/devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb6/6-2/6-2:1.1/0003:=
17EF:60EE.001F/power_supply/hid-0003:17EF:60EE.001F-battery
>>>
>>>in my system, which knows about model_name, but things like "capacity"
>>>and "status" return a "No data available".
>>>
>>
>>Hello, no, I didn't do anything. It works for me just fine, it shows=20
>>battery status in KDE applet.
>
>Note: I'm using the keyboard over Bluetooth.

Hm, over bluetooth, there's a `/sys/devices/virtual/misc/uhid/0005:17EF:60E=
1.0030/power_supply/hid-*-battery` directory with the same files, and they =
also have the same "No data available" thing.

For now I'll just assume it's due to the controller internally still
calibrating and not exposing anything - the keyboard is fairly new.

Thanks for confirming it should work in theory :-)

--fsxyfawoug3yt7ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEdQpT8aoDC+ls4wqU86BgVS9TAioFAmHurEEACgkQ86BgVS9T
Airp5gf+Px9joMJKX7mXOOBNbucBJLrMkhJLf0MoQHafxEwqTkqgVElip8Gwf21H
+KIRaC5mGrkpbD1Cy1mRwkTS7LCWyg9o/r61UH7R9+Pxrp1TbTwi6vrFoQIJQRGM
MmHo3ClXrc48LPGXuPyg1ysCG/CBI6KCZiUlBsDbHHgwoc2VAR9vXen1iLSj7kAU
xsVes2Ef1BKJZKKTiZK4E655dNHBX6pDHjifHMWvhskCNmWX/cPW8lbn4AS02dQR
NVMMKZtD1/ICyU1nxZTyrtoG9kkzOpRlTuG6DvxK+F0k4g5A7ZkwaUu0v5szU45Z
qnvAZ1vJn43WF2rcdqCza418SLd08A==
=+7wH
-----END PGP SIGNATURE-----

--fsxyfawoug3yt7ij--
