Return-Path: <linux-input+bounces-5857-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7EB95E505
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 22:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FCE81F224A4
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 20:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C8554656;
	Sun, 25 Aug 2024 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="rUiH48VK"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011F04A07;
	Sun, 25 Aug 2024 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724616167; cv=none; b=Ac9lhCcqOXtCm5gdbIje+RAEN/7l1cAqSyJcWITcGWDpHAv+BBS3+Uyp6RS4COuJN+Lpv/k8AkxlWdgV+0I+6fPwBw80bfBhUuuR12QVRubfJwmaIgUAkYwFgwE/vSaUnLx/c9J8boutefvYJN/Gru/SfIsMMu8DqUNTxBlMb4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724616167; c=relaxed/simple;
	bh=BzW/pliipiRZqxXsOQ4fmdf3u163u1RiwCQMjsmJktw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=HNhMoDyA/LD0tyaKKWRUknuh9DavoO2r2HzZSaslCN9SHtV3t86nnBjf77f7opmcvb/WEPPRy3tImGn5u/Dc/Os8tYeVJGQH2tH9pTVXk5ENxG0BlrBAwHt9ryQo7DaWtDzvg/4k3h9SSS75HQbvwFZnU1Ki+RyBXMfauIZ5Ly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=rUiH48VK; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724616150; x=1725220950; i=markus.elfring@web.de;
	bh=BzW/pliipiRZqxXsOQ4fmdf3u163u1RiwCQMjsmJktw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rUiH48VKmiQcx/j2usTo0HBjODkxMVE16ynTBEGd8sJiHfOEm/D5tcdYCj2vfoSm
	 xjLQ/33t0sqM/cY99dpjauYWEr1/eOCYpeKV5WDgQC4KaOvpOU8s+Wj9kMWwG3ZiN
	 xJvTkBS2ze6f+6AXQNn4JUd+PTldPstDO0K3J4G9H8ypK90kMgIIf+gPCdktCOW6E
	 1WWjkGjPkoOIHul0+yt6ZTqRlT5K98feFwczVuVev8Ay0y/07GQYf3X6WyWHMujR8
	 CpaCDAAYfpJEPiMOTi2oU2TqNUf8P7WlyyfFeChIGAxJq2bjBc6bFl/WY8bI6YgCS
	 3kF8WmTDFeidOrAjqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWz8v-1sbY4N2bSj-00XhfB; Sun, 25
 Aug 2024 22:02:30 +0200
Message-ID: <7f1e75a2-0d34-40af-aed2-a53b5e10f459@web.de>
Date: Sun, 25 Aug 2024 22:02:28 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Erick Archer <erick.archer@outlook.com>, Henrik Rydberg
 <rydberg@bitmath.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>
References: <ZsrBVO2w9WwX73iU@google.com>
Subject: Re: [PATCH] Input: bcm5974 - use guard notation when acquiring mutex
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZsrBVO2w9WwX73iU@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uw7ZkAplTpMlFd6S/FVffX0P4YCktJIeycQqZBujMOnkyz8bS1m
 f41U5L6XnI17lMBgBOchl10X59V9OS5G7pSUGa/zFbX12dwxNg01SImdwVV9Ha3abG6kMxj
 7yo6wSLFJXibTRURMb7B8/vM36KVdky4Xw07uOeqEBaGmwi0MS4PS0eDg7wOtM+XiKFxBnj
 DeQrarDDAc1EYOA80GZ8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zAb+4G63tgI=;ctkXVC0qdWn1jELxyFsMJ6DdDBF
 J5Yc0HHA4DHIqOQwVNxD/KdYlLAN7M26+aSXGptS3R6C5XhtBZH9dQRfkB0HBMES8ItvtN6t9
 10YNRBDTQQfLvtKYGNEgTfoGUf9Kk9U3b5vwdd1aj1rK09YsJ6gtjzNkeRr6vEWEP6/HD79h+
 wsmpxPyxKUufh3xWBPHlhktMLBxKuBuWZryuTMBya2K+f797tz6SBBlVl04Wbxk9mIoLgermN
 UQzAiD3Te4WhNPNerhMkCa9vn1v7frpcUNC3U4lCh0mzxHyYe41p1mxDTQSQQ8a9yH7y5yXIl
 z2aDxqUEPjWQF5tDVigqnd8CjsGKn+Dx9E0FH8xEKGuA+YDCuwJY5NVEx1vvuR9kAJlxyTzWB
 +AHvbNc3R2cJIsKfVgxNT7cIWTS4R+tHJl8NgHu6O+R2w2ZWBicBHSw3Tyj4hPdUe8enYV/1v
 TRm7lW5wqnxh623oPeqraoWyCoe4AN4lQ9r+xKDDKTk7uMVxZ1MFoAMpRpRen6qnFA6r1DVjK
 3XMPjBsM6CYuQ1zjCxxmL4pOyiuR3J5U5JHEjHI31WG5vWkmuIC01C+sS0XlP9c8Jk+gLK4IY
 3m6OPkjvIfYr/nRLO9BqBBOv3Q1o+8F/RgY+bJCXPST7hTtuzSAF+iXWOx2lI+eqUaZc5bpxn
 DanEvFCmng3GZsNbOI8UfZX1eIpaf/eb2EKq+CBQkj9LY9h/cDg0A0oufvNLZPkiIvzMlJHo1
 g9QyOPKoZ97itHoPdLUTmYkojEGS/LN4+fSoU/D6pKB6KYfmmNiwoka/l6mOvhvByCg4xw86a
 M3iLmsqIuw9FbbLJ9eOniHHw==

> This makes the code =E2=80=A6

Is there a need to improve such a change description with imperative wordi=
ngs?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc5#n94

Regards,
Markus

