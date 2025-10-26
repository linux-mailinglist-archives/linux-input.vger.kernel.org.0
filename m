Return-Path: <linux-input+bounces-15727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A4C0A62B
	for <lists+linux-input@lfdr.de>; Sun, 26 Oct 2025 11:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E3791899B57
	for <lists+linux-input@lfdr.de>; Sun, 26 Oct 2025 10:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0C91F5E6;
	Sun, 26 Oct 2025 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b="TngGE4NT"
X-Original-To: linux-input@vger.kernel.org
Received: from sv9.manufrog.com (sv9.manufrog.com [46.246.119.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC3D531;
	Sun, 26 Oct 2025 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.246.119.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761475535; cv=none; b=anpnFRffiFb11aGnfjpQ/ldc4tcN/OsdYv+4JWmmYOuFYNGELQBjvHnc/4448t2Uh+rUEvC5C47ebVHUi+YDAEmvssabBPifEAt9fuVK47UXYFwJVyOnXXFyD9UOyiOrOMEDjP4xLMzWRZQtijD1jZ/7vGLZEdWuBqC94n2xaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761475535; c=relaxed/simple;
	bh=brIGlN2GMSTr5DDNjdbkmb3sypM05JuB/bDOhWdCXsA=;
	h=From:To:Cc:Subject:References:In-Reply-To:Message-ID:Date:
	 Content-Type:MIME-Version; b=e4TxuMNLLRibMvLeY63seo5+c/V/0LaZaUHMGBoMku+SnBU/syv9RekLMXdKSHPvv9sfUCFj+Kw2TNWVK+lTkX7mxAagZvfnzRUzdpJzAnHSLLPXfQ51UWE53FGShEcD5UEaJUNBzYE4PoTMNekrKNSe7hDD/kjRrX9LqVLAGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se; spf=pass smtp.mailfrom=oscillator.se; dkim=pass (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b=TngGE4NT; arc=none smtp.client-ip=46.246.119.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscillator.se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oscillator.se; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:Date:Message-ID:In-Reply-To:References:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=brIGlN2GMSTr5DDNjdbkmb3sypM05JuB/bDOhWdCXsA=; b=TngGE4NTv3Z+9M/osgNYh/3fx9
	YUz3nACkjWF5BNk6uDRimq/XLETwQmUoG5fXuMxb09QvVwCNMBlQwf4Bccjb9WDPORN8oVtHYbSr5
	kAqz40p60X/PiUNysugVTu2RzdxJgJ+7U/wMLEOICYNCRviQTeUV7MK7EAQzFQbKvzDv0COZuRfmr
	WXNZchO0Z+E1IaWVw8gjAXH+x24bMcRDEnc6w5Ckj2CCXf6dsuPLGUy9sDhz0dpqBySGW12dTFyQq
	7td6zM8p14Odh0y0q4LWhTaP8JiTICoPm5dYJknINBK9h0B5JPAgbJFNGjnGTST3bpzYhsQDdcdhY
	piRz37Hg==;
Received: from oscillator.oscillator.se ([193.234.15.39]:41036)
	by sv9.manufrog.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <staffan.melin@oscillator.se>)
	id 1vCyFV-00000003jyi-2QYw;
	Sun, 26 Oct 2025 11:45:21 +0100
From: Staffan Melin <staffan.melin@oscillator.se>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, jikos@kernel.org,
 bentiss@kernel.org, zhangheng <zhangheng@kylinos.cn>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 1114557@bugs.debian.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] HID: quirks: Change manufacturer for 4c4a:4155
References: <e765d91f-3c00-4dc5-ac24-68a5512a0c12@kylinos.cn>
In-Reply-To: <e765d91f-3c00-4dc5-ac24-68a5512a0c12@kylinos.cn>
Message-ID: <20251026104519.Horde.F35uheZ2rCxjaiE-0dJRAwF@oscillator.oscillator.se>
User-Agent: Horde Application Framework 5
Date: Sun, 26 Oct 2025 10:45:19 +0000
Content-Type: text/plain; charset=utf-8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 
this patch also works fine on my GPD DUO.
 
Tested-by: Staffan Melin, staffan.melin@oscillator.se
 
Best regards,
 
Staffan Melin
 
"zhangheng" zhangheng@kylinos.cn – 26 oktober 2025 kl. 04:35
> 
> 
>

