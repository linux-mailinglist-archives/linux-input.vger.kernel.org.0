Return-Path: <linux-input+bounces-15136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F5BA6533
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 02:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 725AE3C09FA
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 00:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A941C3306;
	Sun, 28 Sep 2025 00:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="tXlMqMNP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E2A34BA42
	for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 00:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759020663; cv=none; b=JYroegx1DlfqLE3ENgLEcvVYGV77wWAJqVu5d1Lxxn/cRB1N0nKOScV4Y/JQk++nq5CppdqhrTbNJIayAJTYFrJJOmCCEcGlQvURqbnbZko0AXTgjid8ufrbMk8y6fVlUgK/L163ana0z0ZHAv7KbwW2Bx3BSuc2F0jVp8cB9ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759020663; c=relaxed/simple;
	bh=5kEp/zOz0Hm7xTbEcIwSvNjcDuY7AVcN15oBMDskwUw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WguwniugnDMMmGLHNE+dULm4U4OEdZ7fBKcRWnzgqd9T6gHkG+yurE0JJPfruuzQrHLgddKn91PO3ln44iUFfMw6YbhL1VWyByb/+F4Q3vvQuTf04/8y+xHtnhAh3Z+SIO73As2KkfON7Q7eldF2rTByxWH9DxwLyx9+uOoyK4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=tXlMqMNP; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1759020652; x=1759279852;
	bh=5kEp/zOz0Hm7xTbEcIwSvNjcDuY7AVcN15oBMDskwUw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=tXlMqMNPN2F9DwNLsjgawU47BdcYsue7HzIxZzCh3FUbppEVQ1LJ/QWyR9JcqjJAX
	 85rF8kixrzl/EvSIBajIrgTjChoEK5VJ2jpIufgt7hndA91bUtqoMz+utCOZns/IKU
	 rKY4h9S0ffo2z5FaGKAhRBGEoZM0z2aSC4f+2kDGpcV3wr0K7jHe3mR85volhdNjWQ
	 URpkF5NeojlOxZTidhJuIy2bt3ufrLHGvVJvfDvrwnKhSMxPHu35AH/N2IAMon4zNC
	 2hV+f2MLPLyT3R/x4Hg/ItD/Hd72YZ+SnILJyZxL6Cns16K6TrQq+fbylv2GSUtjsq
	 FBz1Aiclth42Q==
Date: Sun, 28 Sep 2025 00:50:45 +0000
To: Stuart <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, hadess@hadess.net, lains@riseup.net, benjamin.tissoires@redhat.com
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <2cff2a0c-04e7-41e2-9b0d-26c18fcb8102@protonmail.com>
In-Reply-To: <CALTg27nCi-cyY-C=Vsi3zXqHsk+M3uMyJ8U35vmxp8YNiqU9-w@mail.gmail.com>
References: <20250902184128.4100275-1-mavchatz@protonmail.com> <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com> <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com> <cc2e6e2d-1b42-444a-9f8e-153fa898be44@protonmail.com> <CALTg27mH1rzyaNXEq7SowZcVYMiWUgejQCFgdDCHACUm9j+3SQ@mail.gmail.com> <7a4c4678-bb75-4aa7-8f4f-706deba7e72b@protonmail.com> <CALTg27kat6CReAvU8nXsVzqKEtzytT+_wf9dZ07OFSke=ipYLQ@mail.gmail.com> <848a3c8d-5f0b-409c-b394-1cce6a4c1e62@protonmail.com> <CALTg27nCi-cyY-C=Vsi3zXqHsk+M3uMyJ8U35vmxp8YNiqU9-w@mail.gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 048cb7075c35f21c74055333dacbf43b245712a3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-09-27 19:58, Stuart wrote:
> Hey, I've been keeping an eye out for the v5, did I miss it?
>=20
> Thanks,
> Stuart

Sorry for the delay. Things were busier than expected and I wanted to=20
investigate the protocol error that was printed in the kernel log.

I have now sent out the v5. You can find it here:

https://lore.kernel.org/linux-input/20250927234834.2635483-1-mavchatz@proto=
nmail.com/T/


