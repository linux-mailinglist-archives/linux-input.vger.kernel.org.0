Return-Path: <linux-input+bounces-1880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9B7852E35
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 11:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75784B24F66
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 10:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A80324B24;
	Tue, 13 Feb 2024 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5eKLbfo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0617723774
	for <linux-input@vger.kernel.org>; Tue, 13 Feb 2024 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707820937; cv=none; b=qv1ZbKIYVdBGL00kOgaiJgHNz+Fb6V3RQ11YtgpgbSqHKo+8w0UF5s1rT4Gfqh0f3+WzEeEqo7b+FKU00mHvf3kmBb9GH3N7qkAjSe+AyeHM+cI6SGyg7NBEDB/A8WvgNPNoXsjdl8LtejmRvdDByK00HNBko9Q46XlaRVesxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707820937; c=relaxed/simple;
	bh=fBeH3fPmtgStyfEFpqJxDP/qFsjZCcBfmNS/uGegs1A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CC1nllar1X2czhjekZLz98jAnuJKteQcMJqQK2S+sGVLJPQKZbeDGP4CRvwwjAo2lIF1dyKMACD9J30Rbn7neo8XymbyVnROzeSFZDKo0ceW4IRLAqhqpvaxMKIb17vEetdpprCyXywpPpUKL86ZpBhCvtMMvtmxfddGi2LKfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5eKLbfo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3610DC433F1;
	Tue, 13 Feb 2024 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707820936;
	bh=fBeH3fPmtgStyfEFpqJxDP/qFsjZCcBfmNS/uGegs1A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H5eKLbforohuVNdKfCklSGFwwEmPlb+Tlt9/C/TMpebbv7uIwCp1DOnVOAyZIEa7Y
	 iavxV/jEOdDHyTwan1SKx2fuqz6O7WML19BFzrcFkF6EF/CPr505HlBf9VDqveplAf
	 rwvNBSyomSfUNZuFVV5JRQZJ4x7qZ9nUpNrQGc4th8eg4Ba1vJrXWASjsxBVL5cfU7
	 BT2XV8uZMt578EiLEuPD8DBfbj1JW56zM9Zcf1duiz1Wi7nV8LE2LLHLB25UiGdFJR
	 rQ274RbCHjMHrw4TpZAQWBsJRKFeOI2qqbzFGP+9tZtBTe8DmobZoftNb+2bMk1Ww2
	 7b3/RIlZJxcgA==
Date: Tue, 13 Feb 2024 11:42:17 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Tobita, Tatsunosuke" <tatsunosuke.wacom@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, Jason Gerecke <killertofu@gmail.com>, 
    Aaron Armstrong Skomra <skomra@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, 
    Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Subject: Re: [PATCH 2/2] HID: wacom: Clean up use of struct->wacom_wac
In-Reply-To: <20240201044346.23476-1-tatsunosuke.wacom@gmail.com>
Message-ID: <nycvar.YFH.7.76.2402131141560.21798@cbobk.fhfr.pm>
References: <20240201044346.23476-1-tatsunosuke.wacom@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Feb 2024, Tobita, Tatsunosuke wrote:

> From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> 
> Replace the indirect accesses to struct->wacom_wac from struct->wacom
> to the direct access in order for better code reading.
> 
> Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>

Applied to hid.git#for-6.9/wacom.

Thanks,

-- 
Jiri Kosina
SUSE Labs


