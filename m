Return-Path: <linux-input+bounces-2494-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB137887C45
	for <lists+linux-input@lfdr.de>; Sun, 24 Mar 2024 11:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68FEEB21034
	for <lists+linux-input@lfdr.de>; Sun, 24 Mar 2024 10:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5B016415;
	Sun, 24 Mar 2024 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sthu.org header.i=@sthu.org header.b="BlDPe/2a"
X-Original-To: linux-input@vger.kernel.org
Received: from aristoteles.sthu.org (aristoteles.sthu.org [37.247.49.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3D15E97
	for <linux-input@vger.kernel.org>; Sun, 24 Mar 2024 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.247.49.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711276410; cv=none; b=KnTpnCUb0p/D4dvVbeD6LXmpwQiK1hLADXSa+bs5XIXLCGX6kpYsHkRDkK0Tg090Eh+8pPCeJ7erD+3A4vu5wfg/+YlPSXcrvNhc9WCz0uqzVI9G2FAOP6hB/k7MZ9v5YrMpp8ihko+KDHefJ2VFACnvSacKa54UF9ZYDKvLN+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711276410; c=relaxed/simple;
	bh=adHcHvTvoE5xMhPPW9JLLExRniUf3JdjB9T0h1vPR18=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=he8ytfQWimrENBFBAg8Ja+iWboIfs/PDw7Cien8+0jwTIbUyxfJzNloX0eHHoKiqa3IYYAvuvdiC+RsqpDwAND+UUQilCTx/Uwch5jZznTA35gEDD8BcrYrlGk3/4+6zzzDwyNIO16GeahkLBZPi7Itpnu4EdsWEVybGJZ0suLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sthu.org; spf=pass smtp.mailfrom=sthu.org; dkim=pass (2048-bit key) header.d=sthu.org header.i=@sthu.org header.b=BlDPe/2a; arc=none smtp.client-ip=37.247.49.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sthu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sthu.org
Received: from euklid.sthu.org (ip53-228.rdns-ips.comteam.at [185.16.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: shuber@sthu.org)
	by aristoteles.sthu.org (Postfix) with ESMTPSA id 3EFF127CF4
	for <linux-input@vger.kernel.org>; Sun, 24 Mar 2024 11:33:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sthu.org; s=mail;
	t=1711276401; bh=adHcHvTvoE5xMhPPW9JLLExRniUf3JdjB9T0h1vPR18=;
	h=Date:From:To:Subject:From;
	b=BlDPe/2anpxx0L/LQ5W6ogoB2gQITH4a6y8wMjLSn5Uew7OOceTYD2HvUtCDnNQxQ
	 CMVuqqQ0QUABQu5iQQ8edLton4S78msV/o7QJzLtFR4QVCQnc5hB4ZFZrKXVloQBeP
	 nvuUpl6OXNtbsCt8U+YNCH6k5fh0C3nsANW6SxmGWmIZS6B595JmYc/u68RNWkgXBm
	 Np8PP3PyGoklnvNYhH+/2nA+1Uvwz57LZCXswW6EMZFFiCVMAuIwDscEoRf3sSwPSN
	 0Nr3YwAgy+UGv5s//vtGX3UGnKHTT+35P+32o3MM0xPWPrwDSZppws9HX8Xuj2LEAV
	 CXMfZXs1e4mtw==
Date: Sun, 24 Mar 2024 11:33:20 +0100
From: Stefan Huber <shuber@sthu.org>
To: linux-input@vger.kernel.org
Subject: ThinkPad T460s on kernel 4.8.0: touchpad says it can support a
 differnt bus
Message-ID: <mqwz6qtlbcl3grgnjbjqrjwxo2t5vwgaq6zadq73fd7ng6umty@4lv6gszyk2ez>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ivebqjyi3io7mk37"
Content-Disposition: inline
User-Agent: NeoMutt/20240201


--ivebqjyi3io7mk37
Content-Type: text/plain; charset=utf-8; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: ThinkPad T460s on kernel 4.8.0: touchpad says it can support a
 differnt bus
MIME-Version: 1.0

Hi,


I follow the instructions of the kernel logs saying:

  psmouse serio1: synaptics: Your touchpad (PNP: LEN004b PNP0f13) says
  it can support a different bus. If i2c-hid and hid-rmi are not used,
  you might want to try setting psmouse.synaptics_intertouch to 1 and
  report this to linux-input@vger.kernel.org.

Then I did:

  $ cat /etc/modprobe.d/psmouse.conf
  options psmouse synaptics_intertouch=3D1


Touchpad of my Thinkpad T460s works fine and kernel logs say:

 $ dmesg | grep psmouse
 psmouse serio1: synaptics: queried max coordinates: x [..5676], y [..4762]
 psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1094..]
 psmouse serio1: synaptics: Trying to set up SMBus access
 psmouse serio1: synaptics: SMbus companion is not ready yet
 psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2, id: 0x1e2b1, caps: =
0xf003a3/0x943300/0x12e800/0x10000, board id: 3145, fw id: 2073050
 psmouse serio1: synaptics: serio: Synaptics pass-through port at isa0060/s=
erio1/input0


Kernel I am running:

 > uname -a
 Linux euklid 6.8.0-gentoo #7 SMP PREEMPT_DYNAMIC Sun Mar 24 10:54:25 CET 2=
024 x86_64 Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz GenuineIntel GNU/Linux


If you need anything more, just tell me.


Best
Stefan


p.s. This caught my attention because I am desperately hunting a kernel
crash after some resumes from suspend for all kernel versions after 6.4.
After some weeks or months I think that the crash (blinking caps led)
might be triggered when touching the touchpad. Unfortunately, I cannot
get the kernel logs after a crash=E2=80=A6

--ivebqjyi3io7mk37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEo9kv93hdQ8jywZuizdib5QlzkZ4FAmYAAW8ACgkQzdib5Qlz
kZ7fMxAAj0OxOlpDIIrkWkppLN+tnPkjt/afb7rOAjwSKigqXZBJlhCnzo/L8liK
3Qb6v9jBCYEtMtWP9xskMtx4pETllncn4liAegWSEyTWj+lck1b+yUzS5YNMWHWv
RW0qxf7GXCUA00/CRZKcGUTm9lhPBQBMyckkVmvCKPUe6weXYU9i37WsU5CD58TP
mO9bXAZnKFZJxcEjMUSv6baAexrug39o39wXok4+AiwwsoNNisCdPf2SCQlmjeN3
Y2016XL47A+riLkXz3hzW0yv66j688q2NxQeFhpPCg8FTPGtFRUIzXNJNMfKWHMw
/SF1BrOESzwM5wtaufudz/C0HiXTp56lyhMgOSXg4yky4QcGl3mJQlvJ52TWzI3R
SGNEQJrCOSpLSxlGwNjjka2uhI6CnaA2XqhIJuvuEO7/3bkNTHFojPKMMDRl541g
YBcfUl3syo4HDufWOtMqMI4SBsiXa6c2WZ9SiXOi1Sss9DATi6cB1e5zvpR19ARy
kyx+U9VxVhI8WyPDTUNNuONvqIo9YTaEHzS59F1uuk9l3PY6hn0T3B6Q5aPrJpi5
1bQpEhHoIM4DJLxlw+IpKOUB9sfM7v00fonxAUzZhFQlUYlo7aAf3LJXB+pKRV/j
7941BIjF284UhkwTGehRx5H7c4ktbcJoBFjMgtOyknrst3pQIkQ=
=nEp5
-----END PGP SIGNATURE-----

--ivebqjyi3io7mk37--

