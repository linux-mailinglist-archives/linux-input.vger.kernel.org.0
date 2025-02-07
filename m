Return-Path: <linux-input+bounces-9851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D3A2C62B
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 15:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20DF716B7BD
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B1123F28C;
	Fri,  7 Feb 2025 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkbGwmdI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785323F283;
	Fri,  7 Feb 2025 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939754; cv=none; b=aPl1tqBJHa0+pie85kR8yDLZLvi2VDfXT/qgZJkV1tFw4L25QRSQFzh7lpgijzwiptJYgSCHY9LIa1iis6eeFqhPrt5+I2JQnRw95zW50wG1tuusx0M/RFNWTRzyWi3lMQbCugXlVsWjzHzGcf9K5AI5Dg82dBBv1UkN6+R1otY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939754; c=relaxed/simple;
	bh=GgVpNoYWo4l+sArYzDGk9YViRVxrJPBmugNmojWNYtU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L/bCaenyOWmrTUpWH3dR6nEt05c36bOML6j4TmwDNKyadNeichVW7ihZp2gcaAYVJVkIGXt5ga+pIRYUHTjyiakwYP4aJWSFVu10WwDkj5twqhtYDAnXyI+PY3eY8AnjP3iiyZsTSzyylCK1ec6QFG6RiOy8unY6ToyAsLR8LDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkbGwmdI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C179C4CED1;
	Fri,  7 Feb 2025 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738939753;
	bh=GgVpNoYWo4l+sArYzDGk9YViRVxrJPBmugNmojWNYtU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CkbGwmdIWr0s7uIaLsBX4XwKQhwoPO15TnLbVBgiLDDHZyMmiqLlBjqEmUQc0rXkj
	 0CD7sU+038ALBEpFO3sfI7L+9DRC+EPMMVXMDEEF9L5dOOE2IdfzKZ+Drk55EgUoTi
	 wSx43xtRBA+p9oX/IVhf3sJvMGzmH4jKI0YJPMRR4nCgnsZGjvJqkfs5kEoPBQpOrh
	 9Rl9a3Gelxfg9NZiqLMMgE3su+x8btkar7VP71HKYTlqoBVcrauXrKhN5a5V/ySEns
	 OlfjxXrsawAESfcLSMvIDXcuSTTW9mGfVAdI8kGoJNJkHf3P5FR0S4/uyia8r36enq
	 X8NTjif5PkMIQ==
Date: Fri, 7 Feb 2025 15:49:10 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
cc: Peter Hutterer <peter.hutterer@who-t.net>, linux-kernel@vger.kernel.org, 
    linux-input@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>, 
    Aki Van Ness <aki@lethalbit.net>
Subject: Re: [PATCH 0/7] HID: bpf: sync with udev-hid-bpf
In-Reply-To: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
Message-ID: <ns867291-64o8-p028-qs42-2377s21016q7@xreary.bet>
References: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Feb 2025, Benjamin Tissoires wrote:

> Here are a few hid-bpf device fixes from udev-hid-bpf.
> We've got the usual XP-Pen and Huion plus one from TUXEDO.
> 
> Cheers,
> Benjamin
> 
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

FWIW

	Acked-by: Jiri Kosina <jkosina@suse.com>

for the series, thanks.

-- 
Jiri Kosina
SUSE Labs


