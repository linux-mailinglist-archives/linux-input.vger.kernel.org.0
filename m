Return-Path: <linux-input+bounces-15978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91AC486C3
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 18:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E7EF189077A
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 17:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2152E543E;
	Mon, 10 Nov 2025 17:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vtiSDSw8"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0072E62D0;
	Mon, 10 Nov 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796964; cv=none; b=EGq60kDaBswU6lXGEF1A7+zy6UWFwVabKW9nPGHxPPLceM8FBBwNLtiB8MX1J8lJi0Pj8VYzXzIVZ2KXeQWnu0byGQ7riYzj/rMkSbajIDQJq8oJmmwgUgP4ZSKilZWrIXig7c2UNQbBneZJ8yd4mE+8795cOQ6Y/rdXcDnxByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796964; c=relaxed/simple;
	bh=gGhfDbzx8a/xO5uXKhHOWSkDr/Tx4JyNgqzqiKqpIUY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=p5hCVGHIdlTNwJHBQf3LFkyZC5IIkDHriolyZYVpoWFbtTPCuIY3H9D/aeMYgLt80u6F6ND2IAYW9NdXEb2ZqGFd+ugXvBfGjU6gpyomhEmG5AlGSQUn7SSwBwfrsaqzILuGHSevlmYNOMszr+uO6sXoYIsjDS+MMQPD+6BZEBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vtiSDSw8; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762796943; x=1763401743; i=markus.elfring@web.de;
	bh=gGhfDbzx8a/xO5uXKhHOWSkDr/Tx4JyNgqzqiKqpIUY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vtiSDSw8wWU8g9fSylaO27/HE9kwua1CH7WhDnUB5OxrGbIqS0bs8Hh+70xGxY4x
	 m2LcHOCDFDLr43jSH2rO1O7ihwyFPWU+NW3oGx4z7OH8/3Afo4UBJPClUSqhLeur9
	 u8NVSuAS4pPPl52eRqvGFfwyZ+MxnNZT2zSVKagVs3NHw0puThXfudvIjePRV5KFO
	 6pYYY5xJymqdYgwAcauAPR3IRLr/LN3hTkEBWOAwSuQf99YbsBBPFuUG1XjfT/r2+
	 xoA9JEX4ZgLttvlXf3Df4yfju5Q9PsWQaP3mYr3/cG3bLqMKqxaeLt2Pl4PcLWNb7
	 d8me4wBLUlsrNC0Jkg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.196]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MwA1A-1wAc6F1M1s-00z5GL; Mon, 10
 Nov 2025 18:49:03 +0100
Message-ID: <cc4923d4-a24c-47ff-876d-0fddc0b8ad1e@web.de>
Date: Mon, 10 Nov 2025 18:49:01 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>, linux-input@vger.kernel.org,
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20251110171552.95466-1-nihaal@cse.iitm.ac.in>
Subject: Re: [PATCH] HID: playstation: Fix memory leak in
 dualshock4_get_calibration_data()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251110171552.95466-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:qPpPVfXHcYl4t/AhyAjfky+lZgoX9HyOSL7jQeBLtON4tqviR5Q
 ZzaFAD/lJ+cN81elx37eU+Q6plnmQLLCWEMsZpuw9MGk/8vqeJBBhSHd0a+/OR0Zn7Tr5k1
 IGhvD2xte/Ay2L783T9xMv0MpEzW7Ta5vKOPFAPNGssja7Pl5MKM5wdZfeWbj/cK2RTa8yu
 51QHdvdUuh8C0/56YPzPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Hl//SyKyFiw=;1DJ8lmwHOWxWe6BhgQPY5XTdvT8
 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
 hDkAw==

> The memory allocated for buf is not freed in the error paths when
> ps_get_report() fails. Free buf before jumping to transfer_failed label

Would an additional label become helpful for this function implementation?

Regards,
Markus

