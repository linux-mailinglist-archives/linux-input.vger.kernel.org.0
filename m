Return-Path: <linux-input+bounces-3550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6F8BE415
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 15:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61965287EB5
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 13:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6605415E5B6;
	Tue,  7 May 2024 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRODGpGu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD3156F20
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087955; cv=none; b=R9DDOnfBK0aeT13iEZY+WS1FaPGjHUM4wFxDOnzQwiU6EYaD5+lvkHpZVuMxh84zXBo79+CmfM6Lm/wbjNQGni/jdvgEuv3YxBjWLMypoZ7nar67QmKvH6kK3HcSiU8VuhxRX4enNovwLy8Gx1chm+t0MeCWM8366K+ZqQzQxeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087955; c=relaxed/simple;
	bh=Yggb3mGDn2DjTZqHobl9NqxBjAiFvKX2T27HGJw22bA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RylpZN8Wi2lP5WiPwSq0k1jRO0MJVEzinggRcTRgJYNCOTNL7wd9+9EIReMNts4OGPs8FI6AOTDpU/XOkNSucGNPGvuPQatGUkxwMVHA2NNpoMublJiwwiF0yYqfe+MgstshG24txefgdEQZM5m2N8tWL94EYjKweoxCEb4k5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRODGpGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716A2C4AF68;
	Tue,  7 May 2024 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087954;
	bh=Yggb3mGDn2DjTZqHobl9NqxBjAiFvKX2T27HGJw22bA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WRODGpGupr9yIpC9Dnexh+TVd12Ocrez5526HGRDHJ7xkjSwxitnLQiZxZfbb8y53
	 uvp3GdNRIJR0TWDfVAWB+drAHZ3JW88+sCH5ROexXXdcihaBqI4f0eC/S5NNw+w+KG
	 ivnkgOdkzcSkA0vntbdyuawlxQvsUzPUZ390nVuw/TJ9fgfD30XAJAtPn22UcAsmPA
	 w1joMFAoJQyU+mwGokhQsr/l34CFc7oA6eRl/yD5GJvBybswWUI32h/cOTgHSNo/yz
	 zEw+rTB9zj06r2xkhnLdUceecCuumVqQuj5NS+TzgzlH41Rg02wgSj5mrvEj+R/4Qf
	 CQqdykUyBghmQ==
Date: Tue, 7 May 2024 15:19:12 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    patreddy@amd.com
Subject: Re: [PATCH 0/3] Fixes and updates to amd-sfh
In-Reply-To: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2405071519040.16865@cbobk.fhfr.pm>
References: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 May 2024, Basavaraj Natikar wrote:

> This patch series include changes for:
> - Modify and log errors based on functionality.
> - Handle "no sensors" exists in PM operations.
> - Use amd_get_c2p_val() to read the C2P register for compatibility.
> 
> Basavaraj Natikar (3):
>   HID: amd_sfh: Modify and log error only if case of functionality
>     failures
>   HID: amd_sfh: Handle "no sensors" in PM operations
>   HID: amd_sfh: Use amd_get_c2p_val() to read C2P register
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c          |  5 +----
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c   | 17 ++++++++++++++---
>  .../hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c  |  2 +-
>  3 files changed, 16 insertions(+), 8 deletions(-)

Queued for 6.10, thanks.

-- 
Jiri Kosina
SUSE Labs


