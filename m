Return-Path: <linux-input+bounces-16340-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F61AC874E1
	for <lists+linux-input@lfdr.de>; Tue, 25 Nov 2025 23:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F20FD4E12E4
	for <lists+linux-input@lfdr.de>; Tue, 25 Nov 2025 22:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334A924CEEA;
	Tue, 25 Nov 2025 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+3NxuPQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A670B18EFD1
	for <linux-input@vger.kernel.org>; Tue, 25 Nov 2025 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764109264; cv=none; b=GtccAibrkPDOdAOkLurajoNFYbII73lraEjHjvRr5uMxEgy6R7JhR8NR5B5fNuLnObvptjr3FfoIFQSWwrsccGTF4y1euFw0l7l8PDJRTH25VG1xvIT/h3tHUs8Sh8tfaCC9sht519K9FAtb7SQJdtenTUaNRJQijaa7mYTw4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764109264; c=relaxed/simple;
	bh=PcKtKl5GLPr0ZgfnEUGLcrpPSASaM8BYUIraHhn/QNM=;
	h=From:To:CC:Subject:Message-ID:Date:MIME-Version:Content-Type; b=mlaPJWj+Zwade2+iyT7/YWOdcsdGl78oH1jTI6c7tKL6omyarXK7u6owsPxfVGfLWbvzCksd3swcjyi74aBnDo1qCzyZk8+isH9C1hfKEsBZVEQAssmAapXivzwHgk60VgBOYnhOYB9i8fcaKOUWm12/avzIA4L1JcnOLEiKrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+3NxuPQ; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2a45877bd5eso420847eec.0
        for <linux-input@vger.kernel.org>; Tue, 25 Nov 2025 14:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764109261; x=1764714061; darn=vger.kernel.org;
        h=mime-version:date:user-agent:message-id:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcKtKl5GLPr0ZgfnEUGLcrpPSASaM8BYUIraHhn/QNM=;
        b=M+3NxuPQo3/IOHpfV0N2yIKF8Ky8UTSGE+/3X6NeON+9B9AYycFcjwzO1ZTiS+aQb7
         EnJg08Ck6r2d6bcD14T7JvaRC5rOjViG071/y3M+OATt7AkgUK+IP1j0W3Pm0gK95qUr
         b3tmKCsQuYlqMo0DjFxx9EQCC9ux2d7pjK8EecIOVyW+0bMVNlq4NqUXuJSnKMUshJJt
         qBA0E0mStw+/ONtsDeOSd5a8qziCX+I57wFvSMQX6TDpbSu4h5/NIpmQ6MbhFWS/Ki06
         U1ayeqpSVRWC/w99hniGMtyazcG7yRUFxOYSWY1HQjVTie1vvzgFgCzX5YAGNXiRj0eg
         dU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764109261; x=1764714061;
        h=mime-version:date:user-agent:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcKtKl5GLPr0ZgfnEUGLcrpPSASaM8BYUIraHhn/QNM=;
        b=pKC0x/jgjHewuqpLmj5nD87KtlCTpjlBh/QoGC64Mhk5Gdd8ryt3iU/3ICwKIZi6gm
         z1B0JIsW8WrEqVaW9bQlPLSjU4Cvc99erSu3A0vg2c8OhVTcvB/f2UWFhew4I3AHSKZm
         UJPjSEDjsDcIJ482V+WfqNTMXDoLMnkZNFiL5I3wzFaODcOspL8OxmHS0hUrCNaJzteo
         D6O1mndVuLY9njm3IfkuZ7drvSkxbhWhsYu2tBjZNFZvCBSuNEn1FakS4fDBjyi+OBHu
         mG8y1fwIwpu8hJ7hqOedwi5QVtTFT1dyHnj23+6O+fA4sLBJwjMl1P5bx+SanhkYXqtF
         PDRw==
X-Gm-Message-State: AOJu0YxEaFzsrwIukKK/JXMuCkkb1TiLvLxt0sUDTkX5XQbUhsYrEjmo
	LZJ6ggd6uL7ByY+9opD0asGV2+Twx+74+/g9oBREdPSHZ0/0S5DRnVKcnOTlUGxj
X-Gm-Gg: ASbGnct9i1197inoGqd09kOmgvQZ7yOxR8QEwX/al6QhCKKW/AdNzcUBMvo6JxVIExl
	S1NrUHrqSlEzLBBQySQqks9+ApX+0At9DP546KswK3/Cqmd8fevOHbrB+QTQTbismpnN6/iPc2h
	mouGc/8iXbBHlQ/O/z0xUxeNGjf3qiJq0Kyy7cXCmE80pAD5OXFe1b5Wxd38bGEF4CBOpMcjVkc
	JD0NBoKBTPvRwc7rsOhJMUkl6rzbKVtxeGYR+o3AibzXF9E55Dfz/n+yXhDXISzPgVzwzQXwOI9
	r8DyGjzTJ+OV8WoTIY6ayb0kpm8zAvTj0oShQjtDyDxd+xLEgjVhKrEv3MYSMDQZQgnDX71t8zV
	WsCe7alRoXBSf2u4Qu6ooNbeCaueoW7CLC0UO99vkuP2yTmu8h0LVFX1sD7yfBcwczuahdMDaMA
	==
