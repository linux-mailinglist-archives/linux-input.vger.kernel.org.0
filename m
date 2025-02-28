Return-Path: <linux-input+bounces-10431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD2A49213
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 08:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B116A3AAC26
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 07:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E011C5D42;
	Fri, 28 Feb 2025 07:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="hGIdlekG"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30675276D12;
	Fri, 28 Feb 2025 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727341; cv=none; b=dUshtsqmhYz1TaVRpUe6+u+0WSeYsX+WMIKpW3zflRHGGGdUhcJ78+dObYllrCuMnNNOqTfWimjh6V4iJZFeBdM/uNhSZEEy0bkRF5YOWxR8B+SUA1bvC3xp2ZetAl7escDKvgL9sfh8n/kfZDluwHb/vF392ZyXcNM9VZsufI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727341; c=relaxed/simple;
	bh=O1UELFem+xAKU6acI/EuW6IpzMVq/eUkwgIorgnqyKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z4aFJYF8aEqXr5qHB4xUpqPxVy0o3NK7rYHDrpeoF3ec7GsQit3Hf9fPb+NlCnLpYHSwxHj+0goHWm1d8+smWTxgkSe1J8Fj8f8dhVWT+SzP92i/y6KeFFjVbarZreczUC47qS3ai5cuJvdKZzKrIMylSeSHjGJ3GSaLt8IPA5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=hGIdlekG; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1740727335; x=1741332135; i=deller@gmx.de;
	bh=O1UELFem+xAKU6acI/EuW6IpzMVq/eUkwgIorgnqyKs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hGIdlekG7kiSS5Znl1SU4rzIVJgy/1+jcO3+WOF/LrUkZxj99R0w/E+wXRVr7V9M
	 GJFPkCzynmKlWYOz115YdTTyn2PQXgOGwQZp8Dw8uLdBzCth+9wNSyBrEfTk8x4id
	 nv9Li5V3dxO0OIfRH/OXIW4Gh8Fro9XrP/3aOuOc3ZCfKWEPdbiOzHwHg9Z/clN5h
	 jZRVjdO/n3lKbtSRAgpu75M105GHmQoK1sJA27b7c/uecUEDjP+HAdiiaFD1s8Jwc
	 4iDo5+oaHhMgMz3/Ct3c6qkrAFjZ9pryqY13HcermQS/ieoT62N//7L944NJs6Z7c
	 n7tkambKEjPHp+NI+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1tHLAa0TCl-00nI0J; Fri, 28
 Feb 2025 08:22:15 +0100
Message-ID: <b493660d-c1ad-407f-8457-bb3c45d3c69e@gmx.de>
Date: Fri, 28 Feb 2025 08:22:14 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: gscps2 - Describe missing function parameters
To: Helge Deller <deller@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-parisc@vger.kernel.org
References: <Z6OoEnJFW118IuP0@p100>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <Z6OoEnJFW118IuP0@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9kZMlvrRK6NVqBx9PRaw5pgntW/7HVjha/HSLjgwDndDUOxBckD
 KZkDSn5YzGke6HNg5sj7kBBrYhPACWiyAiumE2EWP6y6qBExTfUJHk/rSycjcO8Xh7hSs1W
 il7opJWHJuHae9262U/iETXzrrWSVmL7La/O8WjVg9lPFIJXECC4VQpeMmM8xSZxGeqoVp3
 OYbR9p1Eoq4ToTHw+fCig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rPfm7a1Eh+E=;8ddvAPnvLh9zwN7VRBiBENkNG6k
 vmsc2SYRt5AbKDWq470VuTwe+MOYiLRbAiOkBx+3YZoxTx2s3Hy26cscW5qpHXMFy1hk9xvh7
 cP6YB70hpCWFR0S30HApDqhjFiP5WUHE32qxSAsHHBvvsyic2CXWjYfvW3jyd2VGncKXr4qtU
 BaWnKafeEc6wL6tc5ZyjbiEqcG4jKxAM3TWOPFJIPow+AdaUdLRkb6HqZIk7zhb6fetqB+CNY
 v5LpvScC1BDxZzQCSUU0q6VgooD3+JGbHTRwBKqZJedXhGhbOYKEagcpnr9KE5zZOu0coOj2F
 Pc/+YQbloElf8+YKgV4pgfUv8LRkbLAOZL9ZXLPQ32LlBk15zXp1BgF320rvcvZPDtVeXgi8T
 StTcABTTkV1TWrlHftleN3Xr1Chfm/8GOPg70LnzAxkQNpjOR3rPS7R7aFQL5ZcfYE9rRUcsG
 9ebNFsfNbfiUmW3byFOqJRcL6jaHPS9ei9rlKmaBTLUHI8MikPojH5JOz+HTFBFg0CXeZNCFM
 8wMJT53/Km4PbPvQluFCCBmbtDzZcpJ7Uzw3fmLcHBvp+E1TCfYlHkbdIe5fDf18c8GVC6vUL
 EYZ38v44TgHzcDgcu5jE9pzar8Z94fC/9H/kILbdl85XBOCL7+s9Y+PqXUjz9RTCpBNMJ5sRz
 1DFsXxUYQsh0QGT6OSiFxJJj+8YalpbOCrXJUZuv83Awrd2a1YoR1MvhcA1c45Beey+VhGomx
 i8ODI6VjaYD9NcmDMR4jKWEsjqw51G2GyGTgf5NnyEJg4GR6OfL7Lgn8C210fRz58PxUoUzUa
 T4dbr36dXwMPqta+E1kf7v6zOk/Gu0GDkw1l64mXJhNYr2uuA4UO72c2r3JtvG9kr/mdSewsg
 16QJkutmIxJTnpmJrj/o8ii3bwELFhh4j3dFQlRNsu25XwyUnSLeWZEuj4CvPVel/fyTm3MKw
 uAKre7DKNEDWj4FKRRfntW3tOQ9DTHxGF2Th53JKE+5Jt1YcFKggwEV4NtjfdH6jO9QhVMNLb
 BHx9AdN9yp8UGQRkrUR6hzfchVuv9w3V73jguRLGwDwKXEf5UDPQMbAVhy/AmF4RPTKkcftwu
 6LkFCiyJsosMpK2vI5YOyJjBb0whVTYyCK0k+dMFYqfY0WuvrrgK4iqO4Ufck/Eila7ikewsM
 MVYY+TeOOiGOAAuU1ezpivu+LqS79Lj74ksMuqY4gJ5pYz2nRGpeVlABTBskvCh+J2lFBg5wD
 50uMA+rEsPnr+PHm+Qdr18zXUS4k8sXgsA4/KC0oD3Ajo46+uAvRShf8Wb9E1IRIdzQPM7Pqv
 PGLQ5uE2xYLcmx7e28GUySGD7AT9alk+FKmq9xUxR2AKHsXReS178sL899EmdZ7KfVxDtwkT2
 fZyXSRvnasT0+Qk96UOJERuUSLag+oLXRWT1Wz2qkkI8MBWBJMJDzgAQ+4

On 2/5/25 19:04, Helge Deller wrote:
> Avoid compiler warnings when building with W=3D1 by adding documentation=
 for
> the missing function parameters.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

applied to parisc git tree.

Helge

