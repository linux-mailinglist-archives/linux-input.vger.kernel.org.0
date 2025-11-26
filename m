Return-Path: <linux-input+bounces-16358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE3C8AF2C
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 17:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 74ADF4ED3CD
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559AF33E375;
	Wed, 26 Nov 2025 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRvLNyUJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B333C538;
	Wed, 26 Nov 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174165; cv=none; b=WdX+yIAby8I+6Rzt74w13GfYHUXgYE5h38KK7w5YP9qkq0ceWk/K3dIEpQblwUUGgOV/IpaiJuEmU+sJ1XIXlf7lBI99rxR78pO0ZwvDgcj5QvqjloAmYoqHj+EJQCNqZgO6aNJ4OlxlzkkGT88Ok5QWFmvjTHJ7OKhcRk4s1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174165; c=relaxed/simple;
	bh=Q01cBAzqf/8zu4lppt/Yx1S087Q9DhRcjf/dZMFlJ1Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P9Krl12kCpeK4VeBgQOc6uvDXYUnH17Uc6X/g3iyAnCtjrOy5t4h0QInnNBlrzA5AI6hit9cXECJxXNVhAv4hL7tLTfW0VhBuh0VEXtN7ZR/AwawHvle4i8mKbcqheOVFoDl1Nox3K5NXE2RaNEmoO2j4obBmTfNM65yb/LEheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRvLNyUJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3519EC4CEF7;
	Wed, 26 Nov 2025 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764174164;
	bh=Q01cBAzqf/8zu4lppt/Yx1S087Q9DhRcjf/dZMFlJ1Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KRvLNyUJ1lxAYYzg0Z4yFPaj8VwiN4H08gWaxCuHBrH0x6Dnk+OKRuNCngcQxIaQz
	 WGM5/nXOb3M06Mil9+yi3uK1185JBAM9JXVQAKjdXbXrbC7wz6z06vhnpyhnPF2HG5
	 5sf97qm7Rvn11lQAzDST7yQ/cigMFcHsCPdgGCExOEXEiq4hgiUUkhdaJ3vOUMvIgx
	 dmZbkbsnZDpMP0YdWsz8iPApzo41OhF6tEiCo4hR7uScEu12rW+UhJuWi4gG1MuR/Z
	 p+n8v/MyT1CWs7Wd8MWm1Mg7vru/LVsPU6BMxArqPpFjMPVNtvygyX4oThiEKmqhRr
	 +fyNQAaGe71bg==
Date: Wed, 26 Nov 2025 17:22:42 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Benedek Kupper <kupper.benedek@gmail.com>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    bentiss@kernel.org
Subject: Re: [PATCH] drivers: hid: renegotiate resolution multipliers with
 device after reset
In-Reply-To: <20251007203544.9963-1-kupper.benedek@gmail.com>
Message-ID: <076s5qon-0o97-r3o4-10n0-s415q569sp40@xreary.bet>
References: <20251007203544.9963-1-kupper.benedek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Oct 2025, Benedek Kupper wrote:

> The scroll resolution multipliers are set in the context of
> hidinput_connect(), which is only called at probe time: when the host
> changes the value on the device with a SET_REPORT(FEATURE), and the device
> accepts it, these multipliers are stored on the host side, and used to
> calculate the final scroll event values sent to userspace.
> 
> After a USB suspend, the resume operation on many hubs and chipsets
> involve a USB reset signal as well. A reset on the device side clears all
> previous state information, including the value of the multiplier report.
> This reset is not handled by the multiplier handling logic, so what ends up
> happening is the host is still expecting high-resolution scroll events,
> but the device is reset to default resolution, making the effective,
> user-perceived scroll speed incredibly slow.
> 
> The solution is to renegotiate the multiplier selection after each reset.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


