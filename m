Return-Path: <linux-input+bounces-14787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE0B7DE4F
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E4617E79D
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 07:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2842C1595;
	Wed, 17 Sep 2025 07:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="obl+BOOS"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA09269CE6;
	Wed, 17 Sep 2025 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095242; cv=none; b=uzP5z0410joCQUWt86a+1PhM5RYQVPINILLKOZSYyKTg95UMxhPQZ68Hj/V3Q82hNv5Ab76gNY9gVS05jSOzdtVDSZ5usiubNqWie74qVHsq3x3Slfq4ezbdWWw5dHIQ+Dws85GxAggePgMp7vkIPi+YCMiZyEapOnjOIrgjVOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095242; c=relaxed/simple;
	bh=tA3/N5n7kPO/YvjhsHnhnrhBPhBTlaNJEAI1qbqIjz0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=XTzmdPGBoKpBIwsCKMsJ+8C0SbIOQ77pdVq+fkm3OyOhkxTFpqVg8i4M2m9TxxewlDWVnP/ca5kRDKPa4tEgYppNRnO6M2IdKLIJ6x0RFwAmhRYWRuEnNYEdiyeYQ/1eAFHn1O7rrQeXMko4/HpqUf4b1vMRfk5Bf4vz+2dQ/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=obl+BOOS; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758095214; x=1758700014; i=markus.elfring@web.de;
	bh=zYrbfLWgxBHXol2zIzuG6DRRKXdBkLfoo2umGOQwmKY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=obl+BOOSqQtPIdP1wHmIcIjx/LyLt2jlxPnzlmWv7Cvccd8ZYYa+sHvGxlzfuZYF
	 xgQLxDP0SVoGM7xqeRHS4L2syHM5AJdNdL68FAWKoEK6bTfatMmWlAKBcUvBLyQJG
	 6WJQPPZDuHY3JdHxgJqNnscw2C8Rpxa99vhYMFait1QD0/Khd6Y7FdAYPaFb5vI5j
	 dlFvjGZlIvdUdKjrkYLKkMaqSq+RGFubnuDZC6/knf3Bbh3PKWI1dAv1fTMSx8aC+
	 5qxS/p9DSIH+lvNNqf3/usvHfbZyqsV/36hKosZAjsl7MjuXWLYHUh7tE4sQEUIDl
	 p/xcJDT2xyltfmz4OA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.215]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MI3p7-1vCmpl3Gjf-00Fu0w; Wed, 17
 Sep 2025 09:46:54 +0200
Message-ID: <34b16512-b098-470a-afff-bc8321e2499a@web.de>
Date: Wed, 17 Sep 2025 09:46:40 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Masami Ichikawa <masami256@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Minjong Kim <minbell.kim@samsung.com>
References: <20250917045026.601848-1-masami256@gmail.com>
Subject: Re: [PATCH] HID: hid-ntrig: Fix potential memory leak in
 ntrig_report_version()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250917045026.601848-1-masami256@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z9vnERB1HAWLtDNLoxP913bBY1WWL34QDYWNh8W6Mq6Tu4Gkz/b
 TVveUfU2nNxOw3skiL3wN7D3MLOcGhAsDaYwMT2uWGScXu4oMnxOpPzcOfc/VdyrAohoOId
 sMme0JfqwIkEHow39G571RbXmwzk+zVTyZgejqVHinhFeeTdBKpddsq3D4Tks/83Pxdp9zv
 +vxOVW0NtOARMgbSVr5rw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nSsTIVO1wJg=;WYDMXe1M6dUG6CkIXmiGETZKYfH
 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

=E2=80=A6
> It is safe to move the kmalloc() call after the hid_is_usb() check to av=
oid
> unnecessary allocation and potential memory leak.

* See also:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.17-rc6#n94

* How do you think about to increase the application of scope-based resour=
ce management?
  https://elixir.bootlin.com/linux/v6.17-rc6/source/include/linux/slab.h#L=
476

* Can a summary phrase like =E2=80=9CPrevent memory leak in ntrig_report_v=
ersion()=E2=80=9D
  be nicer?


Regards,
Markus

