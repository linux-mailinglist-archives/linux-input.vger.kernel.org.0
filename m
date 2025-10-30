Return-Path: <linux-input+bounces-15797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CAEC1F86B
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 11:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ECF3426A60
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 10:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50710350D6A;
	Thu, 30 Oct 2025 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnafdktC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A5326B77B;
	Thu, 30 Oct 2025 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819891; cv=none; b=PTfrSvrrphIDxvMPELQpLge+nbcQMraho5UXpFzqmMSnkj6MYwoIzEwRmrs3j3Qays7Dqd9hmtudp1+GTbtEGibCfqoIFCRQm5EO410n5Ysqkd7wSaxi08I704kuvndYOJW1CXevbKZd1LIxdfpwQARoNapfLwz0+caZYIcba1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819891; c=relaxed/simple;
	bh=ETYSiml/z1HOmlp+he3h/ynUR9yvw1f1RZj4bLOXvBw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kHcjmi8eGqZy8wu/+uqATBaO1NDSfRzN/CKKByzMa01d7xCw3r7oj2OPi7i0TBvQ1SptyQsUDmXWdE5iswuj+xp3NdoRJkwzv5F4KZgIZnNJNL5mhf5qHsHq7mcSjo3xikkNkL/ih6h99VrslwXF71I34QQnwBWtVpj8/DfD4oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnafdktC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62690C4CEFF;
	Thu, 30 Oct 2025 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761819890;
	bh=ETYSiml/z1HOmlp+he3h/ynUR9yvw1f1RZj4bLOXvBw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qnafdktC6D8rrnY+7I+f1TwJ3X/5Pl/B5eqWiislzPlOvVNo1wNeaNzMKkF6LnFNA
	 NG++0MD75+1USuOadEzsjnFxyvQiHTp8hNshHXGh51cBGlQbDC0NLSvBR/wAfAQPK1
	 lGNyb+8C2jfKFyU83am2rfmdgZFnavQQkf2qM9SY87G6mGd5dEAN1QK50iPyZIh4gc
	 P/GPmM4zL8Vfiq44DimYolgWIUTVd346NU0ss2tqW3XJn3TPvb8VDulsFsGHzhBZ/Q
	 9v2rLQqnbgWQpPS7UDI8yKpq1ZViBCYLH6exr6hneWsVhOJKv/dKjIPGJ4ZAqEjH3e
	 RoKmS/Sfhv/dQ==
Date: Thu, 30 Oct 2025 11:24:47 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: zhangheng <zhangheng@kylinos.cn>
cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, bentiss@kernel.org, 
    staffan.melin@oscillator.se, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 1114557@bugs.debian.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH v4] HID: quirks: Change manufacturer for 4c4a:4155
In-Reply-To: <e765d91f-3c00-4dc5-ac24-68a5512a0c12@kylinos.cn>
Message-ID: <r995o7q5-s2nq-9p8p-6r35-7491qs1584r7@xreary.bet>
References: <20250923022445.3276026-1-zhangheng@kylinos.cn> <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com> <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn> <365f9f8e-549e-42e1-ac8c-7ff1f42c6977@cosmicgizmosystems.com>
 <8f0155d4-72a7-45ec-a272-7892e783bbed@kylinos.cn> <c7aab08b-52fa-41ef-a7fb-118298bb93aa@cosmicgizmosystems.com> <e765d91f-3c00-4dc5-ac24-68a5512a0c12@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I have updated the shortlog to be a little bit more descriptive and 
applied, thanks.

-- 
Jiri Kosina
SUSE Labs


