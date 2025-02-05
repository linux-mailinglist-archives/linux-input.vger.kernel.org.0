Return-Path: <linux-input+bounces-9789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D0A28622
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 10:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DED7E7A3DA5
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 09:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1BF22A4CA;
	Wed,  5 Feb 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdTEH6Iq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4487228CBA
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738746464; cv=none; b=fYrN50kj8DCsk7FZJM+b2r3k+5lNU1Z2Ie+43YvhWxpZQjnbKBI3rY+H3Mahl2J16LavMyawMKY34bBD3rL8PE84u+fcWiFDJI5Av8q8B8AOuu6btq4qbsHb5PzNXeRwgIdEYIdlSxeFWMOYBODBgFACqKZR/xge7yEPBp4vK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738746464; c=relaxed/simple;
	bh=Z+mOlfhguHB/xqBapfP8lwr/CRAvlaADL9kI97KNWcE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MeS3R6hMjYOdi5ej+fD+0GomAxdYLnon/HRGAVzoaUz6liJEOSBMmwYvp94yoSbiWG0lE/VChyFB1wPHXGECVZ2fF6nOHZc0OKNTNaeOFXGD2/k/oKIcF6RMcpLsSgQAmtSLn25+OdjjYjgfFesOPUp3AudGLVl/viTJsMuCr20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdTEH6Iq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5023C4CEE3;
	Wed,  5 Feb 2025 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738746464;
	bh=Z+mOlfhguHB/xqBapfP8lwr/CRAvlaADL9kI97KNWcE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UdTEH6IqBtby0jr6VZopztlFaFu441IDSCun5f6K0owOW59RlQRM8Ngte/e7AxTsa
	 1dmtZ63+ClYZ9m5LnCZh/ZmGKrqlmuIBcMHIJhv5vTJrH+c9ASPgAzVBppGOKRMWQp
	 EBG6X+tmJGrH2yWSY8K9qHfrXaCtxX0ZHkwubdJtMCRRhtPjBXchkT4fiY/htmjCZ2
	 lnWYJpb9T/OmBp76ct8x7TpC2WXEyRseJmmZ4g4uU+NqVdO/I4rU9XdX/NDWIL+amm
	 LLGMAQI7/3riftCghGpS/9QaZvROfI9IJKjyyVopGHRm6XjQIRtWTZqMcVACO9kQBA
	 uOFGyqwF5FTew==
Date: Wed, 5 Feb 2025 10:07:41 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] hid-steam: Move hidraw input (un)registering to
 work
In-Reply-To: <20250205035529.1022143-1-vi@endrift.com>
Message-ID: <1119qo78-r459-2qop-rro9-496p33op0035@xreary.bet>
References: <20250205035529.1022143-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Vicki,

all three patches look good, thanks for fixing the issues.

Is it possible to identify commits that could be used as 'Fixes:' tag for 
each of the patches? If this has been the issue since the beginning, it's 
good to reference the initial commit by the Fixes: tag still.

Thanks,

-- 
Jiri Kosina
SUSE Labs


