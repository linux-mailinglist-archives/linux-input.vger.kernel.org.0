Return-Path: <linux-input+bounces-2978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF6D8A3C72
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 13:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 983071F21E08
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 11:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E193320B33;
	Sat, 13 Apr 2024 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=thomas.kuehne@gmx.li header.b="JlSv96M/"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49762C9D
	for <linux-input@vger.kernel.org>; Sat, 13 Apr 2024 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713007183; cv=none; b=n5TYCO/KYelhxScg9Ddsp7FNG6F1gPuVXmaIOA/BUKe6Efp2da6aYBVwJ+X9MYx6pdD789SUh/X2NhD76mg/jMYbUNyZbz0eClWjJN1lrV7Ne4HSDwAz+q+MufaeQ/lDQIJAUBftcD2Kwpg40eC1Fqw8sbbMzaWD7814fwB9MZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713007183; c=relaxed/simple;
	bh=yWpMWcWdT2NAv9xJgDFQPi/OS84rtkRBNzvXC0whBDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uLZ2LYKggBEbbib2w41UY+G50MFoKhtZdG8/N8sqVxgDT9PBnh45zXqHfmTka+Ko2WeV2cLDSizMPGGyYDlP71hs6HqeXerg66i4DOdIxueZpY5V89VyMXiwBPizYEzRSnDduBXVFgvqA87vI5jnsykkbPe6ga8QZQlmMZ2FZ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li; spf=pass smtp.mailfrom=gmx.li; dkim=pass (2048-bit key) header.d=gmx.li header.i=thomas.kuehne@gmx.li header.b=JlSv96M/; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1713007175; x=1713611975; i=thomas.kuehne@gmx.li;
	bh=IvCgLErZufudPOEFYl6Avu57wJLktPoQRJ1WjawI5Kw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
	b=JlSv96M/dWotTVNGEJgOaryZsDPJ8ijfPi242DcyeQhBKrJo0CDqbFMuZJYqSAtB
	 tr45kphRk5nzZvAnwbIYbZt/fHktBTcnbt/L2/FVF0FwC4RAr8YVl9v7GNHA/87Nf
	 4RE3PgWloH9YBkSoNLtzuxqWPPgrvLJCEd4i/h8URFJ1Fo3FpCrUcvmZQtwf7egCV
	 QpgsZGABcUQ5FgfKlUjGLmdmM9uZPsU0iNbDGxKWx9Da3M8t7vzLMyJKhMycaO0Rp
	 qYSD5PQBzPv67zKTYCsYOjgvcgh9fo9hgm4I1uuspi0JO5Y/ZObkZtYqVq/Quv/wl
	 xd28r91psdHPHZ0KsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from black ([2.59.120.154]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw3X-1sdQYu14N9-00iyzm; Sat, 13
 Apr 2024 13:19:35 +0200
Date: Sat, 13 Apr 2024 12:20:51 +0000
From: Thomas Kuehne <thomas.kuehne@gmx.li>
To: jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org
Subject: [PATCH] HID: hid-debug: fix Moir -> Moire typo
Message-ID: <Zhp4o/lIvW3bJ2kF@black>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Yew90IY0MO3/uOTnMs9gbHEiP0wdZmsuBFzcSpDy/GTckMD78QJ
 GS1+CSBVMUPoNfW+XK8568RLI7+Ya11a13fVoXX4wSbOV2X/eTAWM2bk5XWBOJvOr8+yGF8
 T+vvsU9hZACMFRgNYnDWsXtpGlXQP6YfA2zxbs5iLpS13oWArDd4bKhv8wpXc22qwwB9oaD
 hiEhuTopmRStv+BWBF7DA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gVtkdAxMc8E=;aywXWyxcFBxxMBtBGu6QZ5yNboX
 muUMV0Sk6QQJK4FnytttYrouW2dSuK6xuL1aTzdLa2rmN6BxXpQZ7ZU4fW0AVquhpC1fVSaS8
 9kBuiG+Pim8pYLG61dYe1CIaF8R2vkwcgkqCm7v7nzACbpYFpxj1JkzxiegHKmNlZAJVwhJBv
 YFJuK1840EjCDAjhi1mNQG65PA13Wo2kvrQn4qss9GHbk4LCuGNEGanDRhUP36+JnCB0mSpHD
 /gViPIRGNmrgtUpdgzDKzuxvs+XCBCurS2p0jQdmDTRr4JxT5qnpSKP6xeh4lG3v4uuXiPV86
 AKY5dV2bT9rs3+uI7W2gpBeY2axwy6jep1Rt5VpEsMovhhNlNZZQIbIQyAXKU/HQZQAOWDW+Z
 B5EoWr2y9w2InAL5qeHA4YmdAEArZdXqqs4ol2O17up6i/mTHwAR2g8b49AASnVGt/7SYcdjB
 vpaZ37lzGUxI+UWb4D+n1KR9MNEvQsBclLDKBFlDaFptrEtr+2Xj2abPVSG/GrXT6FVcWKf7w
 74YtF2kCsi13hQIKp946rFCXft/oJtXvvl5Pi+0C1UzxRMXEBo04tdRnyFTP6oaWI+5ZxBFrd
 e1qk1KC3/V7NkQejvDgTmS1UForgqPz7lzpw0GAKh6z4juifBBP5s6mb1YwIQlLfmO8EW4xdT
 B5I6GV/meZCZU3J2UjzE+uQUfd29ZZXLikONkLSU33y9qRaTqBTMHX/fpOsK6gW3w4QzzRYpQ
 SSjPWOwL/Op4gkmfdleNCR8Cva3zl0peL1/HZvpJCYTqioowHvnHGZwrZtPD7gQ6VkerDBA2k
 kDIM61gh/LY3e+5DuttPWzK0f/Ll9kinRxay4T94AuNyk=
Content-Transfer-Encoding: quoted-printable

This adds the letter "e" to fix hid_usage_table' HorizontalMoir and
VerticalMoir entries.

Signed-off-by: ThomasKuehne <2562574+ThomasKuehne@users.noreply.github.com=
>
=2D--
 drivers/hid/hid-debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index add353a17853..a62e71a5ccef 100644
=2D-- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -2361,8 +2361,8 @@ static const struct hid_usage_entry hid_usage_table[=
] =3D {
 		{ 0x82, 0x0048, "TopCornerDistortionBalance" },
 		{ 0x82, 0x004a, "BottomCornerDistortionControl" },
 		{ 0x82, 0x004c, "BottomCornerDistortionBalance" },
-		{ 0x82, 0x0056, "HorizontalMoir" },
-		{ 0x82, 0x0058, "VerticalMoir" },
+		{ 0x82, 0x0056, "HorizontalMoire" },
+		{ 0x82, 0x0058, "VerticalMoire" },
 		{ 0x82, 0x005e, "InputLevelSelect" },
 		{ 0x82, 0x0060, "InputSourceSelect" },
 		{ 0x82, 0x006c, "RedVideoBlackLevel" },

base-commit: 9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
=2D-
2.40.1


