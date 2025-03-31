Return-Path: <linux-input+bounces-11438-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B6A76C64
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 19:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63D51188CC9A
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F16215184;
	Mon, 31 Mar 2025 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MRPAxrqI"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C7155A4E;
	Mon, 31 Mar 2025 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440809; cv=none; b=CKUtctTyzevd6N3AKKe85WKnwVvmw3nbrlp57DCrLhLxPvgrpoZBdYnStrb15SNlQ4QOyYv2wNDeKZR+VxYy8St5zPCmzMP/6xG96hvQlYwwMpr0Yw7UESQaJp6y13mtWIJHZ8HhjHSNBWjAu8ToBMbJHhlU0aaJZTXV/rAtaJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440809; c=relaxed/simple;
	bh=wLh2PCKk48jUc7EBaf6K1kJZ/4C6o96prpD2NdUESZY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Iy3WKH49Col//gF0bRrHe4dgE7oJbVH4HqRwm6e+RhhBiWS70no1CQJe5/qIyDs8rALAms21h6z+YJeZUo8ZYjadSuYkOUEHJkqkE8aD43YtE8PluQWmJM/lfqrCFxhVgHS+Xi2v8ITBPElzUQnZmymCOqy9PRjGyUc84hLiUIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MRPAxrqI; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743440797; x=1744045597; i=markus.elfring@web.de;
	bh=wLh2PCKk48jUc7EBaf6K1kJZ/4C6o96prpD2NdUESZY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MRPAxrqIm4JJ4pf7Sfv84ijOffHu/tQgu48DJyrJZxLAylsbWubwvvfw0hIvft77
	 iFkooJtpAwBiz6hiPZYj7cgdZmd6SHoTkryKgW+i7Tu/gqNVO5evab77rITYM60Tm
	 a9li8zphFSTlmyVTuzwRBjJK8aQauqXEt3yXEax4OP2EmmZzpaIpY0B1RBfVeSMUR
	 w+zGs8+XHLFZ04VQJ3o1+pRIg7S6rQETw7HHTML7rpfB0WWCZUWKanWf+Cu7EzU6W
	 wpLFjBVwvAg4jpB0lImGZeA4zFbUbJQyh/xK5SJbHiejrWcYg6YDDTmM9W2t4fCvw
	 af82sCY4937LlZxycQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MREzO-1tn9WT2WzU-00UDcJ; Mon, 31
 Mar 2025 19:06:37 +0200
Message-ID: <e87f2369-204f-431f-b434-bff4b8e78742@web.de>
Date: Mon, 31 Mar 2025 19:06:36 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20250331113732.10722-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] HID: uclogic: Add NULL check in uclogic_input_configured
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331113732.10722-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:44aS7CidGP84GY/uY/53O2eNAf1G0g+8zz83JFCGyMgIa+T04SA
 A8SgVliLP0T+onAx0wNSYWmsVQe/yGiByiRv9LV8RL7g3f38KYyU7snIe/VGC/2talKMzdd
 tHrslX22PAJ3UpROA9ouXTjD+cF7vkyt4SeND9ne6hd2lVSr8e2OZLN+aT4013tj8pP6N19
 1RMXETHbjAXZhHWATGfOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7npyd/PNj1I=;VoNh9lFBcG1qqsbSEmFiqe+M9c1
 6zKgjlhjKwg+qkuooSD2QHY38SHQ+bhkTwQlpJqqqeBTrMxqgRmor4PjgRtU0UTr6euXQgcAh
 staDA6cTB0RP1d4rR3hNC92WRDnkcgXtkflYJDVVxnc7Z4y8TJRTKyvkA+6eEj85pDszFExY8
 UcarCy3PG3B/AlJRrWZHR8/TzmtnFoT+b+lLH4RjKC5BoXmGTwxP/YbbBRMgYyzEWvQrRmEjx
 aLyRBI+GhELYooi5co2e8EG01eP9+L/SlopdUE5/KG+s4RxGOvfPU2MPPHugJ5GwP7qCRG6Cz
 QMY8kgYphK2L/4Eq2/86wzt/vEW8Pr+Q2eD4xEaA64KF3tqaZbGljRHSJoQjS6D8LOyolivsQ
 PmQxrHL/gCi6cGOpFU5esi5MD/YWkbjijy/h5b2Rpe+4PDSMIDuUmYSPR3jdWZ7NGczip1DMM
 cxhBGWIdE/rQmIH59OZa0ZedOEwCdpIAtaAqDKvPuG525nT1pdvn9Iuw/2srMWvmox+/TCoyL
 s7BtG6DvjZBo+174PDwLMDZt8PH4dD2Tz7Rixy7XsKNtRW4OC3mzyx91s1B7WaFtb5Erxr5hm
 HStaj5ajmDLgaBJaegsjEcnNx4vzqYMkr0GzCZmWW+T7mApixJBT0kOKrZjlyeshGnzO/b405
 w1oHbyGPZ9iTfCMcY7uWb7cYpB25Hc5Yb0LX2Sg4dBtEtBZEu1CwRX9resMemaRqIjsUPa7od
 +nDssUx0oEBEMV4i/AFQescjKJuO/bfXIu+y896LP7+ogwrwOb59xRc82wvdfGbCDDELIRqoV
 MKElIcZv/7TCk761cWcg+SmIirXY8LA//1VrSVVVbjTUT73iALk6u7btbHzqbZetwto+RTACE
 RdCLK1o/HBmjrWTD7jx744CcLApchSjESElyPpo05318n3DUX6jvChevGqUadydl2KOJJNy3Z
 yruxn7oY9wJGxTs71dxbK6X+GWVD6vEDRKaYaDZlacmdH7vwA6Vp77ZRU4Y9okP/PKcgHyNz/
 3FnMWn1F45kHa2G3m6s6iWLrriEAyjzPDk53nswDbsOf48ERJ638UBo/lw0gWwdHTS06tux28
 +hyQ59Ei3XvWyCM9teaukZPsyRjhYeFxNnnVxx+XJKkNhskg4wb8ZjeH/hz5XgZnY/diQmumU
 iv2ubOaTelmwyQPVMlEOm5tt8F78wQNtVZDC0R5gMkUlN0nCAx9gw06tuktmQc1KTfwkIsADP
 yhHTMvdpWbBJAtY+rmZaCwkk4UKxDRAYSZ9WterTEaSEOJz6u/sCkqy10b6DKslYyNN2XJzXX
 LV72ddchhyy2M013yu08hk9aTtIdUsr/9E7rRzktSrb2VSeOUM/raMomY34i/KYfQOApRE+Zq
 ON2mVm2n1SfgHv2rlYdo4pfNWZ2jEr+F6af8/ibucm1LCD5jko6WzvFGmNx2+bCHD3gg1I8Ir
 aGHBv6ObmWQeZ4v1LN0G7iRaXnj/Yj/s0jyKoUw1+Z0G9Ate24kD8S2hKaz974y1ZmAfQfA==

=E2=80=A6
> Add NULL check in uclogic_input_configured, to handle kernel NULL
> pointer dereference error.

Do you complete the error/exception handling also with the statement =E2=
=80=9Creturn -ENOMEM;=E2=80=9D?


By the way:
I suggest to simplify the handling of the condition =E2=80=9Csuffix=E2=80=
=9D
with if/else branches a bit.

Regards,
Markus

