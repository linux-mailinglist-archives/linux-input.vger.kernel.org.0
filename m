Return-Path: <linux-input+bounces-16177-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C7AC6ACAF
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9FF084F5DE8
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 16:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC613570AB;
	Tue, 18 Nov 2025 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myIPbHX6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A028F5;
	Tue, 18 Nov 2025 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484902; cv=none; b=XGtR2DSrzOoqp77i+1e9JBWq4Q0THfzLng5lsaw1lilbT8s5gndd9xU34BJ33RxX9e5lf5iwwJHCktHWw4Cm2BhqyyrBbddR9ruLUwhMxBnHZOG76Yl2TVBaWqcKWGVjiGV0fdMvNxvn1RwQzPI/wcksXB2LD5kgmmVLYsVs5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484902; c=relaxed/simple;
	bh=UtVd2Xx3sdVgn7dsiDRVs+v7yfUxcdzflqCy/X/srFA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fCYZirFlYxcGh/JrG5+mbRnAbuntWT5QC6h7l7xslvkfGBifzUFcYnANZLWne+jCbYKQUYRuLTgq6IgZgH7zR82kQ3lA/hgsgsW59ipJfJx9CsQG+DKpkARyeJB09NSSV1HgALG7s4hKfpRCA68VWaNyICOClubYt40M8ES9wSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myIPbHX6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7F6C2BCB3;
	Tue, 18 Nov 2025 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763484901;
	bh=UtVd2Xx3sdVgn7dsiDRVs+v7yfUxcdzflqCy/X/srFA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=myIPbHX6q4QRcoLTNIFxp42dJVr1E5Neb0KpgmjagDXwiswTWvN1oO0Ca5lHcPMt+
	 Wh9sxdZZRAi11MaF7CGb4gh7pJzp7E33wYYGOdL4HLELfUWztPt3Lq6gDj8cBJjKys
	 ZWRTnHYFMAMgtCPqKVL+RfsRYQufnjiangizdt1mo7WkEbNmwKCB6RSf2e9b5MOx/u
	 PHB+T5hDWumn78kYp8C5Yvn2OSjmPc+QqtrAeJ8VyXRCHjlhu2sRuYc+Z+b4sZFl8l
	 VuROxN2IhxzYoDU52GUT7BF2vLt5OYCSBA5QserNEpm2x+LyJChACVd6yV8qGnktA7
	 ekRdg/ngkkczQ==
Date: Tue, 18 Nov 2025 17:54:58 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Naoki Ueki <naoki25519@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: elecom: Add support for ELECOM M-XT3URBK (018F)
In-Reply-To: <20251103121646.202256-1-naoki25519@gmail.com>
Message-ID: <r2qqr2ro-46q1-4ppq-p8o7-s29733n60n7p@xreary.bet>
References: <20251103121646.202256-1-naoki25519@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Nov 2025, Naoki Ueki wrote:

> The ELECOM M-XT3URBK trackball has an additional device ID (0x018F), which
> shares the same report descriptor as the existing device (0x00FB). However,
> the driver does not currently recognize this new ID, resulting in only five
> buttons being functional.
> 
> This patch adds the new device ID so that all six buttons work properly.
> 
> Signed-off-by: Naoki Ueki <naoki25519@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


