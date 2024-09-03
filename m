Return-Path: <linux-input+bounces-6092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D18969C9E
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 13:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72723285507
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145D61C62CE;
	Tue,  3 Sep 2024 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJgYyLNV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DDF1B985C;
	Tue,  3 Sep 2024 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364733; cv=none; b=tpdAg3qffrTJ7i6jumkZT1LKf2ZgczCAt0jTYp7sky3j7UFc6kQ1rOxuU4lTn1qNN7sJfBsjn/oAgzqp7F2zatermR2dzzi6SmO5CVkAj1a54S0yPPnYSTPo4lYA9pJY5k+/rNdqLpNFhFJPbqbmzcUjnB3PH//vi0JClJUfiwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364733; c=relaxed/simple;
	bh=EWgX+lYGHlTLumxZvICAj7xEBdRO3ok7SqTv65vXNuo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q7SWhD4SlrZaPcpIAVRo62hu4Fg0JL+fQhjz0nSQofT6xOPY4XziFutZ3e5IYibToMRXbfnjdcTrN4HoXfZlWMIz3s93620UI4BT3ys2LuN6cbNqD7HiphE+aD4bcIvy2wEIe7b/wIbsJ5pH+iv/BFaBtVP8cgVjb/qldanBGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJgYyLNV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB86C4CEC4;
	Tue,  3 Sep 2024 11:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725364732;
	bh=EWgX+lYGHlTLumxZvICAj7xEBdRO3ok7SqTv65vXNuo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YJgYyLNVC42PMyzAV+nWrPqVeEgpEfyORpGMjA0PZk6SeTVNOqWM0wukMI8rwaP1W
	 DmnruNTjieyFIqo0zagDmGlJ/7xlLYj7Qp24S94nquCn89JV7fJE3rIso/a4oCGuu2
	 dMYxx2LBgvhdumAEN0ILeNBGMLjoJcVYq5iZ4GWyn2yHuPUg9aZi/7q//ryVqEnXTb
	 Gv0y2c1GswsVDQgdDUS/tfTefz3g9jtUVXNNHvdbw3fhIfEIbfjkl1WcWouY0fuRoO
	 n2v9bukDbxyZEnz6TIeLv8+wS0TcEqM5i7rS8olZqlkwUBxbkvDqOpIoxELYz+hWxT
	 EUDjZ53fY81xg==
Date: Tue, 3 Sep 2024 13:58:49 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: tammy tseng <tammy0524@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, tammy_tseng@sis.com
Subject: Re: [PATCH RESEND] hid: add patch for sis multitouch format
In-Reply-To: <20240806082531.1353207-2-tammy0524@gmail.com>
Message-ID: <nycvar.YFH.7.76.2409031358420.31206@cbobk.fhfr.pm>
References: <20240806082531.1353207-2-tammy0524@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Aug 2024, tammy tseng wrote:

> The patch is to add proper quirks for sis multitouch format

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


