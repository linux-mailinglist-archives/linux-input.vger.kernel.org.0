Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893C52B0899
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 16:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgKLPl3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 10:41:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:33978 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbgKLPl2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 10:41:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 87E55AB95;
        Thu, 12 Nov 2020 15:41:27 +0000 (UTC)
Message-ID: <e1d48a94a9f080534d4940048081d5ecdc64d4e9.camel@suse.de>
Subject: Is delayed work's precision good enough for input-poller?
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Date:   Thu, 12 Nov 2020 16:30:49 +0100
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-j+PViMkZ1knFOXZaIe0K"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-j+PViMkZ1knFOXZaIe0K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,
I just found about an issue in the downstream Raspberry Pi[1] kernel that I
wonder if it'd be worth fixing generally. The official RPi DSI display
touchscreen uses the polled input interface. The ts chip works at around 60=
Hz,
and that's the period the driver is configured to use (17ms). This doesn't =
play
too good on systems with low HZ (100/250). Users complain that in practice =
they
experience, at worst, half the event rate. This is due to the rounding erro=
r
when converting milliseconds to jiffies, general system delays, and what no=
t.

We could somewhat fix this in the driver (raspberrypi-ts.c) by playing with=
 the
poll rate. But it seems pretty hacky and would ultimately stress the CPU
unnecessarily. I wonder to what extent it makes sense to move the
implementation to using hrtimers whenever the poll period is in the same or=
der
of magnitude as HZ's delta.

Any ideas/comments?

Regards,
Nicolas

[1] https://github.com/raspberrypi/linux/issues/3777#issuecomment-698346991


--=-j+PViMkZ1knFOXZaIe0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+tVSkACgkQlfZmHno8
x/4g5QgArhTiFQzPIzDaPQJI4mLs8vIA1ANaSYgQsUthdA58b9UJdb97/TGplU9B
uVyPZOBgPKOVryBOVqZzC4pyLEDgNnTtjHCY4BfqHMR4b9e6JDZFLXen5UDexcyn
XocxmLqNYJj5aa3sXeLlXtFodsLdLyo7zcT1UFNYccCsRd8St1ezSfMESVjIj3qa
ohndc2R138BfQ8StWJ8JoY5yfRbWuo406Y3zZJgtwWA3nMwB8SpO/o7mf9wQEj06
bnIquVSWW+NgUN+FvTPaUyjsHaQ9TaJACLQaDJb8SWtwNTOXD+cbu3gT6uwN+kZ0
w+P590WvrPU9ZnV7NXERNhban2BqhQ==
=s0Aw
-----END PGP SIGNATURE-----

--=-j+PViMkZ1knFOXZaIe0K--

