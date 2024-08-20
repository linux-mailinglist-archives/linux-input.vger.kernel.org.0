Return-Path: <linux-input+bounces-5698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43924957A74
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 02:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F5E31C23317
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 00:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6597C4C62;
	Tue, 20 Aug 2024 00:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="EDo07Wzi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858D4C70;
	Tue, 20 Aug 2024 00:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724113493; cv=none; b=mD2eNQteoJXMjy2lcP2wpDodlz+pg2RjvYjkil0RXQ3S2bbmJHPoWQ6k1pMms04vH/0oIov8tHZyHtczVD7YL/0DB7bQ9Q8aqoxR0IUncGaYbUn1LHRPG0fVzeYxmbtUCNgxmwjGzN6iOT8Hic2BLeWuN3ugYmgPZXMYwIOABHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724113493; c=relaxed/simple;
	bh=JKLCZnyzGDJcDFNYmbmy7lafHBvdp4yYr8MPXamKl5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kb7JJditnOEphxoAuiJT5mbR06uOoFdKGALKwZPAXv7rmVyB3/qJaCMM9oeJKCXy/N0aSsmHc7ZV4lS+2YkooVJHGDuRJe8jm4KeLzdY1mgeJ5Tn5gRgqN+NoinazwI1dPdV9wyXjJbwrliQTaTJ1ZUjoT9fOLWlsPT3UJXMbj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=EDo07Wzi; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DCDFC006A;
	Mon, 19 Aug 2024 20:25:27 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1724113531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JKLCZnyzGDJcDFNYmbmy7lafHBvdp4yYr8MPXamKl5A=;
	b=EDo07WziGv6M9M+dnUTRnz4GfCGZvPPLGJiUP/Vfz/KATeUcJcFzZCztRAh2lcsSn40Kqf
	fpE3Eu3/aFvuO4wNQHPb/xpVus7JmyEm1fCsCZIlmtTVDdHa3A27nvCAzYSXiFj72HhaeN
	X6DNu0pdm4CrZAQW9c3Fwx2NOr3BCJ0=
Message-ID: <f6308658-0ce6-4b40-aa6f-dd75668ff142@kaechele.ca>
Date: Mon, 19 Aug 2024 20:24:33 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: - fix incorrect size when reading product ID
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Job Noorman <job@noorman.info>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZsPdmtfC54R7JVxR@google.com>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <ZsPdmtfC54R7JVxR@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Thanks for fixing my rookie mistakes ;-)

Just tested it on my Lenovo ThinkSmart View and it works fine.

Tested-by: Felix Kaechele <felix@kaechele.ca>

Thanks,
Felix

