Return-Path: <linux-input+bounces-11360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56364A75620
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 13:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4736E1890019
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 12:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E7F1420DD;
	Sat, 29 Mar 2025 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="eOwdZrhi"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE8446BF;
	Sat, 29 Mar 2025 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743249853; cv=none; b=cEI3bvex3bJLXFrepWSmFTZRNMMnrOJZ4E+jUw9a9CgwHoMPZLhhMitmtDF6nRvQNuqPUO+RmKyGLpBwvdtJySNjPXGJOp9wzKaAuRAOsvnOtE5Ev3JZxtfcX+myx5x6nybGxbBLBW6SLwsZpixllEQAuD+8gz4yg3QvPubOB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743249853; c=relaxed/simple;
	bh=foVOhtggnqD4ONcVCGGDPWx4qT+/OJsSM6LaDhuP6lw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=gkpG1rqVlR7XEHW96eH/QRxJbiAdgyOL6aoHqxMLBJn/8/VdsSzzHz92reQSPUDhxt++fmWbpN1CK5bWPQVPrJi5A4CnCJty9DY9N/2/zF2+cxDVNgaOclgDXEv9sf6QoNf3BMdXqykziiLz97IaA4o4qz4ptw1rE9ER6xeaqFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=eOwdZrhi; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743249846; x=1743854646; i=markus.elfring@web.de;
	bh=HZkx3dMp2nbAoF8G25sq9b0XDun5vv+bWlF5hk0ziOc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eOwdZrhi+R5jFfPJmeVDNbSkIyGhoBxM/8Tokz8HFeKRIGx9KAlVgMkjTi/2EHyM
	 +S4y9x8oaxjynMRNd3BuTRfGya93bS7WypxQsBFJ4/SIRdo5qDhRigK1IaLsoCw5H
	 1T9Dj/jn5+knOim942TZAZILw9lG3fVloqXnyznAeAms/xqkelBJO2KmFeChgdvyM
	 a79xnoU3wbY72Zjff97qQ7M3pGz1jkXD2QevFD/zA8Z8LpEDiSVW2Cg9xZIFAWWkU
	 RBPReYTjwExnqi7s36XoLYsE0x0kQLOQRB2+wf8QP0PRLxVFf85bDXXwRVwWV+bXm
	 xNtzUSxdycIncnjfkQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mcpuy-1tOc8S1Gok-00aDc5; Sat, 29
 Mar 2025 13:04:06 +0100
Message-ID: <94993789-8637-4b93-b30a-194e9078adcf@web.de>
Date: Sat, 29 Mar 2025 13:04:05 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Jason Gerecke <jason.gerecke@wacom.com>, Jiri Kosina <jikos@kernel.org>,
 Ping Cheng <ping.cheng@wacom.com>
References: <20250329002042.36967-1-qasdev00@gmail.com>
Subject: Re: [PATCH] HID: wacom: fix memory leak on size mismatch in
 wacom_wac_queue_flush()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250329002042.36967-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bKfd2dmb4ofIP2kSV0Ni+ZM5NDCMwC0XAVrOGLzAqfUuwbWxpcH
 HQ5JaJPjj5lRa2LfzGKZmqw4AWWyIEaQ+CucMFEA0numkJG6luy+kBmOzCUoiL9Qy0aFMXn
 8WQ0FFO85be3PEyMP7YV7n1AT2IBFQ0O0dOunOIsJ0zM7QrDdgPX0vNAjI9HGAx98lOAC6s
 h9+FEtumYMKEt0b5nZuBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mSz1uQrdi9o=;5qy7hO3CxgdT5/xO1OyRqePq4Cg
 Iu1ZJgjAjNalm3jLAa3qlZYkoJ0+HXIN4S1o3r/Ry+63WVIS08YefPYjZVGscyHQc8NkAIJzU
 RnrjWcr3Tg/8ednRGsGWnvWS213K3kzz4dcG1XwH2TDyc1nBNSYvN0/yl5NC6dsD36C4UZtFy
 CWIJQhLvMAmvprvs9NoXOj1cLJH9l5H0Zr8qxWAIxE5hzVUq1acAHjElHl2uDXBMxSBRJfvjJ
 jNfA2ebSewi1B1WuQTtznVYNZLy8PCMUse3P1o78m7/vjVCaySaNyreNeoLYL0ILKIgqmk8bC
 s8yGv8i5pABD8jxUH6iyFOWrQZIvt0mcIyme9MoBcyG/5fE/45s2a+RR6XzWNau9Vc3KgkpLf
 KIjnsZVoD5jRxYEWIkYGtqJERU4WxPPSnljo+YN22Eu4tqvHoC7LMUJ1A/1rOlMq+T9xg45i+
 5dE4Gl4AfftXN9ymgNWQHF5tDWii+sG9pGg+TAcKtuvwXMHP+jMbVpwjGUcfxgOfuoxroOFYh
 nNt58mJq6hbKhP63AsVS3PUUvwR/zhFRJZyGY3ZV9e/NrLBHD2TS083T4yvTP94nuRxfBnGKP
 8aVG7clWeVxI2mWk9lU+BBRpxdHBhrKUrrfjQvXEEzpxsbJD6dGmMwBX/3uHnqso07t7TXZNv
 r/5kKIi5rWGd07Dh+K0nXC31ChNgfA2jkR+prJTAcD3n4sP23C5DxbIhwHQiWiHZXsRRnL45f
 G7VIrUV+VBx/8F6zmV6qQf1GCfegiSQ9asfA1A1SJkH/F44SgRHh31jwJRW7FDIMM29UenZaK
 uErzBdHSv4KZB1iuE/b7vc7Ew9DtP7phPnck4SBQBJrU6UczLWSMX3IiUGymIPw6igYBfy4wt
 dV0hmaLPT4+Ii0tI9ZbHr3BSsONyC3HVwQrEIufdtV0AmtN9ybfzFD55Y1fjDXcaxEILTNnWY
 gnwkTetXJL+6nNpilUZCsjMuI78ERmrZY89CMb+fTeyiXybr8sso9/FHfEIqwqs2pA0RxeirC
 jTdP4SPJ20xyLN8+eXCabQow9x7URoLoJIY8egzmKEfvYzeo25K6a/cU6k94pAz5okbjrNV1N
 3c+yNAlx9rDstzjLM/5tk6gBVvxSdnX/P00QMIONeb1Hvwemp7XyuD3ZfJ3cCt3xn3cXhoQM0
 fjtcNSDBAFA9smKSELsUuIqT6GYD43K13qlrtJZ9eZFdcERPzu3vVxpQokalxvS8/DGxXQE7J
 xNaYh6xsTfFIzBwO5gvyqZJqYacZOGPQJnRBQbC8hF25DmaGIXejQLbc4ee2NR7fndCD5uhiO
 0pli+Vtw5hT+cckADX/5Z+1Wv7kKTVIlQIUdl13q2GQhdVYc286nI2oQa1VjZmvAD1mgaEjuA
 mlfeNKgr4JLeIDzdbExiwp+mNJYTPGAIgzB4h2/KVU9/s1hDHOL+nRJmCwp8t3KcTKtnO/gEx
 TDjCx42PN3FST191PTcnsMbsOd9urnEIV0fUkuO3C3r+jL8x8

=E2=80=A6
> number of elements it has copied. The code checks if the number
> of copied elements does not equal the size of the fifo record,
=E2=80=A6
                     is?

Under which circumstances would you dare to use text lines
which would be longer than 63 characters?


Can a patch series be more appropriate for the affected software module?

Regards,
Markus

