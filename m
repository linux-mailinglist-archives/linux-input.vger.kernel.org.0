Return-Path: <linux-input+bounces-223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9F07F5535
	for <lists+linux-input@lfdr.de>; Thu, 23 Nov 2023 01:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4447C2813C2
	for <lists+linux-input@lfdr.de>; Thu, 23 Nov 2023 00:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCDC63B;
	Thu, 23 Nov 2023 00:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="jJzgbuZW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D836189
	for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 16:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1700698726; x=1700957926;
	bh=1Z+IIJ6L/N0OcGMEeyWKr7zC6tBBMqbZUKv3Pez8x5o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jJzgbuZW0zeAxbwnX15ptXnmRrrHvR4hcNH1hhQyy5MNES8ieqXHdXA2PmppdP4+l
	 2geItjLxsKcKtPM/oYYzfSer1omoAqWUfsMrl2UUUrOPyYumyytthCpkDZ58ufJMTh
	 rIEOyAyDYz4BBTKVaADYeEv1v/uzoU8a8mbAnSAjIH6H2MjB67dG15VzWL9Z8nLH8U
	 cQI6uw+grK/1R2vB3uMqdSclvligUz8i1KUkND0dy2sUhVV3S/ueIy26wyu7ge+uOb
	 nqB8opirgj01Q34utwC9/epzPGWqv2B9atJnIh1kpigB2PZcRe4F77NUX0Tg6NNkZ2
	 jCeKIcy4p8Wzw==
Date: Thu, 23 Nov 2023 00:18:36 +0000
To: "roderick.colenbrander@sony.com" <roderick.colenbrander@sony.com>
From: Alexander Koskovich <AKoskovich@protonmail.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Wrong inputs on DualSense Edge Wireless Controller
Message-ID: <o-hu9PCGr9R5LPS2ZnqssxnR22SBfwuDa0xuSsPwr3op3vBs1lbSsyH7RZMxkw7Ro2EuEzXbekDPrbiFoJ_R2_TzDlQ1g5zDaCogEU2w0sI=@protonmail.com>
Feedback-ID: 37836827:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[Resending email due to lack HTML message rejected]

Hello,

I am currently on Fedora 39 (6.5.12-300.fc39.x86_64) and I am noticing that=
 the inputs for this controller are wrong primarily on the right side of th=
e controller.

playstation 0005:054C:0DF2.000C: hidraw11: BLUETOOTH HID v1.00 Gamepad [Dua=
lSense Edge Wireless Controller] on 10:3d:1c:fd:30:bc
playstation 0005:054C:0DF2.000C: Registered DualSense controller hw_version=
=3D0x01000208 fw_version=3D0x01000036

This is the current mapping that I'm seeing with the hid_playstation module=
 loaded:
"X" is actually "Square"
"Square" is "Triangle"
"Triangle" is "Circle"
"Circle" is "X"

Also the right joystick seems to be controlling "R2" instead of the right j=
oystick. "L2" and "R2" triggers control the joystick instead. It's overall =
very weird. Has there been any similar reports to this?

