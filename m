Return-Path: <linux-input+bounces-15467-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A637BD897F
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23438542CB7
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F291B273D68;
	Tue, 14 Oct 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnbgngZc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B62E2EF8
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435459; cv=none; b=BxsyOkqZXZiQfdu0as+zRCD2H4FRmagFdq5XWkXyGiJ+bBUBmJZ4mcnic6J+yBnrx+cTlUUaRSWbnfjd56yYwygvfWjWF1krZcxoJ8eUpu5XFC2NqAHQL6n0HGmh5QjpAjOQmtdg2C7TU0wiCGN3iROilBengyAznS9vo2pfFiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435459; c=relaxed/simple;
	bh=jIxhZDJk1JwxMpXtD2hrWlJDIie5+GfPOzKLNgGe6M0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aOfmsP4Nf0Og67nOCkocRKsKJpJHMGYIHGpoJztZsflqAN7lrgevQ/U1iCjJ5Z0FtuAwTJGSR8PjIeKdpIX0ovOgEyYHl5uRtqtSQ0v0kRRM/GehAslCvEqIbjF5qhIBuefHbhmFzPkTY0KdNKdd/zQZ4vNjfXTHIg/abc+HNXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnbgngZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0924BC4CEE7;
	Tue, 14 Oct 2025 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435459;
	bh=jIxhZDJk1JwxMpXtD2hrWlJDIie5+GfPOzKLNgGe6M0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HnbgngZc65nas4aqYk7W/5g1ImgVXMrAmfa5ERV0ZKYLiQ1+sc1Bl4Jp7MaTNsh7V
	 bA+LKWljFTVPf01bheDtGOixphi2TcRzZPgci1+Kqq4YQmfawBLF319K7siuWTJf/B
	 s3dR5T3ND+MbCbH7qgDWuIcEbnxm+WguazyFZD67wIRWwBvKhbqn1yGnDD/0eeTf84
	 JJoMhjceiw9whaITlt8u6GEUd/TzmCT7MoSZl/lDXyg/IS2TRjniScL5v8KlRnKi5o
	 lTPgRcN6vg+qzzQwccnhEyLjdiiKlIbAhb9ex6XrjmK+T2ePyGazyh1xFpZqV5PVwM
	 kiz9APNoNBAYQ==
Date: Tue, 14 Oct 2025 11:50:56 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Hans de Goede <hansg@kernel.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: hid-lg-g15: Add hw_brightness_changed support for
 the G510 keyboard
In-Reply-To: <20251001211941.4415-1-hansg@kernel.org>
Message-ID: <180s1spr-6207-p893-0r1s-p505os706973@xreary.bet>
References: <20251001211941.4415-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Oct 2025, Hans de Goede wrote:

> Add hw_brightness_changed support for the G510 keyboard, so that e.g.
> GNOME will show an OSD notification when toggling the backlight on/off
> with the button the keyboard.
> 
> Note that it is not possible to turn the backlight back on by writing
> /sys/class/leds/.../brightness it can only be turned on by pressing
> the button on the keyboard. To reflect this /sys/class/leds/.../brightness
> will always report the last brightness value independent of the on/off
> toggle built into the keyboard.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Applied on top of hid.git#for-6.19/logitech, thanks.

-- 
Jiri Kosina
SUSE Labs


