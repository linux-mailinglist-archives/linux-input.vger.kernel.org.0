Return-Path: <linux-input+bounces-4290-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA5901E05
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 11:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DBD28358D
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 09:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2752474054;
	Mon, 10 Jun 2024 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvqkuG4j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E1518C31;
	Mon, 10 Jun 2024 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011354; cv=none; b=hRqOZy700FsL5FPtFTqisINKBTA8dRwDYD2/t1pGe0So5S2+QlKBV2P8fHo8270c1evLBO7s2DSM0dX0aQkHXvL4PbbGL67OnuEfdrPcjC5Hj/t2nhIyaY0w2icDXnm5WmV3NbbQ5E5OlBTQnGMe89n8HFZ3J4RSA0VpQlCEl8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011354; c=relaxed/simple;
	bh=j9A/rBwDhxLLDCI7vyau1r8sh17/Qb17QTv36WldZwI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pG0d6UNccaDDCzG3l7LLnbKysjZiH1RMMp3nbyLU8rK7U4Z9s8mE/+lbN7+OKVmW3ZpFcyUcfb0dgY/ErG2GYi9HgcCyvk6cf0TqTVKsxBWD5xO7+ZAv5udJjNUKbc5WHiptFDV+Yb5FJu7k8Pz7DbI0AzmAlMPOtwVxNsPsiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvqkuG4j; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57c5c51cb89so3152354a12.2;
        Mon, 10 Jun 2024 02:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718011350; x=1718616150; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j9A/rBwDhxLLDCI7vyau1r8sh17/Qb17QTv36WldZwI=;
        b=KvqkuG4jkd/6b49mtHXnw3SWUI3imM2bNn+Dt/eSgJLJ6etyhESeHCTOYLv0BI7DGF
         U1qNlf+zBepXeEB5lw5QisgRDMSnwzC9mtacKeiAspoEIdtmI4F97oBCq7VSgxfVW1oC
         /0GOYsRYnBi8FV0vYESxPs0IDPcI3o0wLRT/7CxSxkiFYC8dzlGyyDZPw5msfA/mHv57
         535KEc7B+Smau5UmlQFaTDPYX3Z86FiXQ3b1+my5nHqQMODXhZuVOdXEOqfScXeQE3we
         4TpACA+zsNUJwej4ZR/ZRZ9zHbtwULn8hoGiCG/edb6iWEiDRBVj0cb4xGMMrQ0MWsa3
         tr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011350; x=1718616150;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9A/rBwDhxLLDCI7vyau1r8sh17/Qb17QTv36WldZwI=;
        b=C5jWcUBBFWt3y6LSqgeYY0TzEZruQxI05KKRh79Uum1y9ZwMx8B7vrxZ/PRD/fAeOY
         hlCqXAQeTCnD/S4rezHZoPVospzFm/pJK1BW716N9JVE4PoYCpLWEXkzUsU+MIlLTIYe
         zv+TeV6j4xjho0uMT1ZyECuyRvT+kLVtdGQw2Nlv9i6wS02BK9+Ibk4fr43etxH3emg8
         fhUAdSAz2McOPQ7ov43kDaQ3NEv/FdMscGjNUp7VFiIRIq619Vrs0urlV6pdE7O0AifK
         gu42EKj4YNMgwS7n6QAv612k9iJodIqtxGM9lJCHKp0kTV3ouN6nCyh9t1BOTtv6tcGn
         y8sw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Fku2epBAkPTmseamcx9CxG2rzcw2rHIKaihDMXDQnhSrg++mLpimSBu2KMwFERSMCrCWT6GkzSVsWKR+QWjulZ+Su9to7ygkzyAGsIPqxB2Igb4WWOKlBkqFZipq1Z9fiUAQxdgbHxc=
X-Gm-Message-State: AOJu0Yzab9Wn5GIHY2WINLuiwakb4hQ7aLEADZHvbdAooFd6kXFOX4Bw
	gqFd98IQkS4TWurmpy/JtxM4GUnd13WLOm+e314aykfuk4wIt1cF
X-Google-Smtp-Source: AGHT+IFlYbCXBRu3JVxA9Oyw9DxIPbdy4/XMF+m85UANVbqTTgmxVTnSW/xQIVTtXSsI4wF2xc2Ypg==
X-Received: by 2002:a50:9f49:0:b0:57c:7f2a:c13f with SMTP id 4fb4d7f45d1cf-57c7f2ac1demr2253610a12.26.1718011350084;
        Mon, 10 Jun 2024 02:22:30 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c69d06729sm4233854a12.56.2024.06.10.02.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:22:29 -0700 (PDT)
Message-ID: <15af47e6005286c02b70b232d96b1ba1a49659b9.camel@gmail.com>
Subject: Re: [PATCH 3/3] Input: adxl34x- switch to using "guard" notation
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Jun 2024 11:26:18 +0200
In-Reply-To: <20240609234122.603796-3-dmitry.torokhov@gmail.com>
References: <20240609234122.603796-1-dmitry.torokhov@gmail.com>
	 <20240609234122.603796-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-06-09 at 16:41 -0700, Dmitry Torokhov wrote:
> Switch to using guard(mutex)() notation to acquire and automatically
> release mutexes.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>



