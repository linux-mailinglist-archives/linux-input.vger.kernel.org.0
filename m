Return-Path: <linux-input+bounces-12388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4EBAB9DE4
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 15:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E26444E55FC
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 13:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD41F72608;
	Fri, 16 May 2025 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk6C+PvI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AB7249EB;
	Fri, 16 May 2025 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403266; cv=none; b=JyJ7xt4323fwgwj3sDyGDzhAEVHxPXTSor6ILJo0Bku/V6kQmDeANqGygxTidvLGy9eN1g36vTF+/wBocWU5AX0YHwhKPxFXyDMCHr5X9B9Qe4ZJtyWURMM9nfL8zbYBXqSvXj5t3gcm/gUR1OuCFO7RzdxcvC69BVjv+PrdTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403266; c=relaxed/simple;
	bh=PdrYfHjHdOg6T2p2+ypf04qjhpHB/ZuyJDAp9UJMALc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZCGX85shXnbJa/RQKdKVbifU9epWdwzMBj+nBmWcMMWxPRFMyPVvOZgy7bBj2HkTk9I1G5de5Ohoe+kFFly4bBOiSS0r4WDvD2ERiQVhWFw9DXYKMvQvwBZi5XyU+aHwtXwYcqMQm5Em9S7tL/6tyLLfvqvfj+7qqmv5CSPJ+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk6C+PvI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a35da8bd67so640616f8f.2;
        Fri, 16 May 2025 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747403263; x=1748008063; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PdrYfHjHdOg6T2p2+ypf04qjhpHB/ZuyJDAp9UJMALc=;
        b=bk6C+PvIyvfdVijBhKNJ68HoQpPxg2FeTGY3mJdmWSPM973U+gucWbaAdsX+9LMICo
         zTpLzZyYMSwfx7gNOguF0kJlr2N0/ZOAM7HVnYagqtJcl5OBVKcOOlIdQLkmCFiKslvi
         w+UALFnuQOwKMNox1sxNiKTmV1K/euzXH6jjbXvgd7cpLH/YI/SziDkyTLWZF0dTwdBH
         eOuhSGoRDjzYGDCuFu/p1EEdP0gwIBCTClzLdU1xkMvkyP+8NRC91OqDY1fO3XXWBUFr
         RZQ9AFxVa9Criar2peVBuDnOd2IhrzW2SszIeAxik+PlYsfncwHvAWY0Cql6FArU/Fwm
         T1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403263; x=1748008063;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdrYfHjHdOg6T2p2+ypf04qjhpHB/ZuyJDAp9UJMALc=;
        b=KqvNfzLTTFwn41LFYwjK3ICL47oPb4CRENEHdVnUEOfuxJtqsrxE7eBEk+zxaA0Koo
         PDVffstr67SlEoOdi6mrQALKsddBq+ccke1wz9z07U4va9TavPouyU8peUYehK+SsCOj
         P6WCgGTpYTEAuTl9J8G3TEgTNJfz6hqvKHP4FZQit0g97iy4ekl9TYe5xNU6tdhvXzZD
         /rB6K8zIqXEbRdNsDZDzcQlb/nKFNQ4GHdUauOr1xt3qxK62SPmoVm4fFXXobrhx90xQ
         TYlw+RDLI6FpISQqiUGNpCyNDtjzYXaZ4C9F4g4Y26zgFnQU5Y+MA25r9Yt2CE11fa8J
         Ca+g==
X-Forwarded-Encrypted: i=1; AJvYcCUQtNGdWNWK2fhPPP4aNOKMsepGUxHpbnkpv09kb3ei+fn5ATscHNKjRQJ0BXzL6vzbhYLDV7ehBOwNJ+vk@vger.kernel.org, AJvYcCUypV15pqR5oebsqcrdO1lVq1PHohR3grtMZ3yHSBD1MgQR0kXx9vhEctGbjYhFBxwFmXrbWKYvgFla+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFAwd/WpGmSKl7eeC1HDsEh6R4rB8M9JUYUjj0gSYZwifj6HrP
	05UOOk1r1iyeFeO9azbF//c1YTOuw7cjwqCYhQ/GSpJE6aKhxY0oXIuT
X-Gm-Gg: ASbGncvKMWt2rF3ulfqt+6+QIRAGXSveui01tMuwcJf8zpcjqrK1AZUQqGn6ZkSSEMs
	S7ZXw9D9mAOyb70ekYmSWHRuiCZqfRtbU0c/hKMbEgErZiCsjqMfcOqy3OOrDuYjt/C5d3bBmrQ
	UlFxVjWrbTLdaK5WsaMjDU0o62BpQQrdlRP7fY0/ngJpk3Ij9jQsWZiWGrJj/ixOD3xyqR5QvLI
	+QvbGuYT4x6pT3egD4vSOzs8QumvWhKX1tS8ByvaKTN8IxNeW6oetT50UpMPYV07M7/zkTBtG9T
	54TMvK4iFM6OKc+22f6aQL0vRfwLGUW3DQP3NZtAq7racvipS7ew27oQzQ0KVKqO/DX5oKs/6r9
	bQ/+32os81iGzEXRBpALqJAA=
X-Google-Smtp-Source: AGHT+IG5VNx06WAk13YLUtCDtiIzLR6ynvRlys1Oj5AA2P4hRxh3qJg8qeVoLYimAbKmY9AZfcYYPw==
X-Received: by 2002:a05:6000:2901:b0:390:e853:85bd with SMTP id ffacd0b85a97d-3a3600db9f7mr2535009f8f.48.1747403263345;
        Fri, 16 May 2025 06:47:43 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a362b4e2e1sm1472013f8f.96.2025.05.16.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 06:47:42 -0700 (PDT)
Message-ID: <9615d118cf3e52ea67ac0421016f0b6cceb49c71.camel@gmail.com>
Subject: Re: [PATCH 0/2] Input: adp5588-keys Please correct and add
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Denis Arefev <arefev@swemel.ru>, Michael Hennerich
	 <michael.hennerich@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Date: Fri, 16 May 2025 14:47:43 +0100
In-Reply-To: <20250516134313.282564-1-arefev@swemel.ru>
References: <20250516134313.282564-1-arefev@swemel.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-16 at 16:43 +0300, Denis Arefev wrote:
> 1. Add check on return code
> 2. Prevent buffer overflow
>=20
> Denis Arefev (2):
> =C2=A0 Input: adp5588-keys Add check on return code
> =C2=A0 Input: adp5588-keys Prevent buffer overflow
>=20
> =C2=A0drivers/input/keyboard/adp5588-keys.c | 18 ++++++++++++++----
> =C2=A01 file changed, 14 insertions(+), 4 deletions(-)

Hi,

Thanks for the patch. However, not sure if this is really worth it... This =
is
driver is in the process of being removed:

https://lore.kernel.org/linux-input/04b8a6d68fdc0c0eadf69fbbc6a130ecc6c4936=
0.camel@gmail.com/T/#mad1980e9652161a6a2e36c2aeeb97f900c6e9fc2

Unless we want somehow to backport these patches?

- Nuno S=C3=A1

