Return-Path: <linux-input+bounces-14128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40146B2B854
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 06:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DABF6622CAC
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 04:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9633D22F39B;
	Tue, 19 Aug 2025 04:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Aqw6GqXY"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1808072614;
	Tue, 19 Aug 2025 04:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755577144; cv=none; b=SjSOHqC8kNkKfF46tXpaCvhm7yahvxMikoPHQKQqk/XDFusD+DAMGqvT6r2IqVXcZHXPivbhuZq2UoBs7tuR/8XleWL0rexzKJEVIxVN/WcTy6h7uK0+mMGLKsuz0U/9MIXBxc0UsSlnznveyz0ct9vWAxeS3v3S6U1jKV5D96Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755577144; c=relaxed/simple;
	bh=m6xp2323FAqm6QsEcqi2NdZrvWME4MYQdFpBxjfgAwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+NkzBsfLg120CytojDlbmivff9MqSlMidgtlwydWQNrhItdqPiNB74Fk3YccxJpFMbl81/0LEim/aMz/jBLNy2jVi30uk9dzYHaPEYqKURzWSf5lRWsqLpO9IE2DEmJ7EPVpYj9MmDMbqD6j17I8M0Mt9g0WKjvWO6wqcTVJg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Aqw6GqXY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=RWQOLJLU76vF341Gt3ckRw/jrSGRh8W+OMvztDfQ78Y=; b=Aqw6GqXYOVc5/G3AgpZHZoC3/r
	99KtxJEDhZIYH2T+IqAgFfg2gBjoNOSKXiJLKvICx9XnfdpaVcq6qdIldJZrkI7O/R94GpJYqKV8y
	58JBbzdTQqf/me+NKJg420MnGiahVugjfP0fd7NgJFCEXp4cd+MfY0QxXOuqW2XCZVblblxyGxaue
	hkKni4AG/kYsuvA2urjZw+X+v/bjrQLj+R/DtRN/T0ufc2sCnskFlnsFTUrMTaJZimgXWZ+7iMaTa
	SkWkPrVl+5i1EUe0NR5wD4F48N25k9Jof0MPUW/mzdup41GRSc9FwqtfQrdgie1njgcXWxpajuXCv
	dRhfloRw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDoK-00000009MvS-3db7;
	Tue, 19 Aug 2025 04:19:00 +0000
Message-ID: <4d254096-f30d-435f-8352-9a04fd6b0541@infradead.org>
Date: Mon, 18 Aug 2025 21:19:00 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
To: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/25 4:08 PM, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
> haptic capabilities.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/input/event-codes.rst    | 14 ++++++++++++++
>  include/uapi/linux/input-event-codes.h |  1 +
>  2 files changed, 15 insertions(+)
-- 
~Randy

