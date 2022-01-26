Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B950F49D4B0
	for <lists+linux-input@lfdr.de>; Wed, 26 Jan 2022 22:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbiAZVru (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jan 2022 16:47:50 -0500
Received: from mail.zeus.flokli.de ([88.198.15.28]:56238 "EHLO zeus.flokli.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230126AbiAZVrt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jan 2022 16:47:49 -0500
Received: from localhost (ip-178-200-100-55.hsi07.unitymediagroup.de [178.200.100.55])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: flokli@flokli.de)
        by zeus.flokli.de (Postfix) with ESMTPSA id 5E6C1127F480;
        Wed, 26 Jan 2022 21:47:47 +0000 (UTC)
Date:   Wed, 26 Jan 2022 22:47:46 +0100
From:   Florian Klink <flokli@flokli.de>
To:     ValdikSS <iam@valdikss.org.ru>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Message-ID: <20220126214746.76z5hqayn5qwc3gz@tp>
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <20220124122417.pl4qhpb644xp4ax3@tp>
 <2f7053b2-4e47-e4f6-6a66-08067f30ed3b@valdikss.org.ru>
 <3e11f0cb-aeb1-6101-5b7e-c68cddfae0a7@valdikss.org.ru>
 <20220124134017.z2qiyf3uilnwt6ss@tp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ewp4elzpfl5ukmsc"
Content-Disposition: inline
In-Reply-To: <20220124134017.z2qiyf3uilnwt6ss@tp>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ewp4elzpfl5ukmsc
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>>>>Quick follow-up question on this - did you do any tinkering with battery
>>>>status?
>>>>
>>>>I realized there's a
>>>>/sys/devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb6/6-2/6-2:1.1/0003=
:17EF:60EE.001F/power_supply/hid-0003:17EF:60EE.001F-battery
>>>>
>>>>in my system, which knows about model_name, but things like "capacity"
>>>>and "status" return a "No data available".
>>>>
>>>
>>>Hello, no, I didn't do anything. It works for me just fine, it=20
>>>shows battery status in KDE applet.
>>
>>Note: I'm using the keyboard over Bluetooth.
>
>Hm, over bluetooth, there's a `/sys/devices/virtual/misc/uhid/0005:17EF:60=
E1.0030/power_supply/hid-*-battery` directory with the same files, and they=
 also have the same "No data available" thing.
>
>For now I'll just assume it's due to the controller internally still
>calibrating and not exposing anything - the keyboard is fairly new.
>
>Thanks for confirming it should work in theory :-)

Alright, I now also see battery levels (that also go down after
continued use) - needed to enable upower on my system. Works like a
charm!

Florian

--ewp4elzpfl5ukmsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEdQpT8aoDC+ls4wqU86BgVS9TAioFAmHxwYIACgkQ86BgVS9T
AipBRgf+IjA+qgoG1C5mhk+fSJI7kyXtpcfhkpsJg5AnKw8zu59MXbeLcWAOEdpH
+MrLQQ+lbXht/bkgcr3sXQPMPwxrF/lqBZXpzdYfz1pKrBC6j9RIISGWZhH9udvc
LEezGACdO8obDwBMsXFP/Btaj1pUyMgO+jtK8Zi3wHjecoJvhGwGdUKjNCNmOZE7
W+r0c8G188btqGNsH6TOcXyvfLcgNuOJ8F849n3kIpJn7hE/zY6ZQVrzqnRGsbq1
4rweXXe7uNoFLwTSWuiQG2KVDbUROAtZi3iIhWXhJ7NKvQSxAWyxmD7PBjhudLpd
0Ei/t28kQj0b3+W01we16+Lem3O2Dg==
=8QCo
-----END PGP SIGNATURE-----

--ewp4elzpfl5ukmsc--
