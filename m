Return-Path: <linux-input+bounces-3934-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 606048D2DC8
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 09:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 917E91C22382
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 07:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D035161916;
	Wed, 29 May 2024 07:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FMeN65ym";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lYXGsKp9"
X-Original-To: linux-input@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2848D15FA8A;
	Wed, 29 May 2024 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716966437; cv=none; b=fMMboN/tDDPsSg4oi3wkLDjgjjbrCv3tA2opfC/pHs/ELFen/5nq8f4wwz3rLGXubgGYK9nDCaFGFHB6GwCrIY2sDsroGRW0BxmSdbcJRcoNqbCWEmp7Sy17wgb/E8s/SazAPqURvgAsn3meA9sPDArr1QmtRcxsVPhcgXmwsVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716966437; c=relaxed/simple;
	bh=X3CFDYvAfwfnJHcIusiW14N73Q9qM1823sV8XQNMeqg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=rHZPXLNmCTExjPZXoKiBi/EU8Ld1kyAMBGLmhvO4Zevrgm4WWutKjGN8rWbcJV8F6Wf33s9WwHcvZ17+3Ax0h0fCHe4QDHIBLamCTA/Qc7L7w51td6Vcn29eVs89rCYmZs1DX8qMAihZ9C4cAbpAvTz5P4Ho+f0e4Wi+aHLK5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FMeN65ym; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lYXGsKp9; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1EF67138014A;
	Wed, 29 May 2024 03:07:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 29 May 2024 03:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716966434; x=1717052834; bh=q422LFFM8n
	pqmy/SvK+VDCtZcY9VUi/rjqe7GV1DfDc=; b=FMeN65ym8KXUOemT1mFQ/SpXJs
	cKdX06tx8lucjEgguMF52a2d3TD0/SpmYXSBRdxXqmwZXdUdwB9xyb+qOa5gheRO
	1kmRU0m8En5F7fz50TChE0UjUfGelr2l5M0l5fOhUDHpghyhXAxiyHIGib8ccUQ/
	ZEOLogLkKPU5K3Md1oBsgtoEvMRvLnA1G23EL1YentGSCm7XrmQuFBrIQtuDBfKD
	kH/xw4nryGHDkQEE6owm2LR2Lp1VvWOHnF1lXzWlLzwKdtlUgphgRlBmCO6qzL/K
	e+SCo4lTHy3hCGSiW27/Ea51H8kGqY5bEMmgC2YoUbJYj78rmDMeWVkKEIhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716966434; x=1717052834; bh=q422LFFM8npqmy/SvK+VDCtZcY9V
	Ui/rjqe7GV1DfDc=; b=lYXGsKp9NqIlwmHhQJqmG8a1+yV+FRFbiA3SM+kMlMDj
	dI9fcwdITeC53Wt0ftzLyWRFPxoCn0BTsNvDgtXaP5YopIiL7E/rvAVPe81lFAb6
	m5k70P2CUK7iMaOxS11mp3yW4DqP8lK5bD/ry2bg9hdwTPLL3STiMTlqLLbGctdc
	KhQTMzusNggJnLnrWsxkr2JaTJ/rhh73rGPO6YlJacqBi2rs1anHUcchqCdK+Mqw
	PyHxCnxexbuR7ydgD0PQEBuPJPDaKCSoEq5pR4HV+Df96ba2mfZF0pJm/RJCwvRX
	JBQxlMAtuCwrp68Md71RoDfctHfN4/5T32pQHnwhrw==
X-ME-Sender: <xms:IdRWZuncQciHa6ReB7FBoQyR-qwD3u70H8w1vSOCpyLwd2CENfGjxw>
    <xme:IdRWZl2BRm150Y70PpFYbFVEoDNYLphVSYoSHbDAk0lrjBUXtuszQqQxFFLpldAMe
    BW-fMeoZrA_DsMJrn0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdektddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:IdRWZsr6Wr6lAThKJPDNzi9nK1Nw-bhljaEB8SBPUA_AvpU7wWMF0g>
    <xmx:IdRWZimwKW3aWBUK0y1Sm1-MLZU_9Lcz3YEJ1Qzsy4ZjmpLlpKTohQ>
    <xmx:IdRWZs2bFB8C4Y-770K-cB_b9ij26EzCxwVysIffV9ti_zEmPbry_A>
    <xmx:IdRWZpsgo6cuIO2H-qzhdTlrp0z6xBFfLOJfoxywVTE8wCrWjX-A1g>
    <xmx:ItRWZmpOdIGin4yiKmY-7jnbXCS_WiwRZSlr_QsuosLkW_cFAqUkkjUJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C3D70B6008D; Wed, 29 May 2024 03:07:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <fcbdc4a5-abee-4de8-9fe8-c8486195b96d@app.fastmail.com>
In-Reply-To: 
 <DM4PR11MB5995875EEC9ACCFC43D8B86A93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
 <DM4PR11MB5995875EEC9ACCFC43D8B86A93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
Date: Wed, 29 May 2024 09:06:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lixu Zhang" <lixu.zhang@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "Jiri Kosina" <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
Content-Type: text/plain

On Wed, May 29, 2024, at 08:46, Zhang, Lixu wrote:
>>
>>-#include <linux/cacheflush.h>
>> #include <linux/container_of.h>
>> #include <linux/dev_printk.h>
>> #include <linux/dma-mapping.h>
>>@@ -175,10 +174,11 @@ static int prepare_dma_bufs(struct ishtp_device
>>*dev,
>> 			return -ENOMEM;
>>
>> 		fragment->fragment_tbl[i].ddr_adrs =
>>cpu_to_le64(dma_addr);
>>+
>>+		memcpy(dma_bufs[i], ish_fw->data + offset, fragment-
>>>fragment_tbl[i].length);
> fragment->fragment_tbl[i].length was used before assignment.
> 
>>+		dma_wmb();
> I tested it on the platform, but it didn't wok.
>

What behavior do you see instead? If the manual cache
flush works around a bug, that would indicate that the
device itself is not coherent and the dma_alloc_coherent()
in the architecture is broken.

     Arnd

