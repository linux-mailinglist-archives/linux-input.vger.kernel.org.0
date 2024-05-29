Return-Path: <linux-input+bounces-3950-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E23C38D3767
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 15:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 175AE1C219FC
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 13:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1833CF9EC;
	Wed, 29 May 2024 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CpkzA310";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CFfnIKAz"
X-Original-To: linux-input@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387BD27D;
	Wed, 29 May 2024 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988723; cv=none; b=WiYkPVjuD2UJYKUJH3Yy3zcLYGPxc/52ZWquh6UMTZzAXNLZ+lNqb3Q2ie3nTljk5V4eL6keBX8tYhtzAfpS4Fv0HdpEcKMZyzxt+EJ50QCOOu8KB1hST67zu+R31eShtgisxI6lqlV0MDCymJzXp/GM3S7fYv0VQx6sDxa6IcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988723; c=relaxed/simple;
	bh=C3uNmjUmCcvGT1KkJFaUXmA2BqwSkBrLcJSJXR6bf1A=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=HAC/yg6y0qQlnjSXHRzyEjpHWtQ+BTFXEmEdcHZfqMEaKW8NOnrVheI+FK67rF17iVdSoBMs50QIXjlcALDMwgITEmrJAxUPql12NVeLHh5EroZ7jcbmwz7qEPGppMcEXQUv7qB58WsYabjBiDUT59p6GbOQwnrkF8Rou07QdDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CpkzA310; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CFfnIKAz; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 6DBAB1C00101;
	Wed, 29 May 2024 09:18:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 29 May 2024 09:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716988720; x=1717075120; bh=KgCmw4JKIv
	7OZxjKYNpLcFc1OBFgAdfChyBe0Hk4zvk=; b=CpkzA310AMz3JTCZNVBdhXW7ee
	o+/cos3jbfgUclTT0SsPsfvUDlsIuh4H6u7lwC97Fs0MM5CTablK3g/Zhss2Qxp7
	JDe0rsvEAYIHf1bjL6dMZDixGQ6feKOtxV2HBX5HwdlB2w6UoVWVl/1zUZLT6I4Y
	NzCbMMj7qg+MP2zKZlwS10w6vIsBbRAvlGClskqSx1Zqiswc2NIoXH0qI6YiwSs1
	h6jW5Lwv7pTgMUTnhOAQxep8+EgYIBqzglnRMqzinNo5uM/s55pJJZYYvyjdXYtz
	uY7eYSrFk7oVVvGoWdY2A3JNhy6JSU+t9fPG3hphVtS1a/ybhLMGMM9ApFwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716988720; x=1717075120; bh=KgCmw4JKIv7OZxjKYNpLcFc1OBFg
	AdfChyBe0Hk4zvk=; b=CFfnIKAzhwTJjWLwbi8PBOl0dCOv4aoubzlL/uZx3uWW
	nXziA/in35Yf3GFTeLZadvM6g6thQRgOg283ygW5snNHjZgB8B3GEcTH148cZb7A
	K7Q9r6I4YudXwnaXSOntD5wVGTp0kSNP3JpIrsSLB3ok+Bj+dUMPj/9dEi9kvEEY
	/6HGXPKcJbDjfAFRjb0rZseYZWNAg6p3hYgHesrm45N5CdNjZYkevUhumBjCKHPr
	VtbAk27sKMC2OFEKPmBS/44HR+khNFZsyvZNesNeDR13iX/oMgT5y04BCYsylf8x
	GUiNulHUoF8QOuIulFbmrs3/YnZzV0SdT5IOMENLiw==
X-ME-Sender: <xms:LytXZggKWst7oUNVKGQS1oEqohLatayVmcQ2QjL5KLYMfK8vjRiNeg>
    <xme:LytXZpCRr_En30LxEYfzsX-S8ahFxVg-3-nDvgWRrtSTjuW-36S0ir6dq6ejPIMD8
    Is5y5FehqyHb6uyB2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekuddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:LytXZoGyqKzZK2nTQqS2WhgfwsosX_9PIrD5u0aY0Fb8PUAKVYG67g>
    <xmx:LytXZhRTA8bVGalC90mJvSHNESasi3ZN63ncIeof7sLGdM85XqDNNw>
    <xmx:LytXZtwbwnZGOUkEHmxcL_uJUOOYsy2C8m1zfbZvICtOBgEHh4MC4Q>
    <xmx:LytXZv4gZO3Lit0JRUYtM0yKuMr87XG99nv4IN6Zvp_-kQRyEf4DGQ>
    <xmx:MCtXZkkB_oz33EB1VZL8A40HoG1gVrBtz6K09Ig0VGpJU4_AP7zQsFa_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 79E6BB6008D; Wed, 29 May 2024 09:18:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <508d40bb-f2df-469a-9f94-58b41a28f53a@app.fastmail.com>
In-Reply-To: 
 <DM4PR11MB59959F1AE3E9BDA36642000B93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
 <20240528115802.3122955-2-arnd@kernel.org>
 <DM4PR11MB59959F1AE3E9BDA36642000B93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
Date: Wed, 29 May 2024 15:18:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lixu Zhang" <lixu.zhang@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "Jiri Kosina" <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
Content-Type: text/plain

On Wed, May 29, 2024, at 09:05, Zhang, Lixu wrote:

>>
>> 	for (i = 0; i < fragment->fragment_cnt && offset < ish_fw->size; i++) {
> You added a parameter fragment_count, but you didn't use it. Did you 
> intend to use it here?
>

My mistake, that was again broken in my incorrect
rebase.

     Arnd