X-Google-Smtp-Source: AGHT+IETTz/acl5NIL12nMJOmtwk/g031xPtzWN20KFTTsPCQ27bgmqZKgKInInzB0ySo7/yFF5hIA==
X-Received: by 2002:a05:7301:fa03:b0:2a4:3593:ccb2 with SMTP id 5a478bee46e88-2a6ff66496amr12072466eec.15.1764109261287;
        Tue, 25 Nov 2025 14:21:01 -0800 (PST)
Received: from localhost ([2600:6c51:4c3f:8e93::d81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a93c5562b2sm15890780eec.3.2025.11.25.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:21:00 -0800 (PST)
From: Christopher Snowhill <kode54@gmail.com>
To: linux-input@vger.kernel.org
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vicki Pfau <vi@endrift.com>,
 Pavel Rojtberg <rojtberg@gmail.com>, Antheas Kapenekakis <lkml@antheas.dev>,
 Nilton Perim Neto <niltonperimneto@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Subject: Notice of code provenance, change
Message-ID: <176410925975.88639.535107255129311194@copycat>
User-Agent: Dodo
Date: Tue, 25 Nov 2025 14:20:59 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha512"; boundary="===============0384519616125731370=="

--===============0384519616125731370==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

In 2011, I authored and committed
b514d4f7c6506b696d7de6a4426d0886753e43c9, under my preferred name at the
time, "Chris Moeller", which is my stepdad's surname. I had been using
it until 1999 or so for school, but in 1999, I had to get my state ID
card, which was under my legal name, which I am sending this email from.

There are a number of reasons I won't get into in this message as to why
I never had it legally changed, or why I ended up switching to my legal
name at some point. Maybe a matter of pride or whatever.

I also accidentally typoed the email domain as "gmail.c", and then years
later, I discovered that several list messages were misdirected at that
incorrect address. Whoops.

Anyway, even if it is too late to change the commit history, I am now
signing off that commit again:

Signed-off-by: Christopher Snowhill <kode54@gmail.com>
Signed-off-by: Christopher Snowhill <chris@kode54.net>

I'm also including my other primary email address here, in case it is
useful to anyone on the project. I still have the hardware somewhere,
but I'm not really equipped to perform tests or maintenance with it, and
I haven't acquired any newer Xbox hardware in the same class since. I
now have an Xbox Series X|S wireless controller, but that's an entirely
different class of hardware, covered by other drivers.

I already tried to draft an email once, and my client ate it, because it
didn't save the draft, and I hadn't properly configured oama for OAuth2
sending yet. Let's see if I get an error this time.

--===============0384519616125731370==
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
MIME-Version: 1.0

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEdiLr51NrDwQ29PFjjWyYR59K3nEFAmkmK8sACgkQjWyYR59K
3nGp6g/+LdgpanwsezZhHCQazGWyKi5onIk7QywVZz0eB7OkZNT5ejiKQcpZChgU
i0wjFg3hMRtHWiJ7wVTSmLRdeqdG/vawYGez00p371fU1P5e33ZUPNTiupiuBN2b
osRuM4jGtmQygoZiMXgb36nWVZYD49zlzQrp4OxJm16CeNjWRqO+UaO75fszdW7G
zjOIWZb+4wMlRJHKegd2LHqGK4Kgi0JhGXOSuZSGNK0yKF0mvPhPERrI3YHIZNgz
2W54IrYCYSr5xubmWkiPzT4QWYT6kteIA4VEf8w/rwopGzjCqC5ylzan5l6Zpmu1
mOCCQyhikb4gBPJRzok9SNDkPO1fCdyFX7tM3HLLsEZBzXX+HyXTiYYtGCzbefgY
U3N6zJj/Y9Zl45gvg0JKCj2gmE3XyvPR57JxhLKButbaC+MyEW9nsIWgbMlDwEHN
nwjEcvL/2AguqDpSY/8UF7JiSRo0KTL/AbtWlim9MnkX1WyfqBL+r7oRSA/PYLFf
SKQAsrJ/EcgGX3AIm/+1q8d48KS09ixPHVBPkCQZIOGSVM1x+2oiNLp6d8cAsgV+
SqYOxZ9GnFGz/a/h0tfmnUPV0qq4htlLb9p+GD3IHyYOMOgpHD86tB8V+5DUQBoD
R+P6dL5a0Zq5f/tEEpvAQkq2bMcyyRq/gj2IP1ctH7arovww17s=
=1bh8
-----END PGP SIGNATURE-----

--===============0384519616125731370==--

