Return-Path: <linux-input+bounces-5680-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E39572B0
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1289B1F23E87
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 18:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853B6184535;
	Mon, 19 Aug 2024 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLSJj5CU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1B1CAAF
	for <linux-input@vger.kernel.org>; Mon, 19 Aug 2024 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090810; cv=none; b=ZQeJM8NTiFNIa8jrSWopuU780erfGMyewVgiQQQzcT/Ypk0jb9DD5gLC7rZB1s7+zTa57XP9lTdR7MfwkKfv3uLCC7thQp3wpJO5e0+gnwknXdeGWUbI9D1EdqN4Vf3ICDT1BuKsYT9xtzKRK/OjI+OaSEkG7vaQANjDrPED1io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090810; c=relaxed/simple;
	bh=JKw7Pm5RsDtBz3oXvbvYV93rTF10vEivhEpLSx9uCDA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=j3J9BpHgIa/RGNmAoFWgZvzuyl0KvQhJKH4/DHij+n9AieDMRVEZleY6yw+9IBb6+HKNkar1XGeohaX4IgMJ1qtPQkwG/G9obRp37MTDH1AGjfn70jVItyTRLpG4EdBNs/a71EEl54H2/n+Bs09BR2TElUpmvXc754xZN1ofqh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLSJj5CU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B12FC32782;
	Mon, 19 Aug 2024 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724090809;
	bh=JKw7Pm5RsDtBz3oXvbvYV93rTF10vEivhEpLSx9uCDA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cLSJj5CUsawNxOZdmAoTVn3jHyLXs2mGUR53YVrcYH5foDcKQZvtSuCDPmw/SrdjA
	 z5/L7ga9UUea8CDgN7115TU4N5363Twf1ZDpeC0Lzcs6hhOMGKSm0Z5wEk/xRTLDNI
	 LZjZzimrO6CdFQ7Q3I0xYIGphXZpXHfQSDFUtMl60frg30tReBI1mJkWc3l2Fra7oW
	 U6ud1jkM0eAHDXNb4EphiZ88TJm5l3mPDoqoRbJqnA7e54PiD5bCcbjCKaoqccPsZ8
	 nx3XGJ/AhCu6U5eQR/dwzU02ckDV8dFOux92Eg8+fb2PdKLI05Drg9kaEdW2ATE2v/
	 y69CL0xbkjMgA==
Date: Mon, 19 Aug 2024 20:06:47 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dominique Martinet <asmadeus@codewreck.org>
cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Nehal Shah <nehal-bakulchandra.shah@amd.com>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-input@vger.kernel.org
Subject: Re: BUG in amd_sfh_get_report
In-Reply-To: <ZqlS0MWxFDsIj_Sf@codewreck.org>
Message-ID: <nycvar.YFH.7.76.2408192006100.12664@cbobk.fhfr.pm>
References: <ZqlS0MWxFDsIj_Sf@codewreck.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Dominique Martinet wrote:

> Hello,
> 
> I just rebooted my server this morning and was greeted by this bug:

AMD folks, can did you have a chance to look into this report, please?

-- 
Jiri Kosina
SUSE Labs


