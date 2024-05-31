Return-Path: <linux-input+bounces-3989-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA28D66D6
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 18:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D0411C24E30
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 16:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55697158DD3;
	Fri, 31 May 2024 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QU8eKpKR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JMyZY6H/"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176A158D90;
	Fri, 31 May 2024 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172992; cv=none; b=bC0ijmM9sXmx0QVTDLqhq4FVyWEjFrlEEgGf3LGe+Ueh0nwrutb2LjtUAJ74ZRGj/y71PQOVz9FnBfnrMGYCVETPJN1mn8UUBtL/mUy00zWPhtpm8hagI7SH5sLLAC1lnYGLico4OYFKgC2fZE8jXLrH8PCakXxZnHbKeTKHp90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172992; c=relaxed/simple;
	bh=kU8TeoYAbAgdQQ2v+KTA4NOoe3XrDNd8HRj+9JUGtfM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=UymEqMRZYLztbxqNSsaIXbvPxgJ+T1MceC4fdguu5uk4BhtUv6g6DLGbOI9rBnSjhU0ZFyColPkQ11oV+wz7m4f3dwWTL+Oa5m4kfF3RKMUZN9vKxlJmEztn+INUChHGFT95mTSnPrjWy9KOC7VjT0ODJ9JxkxVsMahNHBjo4co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QU8eKpKR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JMyZY6H/; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 3BF7518000DF;
	Fri, 31 May 2024 12:29:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 31 May 2024 12:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1717172988; x=1717259388; bh=TJTJrhdkPm
	ycIRaV1DpT+zY/SG85hVABIEWoJz6Cpuc=; b=QU8eKpKRcoMPXOk3xk2xSo0dXV
	X3PeHMk19LtXJirQ5BdwCRrFAklcA6squS15dHttRdRM6PWfAE2qHz+1ey3W8ag8
	t/0OklpufDvKcNXCk9IlySy2e4XhK4bDIxugSvKi2TS2ex7++sPDD1epMpir5URh
	aM2DPaDyHpR+BZL4CmHnqucxaXAAINpJUdjSgin+QifpWeY3XKn4x6a+AwSMas1X
	+hYm75sL2vumlY1ZS7YqDUD3s5iEwGhISz1qa2Fo0omM1Kkz3jM1l68qc+BQ1xKd
	TBacjtDhVBV3qLSn5SoHEFQ8mr1aywXHsYlqh+CToqF5RO2WyKf5UpEQdAJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717172988; x=1717259388; bh=TJTJrhdkPmycIRaV1DpT+zY/SG85
	hVABIEWoJz6Cpuc=; b=JMyZY6H/F1Py574a30fMPHlBTwIRVHO/MZH9BWcfvEn0
	uIPan4Jd0HGHxi2l5IJ35ugFCNkUDXMIDrLUlGPvb+wxhOFGdhzWeMOJW2J/+DUC
	SN9LHjEHqiLFLqht9ZSVnjGK3LKqslu5576qVJRKunfFxLCUn7IT1WtY0kyswoR7
	/kduzzlVKnbzglfQLOdyAcCeFaFkevAdaa3lqUoyYY+1O7SYtmjK8PlwXKFhOfQB
	jU1jB5u5k4RSmQZVSd+DS26SzBKuA9jH6qgiYALEG8UhiH9tcaagWBUl+rvhIBD1
	HDOqs3AA0u2YJqXQBoWJXsc8XqDjWYZsj/4vXndDFg==
X-ME-Sender: <xms:_PpZZimKVAPx7QGekOxUufZMvIGobX0MSbaNLiP0UShO2OREIz_Hvw>
    <xme:_PpZZp3F4ZKbwEhvycanUNNd30RVhHKwpDhAtZ6q_AohSt6D5Mlc3fpdSEEIOx7Bv
    ij9svoV8r6GCto1834>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekiedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:_PpZZgqKyKtVfrResp5-VblSRxLVp2b2jiQ9Tlt1sN-95L31JbCLHQ>
    <xmx:_PpZZmkug4JC_tumyls9n99yk63x0Kz1DNn2pZmdpzz3MZ0pFbCatw>
    <xmx:_PpZZg3dnIAzIcKmBaGZaJAHG_gANsHct8I5J4ZmfbCjDnXtc8o7SQ>
    <xmx:_PpZZttoRkBaeZ2j0DS8dl0C2gLKlVTaoQpdPeZ9digSkhJa7__LGw>
    <xmx:_PpZZqrLjCfAl_C1jSQbDHHrXPPCpQdUsa4vGx1FuF9svErOVD0ktVid>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9A1F3B6008D; Fri, 31 May 2024 12:29:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <173c371a-5669-432a-9826-ce799102f6c1@app.fastmail.com>
In-Reply-To: <93a4b3f093a3105c4731fdac37cc1964b266302c.camel@linux.intel.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
 <20240528115802.3122955-2-arnd@kernel.org>
 <DM4PR11MB59959F1AE3E9BDA36642000B93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
 <508d40bb-f2df-469a-9f94-58b41a28f53a@app.fastmail.com>
 <93a4b3f093a3105c4731fdac37cc1964b266302c.camel@linux.intel.com>
Date: Fri, 31 May 2024 18:29:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: 
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "Lixu Zhang" <lixu.zhang@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
Content-Type: text/plain

On Fri, May 31, 2024, at 05:49, srinivas pandruvada wrote:
> On Wed, 2024-05-29 at 15:18 +0200, Arnd Bergmann wrote:
>> On Wed, May 29, 2024, at 09:05, Zhang, Lixu wrote:
>> 
>> > > 
>> > > 	for (i = 0; i < fragment->fragment_cnt && offset <
>> > > ish_fw->size; i++) {
>> > You added a parameter fragment_count, but you didn't use it. Did
>> > you 
>> > intend to use it here?
>> > 
>> 
>> My mistake, that was again broken in my incorrect
>> rebase.
>> 
> Do you have updated patch? Lixu can try and make sure that the
> functionality is not broken by changes.
>

I've sent v2 now, hopefully addressing all the issues
of the first version. I've dropped the other patch now,
though I still think something is wrong there.

    Arnd

