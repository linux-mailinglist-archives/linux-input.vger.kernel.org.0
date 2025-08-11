Return-Path: <linux-input+bounces-13911-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31926B212B2
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 19:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F1804E2ABA
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80D37081F;
	Mon, 11 Aug 2025 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="UqGpXYQM"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373018FC91;
	Mon, 11 Aug 2025 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931643; cv=none; b=jXuUh2dMmTjypVUFgIivjRkwYqGCBkjWuf5B6J7+BF9uonsT1CskuU0wTecAX7lVn8FLRSS1cvTjYUb05DW+xYsYvOsEqcSqbeldz2+DoSgK+H5TOYQWlgPvPminoU5L2gXk+jVCs8ev0l3Wvd/J7MFEB5aab8rznONi017sSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931643; c=relaxed/simple;
	bh=Lg4DZWldGfaElSJhb+gMiAGPGHMm5/dZMY6ViQJHpRs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=J+jHIP72JplDjjTjL0iY2tFfP15jeWZg9SM4NUqNB3Mv7a/5cthO/qe1Mk4NBlMoUjGodDXZ6p9/PuKVmlynR4XPaSYAfofS6hsKy3HMDaUkuoicHoKVKWyrDaTW9FtsSmHs99RGSUCGAWlyA2qmioFNOJonDCtt5mN6Ytj+sf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=UqGpXYQM; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754931634; x=1755536434; i=markus.elfring@web.de;
	bh=Lg4DZWldGfaElSJhb+gMiAGPGHMm5/dZMY6ViQJHpRs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UqGpXYQM5zJ36GI3+1r32RsLJMYuJ42CEulcgb5YdkSPCCfazmknCE6wjuGA9Uex
	 jzuHKvRZFuw+2k1jLPzTrP2h3dPsxwFEtgv38hMZhmy5Qjm9vlgOsbOzDioebTnTH
	 qrOf/7LUvF3QhKrFgG5stCZsP0huZm3ruHdgrRahm2/1ul3P7YuitfVVjnd/mTy9L
	 S1eM/AnlMK+5mJsiKd4VjOqD2xTkEou39WJfL/Dqubkbpmvc3RsuBSvyshpyjfj5h
	 hp2yJiWOWzehGVOPpr/7TZykFL1VkIvOujsXONqfahhgLgqeqOcDr+D9dqncgkNP5
	 dvK70pX29WeuFYVnOg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.213]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2Pda-1ujsWi23ji-00Fy0X; Mon, 11
 Aug 2025 19:00:34 +0200
Message-ID: <92a3486e-f101-4ca4-a611-a5c1c6afa6ca@web.de>
Date: Mon, 11 Aug 2025 19:00:24 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Leo L. Schwab" <ewhac@ewhac.org>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Kate Hsuan <hpa@redhat.com>
References: <20250810225617.1006272-2-ewhac@ewhac.org>
Subject: Re: [PATCH] HID: lg-g15 - Add support for Logitech G13.
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250810225617.1006272-2-ewhac@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/UHMAXQQNA9SX+ylvQGG4pvrp0/xBkyYn0+FqF48OmZS/VHkV6F
 QGK/YFnBq1MGC45UAolbk/FzMV0fNMrOppgzgSNU2fREv7LCZLmk5KbGY25ZlbHm8UNxz8E
 UPngv9psYjfZtZozGSwdheL6kzQHN5wlZvlOMRY5tsGCOrLdoqda3YpT96+lfA12/1WbCMJ
 eaS0EEBQMd5AMkLTb0lOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:plTSuVJm4X4=;qq+1voE+2MBN8/Ddhn7OZYDZEYc
 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
 KOmd7Jd18pVci1oVBE8g==

=E2=80=A6
> This patch supports input event generation for =E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n94

Regards,
Markus

