Return-Path: <linux-input+bounces-8819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F79B9FDFC8
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2024 16:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F1A161CEA
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2024 15:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268E3208D0;
	Sun, 29 Dec 2024 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="RFnJ+sX2";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="oWrhDDjA"
X-Original-To: linux-input@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADDB42AAF
	for <linux-input@vger.kernel.org>; Sun, 29 Dec 2024 15:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735487418; cv=pass; b=Y93YEnHx8upb3Ey6ZiQCE6oeLh6n1IMtVdS10Skbw/58X/xwUc0rOzuLsQjN7jv6vPqUTD1FZsFL6uYjlNtGAlwSEP4k8KXNwu6N4GzkdQqANWhkSwrIkYHFCYJ9GNlTXKOYaFnO1i9iS8IRQ/OfWznB6Ld/iaN94tpFlM8u+VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735487418; c=relaxed/simple;
	bh=asBfWB7/ChbUT8ch6lWfvDChb61/geG7THl7qh2AXtU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=UXsAIVVvWI/Mz6wRZWA9uoeAxcBEWGsUCN1irxKoyEnDGLaLoX4JUZ39QhVqeo6RQxMV2qR8RgSj0No27CCspXg4wYrnJBkWEDEku1GQBDddKZU7KdbwiKjI/kDcQdkhVMvKqql76DhNVl4PqhgKu5RDtmt4VZm+WKSTL5c6N7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=RFnJ+sX2; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=oWrhDDjA; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
ARC-Seal: i=1; a=rsa-sha256; t=1735487390; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=miL974D0Y7AFnzlcyIVbORJYeN39VEqz4qyAQs6eJLaDR2Q3NLXY+qmPKjjVEEyNZ0
    BR/l6koWbpwVUfE5vUa1KFbrbCavlKJlp0EeAbD+TVYOBn935Uxzjk/gK8bd3RNcdyuo
    OFBngZb0qsrA0DMQEfmQcPfhSrHDTpDhb+ghbuKNTGVLG6Sdt+H87xv0PBiNplSYBuo2
    EEytlIk7ucfxZW0BXAge3NF84iwliiTtFGLHf5N7onjPf+Wlq+Xoos297mJGOsxW6jxR
    6Sb8GPzEM1bobi3oHPGwzJzoYWSDEtO5290mD/g0h1Rac+r2WIEkd042b90wumGwQ7/G
    Zn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735487390;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Cc:References:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=nWl6Pb84V2A/9qvCpK3gQPCJ/wJTMRJ17rHUwqy1aS0=;
    b=U5kNTKWiFTGp963sn2W4E1wcCk66QtE176qVsxWxSMciH+RiPWlWh8iRrN+Ea7FAP8
    dZXG1QogaODARUpgvU8VNslXXEkPL4AjWnSBIBetaNKdHx5HcXy/WwF/jzYKNcm+QBea
    wNPBezmNzumtj01++5yhTnQf/SexvmNBJ15unU7MifN9xqgMiFsq2Jg2JqJenh2RS8/e
    qmdyFpTKrnjcwmjOzbrYnxzcqpf2olY81d0Yoyg1SjIHVAYo1sPxvkTCKuWvQjplt6sh
    fjZHtrGIAo7+j0U4gLeY9pXskmGhQYxAcKx8Odxp59uO3cVIOhNQylwaR9kRIJst4INu
    KpUA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735487390;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Cc:References:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=nWl6Pb84V2A/9qvCpK3gQPCJ/wJTMRJ17rHUwqy1aS0=;
    b=RFnJ+sX2LKWLjb1HTRUYzuNG8QkCAF7pXUyumkMNkOzQkTTYIKhb/mMku07LGUjr6T
    9+kc6V3n5qgZk/UDZliqBK0oHWM8jTB2sA/GUvwXZ77dMg67NYT4ibFz//NgtoCHSD4a
    /+payxU5dQOQ9xTmtm0o7kDdcOoMhEPxxte6cmqQQXAP1VjnAqa7dKN1h4pIh1JxNf/V
    eZjRr6dtfZS6RD7gLPaNlulqZUCvUFOt4iepXKY7onXDy7qekulRAOBpDW9jy0091Bcf
    00KXOWqtzbNpasUUzMLHvxvao5r2nqTRefyCyUmDYr4lF9CJzLh9yM9SFna/Thw9DgA/
    +PtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735487390;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Cc:References:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=nWl6Pb84V2A/9qvCpK3gQPCJ/wJTMRJ17rHUwqy1aS0=;
    b=oWrhDDjA7VvAQ3czdTLE9TgjfAifekkQIQIXiuL7zChpPLVVuXWMb+1TZcWP8NLBca
    oSpxbWVBEizs/IDtzLBg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz09kpM="
Received: from [192.168.178.136]
    by smtp.strato.de (RZmta 51.2.16 DYNA|AUTH)
    with ESMTPSA id ebe9c90BTFnoHMa
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 29 Dec 2024 16:49:50 +0100 (CET)
Message-ID: <9397f369-0697-4f04-9eea-8eb7f4127878@xenosoft.de>
Date: Sun, 29 Dec 2024 16:49:49 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: emu10k1_gp: kernel panics
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: erick.archer@outlook.com, dmitry.torokhov@gmail.com,
 linux-input@vger.kernel.org
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
Content-Language: de-DE
Cc: Darren Stevens <darren@stevens-zone.net>, Pat Wall <pjwall@mac.com>,
 Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>,
 madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au
In-Reply-To: <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I tested the SB Live gameport with the kernel 6.13-rc4 today (kernel 
module emu10k1_gp). But I have issues with the kernel module emu10k1_gp 
(kernel panics). [1]

We have tested it with our FSL P5020/P5040 boards [2].

Is the problem already known? Is there already a solution?

Thanks,
Christian

[1] https://github.com/chzigotzky/kernels/issues/5
[2] http://wiki.amiga.org/index.php?title=X5000

