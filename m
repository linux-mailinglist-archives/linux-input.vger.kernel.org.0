Return-Path: <linux-input+bounces-13917-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB92B21795
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 23:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E947B3A92CF
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 21:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2B72E3386;
	Mon, 11 Aug 2025 21:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b="rrkN+jh3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="HUFp0JB5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="bESo7f/I"
X-Original-To: linux-input@vger.kernel.org
Received: from sender8.mail.selcloud.ru (sender8.mail.selcloud.ru [5.8.75.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091CF28505F;
	Mon, 11 Aug 2025 21:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.8.75.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754948442; cv=none; b=MbYq112ol275BCgKnEia3ere1sC+igxX4+3zitS0QX0f3Kt9rDgt8DmJBVOkh6uWH7QBjmn9Qsqh10lMix9xJD8XwYxkY05slDq85gBBnhvm1SNzzwnEXmVVeCUCH8+W3RMalK1U2G3Ph9lr/jyDksya7E3amzuXUaKGrw7hZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754948442; c=relaxed/simple;
	bh=INcKSIidEmhooOmWAnHvpbNFQ375p7EmobfY35aDgN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAkIQyXLIUt4Hk6J2lE5QdI/mUTTifDpLZLOcePkmX/lyLL/u4WP14yM4KwbojQP/lLniw64e1tTnn/ghjvTbSNqiBPUoX72Xx5EuO4/ZJ1NX26MAEBKpfHYS0Ylhfc3xCEDBy3auHvbDsk6LCHxRtZliqVGdG++qLTzNHV3Gig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev; spf=pass smtp.mailfrom=mail.selcloud.ru; dkim=pass (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b=rrkN+jh3; dkim=pass (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=HUFp0JB5; dkim=fail (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=bESo7f/I reason="signature verification failed"; arc=none smtp.client-ip=5.8.75.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.selcloud.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.selcloud.ru; s=selcloud; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:List-id:
	List-Unsubscribe:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Help:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kPtagQpWqNGYIhY9cPRe9omNLYktbtQe2SAvQBI3k3c=; t=1754948438; x=1755121238;
	 b=rrkN+jh37O4cPLnRQVba+qQYBvP4BQqX5v37ArVp+wk1w/MzPLvzZXHy9bJn1cSZwAnPPOZoow
	38o0lPx78DHtk8339YAKMd1gbK5JIYlXRKG2HwF+qB9nODhrQMxNjMIh9hGW5f9feuyv6+HIlOr41
	qLDsXMhTUww/ZnRkuT4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=foxido.dev;
	 s=selcloud; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:List-id:List-Unsubscribe:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kPtagQpWqNGYIhY9cPRe9omNLYktbtQe2SAvQBI3k3c=; t=1754948438; x=1755121238;
	 b=HUFp0JB5v7Fj3etYI9dZcrdwhNTFa8sz/nldxHo2R0eMQaF3DQsdONFM5HHhJnFbetUeO5K1rW
	EEB+1EeCaIZjKg8ndAKjUjxlnRIA1CriZ5dIYtpLGESiWuK47eiTialYbahtJaMNbmPSwK2XR/7wh
	0XO3FM7x0rLUqiuO6vqc=;
Precedence: bulk
X-Issuen: 1136024
X-User: 99111435
X-Postmaster-Msgtype: 3849
Feedback-ID: 1136024:15965:3849:samotpravil
X-From: foxido.dev
X-from-id: 15965
X-MSG-TYPE: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-blist-id: 3849
X-Gungo: 20250728.224157
X-SMTPUID: mlgnr62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxido.dev; s=dkim;
	t=1754947462; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GEwHpxe57zRDnKU/ER/Gz01cI639JWwJ3pd6HVxPdXQ=;
	b=bESo7f/ItUToyDdaynA7h2Z2GXGdA534dvVh/CbEetQjjf5Wofdin50hS7uQ80SM9HIeeb
	0ZTnV+3IESU8AWvk/WNGAv9em+fD/r1UZbyjMJOIBDm8AVogsg7bQ8ZUQO9xTb7rhsl+Bm
	jDB1Dkf1o0KlHujw049d1TC/5AkatlDmmT5LV7CuJJvPsMxEwOXfqyfzOlJFbIw87atL/j
	ybdejJPGMEXrXSSCLAd4BN0o9fE9bMDHi5VB1glGM9h4bUcRTaHLrKsTRGcaJiv9NEBSlC
	IYG1R3RJnitje+EfOwlM73+kyd05GavDtqQq2wKwqa+FlbNb7qAbvPpQBdwbyQ==
From: foxidokun <foxido@foxido.dev>
To: dmitry.torokhov@gmail.com
Cc: foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nikita.nikita.krasnov@gmail.com,
	platform-driver-x86@vger.kernel.org,
	w_armin@gmx.de
Subject: Re: [PATCH v2] platform/x86: Add WMI driver for Redmibook keyboard.
Date: Tue, 12 Aug 2025 00:23:53 +0300
Message-ID: <20250811212353.4494-1-foxido@foxido.dev>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <5e32uo4suh3mtib4tohtekwvycxgfzqcem3wwc6k6wwdxyjhpc@bt57y7vyvpmz>
References: <5e32uo4suh3mtib4tohtekwvycxgfzqcem3wwc6k6wwdxyjhpc@bt57y7vyvpmz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable

> > +	/* For linearizability */
> > +	guard(mutex)(&data->key_lock);
>
> What is the exact purpose of this mutex? What does it protect?=20

It protects key sequence, so there wouldn't be race between two press & r=
elease combinations resuulting into press - press - release - release ord=
er.

--
Gladyshev Ilya

