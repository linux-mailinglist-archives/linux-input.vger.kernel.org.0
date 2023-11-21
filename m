Return-Path: <linux-input+bounces-158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5A7F280A
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC0F281D23
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B066D2030B;
	Tue, 21 Nov 2023 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7HcNKI4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086C200DB
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D01FC433C7;
	Tue, 21 Nov 2023 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700556734;
	bh=R6zskyT0ImGwBcfH987qpr99gkxs/wApxrL5UDiXm7I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b7HcNKI4zXYyd9J9DThMtaWzTEwZFpeBeaouvedi7fuVq1aB7oxRZp8lKz6Z0cbvG
	 n2vKRhlwA5f/Vdv7fsaS36pfgqOGMYJuxh1FSza7CdQwlPaQqBlHi3rzk54GmWRQlI
	 ixLSP7N3vWQgNgX106p1t1gmYXNTOlPABR6i3rmUwVGZ4bPF7x92hGASRrnxraZkCG
	 qTDdQ3fXSk+vsr2pQO7iCFM7Vpoqjwvg5QGkbDwDUyV3iuOMaY5FU81ndDoJSm3wJ7
	 d4zsoRe334wVmlKprSLCP43W3LAjIenlplZEcx/cC+HmaHOeIjddq6IDcmr4pLQd5h
	 LbxseE/vwDlig==
Date: Tue, 21 Nov 2023 09:52:11 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Denis Benato <benato.denis96@gmail.com>
cc: "Luke D. Jones" <luke@ljones.dev>, benjamin.tissoires@redhat.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] hid-asus: reset the backlight brightness level on
 resume
In-Reply-To: <b4356286-368a-49ec-b1f8-d7e5e4afdc25@gmail.com>
Message-ID: <nycvar.YFH.7.76.2311210951340.29220@cbobk.fhfr.pm>
References: <20231117011556.13067-1-luke@ljones.dev> <b4356286-368a-49ec-b1f8-d7e5e4afdc25@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Denis Benato wrote:

> > From: Denis Benato <benato.denis96@gmail.com>
> 
> I want to express my gratitude toward Luke for his guidance and his help 
> in submitting this fix.
> 
> I confirm those patches were sent in my behalf.

Luke, as you were in the supply chain of the patches, could you please 
provide Signed-off-by: tags so that I can add them into the chain?

Thanks,

-- 
Jiri Kosina
SUSE Labs


