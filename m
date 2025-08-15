Return-Path: <linux-input+bounces-14040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3D6B27D18
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 11:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3C487B118C
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 09:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6696C2E54A4;
	Fri, 15 Aug 2025 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kotiuk.pl header.i=pawel@kotiuk.pl header.b="WpMNpQ4F"
X-Original-To: linux-input@vger.kernel.org
Received: from sender-of-o51.zoho.eu (sender-of-o51.zoho.eu [136.143.169.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF8B2DC343
	for <linux-input@vger.kernel.org>; Fri, 15 Aug 2025 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755250129; cv=pass; b=VG6N3uFuC4PqxWoFI5bf5a39QqpXxwMFfYqAHRqjFVC3VO+/wGO2k7hsoG0ZKdYFdQ+nYQ0KW3GjgMkkH25h1AsRiVBuplglOnbQKEZcHPPln4LPohg2Gfoop5ykDDm/V8rK0FaaxKHrPsbs4AYUiq+MKc4LyC/DDzSBxCKi9tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755250129; c=relaxed/simple;
	bh=p4FCBpD5L+4TcZHxjq0b1lI8voUcTe1NeYkiZ3hTzv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ijov2bLeUKm424ZvqBkfKYwaC+iYm78yeNIbvEH4uDLbFSo1Vcimx/v0y5Yl3f6YKEAu2ZsGDZQHjMj2oqbueRqVujT9717/jFcEhS6QyBBkdM37H/DHJ7JmiDJZzOcJTHhus6rZzhWURTBFyiDQWb+BrGBh6g2A7Hr+gs/pAWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kotiuk.pl; spf=pass smtp.mailfrom=kotiuk.pl; dkim=pass (1024-bit key) header.d=kotiuk.pl header.i=pawel@kotiuk.pl header.b=WpMNpQ4F; arc=pass smtp.client-ip=136.143.169.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kotiuk.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kotiuk.pl
ARC-Seal: i=1; a=rsa-sha256; t=1755249180; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=cZwtvcpL0VN0RXUv3ngQCyXLE7x6jZ1xOzPBa8ddaW8OVV2u9fBVu7tTv8bHiTmBh6KVuFW/YvRTIMHh+SEfBCED1XBPcql8IX73kiCXVzH+Hb9sDiLZrv/EM+BAHV8sAnLokk9NZjUVo6SzmpEnan2GaydEp/vBrvgFnBtNXL8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1755249180; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p4FCBpD5L+4TcZHxjq0b1lI8voUcTe1NeYkiZ3hTzv4=; 
	b=A2bxwGeAieh59kOJBbSW7KOh4+jUFApftKGY6KzGIlBWjTPyot+ZXDpxLMMZiphhzryja+hOZ9HHIcTBEuxCe0TmsUkmvBBd+iQ7z/NyRlIb1wBQO0bd9gwWI3V3EopUbt1gC8/Cv+Dm1hT2TDzm7VVcRotHdZwNcfdnczGZS6I=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=kotiuk.pl;
	spf=pass  smtp.mailfrom=pawel@kotiuk.pl;
	dmarc=pass header.from=<pawel@kotiuk.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755249180;
	s=zmail; d=kotiuk.pl; i=pawel@kotiuk.pl;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=p4FCBpD5L+4TcZHxjq0b1lI8voUcTe1NeYkiZ3hTzv4=;
	b=WpMNpQ4F3+cG0FxEsirmI2V87GagTD6as/mPxpTL3nNyzOc8bhVlvqBrVmR4z4o4
	8lsEwGqShTwApRG7yx5AN5B9cylvZndA7a6MH2+1BopWpbQZVV5QfA+IWUsenHctzSK
	EJBJwN2zsIOuM1qFrJM4QChlL1BZug1iI3pEgQbU=
Received: by mx.zoho.eu with SMTPS id 1755249179060498.36275145621505;
	Fri, 15 Aug 2025 11:12:59 +0200 (CEST)
From: =?UTF-8?q?Pawe=C5=82=20Kotiuk?= <pawel@kotiuk.pl>
To: bnatikar@amd.com
Cc: adrian@freund.io,
	basavaraj.natikar@amd.com,
	benato.denis96@gmail.com,
	bentiss@kernel.org,
	iv.dovg@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev
Subject: Re: [PATCH 0/1] HID: amd_sfh: Add support for tablet mode
Date: Fri, 15 Aug 2025 11:12:50 +0200
Message-ID: <20250815091251.20737-1-pawel@kotiuk.pl>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <db1d95be-e92a-4328-b43e-8214a0b520be@amd.com>
References: <db1d95be-e92a-4328-b43e-8214a0b520be@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

> Sure, Jiri, I will get back to this patch soon.

Hi Basavaraj,

Could yougive us at least a rough estimate when you will be able to check this patch?

Thanks in advance
Paweł

