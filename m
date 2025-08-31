Return-Path: <linux-input+bounces-14400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8387CB3D1A0
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 11:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5DD1189DFB6
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 09:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33751FF7C5;
	Sun, 31 Aug 2025 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="iQVLxYJD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail0.khirnov.net (red.khirnov.net [176.97.15.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599B21A314F;
	Sun, 31 Aug 2025 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.97.15.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756632669; cv=none; b=CC5d5+B4CYlrmnBWK0/hAOpQ7qK3wy/rm9GzYyW2J+3V9Me1BmnzaMVDKKJ+tMG3ChAQITAfXeCvwL12daAyqYEesYfLy/Qahl35HcQvjY2lKRiSrVfdOq7DrspGixPGdYs8sOMU8/DumoDw3oTVzkHS0WqCgcqzDEupKp3WqrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756632669; c=relaxed/simple;
	bh=dQMY8OkWhke69WUhDU9fABOMfsaOVxXhKAEKmnlkERw=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-ID:MIME-Version; b=GEArR5Fziemz2PiVVdQkc+qx3lqEZTl9zUHBx4h1tXd04e7DI0NCCskbgoOBNUWGfSgZPJYlEmjKRrPtep/fX6AKq3jcTXreezx7VDkt1atxn/cRfYCMHl6oHZG/kg7MHckcd9u7S2SlrENNAEw7CoA6814yUgWuDYQdbFITGSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=iQVLxYJD; arc=none smtp.client-ip=176.97.15.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: mail0.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=iQVLxYJD;
	dkim-atps=neutral
Received: from localhost (localhost [IPv6:::1])
	by mail0.khirnov.net (Postfix) with ESMTP id 988812456B0;
	Sun, 31 Aug 2025 11:21:52 +0200 (CEST)
Received: from mail0.khirnov.net ([IPv6:::1])
 by localhost (mail0.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id FBhgZ5AaUlCs; Sun, 31 Aug 2025 11:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1756632110; bh=dQMY8OkWhke69WUhDU9fABOMfsaOVxXhKAEKmnlkERw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=iQVLxYJDK2gdKgcNoMZDk7n5aaGK2jRwjtj9+Mx8fgTJLpcVXc71fBmLyv4IkjnHe
	 gv9Rm5rfOn1sPVJtLmb0JwBiXRI1wcifx0aatLJvhFkUZXwRbNl/2nH16ApVbIE3cK
	 cRfhiKEeP7Aml+XD5cdpuZ0LL7RSJh3yyi7XiTyQiO8kX8GQu8AbMc680gzNiyZffx
	 r0061FSZOvjslModXCTHIZZgBf76r6s58M5RL0gHOkQslGthj8kaxlPEHHksSsKs7/
	 G1o7fS6wiXlpuYhB7cSv+0jhbxDXzjfZjksRMHr8jnjlZlSgMkErg6E+CmxVW/GDaw
	 F5dTb0gi9cG+A==
Received: from lain.khirnov.net (lain.khirnov.net [IPv6:2001:67c:1138:4306::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "lain.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail0.khirnov.net (Postfix) with ESMTPS id 310962456AB;
	Sun, 31 Aug 2025 11:21:50 +0200 (CEST)
Received: by lain.khirnov.net (Postfix, from userid 1000)
	id 062751601BA; Sun, 31 Aug 2025 11:21:50 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject:
  Re: [PATCH v3] platform/x86: asus-wmi: map more keys on ExpertBook B9
From:  Anton Khirnov <anton@khirnov.net>
To:  Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:  Hans de Goede <hansg@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
In-Reply-To:  <f4c39474-739f-855f-50ec-1aa0d24e8e4f@linux.intel.com>
References:  <e39cf267-0784-4b56-a989-349e84487bbf@kernel.org>
 <20250827152954.4844-1-anton@khirnov.net>
 <f4c39474-739f-855f-50ec-1aa0d24e8e4f@linux.intel.com>
Date: Sun, 31 Aug 2025 11:21:49 +0200
Message-ID: <175663210999.18450.17751420471718227766@lain.khirnov.net>
User-Agent: alot/0.8.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ilpo,
Quoting Ilpo J=C3=A4rvinen (2025-08-28 18:18:51)
> Hi Anton,
>=20
> These days I'm the one handling pdx86 patches. I took this into the
> review-ilpo-fixes branch and reinstated Hans' ack.

Thank you, much appreciated.

> My experience is that long delays are nothing unusual when interacting=20
> with Dimitry so don't get discouraged by that when it comes to the
> rest of v2 content. Once Dimitry has okay'ed the input side change, please =

> resubmit the rest.

Sure, I will.

Cheers,
--=20
Anton Khirnov

