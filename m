Return-Path: <linux-input+bounces-14987-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 489CCB9299F
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 20:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C46F1904CBA
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 18:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070972E1C5C;
	Mon, 22 Sep 2025 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b="emwnlFtY"
X-Original-To: linux-input@vger.kernel.org
Received: from sv9.manufrog.com (sv9.manufrog.com [46.246.119.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A24548EE;
	Mon, 22 Sep 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.246.119.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758565997; cv=none; b=sktD6Blj+7g4h5T1xpPYUv5vslRt/NeFcBO+/31l6sVSBbubzOS4DOxdQCR9fsPBtuqCDR7uUPUBpfOEiEaSigjUCeIu+5JGqF8rMvNkzd4k+xvBmASYccN4eCKesUmn2qxPv3dxCtzbejqy2SrPpyll6SiqdboDOoTx5OBSmU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758565997; c=relaxed/simple;
	bh=XdGBiNg8TBwn4eBBkY16k9IX+wOVuGrJsvgd296IEp8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=dXm1YsLUgHopWzt7nSpAgHU3xZXSwk2em2TD0u1nwuSnqIKUAK3Hl9kFCKsIhvvVSKbMpipmz7CcpMHpKYCegWzC2zTSwPkPhYbonheuWgWq0r2aOd2hXjKDR6UUobgOpM6PuORVf7JOKlDWBBbU2cZ24626SdeOiA+HZEE827Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se; spf=pass smtp.mailfrom=oscillator.se; dkim=pass (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b=emwnlFtY; arc=none smtp.client-ip=46.246.119.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscillator.se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oscillator.se; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mnzsiREZ105BZTytHd/QqUUYjLw2IRFwIKQqvFV4GsA=; b=emwnlFtYuRakkFf38X7qRmohb4
	ODirxNiPJiYboox4HRMekGJqUZaDEHeZOoBQLemRvcwGQMfkfBj11I2vL+w1MFJU+/ooVWtkggFqp
	MjTM6qQYonEU52HlaYKJ2FyDzHvNa+kZuyCrxtLqZbm9dj2kvUGv5LMsFASqV/w4Ot/f+VWSIgsvX
	gixowmT8Iwm0IIzeRSEC0faIWItvRb8ABZ9cL5u44RUie7RI5Ik77zguScr6NY0H81O+j/5V2OEVt
	RTrA1U27JWVyBkwQQqmdTrBYSprDojMQPRJ9Q3caD3r9kduB9iefn45WF7gLST2TShgp3y4+aJYX6
	+8kHE8qw==;
Received: from [::1] (port=50132 helo=sv9.manufrog.com)
	by sv9.manufrog.com with esmtpa (Exim 4.98.2)
	(envelope-from <staffan.melin@oscillator.se>)
	id 1v0lLU-0000000ABge-0Yjq;
	Mon, 22 Sep 2025 20:33:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 20:33:00 +0200
From: Staffan Melin <staffan.melin@oscillator.se>
To: zhangheng <zhangheng@kylinos.cn>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, Salvatore Bonaccorso
 <carnil@debian.org>, Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, 1114557@bugs.debian.org
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
In-Reply-To: <01ce8d55-6054-4efa-bed5-ce4c6c6bc0e6@kylinos.cn>
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan> <aMUxg6FLqDetwiGu@eldamar.lan>
 <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>
 <94520aac-2a68-40d2-b188-80f9e361d6de@kylinos.cn>
 <735c20da-c052-4528-ad91-185a835ca40c@cosmicgizmosystems.com>
 <54b4b55c-ef29-40ae-a576-0c0b35ea9625@kylinos.cn>
 <3c299b65351c489fea95ec8b93518b6b@oscillator.se>
 <01ce8d55-6054-4efa-bed5-ce4c6c6bc0e6@kylinos.cn>
User-Agent: Roundcube Webmail/1.6.11
Message-ID: <11f1363dcdec98f4275e4df3145e4f24@oscillator.se>
X-Sender: staffan.melin@oscillator.se
Organization: Oscillator
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - sv9.manufrog.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oscillator.se
X-Get-Message-Sender-Via: sv9.manufrog.com: authenticated_id: staffan.melin@oscillator.se
X-Authenticated-Sender: sv9.manufrog.com: staffan.melin@oscillator.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Thank you,

I can confirm that this patch fixes the touchscreen issue on my GPD DUO.

Tested-by: staffan.melin@oscillator.se

Thank you for your work!

Staffan

On 2025-09-22 11:21, zhangheng wrote:
> Please help test this patch, I will push it to the kernel community. 
> Currently, the microphone device is functioning normally

